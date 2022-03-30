Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2B029A2
	for <regressions@lists.linux.dev>; Wed, 30 Mar 2022 17:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SSKi39PDpsQvMNgCfkcWVHQSLGZLiPgFI8QRLkyxSyY=; b=SJnzdWhnhu1gvA7Efu9RcTl+A2
	z7PdgE1deeP5jyFNyL/D5kZe6Cm6S+bTlzBOgWYNmh/S2eSgdrZowCNHvTS9p6PyD486pRo1xa0y9
	TXmrU2cUfn9krlLbrfjVnMMBkdlv6rdZfEdZ1gOkgofp9tjPqbxPE3rUtm64kyqX6C9RKagXWhZjI
	sWkf0PuxUUppvonwUVDTrkSC/i/wksPR5LQkqbCx5YQjq/dSkc7/zrk3Hgr5G1l/2zi9L0ohR4FqP
	4lEHJLXc9bKF3apW3rCT+Z5PA9dwunQsc9IvwtvKkQ7yUXMaQzbkPt9qfzkKIKFo4/FS98bx8iJbL
	wV2ozBuw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZcXX-00H3Sa-Pd; Wed, 30 Mar 2022 17:55:27 +0000
Date: Wed, 30 Mar 2022 10:55:27 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc: Christoph Hellwig <hch@infradead.org>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: Re: "dma-mapping: remove CONFIG_DMA_REMAP" causes AMD SME boot fail
Message-ID: <YkSZjwDfD+EFuenm@infradead.org>
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

On Wed, Mar 30, 2022 at 01:51:07PM -0400, Alex Xu (Hello71) wrote:
> Hi,
> 
> After a recent kernel update, booting one of my machines causes it to 
> hang on a black screen. Pressing Lock keys on the USB keyboard does not 
> turn on the indicators, and the machine does not appear on the Ethernet 
> network. I don't have a serial port on this machine. I didn't try 
> netconsole, but I suspect it won't work.
> 
> Setting mem_encrypt=0 seems to resolve the issue. Reverting f5ff79fddf0e 
> ("dma-mapping: remove CONFIG_DMA_REMAP") also appears to resolve the 
> issue.
> 
> The machine in question has an AMD Ryzen 5 1600 and ASRock B450 Pro4.

This looks like something in the AMD IOMMU code or it's users can't
deal with vmalloc addresses.  I'll start looking for a culprit ASAP.
