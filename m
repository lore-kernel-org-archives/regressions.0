Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF20241682
	for <regressions@lists.linux.dev>; Wed, 21 May 2025 10:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824324; cv=none; b=cHmuyjCFlHvTW6ia07tTBfoKoYVnVfWpUl+ckReXd3ID4X/0NPM04t4TCKkyj1Q14SP24BDpr1tK7KEYdcgZ1Pf4x9dHErUC0Gu9bEJ3xRD824VBTR4znGqedaesejof8RFU1CPgbTuKC6/ewBWzQDuqVE23IkmfAW4+2MpQIbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824324; c=relaxed/simple;
	bh=bGejNSfCVWgSr1ZfFclNYtj9IL87+zotGg7h8IGudQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPJtpOKXZISlTARJ2zVPt8rAgRydgC5yF8BQ7QY4T2oX9V6Zxcq3sqEHhD7PUI6Q3YlhP5m1z3fxPjDLgQCpcR+jk6KyRFnYsPwRdlPyYjQcr2CQroqpYniXFOVQrbDbjW6PWDmJJBqLrvRhZjCOzx72OPCKz34GbdpcU6lLa8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0LBXqcf; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0LBXqcf"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a367ec7840so2728519f8f.2
        for <regressions@lists.linux.dev>; Wed, 21 May 2025 03:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747824321; x=1748429121; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/W9iTls2ZAgc4qnXli7lmiG97t6EfuhQ77mSw3T6AOc=;
        b=d0LBXqcfZ01nee9/x33Wi0PBzzd15z/QT5I2fkYwffT3PtMZAu24rg6EdWi8Hysgxt
         RLDI/ALCXw7oEOlBEAqvCkuC5eR8d84nC8klHExB/egs+kCEC2CTEU5iWMNX+UjykvVE
         mxf5Mx1HWxne9ft2sO6v2/xMZ+U4YbARAFPMlHeNzgRat4QXI1dsGsXUOEanPgdMouw6
         fFvM7lQpbnMnl4LK39/CZypytYp4xLWyBGluIlacle+cnU9GTF0JUwdUgvTdNkbVJtZI
         Bg+V0SkZxTI8UcJmpqATuzh+QpPZYJnO4KVMdh1r1bQug/rS/ZjG9wnWxUofJDXSWBep
         dWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747824321; x=1748429121;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/W9iTls2ZAgc4qnXli7lmiG97t6EfuhQ77mSw3T6AOc=;
        b=bBSqcl3UQdwN49b9S1hrppM4AQ1Rmla6FiVvxsUnGpH7e2oSKknGoc88XugNV3/aSL
         gj88t+ibO57IyW00Y6TazYJ2QHgDPYyixP8SaZS3jMERu5l0MpT936g98PepFlBy3gHb
         0H7MZ2gQMNFk+J2YIXtslMyzjGvvhfidhcUyks7Cjnt/64QDVi2J4PoaxvZw5BukLOlI
         yoSzewp25P/OwGx+TQ1tq/Qa7oxW2S8Z8VEyWfkxuBYszMtym+iDmtTs0LiSBlqkCzgz
         LhA0/ZVM30YNNhqedAVfCY+dfG3/vsiqKQYtMEAbRIhCf8xzp2c2SCTdQG2MXT4Bgb+8
         GPbA==
X-Forwarded-Encrypted: i=1; AJvYcCXw4x1pcvTpYRtugAnLtkuhPGf1LV/PqIaKum9fT7OrKPXiwY3dTqoZmSRh1C3DN5pubqabIpoLdAgJEA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIqpukJciiPK5qaW/u4wXOEuBYbRXZ5wqg2FAecoGsbZMzZnBy
	tjYPU9K91jm4GImgX/+EjtuVcvqphJamSHDpPMMgczxdhB7Ty2LRzy1q
X-Gm-Gg: ASbGncv8njb93+Jv880v6xQkcAoIWHQb3wgyDDZFqkJCbdY3tKzkssm7+v+r7v5FIPJ
	1QLTLf4qC7lIIxxQvwKNl1mAbK/hE3oG9YLtX6e1646qiTQNYzMV6fv0D0t7cmP7ouJFnKEOZuf
	YeCEvsJmeGb+QC/UYiyWN5kaiXOx2tbrlxfpiHUFdN/i+5IQlCiutJQe7cxXvZ59mMnV+4fj651
	ZMH38BLpfYhuIqXzpKHfeUOJ5YBpN4hdORyS5mAoOqTpOVkqgM9JD2nrHk/tBNv9UF4Hm1kWhjA
	l+cM0V+qvJ5xzMugW2NiYWJxSdbjdtsrXnfEAaXBJ/uiE4zzT7o8
X-Google-Smtp-Source: AGHT+IHNm8eCWXpqWiOB470uYCBV2jSEzGedXfvesvpPaSdlSL1MRW2fMlz2O97E+XfF+63q2pKtrg==
X-Received: by 2002:a05:6000:2507:b0:3a3:7031:59da with SMTP id ffacd0b85a97d-3a370315bcamr9483123f8f.59.1747824320694;
        Wed, 21 May 2025 03:45:20 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca88a13sm19100674f8f.74.2025.05.21.03.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 03:45:19 -0700 (PDT)
Date: Wed, 21 May 2025 12:45:18 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Klaus Kudielka <klaus.kudielka@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	EBALARD Arnaud <Arnaud.Ebalard@ssi.gouv.fr>,
	Romain Perier <romain.perier@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] crypto: marvell/cesa - Avoid empty transfer descriptor
Message-ID: <aC2uvvzlR89iVFGW@Red>
References: <20dde00750d803a9a364ded99dab1e3e22daec77.camel@gmail.com>
 <20250515182131.GC1411@quark>
 <f0dc235e3d7bfa1f60cc01fd527da52024af54e0.camel@gmail.com>
 <aCZ3_ZMAFu6gzlyt@gondor.apana.org.au>
 <aCcyXkeBvHQYvf2d@Red>
 <aCczV6MF6xk5rRA3@gondor.apana.org.au>
 <aChx_ODF_hYKL8XO@Red>
 <aCmTQoJw6XG1CkuZ@gondor.apana.org.au>
 <aC1fY6IP-8MzVIbx@gondor.apana.org.au>
 <aC2aAvX07Aaho08d@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aC2aAvX07Aaho08d@gondor.apana.org.au>

Le Wed, May 21, 2025 at 05:16:50PM +0800, Herbert Xu a écrit :
> On Wed, May 21, 2025 at 01:06:43PM +0800, Herbert Xu wrote:
> >
> > Can you please try this patch to see if it makes a difference?
> 
> Actually, please try this one instead.
> 
> Thanks,
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
> --
> diff --git a/drivers/crypto/marvell/cesa/hash.c b/drivers/crypto/marvell/cesa/hash.c
> index 6815eddc9068..8a9ea83372c9 100644
> --- a/drivers/crypto/marvell/cesa/hash.c
> +++ b/drivers/crypto/marvell/cesa/hash.c
> @@ -15,6 +15,7 @@
>  #include <crypto/sha2.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/dma-map-ops.h>
>  
>  #include "cesa.h"
>  
> @@ -532,6 +533,7 @@ mv_cesa_ahash_dma_add_cache(struct mv_cesa_tdma_chain *chain,
>  		return ret;
>  
>  	memcpy(ahashdreq->cache, creq->cache, creq->cache_ptr);
> +	arch_sync_dma_for_device(ahashdreq->cache_dma, creq->cache_ptr, DMA_TO_DEVICE);
>  
>  	return mv_cesa_dma_add_data_transfer(chain,
>  					     CESA_SA_DATA_SRAM_OFFSET,

It fails to build with:
ERROR: modpost: "arch_sync_dma_for_device" [drivers/crypto/marvell/cesa/marvell-cesa.ko] undefined!
