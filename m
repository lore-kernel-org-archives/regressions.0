Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792766025;
	b=3289JE7PnjR46jv6Q9FIFMkvfqfM4CBhGqq3+aCNHHSy7caWdIJbu1C7zx2/C3vcx2D1
	 tZb/ly4R7aZnz1zHbPZVk8ISumFD1QvtdNGfCcp0+AZMrcnkqQvLmZRXwUJkDK/ZOE4Kv
	 oAH31VWk2UCwIHE/0A+eC1y3PqyiL+oC1QyhX++zQqwMBsMQ320KyCyZl2wv/7MvivMPy
	 7awc4KsMm9nEI2v3JCD6PjqmOCw24qdk1LD3x2g/ILfNmNyHIPOX226WRtlUq0ZxPmHE/
	 4M8oVQN+U9LAjKCh7Hj2EJmHst1S9+Jb12KlL0DmdithZqjyHmvdj5WuzDQxM15veCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792766025;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=V8NemUXnEy/uZt2Cu+0Yd05aRgR42WpZcSw5K+UYp1A=;
	b=0m1InjI+Fe5+WMNnYHM5yJCHyc6gYu/0+NMifp2ETYgvmnR8acBhTBJvrmqeUw7+q9tk
	 usA4XOqjh2erALGrgNi7oPSuXkYg3lC73QdNuoEwLU/NL1BZceYhWofSkBIqerLYk3iUw
	 Q90F/UzhYtaDfqvLu4mDPQcylORyRzrgF5U0JlH4pvU1kT9dauIbdWFrGVzJROYEu4Npg
	 bmxwUDm8H6KUhW7IYRETxVfVQxGre4avk6q/rBvBtdhAhzKAFksB/CJ0vnjtD0vTz3WPG
	 yNEIc/gQ7nqinskBJ/WqDvaHmmazw3Hed3gkP1uUdmqQL14lgdrDqcDPWWcW4g2vn6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cf43HmH2;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6447B606A31B
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 14:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6447B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cf43HmH2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792766025; x=1824302025;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tv6yBg04y3vmvhbt/Z+9ZyAk4dd7BzPXSfJZGShAblU=;
  b=Cf43HmH2F3c8tDOVyhhXZhd56UYc3jsca+Br3Y3zTRxU/7voSQjXcWGr
   w8fVaWefU+DRGoLH55g8Fw7STc8uls13bAzMf1o7/rhgUWfDWS8ZkNdD/
   waQJQ3hC1XjnALTqGezLBrLDs8IFqbPbH/jgv+hwAiwrvYy9b5Rv5KarR
   tOxQqsA7b4N9T7YiSyx8Ja6Vy9kR/gKB7rGcnGMFs7wGoQ7pqhirFU1XS
   pd3BapGPx3Y641Nex5BkBhkeOww6Hlo/tuWL4pq6eFgd51bB9UXuVO5G/
   TiCjpRNmxI9+8Cr/lXjpucEVCLLTDJeMK6xQalJ3gyZNCLgZVcbYy5vZA
   w==;
X-CSE-ConnectionGUID: s6AmNIKlScO3gheY+bi24A==
X-CSE-MsgGUID: MEWX27DbQOSeI+ynxaohRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1532099"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1532099"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 07:33:44 -0700
X-CSE-ConnectionGUID: Ke9B3BePS1KU+4IGXD7+6Q==
X-CSE-MsgGUID: hCLU23IKQUOyT4GMAL8ThQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="4016606"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.244.142]) ([10.245.244.142])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 07:33:43 -0700
Message-ID: <a10e27de-f188-487f-bb45-bca27d904d06@linux.intel.com>
Date: Fri, 23 Oct 2026 17:33:40 +0300
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
Subject: Re: [REGRESSION] xhci: 3x descriptor timeout behind a vanished hub
 since 7.3
To: Diogo Chaves <diogochaves@me.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev
References: <20261023132616.339833-1-diogochaves@me.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20261023132616.339833-1-diogochaves@me.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 10/23/26 16:26, Diogo Chaves wrote:
> Hi Mathias,
> 
> This is my first report to linux-usb, so please tell me if something
> is missing or belongs somewhere else.
> 
> Since 7.3, every time my monitor wakes up, my keyboard and mouse take
> about 15 s longer to come back. The cause is a stall in usbcore's
> enumeration of a device behind the monitor's USB hub, when that hub
> drops while its child is being set up. Reverting
> 
>    7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
>    042aad8d0db6 ("xhci: prevent endpoint recovery after roothub disconnect")
> 
> on top of v7.3 makes the stall go away (A/B below).
> 
> Setup
> -----
> - xHC: ASMedia ASM4242 USB 3.2 xHCI [1b21:2426] (the board's USB4
>    controller), bus 1.
> - On its USB-C port: a monitor with a Genesys Logic USB 2.1 hub
>    [05e3:0610] (1-1). Behind it, two Logitech receivers: [046d:c548]
>    on 1-1.1 and [046d:c547] on 1-1.2.
> - On every wake, the monitor's firmware drops and re-adds that hub three
>    times in about 6 s. This has always happened. The last drop often
>    arrives just as hub_wq starts enumerating 1-1.1.
> 
> What happens
> ------------
> In this race, 7.3 logs `usb 1-1.1: new full-speed USB device`, then
> nothing, until `usb 1-1-port1: attempt power cycle` 3 x
> initial_descriptor_timeout later (15 s with the default 5000 ms).
> Before the series, the power cycle came within milliseconds.
> 
> A/B test, same machine, same config (the distro config trimmed with
> localmodconfig), usbcore.initial_descriptor_timeout=1000 to shorten
> the runs, monitor woken three times per boot plus the wake at boot.
> Time from `usb 1-1.1: new full-speed` to `usb 1-1-port1: attempt power
> cycle`:
> 
>    v7.3                                         0.1*, 3.1, 3.1, 3.1 s
>    v7.3 + revert 7e0ef4332ed9 + 042aad8d0db6     0.03, 0.03, 0.03, 0.03 s
> 
>    * at boot, on v7.3, the hub was gone before the descriptor read went
>      out (`cannot reset (err = -71)`).
> 
> Time from the first drop to both receivers working again: 11.2-11.3 s
> on v7.3, 5.9-8.2 s with the revert. The rest of that time is the
> monitor's own three resets.
> 
> On v7.3, one boot also hit the same thing one step later. The hub went
> away after 1-1.2 had its address, and the full device descriptor read
> then waited out USB_CTRL_GET_TIMEOUT:
> 
>    08:56:10.097376 usb 1-1.2: new full-speed USB device number 12 using xhci_hcd
>    08:56:10.282395 usb 1-1: USB disconnect, device number 10
>    08:56:15.720384 usb 1-1.2: device descriptor read/all, error -110
>    08:56:15.723375 usb 1-1-port2: attempt power cycle
> 
> Trace
> -----
> The trace below was taken with xhci-hcd trace events and hub.c dynamic
> debug, on a distro 7.2.8 kernel that carries this series as a backport
> (I saw the same stall there first; plain v7.3 behaves the same, as
> above). initial_descriptor_timeout=1000. Slot 104 is 1-1.1, behind
> slot 103, the hub. Excerpt, CLOCK_MONOTONIC:
> 
>    754.760938 xhci_handle_port_status: port 1-1: 0x000202a0 Speed=0 Link=RxDetect PP CSC
>                 (the hub is gone)
>    754.807016 Address Device Command (BSR), slot 104
>    754.833730 xhci_urb_enqueue: 1-1.1 ep0 GET_DESCRIPTOR(DEVICE, 64), slot 104
>    754.833732 xhci_ring_ep_doorbell: slot 104 ep0in
>                 (1st try, rung)
>    754.833755 xhci_handle_transfer: CTRL Setup Stage, error event
>                 (fails at once; no giveback)
>    755.861009 xhci_urb_dequeue, Cancel URB, giveback
>                 (usbcore's timeout, 1.03 s later)
>    755.861037 xhci_urb_enqueue, 3 TRBs queued, no doorbell
>                 (2nd try, never sent)
>    756.886018 dequeue / giveback (timeout)
>    756.886054 xhci_urb_enqueue, 3 TRBs queued, no doorbell
>                 (3rd try, never sent)
>    757.910008 dequeue / giveback (timeout), Disable Slot 104
>                 (then hub.c: "attempt power cycle")
> 
> A possible explanation, from reading v7.3's xhci-ring.c with the
> assistant mentioned at the end (I can't vouch for this part myself, so
> please take it as a lead, not a diagnosis): the Setup stage error reaches
> finish_td(), which calls xhci_handle_halted_endpoint() and returns,
> expecting that function to have put the TD on the cancelled list
> ("xhci_handle_halted_endpoint marked td cancelled"). But
> xhci_handle_halted_endpoint() now returns early with -ENODEV when
> !rhub_port->connected, after setting EP_DROP_PENDING. The TD is neither
> cancelled nor given back, so the URB sits until usbcore's own timeout
> cancels it. Then usbcore retries. xhci_urb_enqueue() accepts the new
> URBs, but xhci_ring_ep_doorbell() skips EP_DROP_PENDING, so each retry
> also waits out the full timeout. Before the series, a disconnect went
> through the endpoint reset path and the URB came back with an error at
> once.

This is very likely the case. This same issue was reported, and fixed in:

https://lore.kernel.org/linux-usb/20261013073825.17962-1-yiyu@yiyuzhou.io/

That patch is sitting in my for-usb-linus branch.
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git for-usb-linus
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=for-usb-linus

Does it fix your case?
I can add 'Tested-by: Diogo Chaves <diogochaves@me.com>' tag to the patch if you are able to test it.

Thanks
Mathias
