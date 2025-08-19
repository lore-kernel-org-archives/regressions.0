Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F098D274FF5
	for <regressions@lists.linux.dev>; Tue, 19 Aug 2025 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755600134; cv=none; b=PuKV40ZvhGaVvsupI7CioXd2ARsN+HUhnEyLjntL7QZUsaVkpUjd9bm7w1r0Ue+iC+iwHPO8sDoviF3bhDSp97UghWq2amMIM0bLiFp1QFNVryORuBbOGNcSOkL2zLP/AuZk42UZcDTlUIFM1MlwpvSMKDK9ea7SlDpwbuVl06M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755600134; c=relaxed/simple;
	bh=GUHw2hkJ2M2Zhf8SAUCAWfslMLtGIo/U1p61rhrXQgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VdGB02a2EYn59EBEw/0c9OkmCM9AX6C21fDl47a1QKVRXotMW3sUBoTBHtPlqRdIk3fFl/VEMFgYdlojhvZw4NZyWC3EFPvEQ9GxM8q76xy/8lsQM34Oqju4ADvDYdUfZd2mtq3i41Ea6nJn4dcwpRE5y1VksAXmwliaYPncE40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YgHB5szz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YgHB5szz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755600133; x=1787136133;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GUHw2hkJ2M2Zhf8SAUCAWfslMLtGIo/U1p61rhrXQgI=;
  b=YgHB5szzKKvm6bxLrdveWJOvM3MbgCHvg7kRAavYEgcbdAfuMTfD77l6
   GWrDfBmYqCk9bFz37KrRvQGNBPjhD/TQAxETAvnfXyA6syD2d+8QM/iPh
   cQy2R28YceJOr2vziaeObHj1fsQASxbX0JcEulLut1egHra/GCSiv6XHi
   IX7ZTk/sy7UFlsgvnslv314xYFGw2awMewCoL+9nzXaTD3RariXiMp1nz
   dQHfPA7Ozml9qwvrwG7PtmbsvnMMWyk0oI00ito5GN9ICPw4RyVOtuXFV
   M8HzPkXRYVFuNWaY3BMoyne3GJruoUzv6uJTSm4qbAVNnEshemd7HdM6F
   w==;
X-CSE-ConnectionGUID: 9r0qPV42RbuUjjjJi2C1cw==
X-CSE-MsgGUID: FIzxG83BRGKbNYtNemLelw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56867780"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="56867780"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 03:42:12 -0700
X-CSE-ConnectionGUID: abtz5msGRzWOwhcpLj8ZOw==
X-CSE-MsgGUID: Ethlg0bdQOePFj6s1PWyDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="168171052"
Received: from mnyman-desk.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa008.fm.intel.com with ESMTP; 19 Aug 2025 03:42:10 -0700
Message-ID: <471aaca5-1e18-462f-b89c-768d7673bf0a@linux.intel.com>
Date: Tue, 19 Aug 2025 13:42:09 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION 6.16] xHCI host not responding to stop endpoint
 command after suspend and resume
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
 linux-usb@vger.kernel.org
Cc: regressions@lists.linux.dev, Christian Heusel <christian@heusel.eu>
References: <20250818231103.672ec7ed@foxbook>
 <20250819084153.2c13c187@foxbook>
 <2f2b66b5-d845-4e75-aaac-87974b592b4a@linux.intel.com>
 <a036342a-a430-4dc6-94a2-abc12cd3dd0f@linux.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <a036342a-a430-4dc6-94a2-abc12cd3dd0f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19.8.2025 12.08, Neronin, Niklas wrote:
> 
> 
> On 19/08/2025 11.56, Mathias Nyman wrote:
>> On 19.8.2025 9.41, Michał Pecio wrote:
>>> On Mon, 18 Aug 2025 23:11:03 +0200, Michał Pecio wrote:
>>>> A bisect effort is ongoing and c0c9379f235d ("Merge tag 'usb-6.16-rc1'
>>>> of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb") is bad,
>>>> so that's where the bug likely came from.
>>>
>>> Looks like the result is in.
>>>
>>> e1db856bd28891d70008880d7f1d3b8d1ea948fd is the first bad commit
>>> commit e1db856bd28891d70008880d7f1d3b8d1ea948fd
>>> Author: Niklas Neronin <niklas.neronin@linux.intel.com>
>>> Date:   Thu May 15 16:56:14 2025 +0300
>>>
>>>       usb: xhci: remove '0' write to write-1-to-clear register
>>
>> Thanks for tracking this down, I see the issue now
>>
>> We may lose interrupts due to this patch, example:
>>
>> Hardware sets IMAN_IP BIT(0) when in needs attention
>> Driver later allows xHC interrupt by setting IMAN_IE BIT(1), but
>> Driver clears IMAN_IP (RW1C) when setting IMAN_IE so no interrupt is triggered.
> 
> Apologies for my blunder.
> 
> So, there can be an interrupt pending even when the interrupt is not enabled?

So it seems, Interrupt pending (IMAN_IP) is set if:
- event handler busy (EHB) is 0, and
- moderation counter (IMODC) reaches 0, and
- Internal IPE bit is set, meaning:
   xHC inserted an event to the event ring (ring not empty), and
   "block event interrupt" (BEI) is 0

It does not depend on interrupt enable (IMAN_IE) bit, that only gates the interrupt from being
generated for this interrupter

See xhci section 4.17.5

> But there (ideally) should not be an interrupt pending when disabling the interrupt?

Yes, So it would be good to still print the debug message if IP is set.
But we should not clear the IP bit here, it will trigger an interrupt and get handled once
IE is enabled back.

> 
> I can submit a fix patch.

Sounds good.
Lets get this fixed as soon as possible.

Thanks
Mathias

