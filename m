Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE22A38910F
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 16:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428602; cv=none; b=HoNZuay1aCSNBJP3NXHo+IKrL2L0Z9GBIHhbokDta7Xs+D0t3/ptOJsTlS9c+TFOz3ZgqTb726qVYj42IjTypFONgE4igkuhaWKLlV6Es1PM+Z8gkoa4EJHHo8ZnLvzLr3y05gMhgUt6hdLvVOyY7e3hszzZqjXB19YsxU+1UxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428602; c=relaxed/simple;
	bh=JBBl12W5jAO3f1NQO9V6kLXpVGsPmJIXGnmgZPy1WWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jhGqGPDj9d0uTCT1XLVmONVf7pPAqwSYIbGh788HNeG/Fur2Mp3Lk4agVi832ZgSJ2lTA1+Pi+OiqNCPf8Z0g4jqKwz1Z0lQz40tDnBERbDcSOUWPuVgHwmCXSZngY/rwSxZJMp9jagwj7BRdpRrRTAetBlp4zOs6MaUwMEBw2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=ZDrVixqe; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="ZDrVixqe"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4ab70b882c5so28529b6e.2
        for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 09:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785428600; x=1786033400; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+2vuxkBUmVJ6H+F0FBU1KBLH+mojm8weuh8i8FR4JAI=;
        b=ZDrVixqet6NAOMRWHYoAmF4CrUOQhf2Ilk2GfjJrZXqqnGt0zs+NtgV5Yxhb5HH96j
         0gXo6Ld5CnvvdG2Vb3o0w8Xtet6ohGq2bQM6MiTaeua+UGCD2ieCQ0UfRvfMcQVxStgW
         DGt2mqWLJHytSblwqC+a5U3DqpvByesW9lnS5bl2Uq3/E1ayAoV6AIbh9AXxRUGIYqwZ
         J9f3PH584XQVYAEraGBnVLlX8hs//K/tOxOaXjzXJzR5ZnnJjqD2p7bxAef8g0RHKUeY
         CgPCP7SqHFhyrikWk+nJtUoNMCux76CTcvhSAcoE9kBgxi8Te58yx6to2lh9Ceue9q+J
         qdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428600; x=1786033400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2vuxkBUmVJ6H+F0FBU1KBLH+mojm8weuh8i8FR4JAI=;
        b=mqpNRVFSqY6YqEtczF9Y4FcZ5QmjjmgJWW7Bw3oiYiPwWzimfvbIPymFj3LCCaj4mJ
         JyraNGflzCWYB+mazNakFJ/f4sSZU3RpAoubNTtYzde+VNhB3oNEFojWOefPgo00oF4b
         NoCtHWugjVr9mIFAJ4PoRQH2efWUGl2LQIqomIl3SI33+POcBkI7hC8KJ98uLIt2K6SE
         0eL3cZMLXu6PNYTkHEs8MvdDiQYNbOjGW6g7aVQpTYPLD3rtM/6us+4u0gk5SbT9Rfyp
         X4mVP+/ZYbh2+ZQyzYoW3PclfHBC2t6pKf0+KuhWy9gBNRpEoniIu94uQZw9ozvsbN0n
         XO0A==
X-Forwarded-Encrypted: i=1; AHgh+RoR9MMdfbtHC8t4zzDxvbmSsGpv/k5R5qnXbQbOENXNtsa1M8Hkq4gB9DQrEtsGkZKj78d2hK1PT7TAHw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt1ImCwjepm2eWGZQq753MnLBKmiTz0ZO6tiAFFUdEt2MQPvxX
	cJw31SiCQ2pEorxOCy9E8rScU0a4vrtTwfC4n2BgYPUN6u2/0KvILC0qtifvBEq/IME=
X-Gm-Gg: AR+sD119ZZFclpZ5Gj+3vz/z2RAnhy58AYqS9mei6I6VAU6uvlppZhkr8YEySm3QQv0
	AXGU4eOkfPnJWI3Qazg/exy/6A84Bu8cNsp3aFnpKi4vtZaBHieYk1NUPtphxj6Ysr9P7FrzZ9T
	HGXnpKveQhNYw0TVfZfDqmVLpA1Fe6ByjlhgaHyuxcN9auvbPi5rd5MXK/iaFosUyyF1CtNnLUq
	NjZgZ+4AF8C7oShhOU98AEg7vrv9nqb4mkPywFkBemcN+PMqpOw9nsV0bEV+UPnc9sk1W0VG0rC
	iVltapJNniaZz/7i0N8Xi7YPAwMgWZ8YzEsagPsFnV+Q66u7JgEeeSx00wqvnSCkt20t/Ufdrpl
	VRGEtxp/2eqBmUNz3ULNWpdX9ZSkGWcL5CHKl6S/+hYFwtTWGT6SvEZRZOqS/IxHaY4kWdhjpmh
	w7/FN2gHt4sy5k47e++Yq745rXQawWi61rO5NT50osQ/XrdmvrV3JZ6gA10CqJhU+t6l0VSlafK
	qzKrb8WDRMh0+jEDjtLFkLJzXdh04aOx7XH6yiIgCUZow==
X-Received: by 2002:a05:6808:1246:b0:4a4:e11c:7b56 with SMTP id 5614622812f47-4ad87782f6amr2123750b6e.8.1785428599570;
        Thu, 30 Jul 2026 09:23:19 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ef595cfsm4494333b6e.10.2026.07.30.09.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:23:18 -0700 (PDT)
Message-ID: <bd7249ff-d0a6-4a3b-8aec-3b5325f24b08@kernel.dk>
Date: Thu, 30 Jul 2026 10:23:17 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 0/5] block: validate direct I/O memory alignment
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Keith Busch <kbusch@meta.com>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@lists.linux.dev, brauner@kernel.org,
 djwong@kernel.org, viro@zeniv.linux.org.uk, regressions@lists.linux.dev,
 torvalds@linux-foundation.org
References: <20260720201057.1862857-1-kbusch@meta.com>
 <ampRQyXDbGgeg49V@kbusch-mbp>
 <fbe9e74d-c389-46f4-9874-3e9ffd9c91d3@kernel.dk>
 <ampce7mxSmxAwAiu@kbusch-mbp> <20260730112626.GA24827@lst.de>
 <00104e90-48b8-4419-90c4-ac0c4a2e1c44@leemhuis.info>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <00104e90-48b8-4419-90c4-ac0c4a2e1c44@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/30/26 7:25 AM, Thorsten Leemhuis wrote:
> On 7/30/26 13:26, Christoph Hellwig wrote:
>> On Wed, Jul 29, 2026 at 02:03:07PM -0600, Keith Busch wrote:
>>>>> Hi Jens, have you had a chance to look at this one yet? This addresses
>>>>> previous issues with certain device mappers under direct io.
>>>>
>>>> I they look fine, but at this point we should toss them into 7.3. Yes
>>>> I know there are regressions around this, but from 6.1x days. And the
>>>> series doesn't apply to the current block-7.2 anyway.
>>>
>>> This series is kind of old at this point, but yes, it's not fixing a new
>>> regression either. I'm okay if this goes to the next window, and I will
>>> handle the stable follow-up.
>>
>> Honestly, I think that'a a reall bad idea.  This is a regression in 6.18,
>> and while it took a while for people to hit this with their a little
>> more complicated lvm/md setups, it has stopped real systems from being
>> used.  We need to fix this ASAP.
> Thx for this, as I had been thinking along the same lines already and
> was still considering if I wanted to speak up.
> 
> 6.18 still qualifies as recent in my book, but YMMV. And it's not like
> people "took forever to notice"[1], as they reported this for a while
> now -- and there were a few attempts to fix this; it just took us some
> time to see the full problem (@Keith: many thx for that and the fixes
> for them). And some of the linked reports are quite recent, so people
> really hit this.
> 
> Sure, as always there is the risk that this will cause other, bigger
> regressions. Maybe that's why it's one of those situations where the
> right approach is "submit this separately to Linus and let him decide",
> unless of course he speaks up here.

Sorry that's nonsense, because how is Linus going to make that call if
we can't. It's on us/me to make that call. We're not first-timers around
here, we've been around and know how to make the call that we can stand
by.

-- 
Jens Axboe
