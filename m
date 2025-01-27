Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB488166F3D
	for <regressions@lists.linux.dev>; Mon, 27 Jan 2025 16:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737996548; cv=none; b=IAkk6b3Zd4549qCqoAuCwBjnyHLQF5JyrINhfPogtDclr02G2/ejHEtdFIbIt0oulC2EfnxSUXqRbPsJXVR7SB9PJ9+g4zIc+vCfoHdHm+2OgVnHjqWh8430ZC5+0d6ykB/Otsg/zGorVd4+9MfxSTk4u9pxjH+SS2HSudR3Uak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737996548; c=relaxed/simple;
	bh=CP4nMDiVLFzgAGi8GSRGavI5/vsdfGJ85kCyOK0WRsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbDuzv6WH4cAy6SXM26UgFx+7ohlO5TH6VrJycUzg+7ObJHLvRqi4PfPlYkMLjmtBkiq4h2O67nrdLNYkNr2N3dBOGAr+WGIg9Z/4+s7TgCQrhfupFuvmE+gefcNy5WmGDY2XU+RZPpHGmBXGV14R1/Hf0F47F42RmbF4nKnac0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+s8/YN9; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+s8/YN9"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5da12292b67so7716761a12.3
        for <regressions@lists.linux.dev>; Mon, 27 Jan 2025 08:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737996544; x=1738601344; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IRe+637ZNHriFl6/Rd/SrwbaBSpfvoTT2o0kmRNpJcI=;
        b=N+s8/YN9gOykSf/gJshzSuDWel/0UTvJP+cyLVJPdSrHIJBQVrrK9jha1xm4KvfAcQ
         Hc56igMeRkrMomndnpm9LOSil1sdafklPm9xnVT8Cjv0wqnZ/UXyOEjMbqdech57HQvJ
         3sgzbqdCZtCbaCgG2FDWo7WhRgBUX4mw3aNo6IlRbLLgaeosVlHBPw2E5x/ZiUpd+7Pr
         oZ+Pd5mY3S0vUwy7xU0gtH1XIByq4skn9QDBd9l6KAWFHKZRjZcg5LA0rPHwRDBqjdlq
         lWy21zVGLJJzmTjUiE+BxATlpEXDfFYgY0qzh9zKu8lj9v8gf4t+GI9z0w1fp5iKtQvs
         9JnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737996544; x=1738601344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IRe+637ZNHriFl6/Rd/SrwbaBSpfvoTT2o0kmRNpJcI=;
        b=O1iG5x3BmLZOw2RZbndtORV1YqDGPuoG/3OEKe+xzpg5rWj5C5lYPejc73VQRq0D7l
         UofYlm9U3EvytTum9IHmKr2IAR2/8mgyffrrdJQvdrThETVXT+U5t6aPqlzW3bFmy6gu
         /VgbeP48u8KVvv7yPP6GKfZfbRhu9vTIeoPK1q6rEBew7m11KvtxeZIxp2PSjBrQY3w5
         BX2dRdQ3V8s1RMhHIRkfVGsjuBYEZGUp0TujsgZQLqk9Uet1+q9PPOpFXWzVnIWOmGUK
         o+fv7XunzrkZv3U16FHDjnRmUA90ImkILegJmY1f7Jq/oi+UUzC4HlM4A4s9Aw3Bq18L
         C27Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGHHln7484A5Hb83UeB49cvqtb9WLZFz84sakSWPtFh1+FCUv/Qg3SMGrUYhgTiIVeNDNtYirhvmIMwA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3GUk7Sw+DifzrMBis1lxWnOJbCEqLV2ptTn8MW7G+bDpapNvE
	NQoxm+gAiFWkC9VGKOqOQDfqdtdk7GGLltPB84EARV+qlPCuJZ1X
X-Gm-Gg: ASbGncu1dXSyh7cLRrSfoqDbifh+1yVdGCJ/AzbsZpKXurfaeUIligiUOw80+Xd0EBv
	Oxl6Jp5AJ7LnGjGUtoSPwIxYbVZ8/oz+UNukPvUVSgu2fSCKNPX70LuMD8BThDy5A2q0S0wtLKn
	xk5vSISEmWpQW2yqjqLD1tbhPy/gvAjJnkwZRx4bA6yP2CDG4YiBMmGXkCbMCivwMQOQcvR8Mgi
	qDJiSULgUVDGvEVjA06kycnWCGJUEQ1p+RsnapjdwaFu+KMQbGmGa7WD5gqqECRzQdeJoH1dBze
	FHCqpItV0MMHUw==
X-Google-Smtp-Source: AGHT+IG9/ptK+rm2PinAsTT1t0HOwTwKdautVkiWPwuwkIqT3RwpHJCOzup4SQoT91pKvggDDJWOBw==
X-Received: by 2002:a05:6402:1ed1:b0:5db:f423:19cf with SMTP id 4fb4d7f45d1cf-5dbf4231ae1mr50265631a12.9.1737996543888;
        Mon, 27 Jan 2025 08:49:03 -0800 (PST)
Received: from [192.168.8.100] ([148.252.145.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc186285c6sm5733938a12.20.2025.01.27.08.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 08:49:03 -0800 (PST)
Message-ID: <117696e5-6649-4236-a06d-a860b29b3cba@gmail.com>
Date: Mon, 27 Jan 2025 16:49:26 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1093243: Upgrade to 6.1.123 kernel causes mariadb hangs
To: Xan Charbonnet <xan@charbonnet.com>, Jens Axboe <axboe@kernel.dk>,
 Salvatore Bonaccorso <carnil@debian.org>
Cc: 1093243@bugs.debian.org, Bernhard Schmidt <berni@debian.org>,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <173706089225.4380.9492796104667651797.reportbug@backup22.biblionix.com>
 <dde09d65-8912-47e4-a1bb-d198e0bf380b@charbonnet.com>
 <Z5KrQktoX4f2ysXI@eldamar.lan>
 <fa3b4143-f55d-4bd0-a87f-7014b0fad377@gmail.com>
 <Z5MkJ5sV-PK1m6_H@eldamar.lan>
 <a29ad9ab-15c2-4788-a839-009ca6fdd00f@gmail.com>
 <df3b4c93-ea70-4b66-9bb5-b5cf6193190e@charbonnet.com>
 <8af1733b-95a8-4ac9-b931-6a403f5b1652@gmail.com>
 <Z5P5FNVjn9dq5AYL@eldamar.lan>
 <13ba3fc4-eea3-48b1-8076-6089aaa978fb@kernel.dk>
 <a2f5ea66-7506-4256-b69c-a2d6c2f72eb4@charbonnet.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <a2f5ea66-7506-4256-b69c-a2d6c2f72eb4@charbonnet.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/26/25 22:48, Xan Charbonnet wrote:
> Since applying the final patch on Friday, I have seen no problems with either the backup snapshot or catching up with replication.  It sure seems like things are all fixed.  I haven't yet tried it on our production Galera cluster, but I expect to on Monday.

Great to hear that, thanks for the update. And I sent the fix,
hopefully it'll be merged for the nearest stable release.


> Here are Debian packages containing the modified kernel.  Use at your own risk of course.  Any feedback about how this works or doesn't work would be very helpful.
> 
> https://charbonnet.com/linux-image-6.1.0-29-with-proposed-1093243-fix_amd64.deb
> https://charbonnet.com/linux-image-6.1.0-30-with-proposed-1093243-fix_amd64.deb
> 
> 
> 
> 
> On 1/24/25 14:51, Jens Axboe wrote:
>> On 1/24/25 1:33 PM, Salvatore Bonaccorso wrote:
>>> Hi Pavel,
>>>
>>> On Fri, Jan 24, 2025 at 06:40:51PM +0000, Pavel Begunkov wrote:
>>>> On 1/24/25 16:30, Xan Charbonnet wrote:
>>>>> On 1/24/25 04:33, Pavel Begunkov wrote:
>>>>>> Thanks for narrowing it down. Xan, can you try this change please?
>>>>>> Waiters can miss wake ups without it, seems to match the description.
>>>>>>
>>>>>> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
>>>>>> index 9b58ba4616d40..e5a8ee944ef59 100644
>>>>>> --- a/io_uring/io_uring.c
>>>>>> +++ b/io_uring/io_uring.c
>>>>>> @@ -592,8 +592,10 @@ static inline void __io_cq_unlock_post_flush(struct io_ring_ctx *ctx)
>>>>>>         io_commit_cqring(ctx);
>>>>>>         spin_unlock(&ctx->completion_lock);
>>>>>>         io_commit_cqring_flush(ctx);
>>>>>> -    if (!(ctx->flags & IORING_SETUP_DEFER_TASKRUN))
>>>>>> +    if (!(ctx->flags & IORING_SETUP_DEFER_TASKRUN)) {
>>>>>> +        smp_mb();
>>>>>>             __io_cqring_wake(ctx);
>>>>>> +    }
>>>>>>     }
>>>>>>     void io_cq_unlock_post(struct io_ring_ctx *ctx)
>>>>>>
>>>>>
>>>>>
>>>>> Thanks Pavel!  Early results look very good for this change.  I'm now running 6.1.120 with your added smp_mb() call.  The backup process which had been quickly triggering the issue has been running longer than it ever did when it would ultimately fail.  So that's great!
>>>>>
>>>>> One sour note: overnight, replication hung on this machine, which is another failure that started happening with the jump from 6.1.119 to 6.1.123.  The machine was running 6.1.124 with the __io_cq_unlock_post_flush function removed completely.  That's the kernel we had celebrated yesterday for running the backup process successfully.
>>>>>
>>>>> So, we might have two separate issues to deal with, unfortunately.
>>>>
>>>> Possible, but it could also be a side effect of reverting the patch.
>>>> As usual, in most cases patches are ported either because they're
>>>> fixing sth or other fixes depend on it, and it's not yet apparent
>>>> to me what happened with this one.
>>>
>>> I researched bit the lists, and there was the inclusion request on the
>>> stable list itself. Looking into the io-uring list I found
>>> https://lore.kernel.org/io-uring/CADZouDRFJ9jtXHqkX-PTKeT=GxSwdMC42zEsAKR34psuG9tUMQ@mail.gmail.com/
>>> which I think was the trigger to later on include in fact the commit
>>> in 6.1.120.
>>
>> Yep indeed, was just looking for the backstory and that is why it got
>> backported. Just missed the fact that it should've been an
>> io_cqring_wake() rather than __io_cqring_wake()...
>>
> 

-- 
Pavel Begunkov

