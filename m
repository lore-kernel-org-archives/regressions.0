Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1FF2C1A2
	for <regressions@lists.linux.dev>; Tue,  5 Nov 2024 09:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730798658; cv=none; b=N/tl4d5USyy5ibxAoofFQnW5anwUZWdopGqJu0VOOs+ZvCTlg1Zse9GA4mI72gMTCI1qD70MGA0bYh1WRk4isHrBkaiBiryT0ey66KYrTwapso+33Euj08vNQKZpEOcXrFYhFS1EfePUFSdHsnpfIBmuAVH18cr9pl7LVK7la8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730798658; c=relaxed/simple;
	bh=tTrh6yIYZoMRzeZ9aKIsMJrKqlQL6UWrYDP+8bUzSFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cU44blQ/S2/64ZEGmAtbQYeMeCzrNyCyq15yniQOodZu8Id0MWte4BBWlNk5cT6n3/4sUGU2aDCdn3YN+RgZltmGAzhpkfxnp/dF0fWBCO3bP9pTw3miuCfvvMUqw4zY/oAd0jkF+LqcIMcCzquLRYHMQr+YwAYNu1QgMa6wtjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGzEyGTF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGzEyGTF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730798657; x=1762334657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tTrh6yIYZoMRzeZ9aKIsMJrKqlQL6UWrYDP+8bUzSFA=;
  b=KGzEyGTFkgCXo8m+HtaNY/WR+JXKMD1UFvj6mlszQFN84Lx9qSdGBY5k
   8sV1tU80kJOZWrKJ28heGqGtd0iM73WshxIna1BhNJd5k7dKn7ZKGrxDq
   QuGcAaQtWEoTfppzaRZBy5sXnOZHXMGK+d4N9Uh50mRhGm32Si7G2Z3lL
   rcde49Uj20GLwfUD15naZzKP2QlW4h+hB6RTnFt7SFmFp96rhljYvF+FL
   uXadJkfWXU1A2kD9Qi90u7xwafVMrHKAuGcUpkbQyW45Mo9jq3QkquBdv
   g+N+ynEBw5H2D/8PyZ5CwNSF/YS04f//bjTdP+pWlQSeqJ33gQPABU8dj
   w==;
X-CSE-ConnectionGUID: D2RLDoneTe20Zt+Taappfg==
X-CSE-MsgGUID: rItbvLwsRfSMUe/GGzXx8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34318531"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="34318531"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 01:24:17 -0800
X-CSE-ConnectionGUID: Cc+c5fg7RG+c8Y8Qf05vtA==
X-CSE-MsgGUID: MMD2YQXwSzKOQiqB+b9b2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="89081607"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 05 Nov 2024 01:24:14 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A15281E0; Tue, 05 Nov 2024 11:24:12 +0200 (EET)
Date: Tue, 5 Nov 2024 11:24:12 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rick Lahaye <rick@581238.xyz>,
	Mario Limonciello <mario.limonciello@amd.com>, Sanath.S@amd.com,
	christian@heusel.eu, fabian@fstab.de, regressions@lists.linux.dev
Subject: Re: [PATCH] thunderbolt: Fix connection issue with Pluggable UD-4VPD
 dock
Message-ID: <20241105092412.GF275077@black.fi.intel.com>
References: <20241105085301.524312-1-mika.westerberg@linux.intel.com>
 <2024110514-unashamed-amenity-6b9c@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2024110514-unashamed-amenity-6b9c@gregkh>

Hi Greg,

On Tue, Nov 05, 2024 at 10:17:43AM +0100, Greg KH wrote:
> On Tue, Nov 05, 2024 at 10:53:01AM +0200, Mika Westerberg wrote:
> > Rick reported that his Pluggable USB4 dock does not work anymore after
> > 6.6.28 kernel.
> > 
> > It looks like commit c6ca1ac9f472 ("thunderbolt: Increase sideband
> > access polling delay") makes the device router enumeration happen later
> > than what might be expected by the dock (although there is no such limit
> > in the USB4 spec) which probably makes it assume there is something
> > wrong with the high-speed link and reset it. After the link is reset the
> > same issue happens again and again.
> > 
> > For this reason lower the sideband access delay from 5ms to 1ms. This
> > seems to work fine according to Rick's testing.
> > 
> > Reported-by: Rick Lahaye <rick@581238.xyz>
> > Closes: https://lore.kernel.org/linux-usb/000f01db247b$d10e1520$732a3f60$@581238.xyz/
> > Tested-by: Rick Lahaye <rick@581238.xyz>
> > Fixes: c6ca1ac9f472 ("thunderbolt: Increase sideband access polling delay")
> 
> This commit is not in the 6.6.y tree, it only showed up in 6.10.y, so
> how does this resolve an issue in the 6.6.y tree?

This refers to a mainline commit that caused the issue. The 6.6.28 is
the kernel version Rick used where it still worked. In other words, this
is not a backport of a fix but a fix intented to the mainline ;-) I hope
this clarifies. I can adjust the commit message if needed.
