Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF926405D9
	for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 17:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="L+tOQ++i"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-41cbcb392e5so9614821cf.0
        for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 09:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699981444; x=1700586244; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ueOZ7p52QQ7gcRXYukaPiHXyMriuWtL3VPX1/zB205A=;
        b=L+tOQ++iHrSlUKNHiMZs4XXe8ZE9eXqOZnAMVNDBpDi3jxEPbGZeMk1sntgxcynZ6x
         rNV6TV2F1R5L7eVYgNfdGanS6lGEEkHOudVKYtdzUPgsm4bH6igjowHPOplJrT36cVnB
         HWoFdE1tkolcP1aDbs9IOc9BTzQpHa4aDAiyECFigQOV9YT9FhIoWZZc/BsHlRGhJlDk
         VpDU/e0RD5Mt031fDAFMkMkGyd6A/lfpPwDV7Uj/ZezeIjZCqmrSq5swHawQLnznXykE
         k0Bjw+QuxXjZmkPV0arvXuT+J+bObdiFgrAchRG3jcto6O3TcS83ZwtVBIKZyaNX/CI5
         PLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699981444; x=1700586244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueOZ7p52QQ7gcRXYukaPiHXyMriuWtL3VPX1/zB205A=;
        b=OmHDoIS1FlmRmTT3/R+n7CKaRY/nQsClxK8/HOSFUnZstz2rnUOYqlIyuzc9XYbYz0
         dj0ngzHEuhY2wuJenSzrg/uFndmbHUmVAKjIOlltA0gI6aSrPseEWW+SruRzvJwVZl87
         xjPttWbbl/H9pF6LNbFWZ9xZx9FezclPslEAdTIzHgnYnwAJiUL74UiO+OHOjHMmXbsC
         dlUJmiiGEg9JyQcLLmkltA2hTrkSRfqIDUB4davbvRu+TqUzwHnlKxWgRl+pZbK24dTv
         cW3hBZsCi31kchIKYXqMh5wpxX0ks3Qt0r7gGR6AjLpZDXHAQCHzgBjwiREOMw3sa1df
         dgHg==
X-Gm-Message-State: AOJu0YxkiALFUD3gqUqsz1An7a8zVsGGNO5Xo235USvSptGmFojWLxO0
	eU/t6TBPAa4XHOqKRMuHh77zNg==
X-Google-Smtp-Source: AGHT+IFSfbBc105GR/PyEYEXISWnCEXjyNR5j6gcrFKX+nss1c1N1+wV/fGhhk1KaVLExAzDxVKJKw==
X-Received: by 2002:ac8:4e23:0:b0:421:c3a9:1e4d with SMTP id d3-20020ac84e23000000b00421c3a91e4dmr2628516qtw.3.1699981444620;
        Tue, 14 Nov 2023 09:04:04 -0800 (PST)
Received: from [172.25.84.204] ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id l19-20020ac84a93000000b0041b016faf7esm2857122qtq.58.2023.11.14.09.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 09:04:04 -0800 (PST)
Message-ID: <3056f9eb-1656-4e6d-b063-849573e685cd@kernel.dk>
Date: Tue, 14 Nov 2023 10:04:03 -0700
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
 <1205485505.47107959.1699917571021.JavaMail.zimbra@raptorengineeringinc.com>
 <a42053ed-3a45-4dae-b953-00fb5aacb1de@kernel.dk>
 <146986614.47116966.1699920294190.JavaMail.zimbra@raptorengineeringinc.com>
 <7f74cf55-d1ca-482b-95c3-27b02996d999@kernel.dk>
 <1270025902.47126081.1699923171139.JavaMail.zimbra@raptorengineeringinc.com>
 <1357741503.47170425.1699938404661.JavaMail.zimbra@raptorengineeringinc.com>
 <72000dab-1d7e-464e-833b-0fe99574c742@kernel.dk>
 <648104660.47295764.1699981165881.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <648104660.47295764.1699981165881.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/14/23 9:59 AM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Tuesday, November 14, 2023 7:17:22 AM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/13/23 10:06 PM, Timothy Pearson wrote:
>>>
>>>
>>> ----- Original Message -----
>>>> From: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>> To: "Jens Axboe" <axboe@kernel.dk>
>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>> <asml.silence@gmail.com>
>>>> Sent: Monday, November 13, 2023 6:52:51 PM
>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>
>>>> Seemed to do what I wanted, however corruption remains.  Was worth a try...
>>>>
>>>> I guess I'll proceed under the assumption that somehow the thread setup is
>>>> stomping on userspace for now.
>>>
>>> Finally found it!  Patch here:
>>>
>>> https://lore.kernel.org/regressions/19221908.47168775.1699937769845.JavaMail.zimbra@raptorengineeringinc.com/T/#u
>>>
>>> We were missing the appropriate barrier instruction inside the IPI
>>> issued by the task_work_add() call, which was in turn issued during
>>> queued io worker creation.  The explaination for how userspace was
>>> getting corrupted boils down to an inconsistent view of main memory as
>>> seen the two cores involved in the worker handoff and new worker
>>> creation.
>>>
>>> Who doesn't love a one line fix after a week and a half of pulling
>>> one's hair out? ;)
>>
>> Hate to be a debbie downer, but it still fails for me with that patch:
>>
>> debian@linux-kernel--io-uring:~/git/server/mysql-test$ ./mtr
>> --mysqld=--innodb-flush-method=fsync --mysqld=--innodb-use-native-aio=1
>> --vardir=/dev/shm/mysql  --force encryption.innodb_encryption,innodb,undo0
>> --repeat=500
>> [...]
>> encryption.innodb_encryption 'innodb,undo0' [ 39 pass ]   3101
>> encryption.innodb_encryption 'innodb,undo0' [ 40 fail ]
>>        Test ended at 2023-11-14 13:02:52
>>
>> CURRENT_TEST: encryption.innodb_encryption
>> mysqltest: At line 11: query 'SET @start_global_value =
>> @@global.innodb_encryption_threads' failed: ER_UNKNOWN_SYSTEM_VARIABLE (1193):
>> Unknown system variable 'innodb_encryption_threads'
>>
>> The result from queries just before the failure was:
>> SET @start_global_value = @@global.innodb_encryption_threads;
>>
>> - saving '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/' to
>> '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/'
>> ***Warnings generated in error logs during shutdown after running tests:
>> encryption.innodb_encryption
>>
>> 2023-11-14 13:02:51 0 [Warning] Plugin 'example_key_management' is of maturity
>> level experimental while the server is stable
>> 2023-11-14 13:02:51 0 [ERROR] InnoDB: Database page corruption on disk or a
>> failed read of file './ibdata1' page [page id: space=0, page number=220]. You
>> may have to recover from a backup.
>> 2023-11-14 13:02:51 0 [ERROR] InnoDB: File './ibdata1' is corrupted
>> 2023-11-14 13:02:51 0 [ERROR] InnoDB: Plugin initialization aborted with error
>> Page read from tablespace is corrupted.
>> 2023-11-14 13:02:52 0 [ERROR] Plugin 'InnoDB' registration as a STORAGE ENGINE
>> failed.
>>
>> after about 40 loops. How consistent is it on your end? I know I've
>> suspected the signaling before and tried the NO_IPI variant, but that
>> still hit it.
>>
>> If it makes a difference for you, it must be close. But don't think it's
>> quite there yet, unfortunately :-(
> 
> Interesting!  I've run it for thousands of loops on my test VM, no
> failures.  Let me try on the shared test box.

So odd. I guess it must be close if it's enough to make yours sane. The
other vm I've been using is just a small vm somewhere else, it has 8
threads of:

debian@linux-kernel--io-uring:~$ cat /proc/cpuinfo 
processor	: 0
cpu		: POWER9 (architected), altivec supported
clock		: 2200.000000MHz
revision	: 2.2 (pvr 004e 1202)
[...]
timebase	: 512000000
platform	: pSeries
model		: IBM pSeries (emulated by qemu)
machine		: CHRP IBM pSeries (emulated by qemu)
MMU		: Radix

-- 
Jens Axboe

