Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006923;
	b=RvvL5x9/hIcRgZjHkA/4Qzh36neSKYxoRot4ynpTa/xhV4kdLWTA4KQVQOEEnBfNk82e
	 J62PM322cTZ4uJD0OuzW4ZsVnk4+M68IPJzyN3MDByzISPSeEfnGZQOCmvfw357Rm5VRi
	 HSkI9pi7DRWaWlNjgGtyazLKovLLAmbvWKUH3lmx17fFM99bMT+ixQCv0+5R2zHaPeuP5
	 0Sm6X2pC+2SitDR5gyiOsMmWjNlfRcK8Yn6rqhCVvInOwEMigwyV6pUSaphMk2EIKObah
	 hIiw15cMTevb1HHGUQ7cIvTD6AhaYcm6t6qdRMt+W6tCxnaVtZNow5tOU+Yf18e/kVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006923;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=xfM14qyyYOsETWTXFtAXsI9547kmF4hdeeM9jojIwAg=;
	b=ISm0hfXdNYNFHOxxC3Brd5PWPBGfMPQM0qPpoCAif0BtY7fI0q24hBGvuo0ayulP6rgC
	 OiJL2fH19Tw8BYB6smxN5+kvhbZGLdXGi2QtvWespH/BNQcq269dlKp30dzz2aicugr8N
	 hT0NuFqlVEvO9UL3rfBaSIbM2ELJw49YkNfY9Km9FYsiBvfOEqpPKSnZtCg1K8hTdSKFt
	 7Bq3x3ycD2EWsLyEasqe3mXB7cFsnqiHzORlsDBXoIlZW4i+/dVRGxlNmDosq0yUEM1V8
	 /yxKrGNlpLTj/w8QNCMZpx/1IGsQBiGT+YvV9IL66pyGXZkB64iCNYmhSat4L7trvxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DX2UaVZv;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164E3606A324
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 09:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 164E3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DX2UaVZv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793006924; x=1824542924;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9fkHPIc+1KN583Ow9wc8L4fad9onzvdBxdzVySj/pow=;
  b=DX2UaVZvwswcdg2YOvsOBctW7kDrvGhCrJTfDrJqqWB0pS3rdU48xhH7
   VS2EvP7bT0AfCO8o/ibqWnqFegYHxNEDb53JI1Q8UuGwscKqvwR4xju4V
   Mf1vkGS0X8Cu1bKuvmi+bIoPCSoRpP81UIe5W0rsc0RlcmOJD1sGHLSiu
   sihfGoPDrOcmsZZyM4Ao0ygWQ7hm1NpEbyDGj/HnuNxrB7Fgbi1OCck8R
   8qVyGVt1tlfaDUKNFKW8Pmbe+Yoz8qsfLs7t/SsQPbyPOlPBPcX28L9OQ
   FRKo2tjQkKdlLEerORG6Woskssf3rGrGi3YnF2d6XHgT9UU65XRM9sVIi
   Q==;
X-CSE-ConnectionGUID: 2nn3RUo4RWGRJXg9b31Q2g==
X-CSE-MsgGUID: OqCIrrnZS3iuFkNNjPXGxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1561474"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1561474"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:28:43 -0700
X-CSE-ConnectionGUID: Xnoou489T/KiLpxGKexBuw==
X-CSE-MsgGUID: yKs5tsntSZOwGJycLbiqVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="5971455"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.245.74]) ([10.245.245.74])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:28:40 -0700
Message-ID: <a174538e-7c7f-4905-8aa5-f906e6664f4a@linux.intel.com>
Date: Mon, 26 Oct 2026 11:28:37 +0200
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
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5
 (3434:d068) at boot since v7.3
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Dennis Wissel <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 Greg KH <gregkh@linuxfoundation.org>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
 <20261024203558.3181711-1-yiyu@yiyuzhou.io> <SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
 <c8a3ffeb-8737-46d2-b01b-5ed9bc96012f@leemhuis.info>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <c8a3ffeb-8737-46d2-b01b-5ed9bc96012f@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/26 10:59, Thorsten Leemhuis wrote:
> On 10/25/26 01:10, Dennis Wissel wrote:
>> On Sat, 24 Oct 2026 13:34:07 -0700, Yiyu Zhou wrote:
>>> The fix is queued in Mathias's for-usb-linus branch as 1f36cc9fa949
>>> ("xhci: give back all TDs when skipping endpoint reset after
>>> disconnect") and applies cleanly to v7.3:
>> [...]
>>> Could you test it?  If it fixes your case, please reply here so that
>>> Mathias can add your Tested-by.  If it does not, reverting 042aad8d0db6
>>> and 7e0ef4332ed9 on v7.3 would show whether these commits are involved.
>>
>> Thanks, I tested both on top of 7.3.0-4-cachyos, booting with the mouse
>> plugged in each time.
>>
>> 1) With 1f36cc9fa949: much better, but not completely fixed.
> 
> This btw is the third report about problems that that "xhci: give back
> all TDs when skipping endpoint reset after disconnect" fixes; the first
> was what lead to the fix, the second was:
> https://lore.kernel.org/linux-usb/20261023190104.113331-1-diogochaves@me.com/
> 
> So it sounds like this is something we should mainline rather sooner
> than later (ideally with a stable tag to ensure it's backported).
> Mathias could you make that happen? If you are busy and need help, just
> say so.

That fix isn't enough, we need to fix it properly.

7.3 where the issue exists is already out, so that is too late.

What is the policy here?
Should we try to shoehorn regression fixes into rc1 during merge window,
or wait until rc1 is out?

Thanks
Mathias
