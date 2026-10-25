Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792964871;
	b=nsvUbt4iJbxxPa1CrywvheFlxSy+HG/tdganZlPMPiQ8ITZ+KoxOJ0fQQxKUolq1VZue
	 l2JCca/8mV73ssvMSL7zfFEjqTMbrVPwq0wHGwIODyb76iXNjQX8e+EDZ4hZMcDb4lmWS
	 q6HsKJ7Sy/fxcfkpiu1hIVTyc4dpIZ1a+8+AA7gi/HA/v7TFD/aUaELGciTiAovorTl2B
	 s2COidBtwtEIjEvvi0dx8kiFWXvfz3xew6M8Z23N1YPH7K/n7hSndKzxe4jdiqfMtUCfl
	 LnU6qrTgAnd1hfLiSGaQuIyEeG+7D7lRrMhD9dOfA5PI1ADacA4n6TpyXTXE46uLcaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792964871;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=lK7VOsx+Vp8IVSGkK2SMNsDU/gs393bwgE4b+y6VKL8=;
	b=wVqocHmPeUR5ym7cWAeMKrb/yeSr/m69ma1RWn5pC2Kxxci4JaeKBqQ0iKAuE3kC5DNu
	 nT67hJR7RkirBKmm6YT96VLA84LyZEYe+hYe0to5OGuzbQRuYKeuf+kV2h6q45UmdozOG
	 Jd7Q5vy9ybPDwPZvLtzTOo06vW2agI8A3MKvAL3Votv4XiXAZJPfRpD0bq95dH2rMCzjI
	 UDmTiZCUfeinxFnVx6ZO/GGtwK+FgYCTGIDQBhAXJ0rke5oVHWDadJvyB7pNcTud8wl4Z
	 gLHJagNhFX6o1HBu/laABvv+UrycRkEvUO1qx/ZOqySce5fOzVihrlBo90sphKaj67Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GaUI7D5o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F98D606A325;
	Sun, 25 Oct 2026 21:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GaUI7D5o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B131F01829;
	Sun, 25 Oct 2026 21:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792964870;
	bh=lK7VOsx+Vp8IVSGkK2SMNsDU/gs393bwgE4b+y6VKL8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=GaUI7D5od9Sh/neziuU8fXdR+AJMSaT2EzfrOOD9kRIUAqJEBiADi28/hT3jS/Te/
	 6ZJJds4G/jWJT8UYezV0GuV3HSI86RufleHJZx4C8IyAMxHQbmWwrdNwsdDvAqVe11
	 BnbkzIkUi1s5AwuyB2c52yupVEeWtWEph6Fp9VT/sV1iNETpiMgBpcEdOWqWxvik+s
	 s29aXDCQ3z2ofacA/Wks52V9VI8UtJ3Mu5U26XC5H+MRqcmJuaqrWuZYNw0nUKTc+F
	 uRldwSEXkwmKf04ZsDhd7wwXc85IpW9HRpUABfcJz01r+jM5/72Jc4KwP7/KNpWVFM
	 Lvt34rmUQ97AA==
From: Thomas Gleixner <tglx@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Miroslav Lichvar <mlichvar@redhat.com>, Jiri Wiesner <jwiesner@suse.de>,
 Daniel J Blueman <daniel@quora.org>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] clocksource: delayed watchdog can mark TSC unstable
In-Reply-To: <atmhdRzqx5t8PYrc@gmail.com>
References: <20261010065509.72916-1-kmehltretter@gmail.com>
 <87a4oeerwm.ffs@fw13> <atmhdRzqx5t8PYrc@gmail.com>
Date: Sun, 25 Oct 2026 22:47:47 +0100
Message-ID: <874ie9zc3g.ffs@fw13>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Oct 22 2026 at 07:43, Karl Mehltretter wrote:
> On Thu, Oct 15, 2026 at 08:32:25PM +0100, Thomas Gleixner wrote:
>> I did not think about that scenario obvioulsy. The code is resilient
>> against long intervals between two measurements, so the easy and
>> straight forward fix is indeed what you (or the LLM) suggested.
>> 
>> Thanks,
>> 
>>         tglx
>> ---
>> --- a/kernel/time/clocksource.c
>> +++ b/kernel/time/clocksource.c
>> @@ -673,7 +673,7 @@ static void clocksource_watchdog(struct
>>  
>>  	/* Could have been rearmed by a stop/start cycle */
>>  	if (!timer_pending(&watchdog_timer)) {
>> -		watchdog_timer.expires += WATCHDOG_INTERVAL;
>> +		watchdog_timer.expires = jiffies + WATCHDOG_INTERVAL;
>>  		add_timer_local(&watchdog_timer);
>>  	}
>>  }
>
> Yes, I tested this change on v7.3-rc5 (72d3fcf802c4)
>
>                               baseline   patched
> TSC marked unstable           2/3 boots  0/3 boots
> watchdog gaps below 250 ms    3/3 boots  0/3 boots
> minimum traced gap            0.231 ms   505.484 ms
>
> Each boot had four QEMU TCG vCPUs. I used PTRACE_ATTACH to
> stop only the vCPU 0 TCG thread for 800 ms.

Care to send a formal patch? After all you decoded the problem and
suggested the fix. So you should get the credit for it not me.

Thanks,

        tglx
