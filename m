Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B6214A89
	for <regressions@lists.linux.dev>; Sat, 27 Jan 2024 08:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706343942; cv=none; b=bXb4iMoFXUNkLLjRq6PA9P1C87h/Yjk3kttnYqxReWp7ZJkfk1qskw9RA7zSyzkKe1HZBCN8/SEhfo8w31YHY4lW9ZQdEeAv6BKEVKqc5aaJhZJkMUkYBcFbrbd9wJipgi9ittUP2xvpyh/AnuhXb0VE2a4Vdq3hiijXXMYne08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706343942; c=relaxed/simple;
	bh=mZLki7mcHH/GYquMjSJPLmRMhz1JKLB1G0jdkACJYSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=au9WvFx+DAhGs1ug0+p/jhMtbH/pdpQwQFBBS5rbdLRPIpU/MWGFi147tIVCDhzqTHXSZeFBgmp+Flk2Sbbu/7mu6PRJRgCAUZU4Xed7nAO1MqQyh0tS9nuAnuUQRVFOhiCM5yh8GSkRxmIvGSr97w+WjBTGRH5bkJYyiLDPM7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rTe0Q-0002d7-BF; Sat, 27 Jan 2024 09:25:38 +0100
Message-ID: <a68c06ec-b303-4caf-ac39-882a1acb75b1@leemhuis.info>
Date: Sat, 27 Jan 2024 09:25:38 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "Revert "md/raid5: Wait for MD_SB_CHANGE_PENDING
 in raid5d""
Content-Language: en-US, de-DE
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <20240125082131.788600-1-song@kernel.org>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20240125082131.788600-1-song@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1706343940;9466b103;
X-HE-SMSGID: 1rTe0Q-0002d7-BF

On 25.01.24 09:21, Song Liu wrote:
> This reverts commit bed9e27baf52a09b7ba2a3714f1e24e17ced386d.
> 
> The original set [1][2] was expected to undo a suboptimal fix in [2], and
> replace it with a better fix [1]. However, as reported by Dan Moulding [2]
> causes an issue with raid5 with journal device.
> 
> Revert [2] for now to close the issue. We will follow up on another issue
> reported by Juxiao Bi, as [2] is expected to fix it. We believe this is a
> good trade-off, because the latter issue happens less freqently.
> 
> In the meanwhile, we will NOT revert [1], as it contains the right logic.
> 
> Reported-by: Dan Moulding <dan@danm.net>
> Closes: https://lore.kernel.org/linux-raid/20240123005700.9302-1-dan@danm.net/
> Fixes: bed9e27baf52 ("Revert "md/raid5: Wait for MD_SB_CHANGE_PENDING in raid5d"")
> Cc: stable@vger.kernel.org # v5.19+

#regzbot ^introduced bed9e27baf52a09b7ba2a3714f1
#regzbot title md/raid5: issue with raid5 with journal device
#regzbot fix Revert "Revert "md/raid5: Wait for MD_SB_CHANGE_PENDING in
raid5d""
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
