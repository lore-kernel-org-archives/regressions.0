Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF413CA52
	for <regressions@lists.linux.dev>; Sat, 18 Oct 2025 19:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760816107; cv=none; b=PD9nQFoYbhvv/RLcucpUPfCfy1dkhtqO2QFhGqkYxh9y6VQD9HErmcDt6VPuFBTPSH5Pbr62C2W+XFCocWmK6Vyjz1OsHTs6g6gXolZ7AylDD4X26TLNOtRqJVn5BFtt9AP+12pvIzZKRLwWw9j/J3JW4RiR81c95NNl+l8G7aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760816107; c=relaxed/simple;
	bh=VMuYQstmRoCQLSHxXuDemKBVDyJvOfvpY44SHdocNOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QkSJBcpefrXt7EYf3r9YsSZvHP73IsUhzWUexDvWGnxiw3QrAXIqpOm8kWNTAFWdaiyF2yWmXcMmoQsrNgaFctEHCFnUYaaI6O4m3T31x07u1U1GLbxBcXchsJpKSElNocSM5lnzDUdoY+5VXYnv15VrxY902nP2HPTBhyMWqi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SyhwTri7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SyhwTri7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760816106; x=1792352106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VMuYQstmRoCQLSHxXuDemKBVDyJvOfvpY44SHdocNOQ=;
  b=SyhwTri7wPbp8ObOl858ezsE7U27Bl8cj5sU1lteIIxBczxa6FWElpC7
   ySjr0tz8gZP2tj5ZetjHOHj2RWjPsirILtzBsrheTd7zSW7Gh7kP15IQt
   YUUOZozvQUzs7fpUCydEuAMri7wTHaoKcxDk2yIKMR1rp1qGWLIRdSEj9
   q6fEHV35Z5byTEXBLD4lL7CSRM7RU7oFfubn8mvKQ7W6pFqKHWuCGl0sW
   S7ZhuUNmbgQy1b4q2jwZl6WXWUmukgDpAWiqZMe32R/OVglMYg5pc6Fyc
   rRI7bIBBzp8O3sDAceLofrxV+cz2r2VSaUNXdmoV6T7QxnBZ3FAYZfbWS
   Q==;
X-CSE-ConnectionGUID: 7kvbU/PTTsOWn5K7EQjNDA==
X-CSE-MsgGUID: E/SDKBpTQgGpyf/uapCK0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73672915"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="73672915"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 12:35:04 -0700
X-CSE-ConnectionGUID: 7nOrqJbhSuyNk3wcgrGmQw==
X-CSE-MsgGUID: 9twOXuV2Q/WnVdmRrUj23g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="182952090"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.194])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 12:35:02 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vAChf-00000000xbz-3CH9;
	Sat, 18 Oct 2025 22:34:59 +0300
Date: Sat, 18 Oct 2025 22:34:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Thomas Richard <thomas.richard@bootlin.com>, rafael@kernel.org,
	regressions@lists.linux.dev, lenb@kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	apatel@ventanamicro.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Daniele Cleri <DanieleCleri@aaeon.eu>
Subject: Re: [REGRESSION] in 6.18-rc1, failed to query a GPIO using a name in
 ACPI
Message-ID: <aPPr42qP-NEmGO5v@ashevche-desk.local>
References: <c321423b-3cdb-41a5-9939-dc5c846cfcd4@bootlin.com>
 <aPFwPR2A0CN6k1Vl@sunil-laptop>
 <1241f2b6-9b4e-4623-8a83-77db8774ac32@bootlin.com>
 <aPIUMoDxW-yl2nPm@sunil-laptop>
 <aPPnC6gSP4r46gBV@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPPnC6gSP4r46gBV@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Oct 18, 2025 at 10:14:19PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 17, 2025 at 03:32:26PM +0530, Sunil V L wrote:
> > On Fri, Oct 17, 2025 at 10:50:05AM +0200, Thomas Richard wrote:

Seems I have had an issue with my email, and everything is now fine.

> > I'll send out the patch shortly and include your Tested-by tag.
> > 
> > Apologies for the earlier issue, and thank you for your help.
> 
> I haven't received anything. Have you sent anything? Am I Cc'ed?

-- 
With Best Regards,
Andy Shevchenko


