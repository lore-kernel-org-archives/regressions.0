Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97D117CD0
	for <regressions@lists.linux.dev>; Mon, 31 Oct 2022 07:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667201994; x=1698737994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KunlMGY2/up5IfEsZKl1WSD35WH5qKwT2d8FLbQiDMc=;
  b=Na4+kEcqtmF9CBthl7fLMlMJz8MATRwwKApGGJ1TMKZ0D2ffvb89AQMJ
   4LN2Tjh2d7QQlo/qdC2toYdhz4SqB3CqgLHdbSruYqW4uc9JmVF0JUlmZ
   3AV2Mf38TdZfm7zXBD6Bg+u8F92Kl+5dTqrgNTewURcc9seDK7PcocO7z
   cSXlLq+3p/nrwn1RC+wLGYD5zH60+wf75dsbs4LrPSdNeLt8b1tRCcYwh
   /BSQ0hMdgCvURGA6kym5O0FOyc9yrB0ZqnmHVjhk+PLp+rCiqQWuYSSf0
   b2QLqWZdTRpWJXAirTmETOrRw2ZPBRcj/LlbidX3UdEXmgecpOZR6R456
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="289228796"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; 
   d="scan'208";a="289228796"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2022 00:39:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="758749258"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; 
   d="scan'208";a="758749258"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 31 Oct 2022 00:39:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 76B54155; Mon, 31 Oct 2022 09:40:06 +0200 (EET)
Date: Mon, 31 Oct 2022 09:40:06 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Chris Chiu <chris.chiu@canonical.com>, linux-pci@vger.kernel.org,
	regressions@lists.linux.dev, linux-cxl@vger.kernel.org,
	linuxarm@huawei.com
Subject: Re: Regression: Re: [PATCH v2 4/6] PCI: Distribute available
 resources for root buses too
Message-ID: <Y1971qnaq6BJObDl@black.fi.intel.com>
References: <20220905080232.36087-1-mika.westerberg@linux.intel.com>
 <20220905080232.36087-5-mika.westerberg@linux.intel.com>
 <20221014124553.0000696f@huawei.com>
 <Y0lkeieF3WNV3P3Q@black.fi.intel.com>
 <20221014154858.000079f2@huawei.com>
 <Y1ZzRmi9fL9yHf7I@black.fi.intel.com>
 <Y1Z2GGgfZyzC2d1N@black.fi.intel.com>
 <Y1fYNsjmUFZsvteT@black.fi.intel.com>
 <Y1fjT6eyV8KVlNRp@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1fjT6eyV8KVlNRp@smile.fi.intel.com>

Hi Andy,

On Tue, Oct 25, 2022 at 04:23:27PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 25, 2022 at 03:36:06PM +0300, Mika Westerberg wrote:
> > On Mon, Oct 24, 2022 at 02:25:12PM +0300, Mika Westerberg wrote:
> 
> Just for the record in case this code will formally go out
> 
> ...
> 
> > +			for (i = 0; i < PCI_ROM_RESOURCE; i++) {
> > +				const struct resource *dev_res = &dev->resource[i];
> 
> I believe this is a good candidate to have
> 
> #define for_each_pci_dev_resource(dev, res)			\
> 	for (unsigned int i = 0;				\
> 	     res = &(dev)->resource[i], i < PCI_ROM_RESOURCE;	\
> 	     i++)
> 
> Since we have many places in the kernel with such a snippet.

Sure makes sense, but I think that should be a separate patch series.
