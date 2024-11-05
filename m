Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2A91C07EF
	for <regressions@lists.linux.dev>; Tue,  5 Nov 2024 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730815359; cv=none; b=qhTs0CYVBLARJ9Q9xmrnoNT3NOkWHNQzGkpoXIIs5UGo9XsY2WbWcAtVzANbs8RpniulXjPXCloIKHFBszZbdF3qX3ZOP1lBR7KW7xhREiYlNwP7m7eBBWg2ryTtT9QT71alBwZh9VQ9kGNkUdBP2OvaV2Ph7clPB65M8GEw5G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730815359; c=relaxed/simple;
	bh=zvY5U1Ns+j4lQGZFLag6/XccEwoqyJUGsrnhzV4yZJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0Q3MXcgeeVFOIaTZ7AmjAYNum9TugIsksou6e/WSuSf+yGmpcftiFcjq9Ks4Dh+1MRQOHm2b2Kx1Y5Zyc9JWYvZWbFTNeXcKvN30CKo2CAXWOISWz6QegqjzBMDNvj0xyjXDe9orHm1vlBRLPwonZIzkjG8g0tIX3cdruEXgfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvjilm+y; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvjilm+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730815357; x=1762351357;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zvY5U1Ns+j4lQGZFLag6/XccEwoqyJUGsrnhzV4yZJk=;
  b=kvjilm+ynQ4r5dYmkWYkzTSOLj8SBilU3HirSHE3qoxzqBKaVzSspyyJ
   UbDNiH4JXoRNTsS+MuU061yC/HaOX708yKur3sRrryB9yMgi22FbBu2ft
   xXaUiC4kE1MM1n746b9fO+W1BtDVjIftrJF14IOvXeYbf1tQaZO9WmV4v
   GsuN7idDLgvpZlgKObKC82Ruv2nfLRKFhLpFqOlYZ0QblL/njaBlhryD7
   ZXqzavkbWp7005Cy35pIIICI9Qgsrc6i0PyIpXbmWaj9cug0lTi9eQmCt
   fc6gA04GesEXHdtYVjvhOXA+6nq6V2EK+W4aNh3eoSJyDvN2h5gll+lwe
   g==;
X-CSE-ConnectionGUID: 9SFYXDKLTH+mJj32I5oWPQ==
X-CSE-MsgGUID: rT4GNewWTtKRYzb/IvjmWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34347847"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="34347847"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 06:02:36 -0800
X-CSE-ConnectionGUID: SzjGsnZmSG6HnMDfgO2lxA==
X-CSE-MsgGUID: Rh+rT2k6QwuCuHkpvPiIzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="107363597"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2024 06:02:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 718541C4; Tue, 05 Nov 2024 16:02:31 +0200 (EET)
Date: Tue, 5 Nov 2024 16:02:31 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rick Lahaye <rick@581238.xyz>,
	Mario Limonciello <mario.limonciello@amd.com>, Sanath.S@amd.com,
	christian@heusel.eu, fabian@fstab.de, regressions@lists.linux.dev
Subject: Re: [PATCH v2] thunderbolt: Fix connection issue with Pluggable
 UD-4VPD dock
Message-ID: <20241105140231.GH275077@black.fi.intel.com>
References: <20241105103157.526823-1-mika.westerberg@linux.intel.com>
 <2024110542-moaning-zap-7ac2@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2024110542-moaning-zap-7ac2@gregkh>

On Tue, Nov 05, 2024 at 11:54:55AM +0100, Greg KH wrote:
> On Tue, Nov 05, 2024 at 12:31:57PM +0200, Mika Westerberg wrote:
> > Rick reported that his Pluggable USB4 dock does not work anymore after
> > upgrading to v6.10 kernel.
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
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks!

Applied to thunderbolt.git/fixes.
