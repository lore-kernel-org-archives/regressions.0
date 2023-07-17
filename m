Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12462253CA
	for <regressions@lists.linux.dev>; Mon, 17 Jul 2023 15:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28395C433C8;
	Mon, 17 Jul 2023 15:36:25 +0000 (UTC)
Date: Mon, 17 Jul 2023 11:36:23 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: <kkabe@vega.pgw.jp>
Cc: regressions@lists.linux.dev, bagasdotme@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: radeon.ko/i586: BUG: kernel NULL pointer dereference,
 address:00000004
Message-ID: <20230717113623.41878887@gandalf.local.home>
In-Reply-To: <230714143404.M0123570@vega.pgw.jp>
References: <55a3bbb1-5b3c-f454-b529-8ee9944cc67c@leemhuis.info>
	<230714143404.M0123570@vega.pgw.jp>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Jul 2023 14:34:04 +0900
<kkabe@vega.pgw.jp> wrote:

> Patch in
> https://bugzilla.kernel.org/show_bug.cgi?id=217669#c4
> fixed the problem in freedesktop.org kernel 5.18.0-rc2 .
> This may explain that in kernel.org tree, the said commit is in kernel-5.19.

You mean the patch that adds:

	#if defined(FTRACE_MCOUNT_MAX_OFFSET) && (FTRACE_MCOUNT_MAX_OFFSET)

?

Nothing should be setting FTRACE_MCOUNT_MAX_OFFSET to anything but non
zero. But doing a grep, I now see:

# define FTRACE_MCOUNT_MAX_OFFSET ENDBR_INSN_SIZE

Where it breaks that assumption if ENDBR_INSN_SIZE == 0 :-p
 (and that's my code!)

OK, does this fix it? (I haven't tested nor compiled this)

-- Steve

diff --git a/arch/x86/include/asm/ftrace.h b/arch/x86/include/asm/ftrace.h
index 897cf02c20b1..801f4414da3e 100644
--- a/arch/x86/include/asm/ftrace.h
+++ b/arch/x86/include/asm/ftrace.h
@@ -13,7 +13,7 @@
 #ifdef CONFIG_HAVE_FENTRY
 # include <asm/ibt.h>
 /* Add offset for endbr64 if IBT enabled */
-# define FTRACE_MCOUNT_MAX_OFFSET	ENDBR_INSN_SIZE
+# define FTRACE_MCOUNT_MAX_OFFSET	(ENDBR_INSN_SIZE + MCOUNT_INSN_SIZE)
 #endif
 
 #ifdef CONFIG_DYNAMIC_FTRACE
