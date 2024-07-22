Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5E92D627
	for <regressions@lists.linux.dev>; Mon, 22 Jul 2024 21:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721684046; cv=none; b=UyPa0RbmEPj/ifekQY9eTCyX8VzVt0ij+hZhIKUvfUgOoqZ/U3kZzpNAQnX/STGUPZ/9+5wZGTHmKlZLo9fvk0A05b8WHVE8yHnFHT6d6isnCFVTUhndWVMxSGORFIprYFeKSE1zdwuiVi9A88iOEKQjifJM3tJiqa45UuKoBhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721684046; c=relaxed/simple;
	bh=UvFhT8jnjD7FIunoJUmd6gTkBR2anvzc0XrfNuTqsoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKZf+RxOfGG5+rftGthOiNwQiHbqWO/aJtxqSZo5I1lZb8V5kgppdjd1EOEw5w7NbI66QZJKQxdF/lO5NzF8Dv88YubXudnNa6qjnDaMMUTELJAFIVEdzbgp0dQc2ApSLCS0UHA/A/6J8XOJNerQKn2AZG+D5xbQnk44zImls5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGqUpYJS; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGqUpYJS"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2cb4b7fef4aso2763747a91.0
        for <regressions@lists.linux.dev>; Mon, 22 Jul 2024 14:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721684044; x=1722288844; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lz7eC/D5EN2MO/b1N+VJzo23wffYTBqRV9t9w8/j8yw=;
        b=mGqUpYJSu9Slp6YzeLGBtauEjmFZcnH500tuJ5q/qDp5Fg4dacaVSuUaX2S0SeO0Rs
         pF5O+JCZFdZsfrfv3Hsx5NFRkyMjp3DZbMT/TlXYt7AYjhi6ByFVqYRaS+tupGp9oALK
         wqRdIQAVJyNYDoR2agln6TDIF1h8+ZOD7EhkjTrzQZl5wcvTGFiYm5E0OYsA0+0gLyoA
         Q7bxeOKx3qPGauyrzxTjbRlHlf/otHdk6zvoCyMfS1A9MNxSjiQXP8If89u6rFa4Bpuk
         mI6eAjWwRj4SzQwjmaibrZAeFYFyo97FDRryltduVH/3LRO8pNcjjNnmnLHtRTyeQzjD
         +Y8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721684044; x=1722288844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lz7eC/D5EN2MO/b1N+VJzo23wffYTBqRV9t9w8/j8yw=;
        b=RdbgbTdB9Vx131aanPlLd5Th7NXspTPvb73UzYd2+l2liAPRQAQgeZ8LHORv5w1Snh
         Oo42EK5pnSOxMs1N3OMkbtI07N7Rml/H88ctK9KKHehlARNDClzpa1iCXQwCus/HohEI
         7duSJ6Q3Accpw5b+4E+bGX63QRDtYGlFJq4dowFJ9gTUQZ9jdXWStCzuqUPfLF+kyeDD
         8uDiuuQ6CB949x9Zb1r0LGImhvKYcaucMpsvGcA+Cv8RAy1WooH63HGFXLdmV1M2+wLK
         PP/1a9pJ3L8iotgQQwjx+at2rrkZEB3cupNhw5gRxLPwFxmovvlwBUaFDoFOmjoded3a
         Q4GA==
X-Forwarded-Encrypted: i=1; AJvYcCUWAZzt3BW9IIeJFZOWDEJAsasmBhXp2Q4zImp9sjufEErerfJSPIbjHACZdlfZFlobegNaKVOTubZikP4GVfTm+wIrGrR4GxmRGBs=
X-Gm-Message-State: AOJu0Ywz0P+l2oDFRueCWUw/f5O+dJ0l798ls33cETSGm7Youk6ZAuDE
	DqfoMsxIN08BnBVXPNG2FT2oL/LvmG7FX2KphN2YdToh7idJUfQPOKLich9IGA6s3HoHk8Dd1ku
	ui/9RGGkJ5g1vrLAAsPxe+F08NVE=
X-Google-Smtp-Source: AGHT+IHCu5c9EE/Wlr9s8CQAwkdMP+PqJ8V5BHoTwpWhrVrxKoLgY/TnlbaathYFILbfFj/YltBbCqdqJZuTyaLle1Q=
X-Received: by 2002:a17:90b:3e8a:b0:2cd:3445:f87e with SMTP id
 98e67ed59e1d1-2cd34460729mr6176252a91.2.1721684043513; Mon, 22 Jul 2024
 14:34:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsMmtqzBfUykT-JgyhZn-7ZXtftHL35znDdYuTnUOpGnoQ@mail.gmail.com>
 <1266c4af-a000-48c0-bd0d-79c2e918aea9@gmail.com>
In-Reply-To: <1266c4af-a000-48c0-bd0d-79c2e918aea9@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 Jul 2024 17:33:51 -0400
Message-ID: <CADnq5_O-hKQZoMxuX2=HiukiorxE=bFAJownQFkTbzNR2d411g@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - Since commit e356d321d024 in the
 kernel log appears the message "MES failed to respond to msg=MISC
 (WAIT_REG_MEM)" which were never seen before
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, mukul.joshi@amd.com, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 4:50=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> That's a known issue and we are already working on it.

Do either of these patches help?
https://patchwork.freedesktop.org/patch/605437/
https://patchwork.freedesktop.org/patch/605201/

Alex

>
> Regards,
> Christian.
>
> Am 20.07.24 um 19:08 schrieb Mikhail Gavrilov:
> > Hi,
> > I spotted "MES failed to respond to msg=3DMISC (WAIT_REG_MEM)" messages
> > in my kernel log since 6.10-rc5.
> > After this message, usually follow "[drm:amdgpu_mes_reg_write_reg_wait
> > [amdgpu]] *ERROR* failed to reg_write_reg_wait".
> >
> > [ 8972.590502] input: Noble FoKus Mystique (AVRCP) as
> > /devices/virtual/input/input21
> > [ 9964.748433] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748433] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748493] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748494] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748493] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748493] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748476] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748478] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748479] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748477] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748477] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748477] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748478] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748477] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748477] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748478] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748661] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748770] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9977.224893] Bluetooth: hci0: ACL packet for unknown connection handl=
e 3837
> > [ 9980.347061] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.347077] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349857] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349857] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349857] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349859] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349859] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349870] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349868] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349870] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349890] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349866] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349865] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349865] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349866] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349866] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349867] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349867] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349869] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349871] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349871] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349871] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [10037.250083] Bluetooth: hci0: ACL packet for unknown connection handl=
e 3837
> > [12054.238867] workqueue: gc_worker [nf_conntrack] hogged CPU for
> >> 10000us 1027 times, consider switching to WQ_UNBOUND
> > [12851.087896] fossilize_repla (45968) used greatest stack depth:
> > 17440 bytes left
> >
> > Unfortunately, it is not easily reproducible.
> > Usually it appears when I play several hours in the game "STAR WARS
> > Jedi: Survivor".
> > So it is why I bisected it so long.
> >
> > git bisect start
> > # status: waiting for both good and bad commits
> > # bad: [f2661062f16b2de5d7b6a5c42a9a5c96326b8454] Linux 6.10-rc5
> > git bisect bad f2661062f16b2de5d7b6a5c42a9a5c96326b8454
> > # good: [50736169ecc8387247fe6a00932852ce7b057083] Merge tag
> > 'for-6.10-rc4-tag' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
> > git bisect good 50736169ecc8387247fe6a00932852ce7b057083
> > # bad: [d4ba3313e84dfcdeb92a13434a2d02aad5e973e1] Merge tag
> > 'loongarch-fixes-6.10-2' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson
> > git bisect bad d4ba3313e84dfcdeb92a13434a2d02aad5e973e1
> > # good: [264efe488fd82cf3145a3dc625f394c61db99934] Merge tag
> > 'ovl-fixes-6.10-rc5' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/overlayfs/vfs
> > git bisect good 264efe488fd82cf3145a3dc625f394c61db99934
> > # bad: [35bb670d65fc0f80c62383ab4f2544cec85ac57a] Merge tag
> > 'scsi-fixes' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
> > git bisect bad 35bb670d65fc0f80c62383ab4f2544cec85ac57a
> > # good: [f0d576f840153392d04b2d52cf3adab8f62e8cb6] drm/amdgpu: fix
> > UBSAN warning in kv_dpm.c
> > git bisect good f0d576f840153392d04b2d52cf3adab8f62e8cb6
> > # bad: [07e06189c5ea7ffe897d12b546c918380d3bffb1] Merge tag
> > 'amd-drm-fixes-6.10-2024-06-19' of
> > https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
> > git bisect bad 07e06189c5ea7ffe897d12b546c918380d3bffb1
> > # bad: [ed5a4484f074aa2bfb1dad99ff3628ea8da4acdc] drm/amdgpu: init TA
> > fw for psp v14
> > git bisect bad ed5a4484f074aa2bfb1dad99ff3628ea8da4acdc
> > # bad: [e356d321d0240663a09b139fa3658ddbca163e27] drm/amdgpu: cleanup
> > MES11 command submission
> > git bisect bad e356d321d0240663a09b139fa3658ddbca163e27
> > # first bad commit: [e356d321d0240663a09b139fa3658ddbca163e27]
> > drm/amdgpu: cleanup MES11 command submission
> >
> > Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Date:   Fri May 31 10:56:00 2024 +0200
> >
> >      drm/amdgpu: cleanup MES11 command submission
> >
> >      The approach of having a separate WB slot for each submission does=
n't
> >      really work well and for example breaks GPU reset.
> >
> >      Use a status query packet for the fence update instead since those
> >      should always succeed we can use the fence of the original packet =
to
> >      signal the state of the operation.
> >
> >      While at it cleanup the coding style.
> >
> >      Fixes: eef016ba8986 ("drm/amdgpu/mes11: Use a separate fence per
> > transaction")
> >      Reviewed-by: Mukul Joshi <mukul.joshi@amd.com>
> >      Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >      Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > And I can confirm after reverting e356d321d024 I played the whole day,
> > and the "MES failed to respond" error message does not appear anymore.
> >
> > My hardware specs are: https://linux-hardware.org/?probe=3D78d8c680db
> >
> > Christian, can you look into it, please?
> >
>
