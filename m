Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097391;
	b=jLpiihGnDMqwBftIvK+nNr7u7bsNgGPifua7o6On2DBfTu1JOYc/X9l+ytBcmRkmS5vH
	 qahauz7saSDxFYPV3YNdkfePolco99f4HC5Ij2CSr7VwJroot4JnQVNdsIoyiEStSqhZn
	 ji8xtYq8TfR7T7plwDNvr1ZF8QRNOlptFpd7EQnpnNXkjZVB/GhbA7/Kcf/jdZJEwlTFj
	 yKqXoR8E24NHHjAuxYOCfYgA+9iu6VHxqXlpPYSjPShlp5X1KcCQDpJWAqdhql7IWU9+Y
	 gponm11Qcy5sIIy+UGPx6NuwZwvJH6AAqsXTNk1ew5zwpXpcoPU3B34lDxqoCklQSlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097391;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dQIOB/6FJwPNuD/XyyHrXfdbiDTQhvuKSHijNSogEKI=;
	b=Mn7B/1Cp2dH2hw7R5aTxWYauV9/5tJXhznpR3PN8JMUSZ8Ao2795U9TX2Wp9pLBk3L8x
	 gIrhPCt8mCcU2Mpg/XA1Hr1e0dwITMvDDOOgkzOvERzZJ3QdnTzXO3RCqctfW64XRuxAM
	 20RU/VSPc7NqW9y69q67NZ7cdNTnsxtql5NYqzpYTtkxLObp2S1j5WkeQcUC/K2pupcSW
	 u8JTxeK1vrL40XQGkvVhxlSRML2ZWD9Gg45SjJNJvtOBUkcWBc9YO+AO93n6dhL3rHNNW
	 1y19OMYt3pVRSJ9u7mghMGn0E+8ewcGpmIF19DH919VCoodSb1sYN4W/e7+zkvLXP8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QwUI0Wlx;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52DC606A320
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 10:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E52DC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QwUI0Wlx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793097391; x=1824633391;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qJgTn/uD+9ZSmPrW26D3NbXmIc4vmCrFq+bSxNfnUgM=;
  b=QwUI0Wlx0zEyxrEL2XXo6/jI55gItE8WhC+bht4FeajUIvB7/dQ52Uxo
   YT4VwlCUJcK9b56BzKW2h6aQvLSfd6x7RPVKCUBpyrRatpAnpAVuuIPb4
   DOk60fxeVEuJaytjccCxkKxXkOYcjWuT8xb5KP+feXhh4tpg7xnmNm/qN
   7t3TUbtu37PEunqV+ZETfdExjaBmbpyebG0jk/hKrUaI7B84VGPlDcDWN
   0GarqQYoztoufIeTO4m+HKZJl0LErqVzmQlIGP3+ngf7xDhJviWmonz6A
   0XD0eMhx2oUJtRBicoZeqcCjpUKR3qFHygGHdLCbSb9n1cWCOy02nzmtL
   g==;
X-CSE-ConnectionGUID: RR5gg1cnR7ebk0H28uvxCQ==
X-CSE-MsgGUID: mEBLGJJ0TgCIKbT6h6PFLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1823685"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1823685"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:36:30 -0700
X-CSE-ConnectionGUID: JCiDRsriSEKJUBrJAZ9kpw==
X-CSE-MsgGUID: EpfM37a7TuWZDcTj6uTCug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4906086"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.245.227]) ([10.245.245.227])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:36:29 -0700
Message-ID: <842f8c77-ad37-4eea-9983-61a4086eaf5e@linux.intel.com>
Date: Tue, 27 Oct 2026 12:36:26 +0200
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
Subject: Re: [PATCH] xhci: keep ep0 blocked after disconnect until Address
 Device reloads it
To: Yiyu Zhou <yiyu@yiyuzhou.io>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 michal.pecio@gmail.com, regressions@lists.linux.dev,
 Dennis Wissel <dennis@dsine.de>
References: <qLQr_bD2TzCrwVMFdRe7Wg@dsine.de>
 <20261027084845.1588204-1-yiyu@yiyuzhou.io>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20261027084845.1588204-1-yiyu@yiyuzhou.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/26 10:48, Yiyu Zhou wrote:
> After a root port disconnect or link error, xhci_handle_halted_endpoint()
> sets EP_DROP_PENDING instead of resetting the endpoint, and gives back
> its TDs.  Their TRBs stay on the ring, and the endpoint's dequeue
> pointer still points at the halted TD.
> 
> If the device comes back before hub_wq handles the disconnect, a driver
> may reset it on the same slot.  usbhid does this after 1 s of
> interrupt-in errors.  xhci_discover_or_reset_device() then clears
> EP_DROP_PENDING on every endpoint.  The other endpoints are disabled by
> Reset Device and get new rings, but ep0 keeps its ring and dequeue
> pointer.  For USB 2 devices, usbcore by default sends a 64 byte
> GET_DESCRIPTOR before SET_ADDRESS, and so before Address Device reloads
> the ep0 context.  That request is queued behind the stale TRBs.  With a
> Keychron M5 the reset stalled for 11 s, and the xHC then ran the old
> TDs ("Event dma ... for ep 0 ... not part of TD"), writing into buffers
> of URBs that had already been given back.
> 
> Keep EP_DROP_PENDING set on ep0 through Reset Device, and clear it when
> an Address Device command succeeds.  That command loads the ep0 context
> from the input context, whose dequeue pointer is our enqueue pointer, so
> the xHC skips the stale TRBs.  Until then, ep0 requests fail with
> -ENODEV.  If Address Device comes first, as for SuperSpeed devices, the
> device recovers in place.  Otherwise the reset fails quickly, and
> usbcore re-enumerates the device on a new slot, as after a real
> disconnect.  The same applies when Reset Device fails because the slot
> was never addressed: the next enumeration attempt uses a new slot
> instead of the stale ring.

Thanks for the detailed description, this looks like a very targeted fix
for this specific hid case.

It still leaves the stale TRBs on ep0 ring, and relies on a successful
address device command to clear the EP_DROP_PENDING flag, blocking ep0
in all other scenarios. It also leaves xHC internal ep0 in the
'halted' state. Not sure if xHC internal halted ep0 state is cleared during
'reset device' or 'address device' command.

There are cases where EP_DROP_PENDING won't be cleared at all in this patch.
For example if slot is already in the default state when hci_setup_device()
is called. (slot is in default state after reset device command)

I'm thinking we should take a step backwards first when fixing this regression,
and then look if we can tune fine tune ep0 after that.

1. Make sure All TDs are turned to no-op before returning the URBs in the disconnect
    case.

    Add all TDs in ring to cancelled list, turn them no-op, and then give them back.

2. Treat ep0 differently, cancel all TDs on ring as above, but still reset it when halted.
    Allow a Set TR deq pointer command as well, and only give back ep0 URBs after this.
    This partially reverts the two patches that caused this issue, and clears the ep0
    halted state

3. Possibly keep EP_DROP_PENDING flag for ep0 until xhci_setup_device() as this patch
    does, but always clear it in xhci_setup_device() before it returns

Let me know if you find any flaws with this approach.

Thanks
Mathias
