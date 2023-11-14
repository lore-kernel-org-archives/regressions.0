Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5037F26AC0
	for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 18:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="b2zmi1gt"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3b2d9a9c824so851976b6e.0
        for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 10:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699986415; x=1700591215; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8QI6glszFC/eOW7z1S1VRRwYHZfO4QY5vKBimFedMiM=;
        b=b2zmi1gtvD0EfLX5QoMfws8YPoh7T0lPkl6AF5QpNDhCJ9Do0nP9ZN1836NUC9E+KI
         wnXz6RrLh36dl1ZUAJnae9K5/b9J0vFJvOCLhB0JyCUYlH140nbT5M/wlcU3q6Hd2t2u
         658FNNBcobkswr6IGhHYgKiwaTe0Xt/xBswgXL/g0B4jfSL4Nh2oTywDHYayP1LgKx5d
         zltuTjpxvbmEN9gwewnAU6b2Ci5+AGx+x5DrJWCF7pKFsubi4nxwHqObhxVH0uVQgDuU
         VT2LzvvrMWSwD+SEm4jSAc4rh873Sh4d8V5UXEnZtgnvchpGf7kgohDpYwoz4bDVGdXb
         T87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699986415; x=1700591215;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8QI6glszFC/eOW7z1S1VRRwYHZfO4QY5vKBimFedMiM=;
        b=S7BKjbHvL2VUv6Ta1lTUOLrFkMgCDFujN5+PAtTuH3CV3kmN1KuLPk2YGlwX6k0ycI
         zjTGOZ1yhPKEnFjIpWgfjnbJMjow3TXXcgwULao25/nDPMSeyr07LaXS2Fd+FBwEZqT+
         2T/W0pSndR7xTYITVZJF/+uofe025Z5GWvFSC3k5q1OPrQFp141clpVEh9dsbVRBvnhW
         CI69U1gK+t3ZxF3XAFPulyZT/fBRl0LN1IPw0xNd+MexD9OQQX6160L2j6ckGP05IAW7
         CQ8UGIPhRAqNyM02COX3AYVFKoNHR+3n2xLvUPnkJ7S9q8p+JAlKYqt4xOVc+14UarX7
         bQFQ==
X-Gm-Message-State: AOJu0Yxiu2uONj3hjqigLquf5VTNS9mZGXeniH6F1rdjqzs5ztZ4amv6
	gHhPbhczRPrpgSkkpI57ANz4rA==
X-Google-Smtp-Source: AGHT+IHO82D2yc87+M1e/UsrJuNP9Aao5jHI4ZfT+Sa/t4G5JQhvTGNTs8SlsMh+vudYzHgawoHYbg==
X-Received: by 2002:a05:6358:880b:b0:16b:b10b:90e3 with SMTP id hv11-20020a056358880b00b0016bb10b90e3mr3774243rwb.1.1699986414866;
        Tue, 14 Nov 2023 10:26:54 -0800 (PST)
Received: from [172.25.84.204] ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id t19-20020ac85313000000b004180fb5c6adsm2900842qtn.25.2023.11.14.10.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 10:26:54 -0800 (PST)
Message-ID: <c35cbe80-1db5-483e-9438-1fb50621a1cc@kernel.dk>
Date: Tue, 14 Nov 2023 11:26:53 -0700
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
 <648104660.47295764.1699981165881.JavaMail.zimbra@raptorengineeringinc.com>
 <3056f9eb-1656-4e6d-b063-849573e685cd@kernel.dk>
 <2027589474.47298231.1699982070160.JavaMail.zimbra@raptorengineeringinc.com>
 <3f4ec0a8-91a2-4928-aff8-9dd516d34c84@kernel.dk>
 <350382475.47299876.1699982492471.JavaMail.zimbra@raptorengineeringinc.com>
 <1454519264.47306517.1699984644120.JavaMail.zimbra@raptorengineeringinc.com>
 <12a87e52-92b7-44c3-886e-63bb7ebe56a6@kernel.dk>
 <1948840273.47309805.1699985546123.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <1948840273.47309805.1699985546123.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/14/23 11:12 AM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Tuesday, November 14, 2023 12:02:56 PM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/14/23 10:57 AM, Timothy Pearson wrote:
>>>
>>>
>>> ----- Original Message -----
>>>> From: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>> To: "Jens Axboe" <axboe@kernel.dk>
>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>> <asml.silence@gmail.com>
>>>> Sent: Tuesday, November 14, 2023 11:21:32 AM
>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>
>>>> ----- Original Message -----
>>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>> <asml.silence@gmail.com>
>>>>> Sent: Tuesday, November 14, 2023 11:17:14 AM
>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>
>>>>> On 11/14/23 10:14 AM, Timothy Pearson wrote:
>>>>>>
>>>>>>
>>>>>> ----- Original Message -----
>>>>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>>>> <asml.silence@gmail.com>
>>>>>>> Sent: Tuesday, November 14, 2023 11:04:03 AM
>>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>>
>>>>>>> On 11/14/23 9:59 AM, Timothy Pearson wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> ----- Original Message -----
>>>>>>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>>>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>>>>>> <asml.silence@gmail.com>
>>>>>>>>> Sent: Tuesday, November 14, 2023 7:17:22 AM
>>>>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>>>>
>>>>>>>>> On 11/13/23 10:06 PM, Timothy Pearson wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> ----- Original Message -----
>>>>>>>>>>> From: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>>>>>>> To: "Jens Axboe" <axboe@kernel.dk>
>>>>>>>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>>>>>>>> <asml.silence@gmail.com>
>>>>>>>>>>> Sent: Monday, November 13, 2023 6:52:51 PM
>>>>>>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>>>>>>>
>>>>>>>>>>> Seemed to do what I wanted, however corruption remains.  Was worth a try...
>>>>>>>>>>>
>>>>>>>>>>> I guess I'll proceed under the assumption that somehow the thread setup is
>>>>>>>>>>> stomping on userspace for now.
>>>>>>>>>>
>>>>>>>>>> Finally found it!  Patch here:
>>>>>>>>>>
>>>>>>>>>> https://lore.kernel.org/regressions/19221908.47168775.1699937769845.JavaMail.zimbra@raptorengineeringinc.com/T/#u
>>>>>>>>>>
>>>>>>>>>> We were missing the appropriate barrier instruction inside the IPI
>>>>>>>>>> issued by the task_work_add() call, which was in turn issued during
>>>>>>>>>> queued io worker creation.  The explaination for how userspace was
>>>>>>>>>> getting corrupted boils down to an inconsistent view of main memory as
>>>>>>>>>> seen the two cores involved in the worker handoff and new worker
>>>>>>>>>> creation.
>>>>>>>>>>
>>>>>>>>>> Who doesn't love a one line fix after a week and a half of pulling
>>>>>>>>>> one's hair out? ;)
>>>>>>>>>
>>>>>>>>> Hate to be a debbie downer, but it still fails for me with that patch:
>>>>>>>>>
>>>>>>>>> debian@linux-kernel--io-uring:~/git/server/mysql-test$ ./mtr
>>>>>>>>> --mysqld=--innodb-flush-method=fsync --mysqld=--innodb-use-native-aio=1
>>>>>>>>> --vardir=/dev/shm/mysql  --force encryption.innodb_encryption,innodb,undo0
>>>>>>>>> --repeat=500
>>>>>>>>> [...]
>>>>>>>>> encryption.innodb_encryption 'innodb,undo0' [ 39 pass ]   3101
>>>>>>>>> encryption.innodb_encryption 'innodb,undo0' [ 40 fail ]
>>>>>>>>>        Test ended at 2023-11-14 13:02:52
>>>>>>>>>
>>>>>>>>> CURRENT_TEST: encryption.innodb_encryption
>>>>>>>>> mysqltest: At line 11: query 'SET @start_global_value =
>>>>>>>>> @@global.innodb_encryption_threads' failed: ER_UNKNOWN_SYSTEM_VARIABLE (1193):
>>>>>>>>> Unknown system variable 'innodb_encryption_threads'
>>>>>>>>>
>>>>>>>>> The result from queries just before the failure was:
>>>>>>>>> SET @start_global_value = @@global.innodb_encryption_threads;
>>>>>>>>>
>>>>>>>>> - saving '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/' to
>>>>>>>>> '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/'
>>>>>>>>> ***Warnings generated in error logs during shutdown after running tests:
>>>>>>>>> encryption.innodb_encryption
>>>>>>>>>
>>>>>>>>> 2023-11-14 13:02:51 0 [Warning] Plugin 'example_key_management' is of maturity
>>>>>>>>> level experimental while the server is stable
>>>>>>>>> 2023-11-14 13:02:51 0 [ERROR] InnoDB: Database page corruption on disk or a
>>>>>>>>> failed read of file './ibdata1' page [page id: space=0, page number=220]. You
>>>>>>>>> may have to recover from a backup.
>>>>>>>>> 2023-11-14 13:02:51 0 [ERROR] InnoDB: File './ibdata1' is corrupted
>>>>>>>>> 2023-11-14 13:02:51 0 [ERROR] InnoDB: Plugin initialization aborted with error
>>>>>>>>> Page read from tablespace is corrupted.
>>>>>>>>> 2023-11-14 13:02:52 0 [ERROR] Plugin 'InnoDB' registration as a STORAGE ENGINE
>>>>>>>>> failed.
>>>>>>>>>
>>>>>>>>> after about 40 loops. How consistent is it on your end? I know I've
>>>>>>>>> suspected the signaling before and tried the NO_IPI variant, but that
>>>>>>>>> still hit it.
>>>>>>>>>
>>>>>>>>> If it makes a difference for you, it must be close. But don't think it's
>>>>>>>>> quite there yet, unfortunately :-(
>>>>>>>>
>>>>>>>> Interesting!  I've run it for thousands of loops on my test VM, no
>>>>>>>> failures.  Let me try on the shared test box.
>>>>>>>
>>>>>>> So odd. I guess it must be close if it's enough to make yours sane. The
>>>>>>> other vm I've been using is just a small vm somewhere else, it has 8
>>>>>>> threads of:
>>>>>>>
>>>>>>> debian@linux-kernel--io-uring:~$ cat /proc/cpuinfo
>>>>>>> processor	: 0
>>>>>>> cpu		: POWER9 (architected), altivec supported
>>>>>>> clock		: 2200.000000MHz
>>>>>>> revision	: 2.2 (pvr 004e 1202)
>>>>>>> [...]
>>>>>>> timebase	: 512000000
>>>>>>> platform	: pSeries
>>>>>>> model		: IBM pSeries (emulated by qemu)
>>>>>>> machine		: CHRP IBM pSeries (emulated by qemu)
>>>>>>> MMU		: Radix
>>>>>>
>>>>>> At this point my concern is there might be two bugs, one related to
>>>>>> the IPI and one related to the direct creation path.  Since I can't
>>>>>> reproduce easily on my end, can you see if the box you have acecss to
>>>>>> is ever hitting the io_wq_create_worker() call inside io_wq_enqueue()?
>>>>>
>>>>> It's hitting it, and doing the worker pre-create like in the patch I
>>>>> sent you makes the bug go away here.
>>>>
>>>> That's what I thought.  OK, let me chew on this for a bit.  I'm not hitting it
>>>> at all, my worker creation goes through the deferred path only hence why adding
>>>> the barrier to the IPI fully resolved the problem on my end.
>>>
>>> It's a stab in the dark, but does adding smb_mb() right before the
>>> io_wq_create_worker() call fix anything?
>>
>> Sure, let's try it.

I tested this, still happens with that change added and the IPI lwsync
retained.

>>> What mariadb version are you testing with?  I can't seem to get into
>>> the io_wq_enqueue() path at all.
>>
>> 11.0.4-MariaDB here. You most certainly should be hitting that, unless
>> you're still using some of my previous patches.
> 
> Let me check.  I'm pretty sure I had an old patch in-tree on the
> branch I was using to create the diff against.

OK

-- 
Jens Axboe

