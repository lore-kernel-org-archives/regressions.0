Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006320;
	b=3aWhW4Q2TclSeftSlzKn4GofjdENc21GAQpNBdgFQCwiEEFOSiiQFeHnB8qZxvZ3NqrB
	 nHptUm/k7DXJvRsH63kNeVn9K4zYbtcrSPVGrYuD+WxnLjH1R+4PwRktdpL9MD8GxzaqT
	 2AQ/KZnVFRIoRCjdkfLTw5s8Ng65MS6VitX5fOa9yxSjtWj7cZTIBr/UqenaPDJG/hHKz
	 Pmh39FP7CX/vAchpiOvyYJMQ3RrRRTHkB1kfftHAIwubnyOSAZFKKJaoBfLB7yfDLgTJd
	 5qiB4ct5622qVJ99c9JwTW6fMcMFcHe7O00O3ZVqf6hR8EYmNwraBZ5ITvAFeHp/LBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006320;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4TNG55E0oUtd9l6OcjW1QlWIeZy68AdXCcINd3sCBk8=;
	b=ByxmEkf2t7nWmuSG2QUdNnVJAjaulDu4Ltli8b5r0A0Szi17QyOzvjg1Qx/xo9WJaou/
	 KCUrYPkmfEToU9IdsFSvh/7mW06uTKd0tKMiQRsFV+6y9CYLIcQhgamwSdEH/Gq6MGhJe
	 wwz3CKmp7PrNztwYSeLGLpH9TdZ3jSF6HcxTXQzbcCmejo1k7CU+36O+xfXPJjLBfVVBg
	 Xl0/0g+AvJYLE1ZWo4HonLnMf82/IyPtEI/v0I4IcCHMr1AwZYslVzn2DYZ2XJrarZdX+
	 VYVfI3fp8v8ry7QlAB56SQB4+dNQOqoo1ehxw3Et5wyZXGWeI0D+OQ3fgvnKafs2azw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="e/WiaY3P";
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED87606A31B
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 09:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED87606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e/WiaY3P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793006320; x=1824542320;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QSQ42AHAfA6i1rzIQPc1CjZr3BcCOEbxFhoogGK7cQQ=;
  b=e/WiaY3PjKChyfzGiQLY3fRO0KL+VuIAf72pa9r05PsnnjvLf3cG2wTN
   ZzudJpIZrgEVTVJUILxda88NBhD9QK6PFaAZwMXcl6Uahi2M+EsxGDjyI
   i1DDXoelPiLnDcReUmOhd6QOzqzSWLX1XOVhRldW8FZ9vxbaPdeHLXWiC
   P+Ly3KO1lDvOagPa7u0H/e3FsBfQ/VEwFmW9CooOZzi2nn96O42JvDKl5
   QeuGPRg26l0pRK09lVuviw/kKWGnD1pjK8vmrq/2vZ1DVnB8mVcfXhoQg
   Og/6/ndS8wMkaM5bjOKN0RIOXBTc2VktDD60ok1vZz1daGT5tDz4b3UwV
   g==;
X-CSE-ConnectionGUID: EjaPPwmiQe6bKxnS1GO+Qg==
X-CSE-MsgGUID: WysDN4YsR/KtN6maUtAdLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1560648"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1560648"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:18:39 -0700
X-CSE-ConnectionGUID: 5v41M3BnSgi+8LCPzWsCaQ==
X-CSE-MsgGUID: B+5F9+/xRdeO5WU7f+c0sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="5970034"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.245.74]) ([10.245.245.74])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:18:37 -0700
Message-ID: <7082e2e7-8d05-46b8-a26b-5b888a7a0545@linux.intel.com>
Date: Mon, 26 Oct 2026 11:18:34 +0200
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
To: Michal Pecio <michal.pecio@gmail.com>, Dennis Wissel <dennis@dsine.de>
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
 <20261024203558.3181711-1-yiyu@yiyuzhou.io> <SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
 <20261025111410.2c14fcef.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20261025111410.2c14fcef.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/26 12:14, Michal Pecio wrote:
> Hi,
> 
> On Sun, 25 Oct 2026 01:10:27 +0200, Dennis Wissel wrote:
>> On Sat, 24 Oct 2026 13:34:07 -0700, Yiyu Zhou wrote:
>>> The fix is queued in Mathias's for-usb-linus branch as 1f36cc9fa949
>>> ("xhci: give back all TDs when skipping endpoint reset after
>>> disconnect") and applies cleanly to v7.3:
>> [...]
>>> Could you test it?  If it fixes your case, please reply here so that
>>> Mathias can add your Tested-by.  If it does not, reverting
>>> 042aad8d0db6 and 7e0ef4332ed9 on v7.3 would show whether these
>>> commits are involved.
>>
>> Thanks, I tested both on top of 7.3.0-4-cachyos, booting with the
>> mouse plugged in each time.
>>
>> 1) With 1f36cc9fa949: much better, but not completely fixed.
>>
>> No reset loop anymore. After one disconnect and re-enumeration all four
>> interfaces bind, and both the mouse and the NuPhy keyboard work.
>> Before, the boot took about 3 minutes and both were dead.
>>
>> But hub_wq still stalls for about 11 s after the first reset of the
>> mouse. Other devices on the same controller (1-9.2, 1-14) are only
>> enumerated after that. Just before the disconnect is handled, xhci
>> prints three "not part of TD" messages for ep 0:
>>
>> [    3.509460] usb 1-1: new full-speed USB device number 2 using xhci_hcd
>> [    3.510626] hid-generic 0003:3434:D068.0001: input,hidraw0: USB HID v1.11 Mouse [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input0
>> [    3.510772] hid-generic 0003:3434:D068.0002: input,hidraw1: USB HID v1.11 Keyboard [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input1
>> [    4.973074] usb 1-1: reset full-speed USB device number 2 using xhci_hcd
>> (nothing on the bus for 11 s)
>> [   15.970122] xhci_hcd 0000:00:14.0: Event dma 0x0000000104205260 for ep 0 status 1 not part of TD at 00000001042052d0 - 00000001042052f0
>> [   15.970767] xhci_hcd 0000:00:14.0: Event dma 0x0000000104205280 for ep 0 status 13 not part of TD at 00000001042052d0 - 00000001042052f0
>> [   15.971131] xhci_hcd 0000:00:14.0: Event dma 0x0000000104205290 for ep 0 status 1 not part of TD at 00000001042052d0 - 00000001042052f0
> 
> That's not good, your HC seems to be executing stale URBs, probably
> from before the device was reset. I suspect we reuse the default pipe
> without recovering it from the broken state left by EP_DROP_PENDING.
> (Such bug may have existed since forever, but only in USB3 and cases
> which seldom or never happen. 7.3 generalized it to more cases.)
> 
> But is USB core really resetting a device for which the hub has
> reported disconnection? Something isn't as I would expect.

I suspect udev, xhci virt_dev, and thus xhci ep0 ring stays intact even if device
has a short disconnect during reset/enumeration.

So even if we give back all pending URBs and clear the EP_DROP_PENDING flag we
continue using the stale ring. We should either either move dequeue pointer,
set TRBs to no-op, or clear and reinitialize whole ep0 ring at device reset.

-Mathias

