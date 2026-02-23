Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DFA3612F9
	for <regressions@lists.linux.dev>; Mon, 23 Feb 2026 11:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771847549; cv=pass; b=Eo0bq6mbr7whHUiNpGslqS8Vh7XtBU1lW0wLrBrSD2Df2s5noIHWFNahho/FTMZ3JVrt89lGLI+HRTlZnBhfH7x0lTGMCmN3IOJvo3SMxmQFHJalOHfwzcEgxmS4p4vglu/cizA5uN40P4z6DTkpdKqt/F17yK0Ca9t2La7h310=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771847549; c=relaxed/simple;
	bh=+d1Gsvyn8shZSpEx0gTkDzpXXrDC99n6t6b6nk1CH4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UOlLV4DCL+CAV/eN97pbkO+hHPvg6p2Nij408AUyuxSjfG+/l34MkkyRwkcBGdtUofg4B2we/HkhwWLAS6ZjufbXxqAWMCdP/P5NfE74oF1gSlAy5tdM/SWd5HWh3ECeGtqUcfax3fX6rvLF97asUdwbF4sLLIHAqYdEzoSpX/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPPoNycQ; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPPoNycQ"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-566390e7db3so4089072e0c.1
        for <regressions@lists.linux.dev>; Mon, 23 Feb 2026 03:52:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771847546; cv=none;
        d=google.com; s=arc-20240605;
        b=BhhQ4tC0W9Hndn36rNTlSAbCDPQWRuvFSSA0B0KFiboQk6tUayh3QBhg/z89/62HPq
         dGqTjvKQ0GotrZHed6q/DaOJZMQ41FS2R7VF3c/IsHjWI9I/9xNo5xV58oQHGSv6maCE
         Ib4tTBgeBM32jEaToO/9wtT9ZixYJlId9g7+XCckWPlv2p26IzF3fS41JAgqB6yXt7Ni
         s2wXnngsxxcl7fToy1VriIRsEY3Hpya/rw/5G2MUHi5ewo/p9pAd9AbcFovQB3VURT4J
         3di7DdM34WTrBbwKDN/Y1Wm6u66x1HmmZxI0VXRRhmMOC7B0AqsFjho8PH/KJgkNZWY8
         TFvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VGP11KQ2dHKSZizL7MNew2Tz13D8uXvvu4p+lY24KEM=;
        fh=6o1Ox6GTok0iMSQJyZMWzmO8DdYHkGqvFEtxbN4k+8c=;
        b=QaRkHMhiF0Bvf8AA47eBF9Lisd3m0SESG74+2fuQTs7R5MKIZVrN8723SKZnJ6Oms0
         PDlF5v73doVWEgcHuuibG3Krp8KmNS9AEsLIYhuMy1U2Gu0uqZ+IDeFvDd84xs0bc9hH
         PAjgZxjTlC1jG0U9ORRjaNHRZlVWr1hcDYUqB+rB+bc6BfN8/vx8LFZKu2pgFs6HggyU
         o1mGWaYw4zqodaZx5iPi8eyelUJYMvYAzo86OKwcxwF46q8sXUj+JoUleb03QdAGOcpL
         UiX7v5vkqE3I5cLyZqH6Pa2QXTP7ikIZARxG6hkG24MiRUjpzEUxv+HB6e3LAp6ZuDMZ
         dDnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771847546; x=1772452346; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGP11KQ2dHKSZizL7MNew2Tz13D8uXvvu4p+lY24KEM=;
        b=aPPoNycQUWSZJuY4hJQHUX4X0knbTdC495RBw79BKZrHRrl/cKZxnbTGy5oVqP9gZL
         Hd0JUMtM/0tXdIpTSTtbGnUI21t0Rejifci1uhTLehh7/Ua6rgjakLS7kuBTLP/fTzT7
         whu7dEbEMAzktp2AqgdKFi4X+PFeRi4qMElx52NJ4DFPqV3s7Y4Wugq0Lifs6XPdYajZ
         s7+payB+27bDyOoZW9I/HYGlZUVNmeyFnPsG6+YqiTNDZIk9kQtZka+B+MYYadUHA9hZ
         RAKMzA3ZBZmk0RjmwhjrQdc1VeIm0QhYKFvGQSwWLYJtkTxPe+tRl3c4XbTK6LvxFdtB
         RWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771847546; x=1772452346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VGP11KQ2dHKSZizL7MNew2Tz13D8uXvvu4p+lY24KEM=;
        b=FU9pg7g5YfhPt8dde779pTA47fQurswSGw0kHErf8ueH5ozPfniMRkl2Tv3uK7Sbgv
         S/8pqWIhDkKa0B3x9GQHvsG/jZ3imjYZE0fIUub9/4rxsj+ncY2wJBX+8ng70jHt6q/b
         SqV1uMxguzG2IX3tjAuu9JexNaGm7p82rv7fPWAyy2VVeC7wuJ3QKUiJsEMZ3S8t0Cg+
         qbDTtXrfhj2YMvIErFp7+64Lm9ehAIEx6KmhFp+GJbIqHUk7P12uuFMK2m4CobEIvntC
         jhiw00TEYm2xLqB0UFW+xqaGVVJ13q9Dw5YFMgr0Wl8OkP4IdzuYDqg1aNMBoxWcutj+
         qzfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlpGRLO2g0nIfLmXox3Ln5NNXDUHHzLNsjvZtvNnURSOxMALu2THXoKBKh1V6m/EIaQ2dZNGpmimU52Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKV91w/d28SFk/nQzv1/nI4iU0G/g4FEdh5iq7W/GInaX1cU09
	d5uTe4EIyRsHkVzibSBzf7Mqd85qieeVOAFGTwG6yDrutAMsKPw9seAL5SDAVNpbYrRhPVSMnMm
	B0TphHqK4/7mPxVZzz4NhxFq0WcpRfLY=
X-Gm-Gg: AZuq6aIuQNsUFuY7wSXZBrTZ+fDu/0sD0z5dVJN4kOo/icyJg+FAgSyg2q3ody1Gn61
	WAln+DFL9eUtILx9/EOAwZd4NPaAR3npFhla0GP7gvG7KTt1Zgrd2RQJKRC93OlUj78VafKs9g6
	zbIe65CpiLjgxqM/0W6NtqM2k6kP79eL25Fy7xincbLSMp7E9emUJwb2xX3nCIw5gComyXzUE3z
	H+KF4Ux1vNo/Px99QOCUpXIKBwlJ23Q3vmVV61J5DnDcJaUfoyRZXZ6IxFivSMw/ZQiKA/YPfW+
	rocWeDrJP5zXPaGcEsQTjrQXarHxo9T6OIEtGoF+OrnxV20enePomcbY22UTfg88uwSIDoydDe7
	BtxHlngZ/Qg==
X-Received: by 2002:a05:6102:4194:b0:5eb:fc32:935c with SMTP id
 ada2fe7eead31-5feb2ea40afmr3964742137.3.1771847545558; Mon, 23 Feb 2026
 03:52:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
 <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com> <068a5363-de97-4d67-94a9-c9a2baed68b0@leemhuis.info>
In-Reply-To: <068a5363-de97-4d67-94a9-c9a2baed68b0@leemhuis.info>
From: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
Date: Mon, 23 Feb 2026 11:52:04 +0000
X-Gm-Features: AaiRm53kqVqwYlk73dxvSEeN9WnimirsmxYiC5QcBDjE53JtGAA8jfNwC48NL8s
Message-ID: <CAD0gVBs4m9FpBZ9eVcxRK5y601WPkatGE6e9fi1iK0YA=CiMHw@mail.gmail.com>
Subject: Re: [REGRESSION] Display freeze on VT switch back to X11 since v6.16
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org, 
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

Thorsten,

It's worth a shot. I'll give it a try and report back.

Andr=C3=A9s

On Mon, Feb 23, 2026 at 8:26=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
>
>
> On 2/23/26 09:10, Ricardo Ribalda wrote:
> > Hi Andr=C3=A9s
> >
> > Thanks for doing the bisecting
> >
> > On Sun, 22 Feb 2026 at 22:56, Andr=C3=A9s P=C3=A9rez <andres.f.perez@gm=
ail.com> wrote:
> >>
> >> # OVERVIEW
> >>
> >> Since kernel v6.16.1, switching from an X11 session to a text VT and b=
ack
> >> freezes the display on a ThinkPad P15 Gen 2. The system remains respon=
sive
> >> over SSH; only the display is frozen. Bisecting identified commit
> >> d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
> >> ioctls") as the trigger. Reverting the logic change in that commit
> >> fixes VT switching
> >> on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution. =
Wayland
> >> compositors (e.g., river and sway) are not affected.
> >>
> >> Last good:  v6.15.9
> >> First bad:  v6.16.1
> >> Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the
> >> camera for some ioctls
> >>
> >> ## Hardware:   Lenovo ThinkPad P15 Gen 2i (20YQ0031US)
> >> CPU:        Intel Core i7-11800H (Tiger Lake-H)
> >> iGPU:        Intel UHD Graphics (TGL GT1)
> >> dGPU:       NVIDIA T1200 (not involved in eDP output; driver: nvidia-o=
pen)
>
> Could this be caused by nvidia's own driver, even if it is not supposed
> to be involved? Might be worth ruling out with a proper vanilla kernel,
> ideally really fresh, so 7.0-rc1.
>
> Ciao, Thorsten
>
> >> Display:    15.6" 1920x1080 eDP, 10 bpc capable (EDID 1.4)
> >> Webcam:     Integrated Camera on PCH xHCI (Bus 003 Port 004)
> >> Firmware:   LENOVO N37ET61W (1.97)
> >> OS:         Arch Linux, Nix home-manager, X11 + xmonad, no display man=
ager
> >>
> >> ## Symptoms and reproduction steps:
> >> 1. Boot, start X11 on tty1 (startx).
> >> 2. Switch to tty2 (Ctrl+Alt+F2): works.
> >> 3. Switch back to tty1 (Ctrl+Alt+F1): display freezes.
> >>    - Frozen on the last frame shown before switching away.
> >>    - System is fully responsive over SSH.
> >>    - Other VTs switch normally between each other as long as X11 is
> >> not active on them.
> >>    - Killing X does not recover the display. A reboot is required.
> >>
> >> # DEBUG ANALYSIS
> >>
> >> On v6.16.1, the VT switch back to X triggers a full modeset due to pip=
e
> >> configuration mismatches detected by intel_pipe_config_compare:
> >>
> >> [drm:intel_pipe_config_compare] fastset requirement not met in pipe_bp=
p
> >>   (expected 30, found 24)
> >> [drm:intel_pipe_config_compare] fastset requirement not met in dp_m_n
> >>   (expected link 269484/524288, found link 336855/524288)
> >> [drm:intel_pipe_config_compare] fastset requirement not met in dpll_hw=
_state
> >>   (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)
> >> [drm:intel_pipe_config_compare] fastset requirement not met in port_cl=
ock
> >>   (expected 270000, found 216000)
> >> [drm:intel_atomic_check] forcing full modeset
> >>
> >> On v6.15.9, the same VT switch shows no such messages.
> >> no pipe_config_compare runs, no modeset, no freeze.
> >>
> >> # BISECT AND VERIFICATION
> >>
> >> The bisect converged on d1b618e7954802fe in the uvcvideo driver. This
> >> commit adds a switch statement to uvc_v4l2_unlocked_ioctl that allows
> >> certain V4L2 IOCTLS to call video_ioctl2 directly without first callin=
g
> >> uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls called uvc_pm_=
get
> >> before video_ioctl2.
> >>
> >> ## VT switching verification across kernel versions:
> >>
> >>   v6.12.74 arch pkg:   WORKS
> >>   v6.15.9 arch pkg:    WORKS
> >>   v6.15.9 from source: WORKS
> >>   v6.16.1 with d1b618e reverted:     WORKS
> >>   v6.17.9 with PM wrapping restored: WORKS
> >>   v6.18.9 with PM wrapping restored: WORKS
> >>
> >>   v6.16.1 from source:  FREEZES
> >>   v6.16.1 arch pkg:     FREEZES
> >>   v6.17.9 arch pkg:     FREEZES
> >>   v6.18.9 from source:  FREEZES
> >>   v6.18.9 arch pkg:     FREEZES
> >>
> >> ## Things that do not eliminate the freeze
> >>
> >>   - module_blacklist=3Duvcvideo on boot
> >>   - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)
> >
> > This is puzzling me a bit... You are saying that if you do not build
> > the uvc driver, the freeze is still happening?
> >
> > Am I understanding this correctly?
> >
> >>   - i915.enable_psr=3D0
> >>   - Bypassing intel_vrr_transcoder_enable/disable (no-op)
> >>   - xrandr --output eDP-1 --set "max bpc" 10
> >>   - Xorg config FBDepth 30 (No effect on pipe_bpp)
> >>
> >> ## Workaround patch
> >>
> >> Reverting the optimization from d1b618e to restore the unconditional
> >> uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/=
uvc_v4l2.c
> >> index 9e4a251eca88..15057b47ec4f 100644
> >> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> >> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> >> @@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct fil=
e *file,
> >>   unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);
> >>   int ret;
> >>
> >> - /* The following IOCTLs need to turn on the camera. */
> >> - switch (converted_cmd) {
> >> - case UVCIOC_CTRL_MAP:
> >> - case UVCIOC_CTRL_QUERY:
> >> - case VIDIOC_G_CTRL:
> >> - case VIDIOC_G_EXT_CTRLS:
> >> - case VIDIOC_G_INPUT:
> >> - case VIDIOC_QUERYCTRL:
> >> - case VIDIOC_QUERYMENU:
> >> - case VIDIOC_QUERY_EXT_CTRL:
> >> - case VIDIOC_S_CTRL:
> >> - case VIDIOC_S_EXT_CTRLS:
> >> - case VIDIOC_S_FMT:
> >> - case VIDIOC_S_INPUT:
> >> - case VIDIOC_S_PARM:
> >> - case VIDIOC_TRY_EXT_CTRLS:
> >> - case VIDIOC_TRY_FMT:
> >> - ret =3D uvc_pm_get(handle->stream->dev);
> >> - if (ret)
> >> - return ret;
> >> - ret =3D video_ioctl2(file, cmd, arg);
> >> - uvc_pm_put(handle->stream->dev);
> >> + ret =3D uvc_pm_get(handle->stream->dev);
> >> + if (ret)
> >>   return ret;
> >> - }
> >> -
> >> - /* The other IOCTLs can run with the camera off. */
> >> - return video_ioctl2(file, cmd, arg);
> >> + ret =3D video_ioctl2(file, cmd, arg);
> >> + uvc_pm_put(handle->stream->dev);
> >> + return ret;
> >>  }
> >>
> >>  const struct v4l2_ioctl_ops uvc_ioctl_ops =3D {
> >>
> >> Andr=C3=A9s
> >>
> >
> >
>
