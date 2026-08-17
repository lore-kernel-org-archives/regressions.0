Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D656CEEBB
	for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 12:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786971319; cv=none; b=WJnr/o5+maxd3ywedP4kMleyFobUshamRhDPj0Tyuw6nCq0LefIrnvSq+oLvKbit/w6NqHq2zmaQ0sFJHrtlY8IFnXewJrJDxozp/KBhLJnU38cNdVhYrHnn6Nq36eB7mSzBug5PRklM6G28mDHIAxivDs8FpJRQnZ0ptJbbGiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786971319; c=relaxed/simple;
	bh=rtxLFkS2w/V59WhKgWCoLv/lA23Z767AvZR5fYDo9eY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TFZIk+n5teWut2U1HKTl0SliJy9q1b3FzBiIFLSrXP+riaJ9LMzmy2w/ujXBNaQiMQJf9LymZH57lM4RNMGKaCReAFbzkvuOS2iUrZrNTgqJPfe9KyXiteRIxLkrFaIx8XtESelBOVqlP/hlYTe/J9zjMKGJFBVuRxSVHbu/DyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0AKyVVg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0AKyVVg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786971318; x=1818507318;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=rtxLFkS2w/V59WhKgWCoLv/lA23Z767AvZR5fYDo9eY=;
  b=G0AKyVVgy4wzSgt8flwEF9119rJpxrZlpd6p0etpH8+MLwWwjF+SoGwq
   tYebxLX6jAIgxA/hz6BYiSWxLqbINwRTzPjtUuq8gm2Sz8+JRWlGhuKqh
   1q1JV7UQSsIDW0ImlClURTIcThzT5o+CMl6gC+0bHwUnOQmrTVcE3vNVW
   iODcTrDGmZ+Je9pft+GMsBpPt1fABKjqCQnxkmj9XMvcUyIntB0pMrAsC
   mLsCwwf9astLe36Uamx+TTPFOMGt1I1deX94ZqvUj9JgkgMdnJBeoliS9
   MFRQFSkoVcNdtirHnDeyCUAbnNg8uktyc5CtpPzMI2kAU0gtUQtaWhuml
   g==;
X-CSE-ConnectionGUID: Y3Uoe42dTDOhZAVM/S28yg==
X-CSE-MsgGUID: A70NyuyFSY6qMqaZq6e2Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91123222"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="91123222"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 05:55:18 -0700
X-CSE-ConnectionGUID: jEkqh0kSSSKbfTK39PV8Vw==
X-CSE-MsgGUID: hJg2Pr2lSzO4bJJmu3QWhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="266890224"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.110])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 05:55:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: nomorsukses@gmail.com, regressions@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [REGRESSION] Dell Latitude 7390 Intel UHD Graphics 620 display
 becomes extremely dim after kernel 7.x upgrade
In-Reply-To: <CABHf4aQC__rWLKUJ5XgkCEdzC0dr1TGH1WP=UxOu3JmmU9VjLw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <CABHf4aQC__rWLKUJ5XgkCEdzC0dr1TGH1WP=UxOu3JmmU9VjLw@mail.gmail.com>
Date: Mon, 17 Aug 2026 15:55:13 +0300
Message-ID: <c37c2d2f7f77f488867e278e412a92cc0e7ad851@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 06 Aug 2026, "nomorsukses@gmail.com" <nomorsukses@gmail.com> wrote:
> I would like to report a possible kernel regression affecting the
> internal display brightness on my Dell Latitude 7390.

Please file a bug as described at [1].

BR,
Jani.

[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html



-- 
Jani Nikula, Intel
