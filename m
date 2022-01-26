Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA86C2CA3
	for <regressions@lists.linux.dev>; Wed, 26 Jan 2022 07:39:52 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nCcuF-000692-A8; Wed, 26 Jan 2022 08:39:51 +0100
Message-ID: <80bed7f8-525e-9324-b544-f5f5da8ef2e7@leemhuis.info>
Date: Wed, 26 Jan 2022 08:39:51 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Unable to set $xmm2-9 registers but able to set $xmm0-1,10-15 with
 ptrace syscall (fwd from bugzilla)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1643182793;9277843f;
X-HE-SMSGID: 1nCcuF-000692-A8

Hi, this is your Linux kernel regression tracker speaking.

There is a regression dealt with in bugzilla I'd like to add to the
tracking:

#regzbot introduced: 6164331d15f7d912fb9369245368e9564ea49813
#regzbot from: Luís Ferreira <contact@lsferreira.net>
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215524

Quote:

> Writing some XMM registers on a process with `ptrace` syscall with `PTRACE_SETREGSET` request and using `NT_FPREGSET` is broken. Although, when using `NT_X86_XSTATE` works just fine. Also, getting the registers with `PTRACE_GETREGSET` is fine too.
> 
> This can be considered a blocker for old hardware that lacks AVX extensions and simply fail to call ptrace with `NT_X86_XSTATE`. This particularly failed the testsuite of LLDB on my server.
> 
> I've tested this on Linux 5.16.2, Linux LTS 5.15.16 and Linux LTS 5.10.93. Only the last one (5.10.93) succeeded with `NT_FPREGSET`. I tested this in a clean installation of Arch Linux with the official packages and backported version of Linux LTS, available in AUR repository.
> 
> Note: I didn't test `NT_FPREGSET` on recent hardware (hardware with AVX).
> 
> From my investigation on the issue and the kernel source code inspection, I believe that this was introduced here: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/x86/kernel/fpu/regset.c?id=6164331d15f7d912fb9369245368e9564ea49813
> 
> I'm going to leave a reference to some issues/patches on GDB and LLDB debuggers to either reproduce the issue and see some logs I created with strace:
> - https://reviews.llvm.org/D117928
> - https://sourceware.org/bugzilla/show_bug.cgi?id=28803

Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat)

P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
on my table. I can only look briefly into most of them. Unfortunately
therefore I sometimes will get things wrong or miss something important.
I hope that's not the case here; if you think it is, don't hesitate to
tell me about it in a public reply, that's in everyone's interest.

BTW, I have no personal interest in this issue, which is tracked using
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
this mail to get things rolling again and hence don't need to be CC on
all further activities wrt to this regression.

---
Additional information about regzbot:

If you want to know more about regzbot, check out its web-interface, the
getting start guide, and/or the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

The last two documents will explain how you can interact with regzbot
yourself if your want to.

Hint for reporters: when reporting a regression it's in your interest to
tell #regzbot about it in the report, as that will ensure the regression
gets on the radar of regzbot and the regression tracker. That's in your
interest, as they will make sure the report won't fall through the
cracks unnoticed.

Hint for developers: you normally don't need to care about regzbot once
it's involved. Fix the issue as you normally would, just remember to
include a 'Link:' tag to the report in the commit message, as explained
in Documentation/process/submitting-patches.rst
That aspect was recently was made more explicit in commit 1f57bd42b77c:
https://git.kernel.org/linus/1f57bd42b77c
