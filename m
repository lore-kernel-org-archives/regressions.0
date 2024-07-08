Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242DB56766
	for <regressions@lists.linux.dev>; Mon,  8 Jul 2024 11:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720437412; cv=none; b=H3q3xWoo757UujioPqZ1M5s9ozLKJxUzKs8F77zqULurNqF7t1gq8E5DDr6PJNXvLOdU4fq2pWkEvjH5pHegj7gixW7sCg7iENFwpTBQ4CK7uqgE6dG5dtqWSEUDka0U3E4KPEeUOewBTF9i8t6p2qAdhIZJiqgWhQVOyiOfC0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720437412; c=relaxed/simple;
	bh=Q0AX5g5tPFinxipZ4fOhKx3+WoFGiRskwa1al6yQ8tA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Penim0wzadLV+9VUDeLEPngvzfPwWY4nLIQUFTbdJGB0Wr00ARsOcwouwrDIwhdmOnn4jj0JIeZaGkst1MXCzWgCDfgTcI7QFSmN6nbCYJeIPdSrfSX4cWbb1QZArb+4mJ5bepxaxjcqGqzb5fKVTJbjqZ6B6jJkooQzbIDyZS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=pTJ4kdzJ; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="pTJ4kdzJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ZafBfG+X5+9uEjdKKOVxG/pWWkx49xVK4LJ9YEsOA3Y=; t=1720437410;
	x=1720869410; b=pTJ4kdzJILIP9hXj086KkvRcr1VDUtn3biplMKfZ5+VWQYnD5h9ykLwCfMRHE
	Ew0Ri8rRKD35A+f7JS1loMBXWpT6E0FsxE65wttZWLk/MoQombcBHgNAAdNHy6ZH/HWfmU+NatsWq
	VfHqrUiXcC5wwQcW8rdTxV/RqqAxVjJJf8UXVrZfotJxGs33u0Tf43xwY7K3AhIZth2m7MueGwlDn
	pMaugmT+0Bkp97qE1d2iNyaZ5xRZkEEk2BKBuYENWfvSLZ3nWXaGrKck+skpmSSLXXEDtQrw8zcPZ
	DfwEEdsPsuUp7HiqoCcgQ4CqpGKSC1pUfTrEqT8jSiAgS6uJEg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sQmMR-0003eD-Qb; Mon, 08 Jul 2024 13:16:47 +0200
Message-ID: <75ccb99c-a42f-4866-9550-f3d9dae2e554@leemhuis.info>
Date: Mon, 8 Jul 2024 13:16:47 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: dm-crypt performance regression due to workqueue changes
To: Christian Heusel <christian@heusel.eu>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
 <d3b6a145-ed72-4da4-ace5-b6d99d3e4ff7@heusel.eu>
 <26f1b4f8-c78b-4aff-b748-58abaa01671f@leemhuis.info>
 <84ea4156-74b6-4a8d-8101-92d212015def@heusel.eu>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <84ea4156-74b6-4a8d-8101-92d212015def@heusel.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1720437410;b0e01c66;
X-HE-SMSGID: 1sQmMR-0003eD-Qb

On 08.07.24 12:51, Christian Heusel wrote:
> On 24/07/08 09:08AM, Thorsten Leemhuis wrote:
>> On 08.07.24 00:54, Christian Heusel wrote:
>>> On 24/03/09 11:18AM, Thorsten Leemhuis wrote:
>>>> Hi! This is the start of a thread I'll use for updating minor properties
>>>> of regressions tracked by regzbot. Consider telling your mailer to
>>>> ignore this thread, the replies are unlikely to be of relevance for you,
>>>> but done here to ensure a public paper trail.
>>>
>>> #regzbot report: https://lore.kernel.org/linux-kernel/32fd8274-d5f-3eca-f5d2-1a9117fd8edb@redhat.com/
>>> #regzbot introduced: 63c5484e74952f60f5810256bd69814d167b8d22
>>> #regzbot summary: workqueue: dm-crypt performance regression
>>
>> thx for adding this, but please allow me to ask: what's your
>> intention here?
>>
>> Is this something like "I have seen a regression report and all
>> regressions must be fixed" or "I or someone else I know is affected by
>> this and we think this should be fixed".
> 
> I have come across the linked report on Social Media[0] and thought it
> would be good to have it tracked by regzbot since it looked like a valid
> regression, so its a bit a mix of the two.

:-D

> Is this creating significant overhead for you or anybody else? 

It does, as I basically go through the list of tracked regressions every
few days to prevent something along the lines of "regzbot is yet another
bug tracker where the data does not match reality and where nobody is
podding stalled reports when needed". And every entry obviously takes
some time.

> AFAIU the report will be autoclosed once a fix lands, so I thought
> giving it some visibility on the regression overview wouldn't hurt.

If it's fixed with a proper Link: or Closes: tag, yes. But from the
discussion it looks a lot like this is a bug nobody wants to address.
Without a proper "I'm affected by this" report from a user (not sure if
Mikulas reports counts) it might not be worth trying to change that by
prodding the developers.

Ciao, Thorsten
