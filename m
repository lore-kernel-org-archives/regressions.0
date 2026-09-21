Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D78837755C
	for <regressions@lists.linux.dev>; Mon, 21 Sep 2026 06:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973655; cv=none; b=QAQCSQeW7VpAsSS/E5iPE7Xn/9v5SFRyB6RX5ICJNt31s+0UAD7gmIj58FTB+LFp2+PbTvu6DTsF6IMtGKpb/wJeNFl8qY94WpM84V/NItfGl1U/uWg7SKgkBnypoa+hKUxb12C+smvjqXBz2S0bc1yWA0Jbu1pYT7lohZmpRsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973655; c=relaxed/simple;
	bh=fdD6tvNcoJtQxglAHu0jsaJ5oYUVk1QKEsMVo0dvtAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=puKKp9i5rfuXEUDl+oYqbCj5dgQR/wZqlHz/azHJR3c7JtAqJdIK4+jJ4nhsdoLCBnqhT/2s/nDwrJJxU5ARiuAFndKeAzodfWGwD87I1dwFyO2oFyhhq/236JcwGVQvLHT3QVAgztgDTCVJgvC2AkIJvfYIHhug93i/4zza2fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G39lyF0F; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G39lyF0F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789973654; x=1821509654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fdD6tvNcoJtQxglAHu0jsaJ5oYUVk1QKEsMVo0dvtAQ=;
  b=G39lyF0FKuqA8Wr/L4bC4SB3yfRN6ikuaFmXX2LsLti5QzR+Zlc6oE9+
   sfGifGrznOsbHi16qduQtSU221ubUNQDho+e4CsyASKvVWqJUordmmS9k
   pK4b85oOZcSSqdegWQT8Jpr8dYrmklmsHQqlf8ZWz9aHzcHIbv7xAUomF
   tERbpYe8fA1frJk6Cgs0pt77AjLh5JGImHVW3yq4AeKQGIOpvzKCb3HxW
   Koe82jUXImkj7APXkqtpgxnWxqREDgOeuzdFizxvo3bbF2nscvZBqlUyW
   14lz8chmFas9rveNB7nq9M99cH6MWAGT8oYdsBsXaKNAMKFRebJY6Z6Ww
   w==;
X-CSE-ConnectionGUID: tP+SCr1hQ9WPkGlOtnINlQ==
X-CSE-MsgGUID: cOh/wO6fTuGNXgQ5oomung==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="975546"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="975546"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 23:54:13 -0700
X-CSE-ConnectionGUID: F5LRgV05QcWV9OJx4for7g==
X-CSE-MsgGUID: YVs2x/hzSSOe8GDfbX04ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3561813"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 23:54:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 037C0120370;
	Mon, 21 Sep 2026 09:54:11 +0300 (EEST)
Date: Mon, 21 Sep 2026 09:54:11 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Junjie Cao <junjie.cao@intel.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manuel Knitza <manuel.knitza@googlemail.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH 1/1] media: =?iso-8859-1?Q?Don'?=
 =?iso-8859-1?Q?t_hide_I=B2C?= or SPI drivers by default
Message-ID: <arDUk1RugOuxI74d@kekkonen.localdomain>
References: <598cd300-dbec-44fc-a670-f575310e6a43@leemhuis.info>
 <20260920020347.709849-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920020347.709849-1-junjie.cao@intel.com>

Hi Junjie, Thorsten,

On Sun, Sep 20, 2026 at 10:03:47AM +0800, Junjie Cao wrote:
> On Sat, Sep 19, 2026 at 09:10:18AM +0200, Thorsten Leemhuis wrote:
> > Also wondering if the "olddefconfig" case on Arch was tested to ensure
> > we prevent more people running into problems that Junjie's fix linked to
> 
> Ran it: this patch on its base-commit, Arch's
> config.x86_64 (7.2.4.arch1):
> 
>   olddefconfig, before: no VIDEO_INTEL_CVS line
>   olddefconfig, after:  # CONFIG_VIDEO_INTEL_CVS is not set
> 
> The option has no default, so olddefconfig leaves it
> off. With the patch, oldconfig prompts for it as (NEW)
> and listnewconfig lists it.

Generally drivers are unselected by default and cvs is no exception.

What I think we could possibly do is to add to cvs Kconfig:

	default VIDEO_INTEL_IPU6

As the cvs driver is (at least right now) used with ipu6 driver only. That
being said, there are probably dozens of configuration options you need to
select to have a functional camera so doing this for cvs only won't make a
lot of difference. I presume it was just a coincidence this happened on
Arch.

This is still a configuration option that make oldconfig will ask about so
it won't be silently ignored as when MEDIA_HIDE_ANCILLARY_SUBDRV was
selected.

-- 
Kind regards,

Sakari Ailus
