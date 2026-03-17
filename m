Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2D53AE1AE
	for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 13:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754179; cv=pass; b=OeQFxKXmUHE6gaBDURmVQo2AhsLmMTMpA5tMSrWMeuQRZi9GRkON2Za2DpFChfqTyZe963aLeKjfezgpyTfpLgHGB6nrKkKbDu9CJwRYdzUfPZxY5fT2Eq+PG0hpDBDb3L8AwjZUJBNB1m4uTKtzOGvvGtF/V8GeYJQSgN8yDkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754179; c=relaxed/simple;
	bh=AyepG1IcNxMHgYkpp5tgKywdNKFG4FiEbW9sPwkPMZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mj5Fr3vJTZtitdr7t0+z5MLtyd5JgEjiaOP/cE/NW/YDUzUPJ3P8iRtCIRbqwyiwdxYSyNKMDKnbn06UXbgi8w00t5+62U+pDRWNPCC6C1sUkcW2b1Fa53s8lJzOwpg4yy49nAl1B/pSfnhilzN3WP9S2FGR3TTSanYymgD1J44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyfqFeuW; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyfqFeuW"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64e8cdafeffso712682d50.1
        for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 06:29:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773754176; cv=none;
        d=google.com; s=arc-20240605;
        b=KoX7UIJ5Vkew3wQ1q954Oc5kUfdqQtjSDgzajKssFyC/b3SmJojZYWyS5bq5Ln44lo
         CPI4NTRLMhUK6HniqBHsLYsMtHPk3m/jmEKRm8JIMVMcDdUoqCOX2mrruC8orQtF0wJN
         dLfKW3imrF+Q+WOshX2xJWtv5n8oIMzLmjVcwyGETGxpNyxRrYN79vxo3ih84gLDDfnG
         qL4keFR2cAf5SDZX2mimP5IQ3LWzNf5LyXQhDiPv2F5LOJK/mhw0OfNJx6gQ154DAwaU
         BaKHVxS2BOIDY8JVZTYFjWcjKDm3TWJ3aLQUaZqwxC/2FkJnQKn+0AvWC24vANd/0HZS
         7Otg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NU4/grFBntPzp4WD4g8pniC/X+m900pvgHQXnPAG2NU=;
        fh=YOSmXdTzUsGOkPKLzUvmuL36TVhXT0NZpQAmW6dxWW0=;
        b=JCKIK6U4i6Rei4r49VRG5aQkvXU/IPjnbAtuwi4sZtspEVWbigc8PFzQMoFNE54T6S
         9QQ5ewO/YMFt1sLxTvODxDN1fjLZzRLgeUGYqYkxOY+bCiCUf1rLEdAitLGl1xMr0Ejh
         zuYLRHIlcjFd88AZX3AuxFGwmuFm2EmXOuXsEsyr6IV9nUV+PA9MABu7XRnv9EkYY7jx
         KL2H3hqw1fPbkWBFW2Co5rPfS7PpadiIWYEbl4WySydbeD6UKpF8KK7JDIchx7mGP/9k
         kjJ7HCRrrAItTVzrEB1nMOApSknbUBMDXumxvibzdWbyGGV6w0yC+ro5M6KyE1VlkiFa
         9gNA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773754176; x=1774358976; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NU4/grFBntPzp4WD4g8pniC/X+m900pvgHQXnPAG2NU=;
        b=kyfqFeuWgflku8g3hktWpcfK8Czdjg9Laufgneww1MYlTwiex2wDz2lAIQV11kHRqz
         PIisf07uk6vjw3gZPYsXcwPJPAiWn1dOqy2Jj3aVNPOfGWVVpmYwnQZ3go/yvMYxvP8C
         +m0gazd9PrTWmCf45z8E5eOPs9KdlpLULM5BLUmnHTHQ+F1brvlvCiWHgU1MEygTBkH5
         0pZo5BaogQLzHz44+gx9ZJYQF8e7ECNp2OS+725N7QMmoZVwI/9bRfUOLiRjY/0m8Z5H
         Fv7vr1Vn2jLGyXm13IAvKS+qIuvBHiWK1YRW/rh/F99Z8UT2KekEaJpxEi1P3zr0Ynyk
         vdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773754176; x=1774358976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NU4/grFBntPzp4WD4g8pniC/X+m900pvgHQXnPAG2NU=;
        b=Ok3+mp3HOeGzYZStlYdeWG61LReiltaNIvewx/5LgmYveECC0F6B1B8Oe+7LETC5xk
         MR5h/nFKt4qtY81Ebvm/DT2Q679o5RoGOuFq80koP/E75QtmVIjSGvTOGn8IX2dHW51p
         yhg5yoA+xyDLkYW4qeNkQkrZHS+URvNGXJtz1xaAZDzWYYjf2W53ehka0EDdoJPxpVcd
         FJSB0ZFTpEns7DA6Y8lGHWSHv31EHgF7QTSJ05K0MVCIJYaMnnMDytJBsGXyahjWjUH7
         xU/lBMtpN3fWXPEbC2iVQAlsC/FN9FqnGLyHot1lO2oUPZycSAfoB+4xwRBnqysVVbx9
         7jeQ==
X-Gm-Message-State: AOJu0YxLON8JvNXRdYaiNrN5RAr9xl7jZnQHs2t6RQB0bICR2gY7Nmn0
	NLhDGfk5FFOSLa1wGREDjf061Xg80L1/1RN1KDas2Mr3Kj6/aeaDUM8OEeVuJbtGb8VjNz6QCBs
	avS/6iMtwcONCNqH8vYuTP+zW6WKONpw=
X-Gm-Gg: ATEYQzxcIzA9l2ydRjfszbN1j2r5D20DapA8lDbva7QvyRc+e09uJsOJnzYQuJSYfQJ
	3PoufNBGgC8mH4hRIyk9GGbc4Y8hWTOdre2gZIjWH3kxZXR8wETq7rHV6qVOIrvoA86uv7J3ppo
	SUY0rtPYlzjReEUtesbgjN2VugWN3Bj6tgoINWdrJa5H4IEDKRSGRturjUUfWh3uRUYbgfYrtG9
	P1aHsqMrCwcKxSKCCVPekj58l7uOrLZoYLW7gPoJJvt3/KKEAMsekUHwioNaCw4U70iohjPh8TC
	fa0Kpq2pZl0OwQGKM1lbuho3HjdXBSriO54WR1n6gO+1BCZe1OUnUbf8lk8Og+E=
X-Received: by 2002:a05:690e:419b:b0:649:b234:3905 with SMTP id
 956f58d0204a3-64e88b4f88fmr2662674d50.41.1773754176490; Tue, 17 Mar 2026
 06:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+tjKGrmADg=oG9CT74_mgGNN3h17=LLmnv51K=MggAqo7q2Eg@mail.gmail.com>
 <2026030839-applied-prominent-b774@gregkh> <CA+tjKGoWW70TRw6C+PMDbhpCh5P_jyJ9ciY3HckJystb+X26Mw@mail.gmail.com>
 <b3d8717f-07f7-4921-8808-55db94dfdc2e@leemhuis.info> <DM6PR12MB4354705B31704E35F281C5AA8744A@DM6PR12MB4354.namprd12.prod.outlook.com>
 <CA+tjKGqCmTQkxmdzrUfBxyENkMzocic1+OKS2bka5taGoy3SnQ@mail.gmail.com> <SA0PR12MB4368395D5071FC7AD375B6618740A@SA0PR12MB4368.namprd12.prod.outlook.com>
In-Reply-To: <SA0PR12MB4368395D5071FC7AD375B6618740A@SA0PR12MB4368.namprd12.prod.outlook.com>
From: Shichuan Yim <shichuanyim@gmail.com>
Date: Tue, 17 Mar 2026 21:28:24 +0800
X-Gm-Features: AaiRm522bFnzD9OTOJMFf9A-Fg4jvKcb2v_sv968mun7nR_p4HYfFjeW-TSV6CY
Message-ID: <CA+tjKGrcV2p=2EabSjkYiRv=RNmOZq4_5Z49mu-irjJjgEkqCA@mail.gmail.com>
Subject: Re: [BUG] HDMI monitor shows no signal when the refresh rate is
 higher than the default 60Hz
To: "Vojvodic, Relja (Reggie)" <Relja.Vojvodic@amd.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, 
	"Koenig, Christian" <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>, "Limonciello, Mario" <Mario.Limonciello@amd.com>, 
	"Zuo, Jerry" <Jerry.Zuo@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The EDID has not been modified; it was read directly using the cat
command. This is actually the first time I've ever learned about the
concept of EDID.

Vojvodic, Relja (Reggie) <Relja.Vojvodic@amd.com> =E4=BA=8E2026=E5=B9=B43=
=E6=9C=8817=E6=97=A5=E5=91=A8=E4=BA=8C 04:32=E5=86=99=E9=81=93=EF=BC=9A
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Hi,
>
> This EDID does not seem to have a HDMI VSDB or HFSCDB block within it. Th=
ese blocks are where the SCDC bit gets set within the EDID. The lack of the=
se blocks indicates that SCDC is not supported on this display.
>
> Has this EDID been modified in any way? Or is it the EDID right off of th=
e display.
>
> Thanks,
> Relja
> ________________________________
> From: hgfdgjn <shichuanyim@gmail.com>
> Sent: Thursday, March 12, 2026 12:28 PM
> To: Vojvodic, Relja (Reggie) <Relja.Vojvodic@amd.com>
> Cc: Linux regressions mailing list <regressions@lists.linux.dev>; Koenig,=
 Christian <Christian.Koenig@amd.com>; Deucher, Alexander <Alexander.Deuche=
r@amd.com>; Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Limonciello, Mari=
o <Mario.Limonciello@amd.com>
> Subject: Re: [BUG] HDMI monitor shows no signal when the refresh rate is =
higher than the default 60Hz
>
> [You don't often get email from shichuanyim@gmail.com. Learn why this is =
important at https://aka.ms/LearnAboutSenderIdentification ]
>
> The populate_hdmi_info_from_connector() patch is in the stable master
> and running on my device.
> It appears to be a specific monitor issue.
>
> This is the EDID of the monitor I used to reproduce the issue.
>
> $ cat /sys/class/drm/card1-HDMI-A-1/edid | base64
> AP///////wAhY0MkAAAAACQjAQOANR14Loy1r09DqyYOUFSlSwCBgLMAlQABAQEBAQEBAQEBA=
jqA
> GHE4LUBYLEUADyghAAAeAAAA/AAyNEZTMQogICAgICAgAAAA/QAwkB6lKAAKICAgICAgAAAA/=
wAw
> MDAwMDAwMDAwMDAxAe4CAyKxSJAEAwESHxM/aAMMABAAOHgA4gB/aBoAAAEBMJDtim+AoHA4Q=
EAw
> IDUADyghAAAeKIOAoHA4KUAwIDUADyghAAAeAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAA
> AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA6Q=3D=3D
> $ cat /sys/class/drm/card1-HDMI-A-1/edid | parse-edid
> Checksum Correct
>
> Section "Monitor"
>     Identifier "24FS1"
>     ModelName "24FS1"
>     VendorName "HKC"
>     # Monitor Manufactured week 36 of 2025
>     # EDID version 1.3
>     # Digital Display
>     DisplaySize 530 290
>     Gamma 2.20
>     Option "DPMS" "true"
>     Horizsync 30-165
>     VertRefresh 48-144
>     # Maximum pixel clock is 400MHz
>     #Not giving standard mode: 1280x1024, 60Hz
>     #Not giving standard mode: 1680x1050, 60Hz
>     #Not giving standard mode: 1440x900, 60Hz
>
>     #Extension block found. Parsing...
> #WARNING: I may have missed a mode (CEA mode 63)
>     Modeline     "Mode 8" +hsync +vsync
>     Modeline     "Mode 0" +hsync +vsync
>     Modeline     "Mode 1" 148.500 1920 2008 2052 2200 1080 1084 1089
> 1125 +hsync +vsync
>     Modeline     "Mode 2" 74.250 1280 1390 1420 1650 720 725 730 750
> +hsync +vsync
>     Modeline     "Mode 3" 27.027 720 736 798 858 480 489 495 525 -hsync -=
vsync
>     Modeline     "Mode 4" 25.200 640 656 752 800 480 490 492 525 -hsync -=
vsync
>     Modeline     "Mode 5" 27.000 720 732 796 864 576 581 586 625 -hsync -=
vsync
>     Modeline     "Mode 6" 148.500 1920 2448 2492 2640 1080 1084 1089
> 1125 +hsync +vsync
>     Modeline     "Mode 7" 74.250 1280 1720 1760 1980 720 725 730 750
> +hsync +vsync
>     Modeline     "Mode 9" +hsync +vsync
>     Option "PreferredMode" "Mode 8"
> EndSection
>
>
> This is another physically damaged monitor of mine, but I couldn't
> reproduce this issue.
> EDID for broken monitor:
>
> $ cat /sys/class/drm/card1-HDMI-A-1/edid | base64
> AP///////wBBDB/C+yUAACIfAQOAPCJ4KivFrVBHpiYTUFS/7wDRwIGAMWgxfEVoRXxhaGF8V=
l4A
> oKCgKVAwIDUAVVAhAAAeQOcAaqCgZ1AIIJgEVVAhAAAaAAAA/ABQSEwgMjc1TTgKICAgAAAA/=
QAw
> kB7mPAAKICAgICAgAasCAzDxTBAfBRQEEwMSAhEBPyMJBweDAQAAZQMMABAAZ9hdxAF4gABoG=
gAA
> AQEwkOZvwgCgoKBVUDAgNQBVUCEAAB5aoACgoKBGUDAgNQBVUCEAAB4COoAYcTgtQFgsRQBVU=
CEA
> AB7wPADQUaA1UGCIOgBVUCEAABwAAAAAAAAA/Q=3D=3D
>
> If you need other information or testing, please ping me, and I will test=
 ASAP.
>
> Thinks.
>
> Vojvodic, Relja (Reggie) <Relja.Vojvodic@amd.com> =E4=BA=8E2026=E5=B9=B43=
=E6=9C=8812=E6=97=A5=E5=91=A8=E5=9B=9B 23:14=E5=86=99=E9=81=93=EF=BC=9A
> >
> > [AMD Official Use Only - AMD Internal Distribution Only]
> >
> > Hi,
> >
> > I've brought up this issue with some maintainers on our team and we've =
begun looking into it.
> >
> > This issue has come up before and was fixed with this patch: "drm/amd/d=
isplay: Improve HDMI info retrieval", which should be included in the stabl=
e master branch. You can double check if this is the case.
> >
> > In the meantime, could we get the EDID of your display to aid in the de=
bugging?
> >
> > Thanks,
> > Relja
> >
> > ________________________________
> > From: Linux regression tracking (Thorsten Leemhuis) <regressions@leemhu=
is.info>
> > Sent: Thursday, March 12, 2026 9:33 AM
> > To: Vojvodic, Relja (Reggie) <Relja.Vojvodic@amd.com>
> > Cc: regressions@lists.linux.dev <regressions@lists.linux.dev>; Koenig, =
Christian <Christian.Koenig@amd.com>; hgfdgjn <shichuanyim@gmail.com>; Deuc=
her, Alexander <Alexander.Deucher@amd.com>
> > Subject: Re: [BUG] HDMI monitor shows no signal when the refresh rate i=
s higher than the default 60Hz
> >
> > On 3/8/26 10:56, hgfdgjn wrote:
> > > 7.0-rc2 can also reproduce it; after locating the issue, it was
> > > reproduced using the stable upstream master branch.
> >
> > CCing the amdgpu maintainers, as this seems stalled. Dropping Greg and
> > stable, they most likely don't care.
> >
> > Relja Vojvodic, in case you missed it: this regression seems to be
> > caused by a commit of yours: 3471b9a31ce352 ("drm/amd/display: Rework
> > HDMI data channel reads") [v6.19-rc1]
> >
> > Ciao, Thorsten
> >
> > >> On Sun, Mar 08, 2026 at 05:42:39PM +0800, hgfdgjn wrote:
> > >>> Hi maintainers:
> > >>>
> > >>>   After updating to v6.19.6 on Arch Linux, if I set the refresh rat=
e
> > >>> higher than 60Hz, the monitor displays "No Signal".
> > >>> I tried bisecting and found:
> > >>>> # first bad commit: [3471b9a31ce352ffb343cf02a991261880aac3a7] drm=
/amd/display: Rework HDMI data channel reads
> > >>>
> > >>> This issue on my machine was caused by this change:
> > >>>
> > >>> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc=
.c
> > >>> b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
> > >>> index 267180e7bc48..5d2bcce2f669 100644
> > >>> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
> > >>> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
> > >>> @@ -549,7 +549,8 @@ void write_scdc_data(struct ddc_service *ddc_se=
rvice,
> > >>>      /*Lower than 340 Scramble bit from SCDC caps*/
> > >>>
> > >>>      if (ddc_service->link->local_sink &&
> > >>> -        ddc_service->link->local_sink->edid_caps.panel_patch.skip_=
scdc_overwrite)
> > >>> +        (ddc_service->link->local_sink->edid_caps.panel_patch.skip=
_scdc_overwrite
> > >>> ||
> > >>> +        !ddc_service->link->local_sink->edid_caps.scdc_present))
> > >>>          return;
> > >>>
> > >>>      link_query_ddc_data(ddc_service, slave_address, &offset,
> > >>>
> > >>>
> > >>> It appears that scdc_present is always false on my device.
> > >>> I reverted the change to write_scdc_data(), and the monitor works
> > >>> normally at high refresh rates.
> > >>
> > >> Can you cc: the developers and maintainers of this change to let the=
m
> > >> know?  Otherwise they will not notice it.  Also, does 7.0-rc2 show t=
his
> > >> issue?
> > >>
> > >> thanks,
> > >>
> > >> greg k-h
> > >
> >
