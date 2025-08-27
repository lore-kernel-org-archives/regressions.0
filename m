Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E79277C94
	for <regressions@lists.linux.dev>; Wed, 27 Aug 2025 08:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756282648; cv=none; b=tiOmp50+4QLqKHCNBksQF3Io8FP7kK6HQzr9TC2HmltRZkKpHr9HZ2Ch1M9MMCW8qqt6go4J3LOfiiOpqkwJPKKydGrhJpebk2BDTVUzJBQZV1UvwI5yE0BqJIYLm2rYOtbsX03Gv5LCxF0usD3lHIUsxhfeQyBQV+hp/ROWZn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756282648; c=relaxed/simple;
	bh=ini/Dg/qMFzbwNKKWsndLioGgin9QxvTIdp1lM1/knI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hihb4Ku/X8itShFpT1BI82EZnWyxAoFE8CBoxm+rct1Nj8ZhAoDp/g8vdl8aPNdu/oAFcCyYv6nKjU2UpULo+mNA6mV9dWTqF5AmwipO4oZc3T0LtRr4vXKlCxfoX/QejOl3Xl3Y4w70Hfbn2+kQwTAEaG8gj4E3LmT4VwuWYIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g6XLQcjq; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g6XLQcjq"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32597b88e1bso2861111a91.1
        for <regressions@lists.linux.dev>; Wed, 27 Aug 2025 01:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756282646; x=1756887446; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rw6pFx8vb3qCt0eWgbwwuAkBawJ8J17IDZtKMfIRe0c=;
        b=g6XLQcjqWWngvkRjaKkMZiSV4VCor+vzFqsju764eShszZ+h/CFya76CRGrTIfLf4B
         XzEAixEBNhoyuipMzgEvSBwztH7u0Ez9/42FgPvMNw+Lk3Bw1D81qp0m8pqUKjosPUUV
         CSzSS1UtSe/fhM4VANiBwtn8SSYzKzsJbP12mreoqEXSDvqVz/NyI5w3yZsJh9XpGbv/
         Y2P/BR8thiDApsz91esWXRvbjQrWOF0xRzZcktFB9wBDy+QzcAPDIs/XizPCcC6K2qFP
         CS+Cyc+QuNAOfeyMYHaFaYjkqrwAiqHc7CqNrdiYDzOAnT1WBwao8uoo+dcXUacn89Zf
         R9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756282646; x=1756887446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rw6pFx8vb3qCt0eWgbwwuAkBawJ8J17IDZtKMfIRe0c=;
        b=VF8yamYYmhiGPmhwnoCHnwUpnog9KjZ1vi79T0aXZsUWSP+nKKR2+5xg+AMsxmAbLU
         Cffb+r7LgNKoWBk0C9JPTxjucC9GWdrXcKHXzCpMQYhaJBZPf7ZtRuiGFMqXcsrw7U7s
         FUme2tDMwuhWoHp42eophoM0/kEEkhdBCStJwbz3rBVhVOa898wLsGs2d9x9ynPC4RCY
         o5XoI3jea7CuUX48avUCxBoOCW+5+SMm3U7tBnEA0OB/5Y9IqWEomfrBJPlEckrJMcPa
         C0lXITh/N6xBQeC1OAJjrOO2t43fb2tZ/rn03+8u5WWO3BOK+G94RzCMnhnVPAAVe1ZW
         Csyw==
X-Forwarded-Encrypted: i=1; AJvYcCUqMtgRxhAhJtVD1NB9qWQsu30cKOelfcz/q9il79aapnOe9V2eSmwMsXDpHDXtCdmP7smR45BpKUTsXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/VWT/5fETsyJn4b8LvZmaMsvvBa9Nn1JE7w0GRltD/ZdAM3iU
	RRdAemc7TKGzO7jwqzymSF7WHB4/wZ+BtFdQnCMTfA6qUXHM4hlcqAQc7DsvoeU65CN4DPQAaU/
	yc0BqkC83z6kQTugwcF0VgElJHaDRtVviLFYpKxGliA==
X-Gm-Gg: ASbGncvNVvKdFzd7H5Zn4Pc5FvCerWE52AR4mESnTgxS004/Fr4doPYlz06Kw3/LytB
	9b9Sz9K4+87HPoMVnxx8u5KdyaBHO04vfpHBk6s0JCxUVRfZ37kWpvX0I9XgdadsnZTRReGQ833
	CiO4aq1z14mHj26YD9Zh2SAIkInh9kPQ+5KlP3yBvAxNFzcaabYBbkd5Z68cApCN5fAmz25RI+2
	d0gxSmHcESR8O4d4CyWOFoFuz6a+2yLMmX5vskB
X-Google-Smtp-Source: AGHT+IHXV0XIJbSOruANIhEDSo4ztOVg47pK0P0Ye2hoQsvKDAy3OuT0JReOys0s//MIC3rIMXgdY/LDTorvaRJkGgc=
X-Received: by 2002:a17:90b:54c3:b0:311:c970:c9c0 with SMTP id
 98e67ed59e1d1-32515ec1313mr22920541a91.22.1756282646397; Wed, 27 Aug 2025
 01:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250813232835.43458-1-inochiama@gmail.com> <20250813232835.43458-3-inochiama@gmail.com>
 <aK4O7Hl8NCVEMznB@monster> <db2pkcmc7tmaozjjihca6qtixkeiy7hlrg325g3pqkuurkvr6u@oyz62hcymvhi>
 <qe23hkpdr6ui4mgjke2wp2pl3jmgcauzgrdxqq4olgrkbfy25d@avy6c6mg334s> <20250827004719.GA2519033@ax162>
In-Reply-To: <20250827004719.GA2519033@ax162>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 27 Aug 2025 13:47:14 +0530
X-Gm-Features: Ac12FXzvPaHx0Y-UEkNxm_tosSQU8r9fXEo91EwR-5NGfEUW74KCwisELg0mjB0
Message-ID: <CA+G9fYsAxq-RmU7fVSDQ8_B2Hm5NY7Q7=DUnqcpnt8BOtd0dUA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] PCI/MSI: Add startup/shutdown for per device domains
To: Nathan Chancellor <nathan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, Anders Roxell <anders.roxell@linaro.org>, 
	regressions@lists.linux.dev, linux-next@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, Marc Zyngier <maz@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Shradha Gupta <shradhagupta@linux.microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Jonathan Cameron <Jonathan.Cameron@huwei.com>, 
	Juergen Gross <jgross@suse.com>, Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Chen Wang <unicorn_wang@outlook.com>, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, arnd@arndb.de, dan.carpenter@linaro.org, 
	benjamin.copeland@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Aug 2025 at 06:17, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Wed, Aug 27, 2025 at 07:28:46AM +0800, Inochi Amaoto wrote:
> > OK, I guess I know why: I have missed one condition for startup.
> >
> > Could you test the following patch? If worked, I will send it as
> > a fix.
>
> Yes, that appears to resolve the issue on one system. I cannot test the
> other at the moment since it is under load.

I have built on top of Linux next-20250826 tag and the qemu-arm64 boot test
pass and LTP smoke test also pass.

>
> Tested-by: Nathan Chancellor <nathan@kernel.org>

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

>
> > ---
> > diff --git a/drivers/pci/msi/irqdomain.c b/drivers/pci/msi/irqdomain.c
> > index e0a800f918e8..b11b7f63f0d6 100644
> > --- a/drivers/pci/msi/irqdomain.c
> > +++ b/drivers/pci/msi/irqdomain.c
> > @@ -154,6 +154,8 @@ static void cond_shutdown_parent(struct irq_data *data)
> >
> >       if (unlikely(info->flags & MSI_FLAG_PCI_MSI_STARTUP_PARENT))
> >               irq_chip_shutdown_parent(data);
> > +     else if (unlikely(info->flags & MSI_FLAG_PCI_MSI_MASK_PARENT))
> > +             irq_chip_mask_parent(data);
> >  }
> >
> >  static unsigned int cond_startup_parent(struct irq_data *data)
> > @@ -162,6 +164,9 @@ static unsigned int cond_startup_parent(struct irq_data *data)
> >
> >       if (unlikely(info->flags & MSI_FLAG_PCI_MSI_STARTUP_PARENT))
> >               return irq_chip_startup_parent(data);
> > +     else if (unlikely(info->flags & MSI_FLAG_PCI_MSI_MASK_PARENT))
> > +             irq_chip_unmask_parent(data);
> > +
> >       return 0;
> >  }
> >
