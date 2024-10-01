Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166CA8827
	for <regressions@lists.linux.dev>; Tue,  1 Oct 2024 01:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727745719; cv=none; b=QdSkGCA3mYoN/VjTO3BSKZqPdQfMP8YKbTDfcpPVfpjk5HO31LK38eB2QG0S/uuCAPSaklkwv1P+YRIAAWqDSZXMo7qCoU/1c78KeK8E8bT1t7D05wviCLsQTfumaTPnJ47IXVVvKwPrE2fLINTXW634T3qkhXeKo3lvVTuP8G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727745719; c=relaxed/simple;
	bh=0Pb6kqwcfzJSuPkPEfi5hivQZgAY9uS6U+YiW7bwzH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIUVUlo/yDkJOS1s04eLZRm2vsHkqzB6nX8qjpwmORs7xB9PO5GZEtZrGi25on5oKlSTHJN5/avFkOSr0Zz2sjIb72zmnyvjMvAz5synlQYntmKV6Z0Q0SePKzgIScuxBL42x4IlbQglfq1MKoxR+D+IGR6dZrvDPegJIrzZFnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=n7lR8ii7; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="n7lR8ii7"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7a9b049251eso392496685a.2
        for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 18:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1727745716; x=1728350516; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9EMKkGY8JiQyUELW/D0h8veqZgb1ODzmtoXQOTbwGZQ=;
        b=n7lR8ii7saBtL4zCHvWdVFICOVRDOdXbwxyzp8yPojFEfXho6ZcomuV6t0Mv6KtnCP
         S4bX+vC4DbeS9Jyg6VrC0+OCR/6MThatxYEShEcqzEBGUepmX067GxXDo3x1TTIqBzMH
         azzgVej8kU7dE30cxCX8JLsEu5PMA6zArWk6FCyknHAxXLvwmmMlfG3eZBw4ZoJNGJ89
         5aVMzFfVB20wcDC5C13rZi7VcOeSR5xQ5y3//mpX3O07u2jn2Dhuf84nWjZZm5tZmLld
         PsGXCfpOecdwQ4METHvw8AbCWusno+Z4obL2fPc79d4sFFPFsTgjkyscmO/2a3KlUoUW
         tmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727745716; x=1728350516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EMKkGY8JiQyUELW/D0h8veqZgb1ODzmtoXQOTbwGZQ=;
        b=S+Zq5ps4cRJzbKTA7OYEn+ZOzFg+6s2DGMi3V649Pt+wY4UJkcBwhFWGKB7qPRCSaR
         dTwcg0S66hpKMQdODelIl9O+2cRGc/9a2WICCkdNSt8zoSfDeHU7yovL5gjrKGc9m81V
         eLhckUhbVR9RbKrMF/rLWfEqrY49ivH4O/6UxbXpPOlx4OxtplYoILe8mTQiKhGGwZFN
         4V8ojmSNK6p7mCCBIm1Qp2oL+Ckl6C2RaG7/+xIob4WrqtEgHjZVA9P+X1T/a7n/DXhs
         aAM4V2y74dYa+G+EVNeICCEUdp4AcYBYRR00xCOIYchK4zpvi1M7MAykBp6k+RRUe9PQ
         sXVw==
X-Forwarded-Encrypted: i=1; AJvYcCVzhF9DeTZ4L4i2otCqGe5KxcADH0sRfFcqxpTv9AW6kEZ3b2IgkIyg4JPDgyQXQ/WX8FwQE1OlT13eow==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUNsFRaLi9vKyJ758HcDVntKnX9pQsaOAz02AZIc6SQolIHPNU
	QUKmOMnsUFYpycr3fPTT3+1nq0L1dyixj7eeE/QTd44MvdbsEajRyYtDJWI6kIs=
X-Google-Smtp-Source: AGHT+IHWLGA/BaXge2RcFCFj7nmUHQiL0UVsYGGIs/pHqYhtUX1ZqWjMo4zVt1XrL4p/22F3GB8azA==
X-Received: by 2002:a05:620a:1aaa:b0:79f:af4:66f1 with SMTP id af79cd13be357-7ae378c2cbfmr2350170585a.50.1727745715641;
        Mon, 30 Sep 2024 18:21:55 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:97cf:7b55:44af:acd6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae3783d086sm454654985a.107.2024.09.30.18.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 18:21:55 -0700 (PDT)
Date: Mon, 30 Sep 2024 21:21:53 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Parag W <parag.lkml@gmail.com>
Cc: anna-maria@linutronix.de, frederic@kernel.org,
	linux-kernel@vger.kernel.org, peterz@infradead.org,
	pmenzel@molgen.mpg.de, regressions@lists.linux.dev,
	surenb@google.com, tglx@linutronix.de
Subject: Re: Error: psi: inconsistent task state! task=1:swapper/0 cpu=0
 psi_flags=4 clear=0 set=4
Message-ID: <20241001012153.GC1349@cmpxchg.org>
References: <20240922102047.GA437832@cmpxchg.org>
 <20240923120339.11809-1-parag.lkml@gmail.com>
 <20240923154601.GC437832@cmpxchg.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923154601.GC437832@cmpxchg.org>

On Mon, Sep 23, 2024 at 11:46:08AM -0400, Johannes Weiner wrote:
> On Mon, Sep 23, 2024 at 08:03:39AM -0400, Parag W wrote:
> > FWIW, moving psi_enqueue to be after ->enqueue_task() in
> > sched/core.c made no difference - I still get the inconsistent task
> > state error. psi_dequeue() is already before ->dequeue_task() in
> > line with uclamp.
> 
> Yes, that isn't enough.
> 
> AFAICS, in psi want to know when a task gets dequeued from a core POV,
> even if the class holds on to it until picked again. If it's later
> picked and dequeued by the class, I don't think there is a possible
> call into psi. Lastly, if a sched_delayed task is woken and enqueued
> from core, psi wants to know - we should call psi_enqueue() after
> ->enqueue_task has cleared sched_delayed.
> 
> I don't think we want the ttwu_runnable() callback: since the task
> hasn't been dequeued yet from a core & PSI perspective, we shouldn't
> update psi states either. The sched_delayed check in psi_enqueue()
> should accomplish that. Oh, but wait: ->enqueue_task() will clear
> sched_delayed beforehand. We should probably filter ENQUEUE_DELAYED?
> 
> This leaves me with the below diff. But I'm still getting the double
> enqueue with it applied:
> 
> [root@ham ~]# dmesg | grep -i psi
> [    0.350533] psi: inconsistent task state! task=1:swapper/0 cpu=0 psi_flags=4 clear=0 set=4
> 
> Peter, what am I missing here?

Peter, any thoughts on this? It appears to be a regression caused by
152e11f6df293e816a6a37c69757033cdc72667d.

It's not just the warning in dmesg. The task state corruption causes a
permanent CPU pressure indication, which messes with workload/machine
health monitoring.
