Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015651;
	b=caFhHPPYytPORLuRVRIGqsvOxuMH6GjpwfGmD25HqfttBGoQ8oJdYM+MP2zttzANuVAP
	 15KOdBIPjk9jh9H/PLdPDy7QbW0aV/1kQbAehZBMnxDyMtotGq6V/+hgJhZqIyjVt2S6U
	 O2zYT4I9edU8JvO2OlDzEk4CqozZqXgMljIzcm4YCHWFf+Le+2t7AEcKJMrdsZ9t3f12L
	 89DIKB/Ny33H7kDjcMPpO/A+yqQy4jAjYZDghgmj2B25Nai2YwkX8UAO1Yrhg6+vvfuK1
	 9UwXUInqRh620dSIlBXubayKx9jgoh61LItyaodDQAc6RfGSyAXzgsUmJ/nxmZe148Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015651;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dOm5MRaOgdoFOy8UNmgvpmaOwg3mr6R0PvJvBB/oYAQ=;
	b=tv6hAVhunv1QMucCDh3eJEOlyC6zQNjp0nJ5Xk6fOF5ycWqAjPhhI+LLttRRheRNnJwb
	 WVGSUAxBkCppqxSSWVnKNEHfG52yuzhdyvaGhIQYGClau8+gE4rt/WQ4uoN3Cr7LRsNv9
	 2LGlirJlvc2NZ4N0mbLSuqtZz75zvMaWzCCrOcd0SYcn/S7zFlMwhNa7lrPCY37fURunE
	 lj7C3NLf88CRFz8tv53eddze8pz+Nh+IwvrEm7isnBOAjckdruz1AilLSo/RaZqSzgmWY
	 QA3sUiVVyB2FIRKQLoxaPpmXDRFcXlLhZwfjBwy38iSteicESYl2PFcHT0l4mNxflxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dOEkPKYQ;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2145E606A31E
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 11:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2145E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dOEkPKYQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793015651; x=1824551651;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tysy31+zIqSbxAExMeBpmYlQeOFW3j5/c0YxXG8en2U=;
  b=dOEkPKYQgWcpRddoxpWg8VDlwwDAi8JoPqAcrCUZJtiQlVPeIPBA0C83
   y17Smh2OhSfh9DOjq1SWFFQBbGfhisC38C2p6CDFNiF85sNOoUzKHf0DD
   sgL9tyg9Ll0kcyVig3+xPHS0LDYRjcTQiPh5S9JgvDhAcbKfXyVe7OP1O
   7QFb3qGS4SDOwXuwWnX1pLwXtNH5LZgPcWx6KELPXfK+EBtZyvdOjZGsa
   q1hxZqjGCwj+ojzAx8YjdRtPQZfnKMniirsx4hv4wTaaUBYdhW2dlob1S
   vP6dQxBepeR5mif0IyIvMLreupo9Wc/xgTTpPMHZpVLavLK6JWVb09U0k
   A==;
X-CSE-ConnectionGUID: 9/yR8S/pShyI9A0sGSUafQ==
X-CSE-MsgGUID: Ju3h04Q5TCGPu8aBSqPdxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1557822"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1557822"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 04:54:11 -0700
X-CSE-ConnectionGUID: Pi5J+TLaQA+Tp4xgTv8PdA==
X-CSE-MsgGUID: +WJ0AfmeRIes2cxfaMGIHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4192383"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.245.74]) ([10.245.245.74])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 04:54:09 -0700
Message-ID: <6233126b-9ef9-4f69-9a52-42ff215b2109@linux.intel.com>
Date: Mon, 26 Oct 2026 13:54:06 +0200
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
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Dennis Wissel <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
 <20261024203558.3181711-1-yiyu@yiyuzhou.io> <SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
 <20261025111410.2c14fcef.michal.pecio@gmail.com>
 <7082e2e7-8d05-46b8-a26b-5b888a7a0545@linux.intel.com>
 <20261026105139.6b86cb3c.michal.pecio@gmail.com>
 <20261026123847.365209e2.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20261026123847.365209e2.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/26 13:38, Michal Pecio wrote:
> On Mon, 26 Oct 2026 10:51:39 +0100, Michal Pecio wrote:
>> On Mon, 26 Oct 2026 11:18:34 +0200, Mathias Nyman wrote:
>>> So even if we give back all pending URBs and clear the
>>> EP_DROP_PENDING flag we continue using the stale ring. We should
>>> either either move dequeue pointer, set TRBs to no-op, or clear and
>>> reinitialize whole ep0 ring at device reset.
>>
>> This may need to be fixed regardless, because EP_DROP_PENDING on EP0
>> can result from xHCI "Error" aka USB3 "Inactive" state, which (AFAIU)
>> may be cleared with warm reset, without reallocating the udev. That's
>> the "existed since forever" issue I was thinking about.
> 
> 4.6.11 isn't 100% explicit what happens if EP 0 is halted at Reset
> Device, but generally it should "terminate any USB activity, abort
> any pending events and transition to the Running state".
> 
> So just a Set TR Dequeue to current enqueue will probably work, but
> I think this has never been tried before.
> 
> I see that xhci_discover_or_reset_device() clears EP_DROP_PENDING
> even in case of Reset Device failure, which looks a little odd. We
> probably wouldn't want to issue Set TR Deq in such case and don't
> want to clear this flag without fixing the endpoint.
> 
> What was the reason for placing this loop after and not before
> the command_cleanup label?


USB core may reset a device several times without reaching 'addresses'
or 'configured' state in between resets.

The reset device command in xhci fails with a "context state error" if
the slot isn't in a addressed or configured state. Make sure we clear
the flag in those cases.

-Mathias

