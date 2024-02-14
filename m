Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1DC5CDC9
	for <regressions@lists.linux.dev>; Wed, 14 Feb 2024 15:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707924274; cv=none; b=E0Hb+k2l2G3SJCrtWzFYqiD0z4kGNrnAhxGU51PKY9KsF8JLtRApALcER2EeaW3mv1p8Qs7bldXbXZOlBGRxIT2eiJbjBNT+uHonlfBXYL/07JBpGmq6MMYra4MSQYP0xVb+2Nv7rDL+xC9ejd+Ii2PC2BnDrwc08z1KCPmWFWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707924274; c=relaxed/simple;
	bh=1YQo64D1oz09XMbdqUefryZO0yVS6EoeHUwBc5W+P5Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=eskUhc8tjwAK+FCCeSTlgrcCR0PB/mK3TFN1qEghQnZ4zokS9AcRZZejVNNXVxnb/AykVAoq6Kg8tSKtdnErGvRGyL0cOZKQdcG3xs3BE4Occ70sMf+ja7Gzc01vaQav+FoKOrrr9A3wY5EmeZOEU8AMrDetyPQrukXx39peHP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1raH7Y-0008GS-HY; Wed, 14 Feb 2024 16:24:24 +0100
Message-ID: <a8d4250a-857e-40db-bcbc-8082013cdf05@leemhuis.info>
Date: Wed, 14 Feb 2024 16:24:24 +0100
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
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20240125082131.788600-1-song@kernel.org>
 <a68c06ec-b303-4caf-ac39-882a1acb75b1@leemhuis.info>
In-Reply-To: <a68c06ec-b303-4caf-ac39-882a1acb75b1@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1707924272;99ef6659;
X-HE-SMSGID: 1raH7Y-0008GS-HY

On 27.01.24 09:25, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> On 25.01.24 09:21, Song Liu wrote:
>> This reverts commit bed9e27baf52a09b7ba2a3714f1e24e17ced386d.
>>
>> The original set [1][2] was expected to undo a suboptimal fix in [2], and
>> replace it with a better fix [1]. However, as reported by Dan Moulding [2]
>> causes an issue with raid5 with journal device.
>>
>> Revert [2] for now to close the issue. We will follow up on another issue
>> reported by Juxiao Bi, as [2] is expected to fix it. We believe this is a
>> good trade-off, because the latter issue happens less freqently.
>>
>> In the meanwhile, we will NOT revert [1], as it contains the right logic.
>>
>> Reported-by: Dan Moulding <dan@danm.net>
>> Closes: https://lore.kernel.org/linux-raid/20240123005700.9302-1-dan@danm.net/
>> Fixes: bed9e27baf52 ("Revert "md/raid5: Wait for MD_SB_CHANGE_PENDING in raid5d"")
>> Cc: stable@vger.kernel.org # v5.19+
> 
> #regzbot ^introduced bed9e27baf52a09b7ba2a3714f1
> #regzbot title md/raid5: issue with raid5 with journal device
> #regzbot fix Revert "Revert "md/raid5: Wait for MD_SB_CHANGE_PENDING in
> raid5d""
> #regzbot ignore-activity

I mixed something up here, let me fix this:

#regzbot introduced 0de40f76d56
#regzbot fix 87165c64fe1a98bbab
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
