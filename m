Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61A4347BE
	for <regressions@lists.linux.dev>; Tue,  7 Nov 2023 17:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="nOlAA7hP"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1cc2b8deb23so8414735ad.1
        for <regressions@lists.linux.dev>; Tue, 07 Nov 2023 09:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699377287; x=1699982087; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5iBeT/5ciRm+W7AMHJQ95i97Rd3xq08wZga92NplRrQ=;
        b=nOlAA7hPJTQEOmUux5TXM72Hkf5/hklFddMmJg8UH6QQe6bpDKrKkrtiogksLi7GLU
         ZrTMP86zBKJxx2cL0CG5iMBZnxhV4NSF9azxFlJwyDcfU4kQ/s5pVKxFwn13o8/sK896
         4dyMrIg/SqCG3Wauriwbr/eR0mKhuW5rMOJx1ELi0FclFRRwHBensm6aG6OWo+mtK0/w
         4JfHZilRwxP76Lho/Ro4VBKGthIg0NzsITE9g6vRytWKYpNuzbNQpQN5Q3wlEpm0tUqu
         3u+lVxBI/6uhA/62QWP9QFMf9H/VHEU0nDEj5EovlN2Z27pu6qNq9WHC6V8JueOGkFLn
         9lXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699377287; x=1699982087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5iBeT/5ciRm+W7AMHJQ95i97Rd3xq08wZga92NplRrQ=;
        b=bmvmbd1MxGsdlqlZ+TlEBD+6Iz+W0Bm4z1ZKqnezjJkBwiHVIWfnUefYHeewmY3LYG
         EWnQiJ7vB/sKZmIeRvR6b9DDSjyR94ELL5Yzwx/i0lznAaQPLFekDSI6JqhatLTJvwA+
         9oZjVp7FJEj7jBb+Yfdw0kDyh7jGpyWt0wEE/BdVo7Km2ZG6fYD4uGKFB7Mdt07tZVop
         9zCnJT/ORiu0ppjyn3mnpuIXFX3AH9uvTtp8Bb06nheuoGoaI41fHgZmdjHcApQpY7e8
         qb+dCQ6Wwn6X0dgIr8bkUqoowCYO897Qec+PHuGNNAThOq6mLC/mtl8O+QU6nys86DLw
         q41g==
X-Gm-Message-State: AOJu0Yx0DjpCi+Jj4GYJgcMLAhM1rRAD+YuPa3dSlqVyCCCXTcQqAvUO
	0UgOe1/9J6n2hi9ODe5hAvyAPg==
X-Google-Smtp-Source: AGHT+IGikAgztE6rbDciCL6mbiZsK+TLmD2UvjDfRqR+N3z/bzbqEClYOkHzLQncigSIVHpLuXyI7w==
X-Received: by 2002:a17:902:e3d3:b0:1cc:2bc4:5157 with SMTP id r19-20020a170902e3d300b001cc2bc45157mr31752402ple.1.1699377286789;
        Tue, 07 Nov 2023 09:14:46 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id d4-20020a170903230400b001cc29b5c324sm73304plh.203.2023.11.07.09.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 09:14:46 -0800 (PST)
Message-ID: <529d34b6-e467-48d6-a56d-596e5dc354ae@kernel.dk>
Date: Tue, 7 Nov 2023 10:14:45 -0700
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
 <eb4f04b9-1bbf-489d-88ee-7ad7e4fb455b@kernel.dk>
 <1979644721.45581249.1699376257136.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <1979644721.45581249.1699376257136.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/23 9:57 AM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>> <asml.silence@gmail.com>
>> Sent: Tuesday, November 7, 2023 10:49:34 AM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/7/23 9:34 AM, Timothy Pearson wrote:
>>> I have spent some considerable effort tracking down a bug that appears
>>> to be present in the io_uring workqueue.  As I have not yet been able
>>> to isolate the exact cause, I would like to solicit ideas from the
>>> developers / maintainers of the io_uring system.  This regression
>>> persists into the latest kernel GIT head, and is only reliably
>>> reproduceable under fairly exacting conditions.
>>>
>>> In GIT hash 685fe7fe the workqueue manager thread was removed and
>>> replaced with code that allows the workqueues to manage their own
>>> workers.  This has the unfortunate side effect of exposing what I
>>> believe to be an existing timing-dependent race condition somewhere
>>> else within the kernel.  On a ppc64el host, I can reliably trigger
>>> data corruption on what I believe to be writes by running the
>>> following mysql mtr sequence:
>>>
>>> ./mtr encryption.innodb-discard-import --repeat=100 --force
>>>
>>> This results in corruption of the data being written to disk --
>>> reverting 685fe7fe resolves the issue by (I believe) masking it
>>> through changes in workqueue inter-thread timing.
>>>
>>> I can make the corruption disappear by adding a 1ms busy wait delay
>>> into io_wqe_dec_running().  This appears to alter the timing of
>>> something in the io_uring system just enough to make the (presumed)
>>> data race disappear.  KASAN and KCSAN do not show any issues, nor does
>>> the lock debugger, yet a corruption problem that disappears with a
>>> delay is indicative of a race somewhere.  The delay primary impacts
>>> how long the IRQ lock is held, if the delay is moved outside of the
>>> IRQ locked section the corruption returns.
>>>
>>> I have already tried adding memory barriers etc. to the code paths in
>>> question, with no effect.  The exact same issue persists on the latest
>>> kernel versions.
>>>
>>> Thoughts welcome -- this is a serious issue causing data corruption on
>>> production systems.
>>
>> I looked into this for quite a while back in March, see my initial
>> postings on it here:
>>
>> https://lore.kernel.org/all/2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk/
>>
>> it unfortunately never got anywhere, and as far as I can tell, this is
>> most likely a page cache or ordering issue on the ppc side. I no longer
>> have hardware to test with, and not really a huge inclination to dive
>> into this again as it's hugely time consuming and doesn't seem to be an
>> io_uring issue to begin with, but I'd be happy to help out with this.
>>
>> Back then I looked into getting some ppc hardware to test with for
>> this very reason, and even reached out to various manufacturers to see
>> if they would be able to lend/give me some. Didn't pan out, and ended
>> up using a university vm for it.
>>
>> --
>> Jens Axboe
> 
> Understood.  I think between the pinning and the findings above, plus
> the fact that (IIRC) this seemed to disappear in SMT1 mode, I may have
> some better idea of where to look.  The pinning "fixing" things is
> something I wasn't aware of and will significantly reduce debug effort
> on this end, thanks for the pointer!

It's been some months since then so I don't recall all the details, but
at least there are some emails that cover some of it. I too tried a
bunch of things similar to what you looked at, but even a full hard
barrier before inserting the work item, and one before retrieving it on
the other end, didn't do anything. Hope you'll have better luck. And
like I said, I'm happy to help out, if I can.

> In the future, Raptor is more than willing to offer bare metal access
> to test machines for ppc64el at no cost.  I was unaware of the need so
> couldn't respond.

Good to know!

-- 
Jens Axboe

