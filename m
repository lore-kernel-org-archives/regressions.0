Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388434;
	b=09yVz5UxI0Xf4ic0Gtfp4DJyX3cltcDnLvGJGN3eWO6jBqkugaL/UfMNUxuX2/lynSqQ
	 ChfckaCmbbHOWvgez2h64e9Xwk8BA6QRIwaxZ0Eu0HnnkFNAjo9ZC61icM09Mh218t+Hs
	 XYMzr4RM37bOouytKZVTswV4DuobJ3lgjY7wpKv4WlBRuz4Kol15rrgt5DOc99iiH4pGv
	 hpKbZVWjQzg9Ab+VYHUUSrcZghKgUzBSvwYl6ycTxPC6UsGuXrHrU87XYZ+PIskrvUnbA
	 y5/kWzNbHwJAubw8gS8062pa+yHrdu3UheQMPWooTyYLSSOPZPToGglBKzAw+UdO3Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=W3eqtySLpsSRrLHxnJHA1+br5XulPGqh1IskE7kkJD4=;
	b=PvSymzvb2vltmR+NdlQMOy5JSvwQNitk9sIf21EmmFCYiwb+X+0WGxWtK5hGXzMjcAki
	 tMOpAToHVsECrmo0b5jmn82oU42ArF6ABZN28FW6M7R0uY6EE5agMadATaJoWd1krdGQe
	 2LmLvGDXMv3Yb0G5zjkO1PZbLe0uT60ODW5GOkfT1+3QNLS/1QuKuKNsg6aAprFoxvoCV
	 ynk7+vrx8KdQ1ib8dt0Ik+GZ1eOTJD1meMkD0Ohs5X46UhQ0FeZ1hdoU9ZgoTcoR7yG7S
	 yMjzhOp5OJ+QSnbOXd4byw6TyRPUC4GTDLQ08i/8x7hd7ysiDeGkVXGa77ZidTvtOFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GBzJ3fBG;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD37606A31D
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 19:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FD37606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GBzJ3fBG
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so14383985e9.1
        for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 12:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793388432; x=1793993232; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3eqtySLpsSRrLHxnJHA1+br5XulPGqh1IskE7kkJD4=;
        b=GBzJ3fBG7P3amfY3ZJ8LLtYBEtShKombsbHJUGDEF5OhjSAyMM+MzIxu+Wnz3/LvkL
         HidCZ0T0iWBO8igcqCfl3JVdjA8g7eDRzC1LsUA05ZHZO/veLcQ0Qd7yr6I+Y2iBcXww
         frtNWeePWxOJqdhVGF1u1FJyGDQtBjaOsJHS/S2jcym+4EHlyUYyK9WAdHIs0fLgi2Om
         1snAbjK8SVJjKaEQtRQWVrsMTbUCQT3QT0uZCJIwZ7CE60dnWumFX3CMFN9V+9/PAwo5
         aSZecUJUhCnHaz2OtJ122kp0/+ktPqB6dgsee1SM4SvT/AQ390PbfazXZ8M+ojqsxg4u
         R/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793388432; x=1793993232;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3eqtySLpsSRrLHxnJHA1+br5XulPGqh1IskE7kkJD4=;
        b=pCjR5hMJffBtrozySnUs1FMHLpYGJ1B3PZ98ffLl3x1SFb/wWce5IcXxNjv6uSJ/nV
         n1WcVri3Geo3JX41s/qzNcyZvcGATkwmeARWW9cdV/kd13Yl2BMfSKWfuoi3/yrh68UG
         LENPHVawb5iLvdL+yIKSQvcw0/fpTIAm3WCJorrViJHCVxI28e3E/DlmvQ4BeWn46YBF
         v6o9oD/AkvLQsmKWdhQBI9HW/AMkvDHxxjDo7dzuDbNRKlqHGIC1ef5Kbnk53KLXv4T2
         /GCp8WpC5F8i/YoV90vvSY1DVIId2/0yCh0gTFuhsIbwKQv5OIKt6wwTjwTrQkwzE2AQ
         lReA==
X-Forwarded-Encrypted: i=1; AKwUvBw419eVOskSidwQPPdBt8onF+GyIT7nUhwv2Yx3nVlLVWegezlRufZIjwWyCS0NEUYL/N0iZqpalOegMw==@lists.linux.dev
X-Gm-Message-State: AFq9FYK+A2j5f9A9bephJg+eJE1mdh9CTtOtT/DCLdvXgid1NrEYtiAM
	aeQVDH25Q9c8SWegY8uCasq86bsHjnlMofFnrN3WuXQRVmVkW79hRGe2Zdt0uVEc
X-Gm-Gg: AYBFou1+hj0S3tBdhuPth6gOfZ2I9ZZM9Yc4DwlJo/BxnjvfDqxsCmyik19sfn3UbAA
	8CNcabHWKwF8EnjHwJ8mw4D5Mpj+6O07fvAmJ4A7sTWsPHpk4YmIM9MMYEcNktsaohvmUieKrFf
	mJzWSK+4zLDW1gWl2HvB7eNgKKBDnEwovddMjbaFYG5eJecjPtFGCQe2h2sTzGH9sDCYZdiGbW0
	Ko30TkZM1PnOglBkipMRUT3a3XjUCG984rKyrzQdYSCnBgFTNnzAV5KskIW5bM5hS8m7VRCB16y
	XGIKSJLsvGJEPYSenefWlHMNeP2ZFlYpMCRTjChPI8UYVyEr3pNNVpRoUx+ORbPMunZc2ZDSEbk
	hR1ztEOuFF2aNhfUB18FJmHBEGTp+H8p8MczvJJOLERS47VKVYYwcZ1hlrR6AvUpCXWcCq4XYeP
	Fx0P0it942TKmIEm8xI2jhgYHaXn2CcyDQHOv9M82UcOAfQA/EinnLijrHs555kHPIrbEOmZlK7
	w2Wp4xz2Nln5wHn5jsulBqALYRGO6QGjg83OHtEPlhYw+I3CHg33Jipe0C9OGQ0eEsHyoHsrvJs
	ZYzCnfLsSuD33rlN4TYgMjfXGRol35ydZUDVD4aTQ8Ot7KUd8YEcOIQ8j4w=
X-Received: by 2002:a05:600c:848c:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4ac17a3628emr76096785e9.14.1793388432009;
        Fri, 30 Oct 2026 12:27:12 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723bfsm4623213f8f.15.2026.10.30.12.27.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 30 Oct 2026 12:27:11 -0700 (PDT)
Date: Fri, 30 Oct 2026 20:27:07 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, Yiyu Zhou <yiyu@yiyuzhou.io>, Dennis Wissel
 <dennis@dsine.de>
Subject: Re: [PATCH v2] xhci: give back TDs and clean up ep0 after
 disconnect
Message-ID: <20261030202707.6dde12d2.michal.pecio@gmail.com>
In-Reply-To: <35b20a70-f1b8-4e86-9fb4-35877b63d6fd@linux.intel.com>
References: <20261029204324.658845-1-mathias.nyman@linux.intel.com>
	<20261029204324.658845-2-mathias.nyman@linux.intel.com>
	<2026103009-handful-labored-d1ce@gregkh>
	<f362a385-e1d6-437c-a31c-fbf4414fa0f5@linux.intel.com>
	<20261030130532.36a75025.michal.pecio@gmail.com>
	<35b20a70-f1b8-4e86-9fb4-35877b63d6fd@linux.intel.com>
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

On Fri, 30 Oct 2026 18:57:14 +0200, Mathias Nyman wrote:
> > If USB3 link comes back after core has cleared all status change
> > bits (brief disconnection), we will get another Port Status Change
> > Event, observe the port in "Connected/U0" state and reset these
> > flags.  
> 
> This is what we want.
> These flags are tracking root port states, not trying to track usb
> device states

Fair enough.

> > Is it guaranteed that core won't clear change bits until it finishes
> > disconnection of affected devices so that all URBs are unlinked and
> > we can no longer run into those HW bugs anymore?  
> 
> No, and that is not the goal.
> We are trying to avoid excessive endpoint state mangling after devices
> are disconnected.

The problem is: we need to detect those disconnections, and we rely
on aforementioned port state flags.

We only detect disconnection if an endpoint halts while the flag is
set. If the same endpoint halts a few ms later, and link is already
restored, the flag is cleared and we don't detect disconnection.
Many interrupt endpoints have long intervals and halt with a delay.

There is risk that the disconnection has caused permanent change in
HC state and some endpoints need those workarounds even if link is
restored, though the only documented case so far seems to be Henry
Tseng's Configure Endpoint bug.

> > If this fails to work, it's another regression vs 7.2 and prior. The
> > old VDEV_PORT_ERROR flag used to stick for device lifetime. And it
> > could have been extended to all disconnected devices, not just the
> > one directly attached to the root port, to fix disconnection of
> > whole trees with hubs while avoiding the above race condition.  
> 
> moving the flags to all child vdev devices won't help, you
> have all the same issues, plus the fact that vdevs are sometines
> reallocated mid enumeration and sometimes will stick even if device
> briefly disconnects mid enumeration, just like ep0.

If vdev reallocation implies that the slot is disablend and enabled
again, then any bad state goes away together with VDEV_PORT_ERROR.

If a slot survives a brief disconnect, I suppose we are hitting the
"resuscitation" case, so we should get a reset_device() call and
then clear VDEV_PORT_ERROR.

> > The reported USB2 regressions would have also been avoided, because
> > old code only applied to USB3 ports and there is no actual need to
> > generalize it to USB2 at this time. The bug still affected USB3, but
> > it seems nobody uses USB3 devices that trigger it.  
> 
> It's more about the hosts than the devices.
> [...]

Yes. But until 7.3, workarounds for disconnected devices were limited
to USB3 and nobody complained. The new Renesas disconnection bug seems
limited to USB3 devices too. So if this code continues to cause issues
with USB2 devices, restricting it to USB3 could be an option.

> > I suppose I could fix the Renesas disconnection issue which the 7.3
> > rework tried to address with an alternative patch smaller than this
> > fixup, provided that the whole series is reverted. The preexisting
> > USB3 bug would remain unsolved for now, however.  
> 
> Doesn't make sense to start from scratch because of this sashiko
> report. You'll just run into a new set of issues and regressions.

The point would be to buy time and see what's the bare minimum of
functional change to avoid bugs that are confirmed to exist.

But I start to see that if it turns out that all the functionality
implemented in 7.3 and the fixup patch is impossible to avoid, then
the code would end up similar in the end.

The biggest saving probably came from "cheating" and relying on
drivers unlinking their URBs in disconnect().

Regards,
Michal
