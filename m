Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9C01170A
	for <regressions@lists.linux.dev>; Wed,  1 Nov 2023 12:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qyA8R-0003Rl-V8; Wed, 01 Nov 2023 13:15:48 +0100
Message-ID: <fef5e8f0-12e3-4755-92db-dcf16a7db9aa@leemhuis.info>
Date: Wed, 1 Nov 2023 13:15:47 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: X86 parallel bring up regression
Content-Language: en-US, de-DE
To: Linux kernel regressions list <regressions@lists.linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <3d96c70e-da3b-49c2-a776-930a9f1b815d@amd.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <3d96c70e-da3b-49c2-a776-930a9f1b815d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698840949;54ae380b;
X-HE-SMSGID: 1qyA8R-0003Rl-V8

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 19.10.23 22:26, Mario Limonciello wrote:
> 
> We've recently found that there was a regression from 6.5 that broke
> resume from suspend-to-ram on some AMD platforms.

#regzbot monitor
https://lore.kernel.org/all/20231023160018.164054-1-mario.limonciello@amd.com/
#regzbot monitor
https://lore.kernel.org/all/20231026170330.4657-1-mario.limonciello@amd.com/
#regzbot ignore-activity
#regzbot resolve: turned out to be a BIOS bug

For details see https://lore.kernel.org/all/878r7imlb0.ffs@tglx/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
