Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A721C2423
	for <regressions@lists.linux.dev>; Tue, 22 Oct 2024 16:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729613461; cv=none; b=hkeYsvftYkP7OPUFzxOoeutJ1pGTI8n0RxHt4ehoEiVozWl6QwBIbRBE2Jt4ptefGw0zDzGLlzuah8sSQEi2TFjYDdo/L8BwFYVyMD5UpYneiaD6XkMTzlraGQf+zmCSsJg1QSOIh6Ad/8jGAXhHsb/jjhE8lVlQbDAJ2xJEP04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729613461; c=relaxed/simple;
	bh=1+MzFKDPWGiDj4iOSAeUNvi0tCso7cQ7fYlj90Isr84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bI3x676YeOjrI46NoXfturCx+OM2MWCwoYY928qHROSLjsbp0T6BM4GO5HMIvArWlQqssIkjnIu2f2bR3gpRRjaitXtY/IsONlPWeqhz9YmcLfaYCI6qzxSNDAfA0vMPIGociIaCqWYaYjwl4eBeRFFjeJ/TJgJvS2FTaxGqdxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHNJn7Tc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHNJn7Tc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729613461; x=1761149461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1+MzFKDPWGiDj4iOSAeUNvi0tCso7cQ7fYlj90Isr84=;
  b=iHNJn7Tc1M6IBRvdWD6qZKQ9UB/KyVdkqwk/bHpmMhcGfYuJVobYJru2
   0Tsaimd7VIOESqADUljQV73vaylA6h+tZzQGtpPCr8SW20HFtHcSbuR32
   UlljnlT5FKOOB3bMoI9RGevW4VmlhmD0SYPh71gd66tbn6xQ33NPdCN46
   VVTweXjmdHiu/nXxNyQh8NBmQUWKAX9/Hcvs6+TQeQorRcXBADgTDT+l6
   NebZoKuLZutsQz4FuIrrx7v8zAtyk54Gr3nDRH+JkMjAZ83pAemJAWHYv
   h1RcVJcnGbNTVPkUuQNPrO61vunL31sl+nbZI43og5pPnIHWSC3Hh2Yk4
   w==;
X-CSE-ConnectionGUID: 6u80U34wS9KFv60grurvtw==
X-CSE-MsgGUID: J/JMtbTpTaGxKvP6Nxq8wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29322580"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29322580"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 09:11:00 -0700
X-CSE-ConnectionGUID: YYEIhHtlRTumDFWRfNfUyA==
X-CSE-MsgGUID: f/7ATnyPQ+KgthfuynJaKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="80335714"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 22 Oct 2024 09:10:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 0A16A1BD; Tue, 22 Oct 2024 19:10:55 +0300 (EEST)
Date: Tue, 22 Oct 2024 19:10:55 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Rick <rick@581238.xyz>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Sanath.S@amd.com,
	christian@heusel.eu, fabian@fstab.de, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: Dell WD19TB Thunderbolt Dock not working with kernel > 6.6.28-1
Message-ID: <20241022161055.GE275077@black.fi.intel.com>
References: <000f01db247b$d10e1520$732a3f60$@581238.xyz>
 <96560f8e-ab9f-4036-9b4d-6ff327de5382@amd.com>
 <22415e85-9397-42db-9030-43fc5f1c7b35@581238.xyz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <22415e85-9397-42db-9030-43fc5f1c7b35@581238.xyz>

Hi,

On Tue, Oct 22, 2024 at 05:44:18PM +0200, Rick wrote:
> Hi Mario,
> 
> I apologize. I think I mixed up the versions between linux-lts and linux
> kernel.
> 
> linux-6.6.28-1-lts works:
> https://gist.github.com/ricklahaye/610d137b4816370cd6c4062d391e9df5
> linux-6.6.57-1-lts works:
> https://gist.github.com/ricklahaye/48d5a44467fc29abe2b4fd04050309d7
> 
> linux-6.11.4-arch2-1 doesn't work:
> https://gist.github.com/ricklahaye/3b13a093e707acd0882203a56e184d3f
> linux-6.11.4-arch2-1 with host_reset on 0 also doesn't work:
> https://gist.github.com/ricklahaye/ea2f4a04f7b9bedcbcce885df09a0388

Looks like some sort of connectivity issue to me.

However, can you first drop the "pcie_aspm=force" from the command line
and see if that has any affect. Probably does not but I suggest not to
keep it unless you really know that you want force ASPM on all PCIe
links (this may cause issues with some devices).

Anyways, even the working -lts ones you see the link goes down and up
which is not expected (unless you unplugged and plugged it back). Some
devices that are not Thunderbolt certified have this kinds of issues.
The cable could make difference too. Is it Thunderbolt 4 cable or
regular one?
