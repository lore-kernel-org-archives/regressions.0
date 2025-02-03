Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D90209F2A
	for <regressions@lists.linux.dev>; Mon,  3 Feb 2025 17:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738602382; cv=none; b=j5HlLG5NV9QuEWqqPpGYIh2JhYNVOLFOg14GStt//8YUszGdiQJVTOjHK+LaVAwDt2IvLCzeDbjdmEsFkQFqsAS9t8ZxNLfXI9hgzdrbubijjNbCBE/q/sSN0YMIEEKOjdhFaCstMJyzhNusMwPU+UlmQ9+BgCv+4xRlkwHZF5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738602382; c=relaxed/simple;
	bh=OoY0Jqmx53z2/JPowGHa76X7V+6+EmclWVr7Gf83+ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdRIa7SOjy0zR3DCjfEC0BjwvHx58YPb6gkhnSaB7p3hkKZmIM0K/BwE7+OzNQqwVaYwaSSVJ4LZfkwPKk7fmldUFbqn3wBUuS0TOEU0sF88JortN1J7CHnwE1I6wYC3SU/7GMl6EV49Eqj2trvIDDWjh9H0pADX/L6qEsnBEcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=l3yBKBne; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="l3yBKBne"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6eeff1fdfso423450485a.2
        for <regressions@lists.linux.dev>; Mon, 03 Feb 2025 09:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738602379; x=1739207179; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vuZWIvTMSblyfqLMdc5xTbKGrB3oNMPelT8jaZlHlBk=;
        b=l3yBKBne0cogpGQYudy/V8/M1vpVWA/wUlQruLtWHzZDjf+0aL0+9kj42jtosxoEE3
         se+BY9H7Tkn9UtFevNx5UYk4xT5DeHiE4zrRoh5f9OyiToM8Vs14CJpF2gkMzfHIiDCl
         Y/S4q2GB/Rt6lZp05VVF+ozcnMq1B4kWCXPhKq8lS3/eWyrhgqOlmPf4vkfNnxvEagAi
         eQj4/4JsqnKkkjhm8GQHiNPB5AITlmvjZgG7TOfcdYf5n7Ca2wVsG+Yd10gEmtFUcOMA
         S3wqfWqdTo33dxWqPvKKo+F4hOTaNSM3xqTiz2743xEYJ/BcE7XROPfn0/pmGIYVoj1K
         MUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738602379; x=1739207179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuZWIvTMSblyfqLMdc5xTbKGrB3oNMPelT8jaZlHlBk=;
        b=C7xALnN0bDklIDzgQYg+xQZEbwf/zYhLcOPEJolHgqn0IlSdD3gM/gmzoUjV8s4Tja
         9euOb3Ja04cFnEyihF1NE9Hh6IiVyBErk8DhRrmiM/TbrCCRLkbGOXVslCQj/6h/0L6o
         J2mnWDZCwNkcJFT/s2dqOjqjDRQiOSSlOuu5IRRBBZTgT16ZZIQN13SX53bq93auijI5
         yZGn5bWUBSAYnj9SmZrlHpSB6/qtoaobEiy5RDsSu2jZWARCSr8GY6khJ4ndLe60+kuR
         3EHsy82avjz6/0DuZuPhPNWUeZzMtMhljsuwbJsmL1+HM3Sy0o9TrTVdCh/XEirQtvc6
         wgAw==
X-Forwarded-Encrypted: i=1; AJvYcCVHnfW3JhdcEInbN6TjrPP4mGkGYMvNql6cOLmnfYJw75+sNAIX2TVvBcGWu+d+rrYYv8mbVDmXEW7fRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfZDmfV+UUd1evUPzSPP0EKNUsxV91pk4n+4tWQgQQ8Lh1hl6C
	t2F+cEHex/hcfbVGdCZVdHNA5uN+N/O/5Sri2oa1RGHHFLwEZV+r8sEhS/NTIwM=
X-Gm-Gg: ASbGncsw7M5f6VSXQEB39lMcHxEnewNT8i+lsgWP6PE5mVsl8WnZwRUTazus77iMr5W
	WzataC/dn/JfWH2lDWrUJNXw66Snb24JVi8QPRqQ2+0lnUBIhmGgBh7QEVx+NOFDo7ymLFYhSih
	f/ZAoS23pmAjZsm5KsFKkmxV/NsHlxMf2Kw2fT4lQFq3ylK8S0zUmyMRg5H840P/1f5INESorZl
	OcwoJbhFlb7+G+at6fK2a14SQcbsRUohwP1dkWxdTgWu9aYP/XzFSE+KdfUuceaVi04sCETM1UB
	Bva7IUBLz5lDVzKVTc2MYFz7IrFPOgE5zZINTIyoEo7oqKFtyXqVDogONg3aGeqg
X-Google-Smtp-Source: AGHT+IHtkWAUnkfVOKNEiqf19ccBm1Q+QVdFtpLSmy/QlTYdKKUNZLguQC7dP7RffulvHSXZ4Pw1WA==
X-Received: by 2002:a05:620a:190f:b0:7b6:de8e:da27 with SMTP id af79cd13be357-7bffcd73612mr2894890985a.44.1738602378723;
        Mon, 03 Feb 2025 09:06:18 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8bba69sm549451085a.8.2025.02.03.09.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:06:18 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1teztp-0000000BDBO-2UbK;
	Mon, 03 Feb 2025 13:06:17 -0400
Date: Mon, 3 Feb 2025 13:06:17 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: thierry.reding@gmail.com, vdumpa@nvidia.com, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, jonathanh@nvidia.com,
	baolu.lu@linux.intel.com, jsnitsel@redhat.com, jroedel@suse.de,
	regressions@lists.linux.dev, linux-tegra@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [REGRESSION] Invalid gather when using Tegra210 media engines
Message-ID: <20250203170617.GE2296753@ziepe.ca>
References: <c6a6f114-3acd-4d56-a13b-b88978e927dc@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6a6f114-3acd-4d56-a13b-b88978e927dc@tecnico.ulisboa.pt>

On Mon, Feb 03, 2025 at 02:55:12PM +0000, Diogo Ivo wrote:
> Hello,
> 
> Commit c8cc2655cc6c introduced a regression when trying to use the media
> accelerators present on the Tegra X1 SoC.
> 
> I came across this regression when testing the branch [1] that leverages
> the NVJPG engine in the Tegra X1 for decoding a JPEG file. After commit
> c8cc2655cc6c we see the following error messages after submitting a job
> through the TEGRA_CHANNEL_SUBMIT IOCTL:
> 
> [   46.879757] tegra-nvjpg 54380000.nvjpg: invalid gather for push buffer
> 0x0000000108f08000

What driver is this? The message comes from 
   drivers/gpu/host1x/hw/channel_hw.c

But what driver is 'tegra-nvjpg' that is bound to 54380000.nvjpg ?

Is it the stuff in 
 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/

I don't see "tegra-nvjpg" in the kernel?

Can you share where the failing command was sent to the device?

> Please let me know if you need more information on my side and I'll be
> happy to provide it.

It is still ARM64 & CONFIG_ARM_DMA_USE_IOMMU=n

?

I'm guessing it is the same basic issue as fae6e669cdc5 ("drm/tegra:
Do not assume that a NULL domain means no DMA IOMMU"), except in the
host1x not DRM code. It looks to me like the same pattern was copied
there.

How about this:

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index be2ad7203d7b96..090b1fc97a7309 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -361,6 +361,10 @@ static bool host1x_wants_iommu(struct host1x *host1x)
 	return true;
 }
 
+/*
+ * Returns ERR_PTR on failure, NULL if the translation is IDENTITY, otherwise a
+ * valid paging domain.
+ */
 static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(host->dev);
@@ -385,6 +389,8 @@ static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
 	 * Similarly, if host1x is already attached to an IOMMU (via the DMA
 	 * API), don't try to attach again.
 	 */
+	if (domain && domain->type == IOMMU_DOMAIN_IDENTITY)
+		domain = NULL;
 	if (!host1x_wants_iommu(host) || domain)
 		return domain;
 

(if not can you investigate this function's flow compared to a good
kernel?)

Jason
