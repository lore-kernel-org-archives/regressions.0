Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238A815B150
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 13:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713963902; cv=none; b=TkS1VMNOLoRw9KaiK8zEOJQm9hUpVPGha/FX54bop1JMavgBNUbr6j0qCZdPKGc+Rh33RN4ctac1ZcY7+5PZUPcvoXGW5HAYSdI9IagG2PFjfiKFB5x6iFLdb5ucIp7DWlGTaT9ciLHwLzTKMx48+GHbThU+8lD4NtgAfGft7eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713963902; c=relaxed/simple;
	bh=FSxpfw5X3JKannFz6aCnhtqS7DvpDujOvyv9amJS5LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I638wajEIzresleorEpVqVEoyN4YplGoqMhdwq+YlP6PfFJ6FuRlzstif0ZE+Yr5hD3sDlF3QUuxIbJVAfcSwAYn4okeyALGHZqpZWzghS9d5SN153Y8Lc1DQ4kaw3JLzRNdxnMUfdsnu1ocwvMwGAn/y9kNZp4pbidj8hjB5CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=V4XpzOTx; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="V4XpzOTx"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5af3035825eso370467eaf.0
        for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 06:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1713963900; x=1714568700; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nbc/ZlhMzbLo/3ax7yL4ZIM4VQzRDrjohLJqBNOiRFQ=;
        b=V4XpzOTxa2McP0bqVXGM8RLgCyCQt5iX1d8Jb8/qsB0n26RA7IeoVlqdlyTZguSreL
         wSowiOZ2x7MxrmQTCpXkDr02fyidPN0QTwgnJ1H7/s6dr1x4u7FQNIznlvOJnBUOexpS
         Pm3/RyUKwEuWHZBsYttJXZ0Ib3KJAOo5wYwXpmBcMIFVMmBj6IYI7puHYIrgV9Bytiav
         VwWp5lVHU5fmEyGC9nDYj4sEl78xzOCig7RLErvQYj02+lIzO7AbwGWrh4NSEzSPlfLT
         4a0CCuA1EllS+4ZPARdu86vDY1wWqshoytaKZGuo2+c2mJtMJEbUM9yAwNvIDBIGnkVk
         gnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713963900; x=1714568700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nbc/ZlhMzbLo/3ax7yL4ZIM4VQzRDrjohLJqBNOiRFQ=;
        b=J7/CYD4anrXlglx9Jg5te4Gjogm/tDNS648CtEuoqjiAJl7UWEvClUPFQv6jfVIdKR
         FQFhcDpwD9Vfdg9zii+yMTXF5UjgSowJ6yhseRFsD2Tu3xN/qgUJABESqTiKcsfT2rBu
         tqKv28Zt6f/IGdXFQb+oofYefZai34RsAFLUgmLWR2ElYeFryqeLPuCWCEuC+/K74u0U
         CMPzpktY2myghCR23jvQz/UTl4GM0wdWoFyXlBg9X8L+qKSuVesbGh7emEVZ57onR7QC
         9tCrCxZGSOwTp7dRiYQ5Oh3iqHvvNxO/lxnR8ch8TEJGxK28SxG8Ax1jzJ7ry5lb9+MN
         swNA==
X-Forwarded-Encrypted: i=1; AJvYcCWg1vBUC/kE5mm5hPQzCUVhOp9FHv1H0NWjYvFMjCqYiYNDoWD5A6URz0c3jObURrEzAaqngU+p6tAohrqGaXaowXguodbAOo2yFXM=
X-Gm-Message-State: AOJu0YzpSZ8m7j3Oo+foZ3Ys/RfqpIUVTmgGGNs18l79DDpZVrxxl+aP
	zrIC2iUvxxkcRW7+YgD3n6jU8D/m3iDgmtjMbTb3eiqx10qXWxYGQPpLWjv011I=
X-Google-Smtp-Source: AGHT+IEHA0RheIKXaYWq3t0fLCW1LE7ebG1Op9pYKAXc/ZhXqWzTYKFvXAfIMS7+yw3mUPAtrNk4bw==
X-Received: by 2002:a05:6870:71c9:b0:232:fbb7:c633 with SMTP id p9-20020a05687071c900b00232fbb7c633mr1051735oag.11.1713963899893;
        Wed, 24 Apr 2024 06:04:59 -0700 (PDT)
Received: from ziepe.ca ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id mk9-20020a0568700d0900b0022f939a3e2dsm2834331oab.55.2024.04.24.06.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 06:04:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rzcIz-007uTp-Kk;
	Wed, 24 Apr 2024 10:04:57 -0300
Date: Wed, 24 Apr 2024 10:04:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, ewagner12@gmail.com,
	suravee.suthikulpanit@amd.com, vashegde@amd.com,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] iommu: Fix def_domain_type interaction with untrusted
 devices
Message-ID: <20240424130457.GF231144@ziepe.ca>
References: <fa14583e94cbf540b60a6be94b41bb24d0037e75.1713272443.git.robin.murphy@arm.com>
 <20240416152943.GU223006@ziepe.ca>
 <3cf97e3c-c8d9-4282-a8ca-e4c1ea383dbd@arm.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cf97e3c-c8d9-4282-a8ca-e4c1ea383dbd@arm.com>

On Tue, Apr 23, 2024 at 12:26:41PM +0100, Robin Murphy wrote:
> On 16/04/2024 4:29 pm, Jason Gunthorpe wrote:
> > On Tue, Apr 16, 2024 at 02:00:43PM +0100, Robin Murphy wrote:
> > > Previously, an untrusted device forcing IOMMU_DOMAIN_DMA always took
> > > precedence over whatever a driver's def_domain_type may have wanted to
> > > say. This was intentionally handled in core code since 3 years prior,
> > > to avoid drivers poking at the details of what is essentially a policy
> > > between the PCI core and the IOMMU core. Now, though, we go to the
> > > length of evaluating both constraints to check for any conflict, and if
> > > so throw our toys out of the pram and refuse to handle the device at
> > > all. Regardless of any intent, in practice this leaves the device, and
> > > potentially the rest of its group or even the whole IOMMU, in a largely
> > > undetermined state, which at worst may render the whole system
> > > unusable.
> > 
> > For systems supporting untrusted device security the translation must
> > be BLOCKED at this point.
> 
> So why is that not enforced then? 

I'm not sure what you mean? At this point the core code has no idea
what translation the iommu driver setup when it booted the HW..

I mean if a iommu driver is going to support untrusted then at no
point can it be doing IDENTITY while the untrusted link is up.

> Simply hoping that calling ops->release_device() or returning an
> error from iommu_device_register() might do the right thing is no
> guarantee.

The systems that support untrusted must put things back to BLOCKED in
their release_device() to be ready for the next hotplug of an
untrusted device.

> Furthermore I'm pretty sure we're still letting an
> untrusted device be hotplugged into an existing group without any
> checks at all.

Yes, combining trusted and untrusted in the same group, regardless of
domain type, is fundamentally wrong and we don't check it.

> > > Unfortunately it turns out that this is a realistic situation to run
> > > into by connecting a PASID-capable device (e.g. a GPU) to an AMD-based
> > > laptop via a Thunderbolt expansion box, since the AMD IOMMU driver needs
> > > an identity default domain for PASIDs to be usable, and thus sets a
> > > def_domain_type override based on PASID capability.
> > 
> > The majority of places implementing def_domain_type are using it as a
> > statement of HW capability that should not be ignored by the core code:
> > 
> >   - DART
> >     * system page size is too small, can't map IOPTEs, force identity
> 
> Not a hardware limitation at all, it supports paging just fine, and
> iommu-dma *could* in principle work with larger pages with a bit of effort
> (some proof-of-concept patches were posted some time ago). 

I was not clear, I mean a HW/SW/Driver/system issue. The net result is
that PAGING or IDENTITY does not work in the Linux kernel for a whole
bunch of good and bad reasons.

> >     * iommu does not support IDENTITY at all, force paging

Like this one is a good reason. No HW support. It is checked during
attach domain and fails it.

> >   - tegra: Device quirks mean paging and DMA API doesn't work
> 
> Hmm, I don't recall any specific device concerns. 

Thierry told me once, it is another ugly GPU driver hack IIRC. It is a
bad reason, some hacky GPU driver issue and is overkill since it
should of_match like qcom.

> >   - amd: The driver can't support PAGING when in SNP mode
> >   - SMMU: The driver can't support paging when in legacy binding mode and
> >           paging domain allocation fails as well
> 
> Quite obviously nothing to do with hardware.

But attach_domain still fails. From a core perspective PAGING doesn't
work.

> OK, so after all that you do in fact agree? In that case, why are we still
> mucking about proposing hacks on top of hacks in the AMD driver rather than
> just fixing the regression sensibly?

It is because your proposal is regressing the meaning of
def_domain_type back to a policy knob when I've spent a bunch of work
emptying out def_domain type implementations to get it into a
capability report.

def_domain_type is now about *capability*. Does the
HW/SW/Driver/system support PAGING/IDENTITY or not.

Meaning if def_domain_type says it is not supported then the core code
should not use it. This is how everything was working until AMD
changed their driver to lie about what their attach_domain would
accept.

I do not want to see def_domain_type regress back to being confused
where some drivers are policy advice and some drivers are capability!

AMD should hack their driver for the rc fix and then go and fix it
properly to remove the PASID logic entirely from def_domain_type. I
will also point again out that in v6.9-rc AMD doesn't even support
PASID yet so this abuse of def_domain_type isn't even needed. :(

The core code should contiue to treat def_domain_type as capability.

This has obviously become confusing. I think we should rename
def_domain_type to have a clearer name and clearer purpose. Call it
supported_domain_types() returning an enum of:

 SUPPORTS_ALL
 SUPPORTS_IDENTITY
 SUPPORTS_PAGING
 SUPPORTS_IDENTITY_PASID

Which is much more clearly about some full system support, not a way
for drivers to inject arbitrary policy.

Jason
