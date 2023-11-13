Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A5B23749
	for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 19:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="vgna/qsP"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4abf3b85d1bso161577e0c.1
        for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 11:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699903790; x=1700508590; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zfNpvq7iDo9vO6sEBEEedbH3APecMbYF9fyZt00W1bo=;
        b=vgna/qsP6fEOEy7diT3+WG3NU3OH8bPqaybpH8ui6+gCoMbwmhzjWs0QR8nO6/n2R0
         rMr1ICbqBr93BnzTcxVJ+XdKIHIBZioDOW5pl7QTjv098B1ef5ZyqJW2bNYSt0bSGXYR
         Uo5XVDtEPIkogWZVNSrInah2ReIizpaPm9C41rLkuoD46+I/NB/Q/Al7GWXsvvZxfoIS
         h8o+G5TdM7y1QzRATEg41HpYLbE+v47/qVDYUDJwLWIfVOvOauMGN9mWATLg2ptyy1sq
         CvRMtSjNTRX/7DNwX3plq3Jv/ks0B4Fu3bBh3r7aBXVZQS/IuNX5e3OSAYJjXP5gI2tL
         kLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699903790; x=1700508590;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zfNpvq7iDo9vO6sEBEEedbH3APecMbYF9fyZt00W1bo=;
        b=dWor2U4jP9qvmnOJY7MRaAAlyfngHs6D1VFedCmLeqb+AeNV17ZxCKZ6yyrZ0mAIbv
         wiCFBtpkk5S9nujmaO9i2NWvP2iTcaNDOeb+xt4qiUST49Z5p9PWV3/BmOCKmFUJEZc0
         KSnyD2SRTe+po9JtgKuamr5q2SLSx0AARMCpEYvzgFkF1mCw7WsbXYEbUozf7wsJ9yZl
         K70/wD2OjKcX0aCCNgz5UNiPtCSmIr7LV3ibSuaIj775+QvFBKXvngJom/XopQYpvl8b
         Qtgnoqdpg0VqKmFL/MmKDkEzog/Saykm0HV0gOlybBx7wbqAYNAhy5Bod3c1j1kEMyzX
         Vr5A==
X-Gm-Message-State: AOJu0YxxyqgrKhDQr8BQSndsi1YsEZ4b102i0gv7md3tCM73DWwEy8pg
	9Aspl+OfjgZmXhqM4CWxLoqFofG03FIXlTphkfN4Uw==
X-Google-Smtp-Source: AGHT+IFNXX+D/zUKUF/NSSHEP4PPT6uZXmx+v0+2IWmVpERGQ+d/AF95AP1ON2kaLxhPO06Qeo+Z/g==
X-Received: by 2002:a05:6122:146e:b0:4ac:30dc:bea9 with SMTP id r14-20020a056122146e00b004ac30dcbea9mr272840vkp.0.1699903790048;
        Mon, 13 Nov 2023 11:29:50 -0800 (PST)
Received: from [172.20.4.17] ([12.191.197.195])
        by smtp.gmail.com with ESMTPSA id pv10-20020ad4548a000000b0064f5d70d072sm2283152qvb.37.2023.11.13.11.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 11:29:49 -0800 (PST)
Message-ID: <5c59eda2-c638-4927-ac7a-aba7ffb284c7@kernel.dk>
Date: Mon, 13 Nov 2023 12:29:38 -0700
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
 <1475520442.46161385.1699590908294.JavaMail.zimbra@raptorengineeringinc.com>
 <776997436.46185793.1699598887190.JavaMail.zimbra@raptorengineeringinc.com>
 <eee9b0ff-dae7-4613-8c63-fed1043e047c@kernel.dk>
 <414471427.46558741.1699728159797.JavaMail.zimbra@raptorengineeringinc.com>
 <634718570.46592899.1699739843363.JavaMail.zimbra@raptorengineeringinc.com>
 <172487905.47043248.1699895175662.JavaMail.zimbra@raptorengineeringinc.com>
 <74c0d436-cb83-4c55-a4fd-4e0061ac19bb@kernel.dk>
 <1450850996.47063900.1699902121475.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <1450850996.47063900.1699902121475.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/23 12:02 PM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Monday, November 13, 2023 11:39:30 AM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/13/23 10:06 AM, Timothy Pearson wrote:
>>> ----- Original Message -----
>>>> From: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>> Cc: "Jens Axboe" <axboe@kernel.dk>, "regressions" <regressions@lists.linux.dev>,
>>>> "Pavel Begunkov"
>>>> <asml.silence@gmail.com>
>>>> Sent: Saturday, November 11, 2023 3:57:23 PM
>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>
>>>> Unfortunately I got led down a rabbit hole here.  With the tests I was running,
>>>> MariaDB writes the encrypted data separately from the normal un-encrypted page
>>>> header and checksums, and the internal encrpyted data on disk was corrupt while
>>>> the outer page checksum was still valid.
>>>>
>>>> I have since switched to the main.xa_prepared_binlog_off test, which shows the
>>>> corruption more easily in the on-disk format.  We are still apparently dealing
>>>> with a write path issue, which makes more sense given the nature of the
>>>> corruption observed on production systems.
>>>
>>> Quick status update -- after considerable effort applied I've managed
>>> to narrow down what is going wrong, but still need to locate the root
>>> cause.  The bug is incredibly timing-dependent, therefore it is
>>> difficult to instrument the code paths I need without causing it to
>>> disappear.
>>>
>>> What we're dealing with is a wild write to RAM of some sort, provoked
>>> by the exact timing of some of the encryption tests in mariadb.  I've
>>> caught the wild write a few times now, it is not in the standard
>>> io_uring write path but instead appears to be triggered (somehow) by
>>> the io worker punting process.
>>>
>>> When the bug is hit, and if all other conditions are exactly correct,
>>> *something* (still to be identified) writes 32 bytes of gibberish into
>>> one of the mariadb in-RAM database pages at a random offset.  This
>>> wild write occurs right before the page is encrypted for write to disk
>>> via io_uring.  I have confirmed that the post-encryption data in RAM
>>> is written to disk without any additional corruption, and is then read
>>> back out from disk into the page verification routine also without any
>>> additional corruption.  The page verification routine decrypts the
>>> data from disk, thus restoring the decrypted data that contains the
>>> wild write data stamped somewhere on it, where we then hit the
>>> corruption warning and halt the test run.
>>>
>>> Irritatingly, if I try to instrument the data flow in the application
>>> right before the encryption routine, the bug disappears (or, more
>>> precisely, is masked).  If I had to guess from these symptoms, I'd
>>> suspect the application io worker thread is waking up, grabbing wrong
>>> context from somewhere, and scribbling some kind of status data into
>>> memory, which rarely ends up being on top of one of the in-RAM
>>> database pages.  This could be an application issue or a kernel issue,
>>> I'm not sure yet, but given the precise timing requirements I'm less
>>> and less surprised this is only showing on ppc64 right now.
>>>
>>> As always, investigation continues...
>>
>> I wonder if this has to do with copy_thread() on powerpc - so not
>> necessarily ppc memory ordering related, but just something in the arch
>> specific copy section.
>>
>> I took a look back, and the initial change actually forgot ppc. Since
>> then, there's been an attempt to make this generic:
>>
>> commit 5bd2e97c868a8a44470950ed01846cab6328e540
>> Author: Eric W. Biederman <ebiederm@xmission.com>
>> Date:   Tue Apr 12 10:18:48 2022 -0500
>>
>>    fork: Generalize PF_IO_WORKER handling
>>
>> and later a powerpc change related to that too:
>>
>> commit eed7c420aac7fde5e5915d2747c3ebbbda225835
>> Author: Nicholas Piggin <npiggin@gmail.com>
>> Date:   Sat Mar 25 22:29:01 2023 +1000
>>
>>    powerpc: copy_thread differentiate kthreads and user mode threads
>>
>> Just stabbing in the dark a bit here as I won't pretend to understand
>> the finer details of powerpc thread creation, but maybe try with this
>> and see if it makes any difference.
>>
>> As you note in your reply, we could very well be corrupting some bytes
>> somewhere every time. We just only notice quickly when it happens to be
>> in that specific buffer.
>>
>> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
>> index 392404688cec..d4dec2fd091c 100644
>> --- a/arch/powerpc/kernel/process.c
>> +++ b/arch/powerpc/kernel/process.c
>> @@ -1758,7 +1758,7 @@ int copy_thread(struct task_struct *p, const struct
>> kernel_clone_args *args)
>>
>> 	klp_init_thread_info(p);
>>
>> -	if (unlikely(p->flags & PF_KTHREAD)) {
>> +	if (unlikely(p->flags & (PF_KTHREAD | PF_IO_WORKER))) {
>> 		/* kernel thread */
>>
>> 		/* Create initial minimum stack frame. */
> 
> Good idea, but didn't work unfortunately.  Any other suggestions
> welcome while I continue to debug...

I ponder if it's still in there... I don't see what else could be poking
and causing user memory corruption.

-- 
Jens Axboe

