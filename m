Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297113F9F2F
	for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 11:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965387; cv=none; b=f8qZ/6/RNJxFYR7hYt3hYxlzn8bbvG5YRfczmsHxaRprtYaIBwmISlFya9TOZEtKvzFa/GtL6zWXUjSKdDZT4YxMaTcHkBP7LNB09a1iRBZQZ8k9vOWScwQ35ykbkQd3xy10mJPgl0CjbjrVf65AIqRbts+vsMGNPpieygreJ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965387; c=relaxed/simple;
	bh=VVXh1hJaIziTnYcw5VXBnBRcdWv8NrGa70oD5ZkUoBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3Y17UXYvru6JBzp3gn0pKEGIu42fRgWwgnQ7PreXUbjMeXutMUwve9F4OvOCQY/WLJc3dg4hUXyfkyqQsAXvgf83ByvvGuu+IqmNPicws0KFPbbL9Hld1PjqlQ8ZKwDLlgdclOWqpf5IL4Y8fc3k5KZuCDCYqDBnHgD64kKR9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J5CVKQD+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J5CVKQD+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ccdf36f63dso246615ad.0
        for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 04:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786965385; x=1787570185; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R+l+UxdGP4xSYpq+snL3DrvZxjB7YwI2tVyA/dO6w4c=;
        b=J5CVKQD+GyQipXNzqS6n27hruYn+7kKacKA4YgibisK7gzDwkET2U7nVvBPtJ9dAVj
         7ZQpCXDWIvSbVBvbwyc5TizmY6uKxosGCjn3/BUL12ShgrASbEHPxgh1/gilkpmdBqlL
         zSwtvmG4e5DuVq8LZhsmrJLSGxjdvEqj5vc+i+jbzOqNY95sEGF+Jve4rhollaU2VxVZ
         emlFjnaGQP6rvXYv3ZG/8MwZf57unSxKaKC79KF+Q9LEHnQvGHFEGWX0WbMpv7VlXuad
         z4jfhrE4nspJTETTyRwmwdPFMnuvM5r65xkMrlz1PCNjR5YnM3YyL8tgIbo8MtBrKbXx
         E8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965385; x=1787570185;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+l+UxdGP4xSYpq+snL3DrvZxjB7YwI2tVyA/dO6w4c=;
        b=qmA0roJUcAf5XepPMteXRG1AYjLclc5CFgJjwIQRG0RtmA8/ZbaMiVlesdclhnTIJG
         4ZuzrBrE3eFfAljhQP0od0fkCH9HLK5u/bftdMTtThhYsGm69j9DKC8XFEWP7nEJ2G7J
         VT3Z0pZ/ispbOlVOvTxT1QThWR03VeAAc9ps1dij9hMubi8fYY543hJI/Mf3asQzSs/1
         QCdjL8HYw+JchS4LVen0xaqZfEF9YWcJCwXB3FOAG/TzWolC4LeLiSbwJ8Ft7esnVB/z
         Y0MJ78f3M4vkct6yljbKagd2SGPzuBvdJdMxCrMfn0j+sKOO9HixpJk9Y9Gy5Ly9aBFp
         7knA==
X-Forwarded-Encrypted: i=1; AHgh+RoCoSun/hqsPo6rxWKBrMYfKe32azLNYnOK2s7jcRAmLtGJiVa/LmcaYaHo8fm/giBGLvVeB5OqBBQxYg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/XjbqGqc4XcYYAZSO9lvtOd+0lQ9AUJfixkWUtmHkM3HZH+4X
	XMv9Lwiezf6n8DrMg3hGbaXHW4Tg4gbj3ywn7yaRB7KWQ8m9+ItfhyF9JrQipW3s/A==
X-Gm-Gg: AR+sD13FzEK+UjZAPPQ06QryWWyK7FaFwkVx/WY2gpL+l8AwLCIOL/iXh1KcBDtXeUN
	VlWZ5LErlKKUs1vZUs/IJKF2A2eB8pjHTYI3XG+1zlRmdBj1NaSEaoQUiSA2e6U9d5LrDsCmOae
	UP+yZEnT5ZbUR9Ti1BQb/sHo6M5yNy1UnD9XkWHDe/1sce0XOfMQZ1foawnkkDvpmwUfGZ4lgbZ
	amIdzEnGqy8QEDe5p6sG+NYM6YsikQtbiakD+HVMAmWcD+lEal5tCAgLj43sltVgj7BiUfZAlWl
	2euvQ4aYoby7NpMpyVYkeF9ohToC5NFpwNRtzRCOCaX/ElgrHvW17iR7esJ3RhJvpN/EjMuLQm5
	DauDvGNfJpm3RArdoM3etngMhicUmMGk/5526V/oRM8CLiA1NgKtHDVdcdWPwboP6d+MkoXTiF+
	j7wuXjq7Nt8rj6V1kJkzfhB34sdVJTqKxg60DHKU8dJ23CR/hqMMfFF8pWXYLyUVwLWY0ucAsGO
	sPnV5zJht1g7fRPGevuFTU=
X-Received: by 2002:a17:903:2b0c:b0:2bf:1000:d3ac with SMTP id d9443c01a7336-2d596cfb925mr4566865ad.11.1786965384912;
        Mon, 17 Aug 2026 04:16:24 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb499e8csm3975245ad.2.2026.08.17.04.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:16:24 -0700 (PDT)
Date: Mon, 17 Aug 2026 11:16:17 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Dmitry Malkin <dma@nebius.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	NB-Core Team <NB-CoreTeam@nebius.com>
Subject: Re: [RFC PATCH] iommu/arm-smmu-v3: Allow nested attach for PCI
 bridges without vDEVICE
Message-ID: <aoLtgeYLpYobpyKN@google.com>
References: <PA1P190MB25578C482C8A3B06A4DCC6FDDBDA2@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
 <20260814174825.GC510472@nvidia.com>
 <PA1P190MB25573D7CFE42EF7DD2A8CDE8DBDA2@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
 <20260814221103.GE510472@nvidia.com>
 <PA1P190MB2557D53CB7FCB70EB8F79D09DBA72@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA1P190MB2557D53CB7FCB70EB8F79D09DBA72@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>

On Mon, Aug 17, 2026 at 09:29:10AM +0000, Dmitry Malkin wrote:
> > Don't use it that way?
> 
> Why not? We use pci=config_acs to configure ACS at kernel startup and
> enable direct PCIe peer-to-peer traffic between GPUs and NICs. All 
> affected devices are assigned to the same VM and IOMMU domain, which 
> also reduces the memory footprint by reducing the number of page tables
> and lowers IOTLB pressure.
> 

I'll defer the debate of enabling ACS or not OR supporting multi-device
groups for vIOMMU for a moment.

But, regarding PCI P2PDMA, you can still enable it with ACS enabled in
the upstream kernel *IF* your hardware supports TLP forwarding between
root ports.

When ACS is enabled, all TLPs get forwarded to the host's Root Ports
instead of getting routed directly through the switch. All that needs to
be done is to add an entry of your hardware to the whitelist in p2pdma.c
(pci_p2pdma_whitelist). Are you aware if your HW supports this? If yes,
then a simple addition like [1] should work.

Thanks,
Praan

[1] https://lore.kernel.org/all/20260409150123.3538444-2-jmoroni@google.com/
