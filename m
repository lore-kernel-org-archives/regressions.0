Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7E219CC21
	for <regressions@lists.linux.dev>; Tue, 22 Oct 2024 12:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729600273; cv=none; b=BvP0JlKEPRYmE/YiP6fFmarIJCNmGleD/Xni0krcJBL4eEgwBv3/VG5+A/HFMvKVmayoYIAP8mKbn3UBZZrqCITzWh+5pRXQt09DmL8OKLFLmJqoZygAwpx2NRoICm3Km8CR3tgzYW+uDyadYcpOdhY+q41zt2FnY9qzD2Z1knM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729600273; c=relaxed/simple;
	bh=jWer99MQygYEMpyTVt3Xu+09nA1gM6Fo73vcOXAYeJs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=A5hVwWSg7P83FlU7UHbqhkaSOoJ2HXLWAOpPMFVODqtbN1mQJpAZVprknlw8MaU5tMxb80wAzSJMMGgcGFinZTNCdt3nzzXxo42EeI8VT1rw69MN392BfRhm8LfvI8om6omlY4wpi6r/vgUsFGNJjYWKiFNul9v7+VKyDj6t/0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HYzRYFye; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HYzRYFye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729600272; x=1761136272;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=jWer99MQygYEMpyTVt3Xu+09nA1gM6Fo73vcOXAYeJs=;
  b=HYzRYFye4AI4Q6c25cEkc/nxZPCDBLmPc9z/mKFk1WKq17X2M+fBLhfO
   x57eOGMxkayyWXY5qf2BPYdp4XKAC2qWiKvRSH4KYwGbqJO5zgnDibTBM
   kQvOXMpJpGC7PMrr3TtH5/7P97yAIUoU9gDJytQrPsSePW6+qy8AWdiaS
   nwqw4VHXQ82j+w4xUlFHMKvCc1SAdzVAmFSPgQIqIRiu6vHaNOO4ozuGy
   DIH/JzqoN3ZoPXjst7F+jLfmaa/2MoDmdwTXggcoKMr0HUVjOkk3N/w/N
   gcEIuP56BBSnqSTtuUmCAO982QEW8YKSItV5U9Py3Va5bVMDWmvkCkhaj
   g==;
X-CSE-ConnectionGUID: QriHh1lTRCykiTi9xDxzXA==
X-CSE-MsgGUID: 9NeLeUeyQQqafmBF8lZl1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="32941532"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="32941532"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 05:31:11 -0700
X-CSE-ConnectionGUID: bapnpvBIQQSsLkUVAs3CPw==
X-CSE-MsgGUID: g/TcrndfRsalRDXZmnHVvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="117289842"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa001.jf.intel.com with ESMTP; 22 Oct 2024 05:31:09 -0700
Message-ID: <e365ef35-1f98-4823-8a81-47259c4914fe@linux.intel.com>
Date: Tue, 22 Oct 2024 15:33:21 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
From: Mathias Nyman <mathias.nyman@linux.intel.com>
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
 <2e9c8787-7fe8-46d5-b78b-05794abca9b2@linux.intel.com>
Content-Language: en-US
In-Reply-To: <2e9c8787-7fe8-46d5-b78b-05794abca9b2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.10.2024 13.56, Mathias Nyman wrote:
> On 16.10.2024 22.48, Harry Wentland wrote:

>> This patch does the trick, i.e., no more hangs on boot when
>> connected to the Lenovo USB dock.
>>
>> Harry
>>
> 
> Thanks for testing,
> 
> I'm myself seeing some issues now with this fix.
> It's not creating the device link when it should due to the !device_is_bound(nhi_fwnode->dev) check.
> 
> I need to look into this a bit more
> 

It was an unrelated issue in my setup,
It works for me now, I'll post the patch

Thanks
Mathias

