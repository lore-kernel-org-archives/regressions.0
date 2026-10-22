Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792656556;
	b=e1lrm/fvpZDtE+k/NBmTQDde4OnSDDge0lNlmK2y51QWvYtHr0E++qmz23MWIqYBxeJl
	 b9KD5ZdZOvZ1KxafpDkpkqEWXZ0zQ0DwbwHct5ZW//VGjqyIta+2X5D0g6qlngvZdikDz
	 DPO3VFIIoiHDPxVIiyuSofFpXngDZ3sTbnwiam2z70FF3e41LjJ65epG3kCeDs9JgeVla
	 V9vY5PgQ/Ya6dZLlFFovgGJYFQh7AKjJG3SBEbm2OCiP3QkzsO9km1R4BjEf0Qq/WZLp+
	 QS37BCJz/M8TPojXi7NdwnwMsuSwJ0AyygW3Z+/7Js8y7lcR372ykLH/i1U9zVL/fHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xQKsyW+wOzCAT9wP2NPBkWImj5fvxFpGVwFKrnGegPo=;
	b=lQC4Pjwm93tdNxAwRvfjvvAmB54uEmS+qFAYadQu+rj/p19bNcTsVPvK9CQ91iL3jCRA
	 pSQZD88y2dkKlaMzeOUMn8QAWK/GFCBsOnngnklR2bdEySv6Yd5krMdBRzgwEyzK3fdya
	 5T1i5RHoe9OQOLvbnfT2Aub2JSMGTpc/TuJWbXyzJBx/AcNcMVTT3VjWQ7iNEMQsMffY3
	 K3NCoQp13ANHMMw5RCmwtwFwWBuJJwYjSybtzVYq9/xhuks6RmOHf0+VUkXmD/mzC3tdP
	 75+EY1ANAa/lI7HgON6nHP3DpT1Xwk6yHqr7XbQh0hSoC9ux+pizntvwjaru0zCaepQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dAj4o3tY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388EE606A322
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 08:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 388EE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dAj4o3tY
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8aea7b7ca0cso13648677b3.2
        for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 01:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792656550; cv=none;
        d=google.com; s=arc-20260327;
        b=iagNiRtslavzTf113ki73xgQusZMiU8W0opE+YkT++7N3iLg2nziLkOedfVKazN2cV
         hBlnhef7crNpY7J176HlsrVKVlUpMnaraRgvU6upgT4GZ37MjSoAo774u30QIvZfUnaQ
         tSdrLYEV/BOJJpLJVE/NnJPVm4wS2JE+MCk8oGMYlAIkDxa+UfZ5ZcjirM2IUqkUfYV2
         fu3MuirCnrtUk8QmlbBbrzt/KJpIl0cJ4OAePxRDVEI5rxKlSMGtCiQWjH5Qx+uB+KQ6
         ZeuGgvDoPi3IWSSSS0ve+I8aiC8Ch80CUKsAICMmTdBgXTiiUQTwUYqhWl5lqYuy60IR
         DCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xQKsyW+wOzCAT9wP2NPBkWImj5fvxFpGVwFKrnGegPo=;
        fh=1gnIdXqNRDuKsYbYfylyti8pikf+YWDWpq7G+xBdVuE=;
        b=OxW9sAFqOYFqkI7ARf6lxPtJlfs0gUy4E5RjprKSDqMGkCbB0ttmhv2YVKk+VGuOGQ
         8Yq9DHsjOR20GCK80IFQUtPXDOgD75dZnbspgC80vy42YQDUGuOQc7G2Bmetrh4JZ0bz
         yRASEiSv30WtsND4xR98RQJ3D8jTuQ7+XxC192HqvgjiCpRFjZZHXEn0E7V9kgipTqHR
         6+H5SaXRcTRqJ0DjLCAPr+l8O5IinG1KGsF9WDg/cRXgKoWoX8Fm7hcgRh28YKxezPsh
         DQ6sRVQYHiMpL6Sk2akVxx1uBWm4AP8fEpv7r1MHmCuPVblvxd7q2LNkhstsGZ6vxVyn
         QKWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792656550; x=1793261350; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQKsyW+wOzCAT9wP2NPBkWImj5fvxFpGVwFKrnGegPo=;
        b=dAj4o3tYuel/z43Zw/Ey6DN5dKoSGVn8lFI9g3UDof5JGDk1Dho3dgjtQlE3E8F2i2
         dPhgn57+kz2pPlQOjcfce+BpYymAPgQO4fBF1fSOXq3JpxOdGs9CkNBP8xz4FEkneIjN
         TCXCJB4nNFxawajGCMe4WWkVkUrZDw5+wmTifNbLkKE7D+Sst0cQ3YLwsO6bhE3y2Wer
         dmnf0KMXtdffH4jCLJ5Ty5veCfxWrQg2/IN9clmkMm/rajLIkPI1xO28axns22+OU7oK
         QcqMBWrLWDVVrDDS5bvPgw5Hk1NDu7xZNs25OCv10BgZPUTOt+SM4N4sjDlr1T/cVTmX
         h8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656550; x=1793261350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQKsyW+wOzCAT9wP2NPBkWImj5fvxFpGVwFKrnGegPo=;
        b=OC/9hBvCW+DtP2P06wX9vdHcsYuh/QfbvTt1UXI1igygpucE4ESR55A2izZJtwBCD0
         UhYqTegERjiktpcDKvn1caq0gsiRL7yVOiLzX/6I4nAPFWifXWaSoZQyu5r/oO0Q7tOz
         zWtCI1z96GThUPJ7BUWpe/3DMvGYWy7Wt/JCvGbkPN2XO0/FFl7Jg2SNAQuKRk47P7o/
         cUbV2OEGFxMq7VMj2vhvGuFfL4cstMh5vefhvIHps/NsdrdKEHG1Lb1O8u1nU5x3sFfF
         jdAv7F5sQ1kDnLV3ABTqDT/nrslSM11tcy5wZ6ATnyPCa+yl97swtqxJZz1fRY1/TnYI
         nm0w==
X-Forwarded-Encrypted: i=1; AKwUvBw+qA3nSGtfzCCBt1bf+tKTblGT0+MiClQzNaKolaOoBpJxRaREiHx9cpETzznwhbPEZgWECUasjlB1Rg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIrOULCzd1C+a/TgX13bjtbXQOJyLRsj5dDbYsEuxjon3xLtYQK
	58qcf1xlzmCYWBytBg+yksgA866pSeu5DK8ThJ7uBDM7br9Uc6+OhkFgsaHnF2clcTWhXppO8fH
	CK9ikBw2Ulz+40U/DpaQHuqoBf3sKiYs=
X-Gm-Gg: AYBFou33x0IYrsxo+r2mdRZAeC4TAb7iPoiPCeUA5eR8ioKWrLJtHDZ2U6/T/mhNA9u
	eR9r4zJInqXe/M4DYXyECh55y7+gXGsbNDDa4meJ4rPU8lyU49qBkiwq6Z70aEPE7hxNtICeYrx
	/mG91FYFbygVWalUCeWA9qySUkbF1Ff5O2/ftumleMew5ZH7r67aLMxsy/jgR2N39PGLvso0tgY
	1+n4xr5IRkRNsucrspDZgVYHjtwsQzzNX2rHDXJTI6A7STvhhzDcpP78Optmrtc+9dyZmtmSDl0
	3HgZCkEoAwuiCZ1e7CBaSgxSH7kFh8Crx/0nb1Io0SgwlHJDUKSkguAQeK3Y5uFrDIsiy3Qhy8I
	XrVLLr+ec1WIC2RMUx3mj0kZeZ2vW5XmK8VpDhg==
X-Received: by 2002:a05:690c:ec4:b0:8ac:d426:105a with SMTP id
 00721157ae682-8b1340353e8mr29410497b3.39.1792656550133; Thu, 22 Oct 2026
 01:09:10 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CADGd8gGYm5QmnDrjBzfWsWcKg9_ULAAV7o8RzDxi1p9doN5gCw@mail.gmail.com>
 <bacdb44f-a4ab-4d55-a312-5648515f41ac@leemhuis.info>
In-Reply-To: <bacdb44f-a4ab-4d55-a312-5648515f41ac@leemhuis.info>
From: Serhiy Shliapuhin <shlyapugin@gmail.com>
Date: Thu, 22 Oct 2026 11:08:54 +0300
X-Gm-Features: AclHuK8idyuC9LagaU6kDmr1ij-CZ-3aFF9JVXtlpeAml0OsDKGnSO5Eh8miFRg
Message-ID: <CADGd8gF9DxnDVZxbsARCNkXXp7_aWfWOkyAN_Y8v65TtKW3zNg@mail.gmail.com>
Subject: Re: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles
 cannot be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "qby140326@gmail.com" <qby140326@gmail.com>, platform-driver-x86@vger.kernel.org, 
	ilpo.jarvinen@linux.intel.com, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Can you avoid it by blacklisting bitland-mifs-wmi?

Yes. With bitland-mifs-wmi blacklisted no platform_profile handler is
registered, and power-profiles-daemon switches all three profiles via
intel_pstate EPP again, same as before the driver was added.

The same can be achieved by running power-profiles-daemon
with --block-driver=3Dplatform_profile, which is what I use now.

> And does it still happen with vanilla 7.3? 7.0 is long EOL upstream
> (and 7.2 soon, too).

Yes, it is reproducible with vanilla 7.3-rc3 (Ubuntu mainline build,
no distro patches; newer mainline builds are not available yet -
bitland-mifs-wmi.c has not changed since 2026-07-03 anyway).

  $ uname -r
  7.3.0-070300rc3-generic
  $ cat /sys/class/platform-profile/platform-profile-0/name
  bitland-mifs-wmi

  low-power             -> accepted, reads back "balanced"
  balanced-performance  -> -EOPNOTSUPP, stays "balanced"
  performance           -> -EOPNOTSUPP, stays "balanced"

Understood regarding 7.0; I only mentioned it as the last kernel
where profile switching worked on this machine, before
bitland-mifs-wmi was added.

Thanks,
Serhiy Shliapuhin

On Wed, Oct 21, 2026 at 5:56=E2=80=AFPM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 10/20/26 07:12, Serhiy Shliapuhin wrote:
> >
> > On my RedmiBook Pro 15 (2021) none of the platform profiles exposed
> > by bitland-mifs-wmi can actually be selected. "performance" and
> > "balanced-performance" are always rejected with -EOPNOTSUPP, even
> > while the laptop is charging, and "low-power" is accepted but has no
> > effect. As a result power-profiles-daemon can only stay in Balanced.
> >
> > This is a regression. With Ubuntu kernel 7.0.0-38-generic [...]
>
> Can you avoid it by blacklisting bitland-mifs-wmi? And does it still
> happen with vanilla 7.3? 7.0 is long EOL upstream (and 7.2 soon, too).
>
> Ciao, Thorsten
>
>
