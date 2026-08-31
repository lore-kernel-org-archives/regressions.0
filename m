Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C007C44B69C
	for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 14:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186488; cv=none; b=DvKt0KMlR3XSx2xgIKc8anU7QAx4yehMkkI2Z5Y//V2Hh5FQsPnMT/OuNBINa9Stp32Fet3T1CWanO77qpU48XAnmk07AEsL4hU3I7k83fzVvHVPlGfoJ3cU5h9+8Lgq54pDpGUqWYfBjBF8ftwuowGVHHp9b205+7pTm9fmzQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186488; c=relaxed/simple;
	bh=EB1KU6l5i2IVDC8LyE/MJj7aNXYNq6nRqS8oxp5G/w0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lYbDSNNqhd2tNwT9kSxSmEG++DONV2PeNP6mkkwYuROBTE1g0fpASZDDF5sHZVFp81tYtZGWc6eM0w/V4GAEPnbIUgbGhI9vN85uwQIERgjEk9wwGFqZOem6YVnnYxdxxv+IuCW282Tr1i9qKIRzwc7fUeFvxTOC2YsDJCeZPao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSE9sLmo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSE9sLmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788186485; x=1819722485;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EB1KU6l5i2IVDC8LyE/MJj7aNXYNq6nRqS8oxp5G/w0=;
  b=GSE9sLmoLNpE4v7mla1PwmFa8If+hjnnMypQjuqSjIHlmi1Q6sIJrUtP
   WMOQAaZ3P27IvR6IPn6nrg8uxKvdEZqhQ0+D0AIeUPE+03Ynfmy18+j+C
   rM2Erw6xj4Z+IGefpQD+pnEmUF23YRdSz7lTZ1E8CdQOdf+zJvJ8y85Pp
   npV/PMnm0iy+BFqHvfl5AkIwsBPlzpV+MVazMM+W2ogo5BpuRyM6FQj7f
   eq/hFPjN5YhYgzI4lh3aV4EeQE+IyVyTHynAQo1jPnoAhykIdlhUDYk4+
   Bg+HyciRHpjeVuIkT9gRfU/r+gM15RLImrKWdd8qLsCEK+rZydPGqQfAO
   Q==;
X-CSE-ConnectionGUID: mmyrKSBkQRu90Srkn+p9/g==
X-CSE-MsgGUID: VOHJ4HFpQeq7/Nr4hKfohw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88606714"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="88606714"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 07:28:05 -0700
X-CSE-ConnectionGUID: HGGdtgPBRla17EMvpXyf3Q==
X-CSE-MsgGUID: lNipXpnTSvCfHITjxUdGsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="293645917"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.244.148]) ([10.245.244.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 07:28:02 -0700
Message-ID: <f29a475e-a523-461a-8e63-b0698b3174c6@linux.intel.com>
Date: Mon, 31 Aug 2026 17:28:00 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: fix maximum event ring segments calculation
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Pierre-David Belanger <pierredavidbelanger@gmail.com>,
 Shixiong Ou <oushixiong1025@163.com>
Cc: Shixiong Ou <oushixiong@kylinos.cn>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Niklas Neronin <niklas.neronin@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <20260828105926.930033-1-oushixiong1025@163.com>
 <20260830031233.1810986-2-pierredavidbelanger@gmail.com>
 <64a7ce30-b346-4e94-974f-f30893d66829@leemhuis.info>
 <81ddd491-1ec3-4a0c-90b3-6a286ff1a908@linux.intel.com>
 <1c855bb3-2bac-4f25-b97f-3a7436a6291b@leemhuis.info>
 <89d99e3a-0f67-4116-a262-98be59f76f5d@leemhuis.info>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <89d99e3a-0f67-4116-a262-98be59f76f5d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/31/26 14:36, Thorsten Leemhuis wrote:
> 
> 
> On 8/31/26 13:28, Thorsten Leemhuis wrote:
>> On 8/31/26 11:21, Mathias Nyman wrote:
>>> On 8/31/26 09:55, Thorsten Leemhuis wrote:
>>>> On 8/30/26 05:12, Pierre-David Belanger wrote:
>>>>> The failure on 08dbfad3f504:
>>>>>
>>>>>     xhci_hcd 0000:00:04.0: xHCI Host Controller
>>>>>     xhci_hcd 0000:00:04.0: new USB bus registered, assigned bus number 1
>>>>>     xhci_hcd 0000:00:04.0: Failed to allocate interrupter erst
>>>>>     xhci_hcd 0000:00:04.0: can't setup: -12
>>>>>     xhci_hcd 0000:00:04.0: USB bus 1 deregistered
>>>>>     xhci_hcd 0000:00:04.0: init 0000:00:04.0 fail, -12
>>>>>     xhci_hcd 0000:00:04.0: probe with driver xhci_hcd failed with
>>>>> error -12
>>>> Sadly this missed -rc1, wonder why it wasn't submitted for it to prevent
>>>> more people from running into this, but whatever, that's ship has sailed.
>>>
>>> Looks like at least QEMU and Mediatek users were hit by this issue.
>>
>> Ahh, good to known. And thx for sending one of the fixes to Greg
>> meanwhile (saw that by chance).
>>> Note that this is a v7.3-rc1 regression which was found during merge
>>> window for v7.3-rc1.
>>> v7.3-rc1 came out a few hours ago.
>>> I can't resolve it much earlier than this.
>> Out of curiosity: why?
>>
>> Just ignore the question if it was something like "real life got in the
>> way" or "it fell through the cracks" -- that's how it is sometimes, no
>> worries. But in other cases I'd be glad if you could take a few minutes
>> if you have them to satisfy my curiosity, as in preparation for a
>> maintainer summit proposal I sent[1] I'm just trying to understand
>> better why regression fixes sometimes take quite a while from submission
>> to landing in mainline

No real life or personal issues got in the way.
Assumed severity after first case didn't call for action mid merge window.

> 
> For the record (sorry, this should have bin in above mail!), as it might
> sound hostile without context, as obviously there would not have been
> enough time to fix this if the issue would only have become known during
> the end of the merge window. But that is not the case here afaics
> (please correct me if I'm wrong!), as the first patch to fix this was
> afaics submitted on 2026-08-20:

Sure, I'll describe how it went

2026-08-16 Sunday,

   v7.2 is tagged, merge window opens
   I've sent all my patches, assume Greg has his pull request ready for Linus.

2026-08-20 Thursday,
  
   I see the issue and patch the first time.
   It points to an issue in next, is valid but commit message doesn't call for
   urgency in any way.
   Doesn't specify which hardware is concerned.
   So far one report only. I haven't seen the issue myself so assume it's some obscure
   hardware (pre-production, or virtual/firmware).
   Queue for after rc1.
   No reason to panic or bother Greg or Linus mid merge window at this stage.

2026-08-27 Thursday, a week later, rc1 will be tagged on Sunday

   I get a second report for the same issue, this one shows it concerns Mediatek MT8173.
   Issue gets my attention, rc1 will be tagged on Sunday so I don't even consider stirring
   up anything anymore.

   https://lore.kernel.org/linux-usb/20260827053748.3755-1-getfeus@gmail.com


2026-08-28 Friday

   One more case, showing this  affects QEMU users as well.
   But no point in sending anything before rc1 anymore, rc1 will be tagged on Sunday
     
2026-08-30 Sunday
   
   another QEMU user reports an issue
   Linus tags 7.3-rc1

2026-08-31 Monday

   Rebase on rc1, compile, quick testrun, submit fix to Greg.

Thanks
Mathias

