Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215633D8A
	for <regressions@lists.linux.dev>; Sun, 30 Jul 2023 16:53:43 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qQ9fp-0006lv-Tx; Sun, 30 Jul 2023 18:53:41 +0200
Message-ID: <73310d78-914b-7200-0fb7-073b52324aaf@leemhuis.info>
Date: Sun, 30 Jul 2023 18:53:41 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] IRQ override revert breaks keyboard on Lenovo Yoga 7
 14ARB7
Content-Language: en-US, de-DE
To: regressions@lists.linux.dev
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <596b9c4a-fb83-a8ab-3a44-6052d83fa546@augustwikerfors.se>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <596b9c4a-fb83-a8ab-3a44-6052d83fa546@augustwikerfors.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1690736024;f55b3e0d;
X-HE-SMSGID: 1qQ9fp-0006lv-Tx

On 27.07.23 00:54, August Wikerfors wrote:
> 
> Since v6.5-rc1 the keyboard on this laptop no longer works. This problem
> also existed before v6.0-rc1 commit 9946e39fe8d0 ("ACPI: resource: skip
> IRQ override on AMD Zen platforms"), so I suspected the cause to be
> a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and quirks")
> which reverted that commit. Reverting a9c4a912b7dc confirmed this theory.
> 
> #regzbot introduced: a9c4a912b7dc

Point regzbot to the fix:

#regzbot monitor:
https://lore.kernel.org/linux-acpi/20230728183921.17230-1-mario.limonciello@amd.com/
#regzbot fix: ACPI: resource: Add a quirk for Lenovo Yoga 7 14ARB7
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


