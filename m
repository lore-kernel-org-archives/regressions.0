Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7638C1A
	for <regressions@lists.linux.dev>; Fri,  4 Oct 2024 06:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728022841; cv=none; b=M7B4fyCXess6I+1p/EkhSIVTUEoFy9HZX4EzQYEephGS//W65XdhDjKNXNYSTfKbyORYtA0rIG7ylfisp3J+u2q15ZuzmnevMUgk3sMcGlf+tPxju3WPhRMq1hj58zQ1N8ApozRogcSgJhSxMX07XSeed4xONhd37QcFdJVsntw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728022841; c=relaxed/simple;
	bh=8amoBqfejbGevaWPcDe2PfpZyB3puEPrkrbpwGBgjVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsh1KopEDILvW1I6VifPGCwDpBGh5tlY0IlhtkPwwhgsN5JUW14zjM32L2+kiqM2EM6lKHx6by47tPfZ6lvl3+/L1S76OA5VKIml8kBDvjiLgQJFKraP2o1hD9FXi36YnrVTDNRZBBXCbtbv95LEkowT45LT11hOkll9AuIjcHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kh2QflIp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kh2QflIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728022839; x=1759558839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8amoBqfejbGevaWPcDe2PfpZyB3puEPrkrbpwGBgjVo=;
  b=Kh2QflIpRCIA3nmESUwsIUHtcNJo86VaY/NFr5mGzyvRfJdYoXKMfi/L
   1rV5/OaejyC+kfO9aedJK6LQwZHD5M0MTW18BPO4vVRgQN8b8Z62ikDQV
   +bTwmQX+1t1ycz7ICaRxsQkKieu0abOszON10+gGRfKp+9eZQ2HTb9IjH
   q4Q5epP0vz5iixqSMUc47TOefd07+NdBQFONeI+cfENxFvR/aMkCbJuoQ
   LOcvpH3HpLfxpgM/Q/Z44bnnBj9gRFgnWOSss7EG6AosU9dYk1XGO3R97
   Gw/p2iZ4dm2C1hVy6eOaw7KIEfKN6+p+szs7Cdl8rQmRiUuBS9is2Gbyu
   w==;
X-CSE-ConnectionGUID: H52MR8CsQKqJ3FWMl8yjfw==
X-CSE-MsgGUID: ZhxLHSafQhu9JKoSa9xM5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27407464"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="27407464"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 23:20:39 -0700
X-CSE-ConnectionGUID: BGvtQjhmS9C982/KYM7eCg==
X-CSE-MsgGUID: 299ICQgnQOmglYdjnjinVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="105447292"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 03 Oct 2024 23:20:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 8E0651C2; Fri, 04 Oct 2024 09:20:35 +0300 (EEST)
Date: Fri, 4 Oct 2024 09:20:35 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com,
	regressions@lists.linux.dev, Raju.Rangoju@amd.com, Sanath.S@amd.com,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
Message-ID: <20241004062035.GQ275077@black.fi.intel.com>
References: <cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com>
 <20241003054704.GM275077@black.fi.intel.com>
 <01bf9a3a-6277-4b57-83ed-82c4bfb62dd2@amd.com>
 <20241003132726.GN275077@black.fi.intel.com>
 <797f52fa-ab9d-45c5-828b-9dcaf75fcc83@amd.com>
 <20241003134743.GO275077@black.fi.intel.com>
 <afb91d66-55b2-466d-87c6-5de196b326d8@amd.com>
 <467722db-188f-4487-a837-01e65e194d3b@amd.com>
 <9edf23d2-d5f7-4646-bde0-4af1e01abfd2@amd.com>
 <18a0c8ec-0200-4a89-8a7c-fa585801def8@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <18a0c8ec-0200-4a89-8a7c-fa585801def8@amd.com>

Hi Harry,

On Thu, Oct 03, 2024 at 03:41:42PM -0400, Harry Wentland wrote:
> > You said it can work properly without the revert if you don't boot with the dock plugged in?
> > 
> It can work properly without the revert if I boot without the dock plugged in.

Can you provide full dmesg of that with "thunderbolt.dyndbg=+p" in the
command line?
