Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13F134CFB7
	for <regressions@lists.linux.dev>; Mon, 23 Feb 2026 08:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771834269; cv=none; b=hSkAJL9nXZTZRm3+zRLWWorur33lNpdP4ZHw6WA2Q2XXqSIIEB+mG3MjKSow7su6Y9gkAbxYvDcLQpLSn7xxLk0EatR7DPVP8v3Ws7JkFC9rQRgEjmfAtADqSX3FT9HeAufFVqhsxu2lpf2cuDmDEiN/mFKsZQX+6vwbuOrnBBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771834269; c=relaxed/simple;
	bh=QLIG/cvAGKHL/QsPZAk+8/0vWlzhWoHy3RyVHMRjPY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WotPkQC5NkbpQiJyovtL+TTiDFgY7BZQoQ1P9tZ8z9cXGgGe+zupLBijspPJ5pWqVvjQj2EBdKq7NyQjm9ac5dwGRtASPvypdtQSfdv6gZd9XBDVcJ13HPJa7Fwmg7TVRxk0FfbXC5h6okxRzWYnY1HQVyVv9XgO0MTKDz4cWZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mv8G0h7q; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mv8G0h7q"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65b9608a9adso6839015a12.3
        for <regressions@lists.linux.dev>; Mon, 23 Feb 2026 00:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771834265; x=1772439065; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPcLFGqvXQ/TrcZMbc9zEuLscnPpwUEKK1FNGlp3euE=;
        b=mv8G0h7q4fnSeLbjbwxI4/6/PnmMfJfbwmVCL4E+5EZJ4MZNqYxdQ6BoznUEV+VN09
         zkcqILxSGFiHdOrijUeZP7SB9fQrkgD73qRu6yLQuRWvAqtca7mFWOmxUwgJHVIoMwMN
         RtHNspsAqM1SX2/KGrb1RkDAzGrwZOqjoUCuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771834265; x=1772439065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fPcLFGqvXQ/TrcZMbc9zEuLscnPpwUEKK1FNGlp3euE=;
        b=PJECIwwdiLVWizJ9v8m8vOVZNRbtOpt5zaon2YbH8dqgUPx+wYytUD7IsyvSMISlQa
         pQL2Z4cl2PDwwzlCBjpjsjrKh3/Pvjc0h8t19R9CTDaAGoWvwzjo1Cgm37v93h2oZL2M
         VORlet9IGJS/FNziGPavWIwbOAuTxP4pU4WUCvrjyJkSg312tjUIBdSsG0axBwDUO8Rd
         9lj+s8W65yQwFDUWObo2egQwCPxrXv2JTaUKucoGksVCBKkIXXqliAV+il2lOHeCWr4U
         gODBh3k3NYZwDkrXITsdp33g6Nd9NuMJ3dlWS8p2Aijydnj1BrvDnLS4vhLo5epx7nds
         yxhg==
X-Forwarded-Encrypted: i=1; AJvYcCWc6Hk5fqAB0p5vFvmmjiB+f+/22kS6lPOP6B5sBijvL6K4Lem0NNmkO142BTIvE0dJac8GWEF4fV6HwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxre9ejwkZ3G1GM+IGQUNkVYayOyFl8O12MniVu4lbOkseRQ9Q9
	abhde3vXEQDqcqmTZKwgzayOtCGkNQVMoMzWnhXTH9rZlBr5JKUCXEcQ3fRwiRNFqrKmxSoqfP4
	AdpTXuQ==
X-Gm-Gg: AZuq6aKgBNZgU0mFiw5Mp/gAdTJrBKtcNQtZlSCWCGxsjMcGfZDHL8u8SrACDLQ1PJs
	TCMcoefPfG9kQsT9V8WXTNtjWu7S82reiKHPQhm53tUjabFmELBRAs6aGiWjK/imHPAlCdf0pPA
	uG8VhVM9qNcVhWQxK9RMhUbvcz1JICTp2fTYv4uRalXuETt/vePxR358XKL9zqFurgmw1pUP96Y
	tHsiyER6K+OSuSOZdpjB3kmu61gUJUTpD+F7ZjvAT4c//cAtgB5Ot25uYyfKAUwhTG5Pc5lNklQ
	2mNa+L8c0CGNu+NsT9HmZwlQYV3n4kYP+V4EEX3gcQ5UM7alLh2w4E3DKVEKODKTufGJHetbypg
	2ssvtumpp6MDmWOTp+Keg0h4ZJMZwPtsFtoITI4N4j2TIKo1ebWEGa4/JtmnOfdzvJ770bkeLYT
	peN+FxAYrRc0fwxcPFv990QiQrX1Mx252ivAgft0YrOqe2OnZc0SIVmsXnujtL
X-Received: by 2002:a05:6402:42ca:b0:650:883a:8896 with SMTP id 4fb4d7f45d1cf-65ea5116c9emr4393913a12.29.1771834264710;
        Mon, 23 Feb 2026 00:11:04 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eaba2d966sm2400049a12.23.2026.02.23.00.11.03
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 00:11:04 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so7020507a12.1
        for <regressions@lists.linux.dev>; Mon, 23 Feb 2026 00:11:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSrVpzSfodC21IsAlJaDQ+J5E07X/8a24H9YZMQfpAKSFTGfUGZFMXUhUkEiJwcuYVKeL2ddFw5ko9rw==@lists.linux.dev
X-Received: by 2002:a17:907:94cc:b0:b87:12d2:fa1a with SMTP id
 a640c23a62f3a-b908191f1d6mr445251466b.12.1771834262096; Mon, 23 Feb 2026
 00:11:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
In-Reply-To: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Feb 2026 09:10:49 +0100
X-Gmail-Original-Message-ID: <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
X-Gm-Features: AaiRm53F0LIMOe6xezXE30KkDM_p2uBY1AB8eOErFcvfTTb2PhOgsWveImx1C0M
Message-ID: <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
Subject: Re: [REGRESSION] Display freeze on VT switch back to X11 since v6.16
To: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
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

Hi Andr=C3=A9s

Thanks for doing the bisecting

On Sun, 22 Feb 2026 at 22:56, Andr=C3=A9s P=C3=A9rez <andres.f.perez@gmail.=
com> wrote:
>
> # OVERVIEW
>
> Since kernel v6.16.1, switching from an X11 session to a text VT and back
> freezes the display on a ThinkPad P15 Gen 2. The system remains responsiv=
e
> over SSH; only the display is frozen. Bisecting identified commit
> d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
> ioctls") as the trigger. Reverting the logic change in that commit
> fixes VT switching
> on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution. Way=
land
> compositors (e.g., river and sway) are not affected.
>
> Last good:  v6.15.9
> First bad:  v6.16.1
> Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the
> camera for some ioctls
>
> ## Hardware:   Lenovo ThinkPad P15 Gen 2i (20YQ0031US)
> CPU:        Intel Core i7-11800H (Tiger Lake-H)
> iGPU:        Intel UHD Graphics (TGL GT1)
> dGPU:       NVIDIA T1200 (not involved in eDP output; driver: nvidia-open=
)
> Display:    15.6" 1920x1080 eDP, 10 bpc capable (EDID 1.4)
> Webcam:     Integrated Camera on PCH xHCI (Bus 003 Port 004)
> Firmware:   LENOVO N37ET61W (1.97)
> OS:         Arch Linux, Nix home-manager, X11 + xmonad, no display manage=
r
>
> ## Symptoms and reproduction steps:
> 1. Boot, start X11 on tty1 (startx).
> 2. Switch to tty2 (Ctrl+Alt+F2): works.
> 3. Switch back to tty1 (Ctrl+Alt+F1): display freezes.
>    - Frozen on the last frame shown before switching away.
>    - System is fully responsive over SSH.
>    - Other VTs switch normally between each other as long as X11 is
> not active on them.
>    - Killing X does not recover the display. A reboot is required.
>
> # DEBUG ANALYSIS
>
> On v6.16.1, the VT switch back to X triggers a full modeset due to pipe
> configuration mismatches detected by intel_pipe_config_compare:
>
> [drm:intel_pipe_config_compare] fastset requirement not met in pipe_bpp
>   (expected 30, found 24)
> [drm:intel_pipe_config_compare] fastset requirement not met in dp_m_n
>   (expected link 269484/524288, found link 336855/524288)
> [drm:intel_pipe_config_compare] fastset requirement not met in dpll_hw_st=
ate
>   (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)
> [drm:intel_pipe_config_compare] fastset requirement not met in port_clock
>   (expected 270000, found 216000)
> [drm:intel_atomic_check] forcing full modeset
>
> On v6.15.9, the same VT switch shows no such messages.
> no pipe_config_compare runs, no modeset, no freeze.
>
> # BISECT AND VERIFICATION
>
> The bisect converged on d1b618e7954802fe in the uvcvideo driver. This
> commit adds a switch statement to uvc_v4l2_unlocked_ioctl that allows
> certain V4L2 IOCTLS to call video_ioctl2 directly without first calling
> uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls called uvc_pm_get
> before video_ioctl2.
>
> ## VT switching verification across kernel versions:
>
>   v6.12.74 arch pkg:   WORKS
>   v6.15.9 arch pkg:    WORKS
>   v6.15.9 from source: WORKS
>   v6.16.1 with d1b618e reverted:     WORKS
>   v6.17.9 with PM wrapping restored: WORKS
>   v6.18.9 with PM wrapping restored: WORKS
>
>   v6.16.1 from source:  FREEZES
>   v6.16.1 arch pkg:     FREEZES
>   v6.17.9 arch pkg:     FREEZES
>   v6.18.9 from source:  FREEZES
>   v6.18.9 arch pkg:     FREEZES
>
> ## Things that do not eliminate the freeze
>
>   - module_blacklist=3Duvcvideo on boot
>   - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)

This is puzzling me a bit... You are saying that if you do not build
the uvc driver, the freeze is still happening?

Am I understanding this correctly?

>   - i915.enable_psr=3D0
>   - Bypassing intel_vrr_transcoder_enable/disable (no-op)
>   - xrandr --output eDP-1 --set "max bpc" 10
>   - Xorg config FBDepth 30 (No effect on pipe_bpp)
>
> ## Workaround patch
>
> Reverting the optimization from d1b618e to restore the unconditional
> uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc=
_v4l2.c
> index 9e4a251eca88..15057b47ec4f 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct file *=
file,
>   unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);
>   int ret;
>
> - /* The following IOCTLs need to turn on the camera. */
> - switch (converted_cmd) {
> - case UVCIOC_CTRL_MAP:
> - case UVCIOC_CTRL_QUERY:
> - case VIDIOC_G_CTRL:
> - case VIDIOC_G_EXT_CTRLS:
> - case VIDIOC_G_INPUT:
> - case VIDIOC_QUERYCTRL:
> - case VIDIOC_QUERYMENU:
> - case VIDIOC_QUERY_EXT_CTRL:
> - case VIDIOC_S_CTRL:
> - case VIDIOC_S_EXT_CTRLS:
> - case VIDIOC_S_FMT:
> - case VIDIOC_S_INPUT:
> - case VIDIOC_S_PARM:
> - case VIDIOC_TRY_EXT_CTRLS:
> - case VIDIOC_TRY_FMT:
> - ret =3D uvc_pm_get(handle->stream->dev);
> - if (ret)
> - return ret;
> - ret =3D video_ioctl2(file, cmd, arg);
> - uvc_pm_put(handle->stream->dev);
> + ret =3D uvc_pm_get(handle->stream->dev);
> + if (ret)
>   return ret;
> - }
> -
> - /* The other IOCTLs can run with the camera off. */
> - return video_ioctl2(file, cmd, arg);
> + ret =3D video_ioctl2(file, cmd, arg);
> + uvc_pm_put(handle->stream->dev);
> + return ret;
>  }
>
>  const struct v4l2_ioctl_ops uvc_ioctl_ops =3D {
>
> Andr=C3=A9s
>


--=20
Ricardo Ribalda
