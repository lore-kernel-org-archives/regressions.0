Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DC11E4106
	for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 10:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729508082; cv=none; b=DizW9Nx96YDYS53FQ6NxBInpw6XgUf2whb27kbzhvHZCMp3Bb3b6K5U2XfJM9rwUSjdePpR8ls/XCLjMEJ4eD84AcCNcqZIJnRWZkKTi1goOFW4PnmKvcRWxpU619RE0qisUMRBbuZx3ud+xhzDFJagKmVH7h7xFDINhrmn1WU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729508082; c=relaxed/simple;
	bh=QaRe/2d5qlBSg96BOnrkqVspEIx1XWy3/Tifm+tlg04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YmjrtIV8RHHHtLpEzUhl9v/pp87H0xHE+FSZN5zknl0UOkgBvAyTsNl+s3NfAdlj5EzWmWBUn3niyUEqbvbforZXbg78FXWp4/uVhRu5X7bjTG8/vTNhSIhNkeiyqjMnFXXY5BTP6VNqcguB7ObnQ0G/50PPtnDQLfTt6Np/0VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awx/xKSc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awx/xKSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729508080; x=1761044080;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QaRe/2d5qlBSg96BOnrkqVspEIx1XWy3/Tifm+tlg04=;
  b=awx/xKSc1DCNh0kc6yBkF5Bnpz9L6D1HOAFXvr7fz0KKXaSAHFIH/B2k
   KF+Aaf+fy7DT90+N5zBdvQaAoXhJQC4uC14qPchY/lkRVQWmLoDeY5s1O
   ON6fG6eoHiFdpEHCx5dHATcak78X7+yiSTKQaqcdt8vrh5DGLi4y7924U
   kn3A+x24104ciSeM1GsLkL0GkGd1MoOGq7ruQmuVKBuDETsJKZhr7OP1+
   ACGgKwn0xTEcxk/LQKzqgV0lkeesdqFowCapfQTn5QMCJwqKmSOjz/wYL
   qCBXS0Mid3fP6PlZdeA7KR8aULD/726XUDdz2GRD0GuCYMMVtrAu/oxgG
   A==;
X-CSE-ConnectionGUID: FHpMulRGSqSAeBgYNjRYCw==
X-CSE-MsgGUID: A8ppZOQhTGarm3r0deOV8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39522588"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39522588"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 03:54:40 -0700
X-CSE-ConnectionGUID: X4ysUeBqRXKurpepcahLeA==
X-CSE-MsgGUID: Dn7Aib5fQ960yoEhF+ho9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="84557493"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa004.jf.intel.com with ESMTP; 21 Oct 2024 03:54:38 -0700
Message-ID: <2e9c8787-7fe8-46d5-b78b-05794abca9b2@linux.intel.com>
Date: Mon, 21 Oct 2024 13:56:49 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
To: Harry Wentland <harry.wentland@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 Raju.Rangoju@amd.com, Sanath.S@amd.com, Greg KH <gregkh@linuxfoundation.org>
References: <cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com>
 <20241003054704.GM275077@black.fi.intel.com>
 <01bf9a3a-6277-4b57-83ed-82c4bfb62dd2@amd.com>
 <20241003132726.GN275077@black.fi.intel.com>
 <797f52fa-ab9d-45c5-828b-9dcaf75fcc83@amd.com>
 <20241003134743.GO275077@black.fi.intel.com>
 <cee28cb3-a157-4d26-a68a-7b5a99161d1a@linux.intel.com>
 <c5209c31-9263-4fe7-b387-319bbaac866d@amd.com>
 <dc9bcfa6-885f-4ae2-a6be-832a985bc80e@linux.intel.com>
 <eecb9408-1c20-47ef-a8b9-56fcee1dc610@amd.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <eecb9408-1c20-47ef-a8b9-56fcee1dc610@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.10.2024 22.48, Harry Wentland wrote:
> 
> 
> On 2024-10-10 08:01, Mathias Nyman wrote:
>> On 10.10.2024 5.23, Mario Limonciello wrote:
>>> On 10/9/2024 16:52, Mathias Nyman wrote:
>>>> On 3.10.2024 16.47, Mika Westerberg wrote:
>>>>> On Thu, Oct 03, 2024 at 08:42:21AM -0500, Mario Limonciello wrote:
>>>>>> On 10/3/2024 08:27, Mika Westerberg wrote:
>>>>>>> On Thu, Oct 03, 2024 at 08:10:11AM -0500, Mario Limonciello wrote:
>>>>>>>> On 10/3/2024 00:47, Mika Westerberg wrote:
>>>>>>>>> Hi Harry,
>>>>>>>>>
>>>>>>>>> On Wed, Oct 02, 2024 at 01:42:29PM -0400, Harry Wentland wrote:
>>>>>>>>>> I was checking out the 6.12 rc1 (through drm-next) kernel and found
>>>>>>>>>> my system hung at boot. No meaningful message showed on the kernel
>>>>>>>>>> boot screen.
>>>>>>>>>>
>>>>>>>>>> A bisect revealed the culprit to be
>>>>>>>>>>
>>>>>>>>>> commit f1bfb4a6fed64de1771b43a76631942279851744 (HEAD)
>>>>>>>>>> Author: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>>>>>>> Date:   Fri Aug 30 18:26:29 2024 +0300
>>>>>>>>>>
>>>>>>>>>>         usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface
>>>>>>>>>>
>>>>>>>>>> A revert of this single patch "fixes" the issue and I can boot again.
>>>>>>>>>> The system in question is a Thinkpad T14 with a Ryzen 7 PRO 6850U CPU.
>>>>>>>>>> It's running Arch Linux but I doubt that's of consequence.
>>>>>>>>>>
>>>>>>>>>> lspci output:
>>>>>>>>>>         https://gist.github.com/ hwentland/59aef63d9b742b7b64d2604aae9792e0
>>>>>>>>>> acpidump:
>>>>>>>>>>         https://gist.github.com/ hwentland/4824afc8d712c3d600be5c291f7f1089
>>>>>>>>>>
>>>>>>>>>> Mario suggested I try modprobe.blacklist=xhci-hcd but that did nothing.
>>>>>>>>>> Another suggestion to do usbcore.nousb lets me boot to the desktop
>>>>>>>>>> on a kernel with the faulty patch, without USB functionality, obviously.
>>>>>>>>>>
>>>>>>>>>> I'd be happy to try any patches, provide more data, or run experiments.
>>>>>>>>>
>>>>>>>>> Do you boot with any device connected?
>>>>>>>>>> Second thing that I noticed, though I'm not familiar with AMD hardware,
>>>>>>>>> but from your lspci dump, I do not see the PCIe ports that are being
>>>>>>>>> used to tunnel PCIe. Does this system have PCIe tunneling disabled
>>>>>>>>> somehow?
>>>>>>>>
>>>>>>>> On some OEM systems it's possible to lock down from BIOS to turn off PCIe
>>>>>>>> tunneling, and I agree that looks like the most common cause.
>>>>>>>>
>>>>>>>> This is what you would see on a system that has tunnels (I checked on my
>>>>>>>> side w/ Z series laptop w/ Rembrandt and a dock connected):
>>>>>>>>
>>>>>>>>               +-03.0
>>>>>>>>               +-03.1-[03-32]--
>>>>>>>>               +-04.0
>>>>>>>>               +-04.1-[33-62]----00.0-[34-62]--+-02.0-[35]----00.0
>>>>>>>>               |                               \-04.0-[36-62]--
>>>>>>>>
>>>>>>>> 00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>>>>>>>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>>>>>>>> 00:03.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
>>>>>>>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
>>>>>>>> 00:04.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>>>>>>>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>>>>>>>> 00:04.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
>>>>>>>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
>>>>>>>
>>>>>>> Okay this is more like what I expected, although probably not the
>>>>>>> reason here.
>>>>>>>
>>>>>>> Are you able to replicate the issue if you disable PCIe tunneling from
>>>>>>> the BIOS on your reference system? (Probably not but just in case).
>>>>>>
>>>>>> I checked on the Lenovo Z13 laptop I have and turned off "USB port" in BIOS
>>>>>> setup and this caused the endpoints 3.1 and 4.1 I listed above to disappear
>>>>>> but the system still boots up just fine for me on 6.12-rc1.
>>>>>
>>>>> Okay thanks for checking!
>>>>>
>>>>>>>>> You don't see anything on the console? It's all blank or it just hangs
>>>>>>>>> after some messages?
>>>>>>>>
>>>>>>>> I guess it is getting stuck on fwnode_find_reference() because it never
>>>>>>>> finds the given node?
>>>>>>>
>>>>>>> Looking at the code, I don't see where it could get stuck. If for some
>>>>>>> reason there is no such reference (there is based on the ACPI dump) then
>>>>>>> it should not affect the boot. It only matters when power management is
>>>>>>> involved.
>>>>>>
>>>>>> Nothing jumps out to me either.  Maybe this is a situation that Harry can
>>>>>> sprinkle a bunch of printk's all over usb_acpi_add_usb4_devlink() to
>>>>>> enlighten what's going on (assuming the console output is "working" when
>>>>>> this happened).
>>>>>
>>>>> There are couple of places there that may cause it to crash, I think.
>>>>
>>>> Its possible we end up trying to create a device link during usb3 device
>>>> "consumer" enumeration before the "supplier" NHI device is properly bound to a driver.
>>>>
>>>> This is something driver-api/device_link.rst states can cause issues.
>>>>
>>>> This could happen if xhci isn't capable of detecting tunneled devices,
>>>> but ACPI tables contain all info needed to assume device might be tunneled.
>>>> i.e. udev->tunnel_mode == USB_LINK_UNKNOWN.
>>>>
>>>> Harry, could you test if the code below helps?
>>>>
>>>> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
>>>> index 21585ed89ef8..94c335a7b933 100644
>>>> --- a/drivers/usb/core/usb-acpi.c
>>>> +++ b/drivers/usb/core/usb-acpi.c
>>>> @@ -173,6 +173,13 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>>>>           if (IS_ERR(nhi_fwnode))
>>>>                   return 0;
>>>>
>>>> +       if (!nhi_fwnode->dev || !device_is_bound(nhi_fwnode->dev)) {
>>>> +               dev_info(&port_dev->dev, "%s not tunneled as it probed before USB4 Host Interface\n",
>>>
>>> I'm aware this message is mostly to prove whether this is the actual issue but I do want to say if this patch indeed helps Harry's problem and you keep a message in what goes upstream I don't think this is accurate for all cases.
>>>
>>> If you have a Pre-OS CM, it might build tunnels and those could be active until the USB4 CM loads and resets them (by the default behavior).
>>>
>>> So I think a more accurate message would just be "%s probed before USB4 host interface".
>>
>> Makes sense, I'll tune the message in the final patch if this works
>>
> 
> Apologies for the late response. I was traveling last week.
> 
> This patch does the trick, i.e., no more hangs on boot when
> connected to the Lenovo USB dock.
> 
> Harry
> 

Thanks for testing,

I'm myself seeing some issues now with this fix.
It's not creating the device link when it should due to the !device_is_bound(nhi_fwnode->dev) check.

I need to look into this a bit more

Thanks
Mathias

