Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56DD1E503D
	for <regressions@lists.linux.dev>; Thu,  9 Oct 2025 11:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760009426; cv=none; b=n8LbREfjgTr0+3UYnD/33rEB5bEz8tpOdCq652ZEvSqnBDXuqYj7fmKLtwQ6uhdYLV3315huxuqYd5zClKQ7lUiTgEBcWeZLhTsdYlwUADSArjtAKmmRSRY17s7DU3Kqmm/OtN9W8VQcc1jNoWrKGN2VX/YH5+GnbcAqIjbDY7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760009426; c=relaxed/simple;
	bh=i6s0VmH+8bNAtKOwgRvOT6eZBVgBLJAjshDeMbqA32M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bsYeeGoJ1w078W1g0Ifheww+WyG3i1ysxYWjGObSFSFUoY6r++tUDb2ICHnG0ZGCQfv14qVTno4kHJRn1IkAktS4zGLqzRtOzcwfT2ZLlpJkvSwNi3/E/YjB/dxqYteVeoClkQR9zwkq6dJPAHPr8+PuP/ASXOIuTge7rGKM82o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jX5FoRSD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jX5FoRSD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760009425; x=1791545425;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=i6s0VmH+8bNAtKOwgRvOT6eZBVgBLJAjshDeMbqA32M=;
  b=jX5FoRSD0seX8moGP/m/AFUzjMUv9k6OxIcoEx01MxPyqKdMYYhgzngJ
   vbYH6VSTCOYDchCVS+uwBzJUk1lhvoiM+Y0+KbODnWqoyH0zNsZupsnol
   hl8OT6zE08UGcTwOEQgsPkRaDhGQdIEsle/PQ7KnsEofRAX+vRubK/Ubj
   Sbcp6ymDKqqHI3r0AFbsHH/tgDIRqUNzSnSPsUwDj72UvIGxluKGLfnCr
   SdxlPbpgeBX8BYrCgqK3cXz3LjB3oxCSTowxgZHs8BlQ8yqD+RWawBmqj
   Z/DV/x4wRWwGn0909PLwJHPwwOKlwNSYLjUvSYdj+DmyUy4NnFbcEYIWo
   Q==;
X-CSE-ConnectionGUID: btgSbnv9RC29kOil0CqIJg==
X-CSE-MsgGUID: LQDFTIo3SAaZNz5Ig7EU7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61252067"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="61252067"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 04:30:24 -0700
X-CSE-ConnectionGUID: LUtkU4aGTEeSi89MJm9KAw==
X-CSE-MsgGUID: JMS9wagmTFmI4Q4zoGGZLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="204407855"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.245.29]) ([10.245.245.29])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 04:30:23 -0700
Message-ID: <90c03eeb-3913-4968-88c0-0de09023a2b5@linux.intel.com>
Date: Thu, 9 Oct 2025 14:30:20 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] [REPRO] USB-A devices not working on boot after
 recent USB merge
To: Michal Pecio <michal.pecio@gmail.com>,
 Arisa Snowbell <arisa.snowbell@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 Niklas Neronin <niklas.neronin@linux.intel.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com>
 <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
 <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
 <20251008082055.5646dadc.michal.pecio@gmail.com>
 <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
 <20251008130532.49922d58.michal.pecio@gmail.com>
 <CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
 <20251008223406.13f16f19.michal.pecio@gmail.com>
 <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
 <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
 <20251009131444.2c221922.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20251009131444.2c221922.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/25 14:14, Michal Pecio wrote:
> On Thu, 9 Oct 2025 00:25:55 +0200, Arisa Snowbell wrote:
>> This is what I get when I use good kernel:
>>
>> kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
>> kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus number 9
>> kernel: xhci_hcd 0000:7a:00.0: USB3 root hub has no ports
>> kernel: xhci_hcd 0000:7a:00.0: hcc params 0x0110ffc5 hci version 0x120
>> quirks 0x0000000200000010
>> kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
>> kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus number 10
>> kernel: xhci_hcd 0000:7a:00.0: Host supports USB 3.0 SuperSpeed
>> kernel: usb usb9: New USB device found, idVendor=1d6b, idProduct=0002,
>> bcdDevice= 6.17
>> kernel: usb usb9: New USB device strings: Mfr=3, Product=2, SerialNumber=1
>> kernel: usb usb9: Product: xHCI Host Controller
>> kernel: usb usb9: Manufacturer: Linux
>> 6.17.0-1-mainline-12298-gf5bd2142c274 xhci-hcd
>> kernel: usb usb9: SerialNumber: 0000:7a:00.0
>> kernel: hub 9-0:1.0: USB hub found
>> kernel: hub 9-0:1.0: 1 port detected
>> kernel: usb usb10: We don't know the algorithms for LPM for this host,
>> disabling LPM.
>> kernel: usb usb10: New USB device found, idVendor=1d6b,
>> idProduct=0003, bcdDevice= 6.17
>> kernel: usb usb10: New USB device strings: Mfr=3, Product=2, SerialNumber=1
>> kernel: usb usb10: Product: xHCI Host Controller
>> kernel: usb usb10: Manufacturer: Linux
>> 6.17.0-1-mainline-12298-gf5bd2142c274 xhci-hcd
>> kernel: usb usb10: SerialNumber: 0000:7a:00.0
>> kernel: hub 10-0:1.0: USB hub found
>> kernel: hub 10-0:1.0: config failed, hub doesn't have any ports! (err -19)
>>
>> where the 2.0 USB's work, mice is powered on, with the bad kernel the
>> mice doesn't even power the LED's on.
>> In the bad kernel its missing the New USB and all.
> 
> Okay, thanks. I now see what's going on.
> 
> I have successfully reproduced it on a normal controller by patching
> the driver to simply ignore any USB3 ports. With this patch, no root
> hubs are registered at all until I revert the "bad" commit.
> 
> In my case it's an idiotic little problem:
> 
> xhci_pci_common_probe()
> {
> 	usb_hcd_pci_probe() {
> 		// allocate xhci
> 		xhci_run(xhci);
> 	}
> 
> 	xhci->allow_single_roothub = 1;
> }
> 
> The thing is that xhci_run() needs allow_single_roothub to already
> be set when it executes, but we can't do it before xhci is allocated.
> And some non-PCI drivers don't want it to be set.
> 

Nice catch,

When that flag isn't set yet in xhci_run() it will lead to
HCD_FLAG_DEFER_RH_REGISTER flag being set, prevent hcd driver from registering
the USB 2.0 roothub before usb 3.0 hcd is added. (which never happens)

Maybe the xhci->allow_single_roothub = 1; flag could be set in xhci_pci_setup()
when called for primary hcd

-Mathias
