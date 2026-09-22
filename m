Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FC8403150
	for <regressions@lists.linux.dev>; Tue, 22 Sep 2026 06:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059087; cv=none; b=s7O9uoHhoOdoQX7f5RwTNWi1/xk668S+LEH14K3HYm4gXVKfAZVlpq0csuHoKSmefSL9+iaX/z69TknfvF6425v2K8AC+ArTbfs43vUNihe9QexpWwULoF8w5pjIdlBRHt85Lj5d4K6wE8Mm2JAScYs1OVeCh18nnEKzewjWZAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059087; c=relaxed/simple;
	bh=4lUPLsg5I3bh+zUa0H81Qd4p9sE3VFEPRyJY7214MxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWGUDCqcRTWwO/RPu9Tr3FKsK2zVd1NZCtbLZy/lRiZd+ECzUmMUdK85eZGXflOjZNJ8MPkfukp4GbSJYOMtHaU30cx5BRrtsWVpVlVllRvwtAE+eZLk/ABBzk2nYI9XYByJ0b6y/vERdtd6yrFoFZvsYqNsGNSlh2WaaYZDBgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqQQry6t; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqQQry6t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790059085; x=1821595085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4lUPLsg5I3bh+zUa0H81Qd4p9sE3VFEPRyJY7214MxE=;
  b=AqQQry6tmfJonAEI/sKs9Xb3W1OpZEy5gBNveZzFJEWpAgJGniFEOPWC
   +737FEF9KZGfAK1BD9lxpeahOaE/8RF5u16q1mRNkScRLpegIpMzWlXS+
   FdMsE25dm4CME9Ja/NWyQID0EuTZo+GgFdBZ84A8fybabf3re4E0gblGC
   lSDVMtCKUzhD1bbQdWqtTqYIifPaxaklwbjsSct7wNW6pB8kC5jqzZuB0
   v1Tc3kg4sfU4YLsIPnJ0FTsYKtabVxqSdJiWRvouAWJiVj4A9geA9bt8/
   9uX/oHVftBtDT58CO/zpLyDu2JnIh9j7YDvT/I1e0TeWb1dn19wwkdCS2
   g==;
X-CSE-ConnectionGUID: LTPF4ispQtKGwSKeZHmUaw==
X-CSE-MsgGUID: J8uS2U2NSF6ZHQs+mFH9mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="116154986"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="116154986"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 23:38:04 -0700
X-CSE-ConnectionGUID: 1GJDPbnaS9mZehoppmS0YQ==
X-CSE-MsgGUID: dGR8BpCdR+SvPZAl8nSd5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="273166702"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 23:38:01 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3384B121BA5;
	Tue, 22 Sep 2026 09:38:01 +0300 (EEST)
Date: Tue, 22 Sep 2026 09:38:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Junjie Cao <junjie.cao@intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manuel Knitza <manuel.knitza@googlemail.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH 1/1] media: =?iso-8859-1?Q?Don'?=
 =?iso-8859-1?Q?t_hide_I=B2C?= or SPI drivers by default
Message-ID: <arIiSTLWYwELJqvU@kekkonen.localdomain>
References: <598cd300-dbec-44fc-a670-f575310e6a43@leemhuis.info>
 <20260920020347.709849-1-junjie.cao@intel.com>
 <arDUk1RugOuxI74d@kekkonen.localdomain>
 <2b067a4a-6da8-4948-ab50-46f1c6193ed1@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b067a4a-6da8-4948-ab50-46f1c6193ed1@leemhuis.info>

Hi Thorsten,

On Mon, Sep 21, 2026 at 09:16:12AM +0200, Thorsten Leemhuis wrote:
> On 9/21/26 08:54, Sakari Ailus wrote:
> > On Sun, Sep 20, 2026 at 10:03:47AM +0800, Junjie Cao wrote:
> >> On Sat, Sep 19, 2026 at 09:10:18AM +0200, Thorsten Leemhuis wrote:
> >>> Also wondering if the "olddefconfig" case on Arch was tested to ensure
> >>> we prevent more people running into problems that Junjie's fix linked to
> >>
> >> Ran it: this patch on its base-commit, Arch's
> >> config.x86_64 (7.2.4.arch1):
> >>
> >>   olddefconfig, before: no VIDEO_INTEL_CVS line
> >>   olddefconfig, after:  # CONFIG_VIDEO_INTEL_CVS is not set
> >>
> >> The option has no default, so olddefconfig leaves it
> >> off. With the patch, oldconfig prompts for it as (NEW)
> >> and listnewconfig lists it.
> > 
> > Generally drivers are unselected by default and cvs is no exception.
> 
> Yup, sure, but it seems we here due to some oddity (details don't matter
> much) ran into a situation that users perceive as regression (which
> matters a lot).

It was really about this option being hidden by default so you couldn't
even select it. (It's no wonder: I had enabled EXPERT in my own .config,
quite possibly more than 10 years ago, to select things without much
thinking about it!)

> > What I think we could possibly do is to add to cvs Kconfig:
> > 
> > 	default VIDEO_INTEL_IPU6
> > 
> > As the cvs driver is (at least right now) used with ipu6 driver only.
> 
> Due to what I wrote above I'd say: this sounds like a good solution that
> has no significant downsides -- and avoids a problem for everyone that
> manually configures their kernel in the future, which is a good thing,
> too. And we can easily drop the default later if there is a strong need
> (and then likely should add a hint to the help text which other symbols
> are needed in case it doesn't have one already; didn't check)

I can post a patch. I think what also made a difference was that the CVS
chip was in a different menu because it's an I²C device.

-- 
Regards,

Sakari Ailus
