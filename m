Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ABA1D63D9
	for <regressions@lists.linux.dev>; Fri, 24 Jan 2025 20:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737751897; cv=none; b=Wq6aZeoUFB4Z1uEzoy+hxPBa7Ks7+nZMngTMMEYGey+XIW6r6jCXle7CjkYVqSduHhaPkT+4THhoyRh9weMzwEHexswMWL1mMIUaDHE6FuO0SIU6rkuFilY8LhI41YHXHlizmQYe3T7h6FiXX/mzg+37W2AwUEuktzmt/kKhqBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737751897; c=relaxed/simple;
	bh=KIdqUxQ/TeBsrZa+YNOxUuG6i684VFDu6KajdTLBNXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ti6vUqG7LYX+xJRNv+M6fkxlDcU1Y0M7xnzvQr6k6qJFMhvsYV8FqjrmSKa43jGu56+sJiPRBGjVN3vGBQa0WbYfz4XsPK7dWeiSYDhdeNRYRqF9M63IL4TUOyTFHdZZn+SWwqB7lHwwIhHlu4oaOQ/3MwtbzZ/pyYxRV6jjQuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=RJx/UPsg; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="RJx/UPsg"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-844e10ef3cfso191944339f.2
        for <regressions@lists.linux.dev>; Fri, 24 Jan 2025 12:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1737751894; x=1738356694; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=piCoSIefp0mhGxpiCOEP0Otj5ta/B/7ZE/GZR6dGe8k=;
        b=RJx/UPsgCKZTFIRed2AKDKd3SH0VrIC5Os2MKwp4byn9wXDnWO2dHeoe7z759mQTgu
         VTDlHmpvfuRS8pQEqrU6coaQwwHjeAg844PaZz5kZceEkapFnCk4EIqoprnTXdTgSFNg
         aTDCs6r1VKqd1Bfc9/mZPhhJER0dWfSkZfvekZQWoksRPzJb6b6GJxwXG3GRMTn0vX0Y
         XvnGe9yUNS0y1mloqlDSTqINki3wt5WOgTWxJTZ4Fz3Duti8qfdxpjz/cprCKot475Yv
         5LFVuhsk7QsLbRlwtl7EEJi7YVQNIbxTLs3wbcoKD6vhqirawT2fwD0C3we20iWYe6z2
         D1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737751894; x=1738356694;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=piCoSIefp0mhGxpiCOEP0Otj5ta/B/7ZE/GZR6dGe8k=;
        b=gVs8bihzeQnCbf3Wzp0wQca/93wp4Hcf5uEybBy8xVcZRAzSQGWo236x8uyitTNXWI
         +C2JPKyu/hfVGMEuZ7P7/o+UgJtRu4K8yfRP8RhiPikQmgXFq/ojysv8fqS7hilWobLf
         ep0/0Q7mX1V9I0+6sy+xYsRfwuRX2i332RdDVitjKvnoSv3Vfb2R13JSHkOKqYsn4JTE
         G/kQuDaER1QioBfNZfHN4m+wZ2DrK7r9yLDVRnrwkEwCv129Yl92302fCTl4lAvdxixS
         QZU08umhT/4WhaCMbM9mX6jMcMvTv9Iy540UUNTydzoLuV4Dx6GkjIDGAJ8gJfedKmLJ
         gfeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiFEb+D30LwqXWaoHzQmb0HVNQooniSLkL946vLT7gAB0pL36Mid//ZoEZ/uu8lbPwnkqpZ3OW2BK7SQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMD5pFQAopK/O6eWEUbQhXr62sXo00VtjvcjrS9SnmKbe7wYLA
	FatZV2PZVKq4fqHd9gMFoWSz4cHer4S2spt+nNDMw5S48xYAVQ3QoHzk/YhD2hU=
X-Gm-Gg: ASbGncvKQwDImpDO60UqnjoJtxfrPV+tCXr/lBgGBdHOCE0bdaSFqnejm8M4IvsyA1m
	crOHs4WdMHLifIsz3szeYrgdW//004zhLn7/3riRTVuITDDyxqEvwMYRiPIFQigyonUL3O73Z/r
	HYYpt6zYBtllMkuRz1SBluKp14uOA+jAGiu8V7TQAIJVAw9+/m0d4kFKZJRftGI+zITSGvntTmz
	5odAyl2tWU9P0kGZL8LxiCASOQBNtGxSdXrWP2VIcRiou5eiGXDup1qZMR/5CVHHSm8/tKflnm9
	eQ==
X-Google-Smtp-Source: AGHT+IFAQ2V0tUehGHsduBzV1CBK9BUXzGuNC88ilzYl7uiRcSbenuJl8iISOcgvGQGRcykqUgXddg==
X-Received: by 2002:a05:6602:6d8d:b0:841:8d66:8aea with SMTP id ca18e2360f4ac-851b617219bmr2503664939f.2.1737751894515;
        Fri, 24 Jan 2025 12:51:34 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec1da2db34sm849968173.36.2025.01.24.12.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 12:51:33 -0800 (PST)
Message-ID: <13ba3fc4-eea3-48b1-8076-6089aaa978fb@kernel.dk>
Date: Fri, 24 Jan 2025 13:51:33 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1093243: Upgrade to 6.1.123 kernel causes mariadb hangs
To: Salvatore Bonaccorso <carnil@debian.org>,
 Pavel Begunkov <asml.silence@gmail.com>
Cc: Xan Charbonnet <xan@charbonnet.com>, 1093243@bugs.debian.org,
 Bernhard Schmidt <berni@debian.org>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <173706089225.4380.9492796104667651797.reportbug@backup22.biblionix.com>
 <dde09d65-8912-47e4-a1bb-d198e0bf380b@charbonnet.com>
 <Z5KrQktoX4f2ysXI@eldamar.lan>
 <fa3b4143-f55d-4bd0-a87f-7014b0fad377@gmail.com>
 <Z5MkJ5sV-PK1m6_H@eldamar.lan>
 <a29ad9ab-15c2-4788-a839-009ca6fdd00f@gmail.com>
 <df3b4c93-ea70-4b66-9bb5-b5cf6193190e@charbonnet.com>
 <8af1733b-95a8-4ac9-b931-6a403f5b1652@gmail.com>
 <Z5P5FNVjn9dq5AYL@eldamar.lan>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <Z5P5FNVjn9dq5AYL@eldamar.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/24/25 1:33 PM, Salvatore Bonaccorso wrote:
> Hi Pavel,
> 
> On Fri, Jan 24, 2025 at 06:40:51PM +0000, Pavel Begunkov wrote:
>> On 1/24/25 16:30, Xan Charbonnet wrote:
>>> On 1/24/25 04:33, Pavel Begunkov wrote:
>>>> Thanks for narrowing it down. Xan, can you try this change please?
>>>> Waiters can miss wake ups without it, seems to match the description.
>>>>
>>>> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
>>>> index 9b58ba4616d40..e5a8ee944ef59 100644
>>>> --- a/io_uring/io_uring.c
>>>> +++ b/io_uring/io_uring.c
>>>> @@ -592,8 +592,10 @@ static inline void __io_cq_unlock_post_flush(struct io_ring_ctx *ctx)
>>>>        io_commit_cqring(ctx);
>>>>        spin_unlock(&ctx->completion_lock);
>>>>        io_commit_cqring_flush(ctx);
>>>> -    if (!(ctx->flags & IORING_SETUP_DEFER_TASKRUN))
>>>> +    if (!(ctx->flags & IORING_SETUP_DEFER_TASKRUN)) {
>>>> +        smp_mb();
>>>>            __io_cqring_wake(ctx);
>>>> +    }
>>>>    }
>>>>    void io_cq_unlock_post(struct io_ring_ctx *ctx)
>>>>
>>>
>>>
>>> Thanks Pavel!  Early results look very good for this change.  I'm now running 6.1.120 with your added smp_mb() call.  The backup process which had been quickly triggering the issue has been running longer than it ever did when it would ultimately fail.  So that's great!
>>>
>>> One sour note: overnight, replication hung on this machine, which is another failure that started happening with the jump from 6.1.119 to 6.1.123.  The machine was running 6.1.124 with the __io_cq_unlock_post_flush function removed completely.  That's the kernel we had celebrated yesterday for running the backup process successfully.
>>>
>>> So, we might have two separate issues to deal with, unfortunately.
>>
>> Possible, but it could also be a side effect of reverting the patch.
>> As usual, in most cases patches are ported either because they're
>> fixing sth or other fixes depend on it, and it's not yet apparent
>> to me what happened with this one.
> 
> I researched bit the lists, and there was the inclusion request on the
> stable list itself. Looking into the io-uring list I found
> https://lore.kernel.org/io-uring/CADZouDRFJ9jtXHqkX-PTKeT=GxSwdMC42zEsAKR34psuG9tUMQ@mail.gmail.com/
> which I think was the trigger to later on include in fact the commit
> in 6.1.120. 

Yep indeed, was just looking for the backstory and that is why it got
backported. Just missed the fact that it should've been an
io_cqring_wake() rather than __io_cqring_wake()...

-- 
Jens Axboe
