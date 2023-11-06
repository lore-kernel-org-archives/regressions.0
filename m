Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F9F28E08
	for <regressions@lists.linux.dev>; Mon,  6 Nov 2023 15:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-41e58a33ec9so29642911cf.1
        for <regressions@lists.linux.dev>; Mon, 06 Nov 2023 07:30:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699284647; x=1699889447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrjYpFY8E2oiY2xxYzQ2GUG1YMJAJZ45VGuFmmeRh4c=;
        b=CIfYnKEeZeAF3n2faPnBPFlZtgiJ2ho2LICyjCSWfuoMo3QfqwR01xxvP1uBgj9QL2
         m6gaNrmheHH3A6mpBWRF+n4ba+/pslFGqRDdJ3FkUXvh3Ebg+zhnUzdVVthGv0M08/Wt
         OLePncjRS/ZzuHKf5z2Z2lGAEbKgbCAAcK6q2MVLcaestGZbVzKSaAcDBD20eUtU3UBB
         sQ5G7n5F9Vt9uLp6s6m8LbHU+CxjPSMWYnPpZ9gwxi0yhJG+lyoKII5rKW88JRcSv8AG
         R1fy+ehbcg4A30V308MUMXV+b+fJ/VJ3KWhCDk2xUeOK/5mg13F4R8nTFe8l8AQZCLvA
         8fdQ==
X-Gm-Message-State: AOJu0YyjCFHNccanM0lIEX51i1gwkG5RXQIxriRLwwFZIPqWOOzf5X1/
	yir97xI8uxUn1zS+l1wkwjTh
X-Google-Smtp-Source: AGHT+IEM/+zw76Fcxpj1WquMbJygUaMozC9Wk7yN5zbxmT5CSz4J9onVl5IQCkCNvJJhkdQNmfPFUA==
X-Received: by 2002:ac8:7d50:0:b0:41c:bbf3:b24b with SMTP id h16-20020ac87d50000000b0041cbbf3b24bmr35421169qtb.27.1699284647197;
        Mon, 06 Nov 2023 07:30:47 -0800 (PST)
Received: from localhost (pool-68-160-141-91.bstnma.fios.verizon.net. [68.160.141.91])
        by smtp.gmail.com with ESMTPSA id bb29-20020a05622a1b1d00b00418122186ccsm3481815qtb.12.2023.11.06.07.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 07:30:46 -0800 (PST)
Date: Mon, 6 Nov 2023 10:30:45 -0500
From: Mike Snitzer <snitzer@kernel.org>
To: Keith Busch <kbusch@kernel.org>
Cc: Mikulas Patocka <mpatocka@redhat.com>, Christoph Hellwig <hch@lst.de>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
	Marek Marczykowski-G'orecki <marmarek@invisiblethingslab.com>,
	Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
	Jan Kara <jack@suse.cz>, Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Michal Hocko <mhocko@suse.com>, stable@vger.kernel.org,
	regressions@lists.linux.dev, Alasdair Kergon <agk@redhat.com>,
	dm-devel@lists.linux.dev, linux-mm@kvack.org
Subject: Re: swiotlb-xen: provide the "max_mapping_size" method
Message-ID: <ZUkGpblDX637QV9y@redhat.com>
References: <3cb4133c-b6db-9187-a678-11ed8c9456e@redhat.com>
 <ZUUctamEFtAlSnSV@mail-itl>
 <ZUUlqJoS6_1IznzT@kbusch-mbp.dhcp.thefacebook.com>
 <ZUVYT1Xp4+hFT27W@mail-itl>
 <ZUV3TApYYoh_oiRR@kbusch-mbp.dhcp.thefacebook.com>
 <11a9886d-316c-edcd-d6da-24ad0b9a2b4@redhat.com>
 <ZUZOKitOAqqKiJ4n@kbusch-mbp.dhcp.thefacebook.com>
 <20231106071008.GB17022@lst.de>
 <928b5df7-fada-cf2f-6f6a-257a84547c3@redhat.com>
 <ZUkDUXDF6g4P86F3@kbusch-mbp.dhcp.thefacebook.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUkDUXDF6g4P86F3@kbusch-mbp.dhcp.thefacebook.com>

On Mon, Nov 06 2023 at 10:16P -0500,
Keith Busch <kbusch@kernel.org> wrote:

> On Mon, Nov 06, 2023 at 03:59:40PM +0100, Mikulas Patocka wrote:
> > There's a bug that when using the XEN hypervisor with dm-crypt on NVMe, 
> > the kernel deadlocks [1].
> > 
> > The deadlocks are caused by inability to map a large bio vector -
> > dma_map_sgtable always returns an error, this gets propagated to the block
> > layer as BLK_STS_RESOURCE and the block layer retries the request
> > indefinitely.
> > 
> > XEN uses the swiotlb framework to map discontiguous pages into contiguous
> > runs that are submitted to the PCIe device. The swiotlb framework has a
> > limitation on the length of a mapping - this needs to be announced with
> > the max_mapping_size method to make sure that the hardware drivers do not
> > create larger mappings.
> > 
> > Without max_mapping_size, the NVMe block driver would create large
> > mappings that overrun the maximum mapping size.
> > 
> > [1] https://lore.kernel.org/stable/ZTNH0qtmint%2FzLJZ@mail-itl/
> 
> This should be a "Link:" tag.
> 
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > Reported-by: Marek Marczykowski-G'orecki <marmarek@invisiblethingslab.com>
> > Tested-by: Marek Marczykowski-G'orecki <marmarek@invisiblethingslab.com>
> > Suggested-by: Keith Busch <kbusch@kernel.org>
> 
> I was about to send the same thing. I did a little more than suggest
> this: it's is the very patch I wrote for testing, minus the redundant
> nvme bits! But since you already have a commit message for it...
> 
> Acked-by: Keith Busch <kbusch@kernel.org>

No, this patch should be attributed to you Keith.

Mikulas, I like that you ran with getting a fix prepared but please
update the patch so Keith is the author and use Link: as suggested for
the v2. Note: you'll still use your Signed-off-by since you had a role
in getting this patch together (but please move yours to the end of
the header).

Mike


> 
> > Suggested-by: Christoph Hellwig <hch@lst.de>
> > Cc: stable@vger.kernel.org
> > 
> > ---
> >  drivers/xen/swiotlb-xen.c |    1 +
> >  1 file changed, 1 insertion(+)
> > 
> > Index: linux-stable/drivers/xen/swiotlb-xen.c
> > ===================================================================
> > --- linux-stable.orig/drivers/xen/swiotlb-xen.c	2023-11-03 17:57:18.000000000 +0100
> > +++ linux-stable/drivers/xen/swiotlb-xen.c	2023-11-06 15:30:59.000000000 +0100
> > @@ -405,4 +405,5 @@ const struct dma_map_ops xen_swiotlb_dma
> >  	.get_sgtable = dma_common_get_sgtable,
> >  	.alloc_pages = dma_common_alloc_pages,
> >  	.free_pages = dma_common_free_pages,
> > +	.max_mapping_size = swiotlb_max_mapping_size,
> >  };
> 
