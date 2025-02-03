Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908871D5159
	for <regressions@lists.linux.dev>; Mon,  3 Feb 2025 19:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610030; cv=none; b=h3otOGy1UqxJm/nD8iKlq415fuqYcyPnLgCjdHmbVD9NWBn1wJMtV4n889j0eD2gof6LZjC6V4Z8M7bxQVcEhOk4uHSL7fg9YyFSXEnDKaxpqY2h8rI7mkAU4auKfh5wpXcmHs2kUtygk9orIww/ym2usqhBxAuEC400Vhyo/zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610030; c=relaxed/simple;
	bh=8JWcxXoxbQ+/d4OLTmav8rntW6yu0LESXzb02dgf9Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXkr4AqOksNi9A8IXuj6LYIBrtuwYWcB6U1/xjttqBRPINLw5UqFVlhC+YcSTkn6z+RtuTxjaBI+V01U6Wjc3NuQ7eEsjoNi0QAxvS/5JWoalq2nP7Umjql7zLC/OF8hme8q/6veTm0OJee+fApuOFziwu/a8NcGeBjHas5+AJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=VyR1eTo3; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="VyR1eTo3"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e41e18137bso6556316d6.1
        for <regressions@lists.linux.dev>; Mon, 03 Feb 2025 11:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738610027; x=1739214827; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8JWcxXoxbQ+/d4OLTmav8rntW6yu0LESXzb02dgf9Es=;
        b=VyR1eTo3ovPFfZCXbLCX35nrQcEqMZ7UQODYX4cQY9Sxa26L65uGidqvCaZA4j75mm
         6K68HWFOF7hg2cXhZT4Q+63ok1AOpbyvccXO/Y3q/OakPw1luwCc4/h2RtvbvFKLKanT
         BEBvBScu+oNzb6/bl2Xt3CDJ1P1RUzgaT2CMgIUMzEiY1MNN38DJFwhZWm008gMnEeDN
         kP4NXps8Xc0gPOAhcFw+guJdjhoHpqnUkianCAWc2pl169mg+lHNZ2MjOlLXY9EwQxYC
         ACt6uUg30+VA1HcRlJ6qs6/hiSIH0NfAWnj5nSYdgaf2Kp0R5Ploulu+l8CIlp//+MO1
         pZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738610027; x=1739214827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JWcxXoxbQ+/d4OLTmav8rntW6yu0LESXzb02dgf9Es=;
        b=SqVyrfrf+IfZ5kC/fCF5Zq5ZSpr+268lcFURVKUrBGE+HVwZz/4RGy6itvK/L/Mcwl
         F/fzDas1Nzcl2Q4jIi7qiPvhTjQfs+GoIkrYNjb0yMl5FGS0LgsK1RSKktOBKqiEznpX
         nYyt0sQSduuMQ9KuASec4vVGdM3WnX+QKZ+QSTWtxtWJj64Pjxl9DMhEDshqC14xWymw
         rfQAEvvoARPNQZ1bfJyQ3OCb8wbX6iDmoWdTvwesXDJPcuq4T0PqWvoxnJ2lDtgpplWE
         bcaV7082rfs4ZlL/2FzoeiHIM5LUdQELIm0Lq14uE1SccrDKrMKHvlGq9NH7XzZAcPCA
         pdhw==
X-Forwarded-Encrypted: i=1; AJvYcCUa/MkLZHkdW6EjBS406kSrZXZoeTC4ZtwcWZx8Rfv1BWnpQ633JC4hp/B7R/i0rbDpGH94jHGrprtu5A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4qA+fBc7apmcHnnEMoSgU5o3W3/hIOX1nXnkLGd49KWQEEe5k
	f+j18NcXXggdDinhRKpTi046A8UFoQbaMoWdi8GPwdz7zv7l5SK1ZAXL2LXIWuw=
X-Gm-Gg: ASbGncvhIHbpZUmDX5FNn0EBp98S9zpGbT/Icmk8S57KO0eTEqduqhkh4aZwsIbwTg4
	le0L3c22WgLWGJigicn8Nyi5NsCvrl52bzuwliCg83pURd9zwP04tCPridizYg7b0l84/GCLaJR
	emgF0lBRiFCoji8u1MqjUhmDrbl5p1DTtBfaA8RKptRKcSIgQLzlxy9Rj2qMZk0pZfo09YdrLFe
	X2C8Qcq0RuES5w8XEIKo3e7IDywQXwwscEgomh/ZsLfGmEtYoNHrNxC176UX7F3en/p4myRdxyT
	RkjmBjnc2XXBRQ86F/nPhETrzDtznNgCJyLPf/uzy0CrB2zGL4LOiiDGIpLTZzse
X-Google-Smtp-Source: AGHT+IH9lm7yxORMtUKnhgtCo398qO3xBrZWzG2Ji8hCZqnDx3AD/ekoAplJegHaKOf+kPYlEc3QqA==
X-Received: by 2002:a05:6214:1316:b0:6d8:7ccf:b692 with SMTP id 6a1803df08f44-6e243c19ebemr308346136d6.11.1738610027388;
        Mon, 03 Feb 2025 11:13:47 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2549225e8sm53233546d6.88.2025.02.03.11.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 11:13:46 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tf1tC-0000000BLdk-1MYP;
	Mon, 03 Feb 2025 15:13:46 -0400
Date: Mon, 3 Feb 2025 15:13:46 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
	vdumpa@nvidia.com, joro@8bytes.org, will@kernel.org,
	jonathanh@nvidia.com, baolu.lu@linux.intel.com, jsnitsel@redhat.com,
	jroedel@suse.de, regressions@lists.linux.dev,
	linux-tegra@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [REGRESSION] Invalid gather when using Tegra210 media engines
Message-ID: <20250203191346.GG2296753@ziepe.ca>
References: <c6a6f114-3acd-4d56-a13b-b88978e927dc@tecnico.ulisboa.pt>
 <20250203170617.GE2296753@ziepe.ca>
 <4ea1a48c-9020-4793-ac9b-b51fc289e442@tecnico.ulisboa.pt>
 <20250203174331.GF2296753@ziepe.ca>
 <a0f776ba-bfd2-41fd-8370-14818b86bfbe@arm.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0f776ba-bfd2-41fd-8370-14818b86bfbe@arm.com>

On Mon, Feb 03, 2025 at 06:49:07PM +0000, Robin Murphy wrote:
> I'd hope the historical reasons for not supporting IOMMU_DOMAIN_DMA in
> tegra-smmu no longer apply, given that all the default domain stuff has now
> been integrated into host1x for the newer arm-smmu based Tegras.

Indeed I do see appropriate looking calls to the normal DMA API, and
the other mapping path is conditionalized by !host->domain.

So, why didn't it work for Diogo? Even in identity mode the DMA API
will return correct DMA addresses and the !host->domain path will skip
mapping them.

Poking around I wonder if there is some assumption that if other parts
of the stack, maybe the DRM driver, are using the special domain than
everyone is? It seems to blindly pass around IOVA without really
checking who is consuming it.

Christian was telling me DMABUF had some drivers that made the
(incorrect!) assumption they were all sharing translation.

It does seem like a nice project for someone who has the hardware to
rip out all of this custom domain stuff and just have the iommu layer
setup a shared dma-iommu domain.

Jason
