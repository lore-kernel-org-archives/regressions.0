Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62F87C
	for <regressions@lists.linux.dev>; Thu, 31 Mar 2022 04:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TyI6lSLb2VMNQkD37oAbbw8GrUUXDy6JGKq3S68+GAs=; b=N2RXeHOlVWMotZnWmDzYjFmRvE
	1rwxS4cCRHz+rrLZW3bq1Klzv9tSR/P+pFfwJduGkx/RHOrXbiCGigZQezP+2RVGDrWeUW6b4ldS7
	Et5MhqtaU7oAaftlUdnP24FfW5v95xyYRqsGlVWKkHMEECZwvSZ3Xeu+n9h9yLangvp/XsKl9mWvO
	/5GM1jSiGKNMTxt2HGVyV0jgNaRgnd9B0SkYHVtMI7oHPcViliW7Dt7dpLkQub0DtM1tpkHMAr5E6
	3QoetEDLgY2g5033b79N10yje6RFYtjVWzlHVxBAlO11pMWi5ASbag1mt5Ugh5T1eB3zc0mC0GmAT
	y8Pda/ZA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZm71-000atJ-TS; Thu, 31 Mar 2022 04:08:43 +0000
Date: Wed, 30 Mar 2022 21:08:43 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc: Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: "dma-mapping: remove CONFIG_DMA_REMAP" causes AMD SME boot fail
Message-ID: <YkUpSy4snmZ7E5xX@infradead.org>
References: <1648659326.eabkokyuym.none.ref@localhost>
 <1648659326.eabkokyuym.none@localhost>
 <YkSa9d3JOExAiBXU@infradead.org>
 <1648667469.u35o6clg82.none@localhost>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1648667469.u35o6clg82.none@localhost>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Mar 30, 2022 at 03:17:20PM -0400, Alex Xu (Hello71) wrote:
> Excerpts from Christoph Hellwig's message of March 30, 2022 2:01 pm:
> > Can you try this patch, which is a bit of a hack?
> > 
> > diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
> > index 50d209939c66c..61997c2ee0a17 100644
> > --- a/arch/x86/mm/mem_encrypt.c
> > +++ b/arch/x86/mm/mem_encrypt.c
> > @@ -28,7 +28,8 @@ bool force_dma_unencrypted(struct device *dev)
> >  	 * device does not support DMA to addresses that include the
> >  	 * encryption mask.
> >  	 */
> > -	if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT)) {
> > +	if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT) &&
> > +	    !get_dma_ops(dev)) {
> >  		u64 dma_enc_mask = DMA_BIT_MASK(__ffs64(sme_me_mask));
> >  		u64 dma_dev_mask = min_not_zero(dev->coherent_dma_mask,
> >  						dev->bus_dma_limit);
> > 
> 
> This seems to work for me.

Ok, I'll try to come up with a less hacky version and will start a
discussion with the AMD folks that know memory encryption better.
Thanks for the report and testing already!
