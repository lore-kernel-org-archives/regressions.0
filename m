Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305135;
	b=yBCa/IDsOTxfyBtfo+GcSkQAakNWoNoJPszcbOE6QLTxSs2ELhGDO/VECY7nZnEPOr6b
	 JbkYBTi3O14+O6c00zw5FxQ9bqTAUK/qVrRbAOSo1MqcZdyZO5mz4169iqKlMvkfjio1L
	 vHZM+FwUNX/cb4KDnTOwD+/i/Qfs49ozU3SzIdWu5mgNbmaDJBp2axjY5DFxupcnwzVwE
	 AsWECe2kG39TEbWPBqBlr8NYTV0tghhhLa0DYkzAjbSmbCMvvuAwyeDNt4NMmN6vjWdzk
	 DME/XrnnUfV78MRPSgupqMKKb7sK1jG1A4KnfYXX5HU3U1ks/axQZdMOpMe5Tvde2ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305135;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/MPk/IHLj9YUuRC4y/TkjBA3QoUZr7IKXlDhn/QLQgA=;
	b=QzCY9esibmbJNm/04/QaYD8OOz2UgRa+NbOqz8IgxiL6pa5MvtwaTaA0LC61/hKE1Kz0
	 pzNUlqtSpjAPn9eDmCSNIeBDGi/10v36jNuj5b/wEc+9hoC4DJivD3Gdnt46FVoyTo389
	 GOBO6sVnYuzwkAlHXP71n7HZHecJ/t5NkDfGoD/wMrDKGiFinBnN8YNCJNlxaZlfNe3pS
	 r4GT9hQLN7u7GKdgft4c7fCM7pJP5SjbUHGvYzd2GGiMoiK2ffQ2JwFHS+A8VWzDZqd2Y
	 ZaMg26mbXz+6G8/yPJkkM/uKpTo5OQTf+bXEsllUpPPYZqagAR9I6zzhacSa6Yll1Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dw3VblbS;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7F7606A321
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 20:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C7F7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dw3VblbS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793305134; x=1824841134;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kbzIDika+tNPlSvqY6hD0ac4vh2Bg/KCRIJ4cCXeQdc=;
  b=Dw3VblbSiUe/Mc+9uZHkVdCLXl64OuDttbLYqqEFbYb3ZrXabzm8P9uK
   wcPqspec0kT/m//wkyw/MoecoiJ8Puf6wXWYe2a6OoQyTSlm/dRxTI97s
   VXbiDtHRKgv04Z7cdbc0TtZHUHc1h0J+gWyl9aZcI2XMe3RYnTCVuMDIc
   TQezwzACZo6ep9KJRIrAmMdAwIM1KNs7Imj/S/sgebugYq2eembKkGRKN
   E0nf1IddeNg6L5cz1L2c3I8l7orM21XnD0fq45b/CcpipIVAGoPZ07GZe
   XmbDbyN0BZE+K5lRSXw6KopLxb8t11jD/YVc7C0xwzVnMDEpREC9UWYYC
   Q==;
X-CSE-ConnectionGUID: nExcne/RSESwYlr5TTHhbQ==
X-CSE-MsgGUID: 0a4KDFHRQMe70bWb5qVpHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1956275"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1956275"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 13:18:53 -0700
X-CSE-ConnectionGUID: ThJ6ZrCqQYOW4z6lBjE5Vw==
X-CSE-MsgGUID: kZTfTnqjScKXkywneg6K9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5601607"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.98]) ([10.245.245.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 13:18:52 -0700
Message-ID: <91a88d42-b814-4dd5-8544-c7f7501c8bc5@linux.intel.com>
Date: Thu, 29 Oct 2026 22:18:42 +0200
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
Subject: Re: [PATCH] xhci: give back TDs and clean up ep0 after disconnect
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 michal.pecio@gmail.com, Yiyu Zhou <yiyu@yiyuzhou.io>,
 Dennis Wissel <dennis@dsine.de>
References: <20261029153910.569577-1-mathias.nyman@linux.intel.com>
 <2026102940-nuptials-stowing-44ee@gregkh>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2026102940-nuptials-stowing-44ee@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 18:18, Greg KH wrote:
> Doesn't apply here, what was this against:
> 
> checking file drivers/usb/host/xhci-ring.c
> Hunk #2 succeeded at 963 (offset 7 lines).
> Hunk #3 FAILED at 1005.
> Hunk #4 succeeded at 1039 (offset 7 lines).
> Hunk #5 succeeded at 1092 (offset 7 lines).
> 1 out of 5 hunks FAILED
> checking file drivers/usb/host/xhci.c
> 
> thanks,

Ah, right, was on top of a couple other patches in my for-usb-linus
branch intended to be sent after rc1.

I'll send v2
Thanks
Mathias

