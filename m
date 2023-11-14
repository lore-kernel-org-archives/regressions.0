Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F4A3FB03
	for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 18:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="pVlD7tLA"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-41e1967550aso5533531cf.1
        for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 10:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699984978; x=1700589778; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ugF6a/zT4ip/bEwkS4k55GOQOWCWOs7AAWN3yBX3qEo=;
        b=pVlD7tLAfKbuhkAroVBWFk3xz6+2LVNbFr+TgPP94unBfcVaHQ0lGTeawi7JD8b4ST
         ZSS4o9X/Q9zrDsg3EercKCNAiHvrp5kr/nDSDhOLDuJ3WMk77U5hk9iBWT1yUSjEWjxP
         6rUhKgk+apjcAqiFu6AI0yCKmO3h0Y6j2OWzvNpDYFy8fsRQHpRJQKfAQBsiitKaIx/z
         dYKRlQWFHeSTY2VhX3jVjhgUr7Fn/o9Q61e8rkJ3ncmSsOUwHve5WeAmaKFCD/DAp2x8
         sw3AugHlaCbNkrYJ0CF34XzIo27gX0hk61BKwK6KqlD/Gan/GJP6PwF4MVssaB90HQK5
         pbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699984978; x=1700589778;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ugF6a/zT4ip/bEwkS4k55GOQOWCWOs7AAWN3yBX3qEo=;
        b=YFCPiKh/AFJQ0QDxDpevc4QiONn/BezzscnbwhYLyfbAOedxuiO+tPYDIvpxx5VlQf
         X5n1oEMPQr0x7HNjvAtr81D/q9Cm6ynPuADkVp2XaFWan0ec4f5kf/fzUi20WXnqth3p
         Qhz1mYbg++/SeCPR2gkBTNO4A8CIhvEF8aC8O/nbUPD1gIGJNPQfwC9htG6yUMrlmPke
         hHmfaj73EDeKmgy+quosuITOpaxHMGQrXURph7hax3HFmh+GqlAoowv/OAo58chIesiG
         dvP1gLCPPVA9ShLWxTCRuiNDZCiDxSYT+crjBVKtfPup4m4eBhHiaiHIOH2NOsPGHPT/
         VtEQ==
X-Gm-Message-State: AOJu0YyHXWr77UBYl/7gGzo5d8XSiWrPz8mZDWGynPqx4pmQ+ufKK24T
	RXmUeQABSCMBRPqAxiRO4Vtfzg==
X-Google-Smtp-Source: AGHT+IFo1D32SwDiJdaT/ezbQD12RbqsK/H3+mZMVC1Kw3zvYDQu/iy8csBg5rNludWPVnIG3wGN/A==
X-Received: by 2002:a05:622a:6a84:b0:421:c319:bf87 with SMTP id ih4-20020a05622a6a8400b00421c319bf87mr2785510qtb.1.1699984977600;
        Tue, 14 Nov 2023 10:02:57 -0800 (PST)
Received: from [172.25.84.204] ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id i25-20020ac84899000000b0041cc2852f62sm2896486qtq.5.2023.11.14.10.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 10:02:56 -0800 (PST)
Message-ID: <12a87e52-92b7-44c3-886e-63bb7ebe56a6@kernel.dk>
Date: Tue, 14 Nov 2023 11:02:56 -0700
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
 <1357741503.47170425.1699938404661.JavaMail.zimbra@raptorengineeringinc.com>
 <72000dab-1d7e-464e-833b-0fe99574c742@kernel.dk>
 <648104660.47295764.1699981165881.JavaMail.zimbra@raptorengineeringinc.com>
 <3056f9eb-1656-4e6d-b063-849573e685cd@kernel.dk>
 <2027589474.47298231.1699982070160.JavaMail.zimbra@raptorengineeringinc.com>
 <3f4ec0a8-91a2-4928-aff8-9dd516d34c84@kernel.dk>
 <350382475.47299876.1699982492471.JavaMail.zimbra@raptorengineeringinc.com>
 <1454519264.47306517.1699984644120.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <1454519264.47306517.1699984644120.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/14/23 10:57 AM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Timothy Pearson" <tpearson@raptorengineering.com>
>> To: "Jens Axboe" <axboe@kernel.dk>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Tuesday, November 14, 2023 11:21:32 AM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> ----- Original Message -----
>>> From: "Jens Axboe" <axboe@kernel.dk>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>> <asml.silence@gmail.com>
>>> Sent: Tuesday, November 14, 2023 11:17:14 AM
>>> Subject: Re: Regression in io_uring, leading to data corruption
>>
>>> On 11/14/23 10:14 AM, Timothy Pearson wrote:
>>>>
>>>>
>>>> ----- Original Message -----
>>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>> <asml.silence@gmail.com>
>>>>> Sent: Tuesday, November 14, 2023 11:04:03 AM
>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>
>>>>> On 11/14/23 9:59 AM, Timothy Pearson wrote:
>>>>>>
>>>>>>
>>>>>> ----- Original Message -----
>>>>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>>>> <asml.silence@gmail.com>
>>>>>>> Sent: Tuesday, November 14, 2023 7:17:22 AM
>>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>>
>>>>>>> On 11/13/23 10:06 PM, Timothy Pearson wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> ----- Original Message -----
>>>>>>>>> From: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>>>>> To: "Jens Axboe" <axboe@kernel.dk>
>>>>>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>>>>>> <asml.silence@gmail.com>
>>>>>>>>> Sent: Monday, November 13, 2023 6:52:51 PM
>>>>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>>>>>
>>>>>>>>> Seemed to do what I wanted, however corruption remains.  Was worth a try...
>>>>>>>>>
>>>>>>>>> I guess I'll proceed under the assumption that somehow the thread setup is
>>>>>>>>> stomping on userspace for now.
>>>>>>>>
>>>>>>>> Finally found it!  Patch here:
>>>>>>>>
>>>>>>>> https://lore.kernel.org/regressions/19221908.47168775.1699937769845.JavaMail.zimbra@raptorengineeringinc.com/T/#u
>>>>>>>>
>>>>>>>> We were missing the appropriate barrier instruction inside the IPI
>>>>>>>> issued by the task_work_add() call, which was in turn issued during
>>>>>>>> queued io worker creation.  The explaination for how userspace was
>>>>>>>> getting corrupted boils down to an inconsistent view of main memory as
>>>>>>>> seen the two cores involved in the worker handoff and new worker
>>>>>>>> creation.
>>>>>>>>
>>>>>>>> Who doesn't love a one line fix after a week and a half of pulling
>>>>>>>> one's hair out? ;)
>>>>>>>
>>>>>>> Hate to be a debbie downer, but it still fails for me with that patch:
>>>>>>>
>>>>>>> debian@linux-kernel--io-uring:~/git/server/mysql-test$ ./mtr
>>>>>>> --mysqld=--innodb-flush-method=fsync --mysqld=--innodb-use-native-aio=1
>>>>>>> --vardir=/dev/shm/mysql  --force encryption.innodb_encryption,innodb,undo0
>>>>>>> --repeat=500
>>>>>>> [...]
>>>>>>> encryption.innodb_encryption 'innodb,undo0' [ 39 pass ]   3101
>>>>>>> encryption.innodb_encryption 'innodb,undo0' [ 40 fail ]
>>>>>>>        Test ended at 2023-11-14 13:02:52
>>>>>>>
>>>>>>> CURRENT_TEST: encryption.innodb_encryption
>>>>>>> mysqltest: At line 11: query 'SET @start_global_value =
>>>>>>> @@global.innodb_encryption_threads' failed: ER_UNKNOWN_SYSTEM_VARIABLE (1193):
>>>>>>> Unknown system variable 'innodb_encryption_threads'
>>>>>>>
>>>>>>> The result from queries just before the failure was:
>>>>>>> SET @start_global_value = @@global.innodb_encryption_threads;
>>>>>>>
>>>>>>> - saving '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/' to
>>>>>>> '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/'
>>>>>>> ***Warnings generated in error logs during shutdown after running tests:
>>>>>>> encryption.innodb_encryption
>>>>>>>
>>>>>>> 2023-11-14 13:02:51 0 [Warning] Plugin 'example_key_management' is of maturity
>>>>>>> level experimental while the server is stable
>>>>>>> 2023-11-14 13:02:51 0 [ERROR] InnoDB: Database page corruption on disk or a
>>>>>>> failed read of file './ibdata1' page [page id: space=0, page number=220]. You
>>>>>>> may have to recover from a backup.
>>>>>>> 2023-11-14 13:02:51 0 [ERROR] InnoDB: File './ibdata1' is corrupted
>>>>>>> 2023-11-14 13:02:51 0 [ERROR] InnoDB: Plugin initialization aborted with error
>>>>>>> Page read from tablespace is corrupted.
>>>>>>> 2023-11-14 13:02:52 0 [ERROR] Plugin 'InnoDB' registration as a STORAGE ENGINE
>>>>>>> failed.
>>>>>>>
>>>>>>> after about 40 loops. How consistent is it on your end? I know I've
>>>>>>> suspected the signaling before and tried the NO_IPI variant, but that
>>>>>>> still hit it.
>>>>>>>
>>>>>>> If it makes a difference for you, it must be close. But don't think it's
>>>>>>> quite there yet, unfortunately :-(
>>>>>>
>>>>>> Interesting!  I've run it for thousands of loops on my test VM, no
>>>>>> failures.  Let me try on the shared test box.
>>>>>
>>>>> So odd. I guess it must be close if it's enough to make yours sane. The
>>>>> other vm I've been using is just a small vm somewhere else, it has 8
>>>>> threads of:
>>>>>
>>>>> debian@linux-kernel--io-uring:~$ cat /proc/cpuinfo
>>>>> processor	: 0
>>>>> cpu		: POWER9 (architected), altivec supported
>>>>> clock		: 2200.000000MHz
>>>>> revision	: 2.2 (pvr 004e 1202)
>>>>> [...]
>>>>> timebase	: 512000000
>>>>> platform	: pSeries
>>>>> model		: IBM pSeries (emulated by qemu)
>>>>> machine		: CHRP IBM pSeries (emulated by qemu)
>>>>> MMU		: Radix
>>>>
>>>> At this point my concern is there might be two bugs, one related to
>>>> the IPI and one related to the direct creation path.  Since I can't
>>>> reproduce easily on my end, can you see if the box you have acecss to
>>>> is ever hitting the io_wq_create_worker() call inside io_wq_enqueue()?
>>>
>>> It's hitting it, and doing the worker pre-create like in the patch I
>>> sent you makes the bug go away here.
>>
>> That's what I thought.  OK, let me chew on this for a bit.  I'm not hitting it
>> at all, my worker creation goes through the deferred path only hence why adding
>> the barrier to the IPI fully resolved the problem on my end.
> 
> It's a stab in the dark, but does adding smb_mb() right before the
> io_wq_create_worker() call fix anything?

Sure, let's try it.

> What mariadb version are you testing with?  I can't seem to get into
> the io_wq_enqueue() path at all.

11.0.4-MariaDB here. You most certainly should be hitting that, unless
you're still using some of my previous patches.

-- 
Jens Axboe

