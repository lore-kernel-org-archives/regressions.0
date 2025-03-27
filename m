Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244F1210F44
	for <regressions@lists.linux.dev>; Thu, 27 Mar 2025 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743073227; cv=none; b=fVtcmJAsU3hgIFcjxNNktel7Y1uHem/U98M0akT4vbTN/KeGW7fWDP8YgDe698FAf9aXt8n/Iscx4lQsFHEylpy2vO3QTQhafO+gnyHSL9qzodfA2G2Nz0gPY0xTiQSkMQdwyrVJtJk770XBR653XthTB/wEBiUy17QIC+YsLk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743073227; c=relaxed/simple;
	bh=PYINQnKycbXh8ZEgV82L19kwunYBNxMMAcYZj3hrdYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q2WriZKN8T5HRj0dDH+2DG6esU2wcnwSMZxk5CSgZGjR4U072AOEKyeyYXiuOQx5hn+Lsx+4mqBZCNiMoxxkhGq7dQ1VpqQF1o4YTYrY0yrJek4zxi6VanwbYyRTpWdJ9AO7ZFppOTay2IJNv3uieo+MywGCWmpx8Gd+ub9XvDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=pPUxpPGh; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="pPUxpPGh"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2254e0b4b79so22184865ad.2
        for <regressions@lists.linux.dev>; Thu, 27 Mar 2025 04:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743073225; x=1743678025; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a+3oYLEdjTqzY7ue0pi7WI8oniaxoWaW2vaMHk//k+o=;
        b=pPUxpPGhrdPMuXXYlDHYXPzkYf77PursfTNg5Uosq/JqQjoXHFj6T17ergBs4SwlNj
         ZR+cpeRQ3jhA6cCIn4B02QjkrHDMnklpWo4ypi++XrNQqJPJZO3JhSu9mcVfGZ3nU+tT
         EWbloiAtdbMX0z+erXfICnLUbG/3eQZdCkupM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743073225; x=1743678025;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+3oYLEdjTqzY7ue0pi7WI8oniaxoWaW2vaMHk//k+o=;
        b=arrGPn8aeQ48uZsI9SgVsB/ztlG6dn5KMrFWBErAwNEhjSSF9D/io0PvK66yB206sM
         QcO9K7S6Q2rtSLDkj7BuhLFDtxr9HCfBb+KihUyq80nv2EwDcvoc0iDEp6Y5WAXHmIAe
         SnmjbPT1tmZB/R8n8sTBvy2hatAVwncIgX8f/qSppQTUyx72jXterFck330463OjEKBL
         DAdh+tJ0fT/eEzr7t7wF4oJXXemAlSQ1NjCwnJXKhchTMQ9ZfFFrqo3jSZ8g7qkVn9qF
         T/icyeHch+UwISHJU2i2sKOSttsWtFc5Lp3r8Du51vKBY45nlzugsDUHziLf/bVQ65hD
         R/LQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1QK/mIEzdaopL99GEdQvzLA3wmHRvNmsA5EGSs52OuO/mRa3lT4sfdTVS25GlWa6Z3rPRekcf0O/Pow==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyO6sWezzv27ARr/Ke/Ddq8/qP7h5ob09I1FH3KJ11iNy9eyLW
	Rt4mpsq8OSyy2zeCE2EiVDj8Fei5dwvy2zZUkKAIvOsFFxsPXmwrtVq1co2c/UM=
X-Gm-Gg: ASbGnctCzV9fka1uWndQJKyaJAv+amj7U//uHJPkMwvAcl5P7WOXtUPxpqKeXdvZF7r
	UA7QWxO9JMefNcyM9ihOm6qnYq89aV7TRxS4QfOWVYXE8VPYRl/GZCKexauGcKOINtgI/ebgxFa
	HZpJjy+uPUrJYDLYMuD9TavNdHcNoT6dlTpFrq3ldVSmkapADMK36nPGBJbtjvciOQ6G2QCo5A0
	fNM/M0M9FgPZdBVKeAiN/Zhy7J4IN6OaVhyfgcOGJ0Lm1uqHNmML9CLCihR2mf/S+hbpfXdY6Jh
	l3jAuR5SX3nppavBHmb1Cr7Bqrq8TQTa/wvPZq0ZP/ozAaxZ7w==
X-Google-Smtp-Source: AGHT+IH1gxZZic6MFjUwMzJgoZ8YGYTQsOie+7V5EQMxQWaNdI6WA0iGm3+Xf9x6MiyTN7yeoRlPiQ==
X-Received: by 2002:a05:6a00:1743:b0:736:73ad:365b with SMTP id d2e1a72fcca58-73960e468b0mr3936030b3a.14.1743073225242;
        Thu, 27 Mar 2025 04:00:25 -0700 (PDT)
Received: from localhost ([84.78.159.3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7390600a5f6sm13932175b3a.82.2025.03.27.04.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 04:00:24 -0700 (PDT)
Date: Thu, 27 Mar 2025 12:00:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	PCI <linux-pci@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	shivamurthy.shastri@linutronix.de,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: Re: next-20250324: x86_64: BUG: kernel NULL pointer dereference
 __pci_enable_msi_range
Message-ID: <Z-UvxG4EIeO5zOgU@macbook.local>
References: <CA+G9fYs4-4y=edxddERXQ_fMsW_nUJU+V0bSMHFDL3St7NiLxQ@mail.gmail.com>
 <b6df035d-74b5-4113-84c3-1a0a18a61e78@stanley.mountain>
 <Z-LDdPeTsnBi8gAU@macbook.local>
 <CA+G9fYumyaftJ9FaK+74g5iw-v9RV4qDT-SLg1XGk8G7ub2EXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+G9fYumyaftJ9FaK+74g5iw-v9RV4qDT-SLg1XGk8G7ub2EXA@mail.gmail.com>

On Thu, Mar 27, 2025 at 02:10:21PM +0530, Naresh Kamboju wrote:
> On Tue, 25 Mar 2025 at 20:23, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Tue, Mar 25, 2025 at 04:56:33PM +0300, Dan Carpenter wrote:
> > > If I had to guess, I'd say that it was related to Fixes: d9f2164238d8
> > > ("PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain flag").  I
> > > suspect d->host_data can be NULL.  I could be wrong, but let's add Roger
> > > to the CC list just in case.
> >
> > Indeed, sorry.  There's a patch from Thomas to switch to using
> > pci_msi_domain_supports() for fetching the flag, as there's no
> > guarantee all call contexts will have an associated msi_domain_info:
> 
> Thanks Roger for the clarification.
> LKFT started noticing this issue on the Linus Torvalds master branch from
> March 26, 2025 at git describe: v6.14-1979-g61af143fbea4
> 
> Anders bisected and confirmed that,
>   # first bad commit:
>      [c3164d2e0d181027da8fc94f8179d8607c3d440f]
>      PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain flag
> 

Hello,

The fix has already been committed to Linux master, commit hash
3ece3e8e5976c49c3f887e5923f998eabd54ff40.

Regards, Roger.
