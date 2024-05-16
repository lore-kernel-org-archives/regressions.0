Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCBA19BA6
	for <regressions@lists.linux.dev>; Thu, 16 May 2024 07:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715843004; cv=none; b=qCrGSeoKOWRtBkRUvTZq20nDKORZn7aLyNt8LEnlziMmOpEzxf/gDr/VwzJPNIoUEG1PokH0jhL+eNkjRfD4mPpV+qCyvMeCSt8nq7DBgsGyCO1YjmypISVaIfjimfacFFHWCYMEIYa/UyHr/UbmplBwhyS/e5sFpE5L+ise28o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715843004; c=relaxed/simple;
	bh=+/dHCk2+/e+u3IYcLkP466CAIjDYqJ2ulQ+tRU+hsBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kV2GImAHWxcXPFpwVSDpmyv1gcuMTD1R3aRr9mvNZZs/+cDOydEIZM/E25oAQXNZP5UX805K54aV048H33ioI0njDcR5KIlon0C6lFwl6/S/UbLYmSTg3qv4rOHG7IcZUIS/AjXcBXEWm5ACeEyz5utS/uZu6bytOl/zLpVJdVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZc1Srpw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZc1Srpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715843003; x=1747379003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+/dHCk2+/e+u3IYcLkP466CAIjDYqJ2ulQ+tRU+hsBg=;
  b=iZc1SrpwfsHdNiGtiG2C/VNleWdNA+HoDjmDz1flBjSZUpWgp+9s0pZG
   1M/u6StUBLEgRpI090T6c8QkdTNT53l57wFBb6bMw83HvRf0P/OX+44Tj
   YO1gigUzJV2OcfIrkagF7ba5Lpf8lBl7XmI2FvGMs4BxqZ5aNbXv8ULpz
   TwSZ4pvWGL/7He/K+QytmgoO/DtziChspC/934bQXIGiwVs2BGwXr+s6y
   JLrAmaOR51yvue4oTRK7OPSRY7gnU4AF8r9dM9Lqa6JPhTzRDIofsCa6p
   FTK0BZHg4HO3GsgfnJVhDHwoJFyycUQlfWDAnrSGIzu4v4AoDqCwlzlcr
   w==;
X-CSE-ConnectionGUID: ruyLpW5hS/+z7awK3PGyxw==
X-CSE-MsgGUID: QuissoBvSX2ms8NgEdUEhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29430513"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="29430513"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 00:03:23 -0700
X-CSE-ConnectionGUID: 0ELDhARxTkWZf9KkB3h9LQ==
X-CSE-MsgGUID: uKCOrT1lTpqHz4ociGgnSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="62163266"
Received: from josephjo-mobl1.amr.corp.intel.com (HELO desk) ([10.212.146.49])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 00:03:23 -0700
Date: Thu, 16 May 2024 00:03:15 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>
Subject: Re: [regression] suspend stress test stalls within 30 minutes
Message-ID: <20240516070315.swz2golcrfp3uvfd@desk>
References: <20240511184847.GCZj-9j2sh1Akpt9iS@fat_crate.local>
 <20240511184945.GDZj-9yaOEWqf1ng8u@fat_crate.local>
 <87h6f4jdrq.fsf@kernel.org>
 <878r0djxgc.fsf@kernel.org>
 <874jb0jzx5.fsf@kernel.org>
 <feaefaae-e25b-4a48-b6be-e20054f2c8df@intel.com>
 <20240515072231.z3wlyoblyc34ldmr@desk>
 <529C9374-DA6F-49C8-9B32-91741800F8E4@alien8.de>
 <20240515162747.6shmaoelc4mt7nro@desk>
 <878r0bhvjq.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878r0bhvjq.fsf@kernel.org>

On Wed, May 15, 2024 at 07:47:05PM +0300, Kalle Valo wrote:
> Pawan Gupta <pawan.kumar.gupta@linux.intel.com> writes:
> 
> > On Wed, May 15, 2024 at 09:44:42AM +0200, Borislav Petkov wrote:
> >> On May 15, 2024 9:22:31 AM GMT+02:00, Pawan Gupta <pawan.kumar.gupta@linux.intel.com> wrote:
> >> > Other interesting thing to try is cmdline
> >> >"dis_ucode_ldr".
> >> 
> >> Right, is his microcode revision 0xf4 the right one for that model?
> >
> > 0xf4 microcode is not the latest one, the latest is 0xf8:
> >
> > https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/blob/main/intel-ucode/06-9e-09
> >
> > Kalle, can you please try with 0xf8 and see if the issue is still present?
> 
> I can't test right now but I'll try to find time later this week, I will
> also reply to other emails then.

After switching to a different machine (same model/stepping as yours) I am
able to boot with the config you shared. Also changed the microcode to 0xf4
so as to match your setup. I am running the suspend test now and will
update in the morning if I could reproduce the hang.
