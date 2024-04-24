Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D9E15E1E2
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713969426; cv=none; b=RZIaDS5LKpY/ppUY5XiTjp8j3DjEgNTNkRSfL14tegYduoX9LOqD7uc+p5BT2HUFOOVOUrAVd5Uivyjg0LiZKtx+0ppXZKXk/PUAa8MShivummxIe1S6A9uaWhgsQPB6me8FLUqnX86PDwYMDiv6LOsKPba7veIB/GGAvaXOQhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713969426; c=relaxed/simple;
	bh=+BYrTVqDboKGgK4KKS0DRAvfuY7c0pLEiHeUk7SiITU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dvo02HcqpGquPIDTLAxyXXew0Goag8U7cglQDUqELpG5MDIS1eLo02DEwi46IR3u88WngJkSmm9Bj1yUJ2B82bDiFL4QQXuKmZX7EGlKkVROMk49qw0P8rFTqvJUkvqGKqhHIN73BxMxv/2LFCyEvrOEyXu1F7gmYefF7t30TbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=NZrP6NI7; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="NZrP6NI7"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-22ec61aaf01so2935183fac.2
        for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 07:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1713969424; x=1714574224; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T39L+QneLP5gnsdAiD9XezQQ4gD6H4BTQ8GV5y1wMWs=;
        b=NZrP6NI7lM2A0A6aAmyYXkLky/Ze2L6tsqOidrm38YNiaLU+QaYUMJT+oemU2wrKh4
         z0eLgxJ47YRjpehJn6a353ivQ30IxywHZysoh56TWntEpEQPpbPp2UE5Dnpz2/Btqrq5
         PgRs9EP0YKKqbSveRWdJ3VcpxBATNAk32vlUBG0NvNCRFcdGQPuDZo5gB6dWObJ04lo0
         LiuB4+Y1Yf7e92YcXABLyje6AHakOmr7tXctzkYEC2Qdl7HCoo8qEsCaTO3dz4PfX5lj
         ODZntZAZoXRXXK7k8reriZQ0LK5G1s0F3O24/MxEdI/SI2vECpFi30gmgsDqfIPAzeEI
         aOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713969424; x=1714574224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T39L+QneLP5gnsdAiD9XezQQ4gD6H4BTQ8GV5y1wMWs=;
        b=DpvxxiE5oaY1yDgdAJm+WQRaQWqZ2iBP+di9VpR2iyALHAo6Yz2uj06k+xgJzOvxnA
         onD1K77MkOPwmDNGzK46i1dJemFstVpXcsBhSlnFA1frcGxuDZHiQZnuZGe/FAdfjmth
         8NHgv+uL9GjvxUakQbIqPM22sk/ScZKZL/UU6aZ6XdJmPozhWrPc/KRbdSh/1GGe3AYI
         GAsSpRXq/z1lcFBLpotzHXa6wW5Z4M9qglQSGTdMyzsOQ8Myh3f652nGufk6pFVaj8fZ
         T7dIFmf65s/UEtfynG+dDY4uGjl4odVKsI8fW2ffwsRzSd5YLJV11Ze/X40bOjsW+u0T
         heEA==
X-Forwarded-Encrypted: i=1; AJvYcCXVm9u7nYiVjhU5s4G36wPfeJxkBPGqVmhaod6eZurdI+zgF/QNP88xtkd4Ycd9O+2MVoRsYXgyHVNy+hI0nrv4fiKSmqZBBwUJa9Q=
X-Gm-Message-State: AOJu0Yx/tifEJDt1t/JHs9pPsn9++pRO/0xz+0DV6fM4Nc7smeRhbTJ5
	kfnlJBFW1OltVFGzMPVMPd3a1ywGc31DeP0Swd6EJ+1tdb5Fcl7TlF4Io9V1gg4=
X-Google-Smtp-Source: AGHT+IE1/mCX5lKDlaYeWsUxTpNAKM0lRlTcLCGZmXloq2fK5/kkJb4Y3WWADBZMtpMMR37mGoMk7w==
X-Received: by 2002:a05:6870:ef87:b0:23a:a6f:ed5a with SMTP id qr7-20020a056870ef8700b0023a0a6fed5amr2635643oab.19.1713969423775;
        Wed, 24 Apr 2024 07:37:03 -0700 (PDT)
Received: from ziepe.ca ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id ms26-20020a0568706b9a00b0022ea967bb9dsm2858001oab.50.2024.04.24.07.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 07:37:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rzdk6-008CY1-7I;
	Wed, 24 Apr 2024 11:37:02 -0300
Date: Wed, 24 Apr 2024 11:37:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org,
	ewagner12@gmail.com, suravee.suthikulpanit@amd.com,
	vashegde@amd.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH] iommu: Fix def_domain_type interaction with untrusted
 devices
Message-ID: <20240424143702.GH231144@ziepe.ca>
References: <fa14583e94cbf540b60a6be94b41bb24d0037e75.1713272443.git.robin.murphy@arm.com>
 <20240416152943.GU223006@ziepe.ca>
 <3cf97e3c-c8d9-4282-a8ca-e4c1ea383dbd@arm.com>
 <20240424130457.GF231144@ziepe.ca>
 <77fd2bba-fc59-4997-a91a-2d9235ce5cd6@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77fd2bba-fc59-4997-a91a-2d9235ce5cd6@linux.intel.com>

On Wed, Apr 24, 2024 at 10:18:00PM +0800, Baolu Lu wrote:

> For example, the intel iommu driver allows users to opt-in graphic in
> passthrough mode, in that case def_domain_type will return
> IOMMU_DOMAIN_IDENTITY no matter the device is trusted or not.
> 
>     if ((iommu_identity_mapping & IDENTMAP_GFX) && IS_GFX_DEVICE(pdev))
>          return IOMMU_DOMAIN_IDENTITY;
> 
> this potentially creates same conflict as the amd driver.

These performance policy choices should be done in the core code and
they should interact correctly with other policy knobs like untrusted.

If Intel Graphics has some performance reason to prefer IDENTITY then
it should work the same no matter the IOMMU it is connected to. I
think just because the GPU is co-packaged with the IOMMU isn't a good
reason to organize the software like this.

If having a policy of a performance boost to some devices is
legitimate then I guess we'd need more levels on the command line:
 fast           all IDENTITY
 fast-secure    all DMA expect IDENTIY for special devices
 mostly-secure  all DMA but unmapping is not strict
 secure         all DMA and strict unmapping

How exactly you decide when the performance reason justfies IDENTITY,
I don't know.. Would mlx5 800G NICs that can overwhelm most IOMMUs
also go in that bucket too?

But yes, I'm quite adament that drivers should not be using
def_domain_type as some kind of performance policy thing.

Jason
