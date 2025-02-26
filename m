Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB38E194A44
	for <regressions@lists.linux.dev>; Wed, 26 Feb 2025 13:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740577622; cv=none; b=N1ix1BhRyKnMp5vlLbKm0DGddnyqC+YepkPBfGU6Mhh60b+X6ncbfl9D7unmSBWF306XcaiCfZghg/DKIZZVKBgB/gtV5+ubEAwx6KMupCta+PXKQLRGAfZO9yKR8k7DSOYw+bljRS5JaeQVqHjPucJNj1s65dCRruNNnwTtOiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740577622; c=relaxed/simple;
	bh=ghYoPmkesmE/DQEdj+zyBDgNwpAW1ZQ1GHICBwEW7hM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTBPE8cNstb5qoN+DhrZSr12pO3VC6aIny9G4V+O9h2dZlP5y19++GewVVhS3AvWZEAvM4zhdnq63xfbDE82DwScHuRQOwpbENuWQHc+OtprJxWRSXDO4S+GNPxFXv8aenqZ/gmWeS+iIFG2GuhMmHM256ylc3XjC2YXOCPsq9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/7kDVdm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/7kDVdm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740577621; x=1772113621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ghYoPmkesmE/DQEdj+zyBDgNwpAW1ZQ1GHICBwEW7hM=;
  b=W/7kDVdm6u4LUbt8g6OtPFUf2Mm2QWETq08LRS+FD7LiYDF9owbWY4ZW
   IDijUdUJnFhGMEVZvRQLN7NME1hurtIh66UpjZsVrDQ9jQp5Rrs3q3IX0
   Q4niRXtguHz8VJ5v5w6W7cNofvaSqAaWUrLamUHlMvTMhuUHY9EPiaH4f
   3FYlKlOIjdgjd5S3Ue9x5OoHtXyWwohNKtP5dyYS8sVX0igHsM5uRE83b
   4U6NCu6BuqgCvuEm2zV8QMcXU4DRGcomxhuDo4PMFWFuk3s5Ai5C5hIYK
   itszRf+d4kB8YmhsJoU9XGQbMXFimN3MpgFvI0KZq7HC4759+/tk6PUHn
   A==;
X-CSE-ConnectionGUID: 1+UIlIoVTfmbQku4bBmsgg==
X-CSE-MsgGUID: yJBH7b52QXOUV+hx3OktwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="58840479"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="58840479"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:47:00 -0800
X-CSE-ConnectionGUID: 4yKCyGZwSImGOCOMBTV8JQ==
X-CSE-MsgGUID: c3S/ek64QHmxAkSq+S5Idg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="116895285"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 26 Feb 2025 05:46:57 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 61B7E2FB; Wed, 26 Feb 2025 15:46:56 +0200 (EET)
Date: Wed, 26 Feb 2025 15:46:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: brgl@bgdev.pl, Paul Menzel <pmenzel@molgen.mpg.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	linux-pci@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Linux logs new warning `gpio gpiochip0:
 gpiochip_add_data_with_key: get_direction failed: -22`
Message-ID: <Z78bUPN7kdSnbIjW@black.fi.intel.com>
References: <9ded85ef-46f1-4682-aabd-531401b511e5@molgen.mpg.de>
 <CAMRc=McJpGMgaUDM2fHZUD7YMi2PBMcWhDWN8dU0MAr911BvXw@mail.gmail.com>
 <36cace3b-7419-409d-95a9-e7c45d335bef@molgen.mpg.de>
 <CAMRc=Mf-ObnFzau9OO1RvsdJ-pj4Tq2BSjVvCXkHgkK2t5DECQ@mail.gmail.com>
 <a8c9b81c-bc0d-4ed5-845e-ecbf5e341064@molgen.mpg.de>
 <CAMRc=MdNnJZBd=eCa5ggATmqH4EwsGW3K6OgcF=oQrkEj_5S_g@mail.gmail.com>
 <CACRpkdZbu=ii_Aq1rdNN_z+T0SBRpLEm-aoc-QnWW9OnA83+Vw@mail.gmail.com>
 <Z78ZK8Sh0cOhMEsH@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z78ZK8Sh0cOhMEsH@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 26, 2025 at 03:37:47PM +0200, Andy Shevchenko wrote:
> On Tue, Feb 25, 2025 at 10:25:00PM +0100, Linus Walleij wrote:
> > On Mon, Feb 24, 2025 at 9:51 AM <brgl@bgdev.pl> wrote:
> > 
> > > In any case: Linus: what should be our policy here? There are some pinctrl
> > > drivers which return EINVAL if the pin in question is not in GPIO mode. I don't
> > > think this is an error. Returning errors should be reserved for read failures
> > > and so on. Are you fine with changing the logic here to explicitly default to
> > > INPUT as until recently all errors would be interpreted as such anyway?
> > 
> > Oh hm I guess. There was no defined semantic until now anyway. Maybe
> > Andy has something to say about it though, it's very much his pin controller.
> 
> Driver is doing correct things. If you want to be pedantic, we need to return
> all possible pin states (which are currently absent from GPIO get_direction()
> perspective) and even though it's not possible to tell from the pin muxer
> p.o.v. If function is I2C, it's open-drain, if some other, it may be completely
> different, but pin muxer might only guesstimate the state of the particular
> function is and I do not think guesstimation is a right approach.
> 
> We may use the specific error code, though. and document that semantics.

Brief looking at the error descriptions and the practical use the best (and
unique enough) choice may be EBADSLT.

-- 
With Best Regards,
Andy Shevchenko


