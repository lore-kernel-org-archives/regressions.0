Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B802E542C
	for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 12:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167501; cv=none; b=RJNpjEGuzRuCTAIzCythDZXSpPNfbNxYUtfvXnH0i6OO7wnHrDmUNSBG9KNuNbUwP3BhVSdyz/U7DUA4AVQpzWJf+KNEOsshqqXcbkpmAkg8HRXXFjpvKBADY6SUlaTLVWcQLCtp9ccfBGAVIs0gGVQ66vtzD9TG3rR/qMVz29U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167501; c=relaxed/simple;
	bh=plefyBgqMCRYDWCZtKif3JD3zNFTc2d7WQvOUDurc7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/61VspiFsoFbMzlgcSLJqFCNph/HJ8Q4IQkT1XcN8zTfQ8jmgPHim/elsvT/HQ+z2Dd/bWY96oeo/SCKQFa5qyJkXV6tRzF5vJB6A/8orWOXV2hYwLUhGhTIXuLapMfbdbjbq9wsgzbePVOhv7OSRQgdb5XNHHdNa5tE72qJpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Npl1F0B+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Npl1F0B+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790167500; x=1821703500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=plefyBgqMCRYDWCZtKif3JD3zNFTc2d7WQvOUDurc7U=;
  b=Npl1F0B+dfsxE6WDzh2n00ntdgxxNNyCe8VsDlXuzM6/fLBdeuZbVXmg
   +1K83VghOMseoRfJMYyu5Olh/XZsh/7eBlP6ZTCxqQ0esEs3p+IgVokjE
   5lzD6f4i4f7ga21Fk7xE62C7kijBysq1x7ClsPDr4wTb6YS0PgYpYDTTp
   SOKsdY1pt7WxvakmnIQRMvM5srgTyvyQd0wKzgWRseyBAEz3mtV17EwUH
   YTVs7ASUz/Ls0FMoO6iHjMlJku7p3o60hUPeUnWZ+489Rkozla3IwnGCz
   VrZ7NnxATVN19JNDMaHRW/W122fuqf7bQIFOKODc9dBLBFncbnIERNyU9
   A==;
X-CSE-ConnectionGUID: qPVpw/wHSyiG+cBF2dVZlA==
X-CSE-MsgGUID: 6ncIkuq7She/xLh3XgFV/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101447410"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="101447410"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 05:44:59 -0700
X-CSE-ConnectionGUID: sOOhZKr6QK2wCz1rFN50bg==
X-CSE-MsgGUID: IQV8N+8vQPiT+1BDiNsB0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="301521238"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.29])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 05:44:57 -0700
Date: Wed, 23 Sep 2026 14:44:47 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Junjie Cao <junjie.cao@intel.com>, 
	Miguel Vadillo <miguel.vadillo@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manuel Knitza <manuel.knitza@googlemail.com>, Antti Laakso <antti.laakso@linux.intel.com>, 
	regressions@lists.linux.dev
Subject: Re: [PATCH 1/1] media: cvs: Default selection to VIDEO_INTEL_IPU6
Message-ID: <arPIqZNMC98jPL3B@mdjait-mobl>
References: <20260922064017.371437-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922064017.371437-1-sakari.ailus@linux.intel.com>

Hello Sakari,

Thank you for the patch!

On Tue, Sep 22, 2026 at 09:40:17AM +0300, Sakari Ailus wrote:
> The cvs driver is only usable with the Intel ipu6 driver and is commonly

I don't know about this statement. Do you mean the ipu6 with the ipu7
support merged ?

I write this because I use the cvs with the ipu7 driver from staging on
one my dell laptops. No ipu6 on that system.

> required for the ipu6 driver to function. Make the default of the cvs
> driver the same as what was selected for the ipu6 driver.

--
Kind Regards,
Mehdi Djait
