Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B998E1B2EE7
	for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724240794; cv=none; b=df/+zWKGoOnxHMisKaEdn/USgv9tp+wCWwEY9m7igrijUIXEWnxztW8Ew5/jWKAA2nsoGDV4H3qZBLmwkMuoouE+ObHoKqT6uhL9PARe3JS+jzayshPza0eFNwTblTjNee6279aAEh2VYF9KAE9XRXIvNLOvRlTZtinfOw8Nh2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724240794; c=relaxed/simple;
	bh=JMwCphN5pGrz+zpFb0NOZA1mmG3YJUULLXRPUgYZfsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjYxbX+GAFs+vCpy/GYUhLIsgmT6KfFil9tq5Ak4rk+s5sDWYlNeJfg+kijt8J7gmJhXEnxJtDvU2mzjeXgupQLh+h2IPsv0IOWcyYmN+zdMked8b0O4chNFQiSYEcej/duaoX/UNYry7RRNkwbPy6h5AaX0ZJ1rrpU4oIj8k+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fr0jtTm2; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fr0jtTm2"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5bed68129a7so6066852a12.2
        for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 04:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724240791; x=1724845591; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oErO252NQnC9h2Lk0YbFph/doRZfHKDAuMD366ZpOQE=;
        b=Fr0jtTm2WYO8/y0q81WSDK5dPOkATUfYcFhdDUxjMnAr6YrW4Weyiz6u3Kl05ai3yu
         TmhvBQEbTNPEn6m+zt/Flo4hJ0xHyVhvGQTYqK6ZwdCO8oWmaFDYYMP3Hrs+PcUgwmvT
         jdZJsCcZILiNmAjYar+DUIajBrVQN+W0ylKjwDXtV8wnZGpsK3cwyk6mw1/824OltJI+
         f+brUQabkQCRS69qKuWKFjDYHsBwCyW3Ggl0mSeku3C4O2s3M8hgsQBE+CgH7M9EyAX3
         1KztnQlUSR2reVzGwDGEVurjh84GnV2fJ//syQPmGld1wMwm7PLcF9NdOANj72o2SRgx
         JLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724240791; x=1724845591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oErO252NQnC9h2Lk0YbFph/doRZfHKDAuMD366ZpOQE=;
        b=detpnEomzlI6KpNOLT9qHQd3BUQv+rb8tA9FjeEZAI/eDJfzf0j1Tr8lDfiY9xHkae
         bnv8rKNB9MV1ylMJ2W4hfK2W5QELgHwykw3LcP8vPULi9/VEG8+BsqZTCm30oPOSJSe4
         sKLjT+Fo56DhFreHdZ+OvLW/5EIFEnIgCT6zQKG7Xg/sURvhbQ/zC+Gv9ppMHIM9u1yG
         UCfigeJNuD4B+5BVzjWXTNku96QHLM74q79Lb2nHXAQrXi6i58757DPi/7C508MnhOEo
         VH8os5NpCddQd/BFhuJAjUkDyQW7HAtA+G6Aee/LhW/sWDhWyhCPSL3l1vrBVvCvfRMU
         tw6A==
X-Forwarded-Encrypted: i=1; AJvYcCUtUZ79nYRxxpTWUw7YK/BigAv83v8tpsrWARDg61lE5cY+S0f2Ml+Z801MK3N5NcYiqKTRaWbPwCKceA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMcILfWVmHhkfU8LEkbHz5I7wwHVPUROflKwCKWWA2copyEae8
	ng1tHShPfVQeeaRsoBmAh0XMxM7liG1tiW2T6n0lg4mYXPwAHQvb8u4GPl62d7A=
X-Google-Smtp-Source: AGHT+IF7jHunz9u+RQaSofBA9JaDACkz26TemKPcbEjMfuKwz7hzgJgDMZgPrPtmc6MMAlGh5AuCCQ==
X-Received: by 2002:a05:6402:34d1:b0:5bf:8e4:377a with SMTP id 4fb4d7f45d1cf-5bf1f0a3b0amr1255165a12.3.1724240790810;
        Wed, 21 Aug 2024 04:46:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbbe5a74sm7980181a12.16.2024.08.21.04.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 04:46:29 -0700 (PDT)
Date: Wed, 21 Aug 2024 14:46:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Matthew Brost <matthew.brost@intel.com>, Tejun Heo <tj@kernel.org>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	linux-block <linux-block@vger.kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christian Brauner <brauner@kernel.org>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>
Subject: Re: next: x86_64: ahci 0000:00:1f.2: probe with driver ahci failed
 with error -12
Message-ID: <43be498f-5a25-4ee2-8c5d-1ef75c4d1ff3@stanley.mountain>
References: <CA+G9fYuD4-qKAX9nDS-3cy+HwGbyJ6WoD7bZ_QL0J__A++P9aA@mail.gmail.com>
 <CA+G9fYuYfNA7NZDHpq2K24CsUn21LAb8vn38=JTz=54bsdSd9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuYfNA7NZDHpq2K24CsUn21LAb8vn38=JTz=54bsdSd9g@mail.gmail.com>

On Wed, Aug 14, 2024 at 03:56:56PM +0530, Naresh Kamboju wrote:
> On Wed, 14 Aug 2024 at 15:15, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > The qemu-x86_64 boot failed with today's Linux next-20240814 tag due to
> > following crash.
> >
> > The catch here is the crash seen on both x86_64 device and qemu-x86_64
> > but x86_64 device is able to boot successfully.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Boot log:
> > ---
> > [    0.000000] Linux version 6.11.0-rc3-next-20240814
> > (tuxmake@tuxmake) (x86_64-linux-gnu-gcc (Debian 13.3.0-1) 13.3.0, GNU
> > ld (GNU Binutils for Debian) 2.42.50.20240625) #1 SMP PREEMPT_DYNAMIC
> > @1723614704
> > ...
> > <6>[    2.479915] scsi host0: ahci
> > <4>[    2.484371] sysfs: cannot create duplicate filename
> > '/devices/virtual/workqueue/scsi_tmf_-1073661392'
                                         ^^^^^^^^^^^
Negative number.  This comes from:

        shost->tmf_work_q = alloc_workqueue("scsi_tmf_%d",
                                        WQ_UNBOUND | WQ_MEM_RECLAIM | WQ_SYSFS,
                                           1, shost->host_no);

shost->host_no comes from ida_alloc() and we have checked to ensure it's not
negative.  The problem is the va_args changes in workqueue.c as Anders's bisect
shows.

kernel/workqueue.c
  5627  static struct workqueue_struct *__alloc_workqueue(const char *fmt,
  5628                                                    unsigned int flags,
  5629                                                    int max_active, ...)
                                                                          ^^^
This should be a "va_list args" now.

  5750  struct workqueue_struct *alloc_workqueue(const char *fmt,
  5751                                           unsigned int flags,
  5752                                           int max_active, ...)
  5753  {
  5754          struct workqueue_struct *wq;
  5755          va_list args;
  5756  
  5757          va_start(args, max_active);
  5758          wq = __alloc_workqueue(fmt, flags, max_active, args);
                                                               ^^^^
We're passing a va_list.

  5759          va_end(args);

Any workqueue that has a format string is going to be broken now.

regards,
dan carpenter

