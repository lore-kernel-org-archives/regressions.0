Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4836318B47E
	for <regressions@lists.linux.dev>; Wed,  9 Oct 2024 21:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728510637; cv=none; b=Qa270JDLLGqKXV0VIOSYQFHC5r5O/TdFxC2kHqbRPfLuc3zw1XjM6oBH73NpSb81Hys7/C7pC5bY8g/eWvHiJgpB6Si8HQHmv+i9ST6Is+PYG0DpLVDiJ3IJWQPDpQhBToMn4Rvn3SPT6xKkXUD2JBvJEwuoRBPGUq1l2BrlKOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728510637; c=relaxed/simple;
	bh=kDKwIW2x6YlORveSg9LqRlyZLlxHBuE85fRH+X7i9tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CDRonh90xEqq1oYdtktl7TDSle+4Omc2Qt529Lls9DK3e0EVCjAUlkaTE+DhZ1RVeRzHZ4ZXTuNR+sGAKcoMuYUK9t0Udr/GPiZqU80eBuD4n9gicOKFuP6RX6N6sxma4k2+VLiamdIiX0KAsSKQxTYy8nf2+1mdPEOpKNkTRwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GoQiXwQM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GoQiXwQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728510635; x=1760046635;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kDKwIW2x6YlORveSg9LqRlyZLlxHBuE85fRH+X7i9tg=;
  b=GoQiXwQM3HU4q82c8LXtCWyn6c3NC6NGEqFlPmc1eWnVUHEe83s7/ne2
   l5GJ6K6WCfzVc4IUrOCOjl1OtM4XXReaGfQ4smymyFgPoXW0ZaXTdXFNo
   iXDdEE6MQNgdtzyUkJrw4mk3PSOWdPPnWIffXsEehRt7NZ9IAXugzz3lw
   psjjTlFqtrYIKRHuxqRrHg3Smhxy08HsIYT4M0XayWJPKSLoB9Brj3pau
   af1ldYFy/kcc2oVoFZgRU4BBfGMserHSlNm7x0GkF/prs+5WvCDWY5Mxn
   g+VejJ01XBNk1stMxhQRKG5nxlf6nOV5yQsLLeXfwJxJlIC9ikRvg7sqx
   g==;
X-CSE-ConnectionGUID: 3jnWh3lHRV2RbqSZE2uk/Q==
X-CSE-MsgGUID: d1gXfTcWSnW79v88kHAivg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27718679"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="27718679"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:50:33 -0700
X-CSE-ConnectionGUID: LelyheybSUC//pQxXRg8mQ==
X-CSE-MsgGUID: DXn0v/+8R3+vc50NhF/A4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="76600016"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 09 Oct 2024 14:50:31 -0700
Message-ID: <cee28cb3-a157-4d26-a68a-7b5a99161d1a@linux.intel.com>
Date: Thu, 10 Oct 2024 00:52:41 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "<Harry Wentland" <harry.wentland@amd.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 Raju.Rangoju@amd.com, Sanath.S@amd.com, Greg KH <gregkh@linuxfoundation.org>
References: <cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com>
 <20241003054704.GM275077@black.fi.intel.com>
 <01bf9a3a-6277-4b57-83ed-82c4bfb62dd2@amd.com>
 <20241003132726.GN275077@black.fi.intel.com>
 <797f52fa-ab9d-45c5-828b-9dcaf75fcc83@amd.com>
 <20241003134743.GO275077@black.fi.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20241003134743.GO275077@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3.10.2024 16.47, Mika Westerberg wrote:
> On Thu, Oct 03, 2024 at 08:42:21AM -0500, Mario Limonciello wrote:
>> On 10/3/2024 08:27, Mika Westerberg wrote:
>>> On Thu, Oct 03, 2024 at 08:10:11AM -0500, Mario Limonciello wrote:
>>>> On 10/3/2024 00:47, Mika Westerberg wrote:
>>>>> Hi Harry,
>>>>>
>>>>> On Wed, Oct 02, 2024 at 01:42:29PM -0400, Harry Wentland wrote:
>>>>>> I was checking out the 6.12 rc1 (through drm-next) kernel and found
>>>>>> my system hung at boot. No meaningful message showed on the kernel
>>>>>> boot screen.
>>>>>>
>>>>>> A bisect revealed the culprit to be
>>>>>>
>>>>>> commit f1bfb4a6fed64de1771b43a76631942279851744 (HEAD)
>>>>>> Author: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>>> Date:   Fri Aug 30 18:26:29 2024 +0300
>>>>>>
>>>>>>        usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface
>>>>>>
>>>>>> A revert of this single patch "fixes" the issue and I can boot again.
>>>>>> The system in question is a Thinkpad T14 with a Ryzen 7 PRO 6850U CPU.
>>>>>> It's running Arch Linux but I doubt that's of consequence.
>>>>>>
>>>>>> lspci output:
>>>>>>        https://gist.github.com/hwentland/59aef63d9b742b7b64d2604aae9792e0
>>>>>> acpidump:
>>>>>>        https://gist.github.com/hwentland/4824afc8d712c3d600be5c291f7f1089
>>>>>>
>>>>>> Mario suggested I try modprobe.blacklist=xhci-hcd but that did nothing.
>>>>>> Another suggestion to do usbcore.nousb lets me boot to the desktop
>>>>>> on a kernel with the faulty patch, without USB functionality, obviously.
>>>>>>
>>>>>> I'd be happy to try any patches, provide more data, or run experiments.
>>>>>
>>>>> Do you boot with any device connected?
>>>>>> Second thing that I noticed, though I'm not familiar with AMD hardware,
>>>>> but from your lspci dump, I do not see the PCIe ports that are being
>>>>> used to tunnel PCIe. Does this system have PCIe tunneling disabled
>>>>> somehow?
>>>>
>>>> On some OEM systems it's possible to lock down from BIOS to turn off PCIe
>>>> tunneling, and I agree that looks like the most common cause.
>>>>
>>>> This is what you would see on a system that has tunnels (I checked on my
>>>> side w/ Z series laptop w/ Rembrandt and a dock connected):
>>>>
>>>>              +-03.0
>>>>              +-03.1-[03-32]--
>>>>              +-04.0
>>>>              +-04.1-[33-62]----00.0-[34-62]--+-02.0-[35]----00.0
>>>>              |                               \-04.0-[36-62]--
>>>>
>>>> 00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>>>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>>>> 00:03.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
>>>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
>>>> 00:04.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>>>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>>>> 00:04.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
>>>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
>>>
>>> Okay this is more like what I expected, although probably not the
>>> reason here.
>>>
>>> Are you able to replicate the issue if you disable PCIe tunneling from
>>> the BIOS on your reference system? (Probably not but just in case).
>>
>> I checked on the Lenovo Z13 laptop I have and turned off "USB port" in BIOS
>> setup and this caused the endpoints 3.1 and 4.1 I listed above to disappear
>> but the system still boots up just fine for me on 6.12-rc1.
> 
> Okay thanks for checking!
> 
>>>>> You don't see anything on the console? It's all blank or it just hangs
>>>>> after some messages?
>>>>
>>>> I guess it is getting stuck on fwnode_find_reference() because it never
>>>> finds the given node?
>>>
>>> Looking at the code, I don't see where it could get stuck. If for some
>>> reason there is no such reference (there is based on the ACPI dump) then
>>> it should not affect the boot. It only matters when power management is
>>> involved.
>>
>> Nothing jumps out to me either.  Maybe this is a situation that Harry can
>> sprinkle a bunch of printk's all over usb_acpi_add_usb4_devlink() to
>> enlighten what's going on (assuming the console output is "working" when
>> this happened).
> 
> There are couple of places there that may cause it to crash, I think.

Its possible we end up trying to create a device link during usb3 device
"consumer" enumeration before the "supplier" NHI device is properly bound to a driver.

This is something driver-api/device_link.rst states can cause issues.

This could happen if xhci isn't capable of detecting tunneled devices,
but ACPI tables contain all info needed to assume device might be tunneled.
i.e. udev->tunnel_mode == USB_LINK_UNKNOWN.

Harry, could you test if the code below helps?

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 21585ed89ef8..94c335a7b933 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -173,6 +173,13 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
         if (IS_ERR(nhi_fwnode))
                 return 0;
  
+       if (!nhi_fwnode->dev || !device_is_bound(nhi_fwnode->dev)) {
+               dev_info(&port_dev->dev, "%s not tunneled as it probed before USB4 Host Interface\n",
+                        dev_name(&port_dev->child->dev));
+               udev->tunnel_mode = USB_LINK_NATIVE;
+               return 0;
+       }
+
         link = device_link_add(&port_dev->child->dev, nhi_fwnode->dev,
                                DL_FLAG_AUTOREMOVE_CONSUMER |
                                DL_FLAG_RPM_ACTIVE |




