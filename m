Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3BC1C5781
	for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 13:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728565407; cv=none; b=Y3PwcnYz43l0qtPxGoPLh2qnnK4uC3YgM8LnufU2MhkwO2EnxNARP2Zs5X+A5abrF3aVlrREdDBdcmOOTeVtBFYYDV5XgT+f+5Jh7moUt5c6zoudvuresaQ6r8A8WGGYXM90CfzHU131spoordCiSi++s/SFyq+Ax4wOl6WXrtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728565407; c=relaxed/simple;
	bh=cqB5smMsozRkB4jP7ySM7Z677IlXYIXG8mmgjSuA9oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ly+9JcthCxEDqwGDHlOARSvjYKtB2ijqMyaeaXqCH1kL7ypXuJzhzcXapWyOFHmphNuIA7Imyl50VDL5lbjHQOYiwzWLjRdrr4XXjRF+yKHNANVv9HtWEo0Cvh8TBS9Idd73PJRjgaIujNwff4U1mLDkGZ0DiTSWgANhPD6Gb3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=SwoKRXqI; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="SwoKRXqI"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7afc591c69cso51080585a.0
        for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 06:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1728565403; x=1729170203; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zz8jctQHQLdkYKPa0eysbx7cndDpR6sJ5ZE98zZOXWQ=;
        b=SwoKRXqIFm5pvTv8ZTZ+Q31AmeaAo31q8xgqzu3L8SDtIVhW3qvDHbYLPJb4k4MMT6
         LQwlmcYAyNexESpgAKRRiOQ9H3HNgOGiV6+3P3au/8jyyf2Meqi2j8khiAdnFNyjNL5w
         3MmXbwotFaejQJecuGSjlOLdJAy+xMV7ZDaLNDclIHIvkHXwAcGO5Psk517j9Bq7E8pF
         AynHoa0Tcb45PjGXzy95QH+iibYCxB5Yl/FM+D3+AZmdLP3rtSwFSHPmpzmSXRPpckWT
         bN7I2i5pGbsGVPN9MjSX7x4F+26uN9Y0E+NUDTD/svL5xLOPADjzrArYpRKBJZg2Rp9D
         SP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728565403; x=1729170203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zz8jctQHQLdkYKPa0eysbx7cndDpR6sJ5ZE98zZOXWQ=;
        b=jUbsmrpQoYRh6gQ0C0t18ZFgDOP4LLjBLbAdZ+GriILelwagbjHY74NQNyyPPpO1q9
         6CpB2vLv7448bY7a8gCKylkogwmibFIGKkYjctBkf3bKUxzzqwwK+lscODkTG7hj+KuR
         mWBJTy0S8O0sEPox50BIqCiJT4+apuUAqTpKIpDy7/ApG/6gTo5SAAjfkyJv442SlN4E
         D4jJ+F9BpCe2oRI3iOfXVUz1qYs6Klqv0nuXnb3+b8b2L/dHSm82wCuczXJKWrrLgYwy
         x6T/umcr/uKvbjcuAfNM2Yzty/MaFDqV4jxH/b7YGV/6YapkXtGchqL4EyCHhuzdpb+R
         VCrg==
X-Forwarded-Encrypted: i=1; AJvYcCX9EoXCwo1u1be6iG+wX/LymS7Ytt4hAqxyIVTXWqC/fje+DHTLlfajWsGghAZ59H7zcUdYgA0jJX07WA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxALGXpPteSxPTSMqC4sv2jtPVZdro8XV/C52nlsuaMjAXpSzI7
	Q6+vnIVTy/VtG5NrYU42S9q6X0Ujfv0MZNLkVR9qGjsTZ7aYYDfK71BioCmMN6g=
X-Google-Smtp-Source: AGHT+IGbRr+pYajEwQ8nR/4EEsQx2+uct5b4CidGwGQ6phMD5igHU+WeqC3mB8dXOKjIpobst/NNSQ==
X-Received: by 2002:a05:620a:394d:b0:79e:fcb8:815c with SMTP id af79cd13be357-7b111d4edd7mr539200985a.54.1728565402986;
        Thu, 10 Oct 2024 06:03:22 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1148d6a56sm45021685a.35.2024.10.10.06.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:03:21 -0700 (PDT)
Date: Thu, 10 Oct 2024 09:03:16 -0400
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
Subject: Re: [PATCH 3/3] sched/core: Indicate a sched_delayed task was
 migrated before wakeup
Message-ID: <20241010130316.GA181795@cmpxchg.org>
References: <20241010082838.2474-1-kprateek.nayak@amd.com>
 <20241010082838.2474-4-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010082838.2474-4-kprateek.nayak@amd.com>

Hi Prateek,

patches 1 and 2 make obvious sense to me.

On Thu, Oct 10, 2024 at 08:28:38AM +0000, K Prateek Nayak wrote:
> @@ -129,6 +129,13 @@ static inline void psi_enqueue(struct task_struct *p, bool wakeup)
>  	if (static_branch_likely(&psi_disabled))
>  		return;
>  
> +	/*
> +	 * Delayed task is not ready to run yet!
> +	 * Wait for a requeue before accounting.
> +	 */
> +	if (p->se.sched_delayed)
> +		return;

This one is problematic. It clears sleeping state (memstall, iowait)
during the dequeue of the migration but doesn't restore it until the
wakeup, which could presumably be much later. This leaves a gap in the
accounting.

psi really wants the dequeue and enqueue of the migration, even when a
task is delay-dequeued. We just have to get the context parsing right
to not confuse migration queues with wakeups.

I'll try to come up with a suitable solution as well, please don't
apply this one for now.
