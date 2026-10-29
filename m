Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282882;
	b=0vzwOd4AKbUESs+4buXymzjBTNYhr9g75jHlDnxiHh5zVsDGIPEC9BDuCo0Z8L7LKy4i
	 hN2JkM722MZNxCTtlS9ujcJ5JKWsX3E1x+WALzuIMfgx+Y2c/0I6L56jOcs0ABK628mEr
	 TtTUmz17bdEw6c6TzjtG72ZubQjNB350tLDZiFPng6q5h3O1nk6hdJvzXwWVVa/CcIau6
	 IlpqTj3vYp4dgaqFHGCK3h8R8+ToE4sBwoYRWPC6j6ZPVKzGSih8FFWdY9phGCxyRFANz
	 kiVSMkOPgtmwgWe1W35SvUg6JQM5hKt1Sz9vO4wWOuN4jAKCxLglzZBdO+IhAt2We3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282882;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=C330faUMVQYWDsmJ7Xs/DHKfTAQZ6LHZarNknK5QYyA=;
	b=yO9oFRVw+31SynlAvmcM7Dc3ISIUkFNZ4SQBMSMjV7baEy3ACnQO3ZwYoYg5a/ySD7EQ
	 dMZ0UCfD5orUwzmv1QM0G0U4FLLXDwofEpz+7yijP0lgNIyT+pIgvQ7fhHhqBxQ51+sDG
	 2gvUTw7cWFQOavfQxfTsOan7m+OU35fliEdSSkbTgywfpzhxg3DLuSk3784AC+i1gn4mx
	 wITF6s8NTCIGxDGsgszrEAbvweiDX9sRFuhdR34guh0XMEu0lcixHM0ZffnUxPuX6QAFD
	 vL4swjNSLuhUEKSxI/upORJ2IJ08h73/e7YZRTwyxz9naGARfKlOPihJdV/WZ3mowUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b6eR0MYs;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832A8606A323
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 14:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 832A8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b6eR0MYs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793282882; x=1824818882;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/gqe+sm+TBrqyhK9J782q/IEenkXHaGv93TeDfQK5hc=;
  b=b6eR0MYsBeZTfZK1YMSSilV20LBxXxQ6Ef3DdB2yxdHMBZYNSs7hI3Ne
   rv2cL7i6HO++kY8AMx6cqVK6hX4kjoGviYSs9cZeTq0x5bc5x+Mxr0gwU
   6saAPLOSvyoaX4hsGO2C4G/QP18+bUcAQhizhDK0srfsLsTtAr3Fu7cal
   65VwEfWEPocQ+l2E2/i3m8aN3PKozsV66PGykt6+Lq1ov28IfJverob/7
   hWctUluR5mnrN/ApqKFwonGKQV45UCVzFfLmruV5GdoiMeu6FJQY3JOSq
   7vIjDaUUiiArbXaOatxs1j1cJysRywxet8NPxE5Jh+pigyCd7nfQuI8ib
   g==;
X-CSE-ConnectionGUID: UrffFtjbR8SMkmSsi9QxbQ==
X-CSE-MsgGUID: IUiufyEfSouoQ4DQ4nJedw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2043099"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2043099"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:07:56 -0700
X-CSE-ConnectionGUID: NdwFWgNqRp+Qbujq2OFopA==
X-CSE-MsgGUID: 2HTsb7JsTrun9ClvMZzYUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5087999"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.98]) ([10.245.245.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:07:53 -0700
Message-ID: <93b6fb27-1300-4dcb-971e-0ec33b58539a@linux.intel.com>
Date: Thu, 29 Oct 2026 16:07:51 +0200
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
Subject: Re: [RFT PATCH 0/2] xhci: clean up endpoint rings after disconnect
 detect
To: Dennis Wissel <dennis@dsine.de>, yiyu@yiyuzhou.io
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 diogochaves@me.com, michal.pecio@gmail.com, raoxu@uniontech.com,
 gregkh@linuxfoundation.org
References: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
 <20261027192128.386082-1-mathias.nyman@linux.intel.com>
 <oKoY8F_0Rv-eBKI0YHyHcQ@dsine.de>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <oKoY8F_0Rv-eBKI0YHyHcQ@dsine.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> 
> In neither boot are there "not part of TD" messages or any stall (with
> 1f36cc9fa949 alone, hub_wq stalled from 4.97 s to 16 s). initrd takes
> 2.9-3.0 s, the same as v7.2.11.
> 
> One observation, probably not xhci related: in boot 2, interfaces 2
> and 3 failed their probe before the reset ("reading report descriptor
> failed") and stay unbound after the in-place reset, until the mouse is
> replugged. On v7.2 the device was re-enumerated instead, so all four
> interfaces ended up bound.
> 
> Tested-by: Dennis Wissel <dennis@dsine.de>
> 

Thanks for testing.

-Mathias


