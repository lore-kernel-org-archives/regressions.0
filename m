Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793521779;
	b=TXkK0uVpShBPkf75t9R0T3eFsi5HmJCI6LbpQ2nc3wXbfyZgl1FECJhOihTlF74InU+O
	 tH5tjE6aEQw2pYKbGLpMxo4flA/qat8ALnEp2YkbLP2Uyf3phfy8NoNa2aD01rSt8MoyW
	 lTw4f9vPZCHSpKYoFMtFudEJe5Yqnvsw9xQ0WhQxNhB4HBvfy2XEJhtTRlZQxTOUZE9Vg
	 bKncywKXxDny0CfUyK3Q7eDe8O7xnmDmaehnxRn/Zcv2b2kvNp/ax3RDWKpzedftkZxt3
	 0O/FOwhCNGpz2WKH0EumcdJLfG8kWKTa3hqppcvU4vyWKvDBVsyDZk0Bu29dt+Pc+CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793521779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=CrY4G42DWgUQkrodiQ6Nsohi3rTiSwswU6zN9JB0NB0=;
	b=jB/8GvjnUhWoAf4tcG7iL3aPf3nMlsPecMUWazpFWYHbWRqD0EQ5fZeeGDcADcIgCtjD
	 bLakUuZrMxpD2bRqlLGGdYYPndMDoZDq7XJdXG9SC09GjYU7n7H7ROVCqQ+jCiNbPs3Zk
	 s9+QnqyAmY4ozP+mN8O7Ua1wNXN2WOyLgFaNbPlRH5zibI8LnAOat4/NePEp2J8yx2CwI
	 mb/x4P+xFnYStjhliQT7II2HaOc/snpseSUtRW9pKFFhEXIoRwGpoua986wk8TkoCUZNy
	 yzF2OnHzoC44yjP62zAWsONOk+KlSXSHTJ5APtop1fO1Vked+N2HWIwIfYRKM5GSReA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c5WrkMma;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C8B606A327
	for <regressions@lists.linux.dev>; Sun,  1 Nov 2026 08:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C8B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c5WrkMma
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e4831c028so1851505f8f.0
        for <regressions@lists.linux.dev>; Sun, 01 Nov 2026 01:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793521778; x=1794126578; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CrY4G42DWgUQkrodiQ6Nsohi3rTiSwswU6zN9JB0NB0=;
        b=c5WrkMmaz7strf+CBOMEzWDXusEP8sn0EsFqeKuQxCWf4sUdlB5SbFAjzo2Ss+i2jl
         2NcQGs9peShIVC6g/e8tOEf74YueLO3HPGRyQNPzmeinqgCjhgZkbBJ2YaTlU+Mwl3YF
         F9Y+B3S8RN80Oe8Z0HVRPmwd890hnw77t4jOqWBjWa0Fzh0uQdQ8NtKDDQl2z8mOKP/E
         j9FUifXAPYwbfOXQh7Gw7wqCeDwCcGvnloouLlCjLKwfkmWLIKJIsAiftVtpVrk7t4a9
         KbnKwvFRvVO/p+AO+ShabaoPPIvgBHs28o31G9cOIsdPuIML6vO49OCbwH/Ue7sEN1iS
         /uCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793521778; x=1794126578;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrY4G42DWgUQkrodiQ6Nsohi3rTiSwswU6zN9JB0NB0=;
        b=ENuQZgkxX3+QrwHvkYuBH7u4NjU1Dgt+Fpv+ZN/4pixdPD+9yGzdRLUxuuA02kmCn9
         4Kum9l2KJBX2vqepo6VjvXRVdQN09NunmDbxhf5Wt7qjL+axcSPdl2tFJZwOKYtDC81m
         ORkviY4MsH9FUzzcufVqAm4Qd//Y0zLvmaqwt7+UJR1ZdeWE8l1JjCipkD9RZTqI+/QF
         OtBS2rSYGxznWbF217vD9pPUfVU9hjQ6t4+bQNupQIjkoCds382f/PfMtirI4qa3LOnl
         Dtq2ZAsb7OB1ZbO5vJ7qx7MMJymFi7wmTAzngMcV123D2XeuXT8bNZAvFiBZYQNVPwxb
         cgsA==
X-Forwarded-Encrypted: i=1; AKwUvBxFOA09fxJF280mTQDijLlRRMtXBlyd7wT++UNdLtUxkMblhbjvyldqcLEJPTIM2Exkx6DoM+Jzgpyqpg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8jrjW06ryzeGlFr84iDxedkf67U14jMIokxHfSNPHRvLmGjDNZ
	lu8frMzXMxl6FzG+mFeNNnlolIZViQO2L6JtkYW5D8Dn3xvHjVudHUqh
X-Gm-Gg: AYBFou3Pfux/V3WHBan5u5oqKKAR9hfmgep93nctp9/lAkumqEF3+5zs4F9oIgd9Tal
	DUk4mjzLcsWkpOg9MurJs6w9v3fQkhi8p+bAvA2QogjywCcgd62Ht62XrT0siUTDwreEBSYuPhd
	A/BbDYrRvfAHjwcEVbqFWWxBHhMuLsK+nDItqMG1xhXBjIKTTqhB2ekI6NcCtDzMy/j3HuFpkBD
	/aslLfKfUCvE+BDeNdg03Sg1o5OOS7+SpFZyFrrQo9+ggx0oj9oQDCJdF5KMAJBTPESa4P7PrFo
	Gx0XOStkr8HQL8sA7XFqZ7ReKZP24l3fq5GQ4ru8/sRYWHe6UnVDxnNR1FYHB/mtZ8b1AIJtxMx
	uXffG08YBbblMAWXrSFEGrt1DFY57SPkSY0KaToC8BuFJhwmUJajhs68UaIVW0wKWoj1G5txKLg
	xe/yeojONeSS8LZ6oDbhEm+6ffFwjsOoBfWJwfvlWLKxU4eTZvm/QDXcYCNM+UgYTRnFJhZ5mxx
	tF5z5iPjgCpvnziSz3KLObLttg67hEP0rSzE9tQyVIIATyEXY/6SeTaWBVUPUn6VUCHcFG869+8
	uM7Fv6jz8nRJ5FZsTIbgPqSSlfCL+LORuSLJ
X-Received: by 2002:a05:6000:46c3:b0:48e:4a8a:e17f with SMTP id ffacd0b85a97d-48e6e2bc7f2mr10289635f8f.4.1793521777564;
        Sun, 01 Nov 2026 01:29:37 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba2415sm13345902f8f.50.2026.11.01.01.29.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 01 Nov 2026 01:29:36 -0700 (PDT)
Date: Sun, 1 Nov 2026 09:29:30 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Dennis Wissel
 <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron
 M5 (3434:d068) at boot since v7.3
Message-ID: <20261101092930.114ca454.michal.pecio@gmail.com>
In-Reply-To: <387e9e3b-683e-474c-ba00-4b12c7c77b7c@rowland.harvard.edu>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
	<20261024203558.3181711-1-yiyu@yiyuzhou.io>
	<SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
	<20261025111410.2c14fcef.michal.pecio@gmail.com>
	<7082e2e7-8d05-46b8-a26b-5b888a7a0545@linux.intel.com>
	<20261026105139.6b86cb3c.michal.pecio@gmail.com>
	<3ddd9334-6dee-48cf-8a62-82cebbe51d7f@rowland.harvard.edu>
	<20261030174718.1f28218a.michal.pecio@gmail.com>
	<387e9e3b-683e-474c-ba00-4b12c7c77b7c@rowland.harvard.edu>
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

On Sat, 31 Oct 2026 12:32:38 -0400, Alan Stern wrote:
> The USB-Persist stuff in the hub driver was originally motivated by the 
> desire to recover from disconnections during system suspend.  For 
> example, disconnections caused by host controllers that don't provide 
> Vbus power while they are suspended, or users unplugging a device while 
> the system is suspended and then plugging it back in before the system 
> resumes.  A more detailed description, somewhat out of date by now, is 
> given in the changelog for 8808f00c7adf ("USB: try to salvage lost power 
> sessions").
> 
> Yes, this feature is very important.  Mostly it was meant for USB 
> mass-storage devices going away and then reappearing following a system 
> resume.  Before the USB-Persist facility was added, if the device held a 
> mounted filesystem the result would _not_ be what users desired, to put 
> it mildly.  The ability to handle transient disconnections was just an 
> unintended side benefit, although there did seem to be some real cases 
> where it helped -- USB mice or something like that.
> 
> To the device and driver, what happens looks like a reset, or rather, a 
> reset-resume because the former configuration and altsettings are 
> restored.  Naturally any ongoing operations would be expected to be cut 
> short, but while the device is suspended this isn't an issue.
> 
> It seems that you're concerned about two slightly different types of 
> thing.  In one, the disconnection happens while the device is suspended 
> and it is discovered when we want to resume the device.  Presumably 
> that's not a problem for you (?), because in this case we really do go 
> through the whole reset-resume procedure.

Suspend and USB-Persist is a thing to keep in mind to avoid breaking,
but intended behavior change is only to drivers with URBs pending or
submitted on a disconnected device. We would like to reject such URBs
on devices behind disconnected root hub ports.

Maybe I will just say what I'm looking for to avoid XY problems: we
need a "barrier" which separates URBs (and ideally state changes like
deconfiguration) related to the pre-disconnection state from those
related to the post-reconnection state, when a udev is "rescued" and
the HCD must accept URBs to it again.

A suspended device has no URBs, so the barrier only needs to be one-
sided. I guess root hub port reset or hcd->driver->reset_device() on
the device or any of its upstream hubs is good enough

(Current logic in 7.3 watches for individual reset_device() calls
or RH port reconnection; the latter is clearly less than ideal for
USB3, and Sashiko thinks there are other issues.)

> When a hub is reset, the logic for what happens to its children is a 
> little tricky to follow. I think that each port with a connected
> child ends up being handled by hub_port_connect_change(), which
> treats it as a new connection _unless_ the child was suspended
> beforehand, in which case we follow the reset-resume path. So yes,
> it is possible for the child will be reused in this way.

Hmm, what about hub_pre_reset()? It seems to usb_disconnect() all
children when it runs. I would expect even a suspended child to be
permanently forgotten before the hub is reset.

Unless the hub itself was suspended and gets reset-resumed instead,
I suppose. But then everything is quiescent so no problem.

If core can promise that children are suspended or already deleted
when a hub gets reset, we could use hub reset as one barrier for the
hub and all children, without tracking this per-device.

I implemented this barrier logic and it seems to work as expected,
and ftrace shows that hub_pre_reset() runs and drops children. But
it works != it always works != it will stay working...

> But even when the children aren't reused, unless their 
> udev->persist_enabled flag is clear, they don't go away until well
> after the hub has been reset.  The reason is that the hub driver has
> to look at each one, after the hub is running again, and evaluate
> whether the connection can be recovered.  Maybe this can be improved.

That sounds like suspend and reset-resume of the hub. Considering
hub_pre_reset(), it hopefully doesn't happen on awake hubs.

> The case you mentioned, about a reset being queued but not occurring 
> until after a transient disconnection, is a little different from the 
> other cases.  The core basically ignores disconnections while a reset
> is in progress (in USB-2, the electrical signalling used during a
> reset actually makes it impossible for the upstream port to tell
> whether the device remains connected or not). Disconnections before
> a reset starts end up getting handled much the same way; the most
> that happens is that the connect-change status is cleared and the
> reset is retried.
>
> This was all implemented before USB-3 appeared.  If we were to do it 
> again now, we might do it differently.

Thanks, good to know. It is maybe not a big deal to maintain this
"resuscitation" of awake devices. It seems similar to recovery from
USB3 SS.Inactive state - logical link error without disconnection,
software may try to Warm Reset the device. (I don't have any repro
and don't know if it's handled here).

Regards,
Michal
