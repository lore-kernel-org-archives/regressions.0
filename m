Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4AC1E1E1E
	for <regressions@lists.linux.dev>; Tue,  1 Jul 2025 13:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751375122; cv=none; b=TqK44fzqNtvPVyXBKmRH1aYC1g4WSoe9BeFKcdYcGvRQ9bEuNLXa8Hqai7jqwUAPU3DLyGqoioJXFdShvnNDDHSxlOVvLKy7EVJzXtFKw8pY3S4FYpKznuoGcqAmm89bKBTrJ9JhJKnebFLiNe7HHbFL+mzYBc9qeZ9OOEmwivs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751375122; c=relaxed/simple;
	bh=jFvD1ZrKqKPn4xo4zK1Zi3MX9OLA3KyQqmOz21pWQTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZ0BssAPuWrlWM793EMsz/hlBMys9WShtpHmJ3TRL3064Q19tLul9skN80655rwwWPo6lnX7oJD+EIDniol4U0zQ5StTP5kxsABS+ZP7SIyL5tNXNcEWNO/9tUxSjMm0ute20MfKQWRbczplzgfP6AmaKlm9L3K+NNB+/GoV0xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K2NKqcca; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K2NKqcca"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2ef493de975so2042182fac.1
        for <regressions@lists.linux.dev>; Tue, 01 Jul 2025 06:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751375119; x=1751979919; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1TWX8rTsCZMwR7J7QVpBk+kp2Qgls/iNpOzUF5Kdzek=;
        b=K2NKqccaEL8j+TPrdMaf/OV/lyHglPuaprIMr9dorUJ8WTSsUh47lpzeuaY1/5wndB
         0afudmq+Qmm552xBZKzz3QsTAIjIQHSKsp2XsEUFjgw6luV31FNt946Ike53lczWuLQ3
         SHKK5kcKGLVwQdOhzFygupJYgTVKSmT5zC+iN9AxpareuCO7NMg3fvQY/7xqFXkutJfI
         CtnVv3vioI2zH5OL7NiQb4yjmaHX8FTg490ofS4MFSWdYIwcW12FCoWEy8kG8txUblc/
         8YXWKCyxbC9QVWELPyGP9poUCFF6PmehnPF+4eNaLDSfZtz1OlZK/RxRQSWC/hZkRjqe
         /fmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751375119; x=1751979919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TWX8rTsCZMwR7J7QVpBk+kp2Qgls/iNpOzUF5Kdzek=;
        b=dNlXU0Kg2B4UVbr92qRRresf3ZkvKtI0yS7UPg524NOFig8h3VUSk1am5BOPESyJef
         YJi1QE2Y/za76jeInjTOTQ7kPUfUhEW3wJxPQPZdgIFJ2k8cPssD4opZTobpg2lZy1P5
         +B3JpZiN+PIzVJoB7H1e/rom7J9heAzqhEIe4FJ82paSK3ep7Mio60p3HE/bvIiPzy9H
         N9Z0iBtyr5E5GUbwKRU69MIU4LB+ty5M0mHCFvvB/XZgzf9LC1thpzMyVTSW/gmWW98Y
         dkI1ExTu/XQHCqXX+SBFUWU64WZMaKTgO78Q1pqBHfTJu6m4xgGcl24q5PJ/kutf6SZh
         aNTA==
X-Forwarded-Encrypted: i=1; AJvYcCWNc65Y5v/xQvMjS7beXRk+tevUPogsLQWWJGtcZbn57BoKBAS1FymOQfej+BVX0lozuvIDys2QpynjOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6287YhGbdEbze+UWlFzFBlIpfqHefLFFCmF2pX7KvVmFY//rc
	47hqipMiYtOZ8VocC4n/UREyyVIxgPb2npGlKRQtTyyJRxXSQzLKBwkmMby+U+Hwdx1O+jQQ4i+
	LN3bZ7hJte8tFTB+inNyg7SbjyAP71zuewIjLthEI
X-Gm-Gg: ASbGncvK/7zZjsqctanY5cZNPStiSa4PCV3MaUlVA1KqB8PpWM5IGjTqrkrBGYKqIU3
	skwem/3RNTwA1qFiiKROZ+3YbhVG43mByADOKW92zeLP9loVehYgnjCA+tiU4nqxf5SIs8Zx5Cb
	HqKDLBKqL13RsMBRdwZqPDKsDvLXOR0Kuje6ZoXo4Y
X-Google-Smtp-Source: AGHT+IGFPwC9D7ECA270DEQ7V6Lz7pqeKr+PsMPIMsAOBbe6/HXkq3nYn8ORiGwcf/0z2ZOafHpxuFP09EI+CVKrlh8=
X-Received: by 2002:a05:6871:6c07:b0:2c2:174b:c829 with SMTP id
 586e51a60fabf-2efed4ff09cmr12077120fac.15.1751375117445; Tue, 01 Jul 2025
 06:05:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAL0q8a6pOBZbWYdwKzC1U-PuH4rgf2miv0jcF=fWVZt_dUZHmw@mail.gmail.com>
 <20250630133343.GA26040@lst.de> <aGLyswGYD6Zai_sI@kbusch-mbp>
In-Reply-To: <aGLyswGYD6Zai_sI@kbusch-mbp>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Tue, 1 Jul 2025 14:05:04 +0100
X-Gm-Features: Ac12FXxPwbXsIZXwCl1ZRik9WUZfYk8dZINVCxusvm1y0dN6VUD7U0a8B3GvEuQ
Message-ID: <CAL0q8a7acv-9N1XUmJ9LAojdhm947eiira6Kx0tew-VVVCY6kg@mail.gmail.com>
Subject: Re: next-20250627: IOMMU DMA warning during NVMe I/O completion after 06cae0e3f61c
To: Keith Busch <kbusch@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, linux-nvme@lists.infradead.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, axboe@kernel.dk, sagi@grimberg.me, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 at 21:25, Keith Busch <kbusch@kernel.org> wrote:
>
> On Mon, Jun 30, 2025 at 03:33:43PM +0200, Christoph Hellwig wrote:
> > Hi Ben,
> >
> > > [   32.857521] iommu_dma_unmap_page+0xc4/0xe8 (P)
> >
> > Can you resolve this to a source location for me. i.e.
> >
> > gdb vmlinux
> >
> > l *(iommu_dma_unmap_page+0xc4)
> >
> > Also what IOMMU driver is this device using?  It looks like it
> > might not support a 4k IOMMU page size.
>
> I think the PRP handling is broken. At the very least, handling the last
> element is wrong if it appears at the end of the list, so I think we
> need something like this:
>
> ---
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -701,7 +701,7 @@ static void nvme_free_prps(struct request *req)
>         prp_list = iod->descriptors[desc];
>         do {
>                 dma_unmap_page(dma_dev, dma_addr, dma_len, dir);
> -               if (i == NVME_CTRL_PAGE_SIZE >> 3) {
> +               if (i == NVME_CTRL_PAGE_SIZE >> 3 && length > NVME_CTRL_PAGE_SIZE) {
>                         prp_list = iod->descriptors[++desc];
>                         i = 0;
>                 }
> --
>
> But even that, the PRP setup doesn't match the teardown. We're calling
> dma_map_page() on each PRP even if consecutive PRP's came from the same
> dma mapping segment. So even if it had been coalesced, but if the device
> doesn't support SGLs, then it would use the prp unmap path.

Even though SGLs are not supported, I gave you the patch a spin and
saw the same stack traces.

>
> Ben, can you check if your device supports sgl?
>
>   # nvme id-ctrl /dev/nvme0 | grep sgl

sgl is not supported by the drive.. Here was my output:

---
sgls      : 0




Ben
