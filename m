Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332E22BE05E
	for <regressions@lists.linux.dev>; Mon,  2 Feb 2026 10:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027750; cv=none; b=GFYNXsmm+IwIygqpCFK9aE1xqm6i6WnLaPZnZ8VR8o4koriRsENojVTdz6NHbrPDwP/VsdeQH+g1Euc7b1Xq0dl0gS/NCHGEAFhxYQ3d7YvxHOljxM0ykCTAEJI6e5sQVGfYrYt3V0r4D/RiTX3YridjNOcQhRelAGF5e+PRYPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027750; c=relaxed/simple;
	bh=epr231sJVwHfFe18+CImf/yIbQQMtbyXiJ9hAO60XhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mba1rWeqXIjWc3H4UHoLUMwZwQN0V8KU8Tw4JNerdDXose+uoUBP7qZz5L+lkmpY7n7UffeMMqCX1K5VgT3Ck3vpBZuGf6ViZyxrRAoOVd/oI6rwzT6KVZii7mSbz0rhlO5/lka0LwtlH9dIvq6kNewK5bkKBOGt/zj+GdaR4BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+OU2PAO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+OU2PAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770027748; x=1801563748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=epr231sJVwHfFe18+CImf/yIbQQMtbyXiJ9hAO60XhA=;
  b=V+OU2PAOmBwOLLs0LJJgsgPEb6HD/kz5b9Yx+JkMf6U2mjJZCSdK0Iws
   +s6bxOB/Kj37gsRrLgnQgqz+ldFNlbMJZY/NGIs46nLt8kGINlClGhbL3
   X/lDJIbabwBqCrSc0JuVS92CDPF+VD/2b0Q/4rY/0u+VGM9hzqBubvlyS
   NebaEPQYhUMlQrT+gDHnWRqlWm2rtv1oH0/1KCYXAiW2UWJITRzjyC9x3
   Irab1NdNnGY0e9sxQALkYIf9R3CXSGnHdnOk0hXLLvPmOVqi5nRDKex41
   naXFYfCaHZw7/hnn2AJaRDjcMZj3lQStWv8AOtjJsWpUQRgmVPQwpMOnR
   Q==;
X-CSE-ConnectionGUID: LtkqXaYLQNaoAnN4T5Whrw==
X-CSE-MsgGUID: WkdrZ4+UQQ+1oS4jaHPtUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="70900967"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="70900967"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 02:22:27 -0800
X-CSE-ConnectionGUID: jdrOrs63QbO6Ea4M4VGBVw==
X-CSE-MsgGUID: 9Un4wCC7TMev/wG1/dczkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="213951994"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 02 Feb 2026 02:22:26 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3E68B95; Mon, 02 Feb 2026 11:22:25 +0100 (CET)
Date: Mon, 2 Feb 2026 11:22:25 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: correctmost <cmlists@sent.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	dmaengine@vger.kernel.org, regressions@lists.linux.dev,
	vkoul@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [REGRESSION][BISECTED] Lenovo IdeaPad touchpad does not work
 when idma64 is present in initramfs
Message-ID: <20260202102225.GB2275908@black.igk.intel.com>
References: <20260128123135.GM2275908@black.igk.intel.com>
 <e94cc7af-4696-4ea6-8231-26f693272004@app.fastmail.com>
 <20260129065837.GT2275908@black.igk.intel.com>
 <513c490f-c433-4298-ae66-6e165aa7b299@app.fastmail.com>
 <20260129115609.GV2275908@black.igk.intel.com>
 <7d966d39-aa5a-4a0f-a115-a4b90632a26c@app.fastmail.com>
 <20260130072620.GW2275908@black.igk.intel.com>
 <53bd143f-525d-4748-af93-3460c9f59d1a@app.fastmail.com>
 <20260202075118.GY2275908@black.igk.intel.com>
 <00ee321d-1f36-4f1e-91f7-fdee4212c5cc@app.fastmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <00ee321d-1f36-4f1e-91f7-fdee4212c5cc@app.fastmail.com>

On Mon, Feb 02, 2026 at 03:38:21AM -0500, correctmost wrote:
> >
> > static irqreturn_t idma64_irq(int irq, void *dev)
> > {
> > 	struct idma64 *idma64 = dev;
> > 	u32 status = dma_readl(idma64, STATUS_INT);
> > 	u32 status_xfer;
> > 	u32 status_err;
> > 	unsigned short i;
> >
> > #if 0
> > 	/* Since IRQ may be shared, check if DMA controller is powered on */
> > 	if (status == GENMASK(31, 0))
> > 		return IRQ_NONE;
> > #endif
> >
> > 	dev_vdbg(idma64->dma.dev, "%s: status=%#x\n", __func__, status);
> >
> >
> > I would like to see what's the difference in "working" wrt. I2C-HD messages
> > above. If you can provide full dmesg again? Thanks!
> 
> In the previous test, I had commented out pm_runtime_* calls in intel-lpss-pci.c.  I restored those lines and then applied the if 0 patch above (full log attached).

Thanks!

The I2C DW behaviour differs between the cases. When it fails it holds the
SCL line but then the timeout triggers.

Could you drop the above hack again so that it should "fail". Then build
the kernel with CONFIG_PREEMPT_VOLUNTARY=y and add the below hack. Perhaps
this is just lucky timing? Please try a couple of boots and make sure the
results are the same each time.

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 45bfca05bb30..1e2150390809 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -1053,6 +1053,7 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 		scnprintf(adap->name, sizeof(adap->name),
 			  "Synopsys DesignWare I2C adapter");
 	adap->retries = 3;
+	adap->timeout = msecs_to_jiffies(5000);
 	adap->algo = &i2c_dw_algo;
 	adap->quirks = &i2c_dw_quirks;
 	adap->dev.parent = dev->dev;
