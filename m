Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F11199FA2
	for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728588243; cv=none; b=psWn6JPsfVYwwJwwZAqti2C2My4TxlH0U0eW4O7YaTf5byB/heMzUpSgY6yWDMsbC5xMN9icNddj03gbqY/QZBeTXoEVJtzQ+a4Hy8N+2btpJkIk6faxevUNB11Vsz+7YfBM7MTmbcmaqIeCyeQzqDc8OcApZiAvWUaFCzpk/bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728588243; c=relaxed/simple;
	bh=66KBTKQ6NcMAQQUcCpPGAjzFBWkzOGqbuV6tYQl+gI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMVA2a4Pn6dSbLjKWy5bEJwSsQRMDNhUpALSKzptQDg3x2fC9tFxqSgclAOBYsErmqo54rr6bQxD6z4A5+ulMGCGnUCQO6vXAPXX/sDQAekeqDGXQRje8020taz0tnneFpdfCaKhO4/Dpjz1BKWni6b/0CKzMPPiIwRn0lH18xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=vmJky5b3; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="vmJky5b3"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6c5acb785f2so7581796d6.0
        for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 12:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1728588239; x=1729193039; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vrQEWn5/w+Y6IS85vKSKnwu6LL413ydIBaXoz3HnS8E=;
        b=vmJky5b3XBG5wRqgmWKL3LaOOsb+A4miuSLVQg3WjXYSildppB6NSSY6fgCuo9LPgW
         FtiGMMJGbGD9285O03j3UyAaXrorB33b59dhHod1wJKiXQX/x9gfhhHbw605EHSwh2H4
         ILCE0J5ybYPbe5u0OZWP+P42/Mm72Jbg7mbSqBnYn1/nFbH6adGrpgJ1y7gKDGaGIGSf
         ka236x6j8LPFXcnKyOROP7zyNSAH3X9vui90haGnPcKI5ctFrVWXNJqlgECOJIRW6LqU
         V5MEEE/DkqRN+xR94z4N62vCGls+RhlpVmcvnxvAgqOhk+UEnPslIQuyqDrn8Fa0h/e3
         /hHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728588239; x=1729193039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrQEWn5/w+Y6IS85vKSKnwu6LL413ydIBaXoz3HnS8E=;
        b=s4wf3UCeUB5kBVfgl8dMp5S0I+mHmLI025mAsL6WxuZJfdTh12k+kFSN+kIzW0vLuV
         CGtJvCcdicQWtipHpUcBzTDB3nQZB8pQ7SRs6JTyiI0tRbocfZxtJP3SBBAftJLkLXB9
         vw6Mb4poeOdROru9Z0Ps4z6p4BVSFciTYkhJ5r+4YxSf5+/WbQNA3acJxuRtlYaErBT2
         XqiCZsa+mxh2kvmcfpzd7oqfB5i6WBE0AxGSSu4fyds55FUo7Fjrtv22lXwWw1O9GfEn
         dUgr3prjSg/8a5zD79lVcxp2WQSR6TDQ6rSiAPX8B16+O4j0Y9/2VOp/QsP2HkKtKFvw
         jApA==
X-Forwarded-Encrypted: i=1; AJvYcCXH9djDoDOm6B/XwHLp1XynquhQTcuhWfz/8s0CBF0g3w7+ilIs3raUm8mFHdPczW42rGRkJA8Qqli4MQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjELcc0MRE+aRb9LbcIScgf5wVlfzCoKJBHzUhLl/FHpXnxpDK
	gN27lgsRTmVguGBIoGorlf21SrYoZiDwL7Ui96EaknViQyPDvIfFJZhh92ESD1M=
X-Google-Smtp-Source: AGHT+IEStr6X+z6bYcPqki2wni4vVBvRUMWaf8Uozji0MAOTu9qBmNfU3369uwtWQ7P+wnKjZ8trgg==
X-Received: by 2002:a05:6214:5b06:b0:6cb:e4d3:91c5 with SMTP id 6a1803df08f44-6cbf0098734mr1878596d6.36.1728588239347;
        Thu, 10 Oct 2024 12:23:59 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe8608d68sm8152416d6.94.2024.10.10.12.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 12:23:58 -0700 (PDT)
Date: Thu, 10 Oct 2024 15:23:53 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Peter Ziljstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Klaus Kudielka <klaus.kudielka@gmail.com>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Youssef Esmat <youssefesmat@google.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Bert Karwatzki <spasswolf@web.de>, regressions@lists.linux.dev
Subject: Re: [PATCH 1/3] sched/core: Dequeue PSI signals for blocked tasks
 that are delayed
Message-ID: <20241010192353.GB181795@cmpxchg.org>
References: <20241010082838.2474-1-kprateek.nayak@amd.com>
 <20241010082838.2474-2-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010082838.2474-2-kprateek.nayak@amd.com>

On Thu, Oct 10, 2024 at 08:28:36AM +0000, K Prateek Nayak wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> psi_dequeue() in for blocked task expects psi_sched_switch() to clear
> the TSK_.*RUNNING PSI flags and set the TSK_IOWAIT flags however
> psi_sched_switch() uses "!task_on_rq_queued(prev)" to detect if the task
> is blocked or still runnable which is no longer true with DELAY_DEQUEUE
> since a blocking task can be left queued on the runqueue.
> 
> This can lead to PSI splats similar to:
> 
>     psi: inconsistent task state! task=... cpu=... psi_flags=4 clear=0 set=4
> 
> when the task is requeued since the TSK_RUNNING flag was not cleared
> when the task was blocked.
> 
> Explicitly communicate that the task was blocked to psi_sched_switch()
> even if it was delayed and is still on the runqueue.
> 
>   [ prateek: Broke off the relevant part from [1], commit message ]
> 
> Link: https://lore.kernel.org/lkml/20241004123506.GR18071@noisy.programming.kicks-ass.net/ [1]
> Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
> Closes: https://lore.kernel.org/lkml/20240830123458.3557-1-spasswolf@web.de/
> Closes: https://lore.kernel.org/all/cd67fbcd-d659-4822-bb90-7e8fbb40a856@molgen.mpg.de/
> Tested-by: Johannes Weiner <hannes@cmpxchg.org>
> Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
