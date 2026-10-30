Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358343;
	b=KE61G/iDK9eVcA0b1M2U6aq9zU3i0lcU753cbJO/sckwQZdo4Kna30UPq+WWyRDr2RPs
	 BARSutQ8N2hvtwE220NU0esw7OkQngagi/Tovd9w8fhcBgGM/jJ5bxbGxiyOnK2bBCl0z
	 b7561aoBr1l49gz4jLmJucEKdjTOFQwxamugAP8TWaHafRnfcAhwcF3BnwkGpF5dfKG0M
	 8iR2H8nVrpn5BUeei++D0+ia/MuF1EA1g3oe22e8AhlttmXO2rpOrDsSQaVQU+DndTubs
	 aCYqSyJ3m6h0NjSykNBaMRzQwHNYZKut028+0xEUBm2BqLjsNThHHtw6Ys8Whr6ceMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358343;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=agPdL3qf24JsUrVZj63GCPygkTFupZp996BGcl/rBUE=;
	b=ogXA2KNrRMRq3GiyhWAA7viC7fIPdHf4pmfC51w0LSEIJD2xRsLOZGPeBdFnStvXeaJ8
	 iVDU9BzM4I3UeHnWx4kCDm1VNnaMcXX6u/ToBQANQoJgSMi3WRfkzvuCjByhMTRTV77Cw
	 rocB3/Ef5gsLKofst9VtwpGN2deOf6aGCZttIQGF9pk1tjt0HKoJgwtjmJevlAZr4wPCi
	 AlzVR374CdiuhFLroakAYLoqHi+NSJZTVkMW7UBqKQEIywYhasPJyZxkoGoHcCfDy81mC
	 cxCo7sRNp9H5XQWxBFfZY7l/20PprBOpfFblWWRgOSNIQ1ua6d2/wtYXWH0guB9iDoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R9tiDqIo;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9B2606A31A
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 11:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F9B2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R9tiDqIo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793358343; x=1824894343;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RPmCyYVF42T+rjNF3nsLyULwsX3PjwgLJgwv02au+5M=;
  b=R9tiDqIowmnvNWWzoBPu5FuX6m8MZspVUUYgpk/VpCN++TQL4YwoVuwQ
   pOfcmAOXKqGcvpwlbu6nJBYukeVd5LxDAcD4CpHqXwtKQMqBAmESu0txC
   hWi1J3XKXF+6balRveMyFHKfV2uT47FIdK0I/opxFWy5qJvNwRIbU0ktJ
   0TvKbqKZBiA75zoy+EgV4HGRpHqqi0no+RoexfuDdfKF5+0A13vJVn+i9
   qKF3HS699s9q+kRpyk8quLv2L3kiEtIaYWCvoZ+VNKGGLEprbf6qI2KyF
   ovB+M54hbCr0gBaaX3b3lWWuf46hZmX1rygiz7VcbDYnL9HWDg6SBvOZw
   Q==;
X-CSE-ConnectionGUID: NvcBYGw/QJeBfdnEo0GUNQ==
X-CSE-MsgGUID: 78I7Ybm4SxW6DqDSMp+TEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2144576"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2144576"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 04:05:42 -0700
X-CSE-ConnectionGUID: SpbQ9/50R7SLZRuaaqf1Ng==
X-CSE-MsgGUID: NfFiClmeQAmaeA9d/TJJ3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5300912"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.244.25]) ([10.245.244.25])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 04:05:41 -0700
Message-ID: <f362a385-e1d6-437c-a31c-fbf4414fa0f5@linux.intel.com>
Date: Fri, 30 Oct 2026 13:05:16 +0200
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xhci: give back TDs and clean up ep0 after disconnect
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 michal.pecio@gmail.com, Yiyu Zhou <yiyu@yiyuzhou.io>,
 Dennis Wissel <dennis@dsine.de>
References: <20261029204324.658845-1-mathias.nyman@linux.intel.com>
 <20261029204324.658845-2-mathias.nyman@linux.intel.com>
 <2026103009-handful-labored-d1ce@gregkh>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2026103009-handful-labored-d1ce@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 07:22, Greg KH wrote:
> On Thu, Oct 29, 2026 at 10:43:24PM +0200, Mathias Nyman wrote:
>> From: Yiyu Zhou <yiyu@yiyuzhou.io>
>>
>> Fix a regression in v7.3 introduced by the commits in the Fixes tags.
>> Those patches avoid endpoint recovery and rapid state changes after
>> the root port link is lost.
>>
>> This caused a regression in device enumeration.
> 
> I see this patch twice?
> 

My mistake, bash history shows I added the same file twice after git send-email

> And sashiko seems to object to it, is that response correct?
> 

It does find one potential case where this patch does not fix the enumeration
of devices that disconnect during reset.

This patch however is tested and does resolve the two real life regressions
where devices briefly disconnect during enumeration.

There's a risk for more real life regression if I too hastily fix this patch
to cover that sashiko case.

Thanks
Mathias
