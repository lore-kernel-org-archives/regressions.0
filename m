Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347958F48
	for <regressions@lists.linux.dev>; Wed, 27 Aug 2025 09:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756288018; cv=none; b=QLjFvHNP0jrjuj8V37S49K6kxdu0dkOsxpO9zF+cobOJqtoW2VBT8A0C2FzPMcs/uTRkn002qMeGyIVmV+nSAccL9Bk8h3I+1/9T/KZRghyrb2JiWyhAnheNnpAxYr7KWUVHhIURTkGYxqpHzw81hj1xXkM0oUdax68pkjGhNH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756288018; c=relaxed/simple;
	bh=5aI+ZYSsvVHdVPxVjk6qUnENbFixEsJ8O+5Z840nd7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imEEwl6deQ2cyDPFIEyUhac8E0fETkACd94IhoYzRa9Kkhef54OeUL46i6KmURAZ5ukVm1m1cmAizCs7sHRErwrquq7BSF5eZ8mZn+vAobVz4TC0bjZOoBavIDOrqvoZFd7aioBdumoUuaZK3wb+B/Giv/ibOwbHeVsgx4RXPzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wz8czyjE; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wz8czyjE"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-24457f581aeso50720495ad.0
        for <regressions@lists.linux.dev>; Wed, 27 Aug 2025 02:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756288016; x=1756892816; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o7p7UvIT2kbM0WGZWywrLeb5TTjPgS/NtsEDB+2LTAY=;
        b=Wz8czyjEbwMuZ+sFHc0Zl+TJ8Pxt4YiLaMVL8dIz6xrh1B9bnWn0X22VZ4Fb7xdGM3
         ea8bPkXToyVFQGozKoCHSlz9MVp+HswXH/VJJPK6rDwDqTJFfVBZAJKM4nPNH4SNhJyh
         U0k8DKOo2CK9k36RT5kCGjptCO7WxAHAz7PBqgc3SZW7H75toMQqvUI/058rYpHa6/uO
         ciOjZHmK1eKVsWIQ9CrhRm42V7R7F+jSzcbTiZ/U2dB5BAYwsYZFwoiQKLQLdklIQg5L
         A0EA1ZrrWGIMivobozf37camoW/U0uwZTWZjfxTlXoVvj7EC0YFkOtc25WW9Yvoe5sgp
         5y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756288016; x=1756892816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7p7UvIT2kbM0WGZWywrLeb5TTjPgS/NtsEDB+2LTAY=;
        b=rJQ/LHLukftgCx6choMCEtZM5FDb1gG97ewohl0rK1nl3YfHmsoUFY3B+LZdfy4wRD
         arW8AL/e724K60rAJyHUhsuQe1z9D3JOAlbHoGo7BlrSr6Ys/9sB3do28OIYJEhp45g7
         3CanOo5J6QGhz3Wt/WCXeYDnGSKzRsu7r1eqWCuflBuFz3gXlE/Tuqul1ChY3PVbuqV1
         e0YNN1bWc63PtBlFRpwhXdzaBXCu+wpFSyr7SYvRKs4fcGH49b4Rmc3diQo6gqNij5tC
         TT+5599dI1ank44t7mQ3xcb1g841BOtZzTHizda05tHBuSSpr30vUlNx67R+KFOjOk3r
         wzhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQM9aDCVr9xmFMp3igb8omHWMoXhOC55eQFQCiemerrYtU4ZosFA6nVmQ9XwEzyl1KttVhaIXHvrF6oQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0L/2BfEbZ0cDCQY1jmTY1a7eXPhxkv9ma499I8hDuHVpbq9C8
	mBPkhpewZQmmlx7PzQGxNOCMZZJOcLdHOLv3LkmT25oP1RPeHdnfzCfb
X-Gm-Gg: ASbGnctcpg6alvxyz2KgQ41gTwbNK3+2y8KW1gCr3XUkfRxsksTRydVglCbsnFOf92E
	cYXyrdc97m+Rp4kymBdgf3HFvoUhkDTBoOCGWl1/YOo6tdSefDQ+vmO8ELyzbtd7NbYS0DwUFcj
	ndypP3XR4Q9GsJx3VaFofzzpOvDODuozO8zSkzk6jOuLu0PUKi1tGs0K5vYK3IVnSvmz4n+tiit
	7PL8O/6PIwT2LrgAWdJjNmgZtYx7YoSHnP51MAmGPVEbh8/nhL8mNpfdKa5KDukoEcHox3hhFyl
	4PHCKDFUtZIudSFx/9alFhvoZffW2VlbvoKRAh1zjOM3gvC6AsPc0J9sc3G84mS5+99ys4YyzGf
	A3YXe5AxpXNDmXneyih0s+g==
X-Google-Smtp-Source: AGHT+IH6p+lVA5i3KfX5nEoaE5M6ccLfYaUU2KaTPzY7Y4H0Kd4S8ErOqIIwrh3SiJTeHpTk/ERWjQ==
X-Received: by 2002:a17:902:e783:b0:246:d98e:630 with SMTP id d9443c01a7336-246d98e09c1mr117662375ad.44.1756288016411;
        Wed, 27 Aug 2025 02:46:56 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-246687b0b04sm117749355ad.44.2025.08.27.02.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 02:46:56 -0700 (PDT)
Date: Wed, 27 Aug 2025 17:45:50 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
	Anders Roxell <anders.roxell@linaro.org>, regressions@lists.linux.dev, linux-next@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, 
	Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Shradha Gupta <shradhagupta@linux.microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Jonathan Cameron <Jonathan.Cameron@huwei.com>, Juergen Gross <jgross@suse.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Chen Wang <unicorn_wang@outlook.com>, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, arnd@arndb.de, 
	dan.carpenter@linaro.org, benjamin.copeland@linaro.org
Subject: Re: [PATCH v2 2/4] PCI/MSI: Add startup/shutdown for per device
 domains
Message-ID: <laatjr7p5zyp6ubzei2ogytgtfpbnlcmxjccbrqilfttrld3c7@csfx4wgqovg4>
References: <20250813232835.43458-1-inochiama@gmail.com>
 <20250813232835.43458-3-inochiama@gmail.com>
 <aK4O7Hl8NCVEMznB@monster>
 <db2pkcmc7tmaozjjihca6qtixkeiy7hlrg325g3pqkuurkvr6u@oyz62hcymvhi>
 <qe23hkpdr6ui4mgjke2wp2pl3jmgcauzgrdxqq4olgrkbfy25d@avy6c6mg334s>
 <20250827004719.GA2519033@ax162>
 <CA+G9fYsAxq-RmU7fVSDQ8_B2Hm5NY7Q7=DUnqcpnt8BOtd0dUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYsAxq-RmU7fVSDQ8_B2Hm5NY7Q7=DUnqcpnt8BOtd0dUA@mail.gmail.com>

On Wed, Aug 27, 2025 at 01:47:14PM +0530, Naresh Kamboju wrote:
> On Wed, 27 Aug 2025 at 06:17, Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Wed, Aug 27, 2025 at 07:28:46AM +0800, Inochi Amaoto wrote:
> > > OK, I guess I know why: I have missed one condition for startup.
> > >
> > > Could you test the following patch? If worked, I will send it as
> > > a fix.
> >
> > Yes, that appears to resolve the issue on one system. I cannot test the
> > other at the moment since it is under load.
> 
> I have built on top of Linux next-20250826 tag and the qemu-arm64 boot test
> pass and LTP smoke test also pass.
> 
> >
> > Tested-by: Nathan Chancellor <nathan@kernel.org>
> 
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 

Thanks for your tag, can you resend you tag to the following url?
I have sent a fix patch here. Thanks.

https://lore.kernel.org/all/20250827062911.203106-1-inochiama@gmail.com/

Regards,
Inochi
