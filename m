Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98B314C582
	for <regressions@lists.linux.dev>; Tue,  9 Jul 2024 07:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720511650; cv=none; b=HWbWBnb1HnKP+Hovnyx4pCqwdYPXGmSRDsAQY8fm2JvtDZZjiPG7sAQtgxAUlpXMD0aOWgj0dzuUa73Fb4NLi/pnqRKXBn7Gk1A4IlNoVYndgKOe0ahYCDC+NfE4rnz3yL0dQ2PZWw144rOg0VCh1/ulr7VBAjmRf1fp19oYUz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720511650; c=relaxed/simple;
	bh=mxDhXYW4b4UaLDofCILdQvO0N1H1w4xDNIWfXpyOj90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uv5gaT/j2TMuwhR8qBm/Wy0qVhZtfbnycvEvU3XVlThGApQWAxrUHqoMF/bmsS9y9DrWi8zCItTpIlzGPm0ma/IQSy7ZC/KTlFGTD0IRh2pH+pphdH5WoHISNJLbhzQ8SZBcUnv+pDAlm1oe1Ms56/M0QcRx7v6+pCw25XHDU1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=cWiWBxnV; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="cWiWBxnV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=KD1KDwYLjMteuzilVm1ud7e+p1+TxgpxGGygAd8eHOU=; t=1720511647;
	x=1720943647; b=cWiWBxnVACMngZiugPr4WyZA32yEqAkGvjh46VbKB3JR+I/B21rKjVW3u7jo1
	fUN5o1vVMaU0jJLdjUYnEHXG3V4zTD1KmObziR1aUVZw6pWQP/VZlaukHNH2XQZwJM2ewnv1Ypx7L
	+37dkL95s3K90XX9Qw65v31MA/+msOU4q38OsaR9nWMX4vfKQddGZ8NqChb6fcnNs35+0tH0rghuz
	vLRBdOqHf7qIM4zEXfSRQ1RTh03nU3RyVQGiWQqpy6vPAA+Q5IroV6ILQaq4nU/QLvbyHnkS6FUgI
	W6OQyfC5HhUAXAtZav1hI7aj3LAR9UvZBLO0lY5HdIcyyj/02g==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sR5fk-0005gx-5w; Tue, 09 Jul 2024 09:54:00 +0200
Message-ID: <f4455168-e855-49e0-80de-0f1940502227@leemhuis.info>
Date: Tue, 9 Jul 2024 09:53:59 +0200
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
 <75ccb99c-a42f-4866-9550-f3d9dae2e554@leemhuis.info>
 <0176fb44-8209-4b18-98fc-f10a0626fd13@heusel.eu>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <0176fb44-8209-4b18-98fc-f10a0626fd13@heusel.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1720511647;c0119dea;
X-HE-SMSGID: 1sR5fk-0005gx-5w

On 08.07.24 19:03, Christian Heusel wrote:
> On 24/07/08 01:16PM, Thorsten Leemhuis wrote:
>> On 08.07.24 12:51, Christian Heusel wrote:
>>
>>> Is this creating significant overhead for you or anybody else? 
>>
>> It does, as I basically go through the list of tracked regressions every
>> few days to prevent something along the lines of "regzbot is yet another
>> bug tracker where the data does not match reality and where nobody is
>> podding stalled reports when needed". And every entry obviously takes
>> some time.
> 
> So what would you suggest on how I should deal with this in the future?

It was totally fine to add this, don't worry. But at the same time it
looks like the discussion kinda ended already for now. So what is needed
now is someone that prods it and asks questions like "Mikulas, are you
satisfied with changing the config? Or do you think/should we consider
this something that should be fixed? Is it maybe possible to detect this
odd configuration and have a quirk for it to avoid the problem? Or is
that considered too much work for a corner case only found after 10
months and thus likely not something many people care about?".

But there are dragons here, the right tone is important: it's easy to
upset people and that does not help anyone in the end. So a blunt reply
along the lines of "this is a regression that has to be fixed" would be
a really bad idea.

Ciao, Thorsten


