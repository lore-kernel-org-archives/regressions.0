Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A77D2DC784
	for <regressions@lists.linux.dev>; Fri, 17 Oct 2025 10:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760695355; cv=none; b=GogdAPx+3nbYLQeJosEskJeR9yKGb/gSI2OFFFUH1gEmCH5oRL14ysOi/F3mvt2nejTVu0EEK4a1uzdd3l0f/uaaa0TNP3ncDGwEpauMyp1sbi2m+RAdDw5zy29YasRvpoJIKRbyHS5fuh7wBZTy7fNl0aKq+a3/pC06dNFhIdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760695355; c=relaxed/simple;
	bh=drZrnQKEAi0sMCaCh3X6bSQOyyKvMOxESRxUPZpCKWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/AnFK0ZckZRbkqQOTnrgYbGHbrAkykFrVBbwPSe+e/9CGHglWzeFwgjseni0yiCIdoyMuE4jVzXftiJvKl+Q5ZWyOL2U+c7EjGsuVeJEc7yKJTIsirVF4dvu2HtHtxghQMOx92FvlfIBZlVBkqjsoR0Ez1qP6MDA/2B45I6Y3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=hNHNlK7+; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="hNHNlK7+"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-789fb76b466so1677746b3a.0
        for <regressions@lists.linux.dev>; Fri, 17 Oct 2025 03:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760695354; x=1761300154; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7OtZ/yQXFhjzdgsw+HJSVcKTN14IDqdEkJg8GvBN38=;
        b=hNHNlK7+ww688LKV3m/aba+aSLrl8FZ71Oy4Tud0+uek7aVGDzw9FZVKCvKIyDCOR+
         gsWBZ21iWgmnnc2twNQR3kym7vpkxlbAKMErP0z2AnaVfMy0lpRNEseD6b/XQP7/GQV0
         g2TDGef2y6TbRYYCBLJTYxC52Z145lDvz781k6rApxAzjkd6h3oDayZ9BQvTZiMJeMEW
         3p+g9QUvAI0qjbW86uHlMBmOZvojKOTchCmhVG7XZgk4uDa+SH9Y+QEf5NqAu7GY18VC
         nEpPrW3PyZ3maiujMcz0mbQoci+i6yM+Dzenw4yhJtoAkz3aY1AG6an/hkr1mTEbw9mx
         eafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760695354; x=1761300154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7OtZ/yQXFhjzdgsw+HJSVcKTN14IDqdEkJg8GvBN38=;
        b=Stm++ZHnw9Lun4i/e9BYJElTaAzsRm4fiSSbS6qJ1OEBnUnbGHj4KBqpmqavr7U2vO
         WcI1o5rldSyB4kh28DWB+glsbQbn3ksG50qNqLp0bkao5ECYPRK0TQXK7y5ayIQP0Fjn
         Aa0xenvqcYyUfwmkBpTqBkHqBKNz+1oGHhNXwZMEt4vBt7+layiEQ3K/KmqepvYsx0vX
         3HplkR4mSWv/71uXQ2RZH/MM0jKmcuF6UxMsEQDdfI08hX3450QldX990U2IlegnYa3W
         iod4LrelMlOWcVGIL+9GpJOERJFE2tVJCA0aeWmEU3a8uCcmwQR/bY2p61JVYDH+kCC3
         2L/A==
X-Forwarded-Encrypted: i=1; AJvYcCUf/rm+SMSabwtKaOTC0wykOz4LmMl5E4TguC7ZG+n0PMkoVTGVK21SSP23w/v8urngYFn27TE8+AaQNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YycmeCp0S5tbAt4Bz8essFkPnwTAn70Bp4coUaABri45doCT3ID
	k3fF5qhfFsRqHKB/M5j/8LcOTNuzzTqJWi80JMpA4QHmk9ehcrUXsxWK7MoOf3mms1g=
X-Gm-Gg: ASbGncuOgGnKViFvQaXI0RJTtmpD76l9SW+jArAskpLz0ci6yq0McZLj3BK7DSuB/Ob
	uPZyKLFmxFyY5NNGh2TyqaFS2IEC4gnx8dNWwZ64IDQZqQwAaPLKnMoTdG9Itz3EPd//VbVngjS
	ivrTS8EaO/V2QwdJfq76LEmiJnhvmeNmvGb+5SkEJUJuecPruJka7ZGSmYblkNLgmk3Dz1PaoD2
	u1v5m8RFZFzONXgQUOstLU8iYB9UVFEsxy0/V+ewnveVs4Ij/jB3NjoRBPCGhXkL+LIP3gCBTh1
	AuCWyVISuP8q6y0GMG05bmPmoeSho8Ez2ZB7yia8+I4ZrXSKc0iqqWU+ExbZy6s2jeHzVJ/pgzV
	fZyfmYvg9vP+sy/zKEj5VH2EP5GyKYgf91fB991YxvdDaDjWxdyJpR29qmQ8fprfrj6Was3Mxp+
	dBSSDZL9BNn2XqZLp5
X-Google-Smtp-Source: AGHT+IE+kO+0ih3otr2ilVER5YmhgcFdSR2CzWc/DSxY990pGJYLOQdsIKv6VYHabOMyYhFDg7EDug==
X-Received: by 2002:a05:6a21:329f:b0:2ea:12b9:2dfa with SMTP id adf61e73a8af0-334a861fea6mr4543402637.40.1760695353736;
        Fri, 17 Oct 2025 03:02:33 -0700 (PDT)
Received: from sunil-laptop ([106.51.195.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bd7b3173asm2358675a91.12.2025.10.17.03.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 03:02:33 -0700 (PDT)
Date: Fri, 17 Oct 2025 15:32:26 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: rafael@kernel.org, regressions@lists.linux.dev, lenb@kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	apatel@ventanamicro.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Daniele Cleri <DanieleCleri@aaeon.eu>
Subject: Re: [REGRESSION] in 6.18-rc1, failed to query a GPIO using a name in
 ACPI
Message-ID: <aPIUMoDxW-yl2nPm@sunil-laptop>
References: <c321423b-3cdb-41a5-9939-dc5c846cfcd4@bootlin.com>
 <aPFwPR2A0CN6k1Vl@sunil-laptop>
 <1241f2b6-9b4e-4623-8a83-77db8774ac32@bootlin.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1241f2b6-9b4e-4623-8a83-77db8774ac32@bootlin.com>

On Fri, Oct 17, 2025 at 10:50:05AM +0200, Thomas Richard wrote:
> On 10/17/25 12:22 AM, Sunil V L wrote:
> > On Thu, Oct 16, 2025 at 02:47:40PM +0200, Thomas Richard wrote:
> >> Hello,
> >>
> >> While testing the AAEON UpBoard MFD driver with the v6.18-rc1 release, I
> >> noticed a regression. The driver does not probe anymore and I get the
> >> following error:
> >>
> >> [    1.977831] upboard-fpga AANT0F01:00: error -ENOENT: Failed to
> >> initialize FPGA common GPIOs
> >> [    1.977854] upboard-fpga AANT0F01:00: probe with driver upboard-fpga
> >> failed with error -2
> >>
> >> The driver fails to get some GPIOs using a name [1] in the ACPI tables [2].
> >>
> >> I did a bisect and I found the commit which introduced the regression:
> >> e121be784d35 ("ACPI: property: Refactor acpi_fwnode_get_reference_args()
> >> to support nargs_prop")
> >>
> > Hi Thomas,
> > 
> > Could you please try with below change and see if it resolves the issue?
> > 
> > diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
> > index 1b997a5497e7..43d5e457814e 100644
> > --- a/drivers/acpi/property.c
> > +++ b/drivers/acpi/property.c
> > @@ -1107,7 +1107,7 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
> >                                        size_t num_args,
> >                                        struct fwnode_reference_args *args)
> >  {
> > -       return acpi_fwnode_get_reference_args(fwnode, propname, NULL, index, num_args, args);
> > +       return acpi_fwnode_get_reference_args(fwnode, propname, NULL, num_args, index, args);
> >  }
> > 
> 
> Hi Sunil,
> 
> Yes your change fixes the issue !!
> 
Hi Thomas,

Thanks for confirming the fix!

I'll send out the patch shortly and include your Tested-by tag.

Apologies for the earlier issue, and thank you for your help.

Best regards,
Sunil
