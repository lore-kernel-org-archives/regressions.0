Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D913B585F
	for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 21:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197608; cv=none; b=ej7AAqquXuW5oipoxOal1EHnHa8EKBSDNdG9nuJsJZ8s+bDgj0KZyUU77P5WGVVJHI0cdzECjedfoDGeVakAHoiA8Ds21Yog9/UoXkaNHa+bLY1ZCZgJbPuEpVImdFpMxYAddxEpV0XrTxrKQ1Ib5lEhDxm2kUbpGUGkrT1UDJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197608; c=relaxed/simple;
	bh=P1ZyYdZbyAPQNTSIgSushjr7qCn3n2ElWueqeWiV44E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A464WGWzBBjachiG94cAh1XSDm0y2f4g/PsACPV2c7vxnBjcwTbIyZuNIzr8TnwtXVFcmcsUvqfFwnSZhDHbAMSOTZ3m//pZyK1CBx0B7rc1rOW8butnzBNipw4iPajGR23g2m8ItC4/l8LY3xzb9vQ0hj5ljgIGR3j1/leNxkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCKFJYzk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCKFJYzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790197604; x=1821733604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P1ZyYdZbyAPQNTSIgSushjr7qCn3n2ElWueqeWiV44E=;
  b=YCKFJYzklhFgV6CTZPraE6Efdci/2oDdg7paNQ9sPWXgIR89fsjwQCXs
   TGvLlw4wbIoqFDJOmoy6lSSZzC6cqi31ft80DVRh9oNEyxejzRviYSgt3
   YDZ9aqY5aLpdupcbY+EedImmIYEhHTAdE1dH1wqrwShg9P5FVfyEiWY6i
   7fS4T1lJ+xJXxXQKntJ/coBjchScSh9v6QTcGhawB/SJJZ7o/WXZ+ShQ2
   QmxtKotUM18MqCgNjOE3MpZVfwMab9nMAvKI0Qy3o5qBdIRAUOjeWUhm/
   sw6AIfyBDTFF/eT9CrnfyzO3xMBSzhfeeDzI+qykezvjAjyHflJNTFW39
   w==;
X-CSE-ConnectionGUID: 59pMDOhfRpazOzO3egLCQA==
X-CSE-MsgGUID: Qb1YMKbvSnWH2jMcViWqDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90962084"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="90962084"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 14:06:41 -0700
X-CSE-ConnectionGUID: SzT+HmZNTr+WmXe4JPJ37g==
X-CSE-MsgGUID: SFkifHzsQB+2aVK8MxnQAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="281863230"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.83])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 14:06:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3419E11F9B7;
	Thu, 24 Sep 2026 00:06:38 +0300 (EEST)
Date: Thu, 24 Sep 2026 00:06:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Vadillo, Miguel" <miguel.vadillo@intel.com>
Cc: linux-media@vger.kernel.org,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Junjie Cao <junjie.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manuel Knitza <manuel.knitza@googlemail.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	regressions@lists.linux.dev
Subject: Re: [PATCH 1/1] media: cvs: Default selection to VIDEO_INTEL_IPU6
Message-ID: <arQ_Xl6Oibg4qRR0@kekkonen.localdomain>
References: <20260922064017.371437-1-sakari.ailus@linux.intel.com>
 <c1046170-b820-4767-804a-55d95421f6e2@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1046170-b820-4767-804a-55d95421f6e2@intel.com>

Hi Miguel,

On Wed, Sep 23, 2026 at 11:10:55AM -0700, Vadillo, Miguel wrote:
> Hi Sakari,
> 
> On 9/21/26 11:40 PM, Sakari Ailus wrote:
> > The cvs driver is only usable with the Intel ipu6 driver and is commonly
> > required for the ipu6 driver to function. Make the default of the cvs
> > driver the same as what was selected for the ipu6 driver.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   drivers/media/i2c/cvs/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/media/i2c/cvs/Kconfig b/drivers/media/i2c/cvs/Kconfig
> > index 4309d20dd726..f482f1ccc38a 100644
> > --- a/drivers/media/i2c/cvs/Kconfig
> > +++ b/drivers/media/i2c/cvs/Kconfig
> > @@ -4,6 +4,7 @@ config VIDEO_INTEL_CVS
> >   	tristate "Intel CVS CSI-2 bridge support"
> >   	depends on I2C && ACPI && VIDEO_DEV
> >   	depends on IPU_BRIDGE || !IPU_BRIDGE
> > +	default VIDEO_INTEL_IPU6
> 
> Would this be affected once the IPU6 and 7 are somehow merged?

It's unrelated. Mehdi asked about the ipu7 driver, too, and I think I'll
send v2 that takes that into account in the commit message.

-- 
Regards,

Sakari Ailus
