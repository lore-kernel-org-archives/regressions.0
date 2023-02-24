Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8170AD4C
	for <regressions@lists.linux.dev>; Fri, 24 Feb 2023 18:08:06 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id i9so202838lfc.6
        for <regressions@lists.linux.dev>; Fri, 24 Feb 2023 10:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFLfBvmPiXc0YLOf1/g3lP1vVzSEJ99GGf6Ms203FQY=;
        b=bPTFwByNzFSanrJI7f1XP0QPEeGqcS67tASka3uwuQvqMovPnroHvNWczTtKe5CkhZ
         2k8d9nRKXsg2jvuN0a2AFv4H7M/LsDLBN/WWIiejpHUVzMk4nTjSZN7kh+FXrHF4Vybs
         mfgIw38naNMIGsj6fOSvMsAySJpY3TdqsdLN9Z68jMOzOIoD8v77HkQ4oy6eIDbqQ+wh
         Zigfuce3WJZzUPkwrFAv2RcyEK5pFSd3t9Qqu6TDTgiP1PHTQ34+YKpXgkLAP6IMRwNH
         A7ejBu5ehSFW9Sdo2ih64acSeraGWuN47HBpvbRX6e+djiiiybjm8APd59rlCwSV/ekI
         8Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rFLfBvmPiXc0YLOf1/g3lP1vVzSEJ99GGf6Ms203FQY=;
        b=q4Gwi8aFZ2/2jRo01AjBkDFFs99HHTjyawsQulriUdv1o+/1CVWkudZAnYU9SCyC0W
         HoA5fjisK4PrbZ0zsxZBiyqfUL7Hwf/5HjpmLWa4jyLqHS/MsRpNkmnapnu8Ubjqsq69
         N8iPvLJunRYr694wpvdEdw1TAvA97TVOpW2cmlB8o/lN4h8NOtzOs/9graXK90VQ+3zR
         QCD/5j/IHAcH1YT52fr19V3EZneGdiwLxWyClzxAkXsVvFyVReGaf+CoBzMSuo9fsPYO
         MqAdBQMQgYb/rFZWhjIA+l9xelCMm0AMrDtRvqBy028zuj2FsC8LFwTeHb7BQKOkbTOZ
         tjug==
X-Gm-Message-State: AO0yUKXMdaLQ5AgBZPX1WC/4u6F6ZTeYeBJv9UNoSy46nki7ZmxkjwkC
	k+n8QqJ3Cb/Zsdnt04YsWq/9n53DJeQ7BA==
X-Google-Smtp-Source: AK7set9Bd1K2OCxfqlXZpavkCxBvWFEQ3j9b7q2PEJBKLHN2mtP8++531ST9P3+FU6vi5PbMYRBOaA==
X-Received: by 2002:ac2:5974:0:b0:4db:25f2:c116 with SMTP id h20-20020ac25974000000b004db25f2c116mr5547887lfp.18.1677262084243;
        Fri, 24 Feb 2023 10:08:04 -0800 (PST)
Received: from ?IPV6:2001:470:27:8a1::2? (tunnel811020-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:8a1::2])
        by smtp.gmail.com with ESMTPSA id x4-20020ac25dc4000000b004d85dab237csm721226lfq.39.2023.02.24.10.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 10:08:03 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------v0I38eSMINc6BvUKbyDmyawn"
Message-ID: <edd93326-513b-71d4-82eb-aabdfa9e3c90@gmail.com>
Date: Fri, 24 Feb 2023 21:08:02 +0300
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
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Matthew Wilcox <willy@infradead.org>
Cc: bugzilla-daemon@kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, decedion@gmail.com
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
From: Mikhail Pletenv <mmp.dux@gmail.com>
In-Reply-To: <e9528025-afcc-bde0-dba4-24d2074ad52d@leemhuis.info>

This is a multi-part message in MIME format.
--------------v0I38eSMINc6BvUKbyDmyawn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I did some more testing on v6.1.12 and reproduced the issue. But i have 
new bit of information: since the last time i've seen this issue i've 
migrated most of my storage from XFS to BTRFS and i couldn't reproduce 
the issue again today until i switched the source volume in the test 
back to XFS. So it seems bug is either in the way that XFS talks to 
mm/folios or is just triggered by it.

anyway, i attached a report from v6.1.2 (seems to be happening in the 
same place)


On 2/24/23 13:21, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 16.12.22 06:23, Thorsten Leemhuis wrote:
>> Hi, this is your Linux kernel regression tracker. Top-posting for once,
>> to make this easily accessible to everyone.
> /me again
>
>> Was some progress made to get this regression resolved? From here it
>> looks kinda stalled, that's why I'm asking -- but maybe I just missed
>> something.
> Did anything happen to get this regression resolved? Doesn't look like
> it, but maybe I missed some progress.
>
> Willy, Mikhail confirmed off-list to me that the problem still exists.
> He also tried you patch and reported back. Is there something else you need?
>
> Side note: I lost this out of sight during the festive season and should
> have asked this earlier, but better late than never. :-D
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot poke
>
>> On 06.12.22 03:08, Mikhail Pletnev wrote:
>>> On Mon, 5 Dec 2022 20:25:11 +0000
>>> Matthew Wilcox <willy@infradead.org> wrote:
>>>> Thanks!  I think this may be the problem ...
>>>>
>>> Hi Matthew, thanks for swift response, i've applied your last patch and ran my stress test a couple of times. It's still constistently crashing (albeit it seems in a different place):
>>>
>>> [ 1975.257126] ***BAD SIBLING*** index 912583 offset 4
>>> [ 1975.257128] node ffff9fc817e01ff0 offset 51 parent ffff9fc5c7a31ff0 shift 0 count 64 values 48 array ffff9fc521173e80 list ffff9fc817e02008 ffff9fc817e02008 marks 0 0 0
>>> [ 1975.257133] BUG: kernel NULL pointer dereference, address: 0000000000000036
>>> [ 1975.257135] #PF: supervisor read access in kernel mode
>>> [ 1975.257137] #PF: error_code(0x0000) - not-present page
>>> [ 1975.257138] PGD 0 P4D 0
>>> [ 1975.257139] Oops: 0000 [#1] PREEMPT SMP NOPTI
>>> [ 1975.257141] CPU: 5 PID: 8303 Comm: deluge-gtk Not tainted 5.17.0-rc4_ap_test-00163-g793917d997df-dirty #6
>>> [ 1975.257144] Hardware name: Micro-Star International Co., Ltd. MS-7C35/MEG X570 UNIFY (MS-7C35), BIOS A.C3 03/15/2022
>>> [ 1975.257146] RIP: 0010:__filemap_get_folio (/home/reinhardt/dev-apps/kernel/linux/./arch/x86/include/asm/atomic.h:29 /home/reinhardt/dev-apps/kernel/linux/./include/linux/atomic/atomic-arch-fallback.h:1158 /home/reinhardt/dev-apps/kernel/linux/./include/linux/atomic/atomic-arch-fallback.h:1183 /home/reinhardt/dev-apps/kernel/linux/./include/linux/atomic/atomic-instrumented.h:608 /home/reinhardt/dev-apps/kernel/linux/./include/linux/page_ref.h:238 /home/reinhardt/dev-apps/kernel/linux/./include/linux/page_ref.h:247 /home/reinhardt/dev-apps/kernel/linux/./include/linux/page_ref.h:280 /home/reinhardt/dev-apps/kernel/linux/./include/linux/page_ref.h:313 /home/reinhardt/dev-apps/kernel/linux/mm/filemap.c:1899 /home/reinhardt/dev-apps/kernel/linux/mm/filemap.c:1951)
>>> [ 1975.257152] Code: 10 e8 56 fd 67 00 48 89 c3 48 3d 02 04 00 00 74 e2 48 3d 06 04 00 00 74 da 48 85 c0 0f 84 3e 02 00 00 a8 01 0f 85 40 02 00 00 <8b> 40 34 85 c0 74 c2 8d 50 01 f0 0f b1 53 34 75 f2 48 8b 54 24 28
>>> All code
>>> ========
>>>     0:	10 e8                	adc    %ch,%al
>>>     2:	56                   	push   %rsi
>>>     3:	fd                   	std
>>>     4:	67 00 48 89          	add    %cl,-0x77(%eax)
>>>     8:	c3                   	ret
>>>     9:	48 3d 02 04 00 00    	cmp    $0x402,%rax
>>>     f:	74 e2                	je     0xfffffffffffffff3
>>>    11:	48 3d 06 04 00 00    	cmp    $0x406,%rax
>>>    17:	74 da                	je     0xfffffffffffffff3
>>>    19:	48 85 c0             	test   %rax,%rax
>>>    1c:	0f 84 3e 02 00 00    	je     0x260
>>>    22:	a8 01                	test   $0x1,%al
>>>    24:	0f 85 40 02 00 00    	jne    0x26a
>>>    2a:*	8b 40 34             	mov    0x34(%rax),%eax		<-- trapping instruction
>>>    2d:	85 c0                	test   %eax,%eax
>>>    2f:	74 c2                	je     0xfffffffffffffff3
>>>    31:	8d 50 01             	lea    0x1(%rax),%edx
>>>    34:	f0 0f b1 53 34       	lock cmpxchg %edx,0x34(%rbx)
>>>    39:	75 f2                	jne    0x2d
>>>    3b:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
>>>
>>> Code starting with the faulting instruction
>>> ===========================================
>>>     0:	8b 40 34             	mov    0x34(%rax),%eax
>>>     3:	85 c0                	test   %eax,%eax
>>>     5:	74 c2                	je     0xffffffffffffffc9
>>>     7:	8d 50 01             	lea    0x1(%rax),%edx
>>>     a:	f0 0f b1 53 34       	lock cmpxchg %edx,0x34(%rbx)
>>>     f:	75 f2                	jne    0x3
>>>    11:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
>>> [ 1975.257154] RSP: 0000:ffffc2d744c37cb0 EFLAGS: 00010246
>>> [ 1975.257155] RAX: 0000000000000002 RBX: 0000000000000002 RCX: 0000000000000000
>>> [ 1975.257156] RDX: 0000000000000000 RSI: ffffffffbb117459 RDI: 00000000ffffffff
>>> [ 1975.257157] RBP: 0000000000000000 R08: 00000000ffffdfff R09: 00000000ffffdfff
>>> [ 1975.257158] R10: ffffffffbb472dc0 R11: ffffffffbb472dc0 R12: 0000000000000000
>>> [ 1975.257159] R13: ffff9fc521173e78 R14: 00000000000decc7 R15: fff000003fffffff
>>> [ 1975.257160] FS:  00007fb2137fe6c0(0000) GS:ffff9fcb7eb40000(0000) knlGS:0000000000000000
>>> [ 1975.257161] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [ 1975.257162] CR2: 0000000000000036 CR3: 0000000164114000 CR4: 0000000000750ee0
>>> [ 1975.257163] PKRU: 55555554
>>> [ 1975.257163] Call Trace:
>>> [ 1975.257164]  <TASK>
>>> [ 1975.257166] ? page_add_file_rmap (/home/reinhardt/dev-apps/kernel/linux/./include/linux/page-flags.h:195 /home/reinhardt/dev-apps/kernel/linux/mm/internal.h:440 /home/reinhardt/dev-apps/kernel/linux/mm/rmap.c:1270)
>>> [ 1975.257169] filemap_fault (/home/reinhardt/dev-apps/kernel/linux/./include/linux/pagemap.h:531 /home/reinhardt/dev-apps/kernel/linux/mm/filemap.c:3107)
>>> [ 1975.257172] __do_fault (/home/reinhardt/dev-apps/kernel/linux/mm/memory.c:3852)
>>> [ 1975.257174] __handle_mm_fault (/home/reinhardt/dev-apps/kernel/linux/mm/memory.c:4169 /home/reinhardt/dev-apps/kernel/linux/mm/memory.c:4297 /home/reinhardt/dev-apps/kernel/linux/mm/memory.c:4555 /home/reinhardt/dev-apps/kernel/linux/mm/memory.c:4690)
>>> [ 1975.257176] handle_mm_fault (/home/reinhardt/dev-apps/kernel/linux/mm/memory.c:4788)
>>> [ 1975.257178] do_user_addr_fault (/home/reinhardt/dev-apps/kernel/linux/./include/linux/sched/signal.h:404 /home/reinhardt/dev-apps/kernel/linux/arch/x86/mm/fault.c:1399)
>>> [ 1975.257181] exc_page_fault (/home/reinhardt/dev-apps/kernel/linux/./arch/x86/include/asm/irqflags.h:40 /home/reinhardt/dev-apps/kernel/linux/./arch/x86/include/asm/irqflags.h:75 /home/reinhardt/dev-apps/kernel/linux/arch/x86/mm/fault.c:1492 /home/reinhardt/dev-apps/kernel/linux/arch/x86/mm/fault.c:1540)
>>> [ 1975.257184] ? asm_exc_page_fault (/home/reinhardt/dev-apps/kernel/linux/./arch/x86/include/asm/idtentry.h:568)
>>> [ 1975.257186] asm_exc_page_fault (/home/reinhardt/dev-apps/kernel/linux/./arch/x86/include/asm/idtentry.h:568)
>>> [ 1975.257188] RIP: 0033:0x7fb265b88409
>>> [ 1975.257189] Code: 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 83 fa 20 72 27 <c5> fe 6f 06 48 83 fa 40 0f 87 a9 00 00 00 c5 fe 6f 4c 16 e0 c5 fe
>>> All code
>>> ========
>>>     0:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
>>>     7:	00 00 00 00
>>>     b:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
>>>    12:	00 00 00 00
>>>    16:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
>>>    1d:	00 00 00 00
>>>    21:	48 89 f8             	mov    %rdi,%rax
>>>    24:	48 83 fa 20          	cmp    $0x20,%rdx
>>>    28:	72 27                	jb     0x51
>>>    2a:*	c5 fe 6f 06          	vmovdqu (%rsi),%ymm0		<-- trapping instruction
>>>    2e:	48 83 fa 40          	cmp    $0x40,%rdx
>>>    32:	0f 87 a9 00 00 00    	ja     0xe1
>>>    38:	c5 fe 6f 4c 16 e0    	vmovdqu -0x20(%rsi,%rdx,1),%ymm1
>>>    3e:	c5                   	.byte 0xc5
>>>    3f:	fe                   	.byte 0xfe
>>>
>>> Code starting with the faulting instruction
>>> ===========================================
>>>     0:	c5 fe 6f 06          	vmovdqu (%rsi),%ymm0
>>>     4:	48 83 fa 40          	cmp    $0x40,%rdx
>>>     8:	0f 87 a9 00 00 00    	ja     0xb7
>>>     e:	c5 fe 6f 4c 16 e0    	vmovdqu -0x20(%rsi,%rdx,1),%ymm1
>>>    14:	c5                   	.byte 0xc5
>>>    15:	fe                   	.byte 0xfe
>>> [ 1975.257190] RSP: 002b:00007fb2137fd908 EFLAGS: 00010202
>>> [ 1975.257191] RAX: 00007fb204012a80 RBX: 0000000000000000 RCX: 00007fb2137fda90
>>> [ 1975.257192] RDX: 0000000000004000 RSI: 00007f9fddbb51c3 RDI: 00007fb204012a80
>>> [ 1975.257193] RBP: 00007fb2137fd928 R08: 00000000638ea1ab R09: 0000000000000000
>>> [ 1975.257193] R10: 0000000000000008 R11: 0000000000000246 R12: 00007fb204000bb0
>>> [ 1975.257194] R13: 00007fb21809a5a0 R14: 00000000decc71c3 R15: 0000000000004000
>>> [ 1975.257196]  </TASK>
>>> [ 1975.257196] Modules linked in: overlay xt_addrtype amdgpu drm_ttm_helper ttm gpu_sched drm_kms_helper iwlmvm backlight syscopyarea mac80211 sysfillrect sysimgblt libarc4 fb_sys_fops iwlwifi cfg80211 i2c_piix4 k10temp fuse configfs efivarfs
>>> [ 1975.257207] CR2: 0000000000000036
>>> [ 1975.257208] ---[ end trace 0000000000000000 ]---
>>> [ 1975.257209] RIP: 0010:__filemap_get_folio (/home/reinhardt/dev-apps/kernel/linux/./arch/x86/include/asm/atomic.h:29 /home/reinhardt/dev-apps/kernel/linux/./include/linux/atomic/atomic-arch-fallback.h:1158 /home/reinhardt/dev-apps/kernel/linux/./include/linux/atomic/atomic-arch-fallback.h:1183 /home/reinhardt/dev-apps/kernel/linux/./include/linux/atomic/atomic-instrumented.h:608 /home/reinhardt/dev-apps/kernel/linux/./include/linux/page_ref.h:238 /home/reinhardt/dev-apps/kernel/linux/./include/linux/page_ref.h:247 /home/reinhardt/dev-apps/kernel/linux/./include/linux/page_ref.h:280 /home/reinhardt/dev-apps/kernel/linux/./include/linux/page_ref.h:313 /home/reinhardt/dev-apps/kernel/linux/mm/filemap.c:1899 /home/reinhardt/dev-apps/kernel/linux/mm/filemap.c:1951)
>>> [ 1975.257211] Code: 10 e8 56 fd 67 00 48 89 c3 48 3d 02 04 00 00 74 e2 48 3d 06 04 00 00 74 da 48 85 c0 0f 84 3e 02 00 00 a8 01 0f 85 40 02 00 00 <8b> 40 34 85 c0 74 c2 8d 50 01 f0 0f b1 53 34 75 f2 48 8b 54 24 28
>>> All code
>>> ========
>>>     0:	10 e8                	adc    %ch,%al
>>>     2:	56                   	push   %rsi
>>>     3:	fd                   	std
>>>     4:	67 00 48 89          	add    %cl,-0x77(%eax)
>>>     8:	c3                   	ret
>>>     9:	48 3d 02 04 00 00    	cmp    $0x402,%rax
>>>     f:	74 e2                	je     0xfffffffffffffff3
>>>    11:	48 3d 06 04 00 00    	cmp    $0x406,%rax
>>>    17:	74 da                	je     0xfffffffffffffff3
>>>    19:	48 85 c0             	test   %rax,%rax
>>>    1c:	0f 84 3e 02 00 00    	je     0x260
>>>    22:	a8 01                	test   $0x1,%al
>>>    24:	0f 85 40 02 00 00    	jne    0x26a
>>>    2a:*	8b 40 34             	mov    0x34(%rax),%eax		<-- trapping instruction
>>>    2d:	85 c0                	test   %eax,%eax
>>>    2f:	74 c2                	je     0xfffffffffffffff3
>>>    31:	8d 50 01             	lea    0x1(%rax),%edx
>>>    34:	f0 0f b1 53 34       	lock cmpxchg %edx,0x34(%rbx)
>>>    39:	75 f2                	jne    0x2d
>>>    3b:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
>>>
>>> Code starting with the faulting instruction
>>> ===========================================
>>>     0:	8b 40 34             	mov    0x34(%rax),%eax
>>>     3:	85 c0                	test   %eax,%eax
>>>     5:	74 c2                	je     0xffffffffffffffc9
>>>     7:	8d 50 01             	lea    0x1(%rax),%edx
>>>     a:	f0 0f b1 53 34       	lock cmpxchg %edx,0x34(%rbx)
>>>     f:	75 f2                	jne    0x3
>>>    11:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
>>> [ 1975.257212] RSP: 0000:ffffc2d744c37cb0 EFLAGS: 00010246
>>> [ 1975.257213] RAX: 0000000000000002 RBX: 0000000000000002 RCX: 0000000000000000
>>> [ 1975.257214] RDX: 0000000000000000 RSI: ffffffffbb117459 RDI: 00000000ffffffff
>>> [ 1975.257215] RBP: 0000000000000000 R08: 00000000ffffdfff R09: 00000000ffffdfff
>>> [ 1975.257215] R10: ffffffffbb472dc0 R11: ffffffffbb472dc0 R12: 0000000000000000
>>> [ 1975.257216] R13: ffff9fc521173e78 R14: 00000000000decc7 R15: fff000003fffffff
>>> [ 1975.257217] FS:  00007fb2137fe6c0(0000) GS:ffff9fcb7eb40000(0000) knlGS:0000000000000000
>>> [ 1975.257218] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [ 1975.257219] CR2: 0000000000000036 CR3: 0000000164114000 CR4: 0000000000750ee0
>>> [ 1975.257220] PKRU: 55555554
>>>
>>> (full dmesg and my local changeset in attachments for your reference)
>>>
>> #regzbot poke
>>
--------------v0I38eSMINc6BvUKbyDmyawn
Content-Type: text/plain; charset=UTF-8; name="bug-latest"
Content-Disposition: attachment; filename="bug-latest"
Content-Transfer-Encoding: base64

WyAgODYyLjkxNDE3NV0gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBh
ZGRyZXNzOiAwMDAwMDAwMDAwMDAwMGI2ClsgIDg2Mi45MTQxODFdICNQRjogc3VwZXJ2aXNv
ciByZWFkIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQpbICA4NjIuOTE0MTgyXSAjUEY6IGVycm9y
X2NvZGUoMHgwMDAwKSAtIG5vdC1wcmVzZW50IHBhZ2UKWyAgODYyLjkxNDE4NF0gUEdEIDAg
UDREIDAKWyAgODYyLjkxNDE4Nl0gT29wczogMDAwMCBbIzFdIFBSRUVNUFQgU01QIE5PUFRJ
ClsgIDg2Mi45MTQxODhdIENQVTogNiBQSUQ6IDgyNzIgQ29tbTogZGVsdWdlLWd0ayBOb3Qg
dGFpbnRlZCA2LjEuMTItZ2VudG9vX2FwICMzClsgIDg2Mi45MTQxOTBdIEhhcmR3YXJlIG5h
bWU6IE1pY3JvLVN0YXIgSW50ZXJuYXRpb25hbCBDby4sIEx0ZC4gTVMtN0MzNS9NRUcgWDU3
MCBVTklGWSAoTVMtN0MzNSksIEJJT1MgQS5DMyAwMy8xNS8yMDIyClsgIDg2Mi45MTQxOTFd
IFJJUDogMDAxMDpfX2ZpbGVtYXBfZ2V0X2ZvbGlvKzB4YTcvMHgzNzAKWyAgODYyLjkxNDE5
NV0gQ29kZTogMTAgZTggNmQgNDEgMmIgMDEgNDggODkgYzMgNDggM2QgMDIgMDQgMDAgMDAg
NzQgZTIgNDggM2QgMDYgMDQgMDAgMDAgNzQgZGEgNDggODUgYzAgMGYgODQgNTYgMDIgMDAg
MDAgYTggMDEgMGYgODUgNTggMDIgMDAgMDAgPDhiPiA0MCAzNCA4NSBjMCA3NCBjMiA4ZCA1
MCAwMSBmMCAwZiBiMSA1MyAzNCA3NSBmMiA0OCA4YiA1NCAyNCAyOApbICA4NjIuOTE0MTk3
XSBSU1A6IDAwMDA6ZmZmZmJkNmQ4NzdiZmM4OCBFRkxBR1M6IDAwMDEwMjQ2ClsgIDg2Mi45
MTQxOThdIFJBWDogMDAwMDAwMDAwMDAwMDA4MiBSQlg6IDAwMDAwMDAwMDAwMDAwODIgUkNY
OiAwMDAwMDAwMDAwMDAwMDAyClsgIDg2Mi45MTQxOTldIFJEWDogMDAwMDAwMDAwMDAwMDAy
OCBSU0k6IGZmZmY5NTEyZGFiYzAyNDggUkRJOiBmZmZmYmQ2ZDg3N2JmYzk4ClsgIDg2Mi45
MTQyMDBdIFJCUDogMDAwMDAwMDAwMDAwMDAwMCBSMDg6IDAwMDAwMDAwMDA1MzI1MmYgUjA5
OiAwMDAwMDAwMDAwMDAwMDAwClsgIDg2Mi45MTQyMDFdIFIxMDogZmZmZmZmZmZmZmZmZmZj
MCBSMTE6IGZmZmY5NTBmZjU2ZTYzMGMgUjEyOiAwMDAwMDAwMDAwMDAwMDAwClsgIDg2Mi45
MTQyMDJdIFIxMzogZmZmZjk1MTBhMDk2NDZiMCBSMTQ6IDAwMDAwMDAwMDA1MzI1MmEgUjE1
OiBmZmYwMDAwMDNmZmZmZmZmClsgIDg2Mi45MTQyMDRdIEZTOiAgMDAwMDdmNWQ2MzdmZTZj
MCgwMDAwKSBHUzpmZmZmOTUxNmJlYjgwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAw
MDAKWyAgODYyLjkxNDIwNV0gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAw
MDAwMDA4MDA1MDAzMwpbICA4NjIuOTE0MjA2XSBDUjI6IDAwMDAwMDAwMDAwMDAwYjYgQ1Iz
OiAwMDAwMDAwMTU0YmY0MDAwIENSNDogMDAwMDAwMDAwMDc1MGVlMApbICA4NjIuOTE0MjA3
XSBQS1JVOiA1NTU1NTU1NApbICA4NjIuOTE0MjA4XSBDYWxsIFRyYWNlOgpbICA4NjIuOTE0
MjEwXSAgPFRBU0s+ClsgIDg2Mi45MTQyMTJdICA/IF9yYXdfc3Bpbl91bmxvY2srMHgxMC8w
eDMwClsgIDg2Mi45MTQyMTVdICBmaWxlbWFwX2ZhdWx0KzB4NjAvMHg5MDAKWyAgODYyLjkx
NDIxN10gIF9fZG9fZmF1bHQrMHgzMC8weGIwClsgIDg2Mi45MTQyMjBdICBfX2hhbmRsZV9t
bV9mYXVsdCsweGNhMy8weDE2YzAKWyAgODYyLjkxNDIyMl0gIGhhbmRsZV9tbV9mYXVsdCsw
eGU5LzB4MmUwClsgIDg2Mi45MTQyMjRdICBkb191c2VyX2FkZHJfZmF1bHQrMHgxYjcvMHg2
NTAKWyAgODYyLjkxNDIyNl0gIGV4Y19wYWdlX2ZhdWx0KzB4NjAvMHgxMzAKWyAgODYyLjkx
NDIyOV0gIGFzbV9leGNfcGFnZV9mYXVsdCsweDIyLzB4MzAKWyAgODYyLjkxNDIzMV0gUklQ
OiAwMDMzOjB4N2Y1ZGNkMzc2NDA5ClsgIDg2Mi45MTQyMzJdIENvZGU6IDY2IDY2IDJlIDBm
IDFmIDg0IDAwIDAwIDAwIDAwIDAwIDY2IDY2IDJlIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAw
IDY2IDY2IDJlIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIDQ4IDg5IGY4IDQ4IDgzIGZhIDIw
IDcyIDI3IDxjNT4gZmUgNmYgMDYgNDggODMgZmEgNDAgMGYgODcgYTkgMDAgMDAgMDAgYzUg
ZmUgNmYgNGMgMTYgZTAgYzUgZmUKWyAgODYyLjkxNDIzM10gUlNQOiAwMDJiOjAwMDA3ZjVk
NjM3ZmQ5MDggRUZMQUdTOiAwMDAxMDIwMgpbICA4NjIuOTE0MjM0XSBSQVg6IDAwMDA3ZjVk
OTQwMjk2NjAgUkJYOiAwMDAwMDAwMDAwMDAwMDAwIFJDWDogMDAwMDdmNWQ2MzdmZGE5MApb
ICA4NjIuOTE0MjM1XSBSRFg6IDAwMDAwMDAwMDAwMDQwMDAgUlNJOiAwMDAwN2YxYmFjNTJh
NjZhIFJESTogMDAwMDdmNWQ5NDAyOTY2MApbICA4NjIuOTE0MjM2XSBSQlA6IDAwMDA3ZjVk
NjM3ZmQ5MjggUjA4OiAwMDAwMDAwMDYzZjhmYTAxIFIwOTogMDAwMDAwMDAwMDAwMDAwMApb
ICA4NjIuOTE0MjM3XSBSMTA6IDAwMDAwMDAwMDAwMDAwMDggUjExOiAwMDAwMDAwMDAwMDAw
MjQ2IFIxMjogMDAwMDdmNWQ5NDAwNGMyMApbICA4NjIuOTE0MjM3XSBSMTM6IDAwMDA3ZjVk
OWMwMGEwZDAgUjE0OiAwMDAwMDAwNTMyNTJhNjZhIFIxNTogMDAwMDAwMDAwMDAwNDAwMApb
ICA4NjIuOTE0MjM5XSAgPC9UQVNLPgpbICA4NjIuOTE0MjQwXSBNb2R1bGVzIGxpbmtlZCBp
bjogb3ZlcmxheSB4dF9hZGRydHlwZSBpd2xtdm0gbWFjODAyMTEgbGliYXJjNCBpMmNfcGlp
eDQgaXdsd2lmaSB0cG1fY3JiIGNmZzgwMjExIHRwbV90aXMgdHBtX3Rpc19jb3JlIHRwbSBr
MTB0ZW1wIGZ1c2UgY29uZmlnZnMgZWZpdmFyZnMKWyAgODYyLjkxNDI0N10gQ1IyOiAwMDAw
MDAwMDAwMDAwMGI2ClsgIDg2Mi45MTQyNDhdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAw
MDAwMDAgXS0tLQpbICA4NjIuOTE0MjQ5XSBSSVA6IDAwMTA6X19maWxlbWFwX2dldF9mb2xp
bysweGE3LzB4MzcwClsgIDg2Mi45MTQyNTFdIENvZGU6IDEwIGU4IDZkIDQxIDJiIDAxIDQ4
IDg5IGMzIDQ4IDNkIDAyIDA0IDAwIDAwIDc0IGUyIDQ4IDNkIDA2IDA0IDAwIDAwIDc0IGRh
IDQ4IDg1IGMwIDBmIDg0IDU2IDAyIDAwIDAwIGE4IDAxIDBmIDg1IDU4IDAyIDAwIDAwIDw4
Yj4gNDAgMzQgODUgYzAgNzQgYzIgOGQgNTAgMDEgZjAgMGYgYjEgNTMgMzQgNzUgZjIgNDgg
OGIgNTQgMjQgMjgKWyAgODYyLjkxNDI1Ml0gUlNQOiAwMDAwOmZmZmZiZDZkODc3YmZjODgg
RUZMQUdTOiAwMDAxMDI0NgpbICA4NjIuOTE0MjUzXSBSQVg6IDAwMDAwMDAwMDAwMDAwODIg
UkJYOiAwMDAwMDAwMDAwMDAwMDgyIFJDWDogMDAwMDAwMDAwMDAwMDAwMgpbICA4NjIuOTE0
MjU1XSBSRFg6IDAwMDAwMDAwMDAwMDAwMjggUlNJOiBmZmZmOTUxMmRhYmMwMjQ4IFJESTog
ZmZmZmJkNmQ4NzdiZmM5OApbICA4NjIuOTE0MjU2XSBSQlA6IDAwMDAwMDAwMDAwMDAwMDAg
UjA4OiAwMDAwMDAwMDAwNTMyNTJmIFIwOTogMDAwMDAwMDAwMDAwMDAwMApbICA4NjIuOTE0
MjU3XSBSMTA6IGZmZmZmZmZmZmZmZmZmYzAgUjExOiBmZmZmOTUwZmY1NmU2MzBjIFIxMjog
MDAwMDAwMDAwMDAwMDAwMApbICA4NjIuOTE0MjU4XSBSMTM6IGZmZmY5NTEwYTA5NjQ2YjAg
UjE0OiAwMDAwMDAwMDAwNTMyNTJhIFIxNTogZmZmMDAwMDAzZmZmZmZmZgpbICA4NjIuOTE0
MjYwXSBGUzogIDAwMDA3ZjVkNjM3ZmU2YzAoMDAwMCkgR1M6ZmZmZjk1MTZiZWI4MDAwMCgw
MDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwClsgIDg2Mi45MTQyNjJdIENTOiAgMDAxMCBE
UzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKWyAgODYyLjkxNDI2Ml0g
Q1IyOiAwMDAwMDAwMDAwMDAwMGI2IENSMzogMDAwMDAwMDE1NGJmNDAwMCBDUjQ6IDAwMDAw
MDAwMDA3NTBlZTAKWyAgODYyLjkxNDI2M10gUEtSVTogNTU1NTU1NTQK

--------------v0I38eSMINc6BvUKbyDmyawn--
