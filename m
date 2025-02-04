Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE743212B1F
	for <regressions@lists.linux.dev>; Tue,  4 Feb 2025 13:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738675276; cv=none; b=EcHf1wchczO2MYRrdv2P72xCJuko6+EHRHKYLKwRAMepLDSX1Wjef3F6pZlEMhHmes/Q19Tnz++qSYyU/+KxAnDJPUxp3DYT7Q8rVPCsB4RRvaZHbdh5sJIY8PNzAzp2MMV6a0PtcQ8UIGq+M/EYy4ZuDnt/ZSSHk83JNKKhrpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738675276; c=relaxed/simple;
	bh=DYoArqhz9bnwOrJj2sFoc+2pshtV2jJmtePZZiRSIq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSJYvxg3pt5qvfZR+9JFKmjETS/igGIWToxVXDeumXut0jWaZvtpL2/xFChhh4ac0LvARbflikzEbXPlWD2g2GJxZWZpDk3QBC7ivIwKMfCs5+vhqk5n3SbKYH+Sx9IlcGUKCAeuv9/k9WH/SrNkvGngsKzyxl/HpVm6Cl1o5xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=YjKtZSDy; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="YjKtZSDy"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6ed0de64aso477301185a.0
        for <regressions@lists.linux.dev>; Tue, 04 Feb 2025 05:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738675273; x=1739280073; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RYGog+BswJMrw0pyjx8F7JNxxtJRa9tDqKmDTEz+voo=;
        b=YjKtZSDy4sTpXKMk1S70s35GL/+a9XfnS9cUMWSAKjfrL0//V5CYwBHodg2hiMM07p
         OKkq38BGgm3QGAMrdOGiqBJYPSZywNY6/OvgVWrIAvi+hw1VwBFxPRF9Wlb3EYQac0ch
         RY7t0eYdCvwLimNvmb+5gfqnGgxfZwVAXaTbHleQM+foEXWMx49xbtoslFT2lz4eXZ2V
         PfybdkQhL6wTg/ZFMsCJGUJ5DZXQ2LPwuFbbG13fXeXrXTA0vgOTTk3BgJHjU7fiv/Aa
         4fUkRW+y0SQJFrXzkp3m2uh+s6ail40Gm14C5yUbdUmlhrwiUcJyJW/vUplASce014Kq
         uCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738675273; x=1739280073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYGog+BswJMrw0pyjx8F7JNxxtJRa9tDqKmDTEz+voo=;
        b=oQf8hGQ6pEtwrokkhkJO4977chUwoM5p7sK1WZeZet47WE9HyrsfK2MHWuh3ua6oQo
         HTinzH2aumsNGHSi0Bg38/nHzwWEA8f3JwfofwXRGSRSBRdLHdxVoaIkXunRCurQZl1K
         mdw5qFPQ8jrf0GxAUSISM5ygCDMTVOuozU7OmRX/g9GfQ/ryVfyTTkZA438uLCF4Skjo
         DWDoxA4W+9CNxInW2lxQ8RTdYH+o7vnu2HpkMIsZc07LnKpmcVZt7DEZ1bThkMZnrcSr
         qGOZLLXIjDpDMDRn7lSEflIQR5bvUkxCCXnLttJT+W6G5rm4Mr8jmDDMUYDmKFDwvOvO
         OOAA==
X-Forwarded-Encrypted: i=1; AJvYcCWwsGQqapR8jlChNpZpCCi5Gx/gm75EyLPo4dVdzGH7WKTcvHy6tK5oKQ2po60p/CPWkDRpImjWfZgtwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrdCN8Z5pWSdcG/H8MdA7BVIy8ZN0TrwI41MqLhrgeMC3MUfM6
	1bF8h7pV+m8e1To5zJD4gZdgGvOw9el9ip9TTBM6zPjlhMo2XD4tt8pOAvNbKlc=
X-Gm-Gg: ASbGnctN7DXwmtmjYHIumdorWJdA9+zqYuZ723XGxVtno7JnQFcdEjXSi3MLuS6hdjC
	RcIPU62twjjf+TRiQa8VMl0o+nYtborX5u1BRR+khh5Cl2pBANmfCWFseFOkvf8GDa4m/CQJNmv
	Elq0+XyYvSh0Lwh3WWMjbPzbZZzMrcJEDI+y+3DAY2tdc4lmw6Inw4ntIFZKcOad1GprYAdg9H2
	NVQR6Nm2ccf3gRxA80wW+d7tgDtzQdtgahjtiIyeAJjY8YRp1ypWY+As9CHxVlRcaDwVNwlpaLh
	QvoKGGedPtnKcS300elfCov51r2r6JwPbN4GEjOBzHYCFPpNJY5pIFsR1k6R6TZA
X-Google-Smtp-Source: AGHT+IFUKUoX2jULeFPKEB1swp6FZ+1r6kccPcITYBbJl4Daknruc2a86ltK8n50/s0eCiuq5Mvn3w==
X-Received: by 2002:a05:620a:43a1:b0:7bc:db7a:4f78 with SMTP id af79cd13be357-7c02ec1063cmr525137685a.4.1738675273573;
        Tue, 04 Feb 2025 05:21:13 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a905b6esm637056485a.68.2025.02.04.05.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:21:13 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tfIrY-0000000BRLd-1okT;
	Tue, 04 Feb 2025 09:21:12 -0400
Date: Tue, 4 Feb 2025 09:21:12 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
	vdumpa@nvidia.com, joro@8bytes.org, will@kernel.org,
	jonathanh@nvidia.com, baolu.lu@linux.intel.com, jsnitsel@redhat.com,
	jroedel@suse.de, regressions@lists.linux.dev,
	linux-tegra@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [REGRESSION] Invalid gather when using Tegra210 media engines
Message-ID: <20250204132112.GH2296753@ziepe.ca>
References: <c6a6f114-3acd-4d56-a13b-b88978e927dc@tecnico.ulisboa.pt>
 <20250203170617.GE2296753@ziepe.ca>
 <4ea1a48c-9020-4793-ac9b-b51fc289e442@tecnico.ulisboa.pt>
 <20250203174331.GF2296753@ziepe.ca>
 <a0f776ba-bfd2-41fd-8370-14818b86bfbe@arm.com>
 <20250203191346.GG2296753@ziepe.ca>
 <ff901d60-dd54-440f-a0da-4b72052eafd6@kapsi.fi>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff901d60-dd54-440f-a0da-4b72052eafd6@kapsi.fi>

On Tue, Feb 04, 2025 at 12:26:46PM +0900, Mikko Perttunen wrote:
> On 2/4/25 4:13 AM, Jason Gunthorpe wrote:
> > On Mon, Feb 03, 2025 at 06:49:07PM +0000, Robin Murphy wrote:
> > > I'd hope the historical reasons for not supporting IOMMU_DOMAIN_DMA in
> > > tegra-smmu no longer apply, given that all the default domain stuff has now
> > > been integrated into host1x for the newer arm-smmu based Tegras.
> > 
> > Indeed I do see appropriate looking calls to the normal DMA API, and
> > the other mapping path is conditionalized by !host->domain.
> > 
> > So, why didn't it work for Diogo? Even in identity mode the DMA API
> > will return correct DMA addresses and the !host->domain path will skip
> > mapping them.
> > 
> > Poking around I wonder if there is some assumption that if other parts
> > of the stack, maybe the DRM driver, are using the special domain than
> > everyone is? It seems to blindly pass around IOVA without really
> > checking who is consuming it.
> 
> I'm not sure where that would be, but it's certainly possible given that
> this combination of code paths wouldn't have been tested.

I saw some weird stuff.. Like tegra_bo_pin() does:

	/*
	 * If we've manually mapped the buffer object through the IOMMU, make sure to return the
	 * existing IOVA address of our mapping.
	 */
	if (!obj->mm) {
	} else {
		map->phys = obj->iova;
		map->chunks = 1;

And obj->iova isn't obviously linked to a dma map on dev.. The comment
reads like it is making the assumption that there is only one iommu
domain shared by everyone (without checking dev is part of that
scheme)

> > Christian was telling me DMABUF had some drivers that made the
> > (incorrect!) assumption they were all sharing translation.
> > 
> > It does seem like a nice project for someone who has the hardware to
> > rip out all of this custom domain stuff and just have the iommu layer
> > setup a shared dma-iommu domain.
> 
> This has been a long-standing project. The issue is that some boot chains
> set up the display expecting identity mappings,

The smmu driver can match on compatible strings and leave some devices
in identity mode, if that helps. Other drivers are doing this to work
around various issues.

> See https://lore.kernel.org/linux-iommu/20220512190052.1152377-5-thierry.reding@gmail.com/

But using RMR seems like a better solution?

We could perhaps also figure out some way to leave the translation in
identity until the DRM driver completes the reset, then the DRM driver
could activate the DMA API translation manually.

Jason
