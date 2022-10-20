Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81D87E
	for <regressions@lists.linux.dev>; Thu, 20 Oct 2022 10:17:55 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1olScU-0000oP-I8; Thu, 20 Oct 2022 12:17:46 +0200
Message-ID: <e043f8a2-d429-553d-82f7-884998cd7671@leemhuis.info>
Date: Thu, 20 Oct 2022 12:17:44 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: Observed memory leak in hugetlb_reserve_pages #forregzbot
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CAKXUXMxf7OiCwbxib7MwfR4M1b5+b3cNTU7n5NV9Zm4967=FPQ@mail.gmail.com>
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAKXUXMxf7OiCwbxib7MwfR4M1b5+b3cNTU7n5NV9Zm4967=FPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1666261075;695c7771;
X-HE-SMSGID: 1olScU-0000oP-I8

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Hi, this is your Linux kernel regression tracker.

On 17.10.22 13:11, Lukas Bulwahn wrote:
> 
> The reproducer for the 'memory leak in hugetlb_reserve_pages' bug (see
> https://elisa-builder-00.iol.unh.edu/syzkaller-next/report?id=3469603f4a0da86b581cc979bd6c6663b46ceb1b)
> is reproducible, it is triggering the memory leak on the current
> mainline (commit 60bb8154d1d7), and it was not triggering on v6.0. My
> build config is a x86_64 defconfig with some syzkaller-recommended
> debug options.

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced bbff39cc6cbc
#regzbot title mm: Observed memory leak in hugetlb_reserve_pages
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replies to), as explained for
in the Linux kernel's documentation; above webpage explains why this is
important for tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

> I build the kernel with:
> 
> make O=$BUILD defconfig && make O=$BUILD kvm_guest.config && \
> ./scripts/kconfig/merge_config.sh -O $BUILD -r $BUILD/.config
> kernel/configs/syzkaller-recommended.config && \
> make O=$BUILD -j`nproc`
> 
> My syzkaller-recommended.config is:
> 
> CONFIG_KCOV=y
> CONFIG_KCOV_INSTRUMENT_ALL=y
> CONFIG_KCOV_ENABLE_COMPARISONS=y
> CONFIG_DEBUG_FS=y
> CONFIG_DEBUG_KMEMLEAK=y
> CONFIG_DEBUG_INFO=y
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
> CONFIG_KALLSYMS=y
> CONFIG_KALLSYMS_ALL=y
> CONFIG_CONFIGFS_FS=y
> CONFIG_SECURITYFS=y
> # CONFIG_RANDOMIZE_BASE is not set
> CONFIG_KASAN=y
> CONFIG_KASAN_INLINE=y
> CONFIG_FAULT_INJECTION=y
> CONFIG_FAULT_INJECTION_DEBUG_FS=y
> CONFIG_FAULT_INJECTION_USERCOPY=y
> CONFIG_FAILSLAB=y
> CONFIG_FAIL_PAGE_ALLOC=y
> CONFIG_FAIL_MAKE_REQUEST=y
> CONFIG_FAIL_IO_TIMEOUT=y
> CONFIG_FAIL_FUTEX=y
> CONFIG_LOCKDEP=y
> CONFIG_PROVE_LOCKING=y
> CONFIG_DEBUG_ATOMIC_SLEEP=y
> CONFIG_PROVE_RCU=y
> CONFIG_DEBUG_VM=y
> CONFIG_FORTIFY_SOURCE=y
> CONFIG_HARDENED_USERCOPY=y
> CONFIG_LOCKUP_DETECTOR=y
> CONFIG_SOFTLOCKUP_DETECTOR=y
> CONFIG_HARDLOCKUP_DETECTOR=y
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
> CONFIG_DETECT_HUNG_TASK=y
> CONFIG_WQ_WATCHDOG=y
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=140
> CONFIG_RCU_CPU_STALL_TIMEOUT=100
> 
> 
> My git bisection showed that the first bad commit is
> [bbff39cc6cbcb86ccfacb2dcafc79912a9f9df69] hugetlb: allocate vma lock
> for all sharable vmas.
> 
> 
> Full git bisect report:
> 
> git bisect start
> # bad: [60bb8154d1d77042a5d43d335a68fdb202302cbe] Merge tag
> 'xfs-6.1-for-linus' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux
> git bisect bad 60bb8154d1d77042a5d43d335a68fdb202302cbe
> # good: [4fe89d07dcc2804c8b562f6c7896a45643d34b2f] Linux 6.0
> git bisect good 4fe89d07dcc2804c8b562f6c7896a45643d34b2f
> # good: [ff6862c23d2e83d12d1759bf4337d41248fb4dc8] Merge tag
> 'arm-drivers-6.1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> git bisect good ff6862c23d2e83d12d1759bf4337d41248fb4dc8
> # good: [e8bc52cb8df80c31c73c726ab58ea9746e9ff734] Merge tag
> 'driver-core-6.1-rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
> git bisect good e8bc52cb8df80c31c73c726ab58ea9746e9ff734
> # good: [4899a36f91a9f9b06878471096bd143e7253006d] Merge tag
> 'powerpc-6.1-1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
> git bisect good 4899a36f91a9f9b06878471096bd143e7253006d
> # good: [0e0073eb1b60f4ec6faecea034a6772fe1409a88] Merge tag
> 'hyperv-next-signed-20221009' of
> git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux
> git bisect good 0e0073eb1b60f4ec6faecea034a6772fe1409a88
> # good: [2f3568017268fc34eb0b6b4b3163c0f2e619fde6] kasan: move
> kasan_get_*_meta to generic.c
> git bisect good 2f3568017268fc34eb0b6b4b3163c0f2e619fde6
> # good: [a57ae9ef9e1a20b68ae841a8cab7aff3f000ed9d] mm/page_alloc:
> update comments for rmqueue()
> git bisect good a57ae9ef9e1a20b68ae841a8cab7aff3f000ed9d
> # bad: [dc914858561c424978307561492fcf3145b8b525] Merge tag
> 'nfsd-6.1-1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
> git bisect bad dc914858561c424978307561492fcf3145b8b525
> # good: [70442fc54e6889a2a77f0e9554e8188a1557f00e] Merge tag
> 'x86_mm_for_v6.1_rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> git bisect good 70442fc54e6889a2a77f0e9554e8188a1557f00e
> # good: [c91bdc9358992856721ff77887202a7e80b7ab22] mm: memcontrol:
> don't allocate cgroup swap arrays when memcg is disabled
> git bisect good c91bdc9358992856721ff77887202a7e80b7ab22
> # good: [7d37539037c2fca70346fbedc219f655253d5cff] fuse: implement ->tmpfile()
> git bisect good 7d37539037c2fca70346fbedc219f655253d5cff
> # good: [131a79b474e973f023c5c75e2323a940332103be] hugetlb: fix vma
> lock handling during split vma and range unmapping
> git bisect good 131a79b474e973f023c5c75e2323a940332103be
> # bad: [27bc50fc90647bbf7b734c3fc306a5e61350da53] Merge tag
> 'mm-stable-2022-10-08' of
> git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> git bisect bad 27bc50fc90647bbf7b734c3fc306a5e61350da53
> # bad: [bbff39cc6cbcb86ccfacb2dcafc79912a9f9df69] hugetlb: allocate
> vma lock for all sharable vmas
> git bisect bad bbff39cc6cbcb86ccfacb2dcafc79912a9f9df69
> # good: [ecfbd733878da48ed03a5b8a9c301366a03e3cca] hugetlb: take
> hugetlb vma_lock when clearing vma_lock->vma pointer
> git bisect good ecfbd733878da48ed03a5b8a9c301366a03e3cca
> # first bad commit: [bbff39cc6cbcb86ccfacb2dcafc79912a9f9df69]
> hugetlb: allocate vma lock for all sharable vmas
> 
> 
> If there is more information needed, please let me know.
> 
> Best regards,
> 
> Lukas
