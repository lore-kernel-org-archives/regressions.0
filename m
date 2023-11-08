Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0BC18A
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 00:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="erF0RU9r"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-589cfab9bdaso96588eaf.0
        for <regressions@lists.linux.dev>; Tue, 07 Nov 2023 16:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699402181; x=1700006981; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8MhdZ8plKpyaDsHA3grYMhy3ht7EWBlsGPowBGdSrN8=;
        b=erF0RU9r8eDVlUO417bi+YcFdA47ZeGihkh3Ko/4Fkwb+EvpJM67QSpyaTrrCaPNEy
         QBqfdoVBLt75JctLkKccgOM3gV/q7Ryusn+pvzKwyTNIGpvaFsyOKB2uZhptJAnJZwYZ
         OpBT9U40xNhEfaady9gL+fwpsJ6K5sWn2ZLF6zhGpKEoO3zh5V+eTaKZgdUnNnvDOyaK
         IoPGy7oqQwcIxJ2cxL7AgGm7vhb0BdBq//WFWE4SYYQ9yWfngcpKTuBCZSAW+zfcGWTN
         H4jUlReZqFuYN6H4tzu+FF2IB+qASIbbEih+4hustqjf1Hvtyi3YjNEZOGSEkwoHBGNn
         08zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699402181; x=1700006981;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8MhdZ8plKpyaDsHA3grYMhy3ht7EWBlsGPowBGdSrN8=;
        b=pItlTJ2g2eNhnsBIEu1vZsouxcwtrfVbym6+4qJb8LdHMh2Zj3B7ZgnHYYS8xFTsTV
         2lvCBAp+QfJeU+PchD6ESHwG9KIjAVXp7myZ/gkxQDukDgXUfecvzdCnZpZSkc65yZ5D
         xiiL0zUoj1H2AgaFRCItKRAjH+CVhuNnZ+lcND8wR5/OKYUDKcnKpiN+xAWKNyWucype
         0zR6h5AdkM3yBwDzTWiImkcPLMHouFCVmsmDuRzsnM2CGhat+EfgrKf1ZigV5nC5YYMs
         TWsP0P1vbpoZ25P+HWTZxjo3RqN4S7QYsTyTOvnNd8HcZGF+QyfKMFH3/gOQIgwB4NFd
         RvcA==
X-Gm-Message-State: AOJu0YwEFIUcyVVmt+fQ2vIFHtqvlzYqCzV6cHGBA/OK+8a0ybSL0MRx
	uuqMSSh/TaJg4gvOHBma1VTwXA==
X-Google-Smtp-Source: AGHT+IHp+8c7cALoSL0CwS/H3eFuoRxyPBzeRWamUa0HAPiU0Tds0nxRQs0IXOglV1Svr/74W3xynw==
X-Received: by 2002:a05:6871:a9c3:b0:1ef:9f6c:3dee with SMTP id wp3-20020a056871a9c300b001ef9f6c3deemr300402oab.1.1699402180947;
        Tue, 07 Nov 2023 16:09:40 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id y188-20020a6364c5000000b005b92ba3938dsm1936386pgb.77.2023.11.07.16.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 16:09:40 -0800 (PST)
Message-ID: <217cea83-f527-4e86-97c2-dc9a2f8f937b@kernel.dk>
Date: Tue, 7 Nov 2023 17:09:39 -0700
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
 <fbdefa85-f63b-48eb-825a-a16ae27b749b@kernel.dk>
 <23615262.45634897.1699396185842.JavaMail.zimbra@raptorengineeringinc.com>
 <727263b4-2f8c-44bf-b7b8-5a936718df76@kernel.dk>
 <505960353.45641688.1699398777243.JavaMail.zimbra@raptorengineeringinc.com>
 <7bd67c30-3b9f-4541-864a-b082917ee8b5@kernel.dk>
 <712095554.45645374.1699400040368.JavaMail.zimbra@raptorengineeringinc.com>
 <8d966878-f7fd-43c8-bd91-ac33408c9317@kernel.dk>
 <1768720690.45649923.1699401768289.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <1768720690.45649923.1699401768289.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/23 5:02 PM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Tuesday, November 7, 2023 5:52:54 PM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/7/23 4:34 PM, Timothy Pearson wrote:
>>>
>>>
>>> ----- Original Message -----
>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>> <asml.silence@gmail.com>
>>>> Sent: Tuesday, November 7, 2023 5:16:24 PM
>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>>
>>>> But since you said you're seeing exits on signal 9, that would seem to
>>>> indicate that someone ran SIGKILL with potentially pending IO.
>>>
>>> Just to make sure we're talking about the same thing, when I refer to
>>> signal 9 I am referring to instrumentation I added to the
>>> get_signal(&ksig) call.  I am seeing 9 in the ksig.sig field.  I
>>> assume the SIGKILL is not expected, i.e. not coming from another
>>> location in the io_uring kernel code?
>>
>> ksig.sig is set to signr, which is the number of the signal. So that
>> would seem to indicate that _someone_ is sending SIGKILL. But at the
>> same time, you don't see any of the cancel-on-exit triggering. Puzzling!
>> io_uring or io-wq doesn't send any signals.
>>
>> In your instrumentation, are you checking where the signal is coming
>> from?Is it being dequeued as an actual signal, or is it some other
>> condition in get_signal() that ends up setting it to SIGKILL?
> 
> I still need to check this in more detail.  What I do know at the
> moment is that the kill seems to be related to the entire workqueue
> going down, i.e. it is sent to the workers of a given workqueue after
> io_wq_put_and_exit() and io_wq_exit_workers() are called for that
> workqueue.  Not sure if that helps any, will keep digging...

Another option is that it's doing exec() with pending IO, which will
cancel it. But I'm also assuming that mtr/friends will check result
values of writes and would've caught that there.

>> I don't expect the below to do anything as it _seems_ it's correct
>> as-is, but...
> 
> <snip>
> 
> No change.  As you said, it's correct as-is. :)

I thought so, but try and not take anything for granted at this point.

-- 
Jens Axboe

