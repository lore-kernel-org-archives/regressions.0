Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.80.171.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024685;
	b=dQg2UyqwudQ+wf8sh8zvCj7VoixPiKVzqUh+ZVR03a0cbE3fZUbhPqCwKrusIuNfGsAE
	 QVRSXOyRBzayAn7aEDgtl1UamzwslWcNKvm03lO+EWnteQhnafxVeZVAOOBU9YXtaAKM+
	 7Yc4Gc4W1WXgXp9PceGmMzsxaPumNk1rc2GRX0xOGcFQ3JkFBrUyIeVfnvWb9lE395OA1
	 9IiOo93l5119rgbJ7QXBnEY7ekTm9xzWOICIpOkfXJWo0H0UAwnNlTnTgAZpNQNPJLhSV
	 5LXpIlwCKBcMSHKi7/6lTMZB+IJbSjenRYiGPZ+xVtUy6MIpQii11KyUL5gKifyuODA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024685;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=RGDLIgYtKGzTxHwh4JIzPb3Di1bl+x0qfKrKZD0RCL8=;
	b=gnUwoSV9o8OBPGMt8xRNb1JaEyMAs079C7PqLs9vbZmOjuKXQVEMwccCPFp5YlQj4t1w
	 xOAOMtE9HcUB0kBRawumGKHlSHZQtqLH5k2mREqzMvSAWoaC/6eZQ9OFsetN/MIhJbUCi
	 XAD9yhw6djIgzJOg2/9JNvCEhkxDY1lC9E1bKa12mOOWWT8vCu/VCm6AyTL7dcIQmFIqd
	 xLyXG4MiRqPc520tfS+n60MqfL1+ZDl+FpQflFBCqfP+Y076Wp9b4qPogVv0UElw099Uk
	 94BoW7ftqOEW2nsVfIKpYElPGPZuCVUprbAeHZBBZciLGeVZEIudtM1RNzG/mLMEIEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=letteboer.com;
	spf=pass smtp.mailfrom=letteboer.com;
	dkim=pass header.d=letteboer.com header.i=@letteboer.com header.a=rsa-sha256 header.s=dkim header.b=LquxNC90;
	arc=none smtp.remote-ip=45.80.171.131
Received: from albissimus.dikhoed.net (albissimus.dikhoed.net [45.80.171.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7D1606A31C
	for <regressions@lists.linux.dev>; Wed, 18 Nov 2026 17:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F7D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=letteboer.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=letteboer.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=letteboer.com header.i=@letteboer.com header.a=rsa-sha256 header.s=dkim header.b=LquxNC90
Received: from [IPV6:2a10:3781:39b5:1::134] (graver.dikhoed.net [IPv6:2a10:3781:39b5:1::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by albissimus.dikhoed.net (Postfix) with ESMTPSA id 7755DD294E0;
	Wed, 18 Nov 2026 18:58:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=letteboer.com;
	s=dkim; t=1795024682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RGDLIgYtKGzTxHwh4JIzPb3Di1bl+x0qfKrKZD0RCL8=;
	b=LquxNC900FUQ2D6dMFxo9uOJHf95UcyVUuQieqTjQPGUPi+BeMvrN+L4e+thxI5dI5EMZt
	RqJHyuSeJSeET6/+7ytajlWtcj6hs5hruLZ70YfJUAPZpUE/nX490G/Xtsg4C6hjmXV52d
	AAkU8kwQbwKLTTmk2IdHPKrSN9k+w2o=
Message-ID: <75638763-689b-45f3-b8dd-72f74c4dea3a@letteboer.com>
Date: Wed, 18 Nov 2026 18:58:02 +0100
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
Content-Language: en-US
From: Frits Letteboer <frits@letteboer.com>
In-Reply-To: <bb775cfb-525b-4471-bc80-46bb9f98cc31@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18/11/2026 16:32, Andrew Lunn wrote:
> On Wed, Nov 18, 2026 at 04:18:41PM +0100, Frits Letteboer wrote:
>> Hi Heiner,
>>
>> Between Linux 7.3 and 7.4-rc3, my Realtek RTL8127A (XID 6c9) SFP+ NIC
>> stopped establishing a link and generating interrupts under r8169.
> Can you do a git bisect? Find out which patch broken it?
>
Thank you for your reply.


I was going to bisect, however it seems after loading the out-of-tree 
r8127 driver,, the link now comes up reliably, even with the r8169 
driver. I am thoroughly confused.

Though it seems we still aren't out of the woods yet with the WATCHDOG 
timeouts. After about 30 minutes uptime, these are the only 2 occurrences:

-----

[    3.818915] r8169 0000:0a:00.0: enabling device (0000 -> 0003)
[    3.826994] r8169 0000:0a:00.0 eth1: RTL8127A, 8c:a6:82:71:89:12, XID 
6c9, IRQ 152 (32 total)
[    3.826997] r8169 0000:0a:00.0 eth1: jumbo features [frames: 16362 
bytes, tx checksumming: ko]
[   18.535947] r8169 0000:0a:00.0 re0: renamed from eth1
[   39.126650] r8169 0000:0a:00.0 re0: configuring for inband/10gbase-r 
link mode
[   39.126794] r8169 0000:0a:00.0 re0: Link is Up - 10Gbps/Full - flow 
control off
[   41.671211] r8169 0000:0a:00.0: invalid VPD tag 0x00 (size 0) at 
offset 0; assume missing optional EEPROM
[  388.690611] r8169 0000:0a:00.0 re0: NETDEV WATCHDOG: CPU: 8: transmit 
queue 0 timed out 5776 ms
[  388.690624] r8169 0000:0a:00.0 re0: ASPM disabled on Tx timeout
[  393.703543] r8169 0000:0a:00.0 re0: NETDEV WATCHDOG: CPU: 2: transmit 
queue 0 timed out 5001 ms

---


Frits


