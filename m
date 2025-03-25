Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEEF25A62E
	for <regressions@lists.linux.dev>; Tue, 25 Mar 2025 14:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742914427; cv=none; b=SzWL0q+en60b49DPcXU+GAU5POxOoaJURwvLKSMy7unKcai+256Wfxhl5cER1ljOW5/uifQKO5Fpgt/cSydFIqKd4GOOn7bETsrdLy1zxUJTxZmlGnwYJirlxXRdNnAQ3siM8EIXbt2+eTsAm6tTZWm80MnE2a/OKsJnXenSe0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742914427; c=relaxed/simple;
	bh=1sM5l4Le9uZaYWmJvDCU8/tUWoePiEbJJ8FpsxGPQHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAUrh8FfrtiBzP8HtyY0Xw77q73ZNBhTOrW14MCK+WLBojkeu6yxqlpMJHv+AdNLbeJD4yuKAgCyF6wtN2ySuggoxaKpCdjAXiQ3WThyCBHr5z/pu3OBJrYb+fOVvyH7FmfshjXszOBAeOTW7LG/d+cKJpcJHBlKFM25e+LkUjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=fVitPJA8; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="fVitPJA8"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-301302a328bso10840655a91.2
        for <regressions@lists.linux.dev>; Tue, 25 Mar 2025 07:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742914425; x=1743519225; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TdkDS/vMk5p1AZv8W+AgQj6RaWYMpbzjtCmMRhYEbI=;
        b=fVitPJA8AOAAeOskjKr9vGwIL5Vq9TlRY9yDEmXuvTUMid9bBP6feIHlmNTfdSd/P/
         iqZjUJrExp2yVT8iTy29dImMQA0GDWbVFp1zMN9HG7+NXNm5Fk6aJWv8srSbvP1ZtQIb
         g7IdaebSIu4mp6w+gB1rvVPU9sx9vMw5A5nmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742914425; x=1743519225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TdkDS/vMk5p1AZv8W+AgQj6RaWYMpbzjtCmMRhYEbI=;
        b=Iz/sgmYOvO+zly6z2RyYiVRePzmlCTDN0jVb+36OVuqUllfv8poPb+sbZoDOX5nLem
         1IN1kaZWOfyhSlY0Y6toacy65wD5U7xZCmjzxOCrmirm5QqJZINLGOm1jL+EY6SbPz3u
         rFvnpqxoUnKpjJab8AitdWUH9LwNSc7ne2o4wszbAsj4py0c3lFf5WE4akVWnbt7/p6c
         jipKNGVi1ccgDuhtjwaKdJMha9H+1QIjavwRkMUAiq/ef7422Q2QhTeR3hrMAdVcxEGZ
         DEUOIaeNjnJ8A6CQBou35oANLzhlUWo1/1MWprHC7uybCHg13lNQb3hEALKgCVy0/rST
         cVqA==
X-Forwarded-Encrypted: i=1; AJvYcCWzBlvIRVk/NhWJ0eQU1PqRJP6Wr725kcfvJOfn/iKY7EtXYY7xPkL3yEfCYOdkIOiYfLpcX/ht5Sg8tA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/B3LDm/ABuaQCpU40I3hQL4CEEFvZ1woFlCL+pULY9TvXZTmz
	EjOSm8cTjBYVbMzibceyw78G96zZX8Qb5fxRbkLogK4tYZ98UlY4QS7UzdEa40I=
X-Gm-Gg: ASbGncsCUDOFcftiCso9Y32T+KfoCUIrbn0TEp+O/rSTFvQRJk+Ygn2kUgOvqbm7VF5
	b9APIYqJ1dwZ3m490jXd0/vI9xxJXkTB3+wpcKUGIsuFxr1PEq7idgbXn6HeyYf/4yMZ0Mk7k/L
	TjHuuleRjJyjqR9oR3sD9UGYi0f2dIJlGHTlKxE9ih6GhfGyTHGpJ9JKCLfr/vTbkvIedSFSiWH
	Iz8ZjvmXxnhd5r+JcXpnc35RM3FZgkTw2SsCzMawBuSLCdjkg/xACqg4NMFpd26gB4g0D2R8V6R
	RCwfoTxe63p86QThkUyZxwZGtPkBuGxvegFTZNBJGJGu65mmO8+dbSLa1ErY
X-Google-Smtp-Source: AGHT+IGTbPk9dPvPoREsYcLOoknFmq0RVX2PWOyMpPbWJ8k+G1JOY7Wb19hLjnqLwlugSDnBNIwDXA==
X-Received: by 2002:a17:90b:51cf:b0:2ee:edae:75e with SMTP id 98e67ed59e1d1-3030fe86471mr27282348a91.13.1742914425185;
        Tue, 25 Mar 2025 07:53:45 -0700 (PDT)
Received: from localhost ([84.78.159.3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-227811baf30sm90844895ad.130.2025.03.25.07.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:53:44 -0700 (PDT)
Date: Tue, 25 Mar 2025 15:53:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
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
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: next-20250324: x86_64: BUG: kernel NULL pointer dereference
 __pci_enable_msi_range
Message-ID: <Z-LDdPeTsnBi8gAU@macbook.local>
References: <CA+G9fYs4-4y=edxddERXQ_fMsW_nUJU+V0bSMHFDL3St7NiLxQ@mail.gmail.com>
 <b6df035d-74b5-4113-84c3-1a0a18a61e78@stanley.mountain>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b6df035d-74b5-4113-84c3-1a0a18a61e78@stanley.mountain>

On Tue, Mar 25, 2025 at 04:56:33PM +0300, Dan Carpenter wrote:
> If I had to guess, I'd say that it was related to Fixes: d9f2164238d8
> ("PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain flag").  I
> suspect d->host_data can be NULL.  I could be wrong, but let's add Roger
> to the CC list just in case.

Indeed, sorry.  There's a patch from Thomas to switch to using
pci_msi_domain_supports() for fetching the flag, as there's no
guarantee all call contexts will have an associated msi_domain_info:

https://lore.kernel.org/xen-devel/87v7rxzct0.ffs@tglx/

Regards, Roger.
