Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71913EA6C
	for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 16:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="bfzcxHSU"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-671188b2d44so13403496d6.0
        for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 08:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1700066819; x=1700671619; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+cvXKBPufXej+VGB5IBA7KmmzU0J2jNYSC8vIIuVTaI=;
        b=bfzcxHSU54alt1reyeKouaK98uo7+lKO2VkzGJ3ejHT9Iydw+mH25v933SKlpWm+bq
         ajQi5iWWgNvUuoDhnhsiIm7OnDMqR21aM2JjkeT+KE/02DaT9LyLWCGbVBkgo4vehmB/
         aHN7km9NVLKTBYWmH8PG/j5Z6xmxVdmvQQzByBgyvfhEAKQ2gIgfW7SBEiPTJferX8ZE
         +A/vIDRmaXE/IGNIgi8ye0CluR5duiwV2DIBFaQwH+aa5tyDW1vdCMF0dKaxEDsq778n
         on+GY8jdF1SaDnqV06QAiBPwFNOdwm5dDl2tKYzdX0+suBBEniVuifFwYldoDmRW/tbM
         ZCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700066819; x=1700671619;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+cvXKBPufXej+VGB5IBA7KmmzU0J2jNYSC8vIIuVTaI=;
        b=qBr48nwXioy9umZ+5JHzW2kAB4c83/wtvet/GTrCJmlH8Dt3j9KnBoCEWQ/ZSvX7n/
         4T5ijtWMMq/oCLnQ5wsdmFAjZxOk4ZPPvP9oVJ7PqZyvsLDBDw6lznPtBSP95jwSwufx
         ohTFgtNu8NUjEYYbjhKfIfHvE6dZYiwk3u6FRXyBVqyDLA1VTRRnIFwJbTw9On+KK8Zq
         WZEiQFGbvcUOpG1nwJDq3DLVCl9Gt3YcKM/j9tlofqMc9NDfn5SSjr7rIFm6HEOBIB5t
         b9QpNTaUyp8470iZvzVYyQ6pZLUp8U/SQy78g31ZtuU8TcICdXFw6Rx5xNxX/vyaN0fp
         vKbg==
X-Gm-Message-State: AOJu0YzewpyoHqh4PXpiK11poWBYLiDi9H//2CG7Dkzu+45vP2G5/kJ9
	Jf/VyqF4wTiwMqAf4tu39d+UQtHcQDSOBOWwRLI976uH
X-Google-Smtp-Source: AGHT+IGGiBvBdx0o1QrwlIQsJPwUcBLezVelWW66yKPNC9jePRXkFTqmU+KxZj5sUZ+vzOIk72J2yQ==
X-Received: by 2002:a05:6214:260c:b0:66d:1ff9:321f with SMTP id gu12-20020a056214260c00b0066d1ff9321fmr6073275qvb.6.1700066819476;
        Wed, 15 Nov 2023 08:46:59 -0800 (PST)
Received: from [172.25.84.204] ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id c10-20020a05621401ea00b006648514e276sm650771qvu.78.2023.11.15.08.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:46:58 -0800 (PST)
Message-ID: <580f9fdb-475b-4b92-8e90-cab2100464ea@kernel.dk>
Date: Wed, 15 Nov 2023 09:46:58 -0700
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
 <2027589474.47298231.1699982070160.JavaMail.zimbra@raptorengineeringinc.com>
 <3f4ec0a8-91a2-4928-aff8-9dd516d34c84@kernel.dk>
 <350382475.47299876.1699982492471.JavaMail.zimbra@raptorengineeringinc.com>
 <1454519264.47306517.1699984644120.JavaMail.zimbra@raptorengineeringinc.com>
 <12a87e52-92b7-44c3-886e-63bb7ebe56a6@kernel.dk>
 <1948840273.47309805.1699985546123.JavaMail.zimbra@raptorengineeringinc.com>
 <c35cbe80-1db5-483e-9438-1fb50621a1cc@kernel.dk>
 <280793250.47485917.1700046208883.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <280793250.47485917.1700046208883.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/23 4:03 AM, Timothy Pearson wrote:
> I haven't had much success in getting the IPI path to work properly,
> but by leaving task_work_add() in TWA_SIGNAL_NO_IPI mode I was at
> least able to narrow down one of the areas that's going wrong.  Bear
> in mind that as soon as I reenable IPI the corruption returns with a
> vengeance, so this is not the correct fix yet by any means -- I am
> currently soliciting feedback on what else might be going wrong at
> this point since I've already spent a couple of weeks on this and am
> not sure how much more time I can spend before we just have to shut
> io_uring down on ppc64 for the forseeable future.
> 
> Whatever the root cause actually is, something is *very* sensitive to
> timing in both the worker thread creation path and the io_queue_sqe()
> / io_queue_async() paths.  I can make the corruption disappear by
> adding a udelay(1000) before io_queue_async() in the io_queue_sqe()
> function, however no amount of memory barriers in the io_queue_async()
> path (including in the kbuf recycling code) will fully resolve the
> problem.
> 
> Jens, would a small delay like that in io_queue_sqe() reduce the
> amount of workers being created overall?  I know with some of the
> other delay locations worker allocation was changing, from what I see
> this one wouldn't seem to have much effect, but I'm still looking for
> a sanity check.  If we're needing to wait for a millisecond for some
> other thread to complete before moving on that might be valuable
> information -- would also potentially tie in to the IPI path still
> malfunctioning as the worker would immediately start executing.

If io_queue_sqe() ultimately ends up punting to io-wq for this request,
then yes doing a 1ms delay in there would ultimately then need to a 1ms
delay before we either pass to an existing worker or create a new one.

> On a related note, how is inter-thread safety of the io_kiocb buffer
> list guaranteed, especially on weak memory model systems?  As I
> understand it, different workers running on different cores could
> potentially be interacting with the same kiocb request and the same
> buffer list, and that does dovetail with the fact that punting to a
> different I/O worker (usually on another core) seems to provoke the
> problem.  I tried adding memory barriers to some of the basic recycle
> functions without too much success -- it seemed to help somewhat, but
> nowhere near complete resolution, and the buffers are used in a number
> of other places I didn't even try to poke at.  I wanted to get some
> feedback on this concept before going down yet another rabbit hole...

This relies on the fact that we grab the wq lock before inserting this
work, and the unlocking will be a barrier. It's important to note that
this isn't any different than from before io-wq was using native
workers, the only difference is that it used to be kthreads before, and
now it's native threads to the application. The kthreads did a bunch of
work to assume the necessary identity to do the read or write operation
(which is ultimately why that approach went away, as it was just
inherently unsafe), whereas the native threads do not as they already
have what they need.

I had a patch that just punted to a kthread and did the necessary
kthread_use_mm(), perform op, kthread_unuse_mm() and it works fine at
that point. Within the existing code...

-- 
Jens Axboe

