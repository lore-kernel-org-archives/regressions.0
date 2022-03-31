Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99597B
	for <regressions@lists.linux.dev>; Thu, 31 Mar 2022 06:39:33 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id h23-20020a17090a051700b001c9c1dd3acbso2669777pjh.3
        for <regressions@lists.linux.dev>; Wed, 30 Mar 2022 23:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ssMn3LgcqyUmnx75/iLOLIWP4zeXASia6Tnjq8mIfrE=;
        b=NpXDVqGKFymC1XLJQ7htr7fWp09/zeOVf2qamz4txb2GoFA8suoKmqOmvqGS0c4ddL
         n5y2p0W9VGETLvZ1DeAKeXRUtpKzWheOE9gR/+iqV7bWME+zwexmsyaPEeJJVU6Y7sOx
         42X9aPuUnFn1cyzVJQu1YcO87Ksg5lhmpP+ldNO6tZPdW9SXMGQhhLCctUT/HC79/YnW
         Y9AthoXOozNyu0OfDH6rOH1m4P4uMszaaORnqwm9k73BvhjI9CxTpfisiWbgw8hGF59u
         qZuwu3dLUQ4Z0zr4RYZBvPQznZ26FxuUs6soLQucuj0chwCUYDAVC7+njK8vrbizVXMw
         L8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ssMn3LgcqyUmnx75/iLOLIWP4zeXASia6Tnjq8mIfrE=;
        b=ccTyzt3WM9n2RYdbfnodpllXVSQIY2M1MI+h8fbGYpHK9EcKoZ46aAn8+f5hYuhUA8
         NFMdS30bDYNpRLOv52nBX2F4zRjr+QlIigdmy/gl5Ew+/qi6jMo9bbt9lpo1rgKdT/Az
         ieitdKtQyK1S72+jQ/Cf0Q3K9qAS1N6ql0kd3qKUtleArARf/Q05f7i8isQVTCxL2/my
         X8aHBs3DJnBOxf9XlPydWJvOuY4V8vf/1LPLf74zNZLKg/YNgJU6Tylup2Hp29/7M5bj
         x5+kM4RlmLUEmYvg7EniFl3GlQf9z0jxrsyFqate7/ppdXnhc/+XrfnUqfeQ/V6YfPfY
         gq6Q==
X-Gm-Message-State: AOAM5339Zs3lB3bGxpJyBRZNtUUZkYAJbHe6yN78BSWspgOHBTC/UjBu
	SNl1xvs+/yXkAiQTdRzVqlJdxA==
X-Google-Smtp-Source: ABdhPJxg8Jd/wIlfmFWYs83KmW+WvyXG2lBhmNylpzP+JkKECZPF1xUHOZgVBSQLSA9OugBSKYFxhw==
X-Received: by 2002:a17:90b:250f:b0:1b8:f257:c39 with SMTP id ns15-20020a17090b250f00b001b8f2570c39mr4384147pjb.135.1648708772867;
        Wed, 30 Mar 2022 23:39:32 -0700 (PDT)
Received: from x1 ([2601:1c2:1001:7090:feed:61b1:ff4a:b7d5])
        by smtp.gmail.com with ESMTPSA id u62-20020a638541000000b00382791c89efsm21306861pgd.13.2022.03.30.23.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 23:39:32 -0700 (PDT)
Date: Wed, 30 Mar 2022 23:40:19 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Tony Lindgren <tony@atomide.com>, Lu Baolu <baolu.lu@linux.intel.com>,
	Joerg Roedel <joro@8bytes.org>,
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
Message-ID: <YkVM05q2/fBbq51E@x1>
References: <20220216025249.3459465-1-baolu.lu@linux.intel.com>
 <20220216025249.3459465-9-baolu.lu@linux.intel.com>
 <YkRiawC2T9g+CHSJ@atomide.com>
 <20220330142340.GA2111031@nvidia.com>
 <YkSRKZcJO0q3v5WL@atomide.com>
 <20220330173323.GA2120790@nvidia.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330173323.GA2120790@nvidia.com>

On Wed, Mar 30, 2022 at 02:33:23PM -0300, Jason Gunthorpe wrote:
> On Wed, Mar 30, 2022 at 08:19:37PM +0300, Tony Lindgren wrote:
> 
> > > > __iommu_probe_device from probe_iommu_group+0x2c/0x38
> > > > probe_iommu_group from bus_for_each_dev+0x74/0xbc
> > > > bus_for_each_dev from bus_iommu_probe+0x34/0x2e8
> > > > bus_iommu_probe from bus_set_iommu+0x80/0xc8
> > > > bus_set_iommu from omap_iommu_init+0x88/0xcc
> > > > omap_iommu_init from do_one_initcall+0x44/0x24c
> > > > 
> > > > Any ideas for a fix?
> > > > 
> > > > It would be good to fix this quickly so we don't end up with a broken
> > > > v5.18-rc1..
> > > > 
> > > > For reference, this is mainline commit 41bb23e70b50 ("iommu: Remove unused
> > > > argument in is_attach_deferred").
> > > 
> > > Are you confident in the bisection? I don't see how that commit could
> > > NULL deref..
> > 
> > Oops sorry you're right, the breaking commit is a different patch, it's
> > 3f6634d997db ("iommu: Use right way to retrieve iommu_ops") instead. I must
> > have picked the wrong commit while testing.
> 
> That makes alot more sense
>  
> > > Can you find the code that is the NULL deref?
> > 
> > I can debug a bit more tomorrow.
> 
> Looks like omap's omap_iommu_probe_device() is buggy, it returns 0 on
> error paths:
> 
> 	num_iommus = of_property_count_elems_of_size(dev->of_node, "iommus",
> 						     sizeof(phandle));
> 	if (num_iommus < 0)
> 		return 0;
> 
> This function needs to return an errno -ENODEV
> 
> Otherwise it causes a NULL dev->iommu->iommu_dev and dev_iommu_ops() will
> crash.
> 
> Jason

I tried to boot current mainline (787af64d05cd) on am57xx-evm and it
failed to boot. I made the change you suggested and it boots okay now:
https://gist.github.com/pdp7/918eefe03b5c5db3b5d28d819f6a27f6

thanks,
drew

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 4aab631ef517..d9cf2820c02e 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1661,7 +1661,7 @@ static struct iommu_device *omap_iommu_probe_device(struct device *dev)
        num_iommus = of_property_count_elems_of_size(dev->of_node, "iommus",
                                                     sizeof(phandle));
        if (num_iommus < 0)
-               return 0;
+               return ERR_PTR(-ENODEV);

        arch_data = kcalloc(num_iommus + 1, sizeof(*arch_data), GFP_KERNEL);
        if (!arch_data)

