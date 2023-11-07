Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541DE2F840
	for <regressions@lists.linux.dev>; Tue,  7 Nov 2023 21:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="rUSq+/1w"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1cc28719cb0so11932295ad.0
        for <regressions@lists.linux.dev>; Tue, 07 Nov 2023 13:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699393601; x=1699998401; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KcdCQIzTczD14nspP0hdbG3rg5SeTQgZR0ZwIFQOzeM=;
        b=rUSq+/1wmxaQvLj6Qv5nZmquWLSuytgvL/+6gC2rVkPXk9cwHsV4brwkHN4ifaQzl5
         JFS/RQHlLAK+Cfu3vb8W4O6jmrx8umY0ZP84Q60xcmXkkv1f2Cq5GEmmoQOo6tamzqrA
         aQv8dq2gLLtsyW4BScnRUg1E0wUzLm0xFzgl1JZtXi7ZkDL8JAvmuV7TkPaE7V2Dx/aQ
         T1Hx2kchvLi+HfXQ1cYmtWYWHtyTUY80xi3gth6iAcko2fVAzyLAZW0/ZP9kmNnK2TEp
         P4HQmDfwfnq728Yyl3XMbybexrsGJ0pHku0wb4FajQl6M478Osc623la+8K/8AxiiN6q
         u7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699393601; x=1699998401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KcdCQIzTczD14nspP0hdbG3rg5SeTQgZR0ZwIFQOzeM=;
        b=b0nrglo1tF8u8rvDFHC/miQDYEQtoJ92Q8WWBxQWthTXgnxH8MGabMzkBD013NW5N5
         NY+QmwdXYm/HGevHxgju4tjs6TQFFD4cp4dICyrvNJZmhiutHaX/WQYNXCCZNAgotOzS
         hnIGoTb7/D/UroZ1UyYpN3JfMGN9DsGkIg060QoLOA4rLV9ZBVCW7hIbkvTW9yvX3bk7
         C1Z3V6hRWga4XAfxEV4h+JJlDMj07qhIODKCzWm9C1i+RNnM7oQQbaKhvujRsUMmEuhX
         LvXtHF750hr9KLjzJPc3hM3Onr19a9M0hlwC4GFvQb4BeiAJ6IGi/Mkb7PdRfCbdoZAC
         CC+g==
X-Gm-Message-State: AOJu0Yyp6AsddGUEN5Q905m57ZCTGI4c9P29nfdCNRE7Y4NbSDSveGTv
	gqG9qKUxKsZJvjvsR3LnqHj25g==
X-Google-Smtp-Source: AGHT+IH3/G2BnhHgF0pol5Oh+jzrBAg6Ggz065bPZrWKJiE8e3mLaWaB054W6QGOOjFgK2Ut13SQNw==
X-Received: by 2002:a17:902:e890:b0:1cc:3b88:78b with SMTP id w16-20020a170902e89000b001cc3b88078bmr194422plg.6.1699393601596;
        Tue, 07 Nov 2023 13:46:41 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902d3cd00b001c73f3a9b88sm285717plb.110.2023.11.07.13.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 13:46:41 -0800 (PST)
Message-ID: <9529b97f-1c37-43e4-925e-5eeca47678bb@kernel.dk>
Date: Tue, 7 Nov 2023 14:46:40 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in io_uring, leading to data corruption
Content-Language: en-US
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: regressions <regressions@lists.linux.dev>,
 Pavel Begunkov <asml.silence@gmail.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
 <92d55351-f8c2-4376-affb-d361782e20e1@kernel.dk>
 <1779502278.45625230.1699393171901.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <1779502278.45625230.1699393171901.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/23 2:39 PM, Timothy Pearson wrote:
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>> <asml.silence@gmail.com>
>> Sent: Tuesday, November 7, 2023 3:22:16 PM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/7/23 9:34 AM, Timothy Pearson wrote:
>>> I can make the corruption disappear by adding a 1ms busy wait delay
>>> into io_wqe_dec_running().  This appears to alter the timing of
>>> something in the io_uring system just enough to make the (presumed)
>>> data race disappear.  KASAN and KCSAN do not show any issues, nor does
>>> the lock debugger, yet a corruption problem that disappears with a
>>> delay is indicative of a race somewhere.  The delay primary impacts
>>> how long the IRQ lock is held, if the delay is moved outside of the
>>> IRQ locked section the corruption returns.
>>
>> This is interesting... This forces the current task to schedule out
>> first, rather than potentially create a new worker.
> 
> That makes sense -- when debugging, everything seems to center around
> worker creation and the exact timing / context of that operation.
> 
>> If you put that 1 ms sleep at the top of io_wq_worker(), before the
>> loop, does it fix it as well? With the previous one removed, of course.
> 
> No, it does not.

OK, so it's not related to delaying work handling for a new worker. What
if you add a 1ms sleep before calling wq->do_work() in
io_worker_handle_work()? For both this and your previous test, might be
worth shrinking this 1ms to something way smaller, as it's hard to know
if it's the fact that we're scheduling first that's important, or if
it's just a timing delay and hence now it's much harder to hit this
race.

>> Does it do anything if you just put isync() in there instead of the
>> sleep in io_wqe_dec_running()?
> 
> Unfortunately no, that doesn't fix things either.
> 
> My gut says it's something racing with either the I/O worker creation
> or wake (trying to schedule work onto a half-created or still sleeping
> worker?) but so far I haven't been able to isolate the root cause.

One of my initial suspicions was improper handling of signals, since
creating a new worker will happen via task_work_add(..., TWA_SIGNAL).
But I'm not sure how likely that is, as that could/would happen normally
too if signals are being used, and would trigger on more than just
powerpc obviously.

The workers are good to go as soon as they are created, no setup really
needs to happen. They do a bit at the top of io_wq_worker(), but that's
before they can go and grab a work item. The worker itself has to grab
it, nothing is being handed to it.

-- 
Jens Axboe

