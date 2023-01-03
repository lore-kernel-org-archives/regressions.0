Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A9C8F57
	for <regressions@lists.linux.dev>; Tue,  3 Jan 2023 19:28:10 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1442977d77dso37938732fac.6
        for <regressions@lists.linux.dev>; Tue, 03 Jan 2023 11:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ralston.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7FkXH+HLYkkiLIkG++WmN41rS8wCnFY7c3NQ2brhNE=;
        b=UxfExVhNTzqtD3r49kPu0KJ4JLMh/spcsFzusux4NKHMSWkEgPVo8y3T+xGOdeej7q
         U7JUKmtw/wjXmBuMdMvjd2TyAJiofimRHFHVLycx/WPTGy6bBaSWbnvwiAVuAhYNAIk/
         +LAQxW4vgmemwCGTNb4D3E7K15qC4T3I41M0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7FkXH+HLYkkiLIkG++WmN41rS8wCnFY7c3NQ2brhNE=;
        b=aRhq3deJGQ/P4ZVyfYb3rC1W2PJmXnXsjMYZbpfVZOoDP3ghByzZyfQzdPBQkZuwOs
         /1x1svuawy/r9vPv7xc4o53fqeJk0UORLbu1V41KjC4N+nPQnoDwqPgJUhk1/lMZJlL0
         NjEsIesP57lHDRjBxuDoetPugA/qlpyhVg7RQ+t53RstkP4+b/G7fvXdNCbNnEiRa0Pg
         +84gm6w/jDF6PUlniVitvMYs+0zFfOyPT/FXu2Y50YHvflFVL+hv9VjM02fgIe+y2HPy
         ACfb4gfYcd2flxxwC5t2wBBzk/4Y6iXkCHLS2hsQ+Qry5SIaQx9Vgg7OMD4gmJj8Ln6j
         e17w==
X-Gm-Message-State: AFqh2kofWcnx32MlnIb2ZcAxcDstJruw80Ev7OUSGtUzPReoa8bUW6J4
	4bO9xofMD5hSvtScq4p56HdLXcUfWO8D/dUlPYGppg==
X-Google-Smtp-Source: AMrXdXsr5JqGLy/gQerxGWjdW2dJmjj/bKkvNd+/Bzb9oiK1VgH2DEO9re36zS2VcdGKT4NqC2y5QX3Jcchnro4gHK8=
X-Received: by 2002:a05:6870:8dcf:b0:150:a904:9f9a with SMTP id
 lq15-20020a0568708dcf00b00150a9049f9amr762343oab.235.1672774089369; Tue, 03
 Jan 2023 11:28:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info> <87zgb0q7x4.wl-tiwai@suse.de>
 <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
 <87sfgrrb5f.wl-tiwai@suse.de> <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
 <87bknfr6rd.wl-tiwai@suse.de> <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
 <878rijr6dz.wl-tiwai@suse.de> <CAC2975+Ybz2-jyJAwAUEu5S1XKfp0B-p4s-gAsMPfZdD61uNfQ@mail.gmail.com>
 <87zgazppuc.wl-tiwai@suse.de> <CAC2975+476CHDL3YM=uExHu96UB2rodAng9PVYHX+vGnSCppGA@mail.gmail.com>
 <CAC2975Ja-o6-qCWv2bUkt3ps7BcKvb96rao_De4SGVW1v8uE=A@mail.gmail.com>
In-Reply-To: <CAC2975Ja-o6-qCWv2bUkt3ps7BcKvb96rao_De4SGVW1v8uE=A@mail.gmail.com>
From: Michael Ralston <michael@ralston.id.au>
Date: Wed, 4 Jan 2023 06:27:33 +1100
Message-ID: <CAC2975KFqvTitbJHJZ6a4Tuxsq=nPGvW3vjAAtkQxw=sBgeDqw@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, alsa-devel@alsa-project.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Jan 2023 at 06:24, Michael Ralston <michael@ralston.id.au> wrote:
>
> I did a diff between the sound/usb directory for 6.0.16 and 6.1.2 and
> reverted that entire directory.
>
> It is working with that change, so there must be something else.
>

Logs below...

Jan 04 06:20:27 leatherback kernel: mc: Linux media interface: v0.10
Jan 04 06:20:27 leatherback kernel: usb 1-3: Found last interface = 1
Jan 04 06:20:27 leatherback kernel: usb 1-4: Set quirk_flags 0x20010
for device 1397:0509
Jan 04 06:20:27 leatherback kernel: usb 1-4: Found last interface = 4
Jan 04 06:20:27 leatherback kernel: usb 1-4: 1:1: added playback
implicit_fb sync_ep 88, iface 2:1
Jan 04 06:20:27 leatherback kernel: usb 1-4: 1:1: add audio endpoint 0x8
Jan 04 06:20:27 leatherback kernel: usb 1-4: Creating new data endpoint #8
Jan 04 06:20:27 leatherback kernel: usb 1-4: Creating new data endpoint #88
Jan 04 06:20:27 leatherback kernel: usb 1-4: 1:1 Set sample rate
192000, clock 40
Jan 04 06:20:27 leatherback kernel: usb 1-4: 2:1: add audio endpoint 0x88
Jan 04 06:20:27 leatherback kernel: usb 1-4: 2:1 Set sample rate
192000, clock 40
Jan 04 06:20:27 leatherback kernel: usb 1-4: clock source 41 is not
valid, cannot use
Jan 04 06:20:27 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Switch] ch = 4, val = 0/1/1
Jan 04 06:20:27 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Switch] ch = 1, val = 0/1/1
Jan 04 06:20:27 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Volume] ch = 4, val = -32512/0/256
Jan 04 06:20:27 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Volume] ch = 1, val = -32512/0/256
Jan 04 06:20:27 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Switch] ch = 4, val = 0/1/1
Jan 04 06:20:27 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Switch] ch = 1, val = 0/1/1
Jan 04 06:20:27 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Volume] ch = 4, val = -32512/0/256
Jan 04 06:20:27 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Volume] ch = 1, val = -32512/0/256
Jan 04 06:20:27 leatherback kernel: usbcore: registered new interface
driver snd-usb-audio
Jan 04 06:20:31 leatherback kernel: usb 1-4: Open EP 0x8, iface=1:1, idx=0
Jan 04 06:20:31 leatherback kernel: usb 1-4:   channels=4, rate=48000,
format=S32_LE, period_bytes=96000, periods=4, implicit_fb=1
Jan 04 06:20:31 leatherback kernel: usb 1-4: Open EP 0x88, iface=2:1, idx=0
Jan 04 06:20:31 leatherback kernel: usb 1-4:   channels=4, rate=48000,
format=S32_LE, period_bytes=96000, periods=4, implicit_fb=0
Jan 04 06:20:31 leatherback kernel: usb 1-4: Setting usb interface 2:0
for EP 0x88
Jan 04 06:20:31 leatherback kernel: usb 1-4: 2:1 Set sample rate 48000, clock 40
Jan 04 06:20:31 leatherback kernel: usb 1-4: Setting params for data
EP 0x88, pipe 0x40580
Jan 04 06:20:31 leatherback kernel: usb 1-4: Set up 12 URBS, ret=0
Jan 04 06:20:31 leatherback kernel: usb 1-4: Setting usb interface 2:1
for EP 0x88
Jan 04 06:20:31 leatherback kernel: usb 1-4: Setting usb interface 1:0
for EP 0x8
Jan 04 06:20:31 leatherback kernel: usb 1-4: Setting params for data
EP 0x8, pipe 0x40500
Jan 04 06:20:31 leatherback kernel: usb 1-4: Set up 12 URBS, ret=0
Jan 04 06:20:31 leatherback kernel: usb 1-4: Setting usb interface 1:1
for EP 0x8
Jan 04 06:20:31 leatherback kernel: usb 1-4: Starting data EP 0x8 (running 0)
Jan 04 06:20:31 leatherback kernel: usb 1-4: 12 URBs submitted for EP 0x8
Jan 04 06:20:31 leatherback kernel: usb 1-4: Starting data EP 0x88 (running 0)
Jan 04 06:20:31 leatherback kernel: usb 1-4: 12 URBs submitted for EP 0x88
Jan 04 06:20:31 leatherback kernel: usb 1-4: 1:1 Start Playback PCM
Jan 04 06:20:32 leatherback kernel: usb 1-4: Stopping data EP 0x88 (running 1)
Jan 04 06:20:32 leatherback kernel: usb 1-4: Stopping data EP 0x8 (running 1)
Jan 04 06:20:32 leatherback kernel: usb 1-4: 1:1 Stop Playback PCM
Jan 04 06:20:32 leatherback kernel: usb 1-4: Closing EP 0x8 (count 1)
Jan 04 06:20:32 leatherback kernel: usb 1-4: Setting usb interface 1:0
for EP 0x8
Jan 04 06:20:32 leatherback kernel: usb 1-4: EP 0x8 closed
Jan 04 06:20:32 leatherback kernel: usb 1-4: Closing EP 0x88 (count 1)
Jan 04 06:20:32 leatherback kernel: usb 1-4: Setting usb interface 2:0
for EP 0x88
Jan 04 06:20:32 leatherback kernel: usb 1-4: EP 0x88 closed
