Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2F4405D3
	for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 16:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="kBEa0pFx"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A3294828557F;
	Tue, 14 Nov 2023 10:59:29 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id RJ3EquLKGcXg; Tue, 14 Nov 2023 10:59:28 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 582568285649;
	Tue, 14 Nov 2023 10:59:28 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 582568285649
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699981168; bh=JZx4nGE0at8uWcQNcC55yVxoMXeXdzfddiuoRLzSn2k=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=kBEa0pFxuUeVLT/rwp92f2lOcYN5hoKEiNift7dOLzLTT7MQ4f4ym9X7VkHmQxckf
	 X8IB5SS9teFG8KnW8WC3XXCyeKaF+/4HhHZPme8w5kGbMTY+YQQBNIt35uX+LS70r5
	 ziDK8WrZdaUTspCxcOi95fhvAB7woLyI7/azsszM=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jyxNGjKynNzl; Tue, 14 Nov 2023 10:59:28 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 092FD828557F;
	Tue, 14 Nov 2023 10:59:28 -0600 (CST)
Date: Tue, 14 Nov 2023 10:59:25 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <648104660.47295764.1699981165881.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <72000dab-1d7e-464e-833b-0fe99574c742@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <1205485505.47107959.1699917571021.JavaMail.zimbra@raptorengineeringinc.com> <a42053ed-3a45-4dae-b953-00fb5aacb1de@kernel.dk> <146986614.47116966.1699920294190.JavaMail.zimbra@raptorengineeringinc.com> <7f74cf55-d1ca-482b-95c3-27b02996d999@kernel.dk> <1270025902.47126081.1699923171139.JavaMail.zimbra@raptorengineeringinc.com> <1357741503.47170425.1699938404661.JavaMail.zimbra@raptorengineeringinc.com> <72000dab-1d7e-464e-833b-0fe99574c742@kernel.dk>
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
Thread-Index: y1haLiACLbShTP80aFHniO4dI7dnjw==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Tuesday, November 14, 2023 7:17:22 AM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/13/23 10:06 PM, Timothy Pearson wrote:
>> 
>> 
>> ----- Original Message -----
>>> From: "Timothy Pearson" <tpearson@raptorengineering.com>
>>> To: "Jens Axboe" <axboe@kernel.dk>
>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>> <asml.silence@gmail.com>
>>> Sent: Monday, November 13, 2023 6:52:51 PM
>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>
>>> Seemed to do what I wanted, however corruption remains.  Was worth a try...
>>>
>>> I guess I'll proceed under the assumption that somehow the thread setup is
>>> stomping on userspace for now.
>> 
>> Finally found it!  Patch here:
>> 
>> https://lore.kernel.org/regressions/19221908.47168775.1699937769845.JavaMail.zimbra@raptorengineeringinc.com/T/#u
>> 
>> We were missing the appropriate barrier instruction inside the IPI
>> issued by the task_work_add() call, which was in turn issued during
>> queued io worker creation.  The explaination for how userspace was
>> getting corrupted boils down to an inconsistent view of main memory as
>> seen the two cores involved in the worker handoff and new worker
>> creation.
>> 
>> Who doesn't love a one line fix after a week and a half of pulling
>> one's hair out? ;)
> 
> Hate to be a debbie downer, but it still fails for me with that patch:
> 
> debian@linux-kernel--io-uring:~/git/server/mysql-test$ ./mtr
> --mysqld=--innodb-flush-method=fsync --mysqld=--innodb-use-native-aio=1
> --vardir=/dev/shm/mysql  --force encryption.innodb_encryption,innodb,undo0
> --repeat=500
> [...]
> encryption.innodb_encryption 'innodb,undo0' [ 39 pass ]   3101
> encryption.innodb_encryption 'innodb,undo0' [ 40 fail ]
>        Test ended at 2023-11-14 13:02:52
> 
> CURRENT_TEST: encryption.innodb_encryption
> mysqltest: At line 11: query 'SET @start_global_value =
> @@global.innodb_encryption_threads' failed: ER_UNKNOWN_SYSTEM_VARIABLE (1193):
> Unknown system variable 'innodb_encryption_threads'
> 
> The result from queries just before the failure was:
> SET @start_global_value = @@global.innodb_encryption_threads;
> 
> - saving '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/' to
> '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/'
> ***Warnings generated in error logs during shutdown after running tests:
> encryption.innodb_encryption
> 
> 2023-11-14 13:02:51 0 [Warning] Plugin 'example_key_management' is of maturity
> level experimental while the server is stable
> 2023-11-14 13:02:51 0 [ERROR] InnoDB: Database page corruption on disk or a
> failed read of file './ibdata1' page [page id: space=0, page number=220]. You
> may have to recover from a backup.
> 2023-11-14 13:02:51 0 [ERROR] InnoDB: File './ibdata1' is corrupted
> 2023-11-14 13:02:51 0 [ERROR] InnoDB: Plugin initialization aborted with error
> Page read from tablespace is corrupted.
> 2023-11-14 13:02:52 0 [ERROR] Plugin 'InnoDB' registration as a STORAGE ENGINE
> failed.
> 
> after about 40 loops. How consistent is it on your end? I know I've
> suspected the signaling before and tried the NO_IPI variant, but that
> still hit it.
> 
> If it makes a difference for you, it must be close. But don't think it's
> quite there yet, unfortunately :-(

Interesting!  I've run it for thousands of loops on my test VM, no failures.  Let me try on the shared test box.
