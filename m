Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A4A41758
	for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 17:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="SiAIzTy6"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-66d15bdd5abso10903216d6.1
        for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 09:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699982236; x=1700587036; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uqiNvRc1U1TD0yvpz8dGWjVxBttCLYfq5jJmdlwtKeA=;
        b=SiAIzTy6hRfNh8lRyl+f3t14aJoYUhj7QmMV+7CfwIGMhZU4+ZQE2cDd8DNsPrznd6
         ebQerlVUaoE+hvOfgcjylVZ4uQRwFYDXAM+cw275CIB+mjoNgGAHZ+uKPmzRuzCYqV37
         pVYU/9yVueXthXcMqTGs8X4DfdPbtRYCPcza2OwChXiqdpAqLZLBXle6Tb9j30kFP6+t
         64HXggdGHmAbcmBIZHB6h/zcOhJRIsKsU/JEBacDX0u9f42Os12n3JSf25orh/wczm5d
         /nw9MqsCF46bmVfA4mkXgVEabkXvsw3Svv8xpExZ0OJxe/L18vPzXnwQdgLZDbAQWRi5
         o/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699982236; x=1700587036;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqiNvRc1U1TD0yvpz8dGWjVxBttCLYfq5jJmdlwtKeA=;
        b=RcuUHGx6PsdDhp+P915l+cEr9LrI9oKT317unHG8nbKjHMlQn1usQeLztSIMUgLZ0F
         4kiXsi3rJv0I+iFRaveij76bidfkCby2WqTKJTpt6Sbsea2CKYqbFPZj1aEfecukNcIC
         iTvDF49OsRv+aE478HUJHAd058LySza8NWeRchBIZiXKUhA1IJKZiuPsDKRS5bhdwVFW
         fSuHrpreiUvngKYhkc2QgnJgaY5K52YDXnZ3D/qK8AM8zi76JqQUMUN2g1gLlQA7HnqX
         6JDwQKa1swVcuvunHBvIvHDUjVBSw//Tw9ZCPAzW0Wp5RhMeE9KHpZyc1uFikk7SdY3N
         YxiQ==
X-Gm-Message-State: AOJu0YzhJITC8WVVWqKV7ey3L8Flf4kSv/gc0mp4Ld5D/AkRd4wniecx
	VZrN7oeR+ZLcYfhe5PfYRii879uWGaHazuZN+88HCQ==
X-Google-Smtp-Source: AGHT+IHf0jYA5CDmO/h/9EAHQfa72OYdNWha0NosWiy7xjJ4/xqepubqhYJOzg3YF50/Ipb1lK/Blg==
X-Received: by 2002:a05:6214:5ec5:b0:66d:1178:8729 with SMTP id mn5-20020a0562145ec500b0066d11788729mr3014185qvb.0.1699982235936;
        Tue, 14 Nov 2023 09:17:15 -0800 (PST)
Received: from [172.25.84.204] ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id l8-20020ad44248000000b00656e2464719sm3078636qvq.92.2023.11.14.09.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 09:17:15 -0800 (PST)
Message-ID: <3f4ec0a8-91a2-4928-aff8-9dd516d34c84@kernel.dk>
Date: Tue, 14 Nov 2023 10:17:14 -0700
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
 <146986614.47116966.1699920294190.JavaMail.zimbra@raptorengineeringinc.com>
 <7f74cf55-d1ca-482b-95c3-27b02996d999@kernel.dk>
 <1270025902.47126081.1699923171139.JavaMail.zimbra@raptorengineeringinc.com>
 <1357741503.47170425.1699938404661.JavaMail.zimbra@raptorengineeringinc.com>
 <72000dab-1d7e-464e-833b-0fe99574c742@kernel.dk>
 <648104660.47295764.1699981165881.JavaMail.zimbra@raptorengineeringinc.com>
 <3056f9eb-1656-4e6d-b063-849573e685cd@kernel.dk>
 <2027589474.47298231.1699982070160.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2027589474.47298231.1699982070160.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/14/23 10:14 AM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Tuesday, November 14, 2023 11:04:03 AM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/14/23 9:59 AM, Timothy Pearson wrote:
>>>
>>>
>>> ----- Original Message -----
>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>> <asml.silence@gmail.com>
>>>> Sent: Tuesday, November 14, 2023 7:17:22 AM
>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>
>>>> On 11/13/23 10:06 PM, Timothy Pearson wrote:
>>>>>
>>>>>
>>>>> ----- Original Message -----
>>>>>> From: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>> To: "Jens Axboe" <axboe@kernel.dk>
>>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>>> <asml.silence@gmail.com>
>>>>>> Sent: Monday, November 13, 2023 6:52:51 PM
>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>>
>>>>>> Seemed to do what I wanted, however corruption remains.  Was worth a try...
>>>>>>
>>>>>> I guess I'll proceed under the assumption that somehow the thread setup is
>>>>>> stomping on userspace for now.
>>>>>
>>>>> Finally found it!  Patch here:
>>>>>
>>>>> https://lore.kernel.org/regressions/19221908.47168775.1699937769845.JavaMail.zimbra@raptorengineeringinc.com/T/#u
>>>>>
>>>>> We were missing the appropriate barrier instruction inside the IPI
>>>>> issued by the task_work_add() call, which was in turn issued during
>>>>> queued io worker creation.  The explaination for how userspace was
>>>>> getting corrupted boils down to an inconsistent view of main memory as
>>>>> seen the two cores involved in the worker handoff and new worker
>>>>> creation.
>>>>>
>>>>> Who doesn't love a one line fix after a week and a half of pulling
>>>>> one's hair out? ;)
>>>>
>>>> Hate to be a debbie downer, but it still fails for me with that patch:
>>>>
>>>> debian@linux-kernel--io-uring:~/git/server/mysql-test$ ./mtr
>>>> --mysqld=--innodb-flush-method=fsync --mysqld=--innodb-use-native-aio=1
>>>> --vardir=/dev/shm/mysql  --force encryption.innodb_encryption,innodb,undo0
>>>> --repeat=500
>>>> [...]
>>>> encryption.innodb_encryption 'innodb,undo0' [ 39 pass ]   3101
>>>> encryption.innodb_encryption 'innodb,undo0' [ 40 fail ]
>>>>        Test ended at 2023-11-14 13:02:52
>>>>
>>>> CURRENT_TEST: encryption.innodb_encryption
>>>> mysqltest: At line 11: query 'SET @start_global_value =
>>>> @@global.innodb_encryption_threads' failed: ER_UNKNOWN_SYSTEM_VARIABLE (1193):
>>>> Unknown system variable 'innodb_encryption_threads'
>>>>
>>>> The result from queries just before the failure was:
>>>> SET @start_global_value = @@global.innodb_encryption_threads;
>>>>
>>>> - saving '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/' to
>>>> '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/'
>>>> ***Warnings generated in error logs during shutdown after running tests:
>>>> encryption.innodb_encryption
>>>>
>>>> 2023-11-14 13:02:51 0 [Warning] Plugin 'example_key_management' is of maturity
>>>> level experimental while the server is stable
>>>> 2023-11-14 13:02:51 0 [ERROR] InnoDB: Database page corruption on disk or a
>>>> failed read of file './ibdata1' page [page id: space=0, page number=220]. You
>>>> may have to recover from a backup.
>>>> 2023-11-14 13:02:51 0 [ERROR] InnoDB: File './ibdata1' is corrupted
>>>> 2023-11-14 13:02:51 0 [ERROR] InnoDB: Plugin initialization aborted with error
>>>> Page read from tablespace is corrupted.
>>>> 2023-11-14 13:02:52 0 [ERROR] Plugin 'InnoDB' registration as a STORAGE ENGINE
>>>> failed.
>>>>
>>>> after about 40 loops. How consistent is it on your end? I know I've
>>>> suspected the signaling before and tried the NO_IPI variant, but that
>>>> still hit it.
>>>>
>>>> If it makes a difference for you, it must be close. But don't think it's
>>>> quite there yet, unfortunately :-(
>>>
>>> Interesting!  I've run it for thousands of loops on my test VM, no
>>> failures.  Let me try on the shared test box.
>>
>> So odd. I guess it must be close if it's enough to make yours sane. The
>> other vm I've been using is just a small vm somewhere else, it has 8
>> threads of:
>>
>> debian@linux-kernel--io-uring:~$ cat /proc/cpuinfo
>> processor	: 0
>> cpu		: POWER9 (architected), altivec supported
>> clock		: 2200.000000MHz
>> revision	: 2.2 (pvr 004e 1202)
>> [...]
>> timebase	: 512000000
>> platform	: pSeries
>> model		: IBM pSeries (emulated by qemu)
>> machine		: CHRP IBM pSeries (emulated by qemu)
>> MMU		: Radix
> 
> At this point my concern is there might be two bugs, one related to
> the IPI and one related to the direct creation path.  Since I can't
> reproduce easily on my end, can you see if the box you have acecss to
> is ever hitting the io_wq_create_worker() call inside io_wq_enqueue()?

It's hitting it, and doing the worker pre-create like in the patch I
sent you makes the bug go away here.

-- 
Jens Axboe

