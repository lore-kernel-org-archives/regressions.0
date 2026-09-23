Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113E63A5E87
	for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 21:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197489; cv=none; b=jChuSA0puLtA0UnAmcXZK7C/WKq9fvSqROj9ut4N2IIYScFZz+qsOquBVva5v5t3URss83GBQdTLqx+U2aQlZ331E9ci2l9YHKO7U7nfrZ1QOo+E4f7peGXltcBO/N2Y4Q7SoswP2mriUSCBcuF7ApU62jKllAi+fBGbDWejvlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197489; c=relaxed/simple;
	bh=VFyjCNgeGGEMs58DDzNTOPPFDTAJYsdNHUpgJTVZ4oA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpkV3K3D90x+BjO8SVdQWZgXtDBWJDvDxKtjuOPCLfJXX0KN1WD9u/CsLQ2Ma58FaTttUc70jrjM3j+5CZv3ay76FQfqx1C4iVOkKo0gXHv7CD6PRjC00nHxG1qEiFlbgC7xMoTIYGxk1nMSa9K0Adk/Kaezq8xE2lQ20RVbZs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jr4sJYa6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jr4sJYa6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790197487; x=1821733487;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VFyjCNgeGGEMs58DDzNTOPPFDTAJYsdNHUpgJTVZ4oA=;
  b=Jr4sJYa6VaOGokPhWpvVfJEtnxZI1oFtr8EhKwSVDjDM6O+EkEuZOF6n
   F+2RMKGORSzSPsBh6pkbjRNvuTWU1i+Wf+N6rXKXrxTMZBiO4mRmG3YyV
   111QOLDM5dgldo/yFX5BeMxmp0tTFby2vKev67Ct/hh06IZs6COR/uxGb
   rmz09fAHf6ZTage5DHXrJaNZXEp070iZ/0d9tlugJlgdHsPhRt//SM0iJ
   nNF06sobUehEjWMGGY4k4vu47+sEVbq5H0zxn21GeUaxgkR6ZuKDt05qk
   bwHATRJpE9qXnay0OsMgx7LPjd1YVlzpTUBPrheTfsN64ObM9oED1IWSK
   g==;
X-CSE-ConnectionGUID: /z0xM/qbTH2ga3wBraRsdw==
X-CSE-MsgGUID: 6Ai4ynbRSUqNQC1dbyP/hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="116461028"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="116461028"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 14:04:46 -0700
X-CSE-ConnectionGUID: 3baDfRXBRVKjAUBipcD8sg==
X-CSE-MsgGUID: 83M+AXU+Tymf+wMG2ZuLwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="270283995"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.83])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 14:04:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 40C5F11F9B7;
	Thu, 24 Sep 2026 00:04:43 +0300 (EEST)
Date: Thu, 24 Sep 2026 00:04:43 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Junjie Cao <junjie.cao@intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manuel Knitza <manuel.knitza@googlemail.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	regressions@lists.linux.dev
Subject: Re: [PATCH 1/1] media: cvs: Default selection to VIDEO_INTEL_IPU6
Message-ID: <arQ-67Lr18CFv8Mx@kekkonen.localdomain>
References: <20260922064017.371437-1-sakari.ailus@linux.intel.com>
 <arPIqZNMC98jPL3B@mdjait-mobl>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arPIqZNMC98jPL3B@mdjait-mobl>

Hi Mehdi,

On Wed, Sep 23, 2026 at 02:44:47PM +0200, Mehdi Djait wrote:
> Hello Sakari,
> 
> Thank you for the patch!
> 
> On Tue, Sep 22, 2026 at 09:40:17AM +0300, Sakari Ailus wrote:
> > The cvs driver is only usable with the Intel ipu6 driver and is commonly
> 
> I don't know about this statement. Do you mean the ipu6 with the ipu7
> support merged ?
> 
> I write this because I use the cvs with the ipu7 driver from staging on
> one my dell laptops. No ipu6 on that system.

Right, this will hold true once the ipu7 staging driver will be gone.

I can add a note about this in v2.

-- 
Regards,

Sakari Ailus
