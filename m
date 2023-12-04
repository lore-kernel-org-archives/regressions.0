Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22812511F
	for <regressions@lists.linux.dev>; Mon,  4 Dec 2023 15:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lF86GTOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701703242; x=1733239242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qEhcxASuizJtM7lcwqFFlnnisGnpfIA8jp4KVzQJVnU=;
  b=lF86GTOGkiTvCTRtAqviyTn5nGFFQjYZ/M4k9P7cAOqavjQ9DocPRX3b
   ZoWAmxHnmMy7evr6leX39JMaYa9wTovdfb3UOHQvj318Rg/yhOm/P4U9v
   L8lDLX1M+ZyUBmUqVVcx/zGCbFvyud87OFQHniz47xDUqy3/TQFoU2pYv
   rLBDFTcgy3Lab/wliFwfDxR77FMfRLC6sN5zDqbkHErYchVb8p6kTHTES
   9dV3Fagt5K92Z9xPIKwAgDqqrh/eY7hxGZ1m5gW6WAo/y14edRV5zaGMS
   7796bKHrNof5H37JiyCMseKIz8AEf7NyXIwjxso7A2R7JJ+Hjcx4JH3me
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="15293968"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15293968"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 07:20:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="841086629"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="841086629"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 07:20:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rAAkK-00000001muJ-2OQO;
	Mon, 04 Dec 2023 17:20:32 +0200
Date: Mon, 4 Dec 2023 17:20:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, sean.wang@kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Re: arm: gcc-8: drivers/pinctrl/mediatek/../core.h:211:21: error:
 initializer element is not constant (struct group_desc)
Message-ID: <ZW3uQFWeogUhwuA9@smile.fi.intel.com>
References: <CA+G9fYs1g2Pt=DQeaJC+3ZJTeMwKAs9GuGJ9k6BcwKwEXcn5kQ@mail.gmail.com>
 <ad6afb94-e221-4adb-a942-af59f5d7b92f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad6afb94-e221-4adb-a942-af59f5d7b92f@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Dec 04, 2023 at 04:11:11PM +0100, Arnd Bergmann wrote:
> On Mon, Dec 4, 2023, at 13:08, Naresh Kamboju wrote:
> > Following build errors noticed on Linux next-20231204 tag with gcc-8 toolchain
> > for arm and arm64.
> >
> > ## Test Regressions (compared to next-20231201)
> > * arm, build
> >   - gcc-8-defconfig
> >
> > * arm64, build
> >   - gcc-8-defconfig
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Build log arm and arm64:
> > ------------
> > In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:21,
> >                  from drivers/pinctrl/mediatek/pinctrl-mt7623.c:11:
> > drivers/pinctrl/mediatek/../core.h:211:21: error: initializer element
> > is not constant
> >  (struct group_desc) {      \
> 
> This apparently comes from c0c8dd0a7773 ("pinctrl: core: Add a
> convenient define PINCTRL_GROUP_DESC()") and following patches
> from Andy Shevchenko (added to Cc).
> 
> I also checked different compiler versions and found that the
> new code works fine with gcc-13.2.0, but not with gcc-12 or
> older.

Thank you, Linus already dropped problematic changes.

-- 
With Best Regards,
Andy Shevchenko


