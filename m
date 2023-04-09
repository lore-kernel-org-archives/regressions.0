Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A03F23A7
	for <regressions@lists.linux.dev>; Sun,  9 Apr 2023 14:29:55 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1plW2w-0006KX-61; Sun, 09 Apr 2023 16:29:34 +0200
Message-ID: <934225fd-6cc0-4c83-a322-94ddc8598366@leemhuis.info>
Date: Sun, 9 Apr 2023 16:29:33 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH v4 03/12] ARM: vfp: Fix broken softirq handling with
 instrumentation enabled
Content-Language: en-US, de-DE
To: Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux@armlinux.org.uk
Cc: Frederic Weisbecker <frederic@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Peter Zijlstra <peterz@infradead.org>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230320131845.3138015-1-ardb@kernel.org>
 <20230320131845.3138015-4-ardb@kernel.org>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <20230320131845.3138015-4-ardb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1681050596;c7f09b44;
X-HE-SMSGID: 1plW2w-0006KX-61

On 20.03.23 14:18, Ard Biesheuvel wrote:
> Commit 62b95a7b44d1 ("ARM: 9282/1: vfp: Manipulate task VFP state with
> softirqs disabled") replaced the en/disable preemption calls inside the
> VFP state handling code with en/disabling of soft IRQs, which is
> necessary to allow kernel use of the VFP/SIMD unit when handling a soft
> IRQ.
> 
> Unfortunately, when lockdep is enabled (or other instrumentation that
> enables TRACE_IRQFLAGS), the disable path implemented in asm fails to
> perform the lockdep and RCU related bookkeeping, resulting in spurious
> warnings and other badness.
> 
> Set let's rework the VFP entry code a little bit so we can make the
> local_bh_disable() call from C, with all the instrumentations that
> happen to have been configured. Calling local_bh_enable() can be done
> from asm, as it is a simple wrapper around __local_bh_enable_ip(), which
> is always a callable function.
> 
> Link: https://lore.kernel.org/all/ZBBYCSZUJOWBg1s8@localhost.localdomain/
> Fixes: 62b95a7b44d1 ("ARM: 9282/1: vfp: Manipulate task VFP state with softirqs disabled")
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> [...]

It feels a lot like I'm missing something, but I can't figure out what,
I thus have to ask:

What happened to this patch and/or the series? From my very limited
viewpoint it looks like there was no progress for nearly three week now.

Reminder, 62b95a7b44d1 is a commit from 6.3 cycle and fixing a problem
Guenter ran into. Hence it to me looks like it's something that better
would be fixed this cycle. Or is this considered too dangerous for some
reason and thus need to wait? But even then I wonder a little bit why
it's not in next by now.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page
