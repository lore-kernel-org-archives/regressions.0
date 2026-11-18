Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.80.171.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026669;
	b=Se5S0mFi6HZVyGTzDhPg98rvr6pUBcZYxbXOxxjZSxB36Q75JezT8b+x9BKyZ4r1l+kr
	 89+tXAJnISi7y+fxv0bHofMr9e0pXm/GY1W3SSY8uWN/YUOMiBS3iMPaOATHQZD3arqj4
	 Bam4ViLpbG8d6xrYBElOg5DEScUCAJ+G0t7Z7uoJ5nhRq34ktee9xCrTiyzvY67wjSldM
	 v2u2zFZg/Uuyyz3nG22sK9C7nafCtF5nWN5UBvZNwFXzhu/rmy35c1DBvcy1o03XRBGhZ
	 DcXDNUaFmS1yGEsQP5GQWPpV1Au0XkmmnhJlE8JCnXx+jnIvpfPMTImBEmCMCT3caXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026669;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wjtIBDdhaJtyh5qXDYoEXcge5CtKeDdP/q+cvATUwUY=;
	b=lRsq9J9DH5xsRzIrCBvhyyfqQKsBGHHRWq8e1fC8BI9l3G0rwwlDL9eWIp2S4W+THJUy
	 3BVUln7dmRZxw7PHdrGDxLPVg/SfOkKMdSQ7sMni9RdRBrZOutmCf5l8eYKa22XDyUxXO
	 4eNzJ8ZGtlgiVDLQRgrEvgR57DzpWKHmarAZ1r7Wrm3/z4S740sxZ1X7xoSjflXCLCXEm
	 iOz9WluXIkgNVM8BBxxAq4NL0fx89hab+KqLT1xfGq9hiaLhY1lCEdJkQsj128XRmykh9
	 Yyj4IRBflb3sGE8zl7WI76hRaZUyzTnVPofiY8+Da70CvCWLNtlwhVGn7UhQ/Ef8gwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=letteboer.com;
	spf=pass smtp.mailfrom=letteboer.com;
	dkim=pass header.d=letteboer.com header.i=@letteboer.com header.a=rsa-sha256 header.s=dkim header.b=J+zRktQw;
	arc=none smtp.remote-ip=45.80.171.131
Received: from albissimus.dikhoed.net (albissimus.dikhoed.net [45.80.171.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB94606A32C
	for <regressions@lists.linux.dev>; Wed, 18 Nov 2026 18:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BB94606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=letteboer.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=letteboer.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=letteboer.com header.i=@letteboer.com header.a=rsa-sha256 header.s=dkim header.b=J+zRktQw
Received: from [IPV6:2a10:3781:39b5:1::134] (graver.dikhoed.net [IPv6:2a10:3781:39b5:1::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by albissimus.dikhoed.net (Postfix) with ESMTPSA id 29E2AD2952B;
	Wed, 18 Nov 2026 19:31:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=letteboer.com;
	s=dkim; t=1795026666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjtIBDdhaJtyh5qXDYoEXcge5CtKeDdP/q+cvATUwUY=;
	b=J+zRktQwbt5vY/hAaidXEb+tDUhxVF5w1qTh8lgvB7dPHteZKd3NhxZRgwALzGfQacid7j
	lOHNdgtiPGPbvk36NP8CjsYnqNWRoo3cEIJiIdf5huLSwbiOQRWGj8K5Bao1mQemEIlETf
	lSU/0jpjunEAt1a6g6HcdHxE/9QEnxc=
Message-ID: <e970af13-35de-4249-8d0d-a2bdfced1058@letteboer.com>
Date: Wed, 18 Nov 2026 19:31:06 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] r8169: RTL8127A (XID 6c9) SFP+ link fails to come up
 in 7.4-rc3 (inband/10gbase-r)
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, netdev@vger.kernel.org, regressions@lists.linux.dev
References: <9e803eea-2446-425a-93d3-2524890d9508@letteboer.com>
 <bb775cfb-525b-4471-bc80-46bb9f98cc31@lunn.ch>
 <75638763-689b-45f3-b8dd-72f74c4dea3a@letteboer.com>
 <2e06bc02-eb83-4ff9-a454-685480135bb8@lunn.ch>
Content-Language: en-US
From: Frits Letteboer <frits@letteboer.com>
In-Reply-To: <2e06bc02-eb83-4ff9-a454-685480135bb8@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18/11/2026 19:06, Andrew Lunn wrote:
> On Wed, Nov 18, 2026 at 06:58:02PM +0100, Frits Letteboer wrote:
>> On 18/11/2026 16:32, Andrew Lunn wrote:
>>> On Wed, Nov 18, 2026 at 04:18:41PM +0100, Frits Letteboer wrote:
>>>> Hi Heiner,
>>>>
>>>> Between Linux 7.3 and 7.4-rc3, my Realtek RTL8127A (XID 6c9) SFP+ NIC
>>>> stopped establishing a link and generating interrupts under r8169.
>>> Can you do a git bisect? Find out which patch broken it?
>>>
>> Thank you for your reply.
>>
>>
>> I was going to bisect, however it seems after loading the out-of-tree r8127
>> driver,, the link now comes up reliably, even with the r8169 driver. I am
>> thoroughly confused.
> Try a really cold boot. Pull the plug, so it does not have any standby
> power. If the board supports WoL, it could be it is kept powered even
> when 'turned off'.
>
> After a cold boot, see if the 7.4-rc3 boots correctly. That is what we
> are mostly interested in.

I forgot to mention that I did that before sending the mail. I just did 
it again and left it disconnected for 5 minutes, just to be sure.

The link came up again without issue.


     Frits


