Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EB12DC775
	for <regressions@lists.linux.dev>; Wed, 30 Apr 2025 17:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746032762; cv=none; b=rWX8bsR1rgIAtjSocDvlcOgj1MR8/A0ce/eg6TVSvhvYvDKTg9BzEnlwfK7AH1fBlymUpA5qa4x4Itp+rXSX65y8j8VyLYIw5pgdQcnoIpvgRsqgYUoou31J0DLrfz4RY2CzDQ6QGVi9BvIFMzw+5yD3XNP9pkBHXz0OtVFlOCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746032762; c=relaxed/simple;
	bh=yvx+FRjb/HAm1MhrpslYsOrIGTKLTle2d7/UH0rYd1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5rp0Nd6NbSEMh9jgO0vitOJWoJc2ngol1mpx61Kz4p+EQvkAWQRKR5pkP12xnGrMEZNzFlYHsXw5Mr28+/3mocwI5/mnfQeZNqwdYIZVCuWmIg7DvZB1Jq/PVpHvoZ3xVw4qUyESmYcIpNOcmI0ubMTZY7Wvlzt0QL+ZoDBvC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Zo7yqrhV; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zo7yqrhV"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2243803b776so1672225ad.0
        for <regressions@lists.linux.dev>; Wed, 30 Apr 2025 10:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746032760; x=1746637560; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58Ob5TdaRLI/TNcS+mN0Uupr9ndgBJlrZ3pUusjLfjE=;
        b=Zo7yqrhVtHzSfYY5wTKp8GWBk/cC+jaXD3ulMtb1K00YhYli5VWGYojVlkY19Bq4T9
         TQA5MQ4UP8vigeRmBQC1aEPcX6oW1QbLUAqrZZbfTIGwJ6swFhbkN0K0ttT1AOMwR0SE
         DPzjhfBFRb7qye8JuUQTVSOtvpyOH05YPgvoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746032760; x=1746637560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58Ob5TdaRLI/TNcS+mN0Uupr9ndgBJlrZ3pUusjLfjE=;
        b=lgIDXpcGE6Bq6USkqJFeK1sR1wO9Kp5J5vNLvnlncXAdM5nXsBEzOqK+s/jk8G9zjo
         uj5r91kBTyer6M7LBgt5x7B3gkfcNptUoNfDQU8D7CfgGGpemIzVbEhkgl4bWZ/ZUydF
         KWXocW/9s5kkfEWQjqoh7Fy+nuSgSbh34/NnGnk6gfFcuBJ02cr5wVTavB+VhbXbVnqM
         ATXXmQU38ddmR3xdhc+XMMwfCQkSJOr8uiwx8HwL3As0ZrU/zO+zPUVCckcA/Ev5yc8E
         wlUB3LboH7SUjCCCBr/j5Q/olw2SczKZhKDpLGBkeaMTn+d4EGIkGSblvIZqQmKGmZH0
         jEQA==
X-Forwarded-Encrypted: i=1; AJvYcCXhMzifcz+qqDyHgJBshJu/VwHtxDblIXcXYE599ULBtNPK2dr+owx59kt90S0mI1cBUiJPVJjn7fpilA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhMJRDdiQVi31zcTApvqEELpn7XhtaNnzVAasj9UuQIhXKmlpN
	dnU2L5xxRSwC1W3YxMo4WxLd0tE3+cxgRKRJKxgaaKPkNSsFRP8vw+sSuXbpEy2t+nbZwtHzbz8
	=
X-Gm-Gg: ASbGncu7QULsh1Kd0muukPCeoTeK7gj/tn1GLa2jDP0+OWIZpM7npcYLdGPRdV6hv2k
	Q/OZ6JS05Oalihn2d2L8Dw2SUNDgzf9XcHPz1AwjhFmX9erahBu8ZfJkORp/OtZJ2tBj2SVEiHQ
	TAoRZX0E0SMGHy9EZZvioAMtuotWGDfkrN3IxJ+2xObWVxOHxoHq8l5eNf9VbvaB9LTc+S4t0T7
	k26Nmn1FSP3u7zfQ1Sm+xjzxvV+m9tB9lyfQaNfmK7I6GqUcRby66aOuHY2cENYLZHoOYZGG9+y
	Sx2gVnp25LfHNo6d0sqcTGsEa/sr0sNFRnkIrpmZnl2OMpAAkQFwPRY+mGPGFAMEFnuu7lBujd1
	uisDb
X-Google-Smtp-Source: AGHT+IG2JS41Yf4MUo5bIA2dhCQRDEDIS+XZ9SVxAb0dfqHqyg579C5WaP8UgSn9u7uMKx7A+YyxPw==
X-Received: by 2002:a17:903:190d:b0:223:501c:7581 with SMTP id d9443c01a7336-22df34ead34mr68277255ad.16.1746032759442;
        Wed, 30 Apr 2025 10:05:59 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com. [209.85.216.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe614sm124613995ad.98.2025.04.30.10.05.58
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 10:05:58 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30332dfc820so168948a91.2
        for <regressions@lists.linux.dev>; Wed, 30 Apr 2025 10:05:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFVDLOJL/iCGepTXmvtH4Pg/FVf8KByo7aIMKkuklaW7ISp1FdN+8hR/RrC7vAF1tZe07G+cewf0twSQ==@lists.linux.dev
X-Received: by 2002:a17:90b:2e4a:b0:2ee:d024:e4fc with SMTP id
 98e67ed59e1d1-30a3336490bmr7094252a91.33.1746032757616; Wed, 30 Apr 2025
 10:05:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com> <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
In-Reply-To: <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Apr 2025 10:05:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wc9TnDg6vDb8r5A8dT9TvOzU2kNSKi_6TzTtb0ka=8jA@mail.gmail.com>
X-Gm-Features: ATxdqUFGEFgUWcVP9tpAp7IAvVZ1WS2kKN7Qn8lT1mnsHdTLRM-PhtyTgbA3XGA
Message-ID: <CAD=FV=Wc9TnDg6vDb8r5A8dT9TvOzU2kNSKi_6TzTtb0ka=8jA@mail.gmail.com>
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
To: Nick Bowler <nbowler@draconx.ca>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 30, 2025 at 6:28=E2=80=AFAM Nick Bowler <nbowler@draconx.ca> wr=
ote:
>
> Hi Doug,
>
> On Mon, Apr 28, 2025 at 01:40:25PM -0700, Doug Anderson wrote:
> > On Sun, Apr 20, 2025 at 9:26=E2=96=A0PM Nick Bowler <nbowler@draconx.ca=
> wrote:
> > > I recently noticed that on current kernels I lose video output from
> > > my Blackbird's AST2500 BMC after a reboot
> [...]
> > >   ce3d99c8349584bc0fbe1e21918a3ea1155343aa is the first bad commit
> > >   commit ce3d99c8349584bc0fbe1e21918a3ea1155343aa
> > >   Author: Douglas Anderson <dianders@chromium.org>
> > >   Date:   Fri Sep 1 16:39:53 2023 -0700
> > >
> > >       drm: Call drm_atomic_helper_shutdown() at shutdown time for mis=
c drivers
> [...]
> > Bleh. That's not good. If I had to guess there's some subtle bug /
> > missing timing constraint that's being triggered here. A few things to
> > try:
> >
> > 1. Add a several second delay after the call to
> > "drm_atomic_helper_shutdown()", like msleep(5000) or something like
> > that. That's kind of a shot in the dark, but it's fairly common for
> > panels to get upset if you turn them off and then turn them on again
> > too quickly. This would be my blind guess of what is happening.
>
> Adding msleep(5000) does nothing except that once the video turns off
> it now takes 5 seconds longer to reboot.

Dang. Thanks for checking.


> > 2. Could you give more details about what panel you're using?
>
> According to the documentation I have for the machine, the video output
> of the AST2500 BMC is connected to an IT66121 HDMI transmitter.
>
> Then in turn I have that connected to some generic HDMI->VGA adapter
> (PrimeCables branded).  I also tried with another much more expensive
> device (Extron DVI-RGB 200) and observe no difference in behaviour.
>
> i think these devices are working and there's just no output signal
> on the hdmi port.

I've got a pile of crappy/generic HDMI to VGA adapters and I've had
mixed success with them working. They're not really passive adapters,
so they somehow need power to convert the HDMI to VGA. They seem to
run off the power given to them by the HDMI port and I've seen cases
where (I suspect) they get into a bad state. I've seen cases where
they need to be plugged in at just the right time in order to work and
I suspect that there's some sort of chicken-and-egg problem here.
Maybe in most states the HDMI port doesn't get power if nothing is
plugged in but (because of their design) they can't report plugged in
without getting power? ...but then there are maybe some cases where
power is given anyway? I'm spitballing here.

I don't know much about the Extron DVI-RGB 200.

Do you happen to have anything that's just a normal HDMI sink, like a
TV or a standard monitor that takes HDMI?


> > Ideally it'd be great if you could say which device tree you're using t=
oo.
>
> Not sure how to answer this.  Do you want me to look at something
> specific in /proc/device-tree?  Or dump it somehow?

Ah, I get it. On many device tree boards people use a dts file that
lives in the Linux source base and then bundle it with the kernel.
Looks like yours is provided by your firmware?


> > 3. Any chance you can gather the `dmesg` from a failing boot and
> > provide it somehow? Are there any errors in the logs from the failing
> > boot?
>
> To clarify, there is no boot failure.  There is just no video output
> after rebooting.  I can then boot Linux again by any method that works
> without being able to see the screen, and then everything is fine once
> I do that.

Super weird. So every other boot works?

I guess I'd be interested in other types of tests to see what's going
on. Aside from trying some other, more standard HDMI sinks, I'd love
to see the results of:

1. HDMI is supposed to be hotpluggable. If you've got a boot where the
display isn't working, what if you unplug the HDMI and plug it back
in. Does it fix it?

2. Does the hotplug experience change if you boot with the revert?
AKA: boot up with the revert (so everything is working normally),
unplug HDMI, wait a few seconds, plug HDMI back in? Is this different
than #1?

3. What about if you fully power off and then power on? Does the
display work reliably in this case, or are things different between
ToT and with the revert?

4. What about if you fully power off, unplug the HDMI, wait a few
seconds, plug the HDMI, and power on? Does that work? Are things
different between ToT and with the revert?


> I've attached the dmesg output (gzipped) from after such a reboot.
> Except for the order and the timestamps, the messages are identical to
> when I boot after rebooting a kernel which does not disable the video.

Thanks! dmesg could still be useful but I was hoping for some error
messages. I guess not.
