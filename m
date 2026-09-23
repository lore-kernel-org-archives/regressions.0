Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBE850128E
	for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 12:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166109; cv=none; b=hS+vSdsrTY8A8UG4yO5XkZp/ALwqK6X0uqvHpMo1iugWZkGd9z6As8zFu6E3xcGcH6EGpzQ1JaPLlqlS/iAImbo917DRqtXsiIVY9yIRF15ZBlKP6nCo5/P6WT94FtyUINBYFnEbhEPVyoJdSJL2B09bVhSdxMzJ34bdsQpjZxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166109; c=relaxed/simple;
	bh=3nQNP8CFPoAhrOHW1mjUERFkoh1KDpOF28ujSMg5fWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zx1eWYEFHI6lGeelDToi+iErb9Mz+G8K1Q4hmmkO9m5NL8MdfmC5J2tJa7Ng4ecS2e42af/ymses4L4NXsFWQOwA8bMsN6p0lxppU7yz4Mcc82hwfE4xU17MseFOk65YB8qtDCSsR5QvWFsduOx+PIeQclkf5R5Bm28EnSmPH20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEBgrd8a; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEBgrd8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790166107; x=1821702107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3nQNP8CFPoAhrOHW1mjUERFkoh1KDpOF28ujSMg5fWo=;
  b=fEBgrd8aKQchv9CSbe6COicnYxictnPJ7ERzL6jdRNBa+P4FAYEEMHzc
   xwKC/6fD89Lxi9nsXDDyH5TkzWGdAYI3jdfAAafh+cZYeZdyYrhosK4OT
   F1B4FjSzvdJweAXKGXPZNIflNR5LunmWevenUCy0vFMIQMPoemnDUZ8Bg
   cmU28UjGrLeuKbKR+YT2JeTfYHBZr95Wq4DoQXNyVq9VBBaHXf4qYas20
   pJfphYCyKaprZS1IeggHqlVAwPI8ILsnVpgI3CoIDktjpdrfRSZVah7Zl
   R/XXtO44Zxw/+0vzWmjpPviP45YULu71HSE+4nyRzuachtweXJMarrgEw
   Q==;
X-CSE-ConnectionGUID: +f32EO65RsS66Y30tKvHLg==
X-CSE-MsgGUID: sNdY0YExSMmxRd9kvninog==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101519237"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="101519237"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 05:21:46 -0700
X-CSE-ConnectionGUID: i2OFaIJDTZWKwfKVtym3Sg==
X-CSE-MsgGUID: qPeLb9qBSn2hRB5oufhSMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="301513354"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO alaakso-desk) ([10.125.110.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 05:21:44 -0700
Date: Wed, 23 Sep 2026 15:21:39 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Junjie Cao <junjie.cao@intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manuel Knitza <manuel.knitza@googlemail.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	regressions@lists.linux.dev
Subject: Re: [PATCH 1/1] media: cvs: Default selection to VIDEO_INTEL_IPU6
Message-ID: <arPEU7Sk9NCBbSdh@alaakso-desk>
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

On Tue, Sep 22, 2026 at 09:40:17AM +0300, Sakari Ailus wrote:
> The cvs driver is only usable with the Intel ipu6 driver and is commonly
> required for the ipu6 driver to function. Make the default of the cvs
> driver the same as what was selected for the ipu6 driver.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/cvs/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/cvs/Kconfig b/drivers/media/i2c/cvs/Kconfig
> index 4309d20dd726..f482f1ccc38a 100644
> --- a/drivers/media/i2c/cvs/Kconfig
> +++ b/drivers/media/i2c/cvs/Kconfig
> @@ -4,6 +4,7 @@ config VIDEO_INTEL_CVS
>  	tristate "Intel CVS CSI-2 bridge support"
>  	depends on I2C && ACPI && VIDEO_DEV
>  	depends on IPU_BRIDGE || !IPU_BRIDGE
> +	default VIDEO_INTEL_IPU6
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select V4L2_FWNODE
> 
> base-commit: 508a3559448684c4c0110a0c1614deaface399c4
> -- 
> 2.47.3
> 

Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>
