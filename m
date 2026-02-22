Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AB247A6B
	for <regressions@lists.linux.dev>; Sun, 22 Feb 2026 21:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771797376; cv=pass; b=q9vl+wKmBbyvvKvOx6WW+v8j3KB8bMn2D5lglZ/Gys5pUvEzZgQecBK/p7jsNZAl878ogaaPtGEMA/L2sarQtF6kouO8EQ8Fw7sPsrz6hiFO4Vqi+L+suYCyBM6TMrGFu0hvZ4xZp5iLr5xWoMqBvIG14gu8YT9e3MQj12D0XJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771797376; c=relaxed/simple;
	bh=JmSvQO5XqyT6TdvcO2hqlfP/xs6Gk//750J3WTyc8u0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MLKSn4Hke5B614LQ8u2Ex3rUK3BwUiAKVsjcXkve+CKidznHPjIDot7ZvF7rnYvc7sm3ZXClmi9C4iBjzrE3aRNpuEXu3euLjdcHz7/5pXxMVLVpXsJunZ4kvlX1AaIeuX4I66rBAzDwxMgR30xIjbZaCF8Yr3yQql/D+rWac0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ftdvYv1H; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftdvYv1H"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5674d8be45eso1461042e0c.1
        for <regressions@lists.linux.dev>; Sun, 22 Feb 2026 13:56:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771797374; cv=none;
        d=google.com; s=arc-20240605;
        b=JZnZo3ZylM3oMHUpSyhcHH2Z02OR0HvzCgUjUgdEnr98xs+d0DuvlJ1coUptDr1ADr
         cDz3/8V6wWM4fUj7fkjdHfUoIPqj0KgyUWtsMqyEbn5/pxXbXH9BCeVDlCrIm7hbw+Z0
         H+lNBisLuhJBetluVTflYNh7QQvvOKSddOfgUzt78r8RLr7CBidflOsAFOgLPJf4sC2W
         ivkK7HpES528SSuUSxCFMZ9IZH6bkVefcdGiO+Cqua7xAf3a8+v3Dmgpx2YvYXDKpbWI
         pSioUZoeGl19O5xqlFSE2iIdCC+RycPFdEo5veFniPxxTsP5AUmR9Vd87PsI7+6Un9Tm
         Iceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=fvZFs6ZWQcArHoivTdoRPMVBttlGZZKU4uro3YAyvz8=;
        fh=E5g3maHsnyUMAiwVmwUyq6VP4zbCj1sjpTAtNm8Z8AY=;
        b=IBopUxWxQdWvjItPdCqVy2MbYgzfC8pMErIkWj0a1UlKt0YUPrJ982Jt5omIu1jQTr
         wKFvFi3dtS0lcLYaliZKUFuwUGVVcX15WgpWPB480F9kAOcK8Ya8ghI4QboAKt2nE1wo
         PqUV9l41Hlp/lvAeBsIl3ixWLCxvVQu3n62Dc1I/KvtmYxNAaiDUxRSKKe21vkw+gtbn
         drvB5ZP+mjVUOHilwEIAukC6+I41kPUIWRNYM0V2fCX/23r3lVvkPstMXKm87Axver9n
         GvqqFHts9iJFNmxu0CkOfb04h+Jlbiu3rhvYrG5aD2SoUOpIOSew+zz5+lvll0TDt1E1
         vAtA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771797374; x=1772402174; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fvZFs6ZWQcArHoivTdoRPMVBttlGZZKU4uro3YAyvz8=;
        b=ftdvYv1HxQOz5+mvRhbpYv3QEqTUGkWc2+iwKWLjwYeAUbf0+n9lrc6PYwsCLLMTfr
         fLHNSqqF8FqlWh5LHNUZmANSq+GC95QeWGICE27TDlKQUxOrqGX7v5Gpm40NRbVCpKyw
         KhhkI0xlkXzWEwyAb6xYj1QZo4Rjb7qf2El0GT+dzqN/PcS9hZx4keGCVMphk5m1PnGY
         vbcExbD35Db06QyjPx9Ya9DV2ci9mCyqg4YB+4AAmDzEWFoKw5wkO/eTKVlOKZFAL9wW
         +aeZBMb/8siq0hgpfoAAOAA3meW549tvEE502yrNfxeu5FO8GMN5SgIyJOgmUAncdnDu
         LyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771797374; x=1772402174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvZFs6ZWQcArHoivTdoRPMVBttlGZZKU4uro3YAyvz8=;
        b=Y29HwinQTIuB64MvX7s2Ko/bRf4ERwXspLHI2btFcQB9YZUusXireWKZ7dL3sWPHwE
         tzQoyPXp2qthFgT11OBbPHpuW5B8MDYS1bYyr/Kx15YNxEjRjCY3/8y+JcsrFcJTqefx
         GiUKGtBzt4QCPiE1S7XYk9bbAlNS0wdEM8MsC+HNMz/evdCQkBN6bkxkcatn7XaIyGa6
         7KZy2Rwgs+sRGRMTW1NnMhE18AokxV6MW902vMtwutMQ8rX43mg+dhW+fb+xubfZB0qd
         JdfkUwvS4GDHPSRCd6+AorRZkBC9I+ybBnnXtGRqxMAoJiJ0CFJGLVE+PtnCjxskcVWV
         QWgQ==
X-Gm-Message-State: AOJu0YxtPOANx+sApQOYDlwi4ozygwN+j9VioaKqSJPwf+GXugLwluN5
	KylKgiI3NQ2msB/yGffT+YzifJ+R+tQfgNtva+EgrHv0vKRwWjILyjGbdA1uCtl8QvvPtAKa6wL
	vs0Eb7dnxgMe6qXO62e5ZIAMp6baXc8c=
X-Gm-Gg: AZuq6aLJPekDLJ3tNc0ytxrAV2p3xnenb0z/YSyqc7dS0cMSTH/RTVEOsZgVpin7Zuy
	/P+jmCopXkBK0MBG1wbLgS2C6WruyYl37PmnYLT7ZHQ5ZHsT37rDO7VTtDP7Dk7pEv9WEsMKcj2
	lis6qZbTdcCZJS7sTDFjnDbcJS4iTKi4oalRCq5a5dPWA/v5b69WmEa1O88r8M6hwecvQTl/eSG
	jm7o1Ja1uaK102p0cV7y3kYKLeH+b2aSabQGZXt8oHRApFGZBnnUIFmtj5Fpr7I180SdrQW4Xs6
	trAUfPLo9wD0JvhR0+Vql97vdtMNmW6dA6vDflJoN3NIuZI7p33ww3ep8X1G+kQh8lDpop3SyDY
	Xxvl/vGJDHw==
X-Received: by 2002:a05:6122:469b:b0:55b:1a1b:3273 with SMTP id
 71dfb90a1353d-568e47abec3mr2195110e0c.6.1771797374061; Sun, 22 Feb 2026
 13:56:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
Date: Sun, 22 Feb 2026 21:55:54 +0000
X-Gm-Features: AaiRm50d7jLgPyD4kdVKiyrm9CHXFWwo9PDyCMT5qvyZh7PMRFS6zqm3NMkVBvk
Message-ID: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
Subject: [REGRESSION] Display freeze on VT switch back to X11 since v6.16
To: stable@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

# OVERVIEW

Since kernel v6.16.1, switching from an X11 session to a text VT and back
freezes the display on a ThinkPad P15 Gen 2. The system remains responsive
over SSH; only the display is frozen. Bisecting identified commit
d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
ioctls") as the trigger. Reverting the logic change in that commit
fixes VT switching
on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution. Wayla=
nd
compositors (e.g., river and sway) are not affected.

Last good:  v6.15.9
First bad:  v6.16.1
Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the
camera for some ioctls

## Hardware:   Lenovo ThinkPad P15 Gen 2i (20YQ0031US)
CPU:        Intel Core i7-11800H (Tiger Lake-H)
iGPU:        Intel UHD Graphics (TGL GT1)
dGPU:       NVIDIA T1200 (not involved in eDP output; driver: nvidia-open)
Display:    15.6" 1920x1080 eDP, 10 bpc capable (EDID 1.4)
Webcam:     Integrated Camera on PCH xHCI (Bus 003 Port 004)
Firmware:   LENOVO N37ET61W (1.97)
OS:         Arch Linux, Nix home-manager, X11 + xmonad, no display manager

## Symptoms and reproduction steps:
1. Boot, start X11 on tty1 (startx).
2. Switch to tty2 (Ctrl+Alt+F2): works.
3. Switch back to tty1 (Ctrl+Alt+F1): display freezes.
   - Frozen on the last frame shown before switching away.
   - System is fully responsive over SSH.
   - Other VTs switch normally between each other as long as X11 is
not active on them.
   - Killing X does not recover the display. A reboot is required.

# DEBUG ANALYSIS

On v6.16.1, the VT switch back to X triggers a full modeset due to pipe
configuration mismatches detected by intel_pipe_config_compare:

[drm:intel_pipe_config_compare] fastset requirement not met in pipe_bpp
  (expected 30, found 24)
[drm:intel_pipe_config_compare] fastset requirement not met in dp_m_n
  (expected link 269484/524288, found link 336855/524288)
[drm:intel_pipe_config_compare] fastset requirement not met in dpll_hw_stat=
e
  (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)
[drm:intel_pipe_config_compare] fastset requirement not met in port_clock
  (expected 270000, found 216000)
[drm:intel_atomic_check] forcing full modeset

On v6.15.9, the same VT switch shows no such messages.
no pipe_config_compare runs, no modeset, no freeze.

# BISECT AND VERIFICATION

The bisect converged on d1b618e7954802fe in the uvcvideo driver. This
commit adds a switch statement to uvc_v4l2_unlocked_ioctl that allows
certain V4L2 IOCTLS to call video_ioctl2 directly without first calling
uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls called uvc_pm_get
before video_ioctl2.

## VT switching verification across kernel versions:

  v6.12.74 arch pkg:   WORKS
  v6.15.9 arch pkg:    WORKS
  v6.15.9 from source: WORKS
  v6.16.1 with d1b618e reverted:     WORKS
  v6.17.9 with PM wrapping restored: WORKS
  v6.18.9 with PM wrapping restored: WORKS

  v6.16.1 from source:  FREEZES
  v6.16.1 arch pkg:     FREEZES
  v6.17.9 arch pkg:     FREEZES
  v6.18.9 from source:  FREEZES
  v6.18.9 arch pkg:     FREEZES

## Things that do not eliminate the freeze

  - module_blacklist=3Duvcvideo on boot
  - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)
  - i915.enable_psr=3D0
  - Bypassing intel_vrr_transcoder_enable/disable (no-op)
  - xrandr --output eDP-1 --set "max bpc" 10
  - Xorg config FBDepth 30 (No effect on pipe_bpp)

## Workaround patch

Reverting the optimization from d1b618e to restore the unconditional
uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v=
4l2.c
index 9e4a251eca88..15057b47ec4f 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct file *fi=
le,
  unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);
  int ret;

- /* The following IOCTLs need to turn on the camera. */
- switch (converted_cmd) {
- case UVCIOC_CTRL_MAP:
- case UVCIOC_CTRL_QUERY:
- case VIDIOC_G_CTRL:
- case VIDIOC_G_EXT_CTRLS:
- case VIDIOC_G_INPUT:
- case VIDIOC_QUERYCTRL:
- case VIDIOC_QUERYMENU:
- case VIDIOC_QUERY_EXT_CTRL:
- case VIDIOC_S_CTRL:
- case VIDIOC_S_EXT_CTRLS:
- case VIDIOC_S_FMT:
- case VIDIOC_S_INPUT:
- case VIDIOC_S_PARM:
- case VIDIOC_TRY_EXT_CTRLS:
- case VIDIOC_TRY_FMT:
- ret =3D uvc_pm_get(handle->stream->dev);
- if (ret)
- return ret;
- ret =3D video_ioctl2(file, cmd, arg);
- uvc_pm_put(handle->stream->dev);
+ ret =3D uvc_pm_get(handle->stream->dev);
+ if (ret)
  return ret;
- }
-
- /* The other IOCTLs can run with the camera off. */
- return video_ioctl2(file, cmd, arg);
+ ret =3D video_ioctl2(file, cmd, arg);
+ uvc_pm_put(handle->stream->dev);
+ return ret;
 }

 const struct v4l2_ioctl_ops uvc_ioctl_ops =3D {

Andr=C3=A9s
