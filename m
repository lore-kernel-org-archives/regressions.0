Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE79220EE
	for <regressions@lists.linux.dev>; Thu, 18 May 2023 23:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684453948; x=1715989948;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IXmHbAMvAuGDv6jp5wg/LI21QGk/kwHV6av1y5qzHhI=;
  b=RUnM27r+fSKOboMR/EwToD6c8mr3WSjiIJ745DjmKbadel0xmDLL+lcQ
   zpySAT/jQjvi8XS3xzM45Qm0UcfHbGJRGTHcwpOr0GAoGogj7Q+5acQC4
   CwHtfjcN9ds5OjSBZpbXJomaRe0eiEwysLBbrzAGzr7ZLrtAXyXY5t2DZ
   6cX/M2+7Mf1M8OlaS/BE7ikSF7/7hc39bomXuL/3e+5bfAD1NNuBgeDPn
   /+YRQxJTwvSKy1mIsDfVZsYw2QTn0gfg4Deb+QTPBIKpPh3V4j8lPLgc1
   qQA9MTP3waXY14/uKnkaCG3goYmTfJ3g8YyvEpFkC4+NudLc/JStE8JpG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="438578303"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="438578303"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 16:52:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="705365734"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="705365734"
Received: from wopr.jf.intel.com ([10.54.75.136])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 16:52:27 -0700
Message-ID: <07caefbe35cab20ed881c9364c3d26204aea1653.camel@linux.intel.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix divide by zero for spi-nor-generic
 flashes
From: Todd Brandt <todd.e.brandt@linux.intel.com>
Reply-To: todd.e.brandt@linux.intel.com
To: Tudor Ambarus <tudor.ambarus@linaro.org>, miquel.raynal@bootlin.com, 
	richard@nod.at, todd.e.brandt@intel.com
Cc: vigneshr@ti.com, pratyush@kernel.org, michael@walle.cc, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 regressions@leemhuis.info, bagasdotme@gmail.com,
 regressions@lists.linux.dev,  joneslee@google.com
Date: Thu, 18 May 2023 16:52:27 -0700
In-Reply-To: <20230518085440.2363676-1-tudor.ambarus@linaro.org>
References: <20230518085440.2363676-1-tudor.ambarus@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

Looks good, tested and confirmed

Tested-by: Todd Brandt <todd.e.brandt@linux.intel.com>

On Thu, 2023-05-18 at 08:54 +0000, Tudor Ambarus wrote:
> We failed to initialize n_banks for spi-nor-generic flashes, which
> caused a devide by zero when computing the bank_size.
> 
> By default we consider that all chips have a single bank. Initialize
> the default number of banks for spi-nor-generic flashes. Even if the
> bug is fixed with this simple initialization, check the n_banks value
> before dividing so that we make sure this kind of bug won't occur
> again
> if some other struct instance is created uninitialized.
> 
> Suggested-by: Todd Brandt <todd.e.brandt@linux.intel.com>
> Reported-by: Todd Brandt <todd.e.brandt@linux.intel.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217448
> Fixes: 9d6c5d64f028 ("mtd: spi-nor: Introduce the concept of bank")
> Link: 
> https://lore.kernel.org/all/20230516225108.29194-1-todd.e.brandt@intel.com/
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/spi-nor/core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0bb0ad14a2fc..5f29fac8669a 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2018,6 +2018,7 @@ static const struct spi_nor_manufacturer
> *manufacturers[] = {
>  
>  static const struct flash_info spi_nor_generic_flash = {
>  	.name = "spi-nor-generic",
> +	.n_banks = 1,
>  	/*
>  	 * JESD216 rev A doesn't specify the page size, therefore we
> need a
>  	 * sane default.
> @@ -2921,7 +2922,8 @@ static void spi_nor_late_init_params(struct
> spi_nor *nor)
>  	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
>  		spi_nor_init_default_locking_ops(nor);
>  
> -	nor->params->bank_size = div64_u64(nor->params->size, nor-
> >info->n_banks);
> +	if (nor->info->n_banks > 1)
> +		params->bank_size = div64_u64(params->size, nor->info-
> >n_banks);
>  }
>  
>  /**
> @@ -2987,6 +2989,7 @@ static void spi_nor_init_default_params(struct
> spi_nor *nor)
>  	/* Set SPI NOR sizes. */
>  	params->writesize = 1;
>  	params->size = (u64)info->sector_size * info->n_sectors;
> +	params->bank_size = params->size;
>  	params->page_size = info->page_size;
>  
>  	if (!(info->flags & SPI_NOR_NO_FR)) {

