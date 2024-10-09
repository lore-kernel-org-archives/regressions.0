Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9BB1E633C
	for <regressions@lists.linux.dev>; Wed,  9 Oct 2024 18:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728497250; cv=none; b=KZSnL5PgOI9r58fW6DwatzgFyKpM8yUYZctDq43alUxlYtgOAfbfxOeySSqnUPfo+FqI8D7QrDaD1QmC22sWK18/F/qqMDTwh0nIGyLxuq82/2//5MzrSLj3WqN3dNhA9O92hDBq7VMP87q+ex1sMpAhLSPBlaVtoWqdrBATSR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728497250; c=relaxed/simple;
	bh=EEA9n8EKVuqwjoaU8xFSnE5n9WHqzdY3/Ze8q36DibQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTNZBO0b5O9TawaQOvLyRvb2IAAwfqzC+UsDO0lnBtPSvU/APOrFPWnO1/1pmXX2CMgv9oJlxOuMMaW2EM3YLgzuGjyaeJY7TVxETjpTRGD/EiUQbB9q3SOavbe5mUEwg3UwRuCGFUmKwqoeou7A1HhGhEcq7wT5x1fzFNPvqpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=URqprv1k; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="URqprv1k"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7afcd322cabso1307885a.1
        for <regressions@lists.linux.dev>; Wed, 09 Oct 2024 11:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1728497245; x=1729102045; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VcKIKjFFXK/pS61017tWFdVnKhermK+qoG7rd4+wtqU=;
        b=URqprv1k19S3r5wmPoOfRVDqSPaLlluI4QtDcPNrd8/VvfCRAKdADid8kLccYIo8vl
         OF8oXN4hw31v57gz0HQcqHte111ViMjyi9R2RSD9i9IPi/E4VAWXj9rDCkyXUh6oI0he
         ZXWCnVvQolCFqquAcEducx0cBe8f8gBCh23r3x3b4u5lB7xvVE0VCTTr+EiymeEtTJnp
         ffeDETH2j0O5k1E06Z/fD7jIKSciqeZ/pD+JoYUdQsk2nJlE1R3yWHY9hWLtXFOCfDbV
         WPYX+jPAKOnw+e0D58pJr7IPo/EuZFWdrkBCa3oJGVsbx1JP/qigYgpwzMVGFq1zUjoT
         5uwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728497245; x=1729102045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcKIKjFFXK/pS61017tWFdVnKhermK+qoG7rd4+wtqU=;
        b=aUdCIgP0jhMzNe5efsrqInuZR5YLVPmO6zF1ENX+mGZUpil3YaZT/P9XQEJD2UEdVP
         b6wPDUplCMSdHS0iw83SgNkoscc4sntVgUay/8yB+sYcGXaIhR37EgI8St7V1EVuOdBT
         EGJhsS6MWAt/XhcncI0KtBGqyItiEYlzBcpzp12iVanBkkfdpaQDmOpEaKp52KlAEz7M
         xIOeF71VJZtg9ZMgkGXblGln7L07wN04t4QPU40eN/XxvBKUZ30EH/SDWAckjlhkRI8c
         I8wD49pLOawJcCAv/soBmOyyvKTx8Z3TPDEg6qe1Pe0x0QEOYZkFyyrF56TfrDjGj0tB
         DBbA==
X-Forwarded-Encrypted: i=1; AJvYcCXYD9/TrSUyVZFd/km99Y7sJGl2vFYC1I/BtYjiNGHV+2H1m5O2Mf5+NRzi9yZeJGti0VnUkRWHlrc8/A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9Q0u0We3P5dNvmTKZWW5iLGQx/4r9IokfSGRwZft4Nt2nWb4e
	TzXKVQ9UoEyPAoZewAWrJhAvjALIj1wvjIygVao2fjAO5OS55NFFbUDeOSFtkRQ=
X-Google-Smtp-Source: AGHT+IGXngKYT3dFEA0sPgqcLJmf5vE14K+Prq/oZohyFklv4PBlQGh/cKRA9mAbjHHwCZUeGMk5GA==
X-Received: by 2002:a05:620a:460b:b0:7ae:5c5b:a3e8 with SMTP id af79cd13be357-7b07954f02amr378290285a.34.1728497244587;
        Wed, 09 Oct 2024 11:07:24 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7afceb513b4sm132146785a.19.2024.10.09.11.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 11:07:23 -0700 (PDT)
Date: Wed, 9 Oct 2024 14:07:19 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Klaus Kudielka <klaus.kudielka@gmail.com>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	linux-kernel@vger.kernel.org, bsegall@google.com,
	dietmar.eggemann@arm.com, efault@gmx.de, juri.lelli@redhat.com,
	mgorman@suse.de, mingo@redhat.com, rostedt@goodmis.org,
	tglx@linutronix.de, vincent.guittot@linaro.org, vschneid@redhat.com,
	wuyun.abel@bytedance.com, youssefesmat@chromium.org,
	spasswolf@web.de, regressions@lists.linux.dev,
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>
Subject: Re: [REGRESSION] Re: [PATCH 17/24] sched/fair: Implement delayed
 dequeue
Message-ID: <20241009180719.GD6937@cmpxchg.org>
References: <20240830123458.3557-1-spasswolf@web.de>
 <ZvA7n9GNoD-ipjkj@debian.local>
 <1ee5f5828e2021bf1051dc1f9b6f01a8c061ffb1.camel@gmail.com>
 <2128d714-90f7-1598-b32b-559206fce5de@amd.com>
 <20241004123506.GR18071@noisy.programming.kicks-ass.net>
 <20241004135744.GB1658449@cmpxchg.org>
 <fae14e09-cd35-5feb-c3b4-8318a76b26a3@amd.com>
 <c97da254-9add-85bb-cd46-7c0d5ac77548@amd.com>
 <f82def74-a64a-4a05-c8d4-4eeb3e03d0c0@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f82def74-a64a-4a05-c8d4-4eeb3e03d0c0@amd.com>

On Tue, Oct 08, 2024 at 09:54:52PM +0530, K Prateek Nayak wrote:
> From 2e15180e18b51e9a2bc0d7050e915a70d2673a06 Mon Sep 17 00:00:00 2001
> From: K Prateek Nayak <kprateek.nayak@amd.com>
> Date: Fri, 4 Oct 2024 15:24:35 +0000
> Subject: [RFC PATCH] sched/psi: Fixup PSI accounting with DELAY_DEQUEUE
> 
> After the merge of DELAY_DEQUEUE, "psi: inconsistent task state: warning
> were seen early into the boot. The crux of the matter is the fact that
> when a task is delayed, and the delayed task is then migrated, the
> wakeup context may not have any idea that the task was moved from its
> previous runqueue. This is the same reason psi_enqueue() considers
> only ...
> 
>      (flags & ENQUEUE_WAKEUP) && !(flags & ENQUEUE_MIGRATED)
> 
> ... as a wakeup. In case of a wakeup with migration, PSI forgoes
> clearing the TSK_IOWAIT flag which seems to be the issue I encountered
> in my splat previously.
> 
> With that said, the below diff, based on Peter's original approach
> currently seems to work for me in the sense that I have not seen the
> inconsistent state warning for a while now with my stress test.
> 
> Two key points of the approach are:
> 
> o It uses "p->migration_flags" to indicate a delayed entity has
>    migrated to another runqueue and convey the same during psi_enqueue().
> 
> o It adds ENQUEUE_WAKEUP flag alongside ENQUEUE_DELAYED for
>    enqueue_task() in ttwu_runnable() since psi_enqueue() needs to know of
>    a wakeup without migration to clear the TSK_IOWAIT flag it would have
>    set during psi_task_switch() for blocking task and going down the
>    stack for enqueue_task_fair(), there seem to be no other observer of
>    the ENQUEUE_WAKEUP flag other than psi_enqueue() in the requeue path.
> 
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>

Tested-by: Johannes Weiner <hannes@cmpxchg.org>

It fixes the warning and bogus pressure values after stressing it for
an hour or so with tons of cpu contention and cgroup movements.
