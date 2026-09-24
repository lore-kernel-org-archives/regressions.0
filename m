Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD89F30E0D5
	for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 13:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257588; cv=none; b=NX5RKISKqbNc1B8Tp1TyQArToYABhmgJnyMOg+OggU8JTd9PbxuFyoxO3KGkHzBwlEEYz27LQuhhEBYmJTRKHOk98BfaCfzpThPcbQwZuBC2pjANKKvhmfELBq4shAukft2isRloFrrEy37QWKY4rQx60jjggwtshjKtVJ4mpM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257588; c=relaxed/simple;
	bh=wRjjNukvTBiQHnt5Oc6/TYwacV0y7pyOBe1+DHqRgqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7doUdez0/JMr/gadnL54R84Y4d2d2fsgw13c+OPM66uz2vW5q33Vta0aXc0XJT2zbEj6pXL83g+JxJrEH70alXPi/ekmC+2CizPxdO28nc+bQAql9o5H0PE59G17fJlVbDN1xYjAk7Rpv3FUHyknICPV76kYhkIZ2GgjBZF+Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+lNE5m0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+lNE5m0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790257585; x=1821793585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wRjjNukvTBiQHnt5Oc6/TYwacV0y7pyOBe1+DHqRgqY=;
  b=f+lNE5m0phAkFgR1th0AaAE21Dy55YekTZ9WZ5o2qE+FoWfIDXB5IKhC
   MyPXVb1VyqmLDxrvxBkieQVpq/wNIEck5Sfq9+V2TRx0YBKp3TkJa/cgW
   pHJb1iX0b2hdaDsq1HjWUyD+CD6HYZHWJdBCenn56i18O0V4ycLLi9O5F
   kdRUgB94nPoAr8h4jD0uR5Oq7KrBIJ5nsHkJX33LxePDjAiLQrOObkrhc
   wX28w5AoqzDydQtt7ecdPoGdu967XH04GchNfaeRxA3kVX9PwFJr6xeC5
   RdOK5JHdKNtYBKhV/z0WepUaUhstosAr7VAS/gha/G9fm/N1n1+y6MmKu
   g==;
X-CSE-ConnectionGUID: ufsGBriSTK67e7/xK/HrgQ==
X-CSE-MsgGUID: SX65AW7WQDq3Bh49qUCCUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="102387025"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="102387025"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 06:46:19 -0700
X-CSE-ConnectionGUID: W5U+41DET7O2p1K6guFqOw==
X-CSE-MsgGUID: RwcBPw9zTdOA/cS51BxWtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="300301319"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.230])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 06:46:17 -0700
Date: Thu, 24 Sep 2026 15:46:09 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Junjie Cao <junjie.cao@intel.com>, 
	Miguel Vadillo <miguel.vadillo@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manuel Knitza <manuel.knitza@googlemail.com>, Antti Laakso <antti.laakso@linux.intel.com>, 
	regressions@lists.linux.dev
Subject: Re: [PATCH v2 1/1] media: cvs: Default selection to VIDEO_INTEL_IPU6
Message-ID: <arUpZmST2clIWDSf@mdjait-mobl>
References: <20260923211449.904157-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923211449.904157-1-sakari.ailus@linux.intel.com>

Hi Sakari,

On Thu, Sep 24, 2026 at 12:14:49AM +0300, Sakari Ailus wrote:
> The cvs driver is only usable with the Intel ipu6 driver (as well as the
> ipu7 staging driver, as long as it exists in the staging tree) and is
> commonly required for the ipu6 (or ipu7 staging) driver to function. Make
> the default of the cvs driver the same as what was selected for the ipu6
> driver.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>

--
Kind Regards
Mehdi Djait
