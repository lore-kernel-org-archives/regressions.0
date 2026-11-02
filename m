Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586351;
	b=rwRYPOyaykUhR6vC+HJZqvT44wH91KpBIWP8rucUjtXCnjJF1KUrwTq/k7Xwfb6A2MWG
	 iY5BAr3H9+qOXMcXP60AdVSkwbwrZ2i5lDfe8/bBTr+4PN6HLl9XmHW8LNhK4Ds1pPetw
	 ejAbrRt3+JsyvRRJGYdyXOT3REOGCXOJJVyzSvbdbcicfDRu6u7IKpAVqf9dMhHHIwQSV
	 1BijqOx7C5cbryeaFp521tHvelkGjttT7K17VaVJfgcqTPChYoDo2YObDTNLzuDSDugwJ
	 n/S9XC/wv+9rFaP0bbKRhhW4aiS+8WZKTBAJUHiWK5jMcOHfZHBL19HLJwKvxZTDPUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=n3mx44U9YkJwgZeg389YBYRZqdY33U7LYb9Ka4ftvIQ=;
	b=FLn74VIEye6zRXtdyGcSgLqtrHadj7hIDFYkEIaxIpUYsPA34jck28kCnps+47h5OCrl
	 dZICYLx3ztfwSuL8nTbowK1BLoiVzYkxbJ+AsWOjTmHeK1EjcqQM2BTrHDFeNH9/G71IV
	 r1eoNTS6yVu51w9fbytkoequnstsbKcMyQQYbxGTJrwI4WvhUPoDjZ2QJs7jsL6XD8ZLV
	 drFaJcO0Yynv1x9pHhhnccywKS3D86Xi3VE1ZkrUKKUfQXImugndhWWl0oGDVPHQxwUTT
	 trwI3QI0r+vhZ/UXISkFrNw9YfAHxi3xLVw9/J8nwGC7xN6+m4PlJ6Vs6qsjkXB7aSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Zi6izetd;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D697606A329
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 02:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D697606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Zi6izetd
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91c1f548f87so45827226d6.2
        for <regressions@lists.linux.dev>; Sun, 01 Nov 2026 18:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793586350; x=1794191150; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n3mx44U9YkJwgZeg389YBYRZqdY33U7LYb9Ka4ftvIQ=;
        b=Zi6izetd3AySK9Ov/3OgHAP6VAeXGGFaXUtwALPY5UpaSom5v4XGTpjP+/LqZv3B/s
         eetDa51oTHpZHT1YcSSePNDxA3KGb+gk31TpPqpBNwRSx5/TDzBTAZItzznX5YYB0Joy
         aK60s/NSWifk6mC3hZ71y3bReI2iRN4eyWM0fK5rQ7Os7jshPHo5L3jdx/le7T3QcOjX
         jzbeAKTCiiqNdIiRse+yMvqCEYaBxCj8geml7OH4OrZHve0Rk1COSNJHFGEvJhShh2Fi
         /cyqt7aOjGTipFfL3WEVCYYz1cx0pPuuXdkyS54CTBNdNY4srh87vqpIXVBBFJ5aFNUC
         T1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586350; x=1794191150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3mx44U9YkJwgZeg389YBYRZqdY33U7LYb9Ka4ftvIQ=;
        b=ETvACDd+fW1pDVwLInKryGdOLzcrF02/gKY0WbUlcr56oPjZr6iyUpPYr8vkfqLzLJ
         3vV6laD17AF5yUGnqOWvK/zgfS+UjIaSLadisNeAto8DVc/7SVl+nwLRH7C5plr36mVH
         D3dcxQc37bcrtgks17R+RiFMKyfZa8z7zvsOL2LVZWHRZIxWTIvrjlVJdDyj75UnE579
         skP7B4BKO7J+fvcM7MKZJt37DuY8j+dow3cWaI+z1gUmiRdfKr9Q+pBVZ3kRXnitWUvz
         Vpl98SEIz0ixHFrBXTKnWSX8WTPS3XgHc04CU/8gp31L8Lf6uC0BkdFYKUNCJdjcGZ0a
         1zwg==
X-Forwarded-Encrypted: i=1; AKwUvBw14jo9JZ0L8QsG0HKTVWHiijRqZuA2N/TNWc12QJEsjTtcXfjyNGbzvMg6T0uiOC2ctftfn4Jtw6YDYQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/xpG5/YFGqTq3Z0jpH25t544fhNfGdDE+I6n3dMdXgoU0X6rcB
	to7OuewdnawCYCSOiuV1mnFY3n0Ssv2iRRZbFFsguycTCugNJZQ0iK3CoAanqy3xxA==
X-Gm-Gg: AYBFou1dkZgaaBAmlCgRRA5Kafi1agPokOd/C1YPGZPNgwEW+dtL7DkoZyJ6qHOSeqt
	cPO1MHCNj+1p4v6FXQXlHEtAYgBqkdaZHWCilpgLNP+Kvy/vr1EA9wktjmW+INWxWER/qDuFjJe
	Bde8AAGpj476X1MyXVnqdXFOR2FATrBayUgF5d826ewrc4D+EubtzPl1e9msOs63M4QomZmpfjL
	TrgdxPYkzR/F1jpLcsNzMB0wWpm5vnZrCdPiaUJ1HjUJK1EeOd9w/RFdtUW/34bTi8mnq+Ml5V6
	F9+WIiKumdqdvFgamee7dj0Z732zBIo9j5S12SAZ/9iiznNbXHTlP4rEzsZBWKHTs+VIo7Dr71i
	bysYcRljZUN1xhtc8sCrHD7i+7vi2QGYPCTMnSfcmsAclv4ZrVG2IelyUe/Iqzqj0ltgnVgQ6e5
	mMy7iGq8V5z5JFeK3JEEaV4fcjBXm8LYijRlrkjCX6qr2kvl3zNd0GA/odP6M50ewHXCspQixyk
	/jlyn5J+i4FXUfAkG02BxlMHtsDlrUEsdYnU7ayzvebBCNbULYAUb2O4GpbZqtVL2LnI8Z3XMhm
	iMPSW+4lpbfq0WTlizeADHyuZnb+
X-Received: by 2002:a05:6214:5907:b0:91c:6ce0:a2a with SMTP id 6a1803df08f44-91ca4b24720mr149807036d6.31.1793586349963;
        Sun, 01 Nov 2026 18:25:49 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7e24001sm79452676d6.3.2026.11.01.18.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:25:49 -0800 (PST)
Date: Sun, 1 Nov 2026 21:25:46 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Dennis Wissel <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>,
	linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5
 (3434:d068) at boot since v7.3
Message-ID: <7d0a8d8e-0b90-42be-9ee6-45288ddb27ca@rowland.harvard.edu>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
 <20261024203558.3181711-1-yiyu@yiyuzhou.io>
 <SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
 <20261025111410.2c14fcef.michal.pecio@gmail.com>
 <7082e2e7-8d05-46b8-a26b-5b888a7a0545@linux.intel.com>
 <20261026105139.6b86cb3c.michal.pecio@gmail.com>
 <3ddd9334-6dee-48cf-8a62-82cebbe51d7f@rowland.harvard.edu>
 <20261030174718.1f28218a.michal.pecio@gmail.com>
 <387e9e3b-683e-474c-ba00-4b12c7c77b7c@rowland.harvard.edu>
 <20261101092930.114ca454.michal.pecio@gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101092930.114ca454.michal.pecio@gmail.com>

On Sun, Nov 01, 2026 at 09:29:30AM +0100, Michal Pecio wrote:
> On Sat, 31 Oct 2026 12:32:38 -0400, Alan Stern wrote:
> > The USB-Persist stuff in the hub driver was originally motivated by the 
> > desire to recover from disconnections during system suspend.  For 
> > example, disconnections caused by host controllers that don't provide 
> > Vbus power while they are suspended, or users unplugging a device while 
> > the system is suspended and then plugging it back in before the system 
> > resumes.  A more detailed description, somewhat out of date by now, is 
> > given in the changelog for 8808f00c7adf ("USB: try to salvage lost power 
> > sessions").
> > 
> > Yes, this feature is very important.  Mostly it was meant for USB 
> > mass-storage devices going away and then reappearing following a system 
> > resume.  Before the USB-Persist facility was added, if the device held a 
> > mounted filesystem the result would _not_ be what users desired, to put 
> > it mildly.  The ability to handle transient disconnections was just an 
> > unintended side benefit, although there did seem to be some real cases 
> > where it helped -- USB mice or something like that.
> > 
> > To the device and driver, what happens looks like a reset, or rather, a 
> > reset-resume because the former configuration and altsettings are 
> > restored.  Naturally any ongoing operations would be expected to be cut 
> > short, but while the device is suspended this isn't an issue.
> > 
> > It seems that you're concerned about two slightly different types of 
> > thing.  In one, the disconnection happens while the device is suspended 
> > and it is discovered when we want to resume the device.  Presumably 
> > that's not a problem for you (?), because in this case we really do go 
> > through the whole reset-resume procedure.
> 
> Suspend and USB-Persist is a thing to keep in mind to avoid breaking,
> but intended behavior change is only to drivers with URBs pending or
> submitted on a disconnected device. We would like to reject such URBs
> on devices behind disconnected root hub ports.
> 
> Maybe I will just say what I'm looking for to avoid XY problems: we
> need a "barrier" which separates URBs (and ideally state changes like
> deconfiguration) related to the pre-disconnection state from those
> related to the post-reconnection state, when a udev is "rescued" and
> the HCD must accept URBs to it again.
> 
> A suspended device has no URBs, so the barrier only needs to be one-
> sided. I guess root hub port reset or hcd->driver->reset_device() on
> the device or any of its upstream hubs is good enough

Okay, that ought to work.  The only case to watch out for, aside from 
disconnect while the device is suspended, is when a reset fails because 
of a disconnection and gets retried.  Which was what started this email 
thread in the first place, right?

> (Current logic in 7.3 watches for individual reset_device() calls
> or RH port reconnection; the latter is clearly less than ideal for
> USB3, and Sashiko thinks there are other issues.)
> 
> > When a hub is reset, the logic for what happens to its children is a 
> > little tricky to follow. I think that each port with a connected
> > child ends up being handled by hub_port_connect_change(), which
> > treats it as a new connection _unless_ the child was suspended
> > beforehand, in which case we follow the reset-resume path. So yes,
> > it is possible for the child will be reused in this way.
> 
> Hmm, what about hub_pre_reset()? It seems to usb_disconnect() all
> children when it runs. I would expect even a suspended child to be
> permanently forgotten before the hub is reset.

Yes, all the children are definitely gone before hub_pre_reset() 
returns.

> Unless the hub itself was suspended and gets reset-resumed instead,
> I suppose. But then everything is quiescent so no problem.
> 
> If core can promise that children are suspended or already deleted
> when a hub gets reset, we could use hub reset as one barrier for the
> hub and all children, without tracking this per-device.

That guarantee is valid.  If a non-suspended hub gets reset then 
hub_pre_reset() will run, disconnecting all the children.  (I may have 
at one time considered trying to preserve them and decided it would be 
too difficult.)  And if a hub gets reset while it is suspended then of 
course all the children have to be suspended too.

> I implemented this barrier logic and it seems to work as expected,
> and ftrace shows that hub_pre_reset() runs and drops children. But
> it works != it always works != it will stay working...

If you would like to add a comment stating this guarantee explicitly 
somewhere in the hub driver, I won't object.

> > But even when the children aren't reused, unless their 
> > udev->persist_enabled flag is clear, they don't go away until well
> > after the hub has been reset.  The reason is that the hub driver has
> > to look at each one, after the hub is running again, and evaluate
> > whether the connection can be recovered.  Maybe this can be improved.
> 
> That sounds like suspend and reset-resume of the hub. Considering
> hub_pre_reset(), it hopefully doesn't happen on awake hubs.

That's right.

> > The case you mentioned, about a reset being queued but not occurring 
> > until after a transient disconnection, is a little different from the 
> > other cases.  The core basically ignores disconnections while a reset
> > is in progress (in USB-2, the electrical signalling used during a
> > reset actually makes it impossible for the upstream port to tell
> > whether the device remains connected or not). Disconnections before
> > a reset starts end up getting handled much the same way; the most
> > that happens is that the connect-change status is cleared and the
> > reset is retried.
> >
> > This was all implemented before USB-3 appeared.  If we were to do it 
> > again now, we might do it differently.
> 
> Thanks, good to know. It is maybe not a big deal to maintain this
> "resuscitation" of awake devices. It seems similar to recovery from
> USB3 SS.Inactive state - logical link error without disconnection,
> software may try to Warm Reset the device. (I don't have any repro
> and don't know if it's handled here).

To tell the truth, I don't know how we could go about it.  There would 
have to be some way to inform all the drivers bound to the children's 
interfaces, and they would have to cope with a bunch of failed URBs 
together with putting the device back into the proper state afterward.  
At least with the ->pre_reset() and ->post_reset() callbacks they get 
some warning beforehand so they can prepare.

Also, there's the issue of telling the difference between a momentary 
disconnection and a real disconnection.  How long would you wait before 
deciding that the device really is gone and not coming back?

Alan Stern
