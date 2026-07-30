Received: from mail-oa2-f1.google.com (mail-oa2-f1.google.com [74.125.231.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6BE43E06E
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 14:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422062; cv=none; b=J9NAXIikBSITO3ZXDoX10AFiFdaOsDaRgs8dQgvSHX9GYlFT0YRECoPTvVDdMExCOz9e1wuysGUNsvpaXedDpI78PW4AsVwo3eas4pvrGQzwMZWPQ1R9hShbRr/at6z62GhPwPbxkVghlq+0untnZMvoCzYHfy3i7FqSAWBOf/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422062; c=relaxed/simple;
	bh=TB9COi3LZwqdeW20gV3IacB42nQh2XS8QzExjKq/IG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bEwnBhHhk9XM6lKDZSzsyYRm9sGhw+yUJzTvm+bZhC7fT+BJvoCZvZX+FbBkN4k7WVfTiaaUTaDE2Z/So5a9nwGy+sjnyatJD/xJV7SR+JnlfkqONl26muN4tdBk77FqXcKls1EjO7UG6ElnY0jeU4yfRzFmx/z89fMj/ImTZuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=k36Z9yJ5; arc=none smtp.client-ip=74.125.231.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="k36Z9yJ5"
Received: by mail-oa2-f1.google.com with SMTP id 586e51a60fabf-4489b7aa0e7so244631fac.1
        for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785422057; x=1786026857; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sL74mQw0WBxRoWRghx17Ng3Z07+sXaKozIlj/fsplB0=;
        b=k36Z9yJ5gvrAJpFJ1hUHK2mNO2FGTtbGZ3pQXgQ1p5DPhnQVChvhJ8du47zXM7NO3V
         pqO7hCseQOUPZ2w2BkZf8xW97Hz21vFhavJiw1feh8/BCPt9MjOTq/aJjwlNwaIFUwGW
         25qNPgQEUfYnpzv7EgCaX+Pcv4jAwolDpjTWlxCUsInhNcfCHau2pfJE0w2QGI62jIpl
         WYv69F89ZAqARSpBCNW2WIJGBp3gJ/z4Qabm6e+6kpQBopFklY8qBPE1Cf0Q6cAaSbOa
         zFmtvlkys3NMjIWEOuW5cIEoMpju09LB+OIQruc+c91cEeC/nWu62w8hilwN5S9kegxW
         O65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785422057; x=1786026857;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sL74mQw0WBxRoWRghx17Ng3Z07+sXaKozIlj/fsplB0=;
        b=PNFNfGfkO+oZMwjE+ypRfk/xz51CFWpd5zDTioi4wsU0HgXffqSdw0/SxKYCX3V07h
         4htD1RgcRb2asOMSQkzEB2xZyngNQ5kok928zjroUDxilD6hgFRNjdBAy0r+fGuEUUu9
         iDlYpUqBhspMjgWemD78W4SYJl/eDfWGCfgivU5p6IDUSizSsTzFpSY2VaA5sYR56sH6
         6CXdaPdNcVuFDhMo/NkSSISvGQE6NIXOnCHVn88DfzALpreizOOvc4WlZl+UOe5cBbJL
         ulo4mdM+wdbgJs3Jz0C13gjtGXR1ZU6Ffbl9F/aaeNHRhXsUcw5CzAXbNwXIGFV2eWqx
         celg==
X-Forwarded-Encrypted: i=1; AHgh+RpDUxnGF3Jm2Rzd+LKzmfd/9SmVAL9kK4CP5NssbLbBPbO12zYUQGGbXGx9GE/SheWhlP20KHzjCBqhtA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyumZUFlhHLOvgRCCYmPlnHEnCcR/ojemZ0EkUFrFRCOhsLMpg
	AfLbEo5N3VrkIVllMVU/L3J8bFgaWM+rjgUHweWSjAFHNo2uSc5SSzmAEYVllVDdcD4=
X-Gm-Gg: AR+sD11vafrbp5mqk84xZE1HhLwk0a2EYsxoDtN/SzPle8C8BEHvHMW/IFTuBJX1dkT
	0kKgdGhH+1RSp7XwbktFSLlLg7RdYpYvOLmneCsFIbX8iReC8PzV2agPoIvyQ093Nui5Nqq/TZI
	7YitQiNQayXnvB5Nfj7l9/+DKThYGhoJK68IU95IyqrkMJDx7bx5dGwycdLJyGr6tqSeDeYym9i
	SuIOkdozls51UeiUWG8A/L4U25wwg8+aVkY4zv2jzDQgmyFpOHEdEIs+gOCoYMCF24KIPXeUR7I
	YaLNCr8+7pPB3Luc2j/aWVnCK9G05KKjCOtagzpUUAIl5ElhKQzmNCjJY7+oAINP+dV5bV0IgZn
	iWSVmXLjG2Yly/Yfczd7Io14blRbypokEJirMQfMGP0/T+KeDUcuQgWHqR9U6Lq44YA1lFjdaHX
	S7bGs540NqIp9Tmd7tsqEB9t0oqNzRgQS0Q7wSbr183qOpOHQ7S3aZFDwSMlvlgtVg+asBT7u8z
	BBqCn5twfnEbQGskQzzoQmVf3iU55IZKHnBwA6wQzpMFp5wXOKN94gk
X-Received: by 2002:a05:6808:159a:b0:492:9e13:d5a7 with SMTP id 5614622812f47-4ad876c9e1amr2001691b6e.6.1785422057412;
        Thu, 30 Jul 2026 07:34:17 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ecb8040sm4033444b6e.1.2026.07.30.07.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 07:34:16 -0700 (PDT)
Message-ID: <e679211f-f036-4cd4-887a-430aa9376fc1@kernel.dk>
Date: Thu, 30 Jul 2026 08:34:15 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] io_uring/futex: scalar wait/wake slowdown after
 079afb081c42
To: Chengfeng Lin <lin2530632123@gmail.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, Robert Morris
 <rtm@csail.mit.edu>, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <CANGjgdn=R_qyUdE=j9za+vkmqcxacbP-84OHXF4nZ4ho9qRyVg@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CANGjgdn=R_qyUdE=j9za+vkmqcxacbP-84OHXF4nZ4ho9qRyVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/30/26 4:42 AM, Chengfeng Lin wrote:
> Hi Jens,
> 
> I tested 079afb081c42 against its direct parent on bare metal. In a narrow
> scalar io_uring futex wait/wake workload, the child was 9.27% slower. A
> separate 338-line standalone reproduced the result at 10.02%. All compared
> kernels actually ran with preempt=full.
> 
> #regzbot introduced: 079afb081c4288e94d5e4223d3eb6306d853c68b
> #regzbot title: io_uring scalar futex wait/wake slowdown
> 
> This is a focused synthetic microbenchmark, not an application benchmark. It
> uses one raw-UAPI ring and 32 cacheline-separated private futex words on one
> pinned P-core. Each timed cycle submits 32 scalar IORING_OP_FUTEX_WAIT
> requests, then 32 scalar IORING_OP_FUTEX_WAKE requests, and drains exactly 64
> CQEs. Every wait must return 0 and every wake must return 1.
> 
> I used a fresh boot for each point:
> 
>   6a8118a77eec parent A -> 079afb081c42 child -> 6a8118a77eec parent B
> 
> Each point had 3 warm-up rounds and 15 measured rounds. Every measured round
> ran 512 cycles, or 16,384 wait/wake pairs. The results in ns/pair were:
> 
>   implementation   parent A    child    parent B    child vs midpoint
>   formal              180.079  196.647     179.856        +9.268%
>   standalone          180.171  197.856     179.502       +10.020%
> 
> For the formal source, dropping the first measured round gave +9.269%. Parent
> drift was -0.124%, and the maximum CV was 0.169%. The standalone drop-first
> result was +9.996%, with -0.371% parent drift. All 90 scalar timing rows
> passed the CQE, result, timeout, overflow, outstanding-request, and CPU
> checks.
> 
> An untimed child trace also hit io_futex_prep(), io_futex_wait(),
> io_futex_wake(), and io_futex_complete() with the expected request counts.
> 
> A matched WAITV -> WAKE profile changed by only +1.385%, below my preregistered
> 5% signal gate, so my claim is limited to scalar wait/wake.
> 
> I understand that 079afb fixes the exit-time use-after-free by keeping pending
> private futex waits visible to cancellation before their mm state disappears.
> Scalar WAIT and WAKE both use io_futex_prep(), so in the child both sides of
> each measured pair execute the added tracking call. I am not suggesting a
> revert.
> 
> Is this per-request cost an expected trade-off for the lifetime fix, or could
> the same exit/mm-lifetime guarantee be retained with cheaper tracking?
> 
> Evidence bundle:
> 
>   https://github.com/lcf0399/linux-regression-evidence/tree/65c8cbf86f40cbe759e3f7db1d29d152ba03a8f2/io-uring-futex-inflight-wait-wake
> 
> Standalone reproducer:
> 
>   https://github.com/lcf0399/linux-regression-evidence/tree/65c8cbf86f40cbe759e3f7db1d29d152ba03a8f2/io-uring-futex-inflight-wait-wake/reproducer

Great report, thanks for that! I'll take a look at this. The inflight
tracking is a bit of a big hammer for sure for this, and it isn't even
needed on the wake side. Can you tell me what parameters you're using
for the reproducers?

-- 
Jens Axboe
