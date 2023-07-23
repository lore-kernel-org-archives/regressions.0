Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB92615C8
	for <regressions@lists.linux.dev>; Sun, 23 Jul 2023 13:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53720C433C8;
	Sun, 23 Jul 2023 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690120704;
	bh=CMmvwwO7kVlRtQWmzQmQsCD04mG4Tp8akcbGRPSt4Qo=;
	h=Subject:To:Cc:From:Date:From;
	b=yRcmpSpmNvQd1+nP1XXcJpZuuQ3qw/nXsDgsuYr+A80Ff4RySorTWzr/WNN2WJ3Lh
	 3geEb1LCHHnoK8wMO/Rdd67znRyoz1X86WUF18vsXbj5FzZ47kpyTuTYj3ADsF6mxP
	 l+LTGoWPZWyAyFRYZasH+zx/c9SQFtgZ21v8pdQE=
Subject: Patch "perf probe: Add test for regression introduced by switch to die_get_decl_file()" has been added to the 6.4-stable tree
To: acme@redhat.com,adrian.hunter@intel.com,alexander.shishkin@linux.intel.com,georgmueller@gmx.net,gregkh@linuxfoundation.org,irogers@google.com,jolsa@kernel.org,mark.rutland@arm.com,mhiramat@kernel.org,mingo@redhat.com,namhyung@kernel.org,peterz@infradead.org,regressions@lists.linux.dev
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 23 Jul 2023 15:57:32 +0200
Message-ID: <2023072331-humpback-tiger-8485@gregkh>
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

    perf probe: Add test for regression introduced by switch to die_get_decl_file()

to the 6.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     perf-probe-add-test-for-regression-introduced-by-switch-to-die_get_decl_file.patch
and it can be found in the queue-6.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 56cbeacf143530576905623ac72ae0964f3293a6 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Georg=20M=C3=BCller?= <georgmueller@gmx.net>
Date: Wed, 28 Jun 2023 10:45:50 +0200
Subject: perf probe: Add test for regression introduced by switch to die_get_decl_file()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Georg Müller <georgmueller@gmx.net>

commit 56cbeacf143530576905623ac72ae0964f3293a6 upstream.

This patch adds a test to validate that 'perf probe' works for binaries
where DWARF info is split into multiple CUs

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
Link: https://lore.kernel.org/r/20230628084551.1860532-5-georgmueller@gmx.net
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/perf/tests/shell/test_uprobe_from_different_cu.sh |   77 ++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100755 tools/perf/tests/shell/test_uprobe_from_different_cu.sh

--- /dev/null
+++ b/tools/perf/tests/shell/test_uprobe_from_different_cu.sh
@@ -0,0 +1,77 @@
+#!/bin/bash
+# test perf probe of function from different CU
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+
+temp_dir=$(mktemp -d /tmp/perf-uprobe-different-cu-sh.XXXXXXXXXX)
+
+cleanup()
+{
+	trap - EXIT TERM INT
+	if [[ "${temp_dir}" =~ ^/tmp/perf-uprobe-different-cu-sh.*$ ]]; then
+		echo "--- Cleaning up ---"
+		perf probe -x ${temp_dir}/testfile -d foo
+		rm -f "${temp_dir}/"*
+		rmdir "${temp_dir}"
+	fi
+}
+
+trap_cleanup()
+{
+        cleanup
+        exit 1
+}
+
+trap trap_cleanup EXIT TERM INT
+
+cat > ${temp_dir}/testfile-foo.h << EOF
+struct t
+{
+  int *p;
+  int c;
+};
+
+extern int foo (int i, struct t *t);
+EOF
+
+cat > ${temp_dir}/testfile-foo.c << EOF
+#include "testfile-foo.h"
+
+int
+foo (int i, struct t *t)
+{
+  int j, res = 0;
+  for (j = 0; j < i && j < t->c; j++)
+    res += t->p[j];
+
+  return res;
+}
+EOF
+
+cat > ${temp_dir}/testfile-main.c << EOF
+#include "testfile-foo.h"
+
+static struct t g;
+
+int
+main (int argc, char **argv)
+{
+  int i;
+  int j[argc];
+  g.c = argc;
+  g.p = j;
+  for (i = 0; i < argc; i++)
+    j[i] = (int) argv[i][0];
+  return foo (3, &g);
+}
+EOF
+
+gcc -g -Og -flto -c ${temp_dir}/testfile-foo.c -o ${temp_dir}/testfile-foo.o
+gcc -g -Og -c ${temp_dir}/testfile-main.c -o ${temp_dir}/testfile-main.o
+gcc -g -Og -o ${temp_dir}/testfile ${temp_dir}/testfile-foo.o ${temp_dir}/testfile-main.o
+
+perf probe -x ${temp_dir}/testfile --funcs foo
+perf probe -x ${temp_dir}/testfile foo
+
+cleanup


Patches currently in stable-queue which might be from georgmueller@gmx.net are

queue-6.4/perf-probe-add-test-for-regression-introduced-by-switch-to-die_get_decl_file.patch
queue-6.4/perf-probe-read-dwarf-files-from-the-correct-cu.patch
