Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B5C37E2EE
	for <regressions@lists.linux.dev>; Sat, 19 Sep 2026 07:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789801857; cv=none; b=Frdj9VEfIjdaXUT/jOA42JgWqjtvtZWUHaCn6lBgxDuJy3h5z2gFP6bADErlzvsBeyhxRABox3ndHPATGOZ0wisflqaGp4BbF8tszFe+l4qDHvez7/Y9ngXj0a1meFDil5o+rEYoJvfZYUG5E1K2d5s/hn5fPqo9ZhUDaixBLPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789801857; c=relaxed/simple;
	bh=bZdbqV7EtOiC5fBo2XUeutjFyA9EgGuLRhfN0TCWfs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLe3Aupnd2AdBN10WCcMK39FdSCwuUePlaIvlbHtxstYSHACCLPzr9kz2eH8j8XChvxTPndYUMVRO49PJZD3UPoXM2Ga4cMSXR7neOg3DUa7qqtenR61LEQpEBHsT6UD3r9rp6u1Q6gAuuXBzf0exmA8zsFPy4M55Y8JXYoGXSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Nmjufq/G; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Nmjufq/G"
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4hn0y72CxFz8hFl;
	Sat, 19 Sep 2026 07:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789801839;
	bh=bZdbqV7EtOiC5fBo2XUeutjFyA9EgGuLRhfN0TCWfs4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Nmjufq/GaqAPGpGezGdHR+uEGdt1jrrz94XsO+41+ZCHnuaoTiRj/w+bPTcKOgxiu
	 16KWHh3H20E5/jexdzNNKo0Q6XfjqQhAjjPzmnMICFmXU7+iVFpV2n7j3UI5KMfJtT
	 7STERaNlTkTfaoGu1Fwq519s1ZeYVYDNw6/wbf5Dr5vymXsakIx0zwYKetIUAlXHHQ
	 16kVlAiEPBL7GlfMGKzqJ+fgp5hP/Gv5K6kbtJ1VyQ2m7Pb/UVqYwLmO2K+tI0yimQ
	 /rW0BlSXt8547CqFGqvTEDxWdPEylBVhVyTf/uwOvmhZG36iNEStg9ukOL+SE0xoD2
	 mPOnu7ewzX1sQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4hn0xw4jZ5z8hgx;
	Sat, 19 Sep 2026 07:10:28 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hn0xv4bxfz8svb;
	Sat, 19 Sep 2026 09:10:27 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 2517D5FC18;
	Sat, 19 Sep 2026 09:10:20 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <598cd300-dbec-44fc-a670-f575310e6a43@leemhuis.info>
Date: Sat, 19 Sep 2026 09:10:18 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_1/1=5D_media=3A_Don=27t_hide_I=C2=B2C_or_S?=
 =?UTF-8?Q?PI_drivers_by_default?=
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Miguel Vadillo <miguel.vadillo@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Manuel Knitza <manuel.knitza@googlemail.com>,
 Antti Laakso <antti.laakso@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>, Junjie Cao
 <junjie.cao@intel.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260918081755.65082-1-sakari.ailus@linux.intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20260918081755.65082-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <178980182087.197482.7136352681316898912@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 2517D5FC18
X-NC-CID: kHE8tIrfWqBYs1xI4ACwJAG1kk729kwNHSaOoRnEio/yhNdas5c=

On 9/18/26 10:17, Sakari Ailus wrote:
> MEDIA_HIDE_ANCILLARY_SUBDRV Kconfig option was intended for working with
> sub-device and other helper driver autoselection in cases where the
> required drivers are known, e.g. for PCI cards where all the related
> components are mounted. This option, however, applied to e.g. all camera
> sensor and lens VCM drivers that are generally present in systems without
> being mounted on such a card. This leads to easily omitting required
> drivers.
> 
> Drop the MEDIA_HIDE_ANCILLARY_SUBDRV for I²C and SPI devices.

Hmmm, just wondering: Junjie's abandoned approach[1] had Fixes: and
stable tags to ensure it was backported, which sounded wise, as people
ran into problems that might or might not be considered regressions;
shouldn't this one ideally have those, too?

[1]
https://lore.kernel.org/all/20260913125345.588586-1-junjie.cao@intel.com/

Also wondering if the "olddefconfig" case on Arch was tested to ensure
we prevent more people running into problems that Junjie's fix linked to
(there was another one here:
https://bugzilla.kernel.org/show_bug.cgi?id=221983 ). But well, maybe
those were corner cases not worth thinking about to much -- or should we?

Ciao, Thorsten
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/Kconfig | 11 +----------
>  drivers/media/spi/Kconfig |  4 ----
>  2 files changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 4d9946479160..9b28e91b8a67 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1010,14 +1010,12 @@ endmenu
>  # V4L2 I2C drivers that aren't related with Camera support
>  #
>  
> -comment "audio, video and radio I2C drivers auto-selected by 'Autoselect ancillary drivers'"
> -	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
> +comment "audio, video and radio I2C drivers"
>  #
>  # Encoder / Decoder module configuration
>  #
>  
>  menu "Audio decoders, processors and mixers"
> -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_CS3308
>  	tristate "Cirrus Logic CS3308 audio ADC"
> @@ -1180,7 +1178,6 @@ config VIDEO_WM8775
>  endmenu
>  
>  menu "RDS decoders"
> -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_SAA6588
>  	tristate "SAA6588 Radio Chip RDS decoder support"
> @@ -1197,7 +1194,6 @@ config VIDEO_SAA6588
>  endmenu
>  
>  menu "Video decoders"
> -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_ADV7180
>  	tristate "Analog Devices ADV7180 decoder"
> @@ -1557,7 +1553,6 @@ source "drivers/media/i2c/cx25840/Kconfig"
>  endmenu
>  
>  menu "Video encoders"
> -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_ADV7170
>  	tristate "Analog Devices ADV7170 video encoder"
> @@ -1656,7 +1651,6 @@ config VIDEO_THS8200
>  endmenu
>  
>  menu "Video improvement chips"
> -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_UPD64031A
>  	tristate "NEC Electronics uPD64031A Ghost Reduction"
> @@ -1685,7 +1679,6 @@ config VIDEO_UPD64083
>  endmenu
>  
>  menu "Audio/Video compression chips"
> -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_SAA6752HS
>  	tristate "Philips SAA6752HS MPEG-2 Audio/Video Encoder"
> @@ -1701,7 +1694,6 @@ config VIDEO_SAA6752HS
>  endmenu
>  
>  menu "SDR tuner chips"
> -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config SDR_MAX2175
>  	tristate "Maxim 2175 RF to Bits tuner"
> @@ -1718,7 +1710,6 @@ config SDR_MAX2175
>  endmenu
>  
>  menu "Miscellaneous helper chips"
> -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  source "drivers/media/i2c/cvs/Kconfig"
>  
> diff --git a/drivers/media/spi/Kconfig b/drivers/media/spi/Kconfig
> index 4656afae5bb4..da3e225d420d 100644
> --- a/drivers/media/spi/Kconfig
> +++ b/drivers/media/spi/Kconfig
> @@ -1,15 +1,11 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  if VIDEO_DEV && SPI
>  
> -comment "SPI I2C drivers auto-selected by 'Autoselect ancillary drivers'"
> -	depends on MEDIA_HIDE_ANCILLARY_SUBDRV && SPI
> -
>  menu "Media SPI Adapters"
>  
>  config CXD2880_SPI_DRV
>  	tristate "Sony CXD2880 SPI support"
>  	depends on DVB_CORE && SPI
> -	default m if !MEDIA_SUBDRV_AUTOSELECT
>  	help
>  	  Choose if you would like to have SPI interface support for Sony CXD2880.
>  
> 
> base-commit: aedd77ea8168f00687c1248cdf115071e869cf93

