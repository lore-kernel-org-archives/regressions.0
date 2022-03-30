Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BA229A2
	for <regressions@lists.linux.dev>; Wed, 30 Mar 2022 18:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8sQ6SQCM7+eekKWwRavWR33/gb8wY09eRtrYpsnuNfQ=; b=yUXTtYD7LDJ8eYXzNSyyQftYQp
	S3O3C63uKLospuC5Mh4AL7JUStHkfwaRMljYo1yNjIR4OiIFD0WCK6jyi4GeT6zDxpQJ1+vdcHAMr
	Q9GQ8fNuoqDTs+qyoLgpt5fZSxYSIBkGtonuYlUG6ikqvFlpI2GChXbsKYHjI4IF/xYbqm+ndyIMd
	ZT3PM5Bm0h4mo51aGi0q6qMUxCjahNmfVAewOXBnIkSgPBXAUY3oAv4hW8yl+qZwlGs/YmUtbLjqG
	wX+ok7SDr/YclbDU4s+KHcUp+FpF2CmEH5tEZs9x1mHwaVvFaNUhDxmbduA7BR2uyfpRiyCw7IYfk
	eQNcXaFA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZcdJ-00H3zL-To; Wed, 30 Mar 2022 18:01:25 +0000
Date: Wed, 30 Mar 2022 11:01:25 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc: Christoph Hellwig <hch@infradead.org>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: Re: "dma-mapping: remove CONFIG_DMA_REMAP" causes AMD SME boot fail
Message-ID: <YkSa9d3JOExAiBXU@infradead.org>
References: <1648659326.eabkokyuym.none.ref@localhost>
 <1648659326.eabkokyuym.none@localhost>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1648659326.eabkokyuym.none@localhost>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Can you try this patch, which is a bit of a hack?

diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index 50d209939c66c..61997c2ee0a17 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -28,7 +28,8 @@ bool force_dma_unencrypted(struct device *dev)
 	 * device does not support DMA to addresses that include the
 	 * encryption mask.
 	 */
-	if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT)) {
+	if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT) &&
+	    !get_dma_ops(dev)) {
 		u64 dma_enc_mask = DMA_BIT_MASK(__ffs64(sme_me_mask));
 		u64 dma_dev_mask = min_not_zero(dev->coherent_dma_mask,
 						dev->bus_dma_limit);
