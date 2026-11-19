Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.38.247.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079600;
	b=bNl8kS0I06t2BQN2Kz6zr6oReO6LkE02WZJoD5sAViFt7U8yh1GX/y7BIT38IwkstJdW
	 3gniDZBi75z1kJegB28ZCdlwLqlYxwH3d1tb2brA/BOBqNxed1MgokBJJ4cYGMpzLqqj4
	 vUuSagAS+ny3W6U0A4XNkoxVZLNspbdhyixeZM3RO3dsOM0CpSFQpA0cyjCSk48Swm7qR
	 dm7agxCEdGfQb6clPUXJdM1PwG4M/JIkiYd1PTQC4kZ5q9VBmYkqygOs9uka8ByOTTooP
	 mIvQjoRiKsAdU0HJhqXRK7IS6fP5JKYBagle8mY1X9sfVxQGG0KHYS+rRbGLk74SQEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079600;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=Uie7U3DSTOHVQoTFcDhYG1l7iMx3bLEQjVwiAlr7WMA=;
	b=vU4hXL2fcLz7FssmshPgE8fDtSB9OCRFa301x5qqmHbVjYRolbaWrgdfd7MiGOpbjfGj
	 us55Z2wug6dB/Qp8Tc27poc7Xjf4ckK8sm8n3vJlGbn2JOu8QNPtmz88GRkPTaEv69aEy
	 6UQO8j07ilsg14unWROFK07NLXCU0eZQAxC1WWiVPcSgQMzpXsp28Ve1tVzAvYVnWNnId
	 i3gobjcXxuzxDDbOWs7hMGeqH6Ylzm1Tn4aGIFjnqp2V4IzWtdlcj9dC9xv97biZXAq7d
	 IIJBFCTU5hmQwtPhLeIH7wayz+t7Lhkksopx0LiGNBsBSxaY492AZrzu1+nz4aFZjbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=bSjY8v9u;
	arc=none smtp.remote-ip=46.38.247.119
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34F9606A325
	for <regressions@lists.linux.dev>; Thu, 19 Nov 2026 09:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B34F9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=bSjY8v9u
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4jVXjm1ZVjz8ZgX
	for <regressions@lists.linux.dev>; Thu, 19 Nov 2026 10:10:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795079404;
	bh=Uie7U3DSTOHVQoTFcDhYG1l7iMx3bLEQjVwiAlr7WMA=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=bSjY8v9uQPRm1Y8togxdDXXl9rjrrrjGYE4geVF/4kWOIuHvmvaprBoIkRNEwUCfE
	 ahHa4Oxo6xNXVumd5CcCWpq49rBa3GWOohijeR2oWaPJnFPdB/CaOQfrv/59VY/HkO
	 DAErfxe12MJgusiQBNUUSmNutd7N3GmiYZ+n+kvwrP14wekQ5cbGrOwi27xlhkuiRT
	 CHDZ8oZSl0y4Yy/k/K9q/0t7ekcS8quKe9SJgW0HoVbdNcjCggD/RFxngM+COc2vOH
	 ee8T//kTO/vG6CHZJMZ7VaKLhKkakIO9sLsc68r59ZLjoMmbpJ8mngOOrsL2uLNhXU
	 MBrMg9X0M4cyA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4jVXjm0ttLz52SQ
	for <regressions@lists.linux.dev>; Thu, 19 Nov 2026 10:10:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.399
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jVXjk4ppKz8vJc
	for <regressions@lists.linux.dev>; Thu, 19 Nov 2026 10:10:02 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 9989B5F9ED
	for <regressions@lists.linux.dev>; Thu, 19 Nov 2026 10:09:52 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <01cfebba-eeaa-4d68-bd42-1f32e8ed6cee@leemhuis.info>
Date: Thu, 19 Nov 2026 10:09:51 +0100
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
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179507939281.272066.4238548272596672877@mxe9fb.netcup.net>
X-NC-CID: huvZpaCIQCWjaNPZbDaat26PEuPiI0czYpFC4/OQ1Mg4+bzn9wM=

On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.
#regzbot report:
https://lore.kernel.org/all/CANiDSCuX1%2BehTGN%3DHNuLL9YBTt8tUw6fJ2D1JqfePQGaz%2BQOzA@mail.gmail.com/
#regzbot fix: media: uvcvideo: Undup use uvc_endpoint_max_bpi() code

#regzbot report:
https://lore.kernel.org/all/CAFd_G9guhtVwE1aaFOXE3Ab43BAcwP3RBT%3DR_SdZ2KDfXB%3DLeQ@mail.gmail.com/
#regzbot introduced: 0cc00de3dd5b
#regzbot title: ASoC: rt5677: RT5677 codec repeatedly fails probe

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/6111
#regzbot introduced: 7b0cc3085216
#regzbot title: drm/amdgpu: eDP backlight has no effect

#regzbot report:
https://lore.kernel.org/stable/729A37E1-250D-469B-B89D-E24DFA4CABE6@beerstra.org/
#regzbot dup:
https://lore.kernel.org/stable/8C195BCD-0939-4BE9-B910-3C57A5977984@beerstra.org/

#regzbot report:
https://lore.kernel.org/lkml/637294860202304203756989.6100.2026119193410@darioackermann.ch/
#regzbot dup:
https://lore.kernel.org/lkml/581128204058725416570264.8152.2026119193410@darioackermann.ch/

#regzbot report:
https://lore.kernel.org/linux-input/CAMX8SmaXHh-dzH2n6pRhQr8q=iN=Ui7T3TC42e35LBUjvMaH1Q@mail.gmail.com/
#regzbot introduced: 042aad8d0db6
#regzbot fix: xhci: give back TDs and clean up ep0 after disconnect

#regzbot report:
https://lore.kernel.org/lkml/20260930144650.3701516-1-stefan.roese@mailbox.org/
#regzbot resolve: inconclusive: lack of feedback

#regzbot report:
https://lore.kernel.org/dri-devel/0102019fba65882f-45046e0b-9860-445f-a179-c6a1d2acfd1c-000000@eu-west-1.amazonses.com/
#regzbot resolve: inconclusive: lack of feedback

