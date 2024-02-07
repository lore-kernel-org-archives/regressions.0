Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1849359B76
	for <regressions@lists.linux.dev>; Wed,  7 Feb 2024 13:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707313042; cv=none; b=eJv1rSv8j7wgCt7/gM8oVgADtdVKHxuioEpbyNVk6VpLa6M8r1Sbuonu4LJ3onOMb2haCHwDo2p/LphT7fdzQQQ8ErWfvziibRqUgGB8a2CQVsHq1ZmbioiZ2MlfNne4CihaS/6fPFRMEtVh5xHl4MB/6Ndma97V5u34v1CMQIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707313042; c=relaxed/simple;
	bh=+DujwZlr/1wDPIjgj9ybKGjheEDuRA+H2YGe6MkI++o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/48e/N3oVLprW0tF1pwMkGnilkFbvKeqdUKUSB0OkJtzmDCgVI2h/5H0bwTmfHCyRpr3EUKA0r6AICAax6K9yHaoDGVwQoiNdirkGbUuQYEeOLUf46gkjRb811c8GXPnITm/2dKFWQzEdG8yjX5S6DwLgN7i/uxgtFMigmFMGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B8W0wRux; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8W0wRux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707313041; x=1738849041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+DujwZlr/1wDPIjgj9ybKGjheEDuRA+H2YGe6MkI++o=;
  b=B8W0wRuxksZjkv1gOx2Gat6vE5Re8aqh50i0yXUTbv08s+4lKHGQ0xf5
   linY49lS1HZHk94p9GAX9shpHa76sF679wS5Z9zTk5f3096bOnfzXfdbZ
   n0cr+5LQED2rCaVuBIyHuwJvxqcdOmSwV/xcRtNOUUu01ktd5m3IQXkph
   77hwOhNNazPdrjzrFvMiPOqwQy2c4qz6nMD/IToD5IeiyvMn5YZ4Swccl
   kNhjl86OEKen40HMZjJs2ilaQzaibcMplEc7c9S7RkBvzwOFCBw5+vPqm
   pAK3ravKcPlxXtlx3s3a+Nem0d51bAXQyrqef7u+2A0k168zQL5mb/iut
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="12345531"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="12345531"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 05:37:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="909996006"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="909996006"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2024 05:37:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id EBF194C4; Wed,  7 Feb 2024 11:21:52 +0200 (EET)
Date: Wed, 7 Feb 2024 11:21:52 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Olliver Schinagl <oliver@schinagl.nl>,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb <linux-usb@vger.kernel.org>
Subject: Re: kernel NULL pointer dereference on hotplug
Message-ID: <20240207092152.GQ8454@black.fi.intel.com>
References: <c24c7882-6254-4e68-8f22-f3e8f65dc84f@schinagl.nl>
 <20240204064049.GD8454@black.fi.intel.com>
 <705fd33a-18af-44b2-b6ee-57e3169b7032@leemhuis.info>
 <b0388b9e-5ec2-422d-94ce-192b33fef16d@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0388b9e-5ec2-422d-94ce-192b33fef16d@leemhuis.info>

Hi,

On Wed, Feb 07, 2024 at 10:12:07AM +0100, Thorsten Leemhuis wrote:
> On 07.02.24 07:13, Linux regression tracking (Thorsten Leemhuis) wrote:
> > 
> > On 04.02.24 07:40, Mika Westerberg wrote:
> >> On Fri, Feb 02, 2024 at 05:47:01PM +0100, Olliver Schinagl wrote:
> >>>
> >>> I noticed this nasty kernel NULL pointer dereference yesterday on
> >>> 6.7.2-arch1-1 (haven't done this in a while) but also today, after updating
> >>> to 6.7.3-arch1-1 it's still there, so dumping the panic here. Hopefully
> >>> it'll be resolved by 6.7.4-arch1-1.
> >>
> >> Thanks for the report.
> >>
> >>> The thunderbolt gbit adapter always worked in the past, so this seems like a
> >>> regression. Anyway, here's the log.
> 
> FWIW, Leon Weiß (BCCed) just posted another NULL pointer deference issue
> in 6.7 and found the culprit; for details see:
> https://lore.kernel.org/all/38c253ea42072cc825dc969ac4e6b9b600371cc8.camel@ruhr-uni-bochum.de/
>
> Sadly Leon's report lacks a backtrace we had in this thread (
> https://lore.kernel.org/all/c24c7882-6254-4e68-8f22-f3e8f65dc84f@schinagl.nl/
> ), so it might be something totally different. Leon's problem afaics
> also happens on unplug while this one on hotplug. But well, I thought I
> better quickly mention it here anyway so everyone is aware of it.

Thanks for the information. 

As you mention, this seems to be unrelated. The one above is about DRM
and graphics, the one Olliver reported is about Thunderbolt (okay there
is Thunderbolt device involved in both but this one seems to be purely
DP thing).
