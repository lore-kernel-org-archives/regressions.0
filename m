Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5922F29
	for <regressions@lists.linux.dev>; Tue, 14 Mar 2023 10:17:15 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pc1iQ-0006QZ-LS; Tue, 14 Mar 2023 11:17:10 +0100
Message-ID: <7f90d893-c6ac-1fc9-3804-daa77b9f43fd@leemhuis.info>
Date: Tue, 14 Mar 2023 11:17:10 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Bug 216646] having TRANSPARENT_HUGEPAGE enabled hangs some
 applications (supervisor read access in kernel mode)
Content-Language: en-US, de-DE
To: Matthew Wilcox <willy@infradead.org>
Cc: bugzilla-daemon@kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, decedion@gmail.com,
 Mikhail Pletenv <mmp.dux@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <bug-216646-27@https.bugzilla.kernel.org/>
 <bug-216646-27-o4jKola2S5@https.bugzilla.kernel.org/>
 <20221121125400.334190a6d2791b0c9afbfea0@linux-foundation.org>
 <220fd094-7cf1-9d17-8380-98d5663dc5da@leemhuis.info>
 <Y4ouwhqSyDV7I+D9@casper.infradead.org>
 <Y4p0tbbbQ5JkyZs5@casper.infradead.org>
 <20221203014420.76281b930dbc64f51eda0f8b@gmail.com>
 <Y45Tp1Br2Em8e3Fr@casper.infradead.org>
 <20221206050845.6ba9351cef3295be4b923ea8@gmail.com>
 <69b81148-8e62-d697-e92b-c3b042214a09@leemhuis.info>
 <e9528025-afcc-bde0-dba4-24d2074ad52d@leemhuis.info>
 <edd93326-513b-71d4-82eb-aabdfa9e3c90@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <edd93326-513b-71d4-82eb-aabdfa9e3c90@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1678789035;4de729ad;
X-HE-SMSGID: 1pc1iQ-0006QZ-LS

On 24.02.23 19:08, Mikhail Pletenv wrote:
> I did some more testing on v6.1.12 and reproduced the issue. But i have
> new bit of information: since the last time i've seen this issue i've
> migrated most of my storage from XFS to BTRFS and i couldn't reproduce
> the issue again today until i switched the source volume in the test
> back to XFS. So it seems bug is either in the way that XFS talks to
> mm/folios or is just triggered by it.
> 
> anyway, i attached a report from v6.1.2 (seems to be happening in the
> same place)

Hi Willy! I'd like to bring this back onto your radar, as this
regression is still unsolved afaics -- the patch you provided only
partally helped. Or was progress to fix this made in a different thread
and I just missed it?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

> On 2/24/23 13:21, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 16.12.22 06:23, Thorsten Leemhuis wrote:
>>> Hi, this is your Linux kernel regression tracker. Top-posting for once,
>>> to make this easily accessible to everyone.
>> /me again
>>
>>> Was some progress made to get this regression resolved? From here it
>>> looks kinda stalled, that's why I'm asking -- but maybe I just missed
>>> something.
>> Did anything happen to get this regression resolved? Doesn't look like
>> it, but maybe I missed some progress.
>>
>> Willy, Mikhail confirmed off-list to me that the problem still exists.
>> He also tried you patch and reported back. Is there something else you
>> need?
>>
>> Side note: I lost this out of sight during the festive season and should
>> have asked this earlier, but better late than never. :-D
>>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>> -- 
>> Everything you wanna know about Linux kernel regression tracking:
>> https://linux-regtracking.leemhuis.info/about/#tldr
>> If I did something stupid, please tell me, as explained on that page.
>>
>> #regzbot poke
>>
>>> On 06.12.22 03:08, Mikhail Pletnev wrote:
>>>> On Mon, 5 Dec 2022 20:25:11 +0000
>>>> Matthew Wilcox <willy@infradead.org> wrote:
>>>>> Thanks!  I think this may be the problem ...
>>>>>
>>>> Hi Matthew, thanks for swift response, i've applied your last patch
>>>> and ran my stress test a couple of times. It's still constistently
>>>> crashing (albeit it seems in a different place):
>>>>
>>>> [ 1975.257126] ***BAD SIBLING*** index 912583 offset 4
>>>> [ 1975.257128] node ffff9fc817e01ff0 offset 51 parent
>>>> ffff9fc5c7a31ff0 shift 0 count 64 values 48 array ffff9fc521173e80
>>>> list ffff9fc817e02008 ffff9fc817e02008 marks 0 0 0
>>>> [ 1975.257133] BUG: kernel NULL pointer dereference, address:
>>>> 0000000000000036
>>>> [ 1975.257135] #PF: supervisor read access in kernel mode
>>>> [ 1975.257137] #PF: error_code(0x0000) - not-present page
>>>> [ 1975.257138] PGD 0 P4D 0
>>>> [ 1975.257139] Oops: 0000 [#1] PREEMPT SMP NOPTI
>>>> [ 1975.257141] CPU: 5 PID: 8303 Comm: deluge-gtk Not tainted
>>>> 5.17.0-rc4_ap_test-00163-g793917d997df-dirty #6
>>>> [ 1975.257144] Hardware name: Micro-Star International Co., Ltd.
>>>> MS-7C35/MEG X570 UNIFY (MS-7C35), BIOS A.C3 03/15/2022
>>>> [ 1975.257146] RIP: 0010:__filemap_get_folio
>>>> (/home/reinhardt/dev-apps/kernel/linux/./arch/x86/include/asm/atomic.h:29 /home/reinhardt/dev-apps/kernel/linux/./include/linux/atomic/atomic-arch-fallback.h:1158 /home/reinhardt/dev-apps/kernel/linux/./include/linux/atomic/atomic-arch-fallback.h:1183 /home/reinhardt/dev-apps/kernel/linux/./include/linux/atomic/atomic-instrumented.h:608 /home/reinhardt/dev-apps/kernel/linux/./include/linux/page_ref.h:238 /home/reinhardt/dev-apps/kernel/linux/./include/linux/page_ref.h:247 /home/reinhardt/dev-apps/kernel/linux/./include/linux/page_ref.h:280 /home/reinhardt/dev-apps/kernel/linux/./include/linux/page_ref.h:313 /home/reinhardt/dev-apps/kernel/linux/mm/filemap.c:1899 /home/reinhardt/dev-apps/kernel/linux/mm/filemap.c:1951)
>>>> [ 1975.257152] Code: 10 e8 56 fd 67 00 48 89 c3 48 3d 02 04 00 00 74
>>>> e2 48 3d 06 04 00 00 74 da 48 85 c0 0f 84 3e 02 00 00 a8 01 0f 85 40
>>>> 02 00 00 <8b> 40 34 85 c0 74 c2 8d 50 01 f0 0f b1 53 34 75 f2 48 8b
>>>> 54 24 28
>>>> All code
>>>> ========
>>>>     0:    10 e8                    adc    %ch,%al
>>>>     2:    56                       push   %rsi
>>>>     3:    fd                       std
>>>>     4:    67 00 48 89              add    %cl,-0x77(%eax)
>>>>     8:    c3                       ret
>>>>     9:    48 3d 02 04 00 00        cmp    $0x402,%rax
>>>>     f:    74 e2                    je     0xfffffffffffffff3
>>>>    11:    48 3d 06 04 00 00        cmp    $0x406,%rax
>>>>    17:    74 da                    je     0xfffffffffffffff3
>>>>    19:    48 85 c0                 test   %rax,%rax
>>>>    1c:    0f 84 3e 02 00 00        je     0x260
>>>>    22:    a8 01                    test   $0x1,%al
>>>>    24:    0f 85 40 02 00 00        jne    0x26a
>>>>    2a:*    8b 40 34                 mov    0x34(%rax),%eax       
>>>> <-- trapping instruction
>>>>    2d:    85 c0                    test   %eax,%eax
>>>>    2f:    74 c2                    je     0xfffffffffffffff3
>>>>    31:    8d 50 01                 lea    0x1(%rax),%edx
>>>>    34:    f0 0f b1 53 34           lock cmpxchg %edx,0x34(%rbx)
>>>>    39:    75 f2                    jne    0x2d
>>>>    3b:    48 8b 54 24 28           mov    0x28(%rsp),%rdx
>>>>
>>>> Code starting with the faulting instruction
>>>> ===========================================
>>>>     0:    8b 40 34                 mov    0x34(%rax),%eax
>>>>     3:    85 c0                    test   %eax,%eax
>>>>     5:    74 c2                    je     0xffffffffffffffc9
>>>>     7:    8d 50 01                 lea    0x1(%rax),%edx
>>>>     a:    f0 0f b1 53 34           lock cmpxchg %edx,0x34(%rbx)
>>>>     f:    75 f2                    jne    0x3
>>>>    11:    48 8b 54 24 28           mov    0x28(%rsp),%rdx
>>>> [ 1975.257154] RSP: 0000:ffffc2d744c37cb0 EFLAGS: 00010246
>>>> [ 1975.257155] RAX: 0000000000000002 RBX: 0000000000000002 RCX:
>>>> 0000000000000000
>>>> [ 1975.257156] RDX: 0000000000000000 RSI: ffffffffbb117459 RDI:
>>>> 00000000ffffffff
>>>> [ 1975.257157] RBP: 0000000000000000 R08: 00000000ffffdfff R09:
>>>> 00000000ffffdfff
>>>> [ 1975.257158] R10: ffffffffbb472dc0 R11: ffffffffbb472dc0 R12:
>>>> 0000000000000000
>>>> [ 1975.257159] R13: ffff9fc521173e78 R14: 00000000000decc7 R15:
>>>> fff000003fffffff
>>>> [ 1975.257160] FS:  00007fb2137fe6c0(0000) GS:ffff9fcb7eb40000(0000)
>>>> knlGS:0000000000000000
>>>> [ 1975.257161] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> [ 1975.257162] CR2: 0000000000000036 CR3: 0000000164114000 CR4:
>>>> 0000000000750ee0
>>>> [ 1975.257163] PKRU: 55555554
>>>> [ 1975.257163] Call Trace:
>>>> [ 1975.257164]  <TASK>
>>>> [ 1975.257166] ? page_add_file_rmap
>>>> (/home/reinhardt/dev-apps/kernel/linux/./include/linux/page-flags.h:195 /home/reinhardt/dev-apps/kernel/linux/mm/internal.h:440 /home/reinhardt/dev-apps/kernel/linux/mm/rmap.c:1270)
>>>> [ 1975.257169] filemap_fault
>>>> (/home/reinhardt/dev-apps/kernel/linux/./include/linux/pagemap.h:531
>>>> /home/reinhardt/dev-apps/kernel/linux/mm/filemap.c:3107)
>>>> [ 1975.257172] __do_fault
>>>> (/home/reinhardt/dev-apps/kernel/linux/mm/memory.c:3852)
>>>> [ 1975.257174] __handle_mm_fault
>>>> (/home/reinhardt/dev-apps/kernel/linux/mm/memory.c:4169
>>>> /home/reinhardt/dev-apps/kernel/linux/mm/memory.c:4297
>>>> /home/reinhardt/dev-apps/kernel/linux/mm/memory.c:4555
>>>> /home/reinhardt/dev-apps/kernel/linux/mm/memory.c:4690)
>>>> [ 1975.257176] handle_mm_fault
>>>> (/home/reinhardt/dev-apps/kernel/linux/mm/memory.c:4788)
>>>> [ 1975.257178] do_user_addr_fault
>>>> (/home/reinhardt/dev-apps/kernel/linux/./include/linux/sched/signal.h:404 /home/reinhardt/dev-apps/kernel/linux/arch/x86/mm/fault.c:1399)
>>>> [ 1975.257181] exc_page_fault
>>>> (/home/reinhardt/dev-apps/kernel/linux/./arch/x86/include/asm/irqflags.h:40 /home/reinhardt/dev-apps/kernel/linux/./arch/x86/include/asm/irqflags.h:75 /home/reinhardt/dev-apps/kernel/linux/arch/x86/mm/fault.c:1492 /home/reinhardt/dev-apps/kernel/linux/arch/x86/mm/fault.c:1540)
>>>> [ 1975.257184] ? asm_exc_page_fault
>>>> (/home/reinhardt/dev-apps/kernel/linux/./arch/x86/include/asm/idtentry.h:568)
>>>> [ 1975.257186] asm_exc_page_fault
>>>> (/home/reinhardt/dev-apps/kernel/linux/./arch/x86/include/asm/idtentry.h:568)
>>>> [ 1975.257188] RIP: 0033:0x7fb265b88409
>>>> [ 1975.257189] Code: 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 2e 0f 1f
>>>> 84 00 00 00 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 83 fa
>>>> 20 72 27 <c5> fe 6f 06 48 83 fa 40 0f 87 a9 00 00 00 c5 fe 6f 4c 16
>>>> e0 c5 fe
>>>> All code
>>>> ========
>>>>     0:    66 66 2e 0f 1f 84 00     data16 cs nopw 0x0(%rax,%rax,1)
>>>>     7:    00 00 00 00
>>>>     b:    66 66 2e 0f 1f 84 00     data16 cs nopw 0x0(%rax,%rax,1)
>>>>    12:    00 00 00 00
>>>>    16:    66 66 2e 0f 1f 84 00     data16 cs nopw 0x0(%rax,%rax,1)
>>>>    1d:    00 00 00 00
>>>>    21:    48 89 f8                 mov    %rdi,%rax
>>>>    24:    48 83 fa 20              cmp    $0x20,%rdx
>>>>    28:    72 27                    jb     0x51
>>>>    2a:*    c5 fe 6f 06              vmovdqu (%rsi),%ymm0        <--
>>>> trapping instruction
>>>>    2e:    48 83 fa 40              cmp    $0x40,%rdx
>>>>    32:    0f 87 a9 00 00 00        ja     0xe1
>>>>    38:    c5 fe 6f 4c 16 e0        vmovdqu -0x20(%rsi,%rdx,1),%ymm1
>>>>    3e:    c5                       .byte 0xc5
>>>>    3f:    fe                       .byte 0xfe
>>>>
>>>> Code starting with the faulting instruction
>>>> ===========================================
>>>>     0:    c5 fe 6f 06              vmovdqu (%rsi),%ymm0
>>>>     4:    48 83 fa 40              cmp    $0x40,%rdx
>>>>     8:    0f 87 a9 00 00 00        ja     0xb7
>>>>     e:    c5 fe 6f 4c 16 e0        vmovdqu -0x20(%rsi,%rdx,1),%ymm1
>>>>    14:    c5                       .byte 0xc5
>>>>    15:    fe                       .byte 0xfe
>>>> [ 1975.257190] RSP: 002b:00007fb2137fd908 EFLAGS: 00010202
>>>> [ 1975.257191] RAX: 00007fb204012a80 RBX: 0000000000000000 RCX:
>>>> 00007fb2137fda90
>>>> [ 1975.257192] RDX: 0000000000004000 RSI: 00007f9fddbb51c3 RDI:
>>>> 00007fb204012a80
>>>> [ 1975.257193] RBP: 00007fb2137fd928 R08: 00000000638ea1ab R09:
>>>> 0000000000000000
>>>> [ 1975.257193] R10: 0000000000000008 R11: 0000000000000246 R12:
>>>> 00007fb204000bb0
>>>> [ 1975.257194] R13: 00007fb21809a5a0 R14: 00000000decc71c3 R15:
>>>> 0000000000004000
>>>> [ 1975.257196]  </TASK>
>>>> [ 1975.257196] Modules linked in: overlay xt_addrtype amdgpu
>>>> drm_ttm_helper ttm gpu_sched drm_kms_helper iwlmvm backlight
>>>> syscopyarea mac80211 sysfillrect sysimgblt libarc4 fb_sys_fops
>>>> iwlwifi cfg80211 i2c_piix4 k10temp fuse configfs efivarfs
>>>> [ 1975.257207] CR2: 0000000000000036
>>>> [ 1975.257208] ---[ end trace 0000000000000000 ]---
>>>> [ 1975.257209] RIP: 0010:__filemap_get_folio
>>>> (/home/reinhardt/dev-apps/kernel/linux/./arch/x86/include/asm/atomic.h:29 /home/reinhardt/dev-apps/kernel/linux/./include/linux/atomic/atomic-arch-fallback.h:1158 /home/reinhardt/dev-apps/kernel/linux/./include/linux/atomic/atomic-arch-fallback.h:1183 /home/reinhardt/dev-apps/kernel/linux/./include/linux/atomic/atomic-instrumented.h:608 /home/reinhardt/dev-apps/kernel/linux/./include/linux/page_ref.h:238 /home/reinhardt/dev-apps/kernel/linux/./include/linux/page_ref.h:247 /home/reinhardt/dev-apps/kernel/linux/./include/linux/page_ref.h:280 /home/reinhardt/dev-apps/kernel/linux/./include/linux/page_ref.h:313 /home/reinhardt/dev-apps/kernel/linux/mm/filemap.c:1899 /home/reinhardt/dev-apps/kernel/linux/mm/filemap.c:1951)
>>>> [ 1975.257211] Code: 10 e8 56 fd 67 00 48 89 c3 48 3d 02 04 00 00 74
>>>> e2 48 3d 06 04 00 00 74 da 48 85 c0 0f 84 3e 02 00 00 a8 01 0f 85 40
>>>> 02 00 00 <8b> 40 34 85 c0 74 c2 8d 50 01 f0 0f b1 53 34 75 f2 48 8b
>>>> 54 24 28
>>>> All code
>>>> ========
>>>>     0:    10 e8                    adc    %ch,%al
>>>>     2:    56                       push   %rsi
>>>>     3:    fd                       std
>>>>     4:    67 00 48 89              add    %cl,-0x77(%eax)
>>>>     8:    c3                       ret
>>>>     9:    48 3d 02 04 00 00        cmp    $0x402,%rax
>>>>     f:    74 e2                    je     0xfffffffffffffff3
>>>>    11:    48 3d 06 04 00 00        cmp    $0x406,%rax
>>>>    17:    74 da                    je     0xfffffffffffffff3
>>>>    19:    48 85 c0                 test   %rax,%rax
>>>>    1c:    0f 84 3e 02 00 00        je     0x260
>>>>    22:    a8 01                    test   $0x1,%al
>>>>    24:    0f 85 40 02 00 00        jne    0x26a
>>>>    2a:*    8b 40 34                 mov    0x34(%rax),%eax       
>>>> <-- trapping instruction
>>>>    2d:    85 c0                    test   %eax,%eax
>>>>    2f:    74 c2                    je     0xfffffffffffffff3
>>>>    31:    8d 50 01                 lea    0x1(%rax),%edx
>>>>    34:    f0 0f b1 53 34           lock cmpxchg %edx,0x34(%rbx)
>>>>    39:    75 f2                    jne    0x2d
>>>>    3b:    48 8b 54 24 28           mov    0x28(%rsp),%rdx
>>>>
>>>> Code starting with the faulting instruction
>>>> ===========================================
>>>>     0:    8b 40 34                 mov    0x34(%rax),%eax
>>>>     3:    85 c0                    test   %eax,%eax
>>>>     5:    74 c2                    je     0xffffffffffffffc9
>>>>     7:    8d 50 01                 lea    0x1(%rax),%edx
>>>>     a:    f0 0f b1 53 34           lock cmpxchg %edx,0x34(%rbx)
>>>>     f:    75 f2                    jne    0x3
>>>>    11:    48 8b 54 24 28           mov    0x28(%rsp),%rdx
>>>> [ 1975.257212] RSP: 0000:ffffc2d744c37cb0 EFLAGS: 00010246
>>>> [ 1975.257213] RAX: 0000000000000002 RBX: 0000000000000002 RCX:
>>>> 0000000000000000
>>>> [ 1975.257214] RDX: 0000000000000000 RSI: ffffffffbb117459 RDI:
>>>> 00000000ffffffff
>>>> [ 1975.257215] RBP: 0000000000000000 R08: 00000000ffffdfff R09:
>>>> 00000000ffffdfff
>>>> [ 1975.257215] R10: ffffffffbb472dc0 R11: ffffffffbb472dc0 R12:
>>>> 0000000000000000
>>>> [ 1975.257216] R13: ffff9fc521173e78 R14: 00000000000decc7 R15:
>>>> fff000003fffffff
>>>> [ 1975.257217] FS:  00007fb2137fe6c0(0000) GS:ffff9fcb7eb40000(0000)
>>>> knlGS:0000000000000000
>>>> [ 1975.257218] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> [ 1975.257219] CR2: 0000000000000036 CR3: 0000000164114000 CR4:
>>>> 0000000000750ee0
>>>> [ 1975.257220] PKRU: 55555554
>>>>
>>>> (full dmesg and my local changeset in attachments for your reference)
>>>>
>>> #regzbot poke
>>>
