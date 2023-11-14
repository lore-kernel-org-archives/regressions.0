Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07462C1BD
	for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 18:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="ehQNICBl"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 9E9EB828568E;
	Tue, 14 Nov 2023 12:12:29 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id vc0uppkyVEOy; Tue, 14 Nov 2023 12:12:28 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 5AA1182856CA;
	Tue, 14 Nov 2023 12:12:28 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 5AA1182856CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699985548; bh=fKtioiKQVX+TaBQ4lPJpNRHnz/d1khyZxTjt7rf7qtk=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=ehQNICBl+wtmoGnLRjf6PGziIOy1/V4rTKEWNL3WdJMlrgg5XA+TCy9gzYHQrknQQ
	 ZD3fa6jVgAExqnEBf8eb12OurYj2ChDnz5y0WAuviFGFvdqDwzeby0/bYlnhcbMTfa
	 S7eOqgCShPQKN/dZ6nELIlX+mPk337sPZGYR3Z1U=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gVSmawdNZnnx; Tue, 14 Nov 2023 12:12:28 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 1DACE828568E;
	Tue, 14 Nov 2023 12:12:28 -0600 (CST)
Date: Tue, 14 Nov 2023 12:12:26 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Timothy Pearson <tpearson@raptorengineering.com>, 
	regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <1948840273.47309805.1699985546123.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <12a87e52-92b7-44c3-886e-63bb7ebe56a6@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <648104660.47295764.1699981165881.JavaMail.zimbra@raptorengineeringinc.com> <3056f9eb-1656-4e6d-b063-849573e685cd@kernel.dk> <2027589474.47298231.1699982070160.JavaMail.zimbra@raptorengineeringinc.com> <3f4ec0a8-91a2-4928-aff8-9dd516d34c84@kernel.dk> <350382475.47299876.1699982492471.JavaMail.zimbra@raptorengineeringinc.com> <1454519264.47306517.1699984644120.JavaMail.zimbra@raptorengineeringinc.com> <12a87e52-92b7-44c3-886e-63bb7ebe56a6@kernel.dk>
Subject: Re: Regression in io_uring, leading to data corruption
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Topic: Regression in io_uring, leading to data corruption
Thread-Index: LCu2hFWSsbxfUUaF1prc7ZfBxMXb9g==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Tuesday, November 14, 2023 12:02:56 PM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/14/23 10:57 AM, Timothy Pearson wrote:
>> 
>> 
>> ----- Original Message -----
>>> From: "Timothy Pearson" <tpearson@raptorengineering.com>
>>> To: "Jens Axboe" <axboe@kernel.dk>
>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>> <asml.silence@gmail.com>
>>> Sent: Tuesday, November 14, 2023 11:21:32 AM
>>> Subject: Re: Regression in io_uring, leading to data corruption
>> 
>>> ----- Original Message -----
>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>> <asml.silence@gmail.com>
>>>> Sent: Tuesday, November 14, 2023 11:17:14 AM
>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>
>>>> On 11/14/23 10:14 AM, Timothy Pearson wrote:
>>>>>
>>>>>
>>>>> ----- Original Message -----
>>>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>>> <asml.silence@gmail.com>
>>>>>> Sent: Tuesday, November 14, 2023 11:04:03 AM
>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>
>>>>>> On 11/14/23 9:59 AM, Timothy Pearson wrote:
>>>>>>>
>>>>>>>
>>>>>>> ----- Original Message -----
>>>>>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>>>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>>>>> <asml.silence@gmail.com>
>>>>>>>> Sent: Tuesday, November 14, 2023 7:17:22 AM
>>>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>>>
>>>>>>>> On 11/13/23 10:06 PM, Timothy Pearson wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> ----- Original Message -----
>>>>>>>>>> From: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>>>>>>>> To: "Jens Axboe" <axboe@kernel.dk>
>>>>>>>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>>>>>>>> <asml.silence@gmail.com>
>>>>>>>>>> Sent: Monday, November 13, 2023 6:52:51 PM
>>>>>>>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>>>>>>>
>>>>>>>>>> Seemed to do what I wanted, however corruption remains.  Was worth a try...
>>>>>>>>>>
>>>>>>>>>> I guess I'll proceed under the assumption that somehow the thread setup is
>>>>>>>>>> stomping on userspace for now.
>>>>>>>>>
>>>>>>>>> Finally found it!  Patch here:
>>>>>>>>>
>>>>>>>>> https://lore.kernel.org/regressions/19221908.47168775.1699937769845.JavaMail.zimbra@raptorengineeringinc.com/T/#u
>>>>>>>>>
>>>>>>>>> We were missing the appropriate barrier instruction inside the IPI
>>>>>>>>> issued by the task_work_add() call, which was in turn issued during
>>>>>>>>> queued io worker creation.  The explaination for how userspace was
>>>>>>>>> getting corrupted boils down to an inconsistent view of main memory as
>>>>>>>>> seen the two cores involved in the worker handoff and new worker
>>>>>>>>> creation.
>>>>>>>>>
>>>>>>>>> Who doesn't love a one line fix after a week and a half of pulling
>>>>>>>>> one's hair out? ;)
>>>>>>>>
>>>>>>>> Hate to be a debbie downer, but it still fails for me with that patch:
>>>>>>>>
>>>>>>>> debian@linux-kernel--io-uring:~/git/server/mysql-test$ ./mtr
>>>>>>>> --mysqld=--innodb-flush-method=fsync --mysqld=--innodb-use-native-aio=1
>>>>>>>> --vardir=/dev/shm/mysql  --force encryption.innodb_encryption,innodb,undo0
>>>>>>>> --repeat=500
>>>>>>>> [...]
>>>>>>>> encryption.innodb_encryption 'innodb,undo0' [ 39 pass ]   3101
>>>>>>>> encryption.innodb_encryption 'innodb,undo0' [ 40 fail ]
>>>>>>>>        Test ended at 2023-11-14 13:02:52
>>>>>>>>
>>>>>>>> CURRENT_TEST: encryption.innodb_encryption
>>>>>>>> mysqltest: At line 11: query 'SET @start_global_value =
>>>>>>>> @@global.innodb_encryption_threads' failed: ER_UNKNOWN_SYSTEM_VARIABLE (1193):
>>>>>>>> Unknown system variable 'innodb_encryption_threads'
>>>>>>>>
>>>>>>>> The result from queries just before the failure was:
>>>>>>>> SET @start_global_value = @@global.innodb_encryption_threads;
>>>>>>>>
>>>>>>>> - saving '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/' to
>>>>>>>> '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/'
>>>>>>>> ***Warnings generated in error logs during shutdown after running tests:
>>>>>>>> encryption.innodb_encryption
>>>>>>>>
>>>>>>>> 2023-11-14 13:02:51 0 [Warning] Plugin 'example_key_management' is of maturity
>>>>>>>> level experimental while the server is stable
>>>>>>>> 2023-11-14 13:02:51 0 [ERROR] InnoDB: Database page corruption on disk or a
>>>>>>>> failed read of file './ibdata1' page [page id: space=0, page number=220]. You
>>>>>>>> may have to recover from a backup.
>>>>>>>> 2023-11-14 13:02:51 0 [ERROR] InnoDB: File './ibdata1' is corrupted
>>>>>>>> 2023-11-14 13:02:51 0 [ERROR] InnoDB: Plugin initialization aborted with error
>>>>>>>> Page read from tablespace is corrupted.
>>>>>>>> 2023-11-14 13:02:52 0 [ERROR] Plugin 'InnoDB' registration as a STORAGE ENGINE
>>>>>>>> failed.
>>>>>>>>
>>>>>>>> after about 40 loops. How consistent is it on your end? I know I've
>>>>>>>> suspected the signaling before and tried the NO_IPI variant, but that
>>>>>>>> still hit it.
>>>>>>>>
>>>>>>>> If it makes a difference for you, it must be close. But don't think it's
>>>>>>>> quite there yet, unfortunately :-(
>>>>>>>
>>>>>>> Interesting!  I've run it for thousands of loops on my test VM, no
>>>>>>> failures.  Let me try on the shared test box.
>>>>>>
>>>>>> So odd. I guess it must be close if it's enough to make yours sane. The
>>>>>> other vm I've been using is just a small vm somewhere else, it has 8
>>>>>> threads of:
>>>>>>
>>>>>> debian@linux-kernel--io-uring:~$ cat /proc/cpuinfo
>>>>>> processor	: 0
>>>>>> cpu		: POWER9 (architected), altivec supported
>>>>>> clock		: 2200.000000MHz
>>>>>> revision	: 2.2 (pvr 004e 1202)
>>>>>> [...]
>>>>>> timebase	: 512000000
>>>>>> platform	: pSeries
>>>>>> model		: IBM pSeries (emulated by qemu)
>>>>>> machine		: CHRP IBM pSeries (emulated by qemu)
>>>>>> MMU		: Radix
>>>>>
>>>>> At this point my concern is there might be two bugs, one related to
>>>>> the IPI and one related to the direct creation path.  Since I can't
>>>>> reproduce easily on my end, can you see if the box you have acecss to
>>>>> is ever hitting the io_wq_create_worker() call inside io_wq_enqueue()?
>>>>
>>>> It's hitting it, and doing the worker pre-create like in the patch I
>>>> sent you makes the bug go away here.
>>>
>>> That's what I thought.  OK, let me chew on this for a bit.  I'm not hitting it
>>> at all, my worker creation goes through the deferred path only hence why adding
>>> the barrier to the IPI fully resolved the problem on my end.
>> 
>> It's a stab in the dark, but does adding smb_mb() right before the
>> io_wq_create_worker() call fix anything?
> 
> Sure, let's try it.
> 
>> What mariadb version are you testing with?  I can't seem to get into
>> the io_wq_enqueue() path at all.
> 
> 11.0.4-MariaDB here. You most certainly should be hitting that, unless
> you're still using some of my previous patches.

Let me check.  I'm pretty sure I had an old patch in-tree on the branch I was using to create the diff against.
