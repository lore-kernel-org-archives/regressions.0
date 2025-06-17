Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822FD2DE1F7
	for <regressions@lists.linux.dev>; Tue, 17 Jun 2025 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168265; cv=none; b=MxA29h1jh5KmCxM3XHBT0pAJoB3nBiKcu99qWz7G4qeT9pE88AFH7c5ZLaW5hh60YXDQ3+O/TVpDxfNuYkQYa4B6oPjiMVy31CTTj5OvJfqEgHwmG8TCY+P7mHxiD9nD5GZNqc/mD1aAdu4X0cHwkdG2yHR00mFqWkUcV18Kxpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168265; c=relaxed/simple;
	bh=oblIbLPaqrXVUT3EQc2wh4ZJeO7Rv/Ddz0Kv3NAxSpI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=M56b6RyjDrCB9waAebHAlo1N5IcWFqv7hzYyUWjn6xPZ/ZDykrNU2KwEU/1PG08A4VvbdEpclhNkF9RvhbgyBortVY5AYHHj38x1SenXm1TnckMcJEjXE/N8DzD2uVz2N09agjNtaTMg5bW6MEf4Yftg9e7vBZ/NR3Y0+h5ZfHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5z3hu0T; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5z3hu0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750168263; x=1781704263;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=oblIbLPaqrXVUT3EQc2wh4ZJeO7Rv/Ddz0Kv3NAxSpI=;
  b=d5z3hu0T4+AzzSxgIjvjynu5j3ULkOWkJVddFOLSttJclVwGVEBqmOnj
   ZzB1RwS3mD9/2UyDdDRJEn2WASN+VOZEVPNEW4aYeObShfmmowkdKmz/r
   CLlTmfzaNXSoK/i39bYThWAeqnsRekpgX7aKdhxI+jAj8AGhcOO3Y/IwH
   818Mudnl9cwCoi8jatuyMQZaHM4W08uUALsjSRcgqLPp5+gs2pkWqqlDz
   3MT1ir434cWzDnjn3xsU0YT5GxMfgvCAcKofet+2XUo9ELXqnqkgXcG9J
   QDPBtHeV6dq4Ta6+jlznoAtHvrlRD6aTEPNl2s9jMcD/c9/Q7rpg+FB2x
   A==;
X-CSE-ConnectionGUID: x/tTRJJVSl+SAsa6JwgCrg==
X-CSE-MsgGUID: TcJ5cKFkQLSu0clHwhHNOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="39952663"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="39952663"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 06:51:03 -0700
X-CSE-ConnectionGUID: vlPePXCbSMeJKDhDTdmHVQ==
X-CSE-MsgGUID: UMuJwXBfQzu4kKORQebYCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="149267460"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.111])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 06:51:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Vas Novikov <vasya.novikov@gmail.com>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org, Christian
 Heusel <christian@heusel.eu>
Subject: Re: [REGRESSION][BISECTED] intel iGPU with HDMI PLL stopped working
 at 1080p@120Hz 1efd5384
In-Reply-To: <33046593-17e3-4bdc-9d4a-94dc94ef5e81@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <8d7c7958-9558-4c8a-a81a-e9310f2d8852@gmail.com>
 <afa8a7b2ced71e77655fb54f49b702c71506017d@intel.com>
 <33046593-17e3-4bdc-9d4a-94dc94ef5e81@gmail.com>
Date: Tue, 17 Jun 2025 16:50:57 +0300
Message-ID: <72c9ef36e81ddce8a9e91c5f3652489f5fa2d78d@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 17 Jun 2025, Vas Novikov <vasya.novikov@gmail.com> wrote:
> Hi Jani and everyone,
>
> On 17/06/2025 12.33, Jani Nikula wrote:
>> Does [1] help?
>
> The patch works. (Applied on top of 6.16.0-rc2-1.1-mainline, built by 
> Christian @gromit who helped again.)
>
> The patch (or the new kernel) also have a side effect of xrandr allowing 
> a completely new refresh rate, ~144Hz. This new refresh also seems to 
> work (I cannot easily disambiguate 144 versus 120, but I can tell it's 
> not 60Hz). So as far as my hardware is concerned, this patch leaves the 
> whole system working in all scenarios that I've tested.

Thanks a lot for testing! Ankit will send a v2 of it, and I think we'll
have it in mainline and backported to stable in a few weeks.

There's no need to file that bug report, this will suffice.


BR,
Jani.


-- 
Jani Nikula, Intel
