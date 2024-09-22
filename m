Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E3F13A260
	for <regressions@lists.linux.dev>; Sun, 22 Sep 2024 10:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727000458; cv=none; b=Dgithvu5ObCyAW/jyA9kqvGJKwqXiAh0wZo6y5Ir031IDepnyS+iAa7xdDgnc5w4cXwJD8B4fbY/dxHUx+zwAyKBxdXEboNw65nsBve+ouH3C9BYfpKAaRRZTC/CbsBKVmGrnuXQX2Ffm5R4r3gU2Ew7Nvmjrqd1h7a+nv7GqIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727000458; c=relaxed/simple;
	bh=pm8dHJrsGf7Il9p55Q7LINTzOlFn/8nsA6d/5jUfSgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7zB2u7yNPbF+VVtqemw7lfKoN1BD+6YVA7bnQwK4czXdLj2xrGLJSaYyLiaQzL0f9pNuZ7MAqwcZxiMgFnwMDeNqE237QjPM2rJbpEOioQIhY1TIIzFs2Q1QMExty9P08DARmxtkm32wTuSLWOSAykrTXoFg/pUjh/A04YEBcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=PQY0yGCt; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="PQY0yGCt"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4582fb3822eso25458841cf.1
        for <regressions@lists.linux.dev>; Sun, 22 Sep 2024 03:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1727000453; x=1727605253; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8/4SWBzBRsRFoXrz0ENhRuWuJUVz2So0jJkLzHcuiZk=;
        b=PQY0yGCtPS7Py1aJSlhL6eJsVycHGS0QGcmvDskjzT7G5n4k5xQxcv5/W9wPjJzSY5
         wTWBinxqf+biuqB09MnII0QBDnnXZVDLWOP3LZ2s4ZG4jD4DWaJhSYvEl6Id+tvcLSIS
         cYCrvVgHoFwHlyWcGvC3YOihY73IRkFEFgbYf/xXNt08AHYjNfU6Awaxe+nXte2JSAyu
         yENF/C9Ha6p6227dsJupCA5Z5UtiSBiWWbkC22WR63p+ZUQCTRdGnPjRs1EXkLad/HQq
         rhg4MWHzK5yqb8QNvYKuCDixhcGum3E2MXlWmDoZVFtkysxOnddVyUX3atWtGQm1R7iP
         VEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727000453; x=1727605253;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8/4SWBzBRsRFoXrz0ENhRuWuJUVz2So0jJkLzHcuiZk=;
        b=WKbTI36ZfUBHbOy73trNzCXuhcQOyqzMzn+0e5kBlb6J7VF0QsrY1JSc07ukg+LDlz
         e5I16dRAQFAQJYK5WN5xTvwIsV2k4SdpBSUY7cHFOOch5VFOYuqAFaCwJ0cot2OPmJ5f
         8Swj3BxTzqTeaRb5DM/o8JWT/dPMN1memaRSvlqtWYvMjKbffzlVuKoKTeZh4bt9sXM6
         mOc7FIygBxN0QHH9mXzfqCOflEux1Xr9+1GgZGYDTn3FaAe2TunE1dFCdbUZAB0lFmGQ
         O+A5xyS9GQLMbgxT6OBxFml+HNMZLmbl+b6vj1PQYG/470eK6Yc0hxIThw+Y5/NMPpJS
         bElg==
X-Forwarded-Encrypted: i=1; AJvYcCXPfbhgfAEc7XkJ5vbemaYWEN3haChReUb0Wy2QqQpMYkUbgQNabsqqCb9bn2LJdk2qyyni7/RQjIY7bw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8GE0mK13It8riWOVHibD0yaoHA9WgdSiCvE5UF6YTwWFMHhmz
	pQLQsah+HcEPl8RIY89mD6cA/NbDP3ZCZVUd5afOnnWE5ymXazaL4B1XPFwPIl0=
X-Google-Smtp-Source: AGHT+IFjZiKh0O4Hjrg2ghYZK1LOtr5fLh5RrB8KD0gWAtgtR2Dj9yb3WBwXo5/FEiuyo9gA0F7Thg==
X-Received: by 2002:a05:622a:14c:b0:458:4dc5:b7ef with SMTP id d75a77b69052e-45b2057e770mr127555161cf.55.1727000453197;
        Sun, 22 Sep 2024 03:20:53 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b1788c181sm35890941cf.52.2024.09.22.03.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 03:20:52 -0700 (PDT)
Date: Sun, 22 Sep 2024 06:20:47 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev
Subject: Re: Error: psi: inconsistent task state! task=1:swapper/0 cpu=0
 psi_flags=4 clear=0 set=4
Message-ID: <20240922102047.GA437832@cmpxchg.org>
References: <cd67fbcd-d659-4822-bb90-7e8fbb40a856@molgen.mpg.de>
 <0bfb1dfc-bab0-45c1-9fc0-7e91266ef52a@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0bfb1dfc-bab0-45c1-9fc0-7e91266ef52a@molgen.mpg.de>

On Sun, Sep 22, 2024 at 08:53:37AM +0200, Paul Menzel wrote:
> [Cc: +PSI maintainers]
> 
> Am 22.09.24 um 00:50 schrieb Paul Menzel:
> > #regzbot introduced: 2e0199df252a..54a58a787791
> > 
> > Dear Peter,
> > 
> > 
> > With merge commit 2004cef11ea0 (Merge tag 'sched-core-2024-09-19' of 
> > git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip) I see the warning 
> > below on the Intel Kaby Lake laptop Dell XPS 13 9360 and with QEMU.
> > 
> > Dell XPS 13 9360:
> > 
> >      psi: inconsistent task state! task=1:swapper/0 cpu=0 psi_flags=4 clear=0 set=4

Oh, double enqueue.

It looks like the psi enqueue/dequeue callbacks need the same
treatment as the uclamp and sched_core ones for ignoring delayed
tasks. [1][2]

Do we need to reorder psi_enqueue() after ->enqueue_task() as well? I
can't quite work out why uclamp needed it, but sched_core didn't.

[1] dfa0a574cbc47bfd5f8985f74c8ea003a37fa078
[2] c662e2b1e8cfc3b6329704dab06051f8c3ec2993
