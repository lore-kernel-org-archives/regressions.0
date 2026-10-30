Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379493;
	b=21m4CAOUmNV3iuRUV9MLIeXxpC+iaQejoaxktL4e6atxEQGud1oKOVfsG7AKLolY0C+3
	 CuYeOHq9DOzuZUq7PTrAWrwh87xkDpGuorB0ACa0LaQiZK50/rRD4roIWWV4MdR29s0E2
	 jlcJcV0r2izc5nuCxkMrQrbKk3Vhhwx7u+lXPGVr47YP5ycJW6WsB8bzeS5nY0RBnujVA
	 5xbAl4sPNLjHy2vTWdAkLbOcXfN3ViP0gQRCvPjigGgRkAA2Zv5Izj285cc73Z7fjkVTx
	 kLqz/PGI0D43YowKEE09SienArTn3ZFjSIfpDu5ajGawhCqpY8WjQTA4xNJm2ArwKcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379493;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=PTW8I6iZfsC800YjWu3LAWaa5wQe3pJ93PAUK12Q3Xg=;
	b=SIt/iZ/O3qMxN9ruadr9v+7Oppw0vkHZchbV5YbFRy2NB1OSjXdreuxYmHR04OevLUeF
	 o1HthkIbliF7Ftferd4vVpg9p1J4szzH8nEOZz2mHCjBg7pqqy+JieiQ8oXxl+y9aOFFH
	 o8Tr5Rg4VPpCe+6/arJYDKtAZ+ZaimmKMcuV9mtnHjNAQjkWXHyUVW2YJpsEzS3pQ2yKP
	 U8e+RPpn8k54YZTBsEpJ8xtgEmO3KIp7lGMlxGdf5f0qNpZuAHxdmK8CiYFC8XBbCeTgk
	 d3e8Aa3w/cNQiZykx+H+mwDD1986O6mld/SdlXd0CbG5sp7vXi14Dby1sPeLarAfkrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P9saNjs+;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E31606A31A
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 16:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E31606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P9saNjs+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793379492; x=1824915492;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SZOyLKymwrogOfg2BP1CMLkHtyxNMc/8mlf9iHEmM4c=;
  b=P9saNjs+uFVdRRTMf3iGwzjsZ7v9mGhTfTrlBam6P7UdgVTAOLNNFUig
   /giduhoijIjygadKYWXfwKi3eTfXP9TeNopRo6zaufZhXiJm9nf+WEq9X
   cJIVJiO6oQROU6+sMDRzdhSKYTaqQg9+bIH0M8OU+AEB+YHVhswpr71YA
   PjzSkdna0LyUm3cXDha7AyrZHYPWOHhNeppLCOrGV4H0N8FHlNxe3Lnh8
   yvCrn0vym3y/bjY8Sm7RvDteX5Ch4BCI5RKoCpvOJV5M5lfgNPTwpJ25d
   d44yWoGzPEhJL4IGaG73ZrLUrJgENSH2BgJhk8PDNopCPqwaDXlGfaH5t
   Q==;
X-CSE-ConnectionGUID: dRaaJqB7T9yoZzFKr7Q1HQ==
X-CSE-MsgGUID: tt553TlDTbudgx5Mdb4rVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2164471"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2164471"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 09:57:19 -0700
X-CSE-ConnectionGUID: 659wPiD6TK+wG7+2z8UGqQ==
X-CSE-MsgGUID: dncL5VLBT/OdtNzTiAQ3NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5369874"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.244.25]) ([10.245.244.25])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 09:57:17 -0700
Message-ID: <35b20a70-f1b8-4e86-9fb4-35877b63d6fd@linux.intel.com>
Date: Fri, 30 Oct 2026 18:57:14 +0200
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
Subject: Re: [PATCH v2] xhci: give back TDs and clean up ep0 after disconnect
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, Yiyu Zhou <yiyu@yiyuzhou.io>,
 Dennis Wissel <dennis@dsine.de>
References: <20261029204324.658845-1-mathias.nyman@linux.intel.com>
 <20261029204324.658845-2-mathias.nyman@linux.intel.com>
 <2026103009-handful-labored-d1ce@gregkh>
 <f362a385-e1d6-437c-a31c-fbf4414fa0f5@linux.intel.com>
 <20261030130532.36a75025.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20261030130532.36a75025.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 14:05, Michal Pecio wrote:
> On Fri, 30 Oct 2026 13:05:16 +0200, Mathias Nyman wrote:
>>> And sashiko seems to object to it, is that response correct?
>>>    
>>
>> It does find one potential case where this patch does not fix the
>> enumeration of devices that disconnect during reset.
> 
> Honestly, is this 7.3 code being fixed here reliable at all?
> 
> As Sashiko points out (and I did before), we are 100% at the mercy of
> hardware and USB core with those "connected" and "link error" flags.
> Sashiko thinks that we may fail to clear these flags in some cases.
> Is it guaranteed that we can't clear them prematurely at other times?

'connected' and 'link error' flags can't be cleared prematurely, they
can be cleared late in case xHC doesn't generate port change events
for port changes. (change bits uncleared, hub driver is polling)

Sashiko reports the exact same issue in your 4/4 patch.

We can fix that, ask Dennis Wissel and Yiyu Zhou nicely if they still
can run one more test round. Maybe even make sashiko happy.


> 
> If USB3 link comes back after core has cleared all status change bits
> (brief disconnection), we will get another Port Status Change Event,
> observe the port in "Connected/U0" state and reset these flags.

This is what we want.
These flags are tracking root port states, not trying to track usb device
states

> 
> Is it guaranteed that core won't clear change bits until it finishes
> disconnection of affected devices so that all URBs are unlinked and
> we can no longer run into those HW bugs anymore?

No, and that is not the goal.
We are trying to avoid excessive endpoint state mangling after devices
are disconnected. We avoided too much in 7.3 when we left ep0 in a bad
state, assuming it will be dropped and freed after a disconnect.

> 
> If this fails to work, it's another regression vs 7.2 and prior. The
> old VDEV_PORT_ERROR flag used to stick for device lifetime. And it
> could have been extended to all disconnected devices, not just the
> one directly attached to the root port, to fix disconnection of whole
> trees with hubs while avoiding the above race condition.

moving the flags to all child vdev devices won't help, you
have all the same issues, plus the fact that vdevs are sometines
reallocated mid enumeration, and sometimes will stick even if device
briefly disconnects mid enumeration, just like ep0.

> 
> The reported USB2 regressions would have also been avoided, because
> old code only applied to USB3 ports and there is no actual need to
> generalize it to USB2 at this time. The bug still affected USB3, but
> it seems nobody uses USB3 devices that trigger it.

It's more about the hosts than the devices.

It appears some xHC hosts stop reporting endpoint states and changes
correctly some time after roothub connection is gone.

I recall some xHC had to disable soft retry because it almost immediately
went to some internal sleep state after last usb device was disconnected.

xhci driver first tried to soft-reset endpoint a few times, then hard-reset,
set-TR deq, restart ring, then hub driver noticed disconnect, cancelled URBs
which lead to trying to stopping the endpoint again.

At this point xHC no longer responded to stop endpoint command,
so xhci driver assumed host was broken.

once a new device was connected to host it immediately 'woke up'
and processed all endpoint related commands correctly.

> 
> I suppose I could fix the Renesas disconnection issue which the 7.3
> rework tried to address with an alternative patch smaller than this
> fixup, provided that the whole series is reverted. The preexisting
> USB3 bug would remain unsolved for now, however.

Doesn't make sense to start from scratch because of this sashiko report.
You'll just run into a new set of issues and regressions.

Thanks
Mathias


