Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FBA2820D7
	for <regressions@lists.linux.dev>; Tue,  2 Sep 2025 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807999; cv=none; b=igh1ciYTF0rEL3CPX5x496/LiX/LQwWrsjrc21RNOIWPkoZGL2PAwvcBGNvm9mip4Q3+LHgoN2kIX3lKa1CiGLklPWA0gCHPymDv4UG0Rxff9hbbDryeqSZfki7DBWeBTWTf9VDJ58Ykwh0PWoGUc5o8a6q99feZ9/zLcq1l9ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807999; c=relaxed/simple;
	bh=/8llQIdNMkqIPygj9KDjXPYnYcL7e734n9r/vQ45k7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQJz7rZ5V9ydKTaIsYMsm4ZwF+Yrg9x0GrmiRq6o659WBIcFKxqa/0cWP2PtqBJ1lNvNTzTl6gwYEiSRfFkybGnaTq9IVz6wBiruZ74p4XVH7/PmVOT3SAEkM36EsZej2VZG+dZVM4AWDQm36FmKVmG48LbZMiHbiWhjBEUTWng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKBKTN9q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKBKTN9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756807998; x=1788343998;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/8llQIdNMkqIPygj9KDjXPYnYcL7e734n9r/vQ45k7I=;
  b=XKBKTN9qzenerlMSzFtCFm+AhmeV1X8aVaRuY0HSrV37Z320gAsWkQ6h
   TDc9x9cCpF03MPJOT0FPaMMSWsm38ejaueHBkPN5W/puD436fy1Akryb0
   GdBaiOJfrk+EXxl2Uc1LuW7ozLWIMPEowHVJL6+BZ4TML7RH8e0hhdYiC
   LafZV6op3Fj35Ni3lUeANyMdbx9U+N3UozT6AUnDb0YSyhmBcB70VIOlU
   sPxBTmnWR7+G7i6Gz0wTNZIv1jk1geJ4LbCUH4T0A9ho8oEV0m8Zch0HB
   WaidUK6O8u0svV8wPiSGTy7rRQW9GqVQ7qAM+LRnYrMomTksjJOCUgt9+
   g==;
X-CSE-ConnectionGUID: CuZPV83AR5GoegUf/uh6TA==
X-CSE-MsgGUID: xiBeKhWZQaOXN/5kSPAr4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="62718428"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="62718428"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 03:13:16 -0700
X-CSE-ConnectionGUID: nUbt2PhnQKeweUVMh7BtIw==
X-CSE-MsgGUID: 5S6D+71WQe2L+tJ/WT/Pig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="176553990"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.90]) ([10.245.245.90])
  by orviesa005.jf.intel.com with ESMTP; 02 Sep 2025 03:13:13 -0700
Message-ID: <6042295b-8dad-4816-8505-b9b6c6f6049d@linux.intel.com>
Date: Tue, 2 Sep 2025 13:13:12 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Fix xhci_free_virt_devices_depth_first()
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
 David Wang <00107082@163.com>
Cc: WeitaoWang-oc@zhaoxin.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, surenb@google.com, kent.overstreet@linux.dev
References: <20250829181354.4450-1-00107082@163.com>
 <20250830114828.3dd8ed56.michal.pecio@gmail.com>
 <5051e27a.2ba3.198fa7b5f31.Coremail.00107082@163.com>
 <f9476552-a6dc-4f1c-91da-b15c8f0d9844@linux.intel.com>
 <20250902093017.13d6c666.michal.pecio@gmail.com>
 <446082a4.7dbe.199098cd654.Coremail.00107082@163.com>
 <20250902104630.6a9f088a.michal.pecio@gmail.com>
 <20250902110730.723a48a0.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250902110730.723a48a0.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2.9.2025 12.07, Michał Pecio wrote:
> On Tue, 2 Sep 2025 10:46:30 +0200, Michał Pecio wrote:
>> On Tue, 2 Sep 2025 16:30:48 +0800 (CST), David Wang wrote:
>>> About the change from "<" to "<=", I did not observe any difference on my system. Is it because my system does not use up all slots?
>>
>> This too, you would need to fiddle with devices (or connect enough
>> of them) to reach Slot ID 255 (probably the highest on most systems),
>> depending on the xHCI controller and its ID allocation policy.
> 
> This made me wonder what those policies are. I'm too lazy for thorough
> testing, but I plugged and unplugged the same device a few times.
> 
> Most HCs kept assigning ID 1, so they likely always pick the lowest.
> 
> My AMD chipset, two ASMedia USB 3.1 controllers and a Fresco FL1100
> kept assigning sequentially increasing IDs, so I suppose I could pump
> it up near the top, connect two high speed hubs and trigger this bug.
> 
>> But also as explained, this bug doesn't make things go boom just yet.
>>
>> Except if combined with your bug in an obscure edge case:
>>
>> 1. A high speed hub has slot ID HCS_MAX_SLOTS-1 and some TT children.
>> 2. Another high speed hub has slot ID HCS_MAX_SLOTS.
>> 3. We start with freeing the second hub.
>> 4. The loop is entered and leaves vdev pointing at the first hub.
>> 5. The first hub is freed instead of the second one.
>> 6. Then its children are freed and UAF its tt_info.

I'm not sure I follow the above.

I agree that changing the "<" to "<=" makes sense, but fortunately for us there shouldn't be any
issue with current implementation as xhci_free_virt_devices_depth_first() is called with highest possible
slot_id value first:

in xhci-memm.c:
  for (i = HCS_MAX_SLOTS(xhci->hcs_params1); i > 0; i--)
                 xhci_free_virt_devices_depth_first(xhci, i);

if HCS_MAX_SLOTS slot_id is a hs-hub then all its children have slot_id < HCS_MAX_SLOTS,
and loop works fine.

If HCS_MXA_SLOT slot_id is a leaf node then it is freed first.

Thanks
Mathias
