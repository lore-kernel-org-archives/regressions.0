Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100429;
	b=buzatYkIorlX2Uti/6Xk+W8F+i+KTRJ7vH2jzoypwtpSOTupcTH8I6pfcSL6paBPOClM
	 ABOh8JoM9vPdS1Vc/ePEh/tV595hGzuULIwvfvyxNhO+Ki/+Viwv0UFiotyxit/ZW/WL1
	 V8c1ZslQYZpNXTqhMPP/dwQNVXtdVaD2fpWnn9s7Q1rGZcHoPspPeQXk7fXSZgV2kzNDJ
	 Zc/w8wk6qmFk7Ajbr87FqEUc4qiR2edhH8AXetpRl5BoVc3BWZxDraDX2yyDcBP8qnVEs
	 Z7iUOnAE5lNOfOaNZHDvP8gK4RGljjEx0qFqglJM6ijCdu6kX8dT6fE6l/CG5S0nH1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=h9bNGVeG0k5RZYVkn4G41NoOWYbyxLp1DbxTQ4HVoyk=;
	b=IpDpM2FW8Sll63yeOEqNfBn9kZwfaVQYw1vddZZiIENTMT3IxSkZNu57HFZewqhe5vBu
	 vVuS6UQi0PDj7rbjUs+pCHH/xayaTqJT8NTn5BlIyIM634cuiC6lAXz6druudyGULQ/9M
	 Jsmwj8UcMDKuK9Gli1ki+clYMx8WEDTQ1ee40n6c61hlMOAOblivdAVw7yK5iqZDyOsr0
	 boHV6kwXiPRQVyeJGRFPcTFEc73+qMfZrs1tdeiuOXWMs9ObqGdkj/1IPelZdoM1LQVV9
	 dVfh+z7VD7FmZQx/5gxbRnBLcTSKrgY6MIeBk/VfKESlbRdfPyYKuDC+jbxYERRDCkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bIeqa83C;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDBF606A31D
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 11:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBDBF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bIeqa83C
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso26154015e9.1
        for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 04:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100427; x=1793705227; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h9bNGVeG0k5RZYVkn4G41NoOWYbyxLp1DbxTQ4HVoyk=;
        b=bIeqa83CX7dI6ySHc3Poqz1PpIhJsiSBSqCYFxwFTIPacoEt2KqcQvBgOV/ASxSnYs
         2pMipXnVhP72fD7j1/fdfPw+JU0gp4TTCME7Br8MO944IMl4WG7AlvlQQZVXbHdmgYcT
         sqHoUiZInQzlW497Q7y0vV7I/w/tGZfS8qzuiPT3tnpwI3eYZgmik/YRPleHwADgRd92
         i0WQgLHbGhTpxTNN5ZQXpl9otg7jVmSQRZ8cBH+ZjtDQjQTyvkDn221GvgOGEU2cc6uR
         hcp7GmkFWwWtu4tJfhe0zreqnHm0DMFPnUIRJiRAWfcgIxAAbfIq6klD3AX/I+VDn27g
         czFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100427; x=1793705227;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9bNGVeG0k5RZYVkn4G41NoOWYbyxLp1DbxTQ4HVoyk=;
        b=NnbC7Hc/XNnBnqCIsM1CPyZ6/b53KeiCmknNHbNyEBNdLpqQCG9qbpsqn1km9hYAlM
         RRD3waft9+dcFiz4GdHmEUgRPiDhHzZUJ/Q6uRRZTqefRaHUK9vt0SlSjVuC6rf4UJGW
         gogIZykciB40aPuRs6vEQKYGoihsa9DVb5/VtP3n/Czcj7Yv8k84PYql7i7VBp7UMupE
         G6dIie65MtQRVfsBc00GQyRBzlYnWe1A91Hrfs+PSjJziWgtk9el/tG5kvqsrEfcTWoJ
         aTH1TDjtmxNvuauIpzic/djj0zIb/eNA4awuvlznbXGe2CQl28o7rIrANDVy/VB44ypT
         7INg==
X-Forwarded-Encrypted: i=1; AKwUvByYb7brOTqv17HqLP8laijTiiVoEjR29UQXlfLLwPbEM+cHjKF9QZOZ9XTMRQXeFd9GKoLb0Gycu33bAA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLaIsZFfIpWoRg6jW6OjT8DfPLaTtyhdcnt/gAGBsevvJPI3iQw
	lkoE6fnd91u80VOVzdfR9o7aXSJcrkK0S85K75D0dwjNbJ8meyRLUtQk1lxvDTJt
X-Gm-Gg: AYBFou2juSeufNL/fqsr2kyX9woD9y0UBjSWHOVHQeFmO5OZ21czYOx0sxCFOPhYJuB
	ay2y13JKKzWWjTsu0MyxrAf66f+BfHGwB8WiVo4jFNoBNH3Z+zgUosimYlDVvg0WPgoFE+N5DYo
	imjG6vxim5VLkqODQ5QTxcpEeyH7t0KzNNSA0mC0E2sgbH9dTX+HkPSJAsAAYW2k86J7oWkWP9H
	D7ZVOqKjUUHyUR+3TIthVSn01yk/9AsDpn80P8DYfcr11Ql/jcOaWnXiZGDTRm6uHluyz9HbpJi
	ktYusWadXGiZBTffeqV4rZI9/Vt7Y1wS95t7APvgqQH2jdj5w/pdj2bvzke/hXxSlKW/N6+hAK0
	wilWE6J5ofSC1zoy6FEVgs9vdJxfDu8HXlyuSbDaQOCS649335F5iibBkhozoIs17YSgZHEdfYP
	wmlbhgp0TgmdmSIRQCyhRl3qJziakNryYOMnyuby83jAHCouoca7H/6Of1y7EGxdQF2GojGfp3u
	9YfeNFhXTxPlhUb2fGghEmGfBJGxF6NcP51oeeVuImCRUyDRfSfym8Xcci81g67l3sZ6sQNXo6A
	/SLgnVElyw==
X-Received: by 2002:a05:600c:530e:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a35acbee85mr182266245e9.26.1793100426728;
        Tue, 27 Oct 2026 04:27:06 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f3e00asm449397205e9.0.2026.10.27.04.27.05
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 27 Oct 2026 04:27:06 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:27:02 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev, Dennis Wissel
 <dennis@dsine.de>
Subject: Re: [PATCH] xhci: keep ep0 blocked after disconnect until Address
 Device reloads it
Message-ID: <20261027122702.77f01cb0.michal.pecio@gmail.com>
In-Reply-To: <842f8c77-ad37-4eea-9983-61a4086eaf5e@linux.intel.com>
References: <qLQr_bD2TzCrwVMFdRe7Wg@dsine.de>
	<20261027084845.1588204-1-yiyu@yiyuzhou.io>
	<842f8c77-ad37-4eea-9983-61a4086eaf5e@linux.intel.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Oct 2026 12:36:26 +0200, Mathias Nyman wrote:
> Thanks for the detailed description, this looks like a very targeted fix
> for this specific hid case.
> 
> It still leaves the stale TRBs on ep0 ring, and relies on a successful
> address device command to clear the EP_DROP_PENDING flag, blocking ep0
> in all other scenarios. It also leaves xHC internal ep0 in the
> 'halted' state. Not sure if xHC internal halted ep0 state is cleared during
> 'reset device' or 'address device' command.

Addres Device is not suitable, unless preceded by Drop/Enable slot.

Reset Device:

  For the Default Control Endpoint the xHC shall terminate any USB
  activity, abort any pending events not already posted to an Event
  Ring, and transition the endpoint to the Running state.

I see no mention of "halted" in all of 4.6.11. Logically, the spec
seems to assume that SW can use this command when EP0 is running and
busy, so it can transition to halted while the command is pending,
so the xHC "should" be able to deal with that.

We know how dependable xHCI hardware is in practice, but actually this
might work because IIRC Windows also doesn't bother resetting endpoints
of disconnected devices. I haven't studied this very thoroughly, but
I recall noticing that it queries PORTSC before resetting endpoints
and it violates the spec by dropping halted endpoints, just like we do.

> I'm thinking we should take a step backwards first when fixing this
> regression, and then look if we can tune fine tune ep0 after that.
> 
> 1. Make sure All TDs are turned to no-op before returning the URBs in
>    the disconnect case.
> 
>     Add all TDs in ring to cancelled list, turn them no-op, and then
>     give them back.

Seems helpful and harmless, doesn't account for potential TRB caching.

> 2. Treat ep0 differently, cancel all TDs on ring as above, but still
>    reset it when halted. Allow a Set TR deq pointer command as well,
>    and only give back ep0 URBs after this. This partially reverts the
>    two patches that caused this issue, and clears the ep0 halted state

Sensible, if Reset EP/Set TR Deq on EP0 of a disconnected USB3 device
don't trigger HW bugs. These commands only change some EP Ctx fields
and don't submit or abort USB transfers, so they may be safe. It's even
possible that they are safe on all endpoints, but who knows.

I don't think this will cause any issuess on Renesas, even generalized
to all endpoints, and I still have the HW and ability to test.

We could use some input from the author of b8c3b718087b ("usb: xhci:
Don't try to recover an endpoint if port is in error state.") about
those issues, whether they affected EP0 or not :)

> 3. Possibly keep EP_DROP_PENDING flag for ep0 until
>    xhci_setup_device() as this patch does, but always clear it in
>    xhci_setup_device() before it returns

Does this result in URBs failing to submit before the device is
addressed, causing USB core to drop and enumerate again? That part
does seem a little dodgy. We may agree or disagree with core's
policies, but they are what they are, and not an accidental bug.
Doesn't seem suitable for 7.3.

Regards,
Michal
