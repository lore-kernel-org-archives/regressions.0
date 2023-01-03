Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BFA8F57
	for <regressions@lists.linux.dev>; Tue,  3 Jan 2023 19:09:53 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id y18-20020a0568301d9200b0067082cd4679so19630111oti.4
        for <regressions@lists.linux.dev>; Tue, 03 Jan 2023 11:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ralston.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C08OceEXw18iUGGiRS1+CrnOaGSBY8Ykajf+8A9hXvc=;
        b=kYD3G6UzTOkhCT7szVoyh5/v+2TIehuj/B8XGShsIbzhGPau8MXrHebfzJpslSxwdE
         aCuer2gXgiyk6lIm3Vp9fh0cu5rxdFdujtRUixA2gOwi3HRrWroXjpcLJX7D8lJs5JJW
         OlWxKzEEvl04KM62QncHE+dl2oYp6ZB46V9NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C08OceEXw18iUGGiRS1+CrnOaGSBY8Ykajf+8A9hXvc=;
        b=Q1nm+4bTOG1Yh2EGBgF2kDivCvNwcB5Nz6yRApljKXyUGg6GDiC6z/MgRhCidu45EL
         flt8hqH1NhzxRu0lZJcXgilVYsdB7RPCUzaCTM4skb+CxmsNTM4P+vebaMhC1nwuxb1m
         EnTZNzcI8abyvOkEUgV5nu8GNokoh510uK4z7bx1SwZ3JLE0V5vS00s+DXNYxKaPnoE6
         F8+2fvr1Xs5H0ppwmKnBW+6fmicSlEjaRIpD3EXhFCBqqaxLquzq8PrmHooirCvwlU4O
         1gpoIc5JDKlmGjituu6NyB1uJjBg0n1L8KbWbztwEY7YaH8j12Z/GiM2P5HIJ7rh+kZ2
         VV1Q==
X-Gm-Message-State: AFqh2kq/mCkcg2vJtGyv53HyuVXeQ/6IcLswj5nnyuKRiTJj7T1Lk7Z6
	DJAtAI5zR6dgQWxS01ifQ+jT9okL7wuDjDxxoHCTzA==
X-Google-Smtp-Source: AMrXdXthw5dKhojJxrUcr3e0JejicQ9XapnRXcqB2mBfdyuH37vcqnRI/Qf2oo1aqqCbWTWVxwFKdNXKtxVzvdNCU7g=
X-Received: by 2002:a05:6830:3747:b0:66a:8bca:86d9 with SMTP id
 bm7-20020a056830374700b0066a8bca86d9mr2572880otb.358.1672772992979; Tue, 03
 Jan 2023 11:09:52 -0800 (PST)
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
 <87zgazppuc.wl-tiwai@suse.de>
In-Reply-To: <87zgazppuc.wl-tiwai@suse.de>
From: Michael Ralston <michael@ralston.id.au>
Date: Wed, 4 Jan 2023 06:09:16 +1100
Message-ID: <CAC2975+476CHDL3YM=uExHu96UB2rodAng9PVYHX+vGnSCppGA@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, alsa-devel@alsa-project.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Jan 2023 at 03:03, Takashi Iwai <tiwai@suse.de> wrote:
>
> OK, thanks.  Then it's not about the USB interface reset.
> It must be subtle and nasty difference.
>
> Could you apply the change below on the top?
> It essentially reverts the hw_params/prepare split again.
>

Very sorry to say this still hasn't fixed the problem :(

Jan 04 06:05:12 leatherback kernel: mc: Linux media interface: v0.10
Jan 04 06:05:12 leatherback kernel: usb 1-3: Found last interface = 1
Jan 04 06:05:12 leatherback kernel: usb 1-4: Set quirk_flags 0x20010
for device 1397:0509
Jan 04 06:05:12 leatherback kernel: usb 1-4: Found last interface = 4
Jan 04 06:05:12 leatherback kernel: usb 1-4: 1:1: added playback
implicit_fb sync_ep 88, iface 2:1
Jan 04 06:05:12 leatherback kernel: usb 1-4: 1:1: add audio endpoint 0x8
Jan 04 06:05:12 leatherback kernel: usb 1-4: Creating new data endpoint #8
Jan 04 06:05:12 leatherback kernel: usb 1-4: Creating new data endpoint #88
Jan 04 06:05:12 leatherback kernel: usb 1-4: 2:1: add audio endpoint 0x88
Jan 04 06:05:12 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Switch] ch = 4, val = 0/1/1
Jan 04 06:05:12 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Switch] ch = 1, val = 0/1/1
Jan 04 06:05:12 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Volume] ch = 4, val = -32512/0/256
Jan 04 06:05:12 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Volume] ch = 1, val = -32512/0/256
Jan 04 06:05:12 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Switch] ch = 4, val = 0/1/1
Jan 04 06:05:12 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Switch] ch = 1, val = 0/1/1
Jan 04 06:05:12 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Volume] ch = 4, val = -32512/0/256
Jan 04 06:05:12 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Volume] ch = 1, val = -32512/0/256
Jan 04 06:05:12 leatherback kernel: usbcore: registered new interface
driver snd-usb-audio
Jan 04 06:06:07 leatherback kernel: usb 1-4: Open EP 0x8, iface=1:1, idx=0
Jan 04 06:06:07 leatherback kernel: usb 1-4:   channels=4, rate=48000,
format=S32_LE, period_bytes=96000, periods=4, implicit_fb=1
Jan 04 06:06:07 leatherback kernel: usb 1-4: Open EP 0x88, iface=2:1, idx=0
Jan 04 06:06:07 leatherback kernel: usb 1-4:   channels=4, rate=48000,
format=S32_LE, period_bytes=96000, periods=4, implicit_fb=0
Jan 04 06:06:07 leatherback kernel: usb 1-4: Setting params for data
EP 0x88, pipe 0x40580
Jan 04 06:06:07 leatherback kernel: usb 1-4: Set up 12 URBS, ret=0
Jan 04 06:06:07 leatherback kernel: usb 1-4: Setting params for data
EP 0x8, pipe 0x40500
Jan 04 06:06:07 leatherback kernel: usb 1-4: Set up 12 URBS, ret=0
Jan 04 06:06:07 leatherback kernel: usb 1-4: Setting usb interface 2:0
for EP 0x88
Jan 04 06:06:07 leatherback kernel: usb 1-4: 2:1 Set sample rate 48000, clock 40
Jan 04 06:06:07 leatherback kernel: usb 1-4: Setting usb interface 2:1
for EP 0x88
Jan 04 06:06:07 leatherback kernel: usb 1-4: Setting usb interface 1:0
for EP 0x8
Jan 04 06:06:07 leatherback kernel: usb 1-4: Setting usb interface 1:1
for EP 0x8
Jan 04 06:06:07 leatherback kernel: usb 1-4: Starting data EP 0x8 (running 0)
Jan 04 06:06:07 leatherback kernel: usb 1-4: 12 URBs submitted for EP 0x8
Jan 04 06:06:07 leatherback kernel: usb 1-4: Starting data EP 0x88 (running 0)
Jan 04 06:06:07 leatherback kernel: usb 1-4: 12 URBs submitted for EP 0x88
Jan 04 06:06:07 leatherback kernel: usb 1-4: 1:1 Start Playback PCM
Jan 04 06:06:30 leatherback kernel: usb 1-4: Stopping data EP 0x88 (running 1)
Jan 04 06:06:30 leatherback kernel: usb 1-4: Stopping data EP 0x8 (running 1)
Jan 04 06:06:30 leatherback kernel: usb 1-4: 1:1 Stop Playback PCM
Jan 04 06:06:30 leatherback kernel: usb 1-4: Closing EP 0x8 (count 1)
Jan 04 06:06:30 leatherback kernel: usb 1-4: Setting usb interface 1:0
for EP 0x8
Jan 04 06:06:30 leatherback kernel: usb 1-4: EP 0x8 closed
Jan 04 06:06:30 leatherback kernel: usb 1-4: Closing EP 0x88 (count 1)
Jan 04 06:06:30 leatherback kernel: usb 1-4: Setting usb interface 2:0
for EP 0x88
Jan 04 06:06:30 leatherback kernel: usb 1-4: EP 0x88 closed
