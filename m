Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4403F23B5
	for <regressions@lists.linux.dev>; Sun, 27 Sep 2026 13:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790515801; cv=pass; b=ipttAsaoAjisr0ZSOXj75ziFYzwf6KDa6Q03MVQxQOx7uZzEXug7Uf2Ga5XVDhk8iVkxSQRYCG8BqvIFy2CEQbYj+gVZOFA7G8VoVcEvJczgoon5eurI6+QQ+iPpUtDGne7OrcHXd+iy7sZBNakuQYORJgPeglIvBnVjcW/6pRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790515801; c=relaxed/simple;
	bh=lkIUIKBr9//KP17Abm9XBf3FAV/tUC2s0b7CDBQ6VmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F5t+lYnSNBbrWUFJzmko/4s8egReYS8UBwTMBWD30Wad2kYBy0VcIBnAOumm7QT/jyvGhph/cf5F2svBU2Ewt62MtyfI09SerKg0b/QUof515ZePY8UNSgHF9ms/xODr3kgRufnW3K6cg7LVgip9olA5bhaP6iMhIc3aNv+nlME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cH6D5emP; arc=pass smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cH6D5emP"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-147be78cc56so23914c88.1
        for <regressions@lists.linux.dev>; Sun, 27 Sep 2026 06:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790515798; cv=none;
        d=google.com; s=arc-20260327;
        b=pk7crdJyXRRk7b+DXmNhyzZtsG5ze/0GzwfHiz+N6WZJox/8qx7Ie4MWC7eJYeKmoN
         sWzSfuHlTOqwJfmP4kykRKvHbRz3MGRlttT1Wnh2a6qBc0Nc6rvF4pnAVDezeybMPVvZ
         TLGFkiCBPuI8T5nJ8Z6XbdzPkheZXbGqc32MyUVk7YuyEu88kvZs2M2rc1jh45eC8STw
         IvIw0Ay/JfKXKvnUZnEjHtWJcJpe79BCCiZwRD4E1THQZbt0lvIJiwpPez4TTMeJVJjL
         6xqY24sjWy7Mi+ahYSfobZqyAqse3VAwkuXeMTanTe5/pNZwdThOqd0Iaf2XKJsVVUzS
         NPKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JjWx7CdMGt/+JDfl7KX1wEPjdEp46bufMD+qtwVQ9jw=;
        fh=OU4ECyotw2sWhahMU+WEmnnmH5q65WfPudm2SgylBLI=;
        b=GcxqxAT5zSYqnXjufzLhsgk4kxW41EZKMSt8znpjuX1evkQNbEwLnP0FedWJ2xRKv1
         TQ9IhGm86V2+NCAkqoJHt/+1/SdC7gkdocpbbxY1iQCW0MAWjjhNr4xgza9B3Tf2iqmC
         ADDPPMYCWZaDmdkDN5Hq65j2v6kxHO05RgsGc/lt15cTiiGNS0Y5YIeutOkUVd8Q/R8L
         h4kYeR3DSy0Kj9VofUAMuUvw2zaup4utNE7opqsQyB5LKPt2poCbHah5y9/cqRjKfk+C
         RzgG07ygRSe/69jlVZsU5U6GsvfDQg16XlkZsuWEBNmZ5zGNW73ifkUBurKkN2DywPh1
         pPbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790515798; x=1791120598; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JjWx7CdMGt/+JDfl7KX1wEPjdEp46bufMD+qtwVQ9jw=;
        b=cH6D5emP2aTeDjCmdxHbs+u5+TpTbuMt/ucZt+EIXmyO/RZLxCUwVThgCm1K6RDed2
         Lh1YGy63DkhhAwgTbK+zVO77/l9HWCp3yqgne/0kKvNWqGpcwcrE179B1m2/QBYsaKG4
         sryTV9DKts3qho2j07go52sGsKy2PuWy7/u3EK9S+QxZ+zryvccUPik6EupKixwbbDEV
         dh4gGHgVgVqkRFNwtF7F4GNKo1hoZQyXhwGR53rWwh4bnHZFKNxqyrGfQrOWdQBkeBYR
         HppMrLKF1Yrnp2SHtvULg8JZHen1L7U2+2GNAGmL2F+898VWZ+auz296uaWd2lIgrHdv
         Ih5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790515798; x=1791120598;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjWx7CdMGt/+JDfl7KX1wEPjdEp46bufMD+qtwVQ9jw=;
        b=zEPIV6ltXc71S5+aoy7fi99YenAgq/GQII/U05BbiaNVPHs2TpTERc2ccLCIsXcSjl
         ZXrfwp3SJxrH3EumD6ZLRA02HJoO2yljcB22ANr3v27azauCyO0sVhJCKPNvkqfQ/XLQ
         kYDHVOwZgkagg+VS5vynEaYgZreNZMx1496aRInv1pnxIEfwW3JhUrXHieLZsYERUjr0
         t3ghuVbfNTo24QFXpQKZiitjc+g5YFFLgk6v05c1SNFazMSFzMVnHp17vu5UzrKZ947S
         YNXFsyQHNiBB2ShVimUDOkY3DAAFT/7ll0DRhSrjhSQh3K8m3JoQi27Ars0RuEYGhlna
         hCEA==
X-Forwarded-Encrypted: i=1; AKwUvBwNbeFt3VSMxDmPo7+JhZnLj898iUFi6RJ8vxgQnQB8jxitWORa1u4Vw/0sOiheJlA2dWN6PaYKF2cMVw==@lists.linux.dev
X-Gm-Message-State: AFuF++ljFFpr539BGKTHYxYRYkpOQSPpRk19jvIMaBL6hxR+2Zx7Ae0E
	5dR4MXLvSa38wVn4xJR0gAObTHMwAL0Kjys2TN1ss44dlClVFf7636wpzRJsETFXrkoK5jsrdjX
	rCB4102SmOjBX/qcc72ftcI+Df39k4jiD+g==
X-Gm-Gg: AYBFou018CaYEJT8DaqOqHs5Zix2wq8SlOnrbt1O/WrB4oYupu8cPs1377SwS00YL4r
	+NKckylFvyn5/qX9jjjiUgUF8RYzUnv/LDs6aS4K7wcO+1N62qpKOqf5D8f9u/ROCD/vjOV4LAp
	w7absgph2WGuvnQdNN4wztwV274PTLZquFhcJbvQW4rQ6B2xXWDYhcnObtw5Ov7SWUKw7s+AEpr
	H0s5zgt4XlVttKKE2vmxcI3LbP/qOv+IPusrfit0thYtlpOkGRjPYGcxUGHmoUJoWltRCpCRZMZ
	JiDvargExpoEzMk/5iUPgJAU2xrKdyOikdVKFJ4QK/M3GN3B+dCaKUMgHoHB4c0AFEzEBC3Kxk3
	nCpr5VmlDkRRU3BGmWSBg9V1xpIrGfmfLMQLMzQPCcw==
X-Received: by 2002:a05:7022:29c:20b0:12d:c389:ae54 with SMTP id
 a92af1059eb24-146cfdd1a65mr10144867c88.2.1790515798339; Sun, 27 Sep 2026
 06:29:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <179039514312.597384.1659548947123427650@kernelci.org> <8ad00f0f-d924-4b19-986c-8c17dcdade86@leemhuis.info>
In-Reply-To: <8ad00f0f-d924-4b19-986c-8c17dcdade86@leemhuis.info>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sun, 27 Sep 2026 09:29:46 -0400
X-Gm-Features: AclHuK-3xaAgJQ-_J7Ya8xlZeXYTi28sJqJn3vWlASVO1_3rsBfjl4g86XVoWRU
Message-ID: <CADnq5_O7R096UP9mF5RvGSzT+c2p2v2Dm8M243CLxXa=VZvRwQ@mail.gmail.com>
Subject: Re: [REGRESSION] mainline/master: (build)stack frame size (3096)
 exceeds limit (3072) in 'dml_core_mode_prog...
To: Thorsten Leemhuis <regressions@leemhuis.info>, "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>, 
	Alex Hung <alex.hung@amd.com>
Cc: kernelci@lists.linux.dev, kernelci-results@groups.io, 
	regressions@lists.linux.dev, broonie@kernel.org, 
	Alex Deucher <alexander.deucher@amd.com>, DRI <dri-devel@lists.freedesktop.org>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 6:37=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 9/26/26 05:59, KernelCI bot wrote:
> > New build issue found on mainline/master:
> >
> > ---
> > stack frame size (3096) exceeds limit (3072) in 'dml_core_mode_programm=
ing' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display=
/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.o (drivers/gpu/drm/amd/=
amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c) [lo=
gspec:kbuild,kbuild.compiler.error]
> > ---
> >
> > Log excerpt:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > /tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/sr=
c/dml2_core/dml2_core_dcn4_calcs.c:10513:13: error: stack frame size (3096)=
 exceeds limit (3072) in 'dml_core_mode_programming' [-Werror,-Wframe-large=
r-than]
> >  10513 | static bool dml_core_mode_programming(struct dml2_core_calcs_m=
ode_programming_ex *in_out_params)
> >        |             ^
> > 1 error generated.
>
> Hmmm, there are known "stack frame size [...] exceeds limit" problems in
> -next that should soon be fixed there, see:
> https://lore.kernel.org/all/CADnq5_MFMriR-b3eX0mTZShPDgUBgwoObgumEjJ9cJqd=
mDM6xQ@mail.gmail.com/
>
> But this error is new -- and happens in mainline. Wondering if this is
> caused by a fix for those problems.

+ Leo, Alex

Looks like some combination of compiler and/or config options explodes
the stack even further than the recent changes handled.

Alex

>
> CCing Alex and Christian in case this is really something new they want
> to know about.
>
> Ciao, Thorsten
>
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >
> > When fixing this issue, please attribute this report according to the
> > patch submission rules:
> >
> > Reported-by: kernelci.org bot <bot@kernelci.org>
> > Link: https://lore.kernel.org/all/179039514312.597384.16595489471234276=
50@kernelci.org/
> >
> > For complete logs and details about the environment used, see the issue
> > on the KernelCI dashboard:
> >
> > - dashboard: https://d.kernelci.org/i/maestro:24dc0670f5eb776888969170a=
199e08b7f23f99b
> > - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git
> > - commit HEAD:  6812ce4e4379ffc99c52401ec28f0d7ffbc36206
> >
> > # Builds where the incident occurred:
> >
> > ## x86_64_defconfig+allmodconfig on (x86_64):
> > - compiler: clang-21
> > - config: None
> > - dashboard: https://d.kernelci.org/build/maestro:6ab70c1f5ec73975aade9=
d6e
> >
> > #regzbot introduced: f14572c203d57492e1d4e5d7851a3b143e083b82..6812ce4e=
4379ffc99c52401ec28f0d7ffbc36206
> > #regzbot link: https://d.kernelci.org/i/maestro:24dc0670f5eb77688896917=
0a199e08b7f23f99b
> >
> > #kernelci issue maestro:24dc0670f5eb776888969170a199e08b7f23f99b
> >
> > --
> > This is an experimental report format. Please send feedback in!
> > Talk to us at kernelci@lists.linux.dev
> >
> > Made with love by the KernelCI team - https://kernelci.org
>
