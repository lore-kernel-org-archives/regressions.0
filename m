Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FA1146D6F
	for <regressions@lists.linux.dev>; Wed, 23 Oct 2024 06:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729663808; cv=none; b=ULiPgpz+7whNUVZBV0JHpt3obmSfIb5XLfNw4iZEtBriWr31zQtossCUObjPutN1J97kJwwWUKgcZSxMQgUz6/MPfMDJsF8qcnZW/4StvjqUXzz9w6wvldIR7kLyKtXr1ME7WbEVMg6LfQVweQXKWAQYZ189GhJZW6ACnm15bps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729663808; c=relaxed/simple;
	bh=d6pW4xi0LQC9Mf1CBRcA8IVQ88uK0iTTORzaAqW6ieE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YttYzS2wpE6h1cDCEpz1VUs/y9/fz8Ty2lH4zJyX0y78mvpLKAEYU/mPtD84oBsh3DZy1F2sXzFL1hYeeRyPf+hLdb5k37/0BleZlzSslTxLh4mLhaEJyPLSVwVp1T9e+WJTUogmYlB2QkRLIgHjl0f667yZmz1haBvh6kQyuA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHqx+J9F; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHqx+J9F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729663807; x=1761199807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d6pW4xi0LQC9Mf1CBRcA8IVQ88uK0iTTORzaAqW6ieE=;
  b=hHqx+J9FlnJ2GMCyHCz3a2B+3t7t/M5Wm+Jw2avt7RBFHItzDvjhWPMy
   yrMJl3qU/EWD9MVYubLFT813zcsbRa6JaGNQKoy6CKQtGQGE48sYRo3zM
   HxF/Wkh+jw9D0hj3CndILAqnmwKjzEdxIs6tJhHJ4xKMd6VX+aELLB2Ob
   uUmQRbnj2FyPokfCjxCUSg3tvHh1D15NRi14gVYEWEO7RLWhMU1pKlBvW
   024q5aVcD7R9utLAexG9HwMTUuz6/ENf/Css1RV8iH+eEXt6OeP2/Ywwq
   xCvvJjwF6GWddTMhxFGhUrGvwQ4jS7/9b/fqR1Vci9cjOvn3lSZWTxJs+
   w==;
X-CSE-ConnectionGUID: XBibPdfNTXCN3wzouMkR9Q==
X-CSE-MsgGUID: 99ERq8TUQaapVGT/e717Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="54632074"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="54632074"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 23:10:06 -0700
X-CSE-ConnectionGUID: T+YlXsULSgWe4jrst28lJw==
X-CSE-MsgGUID: 4ZW84SJkQT2oRkMuOjcsPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="80899370"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 22 Oct 2024 23:10:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 1E164301; Wed, 23 Oct 2024 09:10:01 +0300 (EEST)
Date: Wed, 23 Oct 2024 09:10:01 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Rick <rick@581238.xyz>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Sanath.S@amd.com,
	christian@heusel.eu, fabian@fstab.de, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: Dell WD19TB Thunderbolt Dock not working with kernel > 6.6.28-1
Message-ID: <20241023061001.GF275077@black.fi.intel.com>
References: <000f01db247b$d10e1520$732a3f60$@581238.xyz>
 <96560f8e-ab9f-4036-9b4d-6ff327de5382@amd.com>
 <22415e85-9397-42db-9030-43fc5f1c7b35@581238.xyz>
 <20241022161055.GE275077@black.fi.intel.com>
 <7f14476b-8084-4c43-81ec-e31ae3f7a3c6@581238.xyz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7f14476b-8084-4c43-81ec-e31ae3f7a3c6@581238.xyz>

Hi,

On Tue, Oct 22, 2024 at 07:06:50PM +0200, Rick wrote:
> Hi Mika,
> 
> I have removed pcie_asm=force as kernel parameter but still not working on
> latest non LTS kernel.

Okay, I still suggest not having that unless you absolutely know that
you need it.

> In regards to the disconnect; sorry I think I might have turned of the
> docking station myself during that test. I have taken another dmesg without
> me disconnecting the docking station:
> https://gist.github.com/ricklahaye/9798b7de573d0f29b3ada6a5d99b69f1
> 
> The cable is the original Thunderbolt 4 cable that came with the docking
> station. I have used it on this laptop using Windows (dualboot) without any
> issues. Also on another Windows laptop also without issues. It was used in
> 40Gbit mode.

In the dmesg you shared above, there are still unplug and USB tunnel
creation fails so you only get USB 2.x connection with all the USB
devices on the dock.

How do you determine if it "works"? I guess keyboard and mouse (both
USB 2.x devices) and display (tunneled over USB4 link) all are working
right? However, if you plug in USB 3.x device to the dock it enumerates
as FullSpeed instead of SuperSpeed. There is definitely something wrong
here. I asked from our TB validation folks if they have any experience
with this dock but did not receive any reply yet.

What you mean by 40Gbit mode? The dock exposes two lanes both at 20G so
it should always be 40G since we bind the lanes, also in Windows.

Also In Windows, do you see if the all USB devices on the dock are
enumerated as FullSpeed or SuperSpeed? I suspect it's the former there
too but can you check? Keyboard and mouse should be FullSpeed but there
is some audio device that may be USB 3.x (SuperSpeed), or alternatively
if you have USB 3.x memory stick (or any other device) you can plug that
to the dock and see how it enumerates.
