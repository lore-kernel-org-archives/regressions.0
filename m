Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AE717A30A
	for <regressions@lists.linux.dev>; Thu,  9 Oct 2025 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760008559; cv=none; b=l6E1CmzHiuGp1S7GBxroCYwMupmLorFTnQ9sepI5+sTt+x0o5yV5gjldlY0GTUmmJl+3cEsfIbcDjAGRiQlGewx7QXueviB9LT7WZE+Lpc5HEaDAC4+fnpa4Hg8GjA07z8IfO+8Nw3byMjii+WQDK8kIpKzubfU+HdzGNEuTHSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760008559; c=relaxed/simple;
	bh=1qY+HFt0IrcDMb1KAu9jnfmWyI/NKSRbjNLdurhBdgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RtnrdC7poEXNwzqn+Day89DeOjBn4u/afRe46I7oiv7L8/xW146XpsgJO0OeCD/vlC6P+cMtrUWeiBsxk1J0tQxo3XsU10/RQCuJJhs2JtWiXhI2blsYwrAaqUPIBmsITbyFHVIZa4hKFvgHuq/P++Eo3pR1ew7fBrPTEMpd34o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xl2Pq6tg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xl2Pq6tg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760008557; x=1791544557;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1qY+HFt0IrcDMb1KAu9jnfmWyI/NKSRbjNLdurhBdgo=;
  b=Xl2Pq6tg5qTSpCsHf+soKLe7gWJZuqeRtOGPx2B2fFYKgIhYjmH2dN7K
   bmsbnI25MKZSozx7NDHm3OmPyNOUjot8mJcP4zOtRKeE3yyVH7Vt8Xrzo
   v8tX1mUsA1tM/IdFDzM2mWhKt7B3PKgvQ0u9ewLRj3EciO06qoLsUnV+u
   rp6iCfkJgViwBk2gHJBuQuvHk/PS/rx4rMqmVglDWGS0Dbm4qBRPaMm0t
   sikrcH883p3C8korr/yHSdToqOVmwr4b5Vh/Y9ZYq7FU1FOKMh0ZqbCwM
   c1pV7E3jQRYih8Z7BvvCBPxHkmF4ATw8CGUmA/xBmTt2FTJKMMELV7aaM
   w==;
X-CSE-ConnectionGUID: s2x0JG57TvSmJpkriYGl7w==
X-CSE-MsgGUID: PuQ/+Vb7SeCrW/1lp/cBgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62247553"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="62247553"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 04:15:57 -0700
X-CSE-ConnectionGUID: A1LC4ztoRWy8T99VS3lbHg==
X-CSE-MsgGUID: Mh6/7Tt8Tr2VZeFp7kxC2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="181097502"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.245.29]) ([10.245.245.29])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 04:15:56 -0700
Message-ID: <55ef9577-9d59-4339-bad3-7fb2e0c45eb8@linux.intel.com>
Date: Thu, 9 Oct 2025 14:15:44 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB
 merge
To: Arisa Snowbell <arisa.snowbell@gmail.com>,
 Michal Pecio <michal.pecio@gmail.com>
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
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi  Arisa

On 10/9/25 01:25, Arisa Snowbell wrote:
> This is what I get when I use good kernel:
> 
> kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
> kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus number 9
> kernel: xhci_hcd 0000:7a:00.0: USB3 root hub has no ports
> kernel: xhci_hcd 0000:7a:00.0: hcc params 0x0110ffc5 hci version 0x120
> quirks 0x0000000200000010
> kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
> kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus number 10
> kernel: xhci_hcd 0000:7a:00.0: Host supports USB 3.0 SuperSpeed
> kernel: usb usb9: New USB device found, idVendor=1d6b, idProduct=0002,
> bcdDevice= 6.17
> kernel: usb usb9: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> kernel: usb usb9: Product: xHCI Host Controller
> kernel: usb usb9: Manufacturer: Linux
> 6.17.0-1-mainline-12298-gf5bd2142c274 xhci-hcd
> kernel: usb usb9: SerialNumber: 0000:7a:00.0
> kernel: hub 9-0:1.0: USB hub found
> kernel: hub 9-0:1.0: 1 port detected
> kernel: usb usb10: We don't know the algorithms for LPM for this host,
> disabling LPM.
> kernel: usb usb10: New USB device found, idVendor=1d6b,
> idProduct=0003, bcdDevice= 6.17
> kernel: usb usb10: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> kernel: usb usb10: Product: xHCI Host Controller
> kernel: usb usb10: Manufacturer: Linux
> 6.17.0-1-mainline-12298-gf5bd2142c274 xhci-hcd
> kernel: usb usb10: SerialNumber: 0000:7a:00.0
> kernel: hub 10-0:1.0: USB hub found
> kernel: hub 10-0:1.0: config failed, hub doesn't have any ports! (err -19)
> 
> where the 2.0 USB's work, mice is powered on, with the bad kernel the
> mice doesn't even power the LED's on.
> In the bad kernel its missing the New USB and all.

It looks like the new (bad) kernel tries to suspend the xHCI host immediately
after setting the one USB 2.0 roothub up. It's possible it fails to detect any
port changes, and thus device before this.

Does forcing the xHCI and roothub "on" help?, preventing runtime suspend?

on bad (new) kernel:

# echo on > /sys/bus/pci/devices/0000:7a:00.0/power/control
# echo on > /sys/bus/pci/devices/0000:7a:00.0/usb9/power/control

It's possible there's some issue with xhci driver runtime pm usage count
when only using one roothub.

xhci driver enables runtime pm for all PCI based xHCI 1.2 controllers by default.
The "one roothub" xHCI controllers enabled earlier were all non-PCI hosts, which
don't enable runtime PM by default.

Thanks
Mathias



