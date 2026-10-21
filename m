Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792609511;
	b=aHqRvmCFqCCHOVijVOgfWjrk9uA9iIAtHSWpqp/zb+KBVnHFxf5xq2sHHOuq4SdzRmXU
	 YMCO8F0zMxw1hab2bLzt/XbvumT1+Kc+o6RzdOv2wxC+qAKdxHfbSMwuQ5MwDmoeAb51h
	 jPxwGAOUpfns+T0HmlLQ8rTmDaxEW90n5civMxelTldOStm3XacPU0kWX68h4h4Ctk1d/
	 ctXUNTfQviDSKo4dewrfffgqABpJW/QVxNzlx3t+hsfutuJBGcwJ/UmQcBi9pwYCal6zn
	 kUmKoxSTMMqewct9YjYkT2nBC0dKOEqrsTa/Mhy6wE4Au3f4xGULuwlY7G68j8UvBLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=yaJdLtbHiyXcMFgqBwOm4F2HMHkjIk9pI39u14xSXTs=;
	b=OB+/7YPMe/47zokqSF+ey0lpnE2JGIWHd2UC+DqTzkGYqO9PWW6zDokZ2GLO2JimHRcH
	 3+PwjMql9NTvXdGTbrRexhPsb+hekmic20fzGugchEah3SZG1M6/mFIdG2dWaVSU94Xx0
	 35iPHF2hMDs1FOVGxFs1wQyOIyuCA+p6ocKMfN0Unaqu7j7bwoAeqpnKZX3fS4wyJt1k4
	 BzLMXiacIJuByh+6OS7T/qURdavHuJoBh1ZbkGYQ+Ug1YJobYUkvAV+QzFIWOWFDw/w+t
	 9j7N9yvYw8hIAxI8lU8wQkemMPq2WYXMMRRhiPSiU20jyei/gPbX2I4qAfVJjPCLtoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bzo0us2z;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0349606A31A
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 19:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0349606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bzo0us2z
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7bfb767d7b6so19715137.0
        for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 12:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792609510; x=1793214310; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yaJdLtbHiyXcMFgqBwOm4F2HMHkjIk9pI39u14xSXTs=;
        b=Bzo0us2z2Xu+EhcPrskPoOfVFz1MD9dIXgEeIa07Q76S4nTSk6XCr4KJPZcM3aGozn
         +XvL6unGMlGcoMLatAiS85JFCY+QLd4CLQGSN2NIJmn/ToVIys3n3L/cp1iLTk/nHRSF
         UrkKNeVs7YH78eQFApUKA5XELlQ+36JtCxz8BESHey3FfrY4NhAMq9UJPDExAEBGRtnN
         a8G3zEo2XAbA3C0NN3jNw+uQgpGta/Jo8GizmcBWz2ljpU2201DKBASICtO5nZf0hu4l
         NdRLYxn0k60B/LuASiAJx2aRpnH3wX/nITorwZTnKphMQedDSPWJ6kSMYPy5XYFcFuVR
         oCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792609510; x=1793214310;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaJdLtbHiyXcMFgqBwOm4F2HMHkjIk9pI39u14xSXTs=;
        b=s/Z2fuE/R1ayHp6Q8RFLpRpQ+TAArv7UmsRNgp+uUtWXvdDxkVYmFQDdAOZFMdmxpi
         nlqC8TMy7NZB3EG6gDHanZFFN9Itwh25hfpUCNchD7FUrG5rztlnZD97YtGuD6T9HqjJ
         3cQ0Uu7uiHIcSYs6Nshd8WybJAkFhT2p2ZPH2nnMH9mQg2ouxl2SztnbPU2+KrQyid5D
         Y4yL4lyo719kviYDeQeq+5i0+uhnDQjHCD9LpFcIneCEzW3nbotOxp4AVBlEW+D92RpX
         ScB5VpeAyunGLBWvhTmR+QTlfnP2EoWWmjqtI00FBKQOZl10lMZPsP2x7KrDqcSmH18g
         S5Hw==
X-Forwarded-Encrypted: i=1; AKwUvBwfjblW/8GYz3/Vcg8YjJ1vG1N8YW9kuoDVt7MxXlCJ/6Vd11+lHnoTI+h8sG98XcWcNhqpl9lZGuJk6Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYLd6+VeXj2PYsL5SzM17COGHh4UJ/YslSozMWqUeKRCS12+tpuR
	xsIM6Lweb9H7Cqviw9B3vrnAZgsdo2Rp8huoMQFvWQpofqqqOE82LHYv
X-Gm-Gg: AYBFou3bqwlox+H2bTvgL+gbP6EpryFkLcfRRGV8AwZmFfgzNuSt5kLK2oaBgDsV+kL
	iywPZoysOa8HVxcqQ4PB25RwPIRJJ/ij4g2/iEiZTVRyvThlTO5a3wiH1MaoTd5+9sDH+id/QwY
	SyOLN6oY4o9MqCSGrUxBNjGU3xOvF7SrMU66M6dOP3IUFIv0FL4wZZqCUygdwKbCAvT5nvWGlZH
	ADM4NSCR9N7gHGTKqikpCURF3QAz7RIBb+fKTZuHm+fRuf2TjMSJdjj4p4+IqJEQvJawUdRlmbn
	JMxn6JQ2X8pcuOaon9ABIt5C1tNCwWFqLJu7yqcX73byq3zN7KU/P/XqTthp5oGGuWZ7VzWuxLG
	LwbGfjGVlztX3HP8fjxMFxzQ4cNwc5oa2T5Qy6QSbG8nsaxYFiiU5KXH/kGtO5AHUWGxczt8Eq0
	GO+8FjiFt5h7WAtoXdcQNQV5JC1m9Awhr/9ngJ6DI/j1Tl9svEtJYk0m8lgM124TMWJXlNaFlGL
	ppEoSH1SBQtjSJZORMPTKwIC70K+zLHM2qnq44H+ynsSRuYzvk=
X-Received: by 2002:a05:6102:3e92:b0:7c3:83a9:edc9 with SMTP id ada2fe7eead31-7cc92461809mr1156246137.1.1792609509675;
        Wed, 21 Oct 2026 12:05:09 -0700 (PDT)
Received: from localhost ([2802:8012:39:ac00:85dd:f0f7:d2d2:5158])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc921b6094sm3818360137.1.2026.10.21.12.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 12:05:09 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 16:05:03 -0300
Message-Id: <DMAR194TTSQN.1VUF47V1A3YUX@gmail.com>
From: "Gaston Gonzalez" <gascoar@gmail.com>
To: "Martin Wetterwald" <martin@wetterwald.eu>
Cc: "Florian Fainelli" <florian.fainelli@broadcom.com>, "Broadcom internal
 kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Stefan Wahren" <wahrenst@gmx.net>, "Phil
 Elwell" <phil@raspberrypi.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Umang Jain" <uajain@igalia.com>,
 "Kees Cook" <kees@kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
X-Mailer: aerc 0.20.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261013131435.1454019-1-martin@wetterwald.eu> <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com> <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com> <DM8869QP3IID.1I1KT6A7M2UNB@gmail.com> <CAFERDQ3DWBnkSok_SiVZGx+GTmYKP=Q46yFYkNt9YQkKxxQxyw@mail.gmail.com>
In-Reply-To: <CAFERDQ3DWBnkSok_SiVZGx+GTmYKP=Q46yFYkNt9YQkKxxQxyw@mail.gmail.com>

On Mon Oct 19, 2026 at 9:26 AM -03, Martin Wetterwald wrote:
> On Sun, Oct 18, 2026 at 9:53=E2=80=AFPM Gaston Gonzalez <gascoar@gmail.co=
m> wrote:
>
>> Running 'speaker-test -t wav -D plughw:1,0 -c 2' crash the system, so
>> thinks seem not to be working with that interface.
>>
>> Im trying to debug what happens in that condition; I will need a couple
>> of days I guess. So far, this is what I could check.
>>
>> Any feedback on the test or debugging would be appreciated.
>
> Hi Gaston,
> Thanks for digging into this.
>
> The patch only changes when the VCHIQ bus and driver are registered durin=
g
> boot. So it's enough to check these two cases to validate the patch:
> - without my patch: dmesg shows the "unable to register with bus_type
>   'vchiq-bus'" error, and bcm2835_hdmi is absent from /proc/asound/cards.
> - with my patch: the error is gone and bcm2835_hdmi is present in
>   /proc/asound/cards.
>
> (Since the Pi Zero has no Headphones jack, you need to test both cases wi=
th
> snd_bcm2835.enable_hdmi=3D1 in the command line. Otherwise the card never=
 shows
> up, even when everything works.)
>
> Could you check these two cases?
>

Hi Martin,

Results on the two cases:

Case 1:=20
    - dmesg shows 'Driver bcm2835-audio was unable to register with bus
      type 'vchiq-bus' because the bus was not initialized'.
    - cat /proc/asound/cards shows only: vc4hdmi.

Case 2:
    - dmesg does not show 'Driver bcm2835-audio was unable to
      register..'
    - cat /proc/asound/cards now shows:
        0 [vc4hdmi  ]: vc4-hdmi - vc4-hdmi
                       vc4-hdmi
        1 [HDMI     ]: bcm2835_hdmi - bcm2835 HDMI
                       bcm2835 HDMI

So your patch works on the Raspberry Pi Zero v1.3.

Regards,

Gaston
>
> Testing that you can hear the sound going through bcm2835-audio is a full
> functional test that goes even further than the patch: it does not only t=
est
> bus registration but also that the audio driver is working.
>
> On my side, without vc4-drm, I can successfully hear sound through both b=
cm2835
> Headphones and bcm2835 HDMI:
>
>   # aplay -l
>   **** List of PLAYBACK Hardware Devices ****
>   card 0: HDMI [bcm2835 HDMI], device 0: bcm2835 HDMI [bcm2835 HDMI]
>   [...]
>   card 0: HDMI [bcm2835 HDMI], device 1: IEC958 [IEC958]
>   [...]
>   card 1: Headphones [bcm2835 Headphones], device 0: bcm2835
> Headphones [bcm2835 Headphones]
>   [...]
>
>   # speaker-test -D plughw:0,0 # (HDMI)
>
>   # speaker-test -D plughw:1,0 # (Headphones, not on the Pi Zero)
>
>
> If you still want to output sound through bcm2835_hdmi (optional):
>
> There can only be one owner of the HDMI port: either the firmware or the
> kernel.
> When the Raspberry Pi boots, the firmware first owns the HDMI and display=
s a
> rainbow splash. Then it launches Linux.
>
> There are 2 ways for the kernel to deal with the video output:
>
> 1) With vc4-drm (CONFIG_DRM_VC4), the kernel takes over the HDMI controll=
er
>    from the firmware and handles everything itself (this is your case).
> 2) With simple-framebuffer (CONFIG_DRM_SIMPLEDRM or CONFIG_FB_SIMPLE), th=
e
>    kernel leaves the HDMI to the firmware and just writes pixels to a
> memory area
>    (the framebuffer) set up by the firmware.
>
> I get a similar problem on my side when sending sound through bcm2835_hdm=
i with
> vc4-drm loaded: my screen shuts down (but the kernel is still alive).
> It most likely comes from the firmware and the kernel both trying to driv=
e the
> same HDMI port: with vc4-drm, the kernel owns the HDMI controller, and th=
e
> firmware (which bcm2835-audio talks to through VCHIQ) is not supposed to =
touch
> it.
>
> A simple way to output sound through bcm2835_hdmi is to not use the vc4-d=
rm
> driver at all, and use simple-framebuffer if you still want a display.
>
> To remove vc4-drm:
> - Do not compile the driver into the kernel (CONFIG_DRM_VC4=3Dn) or black=
list the
>   module.
> - Remove any vc4 overlay in config.txt file (e.g. remove dtoverlay=3Dvc4-=
kms-v3d).
>
> To enable simple-framebuffer, use one of the two configs:
>
>   CONFIG_DRM=3Dy
>   CONFIG_DRM_SIMPLEDRM=3Dy
>   CONFIG_DRM_FBDEV_EMULATION=3Dy
>   CONFIG_FRAMEBUFFER_CONSOLE=3Dy
>
> or, the older way:
>
>   CONFIG_FB=3Dy
>   CONFIG_FB_SIMPLE=3Dy
>   CONFIG_FRAMEBUFFER_CONSOLE=3Dy
>
> (FRAMEBUFFER_CONSOLE=3Dy, and DRM_FBDEV_EMULATION in the DRM case, are on=
ly
> needed to see the boot messages on the screen, with console=3Dtty1 on the=
 command
> line.)
>
> If you have remote access to your Pi Zero (either through network+SSH or
> through serial console), you actually don't even need the simple-framebuf=
fer:
> you can just remove vc4-drm, and let the firmware display its rainbow spl=
ash on
> the HDMI port.
> Then you can login to your Pi Zero through SSH for example and launch
> speaker-test.
> As long as the HDMI video output is active, it's enough for the sound to =
be
> able to go through, even if the image was not drawn by Linux.
>
> But again, this full functional test is optional.
>
> Regards,
> Martin

