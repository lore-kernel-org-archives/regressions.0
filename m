Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AB13ACEF9
	for <regressions@lists.linux.dev>; Wed, 25 Feb 2026 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772024483; cv=pass; b=GJUi4kCiJKriqvkqFeefli9bjOQfsFZ6MNA8A848bqdHkrs0Crr0txV1VZvjxUDrULmWm1Svkh4SGCmpwJP5OV8pI3CXA7WzrwLuEpdqdEHuuryri8c5+r0DWy56obYMJlBrb/GREPvx3OMibQxmHG4/DlsnK7t2sr6PZ7noBVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772024483; c=relaxed/simple;
	bh=1tAIusFpnU4ufM+/wV8RC3EgxfAFojZFioxLejPzG2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQ4oHJEcLZP5UFPhDASX5lD3OkvFqXR4egGe/fgNr4Sqbw3Sy3R8D85H7JQFXbIn0jdEJAaoh8yMCW9e2mWUIWB7I1I5dCd9ld1Z/xGOLNPjip5x79PlHKg7z+uwSbF37/u+twZdr/zTzF9NBtdNw6r8FHa7FNLaEo1Fpd04/ng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jn36Ooxs; arc=pass smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jn36Ooxs"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5673804da95so2702393e0c.0
        for <regressions@lists.linux.dev>; Wed, 25 Feb 2026 05:01:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772024480; cv=none;
        d=google.com; s=arc-20240605;
        b=asZkKBRhTnG59XOKPGaBcc5FvRCsDqceLN8hUxMMxW6Yfsc3DtnWahPkn2nlNHTahx
         2bSmauar5AHAbeBj+IJbNKheXjnNvK6sjGha4HBxCqDYVV6uYRa3qmesxH1/mTy9GY6/
         JleYV6MCz/myCqhc85U7VEjeAatp6Gugb9Zh7k89e9UibSzaS2TiYI1hKW231iOqHHgA
         r9Tqzr3yWQurb2FiIwwAWT4AHnx1jwreVDVcvTVKpIrXSjqXNo8XD20mtZzvOiZ2fH41
         Y27LCSquGj/OBKC67U4Ux8XhenjdGsHvBP97HZUXkqXOtHDHlKp5qgnUVpad0kVF6f4R
         2kNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gdcuy9iaPpeMvNyOTp4uTsufvW1t3dj/0T0Nt9nk9jk=;
        fh=3y5O8+wfdK9vbhkifxh9RTCZ9MpZMWpz0Gi5i8B4Gno=;
        b=ikUdS5TDFCripc09rwv6I+wW3wAzaEYHKRniA/FiUau41IqHID5qXUbgKaZqnkFQ81
         g6vSjCCrkbm5omONIXTX/i0CzRHhgIwzm7Z+nufg9YlfHIpNbMVOZgsjPxJ1VwmZpaN/
         F/NsQ6TtcATAE491wQxoRF3ocSfYSCLcagG0GkkLXVBRLBfSmiPRFPmK5j3ZRmH5oe3H
         03o6ryO/1H4INLZppQF0yzpubieFrxiq40Wrs9hSHds3Bc2evFUJbHLxhSKXfYXIW20d
         5AIDuaDADHhT34yDxC3IWPV0CPBesMpsmv+V6eAo7A7D3wfwvyzqaAV3r/ib1bTTuSRh
         x7xQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772024480; x=1772629280; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gdcuy9iaPpeMvNyOTp4uTsufvW1t3dj/0T0Nt9nk9jk=;
        b=Jn36OoxsFrpZ59/EZanhh4AR18IM48pxZH5mSoi3nTyBLNcjPB1sH3wThRZLtwyNHq
         X1xdupvIz32tJoOrK5T2sK0Wta0P11nVj8OZb6GuXkgzCoOOD3v7k9T/KWvhyKCvQOY8
         obgGx1q70U9YxILPhnpvCO3EFWSo5eYn+6zhjmc5TVdhLqmmZmqFafdUfXi1ZSaFG0av
         p7UT32XeDrMVvn2UWZlo/lDZ5FWXVKXs+O6/6sBwM8UpI41sOLW0K9cjzbWL2nD5DMBH
         GNtzSCFTGO3plCqWoB4WiCGmsp5RxvsR6HastQ9l/8FJrlbomXeEY24Qmixso7D6w1WV
         QoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772024480; x=1772629280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gdcuy9iaPpeMvNyOTp4uTsufvW1t3dj/0T0Nt9nk9jk=;
        b=iKv5ilt5a7ehoBIT6Ks/+3Ktrh9kMiUpzK/0Cm+CExIka5T+w9wDdozkWs7qfKGq7m
         0nrhqLPKAyh20yl+BIBqACRpTyCNCYJtZC35YyJ27LEV3hnrsGZuaTCp0m7fcvj88b64
         oMEH1OEPldPvoEfp0iLbEaat9KiMfeAlGEcG4XxAK/s3T3xIUgf5nJR99KQLfLdvn9t8
         C9nawZYdoO+dn/eEDXo6QydoAOAxgnv2bcLUIHrKO660AIKpITSA4gNRw4vb43MNZKXt
         MVEFWiveqcKSNxT+4I5zJgBTr0s+FcxRS9ExFCfQjWDIvHUm2PRpCPXK6omoy2FZAfvo
         pZyg==
X-Forwarded-Encrypted: i=1; AJvYcCUb8hxHyfYEt+u8qeFKYUC12JwMQftE9nJPCHWUYrWDd4C8f5lP+ccyI4e7PXrHLzvEjl+fUYcz2DWI6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhL72MbzRhocsHTNjU2kGUW7+7ILHbH5y2NaYmIId3UBuvxCrM
	mH7s3FYfcWiZXIv9cIQJ4Ildeb2klXzyCwBqNl3QqPSf6i3ufrg4yws2uUw3WU6A44F0PsTVsdh
	LoK1yHyO3WMhqWrUAp55WWCKr8h9YUmg=
X-Gm-Gg: ATEYQzwSVmet9wBSxcsMLKHtt/TbhXkWA0MwCKg1OGC4Y2Moz26HDnkeV/rY7CFk8r8
	tNLoH38w008aB1HaxYnvC9ps7HXnhlEJ5u8ULkcBmuPdDU/p6eE8FZVara6HBwjxzfmCWOu68lv
	wqEzRcQ8Oih7lagwsnn84IezbsOdXpOZiWRX/OF3gaiY8dxXbVc1bQl4OaeUaCpHMtMmxtJyNFh
	rhgXRYR23PZ2+TC8GP0LWa8iP3YBgC5P56diZeUmAkvlRgwU/qG6fEKFtd7hsgsx1IYAziq9HwV
	qxT/jvHAj+T69xbUczY+CoYRxB3h3hoEUPE0UCVLWMUMAFg+GNB0/Q20RjJRwIhQ3KtLRW7rtmp
	hGKHLEWaLSA==
X-Received: by 2002:a05:6102:c48:b0:5fe:13bc:f13a with SMTP id
 ada2fe7eead31-5feb30f2f8bmr6491053137.36.1772024478156; Wed, 25 Feb 2026
 05:01:18 -0800 (PST)
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
Date: Wed, 25 Feb 2026 13:00:55 +0000
X-Gm-Features: AaiRm53w9VqfdeuFM3tO4rVuI77Og9DiXXronH78foC19VF0BgkGYZqa119Jqws
Message-ID: <CAD0gVBvB6grt+Px_KV15eFFp8akuttEk6XY_r6L1yyuP75K+7A@mail.gmail.com>
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

So I built vanilla 7.0-rc1. I also added these kernel params:
    nvidia-drm.modeset=3D0
    modprobe.blacklist=3Dnvidia,nvidia_drm,nvidia_modeset,nvidia_uvm
    rd.driver.blacklist=3Dnvidia,nvidia_drm,nvidia_modeset,nvidia_uvm

then I booted into it. this is what my nvidia loadout looks like on my
usual 6.18.9:
    + uname -r
    6.18.9-arch1-2
    + lsmod
    + grep -E nvidia|nouveau
    nvidia_drm            147456  3
    nvidia_modeset       2121728  3 nvidia_drm
    nvidia_uvm           2568192  0
    nvidia              16306176  34 nvidia_uvm,nvidia_modeset
    drm_ttm_helper         16384  2 nvidia_drm,xe
    video                  81920  4 thinkpad_acpi,xe,i915,nvidia_modeset
    + lspci -nnk
    + grep -iA2 VGA\|3D\|Display
    00:02.0 VGA compatible controller [0300]: Intel Corporation
TigerLake-H GT1 [UHD Graphics] [8086:9a60] (rev 01)
        Subsystem: Lenovo Device [17aa:22d8]
        Kernel driver in use: i915
    --
    01:00.0 VGA compatible controller [0300]: NVIDIA Corporation
TU117GLM [T1200 Laptop GPU] [10de:1fbc] (rev a1)
        Subsystem: Lenovo Device [17aa:22d8]
        Kernel driver in use: nvidia

and this is what it looked like in vanilla 7.0-rc1 with blacklisted nvidia:
    + uname -r
    7.0.0-rc1-dirty
    + lsmod
    + grep -E nvidia|nouveau
    + lspci -nnk
    + grep -iA2 VGA\|3D\|Display
    00:02.0 VGA compatible controller [0300]: Intel Corporation
TigerLake-H GT1 [UHD Graphics] [8086:9a60] (rev 01)
        Subsystem: Lenovo Device [17aa:22d8]
        Kernel driver in use: i915
    --
    01:00.0 VGA compatible controller [0300]: NVIDIA Corporation
TU117GLM [T1200 Laptop GPU] [10de:1fbc] (rev a1)
        Subsystem: Lenovo Device [17aa:22d8]
        Kernel modules: nouveau

when I did a VT switch, it froze. my 90s failsafe triggered and rebooted me=
.
then I rebuilt 7.0-rc1 with my patch, rebooted with the same efi
loader, and was able to perform VT switching without any issues.

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
