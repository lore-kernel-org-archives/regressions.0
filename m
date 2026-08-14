Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B45E3C73D1
	for <regressions@lists.linux.dev>; Fri, 14 Aug 2026 14:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786716974; cv=none; b=UWnJ5CApBF+vJTrBqoPyp5h/swZfi2Bk94zJkiI+GawMQQGmd3xegNiiaIqAv2zBgM9iyzGuPVKi8vK2+SUV9dCXlK8auAFyC/e4dxunI0hsZtghlSYkh2jh5bYNA1vygVORvwY2PacyzDiTdjOIoT9tTixHyJ80NWeUBJFybLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786716974; c=relaxed/simple;
	bh=wNpmRG0bvwI0zH3SDqeNYVrQrLdnvlPl+nuh3Ab+P20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnIwsGuYHiP6N1L1AVkpo2e+wM+dRXKQuz6wdfdskgqVCt6gqSZl1Mo9TsE/Au2C+dWDQvWupMwJgB36WInqIYYhThKJg4n4LVXdEAkx/rtdHYxnTo62BN8LVI9XH6QxpvYx5BcRiSXLXu2G5xOcK+ICfoLRaL1iLMjp6F5f2U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SCN65Q+d; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SCN65Q+d"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ccdf36f63dso112175ad.0
        for <regressions@lists.linux.dev>; Fri, 14 Aug 2026 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786716953; x=1787321753; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rH19XpzJqW08+W7mG+VpaQ4KF0ayb7gJPWy2w+2WSfo=;
        b=SCN65Q+dac/yqwk2Np51M4MxFXHWIy6yaYnx6EoPk6/PY5f5WbJiZFDMhfkg/oEBi4
         TR0IHEOUBYf1EpdV3/iw2yOE0+WDJD6e4UwDjc21sl7oHBInln+SLGgL0xhvxOy477As
         xbiYgIvlLT26i+U1p4xUXRytKUvDvq2ZdmD04Ty2w1ucy6U/YFE/D+KdVfwaonNusW2x
         0zauoKXjRW0u5Rmaz85gF3Ghsub2cD5YUmAxnEpZgVqEGAeLnMp6yPvksU6Zq0dPiocc
         uwffo3BgDq+HAsg36QfkU1ttyVvVTF0u+1E2RjfGAHg870tjdA43jR6IBnubzDPUZTqy
         QYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786716953; x=1787321753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rH19XpzJqW08+W7mG+VpaQ4KF0ayb7gJPWy2w+2WSfo=;
        b=FLtEpouUjglYQIdTWGmP/KnwP/jHL/hnxbXftOkywsJLvB0EX83+zkJWZ1lagin76a
         VAIjrof2wEQI9BXmyCGLF02T7q5FP8ATOUm55xjXCMe/wRyf8vxpzz9l4OmgsSUf7YJs
         slpgaYSOjG28L9R8VUJtOyQfuU6Y1dUY63F1mofWVzBeGvNxGTNQqynzWUxLwIMg3FEs
         orKI7/4lrHeckvgRYvrsZdtTf4Q67aO8oobpwGxz2dWsnGhxLsFTnPHzxTcmoxQtYbwv
         5q+ihdnu1pN0ndEc9yi5O3lOCIs1w8v2TOqc3o5a/RpA/LX6ga9Beb1HdZSUJ2IctuoT
         wn5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqF1TnHvIZ2AEu1Mn69qFzn6n8olrjTGOHLjtUrMSvFaWe4A66iaWtBxv2qyjfcqg8MabFfZzwOCue0uA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlGDh4mn92BMkqx5XPBeun2xz38vYFN7Opa7Ve8FBnUbsmzEU7
	8BVcvki1osS5NdmM5KzQpE1sJmXkYmrNoTj6zXzbs86pheDJtlHa6yW+BxlJ5UMoOg==
X-Gm-Gg: AR+sD12KDYWv2IfB+k0jZ3Pbnj3AkSiaN2AlMHSIhkDOJo28ZBinaE7MGHP+OcqVC0+
	zbwzRSAVUHqCuyaIhTWwwp2IlPEh/Q+vg8on8T/yRn+HrC2KJZYQVeS3e+7R7g5QwTEjr3G/7I8
	xt8SPiNFG/nESg2YXv9I5Ae4QEW2oRV2fmEnZIrIASR7EjL6tZijpkpRGE60/o0kCI++DNhZxPw
	aszaffqkDUUClw3NJCWd05zDAHpzZ6qcsTw3qe9kJdWz07jS3YKODLESJSwpEmr2W+93CDPsgZC
	Q2dlES5f9IbIQPtZqvrCDKPQ7oQsdIWszwrTNNqrRFPwjN+S3EQYU15W/4U7be12dhie/5Cesw3
	7H7P5E0kcfVfsFt50/wrGYKsPOcT3O8WXRqWH31wLXZuzPxZbQIB3urA3GwQA0e0lhcnbMDFaJe
	mVol+ni+fCwL0ErAP+3Zmm/z+cv3RUukhl76iRTHLKDtCMkjbSmiHZ3AsjuVwHuc9J4ZnsZhbkw
	zs3w5Fhdz+TOywG+0sROncta4wEejwLsw==
X-Received: by 2002:a17:903:15c8:b0:2ca:6bf:5bac with SMTP id d9443c01a7336-2d3af24fa75mr9130205ad.8.1786716952002;
        Fri, 14 Aug 2026 07:15:52 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d223f8csm551513b3a.35.2026.08.14.07.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:15:50 -0700 (PDT)
Date: Fri, 14 Aug 2026 14:15:45 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Dmitry Malkin <dma@nebius.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [RFC PATCH] iommu/arm-smmu-v3: Allow nested attach for PCI
 bridges without vDEVICE
Message-ID: <an8jEbT9pAUYfsvR@google.com>
References: <PA1P190MB25578C482C8A3B06A4DCC6FDDBDA2@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA1P190MB25578C482C8A3B06A4DCC6FDDBDA2@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>

On Fri, Aug 14, 2026 at 10:07:09AM +0000, Dmitry Malkin wrote:

Hi Dmitry,

[...]

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -5,6 +5,8 @@
>  
>  #include <uapi/linux/iommufd.h>
>  
> +#include <linux/pci.h>
> +
>  #include "arm-smmu-v3.h"
>  
>  void *arm_smmu_hw_info(struct device *dev, u32 *length,
> @@ -118,6 +120,17 @@ int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
>  		if (cfg == STRTAB_STE_0_CFG_ABORT ||
>  		    cfg == STRTAB_STE_0_CFG_BYPASS)
>  			return 0;
> +		/*
> +		 * Group-wide domain attachment also visits host PCI bridges. Such a
> +		 * bridge is not exposed to the VM and therefore has no virtual SID.
> +		 */
> +		if (dev_is_pci(state->master->dev) &&
> +		    pci_is_bridge(to_pci_dev(state->master->dev))) {
> +			dev_info_ratelimited(state->master->dev,
> +					     "skipping vDEVICE requirement for translated nested domain: cfg=%u ret=%d\n",
> +					     cfg, ret);
> +			return 0;
> +		}
>  		return ret;
>  	}


I agree that this is needed for old bridges. However, should this check
actually live higher up in IOMMUFD? Instead of the SMMU driver deciding
to bypass the error, what if iommufd itself intercepts the vDEVICE 
mapping failure during the group iteration? If IOMMUFD sees that the 
device lacking a vDEVICE is an IOMMU group alias/bridge, it could 
explicitly tell the underlying driver to proceed with a NULL vmaster?

Also, regarding RID aliasing: while it's true the host bridge doesn't 
need a vDEVICE for its own host-consumed DMAs (like AER/PME), are we
confident this won't break guest-injected events if the bridge aliases
the downstream endpoint's traffic? For e.g. if the "real" endpoint's
traffic is aliased to the bridge's RID and the bridge has no vmaster,
won't we lose the ability to inject IO Page faults into the guest?

Thanks,
Praan
