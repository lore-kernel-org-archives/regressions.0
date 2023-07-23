Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB221378
	for <regressions@lists.linux.dev>; Sun, 23 Jul 2023 13:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ADB4C433C7;
	Sun, 23 Jul 2023 13:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690120696;
	bh=tazMAUnh3cxBlPJcVG1Fg1pNoEECO0B1DOt0PG5p8nU=;
	h=Subject:To:Cc:From:Date:From;
	b=BfBqSnPw4Os8M4F92Qc27/D3a0k3bBUTgv+otu7uidMO5M/VN1tvSvtqTI4FpPyPu
	 jYhbYYwicU5Yq6g1Wt8GH0Q3j2Ft77IlnODEkUVlRXgato4lhbUjiy8GuejHiufIq1
	 M4ZFnAT7cMfOtUdvx+umfa7gBckLsKacwNBzxvnU=
Subject: Patch "perf probe: Read DWARF files from the correct CU" has been added to the 6.4-stable tree
To: acme@redhat.com,adrian.hunter@intel.com,alexander.shishkin@linux.intel.com,georgmueller@gmx.net,gregkh@linuxfoundation.org,irogers@google.com,jolsa@kernel.org,mark.rutland@arm.com,mhiramat@kernel.org,mingo@redhat.com,namhyung@kernel.org,peterz@infradead.org,regressions@lists.linux.dev
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 23 Jul 2023 15:57:32 +0200
Message-ID: <2023072332-greeter-snide-a53e@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    perf probe: Read DWARF files from the correct CU

to the 6.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     perf-probe-read-dwarf-files-from-the-correct-cu.patch
and it can be found in the queue-6.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From c66e1c68c13b872505f25ab641c44b77313ee7fe Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Georg=20M=C3=BCller?= <georgmueller@gmx.net>
Date: Wed, 28 Jun 2023 10:45:51 +0200
Subject: perf probe: Read DWARF files from the correct CU
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Georg Müller <georgmueller@gmx.net>

commit c66e1c68c13b872505f25ab641c44b77313ee7fe upstream.

After switching from dwarf_decl_file() to die_get_decl_file(), it is not
possible to add probes for certain functions:

  $ perf probe -x /usr/lib/systemd/systemd-logind match_unit_removed
  A function DIE doesn't have decl_line. Maybe broken DWARF?
  A function DIE doesn't have decl_line. Maybe broken DWARF?
  Probe point 'match_unit_removed' not found.
     Error: Failed to add events.

The problem is that die_get_decl_file() uses the wrong CU to search for
the file. elfutils commit e1db5cdc9f has some good explanation for this:

    dwarf_decl_file uses dwarf_attr_integrate to get the DW_AT_decl_file
    attribute. This means the attribute might come from a different DIE
    in a different CU. If so, we need to use the CU associated with the
    attribute, not the original DIE, to resolve the file name.

This patch uses the same source of information as elfutils: use attribute
DW_AT_decl_file and use this CU to search for the file.

Fixes: dc9a5d2ccd5c823c ("perf probe: Fix to get declared file name from clang DWARF5")
Signed-off-by: Georg Müller <georgmueller@gmx.net>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Ian Rogers <irogers@google.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: regressions@lists.linux.dev
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20230628084551.1860532-6-georgmueller@gmx.net
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/perf/util/dwarf-aux.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- a/tools/perf/util/dwarf-aux.c
+++ b/tools/perf/util/dwarf-aux.c
@@ -478,8 +478,10 @@ static const char *die_get_file_name(Dwa
 {
 	Dwarf_Die cu_die;
 	Dwarf_Files *files;
+	Dwarf_Attribute attr_mem;
 
-	if (idx < 0 || !dwarf_diecu(dw_die, &cu_die, NULL, NULL) ||
+	if (idx < 0 || !dwarf_attr_integrate(dw_die, DW_AT_decl_file, &attr_mem) ||
+	    !dwarf_cu_die(attr_mem.cu, &cu_die, NULL, NULL, NULL, NULL, NULL, NULL) ||
 	    dwarf_getsrcfiles(&cu_die, &files, NULL) != 0)
 		return NULL;
 


Patches currently in stable-queue which might be from georgmueller@gmx.net are

queue-6.4/perf-probe-add-test-for-regression-introduced-by-switch-to-die_get_decl_file.patch
queue-6.4/perf-probe-read-dwarf-files-from-the-correct-cu.patch
