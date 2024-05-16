Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABAF143882
	for <regressions@lists.linux.dev>; Thu, 16 May 2024 10:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715854771; cv=none; b=A9tx/6aa1eHOY6VoU0IDHuJiAHabYEI7ZiQsWmt8DoLKjxydhVhO//7r5VLaCM40wHZ8JxBnulitiqWMBB8SBb/JiyOJhEMHM/JSirX2GYik6LihBof34mpkq2n3on2pWy9OQzssPvIxTQve4PrShqyzKBkZCYn9G1+RV41aCSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715854771; c=relaxed/simple;
	bh=+gILZXKuBiXqisZnXuJ7Df97bo9FRkL+dinPrt5qd2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O85Gk7R7KTBpi3Ks5SsbrgHpWG3W/X9nmBdQ0hccq9ZRjjYUz7Y8ZOYRhWNJuT7gRoXQA1KcsOJwfKL6x2FLR8ooN8+uoB9sj+rV3UxgwnNEG+pku/jPfW1QoBInVTrcJJKQSlvoues5dB1IYrqVM0bNNX3trdjdXaFi0cVNK2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=nepdcAXI; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="nepdcAXI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=z8amDHAqtG09TAytuYxbm7FupnkkdUk3EnBSPk5Iskg=; t=1715854769;
	x=1716286769; b=nepdcAXIQpCSYIDkLZMgB8o44V5E7h7Im8JAhNAMGDox36ZKK9N2sdqv6M4c0
	a3/SJj83GPOfkigj4a1fG9i55Dw3r07bWh5nM0czrM4rTrxsNt2doXghMWKJwSF1WIFlj8JAI9D6K
	S5vacJfurzE+Y/RRm1r2z9N55QZ1acjPdvE+RwBgw2+OoXeuRZeUSZJNdklkJ65nsGfBGAvf8N+LB
	oQBqEBLO/SUIWds2aNg9MI3BCHQzuXWCBlF2lIOGImRodSWacVMgau6sYkjPfcHh6mjqbEjNj35Gk
	EjLN0mYTvInAVEeJgzv7nvAeQOLNkMaV4qnIt0cWc87OqersEg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s7YCr-0001oN-A5; Thu, 16 May 2024 12:19:25 +0200
Message-ID: <d4caa0a0-2487-493c-a498-c6eca7483fde@leemhuis.info>
Date: Thu, 16 May 2024 12:19:24 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SATA ACPI SECURITY FREEZE LOCK (regression?)
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <ZkL0EIESAleNhVqr@archie.me>
 <ef803d3c-14c3-47ef-91d7-4ca498519bf0@leemhuis.info>
 <453b71cd-7fa4-49ad-a2dd-35f63ea79979@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <453b71cd-7fa4-49ad-a2dd-35f63ea79979@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1715854769;4833010b;
X-HE-SMSGID: 1s7YCr-0001oN-A5

On 16.05.24 12:07, Bagas Sanjaya wrote:
> On 5/16/24 16:56, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 14.05.24 07:18, Bagas Sanjaya wrote:
>>>
>>> doru iorgulescu <doru.iorgulescu1@gmail.com> dumped repeated SATA error
>>> messages on Bugzilla (https://bugzilla.kernel.org/show_bug.cgi?id=218832):
>>
>> Thx. I wonder if this is a problem at all. Acted in bugzilla for now.
>>
>> BTW: you did not reply to my question yesterday: why did you start for
>> forwarding bugzilla tickets yourself again? I thought we agreed to let
>> me handle that.
> 
> I'm just wondering there and see what bugs I can forward to mailing lists
> (of course with relevant maintainers Cc'ed).

Please leave that to me for now, as we agreed on a while ago. We tried
that already and that made some people upset and annoyed about
regression tracking, which I really want to avoid.

If you are unhappy with how I handle things, just tell me.

Ciao, Thorsten

