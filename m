Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069423FB34
	for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="HGRRvyR9"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-41e1967550aso5126601cf.1
        for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 05:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699967844; x=1700572644; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WWf2LpjcFSXW72E4pOe5efNJznN6LtGXmi4Aaa/gvxg=;
        b=HGRRvyR9UhBoEwtnzR218EbXd8oDHBhdsvk6E6vhs3ZVdmkVSazn6pdkqz4p+//Cj2
         rfyQfZbDZLWUOko0fLAgwKRhSCZvm9HDdNOVop3GJ20U00we5NL0wTjXl5P28ZUswcyz
         n+PHeJd2vyHRRDfRPlc9YSQYVS+wJ8/ZkV5Rr8yvCIzxn4EihgcFVW7cQrBIrRb0q0VM
         hI87F5ouIYiO8ff0+qhDZkqG15z9IRtruW/mr6ZUJQyJs14SIrCCPVo5SJYqnCsmsx12
         z37V/7BiyNGLPP8vrd0BfrJGmK8FPTaqWd6vYjD6bqXhhbn2eshGh1QJjq+xfkbNXWk1
         ZSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699967844; x=1700572644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WWf2LpjcFSXW72E4pOe5efNJznN6LtGXmi4Aaa/gvxg=;
        b=fEss4ryFHhPWo+AVw3G0JJWORWkBM2iLZ9rhU3e7EbzhXKveSSDz7cXbzcYlCTjOa3
         6zFStJkKY2j/B2WsqjFvNukASdH7Z9AtoB7SwK7qXehjIRbV0VYSarT5DT/5VBVS9Bis
         4Xb/6FdSwMliqPfJr7lAaLzeP5wpE2pG+2NtHWHOR+ubW65EcQNg7p46qYXHFEsN7BdF
         KciMX4ydxj7NzeQ3GTYtPGyQbMh/4gya0gOoWa5aqZO1xTO+A484VnzODXJGALoY665P
         GGQVQjonXQ8XATgcaJtThDPDrxsg5bCsKiKpw+Ht5MMJJNjIXVnnyEUAgi7Jvriiih2K
         0rrQ==
X-Gm-Message-State: AOJu0YyR7tVGqORzv6HZ80AtrKaodGqpJVfCVshUPcU2pzK7Zd6v+dQB
	mewzDC9ba1OeKe345EHHLHt2mw==
X-Google-Smtp-Source: AGHT+IF4ymTswcwGYewMFtzEDbVbGXAw3cj638JtjM3TFzTF+1jWHOnruaFltvQYqJfo8aBgKW9k/g==
X-Received: by 2002:a05:620a:1a17:b0:775:8fab:8c6d with SMTP id bk23-20020a05620a1a1700b007758fab8c6dmr2474986qkb.1.1699967843680;
        Tue, 14 Nov 2023 05:17:23 -0800 (PST)
Received: from ?IPV6:2600:380:9158:8653:d646:d45e:2850:11a1? ([2600:380:9158:8653:d646:d45e:2850:11a1])
        by smtp.gmail.com with ESMTPSA id k21-20020a05620a07f500b007759e9b0eb8sm2662062qkk.99.2023.11.14.05.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 05:17:23 -0800 (PST)
Message-ID: <72000dab-1d7e-464e-833b-0fe99574c742@kernel.dk>
Date: Tue, 14 Nov 2023 06:17:22 -0700
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
 <1843925555.47083836.1699909110545.JavaMail.zimbra@raptorengineeringinc.com>
 <483d8017-4d15-4367-bac4-0e420cb4eb54@kernel.dk>
 <1205485505.47107959.1699917571021.JavaMail.zimbra@raptorengineeringinc.com>
 <a42053ed-3a45-4dae-b953-00fb5aacb1de@kernel.dk>
 <146986614.47116966.1699920294190.JavaMail.zimbra@raptorengineeringinc.com>
 <7f74cf55-d1ca-482b-95c3-27b02996d999@kernel.dk>
 <1270025902.47126081.1699923171139.JavaMail.zimbra@raptorengineeringinc.com>
 <1357741503.47170425.1699938404661.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <1357741503.47170425.1699938404661.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/23 10:06 PM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Timothy Pearson" <tpearson@raptorengineering.com>
>> To: "Jens Axboe" <axboe@kernel.dk>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Monday, November 13, 2023 6:52:51 PM
>> Subject: Re: Regression in io_uring, leading to data corruption
>>
>> Seemed to do what I wanted, however corruption remains.  Was worth a try...
>>
>> I guess I'll proceed under the assumption that somehow the thread setup is
>> stomping on userspace for now.
> 
> Finally found it!  Patch here:
> 
> https://lore.kernel.org/regressions/19221908.47168775.1699937769845.JavaMail.zimbra@raptorengineeringinc.com/T/#u
> 
> We were missing the appropriate barrier instruction inside the IPI
> issued by the task_work_add() call, which was in turn issued during
> queued io worker creation.  The explaination for how userspace was
> getting corrupted boils down to an inconsistent view of main memory as
> seen the two cores involved in the worker handoff and new worker
> creation.
> 
> Who doesn't love a one line fix after a week and a half of pulling
> one's hair out? ;)

Hate to be a debbie downer, but it still fails for me with that patch:

debian@linux-kernel--io-uring:~/git/server/mysql-test$ ./mtr --mysqld=--innodb-flush-method=fsync --mysqld=--innodb-use-native-aio=1 --vardir=/dev/shm/mysql  --force encryption.innodb_encryption,innodb,undo0 --repeat=500
[...]
encryption.innodb_encryption 'innodb,undo0' [ 39 pass ]   3101
encryption.innodb_encryption 'innodb,undo0' [ 40 fail ]
        Test ended at 2023-11-14 13:02:52

CURRENT_TEST: encryption.innodb_encryption
mysqltest: At line 11: query 'SET @start_global_value = @@global.innodb_encryption_threads' failed: ER_UNKNOWN_SYSTEM_VARIABLE (1193): Unknown system variable 'innodb_encryption_threads'

The result from queries just before the failure was:
SET @start_global_value = @@global.innodb_encryption_threads;

 - saving '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/' to '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/'
***Warnings generated in error logs during shutdown after running tests: encryption.innodb_encryption

2023-11-14 13:02:51 0 [Warning] Plugin 'example_key_management' is of maturity level experimental while the server is stable
2023-11-14 13:02:51 0 [ERROR] InnoDB: Database page corruption on disk or a failed read of file './ibdata1' page [page id: space=0, page number=220]. You may have to recover from a backup.
2023-11-14 13:02:51 0 [ERROR] InnoDB: File './ibdata1' is corrupted
2023-11-14 13:02:51 0 [ERROR] InnoDB: Plugin initialization aborted with error Page read from tablespace is corrupted.
2023-11-14 13:02:52 0 [ERROR] Plugin 'InnoDB' registration as a STORAGE ENGINE failed.

after about 40 loops. How consistent is it on your end? I know I've
suspected the signaling before and tried the NO_IPI variant, but that
still hit it.

If it makes a difference for you, it must be close. But don't think it's
quite there yet, unfortunately :-(

-- 
Jens Axboe

