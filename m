Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923AF809
	for <regressions@lists.linux.dev>; Mon, 24 Oct 2022 11:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666609972; x=1698145972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IDfM8jGZjDfRkbfYuPxY5RjqRTTZCt2OQ32W3baC7Dc=;
  b=SAPcchljxdtxV8HtXCloVQYgfCsxlmpsiWynAtgmD1HSE+89INn23kFv
   IolPQrTgW/yfXeqUXp89MfijV4aPI31TiWUJO0b2VEOKpoPS0Hi6wXAiV
   mvqP9RYs40mVyVZQUMaDaosKrelRP8RnAQ5fvJzA0n9HhJHXq6CbRmqG/
   FVu6rD/XtURv4k1IhUfmcZ4Ss6UfIYhbrkqZkdYrSUv+fDuu5QNpohoXf
   yaTTbbqbLOYJrLez5xxRb3726HE2c4bhWPhAPf60MUykRwFYvdfO8W+S2
   AdSwfEK9BIXLTNDOp8LlIWGh3XGR953flD9JBrhnRQk4Bttld4Uv8sjMW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="287109312"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; 
   d="scan'208";a="287109312"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 04:12:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="626038379"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; 
   d="scan'208";a="626038379"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 24 Oct 2022 04:12:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A6EE1291; Mon, 24 Oct 2022 14:13:10 +0300 (EEST)
Date: Mon, 24 Oct 2022 14:13:10 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Chris Chiu <chris.chiu@canonical.com>, linux-pci@vger.kernel.org,
	regressions@lists.linux.dev, linux-cxl@vger.kernel.org,
	linuxarm@huawei.com
Subject: Re: Regression: Re: [PATCH v2 4/6] PCI: Distribute available
 resources for root buses too
Message-ID: <Y1ZzRmi9fL9yHf7I@black.fi.intel.com>
References: <20220905080232.36087-1-mika.westerberg@linux.intel.com>
 <20220905080232.36087-5-mika.westerberg@linux.intel.com>
 <20221014124553.0000696f@huawei.com>
 <Y0lkeieF3WNV3P3Q@black.fi.intel.com>
 <20221014154858.000079f2@huawei.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221014154858.000079f2@huawei.com>

Hi,

On Fri, Oct 14, 2022 at 03:48:58PM +0100, Jonathan Cameron wrote:
> > Thanks for the detailed report! I wonder if you could try the below
> > patch and see if it changes anything?
> Thanks for the quick response.
> 
> Doesn't fix it unfortunately.

I'm back now.

Trying to reproduce this with mainline kernel (arm64 defconfig) and the
following command line:

qemu-system-aarch64 \
        -M virt,nvdimm=on,gic-version=3 -m 4g,maxmem=8G,slots=8 -cpu max -smp 4 \
        -bios /usr/share/qemu-efi-aarch64/QEMU_EFI.fd \
        -nographic -no-reboot  \
        -kernel Image \
        -initrd rootfs.cpio.bz2 \
        -device pcie-root-port,port=0,id=root_port13,chassis=0,slot=2 \
        -device x3130-upstream,id=sw1,bus=root_port13,multifunction=on \
        -device e1000,bus=root_port13,addr=0.1 \
        -device xio3130-downstream,id=fun1,bus=sw1,chassis=0,slot=3 \
        -device e1000,bus=fun1

But the resulting PCIe topology is pretty flat:

# lspci
00:00.0 Host bridge: Red Hat, Inc. QEMU PCIe Host bridge
00:01.0 Ethernet controller: Red Hat, Inc. Virtio network device

I wonder what I'm missing here? Do I need to enable additional drivers
to get the topology to resemble yours?
