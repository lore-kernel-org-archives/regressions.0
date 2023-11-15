Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71BE156CB
	for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 11:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="juQOuBLL"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id D98E882852AB;
	Wed, 15 Nov 2023 05:03:31 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id AxUkKTcmVv1x; Wed, 15 Nov 2023 05:03:31 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0A4D78285512;
	Wed, 15 Nov 2023 05:03:31 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0A4D78285512
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1700046211; bh=8ND+nIkmBW/9aHeEVDsQ2eaD4m+Xg1fKh2OfCnWD8f0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=juQOuBLLKvUA+RcYyH4YwdHmTVoLznznQEqQvJi6B9N3rBM41xocQ/MO0ciovOHo7
	 wzVtfRWkpMJ6JNhW6/7AEJs5g/E56+hP3FTKnXpkmAJDjIki0lubJ65SXmlps4sf7P
	 PgOuo26Wn/NOuGn1Uc5Jgvih4F8D2tui3Msis2Jg=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id e9TOpInOKNkh; Wed, 15 Nov 2023 05:03:30 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id D350482852AB;
	Wed, 15 Nov 2023 05:03:30 -0600 (CST)
Date: Wed, 15 Nov 2023 05:03:28 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>
Message-ID: <280793250.47485917.1700046208883.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <c35cbe80-1db5-483e-9438-1fb50621a1cc@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <2027589474.47298231.1699982070160.JavaMail.zimbra@raptorengineeringinc.com> <3f4ec0a8-91a2-4928-aff8-9dd516d34c84@kernel.dk> <350382475.47299876.1699982492471.JavaMail.zimbra@raptorengineeringinc.com> <1454519264.47306517.1699984644120.JavaMail.zimbra@raptorengineeringinc.com> <12a87e52-92b7-44c3-886e-63bb7ebe56a6@kernel.dk> <1948840273.47309805.1699985546123.JavaMail.zimbra@raptorengineeringinc.com> <c35cbe80-1db5-483e-9438-1fb50621a1cc@kernel.dk>
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
Thread-Index: 92PPe9qeXuyKx3vCYmhWU918U/7FZw==

I haven't had much success in getting the IPI path to work properly, but by leaving task_work_add() in TWA_SIGNAL_NO_IPI mode I was at least able to narrow down one of the areas that's going wrong.  Bear in mind that as soon as I reenable IPI the corruption returns with a vengeance, so this is not the correct fix yet by any means -- I am currently soliciting feedback on what else might be going wrong at this point since I've already spent a couple of weeks on this and am not sure how much more time I can spend before we just have to shut io_uring down on ppc64 for the forseeable future.

Whatever the root cause actually is, something is *very* sensitive to timing in both the worker thread creation path and the io_queue_sqe() / io_queue_async() paths.  I can make the corruption disappear by adding a udelay(1000) before io_queue_async() in the io_queue_sqe() function, however no amount of memory barriers in the io_queue_async() path (including in the kbuf recycling code) will fully resolve the problem.

Jens, would a small delay like that in io_queue_sqe() reduce the amount of workers being created overall?  I know with some of the other delay locations worker allocation was changing, from what I see this one wouldn't seem to have much effect, but I'm still looking for a sanity check.  If we're needing to wait for a millisecond for some other thread to complete before moving on that might be valuable information -- would also potentially tie in to the IPI path still malfunctioning as the worker would immediately start executing.

On a related note, how is inter-thread safety of the io_kiocb buffer list guaranteed, especially on weak memory model systems?  As I understand it, different workers running on different cores could potentially be interacting with the same kiocb request and the same buffer list, and that does dovetail with the fact that punting to a different I/O worker (usually on another core) seems to provoke the problem.  I tried adding memory barriers to some of the basic recycle functions without too much success -- it seemed to help somewhat, but nowhere near complete resolution, and the buffers are used in a number of other places I didn't even try to poke at.  I wanted to get some feedback on this concept before going down yet another rabbit hole...

Thoughts very much welcome, I don't have many hairs left to pull out! ;)
