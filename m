Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA4923BF9C
	for <regressions@lists.linux.dev>; Tue,  3 Jun 2025 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748964781; cv=none; b=P0tfwG25+1ON/pWJGULgm5YeimpFudsLRZ9HuDfJW2yWoNWQvES45SAU9l7ITC/KDmDCwF4nFoB8IdBS7V79hnQi8ydXk6nmloi7lt5SD0jUn2LiVeru+5lqutSjyZO4GhoXGX8Qc2whhevR86dFInyWvpySiDAqcbSUKlDfqoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748964781; c=relaxed/simple;
	bh=l9yh5roB6TAD+eJpxkrTHsMLVCJdRJ3KS9fKxDqDNog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRKoXE1fM9Co4TrlmBsvf8IVtwy5XBp5gk37ohuBvjBfFjG3anJq+8AgU+/o/eRBPV4aaZbUqRUNAKO4OGRTq7CENjgrXkvqQm2AN3/73uzrZUCsvQociIojo56pF7lLUkcNHud2uVFlG4WMvnpPS1u9hRRDD3U8lIh05lqmmYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=o8BSCkcz; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="o8BSCkcz"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c96759d9dfso901879585a.3
        for <regressions@lists.linux.dev>; Tue, 03 Jun 2025 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748964778; x=1749569578; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1mtQW3fkkCN4JKD2bOxa9OSXsumf197V91aZsIjfwDI=;
        b=o8BSCkczFJPL3U1aSDv2MolmVUOMwxxhYFI+YYxtAF/XTjqJX2bVb11ZzFTfs228GB
         gBldj9SOD5Y68VM9p2pAL/B6yRreypeIgZJ2L2q4zBJ7HH3nFf9nEkRzmbx+8f/NYyQh
         3gaeh7Zuycnh4H7ouGJkkCjdlNdU2/bEHKjUxe/5mdQNgSVNng3qp7CxFIYxjamQ4xpt
         RPnzlzbV3RBVOliyrF2ZwJIEnzgNhR54ylDq6mrcSn397oOk4Bp4+0QVNpQGElhO3pFG
         5jm5vcEuXVExhvnBpp9NGB0B4eEFIihX8rct88/f0tnjLgUy0lQQUwH42qdw4EcrlO1x
         xTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748964778; x=1749569578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mtQW3fkkCN4JKD2bOxa9OSXsumf197V91aZsIjfwDI=;
        b=ZkqD1FEEd1Gu5S7CXuGD5oWIh0Nu3Mwy3IvW57CD0FZCCalZFoZRQNM+RfOcB7JVuZ
         EuubkxLZeYtsZBWUb+YrHTZH617Q/BgYChv1GGEt0rsS7LsauJQ7UdrloDC5Lgi65+TX
         sQWXlsLvICfUyb9EsoxOuOnklOzi2XB4j9aqbOnnEeUNDFJgxi+NGsLDFmjnMiIqT53C
         3YO0WIAGaJgu6gOrqjZmrR3YV6BMRl37Q+nPmqeR1MqBbX9RdV5DAKDmTZzx5O6L449h
         xboBESspzxjUdge86zRx1nTdbaPMpTM+Y7VXU6Bwm8xDo2LPpbUuXmzkIjRCb0j51Y3Z
         ivmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqqNIKnDVzToPCpslxSKiHAuvVwBbBth83naP0QEES/3jjFeN9SIS/VOHOf6rJC5Pkh7ElE61kcxBCGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo05QFHjIE2SjdThgYRaufpw7LsZXu4V/oDZkE7cYPcsnIjuaq
	TeshQbKur9c5ZaxUoYck3RvQT1w2+getHigvy4QDd5qQGsBzNvxu1tnaeRiW31Yct7w=
X-Gm-Gg: ASbGnct858CMLrge6+RPcdxfmQf8Q3ABy5UsbGYOr/fPUiZcnUNL1x7FUYsr4NVaAE/
	UpMNDxIr3Ycu2TaCExlA+PYWXkf5GRWKwhgva3dYzxvvUKqiB1W2D7kMRoW6h+0dCFtggtJQgp4
	2Y6FCsj61NvaIyKE39ukfksegzHhRSPAsy607iInUWqUHzKjUhjkJgxUdXKmU+CVkEhKj3Q48dE
	8hBa3hEjsUr9rnVYAR0/19Xm9S3Y25yr8I9gNOXWGP2HRHTgBkz685Yj0qBfUSpDTZhUPTkS6Ad
	EaHF+buoZeyBzOuYwFU0zTfMsOP+jOcNRM4mp03qHJ68p6TknYzf+6Yf6FsTGAG9D+zeFb8VRX1
	xYxpinqtyenV68vm/lhWuYK8SUlE=
X-Google-Smtp-Source: AGHT+IGNetUYleKkkekxf29HMZ0X2KdHF1aj+g1S3YQFzx43O8VQkGEV1jpWL/mxUQXnB44kVfrbIQ==
X-Received: by 2002:a05:620a:6081:b0:7c3:d5a4:3df3 with SMTP id af79cd13be357-7d0a4e396a1mr2453954585a.34.1748964778475;
        Tue, 03 Jun 2025 08:32:58 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a1a70fasm854998785a.95.2025.06.03.08.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:32:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMTdJ-00000001j8y-2UtV;
	Tue, 03 Jun 2025 12:32:57 -0300
Date: Tue, 3 Jun 2025 12:32:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: thierry.reding@gmail.com, vdumpa@nvidia.com, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, jonathanh@nvidia.com,
	baolu.lu@linux.intel.com, jsnitsel@redhat.com, jroedel@suse.de,
	regressions@lists.linux.dev, linux-tegra@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [REGRESSION] EMEM address decode error when using Tegra210 media
 engines
Message-ID: <20250603153257.GB407166@ziepe.ca>
References: <62e7f7fe-6200-4e4f-ad42-d58ad272baa6@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62e7f7fe-6200-4e4f-ad42-d58ad272baa6@tecnico.ulisboa.pt>

On Tue, Jun 03, 2025 at 04:06:47PM +0100, Diogo Ivo wrote:
> Hello,
> 
> Commit 50568f87d1e233e introduced a regression when trying to use the media
> accelerators present on the Tegra X1 SoC.
> 
> I came across this regression when testing the branch [1] that leverages
> the NVJPG engine in the Tegra X1 for decoding a JPEG file. After commit
> 50568f87d1e233e we see the following error messages after submitting a job
> through the TEGRA_CHANNEL_SUBMIT IOCTL:

Maybe this?

@@ -567,7 +567,7 @@ static void tegra_smmu_set_pde(struct tegra_smmu_as *as, unsigned long iova,
 
        /* The flush the page directory entry from caches */
        dma_sync_single_range_for_device(smmu->dev, as->pd_dma, offset,
-                                        sizeof(*pd), DMA_TO_DEVICE);
+                                        sizeof(pd->val[0]), DMA_TO_DEVICE);
 
        /* And flush the iommu */
        smmu_flush_ptc(smmu, as->pd_dma, offset);

It is the only mistake I was able to notice.

But I'd be puzzled - I'd expect bigger sizeof would make it slower not
broken.. Though your crash sure looks like either missing cache
coherency or a bad PTE construction.

Jason
