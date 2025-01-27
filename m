Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4D21D540
	for <regressions@lists.linux.dev>; Mon, 27 Jan 2025 09:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737970993; cv=none; b=UMnX7bIHPS4iWMnCIFdGwX6KlVZoq+LBivOierCIXsPoAsD4e8w204+AdGM0sYPYNN8JH5g/q6dIWJMt3HqjQGd+ryGeOliWnlnuQXKLueE8CgL+BPC0N28CQsUbGN1Ny3YBIxOFXvjmv9MN57g82Nd3AqZb1SDwSEAIYwzOqoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737970993; c=relaxed/simple;
	bh=xtvdBoA3cwqsMwflfoLoRaGjPZhkrO4EFSq7d0kAxkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndI8C5Z1plUjtd/PBD48Kx+35LcLEHsB+DRN/hM4jKmsChG5cqFDhSBFApSA467V4SSVY4j5oCCmQmecWrYY/vx7+ssHP+FyHR+GD55IEW+bXqmNiHowBtRTy8lFTdbon8o9MW65rvVc6OsH3LZOjhdy4ppKF/HxqHrB9PTCsp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nlc2d1Qy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nlc2d1Qy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737970991; x=1769506991;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   mime-version:in-reply-to;
  bh=xtvdBoA3cwqsMwflfoLoRaGjPZhkrO4EFSq7d0kAxkg=;
  b=nlc2d1Qyp5GUeGdC8C+q2Io2VZhxuH0BEz4xmvw69vaLGWFXyBuosJV7
   t9G9robT40YOgLD/zS+u7eCpW4Icx/vdz+2WETYAnsLxp5rDe8Pu377nh
   2uvemSEystN4JwF4YUHJWNkpQLHDcfQiyOabHKxnsv0STt220wkLB2jlW
   vjve+Vm/44U6NgmHD9gLQY463exCxp79ey24GbM7fS7ETEq1Sx2s7wvuz
   pk62w2Vaj37yC1371+LynhOEppk5joiZiYZYVB1XFVPe/u2WVEQS6uC7E
   Fg6/fL857PMFeTOJj0562RbSG/R/bHPEP2acq1Y9g+UKu9fgGpr7GFwgq
   w==;
X-CSE-ConnectionGUID: ZpieYlGQTsKgKrdA/9RwsA==
X-CSE-MsgGUID: wOOq/UWNQgCoXS4hPPsDWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="37678665"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="37678665"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 01:43:11 -0800
X-CSE-ConnectionGUID: A01s2DWgTUeQF2/SIRrHDA==
X-CSE-MsgGUID: LLkVV6qUR5Ct2l9j2jDqRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="139265070"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 01:43:08 -0800
Date: Mon, 27 Jan 2025 11:44:00 +0200
From: Imre Deak <imre.deak@intel.com>
To: Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: Leo Li <sunpeng.li@amd.com>,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	Harry Wentland <harry.wentland@amd.com>, zaeem.mohamed@amd.com,
	pekka.paalanen@collabora.com,
	"Wheeler, Daniel" <daniel.wheeler@amd.com>,
	"Deucher, Alexander" <alexander.deucher@amd.com>,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	lyude@redhat.com
Subject: Re: [BUG,BISECTED] WARNING dcn20_find_secondary_pipe
Message-ID: <Z5dVYAPYu1d34dlC@ideak-desk.fi.intel.com>
Reply-To: imre.deak@intel.com
References: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
 <CABXGCsNztS8MLteq5=fcddwuQ1TCzeOM8TdVtpJ3crK=sV5PTQ@mail.gmail.com>
 <CABXGCsMdxHJ-MLkS0pm51Sk8g0PTghsuZxmowvj5t44bVN4ndA@mail.gmail.com>
 <ffd2c40c-1c2e-4465-b26f-88d5e08a80d9@amd.com>
 <CABXGCsOoL5vD0+FRALFQFr3ZBpb2z5mpGKzAD5RHoW9_sb5yaQ@mail.gmail.com>
 <f68020a3-c413-482d-beb2-5432d98a1d3e@amd.com>
 <Z5Zm-STfRzJ_PIkI@debian.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5Zm-STfRzJ_PIkI@debian.local>

On Sun, Jan 26, 2025 at 04:46:49PM +0000, Chris Bainbridge wrote:
> Hardware is HP Pavilion Aero 13 laptop with Dell WD19 dock and three
> external monitors. I get a warning with recent kernel builds when
> enabling the external monitors with xrandr after initial boot:
> 
> 16:57:49 kernel: WARNING: CPU: 4 PID: 1347 at drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn20/dcn20_resource.c:1734 dcn20_find_secondary_pipe+0x1a6/0x400 [amdgpu]
>
> [...]
> 
> The bisect leads to a merge commit 43102a2012c2 ("Merge tag
> 'drm-misc-fixes-2024-09-26'"). Neither parent commit produces the
> warning, but the merged commit does.
> 
> There are two commits that interact to cause this warning:
> 
> 2a2a865aee43 ("drm/amd/display: Add all planes on CRTC to state for
> overlay cursor").
> 
> and
> 
> 70a6587dca37 ("drm/dp_mst: Fix DSC decompression detection in Synaptics
> branch devices")
> 
> 2a2a865aee43 was added to the mainline Linux repo first, but the warning
> only appears following the merge of 70a6587dca37.

The effect of 70a6587dca37 is to enable DSC only if the dock supports
this. IIRC the WD19 dock does support DSC in both of the branch devices
within it, so not sure how the commit makes a difference on it.

Checking if it's the DP_DSC_SUPPORT DPCD register AUX read which fails,
or if the DP_DSC_DECOMPRESSION_IS_SUPPORTED flag is not set in the
register would tell more (maybe by using drm.debug=0x100).

In any case not sure how the reported DSC capability would relate to
the above warn in dcn20_find_secondary_pipe(), the driver should handle
a dock both with and without DSC support.

> #regzbot introduced: 43102a2012c2
