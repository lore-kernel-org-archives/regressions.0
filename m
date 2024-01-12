Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D866DD09
	for <regressions@lists.linux.dev>; Fri, 12 Jan 2024 15:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rOJ55-0003LD-Vt; Fri, 12 Jan 2024 16:04:24 +0100
Message-ID: <1a7e822c-84ac-4c84-8054-11ec4aa6a018@leemhuis.info>
Date: Fri, 12 Jan 2024 16:04:23 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug 218198 - system after successful resuming the CPU won't enter
 lower Package Sates below pc2
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <4cbd1ad9-d343-421a-b9de-30dc8e2d02c1@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <4cbd1ad9-d343-421a-b9de-30dc8e2d02c1@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1705071866;ce9f1105;
X-HE-SMSGID: 1rOJ55-0003LD-Vt

On 10.12.23 12:40, Thorsten Leemhuis wrote:
> [TLDR: Just adding a regression reported to bko to the tracking]
> 
> Hi, Thorsten here, the Linux kernel's regression tracker. I noticed a
> regression reported in bugzilla.kernel.org that seems to be handled
> there already, nevertheless I'd like to add to the tracking to ensure
> it's doesn't fall through the cracks in the end:
> 
> #regzbot introduced: d035e4eb38b3ea5ae9
> https://bugzilla.kernel.org/show_bug.cgi?id=218198
> #regzbot title: system after successful resuming the CPU won't enter
> lower Package Sates below pc2
> #regzbot ignore-activity

#regzbot monitor:
https://lore.kernel.org/all/20240111115123.1258422-1-dlemoal@kernel.org/
#regzbot fix: ata: libata-core: Revert "ata: libata-core: Fix
ata_pci_shutdown_one()"
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
