Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA686FA0
	for <regressions@lists.linux.dev>; Mon, 17 Apr 2023 11:41:21 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1poNEV-0003Sc-Dr; Mon, 17 Apr 2023 13:41:19 +0200
Message-ID: <617301ed-b353-06e0-49a2-d4180832031d@leemhuis.info>
Date: Mon, 17 Apr 2023 13:41:18 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [Regression] acpi: laptop panics early in boot
Content-Language: en-US, de-DE
To: linux-acpi@vger.kernel.org
Cc: regressions@lists.linux.dev
References: <9f6cba7a8a57e5a687c934e8e406e28c.squirrel@mail.panix.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <9f6cba7a8a57e5a687c934e8e406e28c.squirrel@mail.panix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1681731681;7a7cc2eb;
X-HE-SMSGID: 1poNEV-0003Sc-Dr

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 06.03.23 22:45, Pierre Asselin wrote:
> 
> Laptop crashes when booting on AC power.
> 
> The laptop is on Gentoo; upgrading from 5.15.88 to 6.1.12, the kernel
> panics before reaching early userspace.  I find no other report like
> this on the Gentoo, arch, mint, or Ubuntu forums, on kernel.org, or out
> of duckduckgo.  This is a regression (because, you know, the kernel used
> to boot) but so far it's only me, and only on my 16-year old laptop.
> Also, I have a workaround.
> [...]
> #regzbot introduced d6fb6ee1820c

regzbot accidentally missed the fix for this, hence let me point to it
manually:

#regzbot fix: c56610a869bce03490
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
