Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066A335C1B8
	for <regressions@lists.linux.dev>; Mon, 23 Feb 2026 11:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771847497; cv=pass; b=RwrrYyXvuPXYZJ81/tgTzhTapoJJZ99L6kGUxPCjM4ddXVVrkVe5lIj/T/sIFbBRX+QgXv1JPMVDZyHx+pIKtVgRwF15lxGY5FU2Fnbb2FeNEcUdjFVgGQdZnkW1OsffVNAm0G9euZ/7pOwK2JN9uG4RxjMvPQOgfQAHVkkbFSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771847497; c=relaxed/simple;
	bh=6iocD9MNSzx4u2ot8rxH8bvtMLCokh3pHlrbgw2W8ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mG0L6fAHKaCCwoKpORRI7GHgAYBkKsZBWW59HrAP6gzcXi4rBJ5PdhHT2UmtzJ12+UXel148AG430odjLHmX+jcgAyVU6QjiMwBECCdiWbVd7yM/EHtz+gZXrvHgxXtRpYB8YCq/lGL237yKINmElL3su9VK1bHUqLdd4Koddls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErvQLS/T; arc=pass smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErvQLS/T"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5fe086fb0bcso904762137.0
        for <regressions@lists.linux.dev>; Mon, 23 Feb 2026 03:51:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771847495; cv=none;
        d=google.com; s=arc-20240605;
        b=EEeylFvdHhxnsPRR6/M7grRXbrs76cbSbKMfGp99r+dRBfKzTt8CrwscahQfHTxfHN
         qnFohLcVZwYaDIM4Kd0SkmaVg7lOc6wO0uXTT1/oMOc2ztl5BXbc2te8jaD1GCifI0PN
         F5vq9TnOY2yxN9DmYwhVxlfZpM2+0r7Qdz1UCGzhiSGpGCL7s/2L3fvahY2yXGlLiX1K
         ZaSpP88f9fw1f3S17ENlEjItqItvdeseoxABttOOyQ8Hmd76y0cJlgSOtdsJzaPcjQji
         48VmKicad0qN+6pllCAmEKKnsJSgxkxdp8kxebKfa5ssWv23LyRg0fgoZHKAh5gCevEH
         dRwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rMp9NyS10Y7o5BbV0/n1cd3o9I8LFMg8n5wPuOM1jvE=;
        fh=a2Euum5U2jbznrSLrQ/S8lxg3kvWjG8DI3TctjCcURA=;
        b=j3EzkzfThTs2jVrd92ey0q7vS0eSFmo8aG31t50wXTOqolq9Me9przWLK+/PqM7jiJ
         gb/yW1OHki9e5oW3HAN36x7r7Yt6RctpIXMBRGYwbRDXpENiyI++R0GLWl80Nhda1LOu
         k0BsvYoQ3C6VPrwDGkWxx30rHY5w67XiI8qH6ALSAiU/rrhOe/hoEbKNszZ4+tJR00XY
         Vr8bDDPREbeWdrcMaSN80lbY1DiYhTFQNs4/Dg3t/FM1Hv/wcxOPxBJB9J+ineLBPvZC
         u0R/KhEmglPR4NoE1jB+FO1RpmVNu9+2DK7/B4JZnoS10+oJaIGVUuexZ3004/Uv6+ls
         Q2tQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771847495; x=1772452295; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMp9NyS10Y7o5BbV0/n1cd3o9I8LFMg8n5wPuOM1jvE=;
        b=ErvQLS/TE8yalnh5HHUjZH1ELUQ4p/n5ijFZ5fEasaCFVJDhGrWnz/gJn3OG2RyXTI
         GHslEmQjuPhUYeR+R8PUgmJV9wdw2hbES/9NrfeDGYY9EAU2pvcLley3xA7s6nFTnfwm
         OxfOzDt60eUYgx07QEtz56ihl3Ae6HjBFN0aNaYp3F7MSzB1GTD4WmtWq2yHQdd2lNtl
         AP62DpLyOICy3Ql1QTpZs30NjIQfD0PDH2UCwPucJZ0/d1X/RUnJlhsFsbkNqC3StdqN
         DkMwjZESwLPAgpNij0k3XM2C+jtWwas2tHqbPkhcc3I5bHiPArJ1umDbq2m55SVCuk5B
         ahSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771847495; x=1772452295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rMp9NyS10Y7o5BbV0/n1cd3o9I8LFMg8n5wPuOM1jvE=;
        b=xD0A3bUQc0C3hLiRvIjODtHmqIqJjFBvuBtmR2q3BLnPXVD7TGnBTDkzDAixraajl1
         AFn/gUe7EZfXcOVpn0PuIZv4rnm96aGL6eiJJY8Wkwln2iTCdMWx35bybiGzE74iCjYI
         Xu/hMHrkaF541GlAH5qtZTVcHyEh/oMxzLRKsZQ3s4cuP4rOzbWe6hC//ukIKVEBOekY
         E+e/eglLSFTj42DDxtlwScTZBaCZthBDE6VFxncRwl7iH1w0em5liA+QuO2S2Gkf5o9A
         a9CD2cY/pDCaU7Ttq7/KEMjs7D9bHQbgJ2gI+e87RTO/RIxy7o+t+A73XJYsZYuz7PRy
         gzrA==
X-Forwarded-Encrypted: i=1; AJvYcCWqZr3sILlOS4i1UOtRM0Rx5g+X+EoHzxkEArdwn1S8rHZaiyogcv6WsoufPJABrt0MTDtiU7iHctLs6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIubJCSDZ2j5875pxtjsPcEp78qJEeALokqF9EvYxlxIjG/FbG
	siiQe+yB0i/yJQ+KWNmNTWNTIAttJrzlt8HGq+ugmU2uevbAbrCgOTsEQZzb1dpaazxh54nFVaR
	3r48aGJ+YSmiE7uhMJUAR1sABlELP38k=
X-Gm-Gg: AZuq6aJdJO+S4F39PJAmO1uBWLzGRhFa2dX1TIY30LFvgTqqWa6+GrRmq4LY0rjUys/
	wVz/yt6fx5BuY4eF108UWqZPxkfQAtGP1t9n803d0mGQD1xs/LB4qRfMcorL8fhRhM0KdLiWngk
	tUg2zGtbx4etA2x0moe4NCbDuqDLElYqHK2UMVQoQBL2rJt3J2ED/IlVpL2+86ENs+bkGLqfS80
	juERXm7jD1fR86IXpFabCwOyWk9Nn7OrjlpaZHB9XWp8YWRna0wlLj5Bx3OZq6MBpzM/ikJmanC
	PU5oZlpZhQEFAfwHQ/UYpEwsz0t6vBKOqGg1aYUWmozCGR6XXO1xf3sWEWwlq0+Rh5OJP43I05V
	pNhIKTi9xiA==
X-Received: by 2002:a05:6102:e0e:b0:5df:8f4:61e6 with SMTP id
 ada2fe7eead31-5feb310b93bmr3236127137.32.1771847494951; Mon, 23 Feb 2026
 03:51:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
 <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
In-Reply-To: <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
From: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
Date: Mon, 23 Feb 2026 11:51:14 +0000
X-Gm-Features: AaiRm52aszgholXfDNGG6k-0d1fHGX88p3iT8Mn4sxSWllcwfxYwH-T9tRbXK5Q
Message-ID: <CAD0gVBtWhQqnxVt7kvQoQcbazGiLH-rUNrTfnZZpm40-jKvTUA@mail.gmail.com>
Subject: Re: [REGRESSION] Display freeze on VT switch back to X11 since v6.16
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: stable@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ricardo,

Listen, I'm right there with you, scratching my head. First thing I
did when I bisected to that commit was modprobe -r that module. Easy
sacrifice; I don't use my camera that often. When it still froze, I
assumed that maybe something related to module init was still
lingering, so I disabled it by kernel boot param. When that didn't
work, I just didn't build it in at all. Then I ignored it and tried a
few other things. Eventually I came back to that commit. Instead of
patching any code, I just added a comment to the file, thinking maybe
this is just some build artifact that's causing a false positive. No
dice. So far, the only thing that has allowed VT switching to work is
restoring those PM calls around the video_ioctl2 call. I am not
presenting it as a solution (quite the contrary!), I am presenting it
solely because it's all I've got to go on.

Andr=C3=A9s

On Mon, Feb 23, 2026 at 8:18=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> Hi Andr=C3=A9s
>
> Thanks for doing the bisecting
>
> On Sun, 22 Feb 2026 at 22:56, Andr=C3=A9s P=C3=A9rez <andres.f.perez@gmai=
l.com> wrote:
> >
> > # OVERVIEW
> >
> > Since kernel v6.16.1, switching from an X11 session to a text VT and ba=
ck
> > freezes the display on a ThinkPad P15 Gen 2. The system remains respons=
ive
> > over SSH; only the display is frozen. Bisecting identified commit
> > d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
> > ioctls") as the trigger. Reverting the logic change in that commit
> > fixes VT switching
> > on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution. W=
ayland
> > compositors (e.g., river and sway) are not affected.
> >
> > Last good:  v6.15.9
> > First bad:  v6.16.1
> > Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the
> > camera for some ioctls
> >
> > ## Hardware:   Lenovo ThinkPad P15 Gen 2i (20YQ0031US)
> > CPU:        Intel Core i7-11800H (Tiger Lake-H)
> > iGPU:        Intel UHD Graphics (TGL GT1)
> > dGPU:       NVIDIA T1200 (not involved in eDP output; driver: nvidia-op=
en)
> > Display:    15.6" 1920x1080 eDP, 10 bpc capable (EDID 1.4)
> > Webcam:     Integrated Camera on PCH xHCI (Bus 003 Port 004)
> > Firmware:   LENOVO N37ET61W (1.97)
> > OS:         Arch Linux, Nix home-manager, X11 + xmonad, no display mana=
ger
> >
> > ## Symptoms and reproduction steps:
> > 1. Boot, start X11 on tty1 (startx).
> > 2. Switch to tty2 (Ctrl+Alt+F2): works.
> > 3. Switch back to tty1 (Ctrl+Alt+F1): display freezes.
> >    - Frozen on the last frame shown before switching away.
> >    - System is fully responsive over SSH.
> >    - Other VTs switch normally between each other as long as X11 is
> > not active on them.
> >    - Killing X does not recover the display. A reboot is required.
> >
> > # DEBUG ANALYSIS
> >
> > On v6.16.1, the VT switch back to X triggers a full modeset due to pipe
> > configuration mismatches detected by intel_pipe_config_compare:
> >
> > [drm:intel_pipe_config_compare] fastset requirement not met in pipe_bpp
> >   (expected 30, found 24)
> > [drm:intel_pipe_config_compare] fastset requirement not met in dp_m_n
> >   (expected link 269484/524288, found link 336855/524288)
> > [drm:intel_pipe_config_compare] fastset requirement not met in dpll_hw_=
state
> >   (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)
> > [drm:intel_pipe_config_compare] fastset requirement not met in port_clo=
ck
> >   (expected 270000, found 216000)
> > [drm:intel_atomic_check] forcing full modeset
> >
> > On v6.15.9, the same VT switch shows no such messages.
> > no pipe_config_compare runs, no modeset, no freeze.
> >
> > # BISECT AND VERIFICATION
> >
> > The bisect converged on d1b618e7954802fe in the uvcvideo driver. This
> > commit adds a switch statement to uvc_v4l2_unlocked_ioctl that allows
> > certain V4L2 IOCTLS to call video_ioctl2 directly without first calling
> > uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls called uvc_pm_g=
et
> > before video_ioctl2.
> >
> > ## VT switching verification across kernel versions:
> >
> >   v6.12.74 arch pkg:   WORKS
> >   v6.15.9 arch pkg:    WORKS
> >   v6.15.9 from source: WORKS
> >   v6.16.1 with d1b618e reverted:     WORKS
> >   v6.17.9 with PM wrapping restored: WORKS
> >   v6.18.9 with PM wrapping restored: WORKS
> >
> >   v6.16.1 from source:  FREEZES
> >   v6.16.1 arch pkg:     FREEZES
> >   v6.17.9 arch pkg:     FREEZES
> >   v6.18.9 from source:  FREEZES
> >   v6.18.9 arch pkg:     FREEZES
> >
> > ## Things that do not eliminate the freeze
> >
> >   - module_blacklist=3Duvcvideo on boot
> >   - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)
>
> This is puzzling me a bit... You are saying that if you do not build
> the uvc driver, the freeze is still happening?
>
> Am I understanding this correctly?
>
> >   - i915.enable_psr=3D0
> >   - Bypassing intel_vrr_transcoder_enable/disable (no-op)
> >   - xrandr --output eDP-1 --set "max bpc" 10
> >   - Xorg config FBDepth 30 (No effect on pipe_bpp)
> >
> > ## Workaround patch
> >
> > Reverting the optimization from d1b618e to restore the unconditional
> > uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/u=
vc_v4l2.c
> > index 9e4a251eca88..15057b47ec4f 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct file=
 *file,
> >   unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);
> >   int ret;
> >
> > - /* The following IOCTLs need to turn on the camera. */
> > - switch (converted_cmd) {
> > - case UVCIOC_CTRL_MAP:
> > - case UVCIOC_CTRL_QUERY:
> > - case VIDIOC_G_CTRL:
> > - case VIDIOC_G_EXT_CTRLS:
> > - case VIDIOC_G_INPUT:
> > - case VIDIOC_QUERYCTRL:
> > - case VIDIOC_QUERYMENU:
> > - case VIDIOC_QUERY_EXT_CTRL:
> > - case VIDIOC_S_CTRL:
> > - case VIDIOC_S_EXT_CTRLS:
> > - case VIDIOC_S_FMT:
> > - case VIDIOC_S_INPUT:
> > - case VIDIOC_S_PARM:
> > - case VIDIOC_TRY_EXT_CTRLS:
> > - case VIDIOC_TRY_FMT:
> > - ret =3D uvc_pm_get(handle->stream->dev);
> > - if (ret)
> > - return ret;
> > - ret =3D video_ioctl2(file, cmd, arg);
> > - uvc_pm_put(handle->stream->dev);
> > + ret =3D uvc_pm_get(handle->stream->dev);
> > + if (ret)
> >   return ret;
> > - }
> > -
> > - /* The other IOCTLs can run with the camera off. */
> > - return video_ioctl2(file, cmd, arg);
> > + ret =3D video_ioctl2(file, cmd, arg);
> > + uvc_pm_put(handle->stream->dev);
> > + return ret;
> >  }
> >
> >  const struct v4l2_ioctl_ops uvc_ioctl_ops =3D {
> >
> > Andr=C3=A9s
> >
>
>
> --
> Ricardo Ribalda
