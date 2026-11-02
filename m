Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628598;
	b=xOp7ry028tncv7zcquVV5D9sb3tGsMFrpLBfoDdnaChUTC4VnVy9yu7MF942WHu80vYn
	 dmdmHDWeeJ0URjxaUnNX1niLdWXGaBZHVZW0GfJvsS7It3tzPq7USeiKBgtChtkhmQNUW
	 I8F7J+LZhPN8STS9mdTbXCvDldpfY61O//e+B20GKhPVfj5BWVS65EgJgMYdiCWgSKZXh
	 LURUk2yR/HZqux0HNOXFyXZS7vUGDgRW83hXcgKGOII+fIofcJ/pOshnVf1qqfpDYmuyi
	 Xqt+n4NlqAzzdrWe07d+9oCRijQkx9ydGbsxeDjQui/znD3yR1O+zOMg+s0UP4HrtNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BA4eR/Y18lLoJIgYyk0kRPwZOmosI6/4taftCvPvg6U=;
	b=PqG7cNhMMCW1WbF43sRHjP/gvfkXPRly2ggAiV5TXYMD4H+ZvO0fWiQF1+P9NKNQ4wjQ
	 pjfORpJMJjIvp4K7rM6xJpOuQmy2LsIkUvDoQ+TuXuYFGMKRIfXcF15wmA+TMjYdh3sZo
	 OZiz1Or6JPBBoRQ2AWJQ6dmBl36xKg7AbsvspoH6BDVaU/LuxeUIVPGXijPa+62QAU7aA
	 C8BeVEeh4uUQf1Qsa7SMX43JacrsPGkPhBnDZgkwKGv7ekABgzGPgJer0pbYg1FjAWccA
	 tE0iFnBvSFC54aX0zVVpq7MM8ycvA28Q5PDEwTK2ZT+Cq24aR+y7pOYSRSSInkoY4NA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WloyQcYb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E872C606A324
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 14:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E872C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WloyQcYb
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-17e82de56ccso79978c88.1
        for <regressions@lists.linux.dev>; Mon, 02 Nov 2026 06:09:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793628597; cv=none;
        d=google.com; s=arc-20260327;
        b=UEKhfFeoyn5t0AziTYKFSutcCXVD5AAzA8rBPE7SSBZuI6boY4w+zNEzDUbQn5tVZB
         N5s00CIi2Q+hdYlHm0jKkL8Qw+pa+c8wMHIMUXEC9ZlBTDgasX77M1GZjokas1/I185q
         r9G/1RJnTrTYFFhnltgWTWme0gHu3XHDmj4tyhsY6O4P6IECThwN/FvH8SiSyR50PXNK
         BOhtETcjtrZMaTh3ZgqHYXl0HKVI8BtWbc8yhzK3h9XQyuvhKi8zMj9Kl0v1Hvs61Imr
         PODn9/r+R+RKqQwYjsltxEdZQ5mIPSdbx7jgLcEYJXC8l6AGMTuDUVQorumcUihYjVl8
         v+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BA4eR/Y18lLoJIgYyk0kRPwZOmosI6/4taftCvPvg6U=;
        fh=qa0GAprOTWAIdqB4W/M1Omudfn2Fo0cwJ9eaEkyUOqI=;
        b=KRBH186glAERvXeP4/VPI7geJx55cuXV69xKZjGEJxOYDWICWaxHYREx94PVJOsDiw
         OF9j9xq9E0Qc3jWAMNBqJB7dZHPi6LyHv1LLFaUytq5ee60KYBmN7PTxyzP9QQemkCdq
         u1j+hxwb0QCBaK8tdzZRxVFQg4c+r0dZm3Dwc3gf5BE7BSLgINyJSV/z5UKks9sF0h86
         WgxOZKAr0C580BtWF2l5VMjf2AmwoG35zmOBuVdVBzjeHmnlob8YNLorDKtDVbRD5rQb
         wjXEKOM+jkbTj0hHG1/aWVQuz3x/yg0gHrbSqMo5u/eICPlDwOTbG1u1M+cP3a6xq6Rx
         BcPQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793628597; x=1794233397; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BA4eR/Y18lLoJIgYyk0kRPwZOmosI6/4taftCvPvg6U=;
        b=WloyQcYbBq/q2+fEiIJ7bdmTH+SkxgDJeBCeOJaAsi4+P10089aTy4kstYazZyHMSG
         OSOrfUi1YJEvz0p+GM7KM6EGySfTv5e6hoemmU7H74+K7L7aYEu/MTHVyyoED+TbLvrI
         DLBBnMr/PKI5PxxUxmdVnxSczgKKOHkNLYuaBdiiOId3lG6ifsVm+HrUpnubD44FP6T7
         /u2V8yGcdQVx5QrTf42NOZT6eMuoTBY55I7xQHR8oTcO8CUPPPsqG0U8taplvW1t7Mqm
         AP865PU1MBXtUnP9r7ezCV+8KIO0n0OSXCfYRbnhWCI+RlgufSq/XMgcqwumG8D0gWfg
         +/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628597; x=1794233397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BA4eR/Y18lLoJIgYyk0kRPwZOmosI6/4taftCvPvg6U=;
        b=WyZhWX/D1C54ZEOLJazzDQ3DKN2k5tNC5AmTt66qhpd8zEJI99mZ5qCKSmZGd5MX0I
         pobAI3ZyBM14ZoazurVMgAW4Wr3ZrfZ2Lewjt51tpskbFeaGMmWVmC4lC0DRavVMece4
         vJ3M1mZVrBfGWbdfhlDx8e+I37Bmv2LY9r8zwV1K958GRJhyWwDYW8PN765ZqD+VDgzY
         1GtdfYMzIo22vGsHSY+C/cN1A0m0p7lcjhbn1ZW9lLfk98lj8g2On/tY5ju/05nk4E7f
         jeNNYcx8E17E5pieVf72B4f78GqovEE3pLYOYayGqDtY41UShb6uiAOc6pgfMJzgyLBe
         r3eA==
X-Forwarded-Encrypted: i=1; AKwUvBzWJ8K9gx85TfzE06pPxPPKxsrwIjMUIoyFagGBcY2Ll8TAp+t44MoIDNSZzUL+BAjukB7T/kiI+wrMAw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ6/ctEXBYBQNmc3QK07BTTo1oNE/qZdmeqp2mBewm5J7riPxlJ
	11To5A51Nw3sePonmu9usLw6Qo9SfJyBH3b7Y6BBytKp+Fm0zZf7Y59V8AffwYERMORre1BlAV8
	9TJwZDArbd3OKO79E7R8SH39rMlBBUOo=
X-Gm-Gg: AYBFou3HHyyIfyjhviAQLMkPPl6aCTk+WCZqN86zXfOHetoTq/+Z5Bk6tC+N0tXUk0N
	h5yzIlcVOg+adOilGtV2NfFU7czm+ExLcCpX8gDffiUyGAW2hel73++ZWX57Z9QRCSQW9FIoovB
	NGUJMGwB2Qq05nNwxuxNJyAvlgjSvOayBy0cNVUqmJapgPg+K7I/+A7+Bt0eI8l/7GKmY+6t7Av
	VxaRtzcHjATbU0bRW36FaQP7iTTvyJhf4TQybyzcywj/NDtJA/ZESGjHo39sIOnsE4YSRe8GsY/
	77IMRi5JFDMUaRMi5zyofaiPdpws0hal7CZGYdrM5YuVVTig+w6qvzrT1zPytw7WvxZxuqJgV8F
	xDvEQkygzHU5NSoSAuLInq58K4N7bH9eCWAOkET+j3tn1qqrNpgqq/iO9pQeIytETQNBiHJ63GN
	7nab9ITG0Sr3r46RLfjT0mV7U=
X-Received: by 2002:a05:7022:b053:20b0:144:fd17:3b21 with SMTP id
 a92af1059eb24-1ac500d67e6mr25688334c88.0.1793628596924; Mon, 02 Nov 2026
 06:09:56 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CACOV87VBmya0PKjni5xEYxUaEczk9X_UoUHXSR_HDS2kSJnM2g@mail.gmail.com>
In-Reply-To: <CACOV87VBmya0PKjni5xEYxUaEczk9X_UoUHXSR_HDS2kSJnM2g@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Nov 2026 09:09:44 -0500
X-Gm-Features: AclHuK_vRhBeW5Eh56Hb7eNcMb7wVqdQhlqpXQtPfp3uOOkJmrZWy5xmkaRSbEw
Message-ID: <CADnq5_MzmNYq0WA5HFaOp6E3WO82YqTT5opCgkAbvv=9Q8AQnw@mail.gmail.com>
Subject: Re: [REGRESSION] amdgpu: Navi 23 passthrough fails after ef5fcf2a6c32
To: Nathan Blomquist <nblomquist@gmail.com>, Guangshuo Li <lgs201920130244@gmail.com>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org, regressions@lists.linux.dev, 
	alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:16=E2=80=AFAM Nathan Blomquist <nblomquist@gmail.c=
om> wrote:
>
> Hi,
>
> I can reproduce a Navi 23 / RX 6600 (1002:73ff) passthrough failure on
> unmodified upstream Linux 7.2.10. It happens during the amdgpu-to-VFIO
> handoff, before any guest code runs.
>
> Revert/add-back tests on Proxmox kernels isolate ef5fcf2a6c32
> ("drm/amdgpu: fix autosuspend cleanup during removal") as the trigger.
> Removing its added call from -20 works; adding it to working -19 fails.
>
> Tracing shows amdgpu_device_baco_exit() returning -ENOTSUPP (-524)
> during runtime resume: the live BACO feature reports supported but
> not enabled. The exit sequence is skipped, and a later bus reset
> leaves both graphics and audio inaccessible.

Adding a few people.  I'm not quite sure I follow what's happening.
Can you attach your kernel logs to the bug report?

Thanks,

Alex

>
> The candidate below keeps the autosuspend cleanup and allows the exit
> based on the selected runtime mode. In two clean baseline/candidate
> build pairs on upstream 7.2.10, the baseline fails and the candidate
> restores reset recovery and guest graphics/audio initialization.
> Sustained rendering and repeated-reset stability are not yet tested.
>
> Is the selected runtime mode the right condition to use here?
>
> Full report:
> https://gitlab.freedesktop.org/drm/amd/-/work_items/6076
>
> #regzbot introduced: ef5fcf2a6c320676bf8be2dadac93d9023b468b7
>
> Candidate patch:
>
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -6412,8 +6412,16 @@
>  {
>         struct amdgpu_ras *ras =3D amdgpu_ras_get_context(adev);
>         int ret =3D 0;
> -
> -       if (!amdgpu_device_supports_baco(adev))
> +       bool runtime_baco =3D adev->in_runpm &&
> +               (adev->pm.rpm_mode =3D=3D AMDGPU_RUNPM_BACO ||
> +                adev->pm.rpm_mode =3D=3D AMDGPU_RUNPM_BAMACO);
> +
> +       /*
> +        * Runtime PM selected BACO while the device was active. Firmware=
 can
> +        * clear the live feature bit during D3, but the matching exit se=
quence
> +        * must still run to restore the runtime D3 policy.
> +        */
> +       if (!runtime_baco && !amdgpu_device_supports_baco(adev))
>                 return -ENOTSUPP;
>
>         ret =3D amdgpu_dpm_baco_exit(adev);
>
> Thanks,
> Nathan
