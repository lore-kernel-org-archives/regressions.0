Received: from muru.com (muru.com [72.249.23.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D0929A2
	for <regressions@lists.linux.dev>; Wed, 30 Mar 2022 17:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 7C50780FA;
	Wed, 30 Mar 2022 17:17:31 +0000 (UTC)
Date: Wed, 30 Mar 2022 20:19:37 +0300
From: Tony Lindgren <tony@atomide.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
	Christoph Hellwig <hch@infradead.org>,
	Ben Skeggs <bskeggs@redhat.com>, Kevin Tian <kevin.tian@intel.com>,
	Ashok Raj <ashok.raj@intel.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Auger <eric.auger@redhat.com>, Liu Yi L <yi.l.liu@intel.com>,
	Jacob jun Pan <jacob.jun.pan@intel.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH v4 8/9] iommu: Remove unused argument in
 is_attach_deferred
Message-ID: <YkSRKZcJO0q3v5WL@atomide.com>
References: <20220216025249.3459465-1-baolu.lu@linux.intel.com>
 <20220216025249.3459465-9-baolu.lu@linux.intel.com>
 <YkRiawC2T9g+CHSJ@atomide.com>
 <20220330142340.GA2111031@nvidia.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330142340.GA2111031@nvidia.com>

* Jason Gunthorpe <jgg@nvidia.com> [220330 14:21]:
> On Wed, Mar 30, 2022 at 05:00:39PM +0300, Tony Lindgren wrote:
> > Hi,
> > 
> > * Lu Baolu <baolu.lu@linux.intel.com> [700101 02:00]:
> > > The is_attach_deferred iommu_ops callback is a device op. The domain
> > > argument is unnecessary and never used. Remove it to make code clean.
> > 
> > Looks like this causes a regression for at least drivers/iommu/omap-iommu.c.
> > 
> > To me it seems the issue is there is no is_attach_deferred implemented, so
> > we get a NULL pointer dereference at virtual address 00000008:
> > 
> > __iommu_probe_device from probe_iommu_group+0x2c/0x38
> > probe_iommu_group from bus_for_each_dev+0x74/0xbc
> > bus_for_each_dev from bus_iommu_probe+0x34/0x2e8
> > bus_iommu_probe from bus_set_iommu+0x80/0xc8
> > bus_set_iommu from omap_iommu_init+0x88/0xcc
> > omap_iommu_init from do_one_initcall+0x44/0x24c
> > 
> > Any ideas for a fix?
> > 
> > It would be good to fix this quickly so we don't end up with a broken
> > v5.18-rc1..
> > 
> > For reference, this is mainline commit 41bb23e70b50 ("iommu: Remove unused
> > argument in is_attach_deferred").
> 
> Are you confident in the bisection? I don't see how that commit could
> NULL deref..

Oops sorry you're right, the breaking commit is a different patch, it's
3f6634d997db ("iommu: Use right way to retrieve iommu_ops") instead. I must
have picked the wrong commit while testing.

> Can you find the code that is the NULL deref?

I can debug a bit more tomorrow.

Regards,

Tony
