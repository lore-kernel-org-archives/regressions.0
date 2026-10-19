Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4A937F728
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 12:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412809; cv=pass; b=aTWFXjrLEVO1e5nnUdLNmIA54ZSi8UtitBInyByOaFULHSU9VkNDCACxdoxSZ2LTDOaDuqHvC/sC6iwHirspATXAGgjIcfQ/dypV4+ucm2gFUTBrkKhjZwTsynzRHyrP6STz17X58+QHFhuIunZnDqq5cvgj7UnYw1XpFMi9JZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412809; c=relaxed/simple;
	bh=Qyaw4WaZyQRRV/Cc2XdlJP27n/ju5hKMwRZCMx1IgrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GutKaVwVvflLpIC3bmvYgk01bZcA0ktb8HkymP223X0ty3lUVN7n7uzPr+f1b+6U5RKm97Kzql+yDwQn6ODwatVyEKTilUbM+N/Yv90bmU/zxfZgbrX+rYFTxWT+dbbeIoBiMmbJIMUdlWCy9jZ0Gdhrh0fHJo0CeZSR5v4NkZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu; spf=pass smtp.mailfrom=wetterwald.eu; dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b=FrGT12T1; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b="FrGT12T1"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b8b3c8c4bbso731349e87.0
        for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 05:26:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792412787; cv=none;
        d=google.com; s=arc-20260327;
        b=DlEn3STiJoiAVXl06g68U/FZBq46ftM1LOE0UhSLrdxoZNY3rF4BIOo6MNiWDyIPkC
         36SYu1/trYS+Q1B9Z5LeRP0qcQpYfkiCQ4k4zO955foCsvC1GO47k3OXaa9VXFyRjY7W
         KNctMXZPm/l7vZXFwkU/skKDTMhHHeREH3vFAnb4ikG/Qj7sWa4BEe/PgZafmD+9Ultx
         V02yCG9xxbHK5XgxJItfiusnyQp6qQbbhAqCKmrbKbjlyBuOEow9k2wa3U7AU7+l5TFS
         cqMWJHXv5LT3PDyalpQffKN4m+/uM36+GV1flFVdhM92l+of1WqOxZqDOaYKW0VFOrBg
         0hug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PNE/h2ESkoSNRC++cgLzYuUYgKGhlzmmCNhasBPr9xM=;
        fh=om4tGdQRDuiMDoyvxjg7+lO/KJy0Ko8Bc09O8SDiW30=;
        b=cgvWjmpcWpv4mvGY2U58z79d87CluIC1cQBK7GXaNFDj9Anu40VRq8IMV0FfC7Jnuw
         Hb29C3cSlET41R59Iv5dWnWifXKx0hLzCNCh2IFTCRz3ex7HZ7LYz5sasPcNvRub+wCb
         /d1dJZ2PAReLD3RjzEbas2WMhxdVHWRCM3csiLVQANA6blUpQ2drJFDZpcBViv/mJ/Mx
         Zfp89OGEGRwL2iYhjkRtmhkchJjtR4JdkZI8aqqb7K66zEuVWLmBuQp+nprc221CfCRg
         SfKhDcYiNdyxNq4wXydq9eJhw3/QpjKZr5Zuy02GOCmNuVng/I2DT2wSA/eSlR5d2A+t
         e/dg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1792412787; x=1793017587; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PNE/h2ESkoSNRC++cgLzYuUYgKGhlzmmCNhasBPr9xM=;
        b=FrGT12T19mdCCRmYxVODJeY9UKMrMVajQCyFrmXRqJUbzQlmVs6grvxeDOXNQH6tdv
         0dNo077yNdASEUZ4tHVQ2vmEHLSfgiP+yvjxiCtEX7V/zesghpJlF7exXlXeZBInQ/sM
         X6X5pbKPAYanpL/3xEpEroxLvWQWe2rBamkxU/IRB13ldk2FnHpanI+OkiJfXTTh8iz3
         ibZ2BYsrkkU45oD2Kx7E277EqMWdMEPZoeA53HmzTcCskRohjvsrjEaVWeCnZbRn5Ik0
         WgiISo61cGMgANN7GOcuuGAqYH93sYf+FQ0fm5V1Df/5AkD9XZpql34yCU6+aY5UqcGx
         Qkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412787; x=1793017587;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PNE/h2ESkoSNRC++cgLzYuUYgKGhlzmmCNhasBPr9xM=;
        b=KIMWh1lG4BtzOK3cNWvemagga5sY3wWSyQNhPc9abro9MQFTFQO0Ts+IVbvDOQAGjk
         uXfv6RWWwGjIEKYGs1FX3sbxwbmJJ5jlobG1qH4DFBJ+j571hs8I8DrbHZpHU3TGcDco
         QxJBo1AD39CpUAS41J/llVmgk7A0jLpeM7KetJ+c7wyjlwHf+t7H/QKnWLNNm/j5Z2Wq
         ABpjUAWmWf2wbAdwikFg+aXSPnITN8k4pMMrGfAO8FlpfBPXqLlWhm8QMH2wfbxSStWj
         pDgtYp7qXSHMAxMhXX0KxxWdPOY/faQenWlfpyNCqkDT62CcfuEm2cenGnMXz1ooPWpi
         nEPQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+2CefJQRBieNEVpEsPfzwS+EDtJVdzTBvWMXY2ajbD32pM+GrM237lZ9SA5u0FRgdu76IRV3YOie8KQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ3+VTzm8tDy1AgyQhJtRVuhKK6pzTp6VDTrHLJFbeYzvg9gPmY
	lnkye/+vFNcXKG9qH3y/Jgv2bBrjBa6+PAscquHbn9ReeJFzoQhMCv51hxZ689q/W9GDKVPptOV
	ubek6x9Z9rHp55JfY2SrinaYXjfNNyNdAGANj8y+5Hg==
X-Gm-Gg: AYBFou0N6Wmx0RkHQa5LQlgSknUoFLN9EnBW5WdvzKQE4tkXyUVPS/dx5LuRjAWWdrq
	dkni/GfSvaDFcbQ3C2ZCEgP2HzOSld4NsPZTLahbxcw/r7OdeFQ15QBtLx3ouyqdkudE5lZVUHs
	ipYCYfi4x5/jy8IuxcT2vvgpmF1HxgUJZso5BgZiz9pyoy4uEtGmKLoNgW7tkUdO1jEWY6pPThY
	Uw4F745zdH4rC9jseVWeg+gwbrt26DcXOSomdCFHjw0lPKaggQs3OKNjJ6ExW4W980QAoliAVVu
	QdRDUVJwz+SzRyO93qKC/bfXgdrNMbgtEjcRqcq5Z+FjTaZM7jbu4yi2cHWGPJDZNHnUltKw31H
	ceZOiY7MZsA==
X-Received: by 2002:a05:6512:3d17:b0:5be:41a5:d9ed with SMTP id
 2adb3069b0e04-5be47936d9dmr3010694e87.37.1792412786489; Mon, 19 Oct 2026
 05:26:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261013131435.1454019-1-martin@wetterwald.eu> <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com>
 <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com> <DM8869QP3IID.1I1KT6A7M2UNB@gmail.com>
In-Reply-To: <DM8869QP3IID.1I1KT6A7M2UNB@gmail.com>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Mon, 19 Oct 2026 14:26:15 +0200
X-Gm-Features: AclHuK93P2jPD4PyUwT4dOLVOgxbBF4VVZAqE1H94JjIS4xMMkZCEQTzudX9ZIs
Message-ID: <CAFERDQ3DWBnkSok_SiVZGx+GTmYKP=Q46yFYkNt9YQkKxxQxyw@mail.gmail.com>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Gaston Gonzalez <gascoar@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 9:53=E2=80=AFPM Gaston Gonzalez <gascoar@gmail.com>=
 wrote:

> Running 'speaker-test -t wav -D plughw:1,0 -c 2' crash the system, so
> thinks seem not to be working with that interface.
>
> Im trying to debug what happens in that condition; I will need a couple
> of days I guess. So far, this is what I could check.
>
> Any feedback on the test or debugging would be appreciated.

Hi Gaston,
Thanks for digging into this.

The patch only changes when the VCHIQ bus and driver are registered during
boot. So it's enough to check these two cases to validate the patch:
- without my patch: dmesg shows the "unable to register with bus_type
  'vchiq-bus'" error, and bcm2835_hdmi is absent from /proc/asound/cards.
- with my patch: the error is gone and bcm2835_hdmi is present in
  /proc/asound/cards.

(Since the Pi Zero has no Headphones jack, you need to test both cases with
snd_bcm2835.enable_hdmi=3D1 in the command line. Otherwise the card never s=
hows
up, even when everything works.)

Could you check these two cases?


Testing that you can hear the sound going through bcm2835-audio is a full
functional test that goes even further than the patch: it does not only tes=
t
bus registration but also that the audio driver is working.

On my side, without vc4-drm, I can successfully hear sound through both bcm=
2835
Headphones and bcm2835 HDMI:

  # aplay -l
  **** List of PLAYBACK Hardware Devices ****
  card 0: HDMI [bcm2835 HDMI], device 0: bcm2835 HDMI [bcm2835 HDMI]
  [...]
  card 0: HDMI [bcm2835 HDMI], device 1: IEC958 [IEC958]
  [...]
  card 1: Headphones [bcm2835 Headphones], device 0: bcm2835
Headphones [bcm2835 Headphones]
  [...]

  # speaker-test -D plughw:0,0 # (HDMI)

  # speaker-test -D plughw:1,0 # (Headphones, not on the Pi Zero)


If you still want to output sound through bcm2835_hdmi (optional):

There can only be one owner of the HDMI port: either the firmware or the
kernel.
When the Raspberry Pi boots, the firmware first owns the HDMI and displays =
a
rainbow splash. Then it launches Linux.

There are 2 ways for the kernel to deal with the video output:

1) With vc4-drm (CONFIG_DRM_VC4), the kernel takes over the HDMI controller
   from the firmware and handles everything itself (this is your case).
2) With simple-framebuffer (CONFIG_DRM_SIMPLEDRM or CONFIG_FB_SIMPLE), the
   kernel leaves the HDMI to the firmware and just writes pixels to a
memory area
   (the framebuffer) set up by the firmware.

I get a similar problem on my side when sending sound through bcm2835_hdmi =
with
vc4-drm loaded: my screen shuts down (but the kernel is still alive).
It most likely comes from the firmware and the kernel both trying to drive =
the
same HDMI port: with vc4-drm, the kernel owns the HDMI controller, and the
firmware (which bcm2835-audio talks to through VCHIQ) is not supposed to to=
uch
it.

A simple way to output sound through bcm2835_hdmi is to not use the vc4-drm
driver at all, and use simple-framebuffer if you still want a display.

To remove vc4-drm:
- Do not compile the driver into the kernel (CONFIG_DRM_VC4=3Dn) or blackli=
st the
  module.
- Remove any vc4 overlay in config.txt file (e.g. remove dtoverlay=3Dvc4-km=
s-v3d).

To enable simple-framebuffer, use one of the two configs:

  CONFIG_DRM=3Dy
  CONFIG_DRM_SIMPLEDRM=3Dy
  CONFIG_DRM_FBDEV_EMULATION=3Dy
  CONFIG_FRAMEBUFFER_CONSOLE=3Dy

or, the older way:

  CONFIG_FB=3Dy
  CONFIG_FB_SIMPLE=3Dy
  CONFIG_FRAMEBUFFER_CONSOLE=3Dy

(FRAMEBUFFER_CONSOLE=3Dy, and DRM_FBDEV_EMULATION in the DRM case, are only
needed to see the boot messages on the screen, with console=3Dtty1 on the c=
ommand
line.)

If you have remote access to your Pi Zero (either through network+SSH or
through serial console), you actually don't even need the simple-framebuffe=
r:
you can just remove vc4-drm, and let the firmware display its rainbow splas=
h on
the HDMI port.
Then you can login to your Pi Zero through SSH for example and launch
speaker-test.
As long as the HDMI video output is active, it's enough for the sound to be
able to go through, even if the image was not drawn by Linux.

But again, this full functional test is optional.

Regards,
Martin
