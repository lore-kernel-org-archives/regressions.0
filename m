Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B53F289E1A
	for <regressions@lists.linux.dev>; Wed,  7 May 2025 15:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746631891; cv=none; b=PNpUsW1v/hCH3vpdRdJGs62/mTI5/8V3QxYC2YFVaeVjAdShC+lXKK93r3LRI3eFjR1r3JrSEvi1UnC3mUGXzn9DLXOqma6E8ztuW9La9lwh0lu7XWe0XiddGP1XH3bzfz6UHsiDB4AnE7CWcYkDQ3ERcKj1wqfl6R4KBjaREV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746631891; c=relaxed/simple;
	bh=Qr4AnBYW987xgEuMwPW0O8SNkjOdYyDH7+SBKrD5wjE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q4h8qLioElmOXXelldEYfCspvV/5FHW666WESYkU7+Hhxp0ktEIUgctqkmFO957B7FUD6eRMpZnCs1sJ7CdVHPYXcqO1MEqtVB7HssdYjfgVK+0ZqiEWVy8Y+/xSwf/iw8VOQtYaC9qcGOnZnelHrO8j8DBMT5YgdjsCbpKKW2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aABZNlEN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aABZNlEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746631890; x=1778167890;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Qr4AnBYW987xgEuMwPW0O8SNkjOdYyDH7+SBKrD5wjE=;
  b=aABZNlENvDuqQYn0cOK3foq+HiXlEDGMzBB1BCTbArmG+0kOy8gWAT3W
   VMK/lUjCm77ZSeNZSU9tCOTznTSSwlgxDjdN5wpzeeq88prTBnwFnm5bs
   /HkH6al1SRMWixhtv2GY6CB9yjxibEe5fbH3BusSCi56OTflXaurWMrcD
   kXYfZNRp9uiZ5TAnvCRpE+0ggc0Kvy0MllAF81+/znuI9c++QeHDpwhZW
   Ru2yKEqIz/A04aHmIKzEr7wyetSNstmBCVYgcXDQWRHUYfAWlZdHZhjfZ
   gBMrqHHNjV4GIImWAvdT43AGohKqSygSYgWcwLgRJ9dTshQOLAiI85YeB
   A==;
X-CSE-ConnectionGUID: +Bf1H/2rRvm4oo2Be+xY8g==
X-CSE-MsgGUID: gNT/EAlYREqvKyaFn2sA6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52188184"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="52188184"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:31:29 -0700
X-CSE-ConnectionGUID: wY3QIsuRTmiKchM34BGM6g==
X-CSE-MsgGUID: Z9gJ6xe4TcmZRIETVIq+8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136509152"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.218])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:31:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "Hall, Christopher S"
 <christopher.s.hall@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Keller,
 Jacob E" <jacob.e.keller@intel.com>, "intel-wired-lan@lists.osuosl.org"
 <intel-wired-lan@lists.osuosl.org>, "Saarinen, Jani"
 <jani.saarinen@intel.com>, "Kurmi, Suresh Kumar"
 <suresh.kumar.kurmi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, regressions@lists.linux.dev, "Linux regression
 tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Subject: Re: [Intel-wired-lan] [REGRESSION] v6.15-rc3: 1a931c4f5e68 ("igc:
 add lock preventing multiple simultaneous PTM transactions")
In-Reply-To: <2cc74d66-9bd7-4876-a17d-c71f03910c4d@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <SJ1PR11MB6129BBB9E38F6DB731604E94B9812@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <87cycnwcpn.fsf@intel.com>
 <2cc74d66-9bd7-4876-a17d-c71f03910c4d@intel.com>
Date: Wed, 07 May 2025 18:31:21 +0300
Message-ID: <87a57ov3na.fsf@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 06 May 2025, Tony Nguyen <anthony.l.nguyen@intel.com> wrote:
> On 5/5/2025 3:53 AM, Jani Nikula wrote:
>> On Mon, 28 Apr 2025, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:
>>> Hello Christopher,
>>>
>>> This mail is regarding a regression we are seeing in our CI runs[1] on drm-tip[2] repository.
>> 
>> The regressing commit is in v6.15-rc3. Updated subject and Cc'd
>> regression tracking.
>> 
>> BR,
>> Jani.
>
> Hi Jani,
>
> This should be resolved with commit c7d6cb96d5c3 ("igc: fix lock order 
> in igc_ptp_reset") in v6.15-rc5.

Thanks for the follow-up.

BR,
Jani.


-- 
Jani Nikula, Intel
