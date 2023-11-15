Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFB4364CF
	for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 18:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="XWldyuBJ"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6708d2df1a3so10365196d6.1
        for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 10:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1700073018; x=1700677818; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hll9EVzDHshbsl36PK1U4gx1dUxFVZOtLJPCswt7bRc=;
        b=XWldyuBJkYa8uaJBompIltH+E6kCyo9iDneNZ5a0e18ZgwrniNRi+6AJvwL55iDHKB
         fOX+I83gTSQ166XZ5V4QTmCUfYh24fP3548Sdmu1E57V6pkMTFDaZCZSNzw3o9DF7D57
         1RW3ppxOGvdbvjTz2v9clekjDPKbhE5WNU2UA4ZK+K2tF0ljXpwCwVb35qoa8bvM7Fbb
         vuC+nw9DZLESETZDXbz8ZCvAEi7lqav/NnNs+4TjHKTIqgN3HoZBgAKZvnemTCPv52wM
         VD1PQAJDUq0dD+K5292ODOW2TQL18sEU8byiIA1Nu9DbXaa9j48zVf8HeraI7arbKlZx
         pt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700073018; x=1700677818;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hll9EVzDHshbsl36PK1U4gx1dUxFVZOtLJPCswt7bRc=;
        b=jYZjndZqX/zPkOufdB3H33bpO1w2AMK4QM3EDCY7JIX++mwEzFFUuuMbnkSNlz+nV4
         nNXWgcg1YXlSvihOrt8CpOtoEW7oCD2S6WONI5QiPi2sT19+Rk3hWJgolLiSTeF8QDoS
         HxBYa4llFZwLNyIM8H8f4jmZFR3B72e/uS/k+5Fhu2jHkoFfIRBzqx2ZANvpIFOCRAG+
         k2aUjgbSNsLl6g4A2lASudLAQPwOQ5wghMsounxtwtGIsUWQ7++TO0iuI8a4VfmqFm/u
         VpQmEvHFqecWf2xwVTClAdJO+v9ZIJFLdx4jkjcuZXEQuu89qriNnZiUxlqQ5zqJGiPp
         p6wg==
X-Gm-Message-State: AOJu0YyZFKtwMx/EJ0KA0U3Se0D0mhIVSWQgVO7pIswqua1AwpmB9Sew
	aNRGYN1Az4ysLdxxlY8A+X/UKA==
X-Google-Smtp-Source: AGHT+IEgrTpRz1idi0gsGrdaHjayc9vxs3uQ8rQmv00xld6PQ/5jdw04fc25A0TJqLz0w+Hh1h2TOw==
X-Received: by 2002:a05:6214:400c:b0:66d:1b4e:77d6 with SMTP id kd12-20020a056214400c00b0066d1b4e77d6mr6206528qvb.5.1700073018347;
        Wed, 15 Nov 2023 10:30:18 -0800 (PST)
Received: from ?IPV6:2600:380:9174:8ba6:574e:42be:c115:95f1? ([2600:380:9174:8ba6:574e:42be:c115:95f1])
        by smtp.gmail.com with ESMTPSA id d10-20020a0ce70a000000b006754772bfd4sm725319qvn.21.2023.11.15.10.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 10:30:17 -0800 (PST)
Message-ID: <4e171c09-bb9a-422f-b92c-230bb1238b22@kernel.dk>
Date: Wed, 15 Nov 2023 11:30:15 -0700
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
 Pavel Begunkov <asml.silence@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
 <350382475.47299876.1699982492471.JavaMail.zimbra@raptorengineeringinc.com>
 <1454519264.47306517.1699984644120.JavaMail.zimbra@raptorengineeringinc.com>
 <12a87e52-92b7-44c3-886e-63bb7ebe56a6@kernel.dk>
 <1948840273.47309805.1699985546123.JavaMail.zimbra@raptorengineeringinc.com>
 <c35cbe80-1db5-483e-9438-1fb50621a1cc@kernel.dk>
 <280793250.47485917.1700046208883.JavaMail.zimbra@raptorengineeringinc.com>
 <580f9fdb-475b-4b92-8e90-cab2100464ea@kernel.dk>
 <2046281833.47549655.1700067821653.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2046281833.47549655.1700067821653.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/23 10:03 AM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>, "Michael Ellerman"
>> <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>
>> Sent: Wednesday, November 15, 2023 10:46:58 AM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/15/23 4:03 AM, Timothy Pearson wrote:
>>> I haven't had much success in getting the IPI path to work properly,
>>> but by leaving task_work_add() in TWA_SIGNAL_NO_IPI mode I was at
>>> least able to narrow down one of the areas that's going wrong.  Bear
>>> in mind that as soon as I reenable IPI the corruption returns with a
>>> vengeance, so this is not the correct fix yet by any means -- I am
>>> currently soliciting feedback on what else might be going wrong at
>>> this point since I've already spent a couple of weeks on this and am
>>> not sure how much more time I can spend before we just have to shut
>>> io_uring down on ppc64 for the forseeable future.
>>>
>>> Whatever the root cause actually is, something is *very* sensitive to
>>> timing in both the worker thread creation path and the io_queue_sqe()
>>> / io_queue_async() paths.  I can make the corruption disappear by
>>> adding a udelay(1000) before io_queue_async() in the io_queue_sqe()
>>> function, however no amount of memory barriers in the io_queue_async()
>>> path (including in the kbuf recycling code) will fully resolve the
>>> problem.
>>>
>>> Jens, would a small delay like that in io_queue_sqe() reduce the
>>> amount of workers being created overall?  I know with some of the
>>> other delay locations worker allocation was changing, from what I see
>>> this one wouldn't seem to have much effect, but I'm still looking for
>>> a sanity check.  If we're needing to wait for a millisecond for some
>>> other thread to complete before moving on that might be valuable
>>> information -- would also potentially tie in to the IPI path still
>>> malfunctioning as the worker would immediately start executing.
>>
>> If io_queue_sqe() ultimately ends up punting to io-wq for this request,
>> then yes doing a 1ms delay in there would ultimately then need to a 1ms
>> delay before we either pass to an existing worker or create a new one.
>>
>>> On a related note, how is inter-thread safety of the io_kiocb buffer
>>> list guaranteed, especially on weak memory model systems?  As I
>>> understand it, different workers running on different cores could
>>> potentially be interacting with the same kiocb request and the same
>>> buffer list, and that does dovetail with the fact that punting to a
>>> different I/O worker (usually on another core) seems to provoke the
>>> problem.  I tried adding memory barriers to some of the basic recycle
>>> functions without too much success -- it seemed to help somewhat, but
>>> nowhere near complete resolution, and the buffers are used in a number
>>> of other places I didn't even try to poke at.  I wanted to get some
>>> feedback on this concept before going down yet another rabbit hole...
>>
>> This relies on the fact that we grab the wq lock before inserting this
>> work, and the unlocking will be a barrier. It's important to note that
>> this isn't any different than from before io-wq was using native
>> workers, the only difference is that it used to be kthreads before, and
>> now it's native threads to the application. The kthreads did a bunch of
>> work to assume the necessary identity to do the read or write operation
>> (which is ultimately why that approach went away, as it was just
>> inherently unsafe), whereas the native threads do not as they already
>> have what they need.
>>
>> I had a patch that just punted to a kthread and did the necessary
>> kthread_use_mm(), perform op, kthread_unuse_mm() and it works fine at
>> that point. Within the existing code...
> 
> Would you happen to have that patch still?  It would provide a
> possible starting point for figuring out the exact difference.  If not
> I guess I could hack something similar up.

Let me see if I can find it, and make sure it applies on the current
tree. I'll send you one in a bit.

-- 
Jens Axboe

