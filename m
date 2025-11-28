Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5142A285CA4
	for <regressions@lists.linux.dev>; Fri, 28 Nov 2025 03:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764298805; cv=none; b=ptvLCHiMHxuXxHStAvUfWRGB1LusflhS5ETKdIxMpClWYHPvAsspai/JzUnQtTsWKbuPd331dyC9txeqd1FUaeDOCeDnIRciv4Y+sd0sWrFStAJfXG7c/wmyx3J2aVvCgtNNXGYuzf/hsOI3ENgLOGVf6U/+wM4MD5Y1iM7SYqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764298805; c=relaxed/simple;
	bh=TYppZNzZQzp6ondQ2xQLSLhP3N66douY6DbnuOZeqYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xd3ji/BKrSf6U250yxVsWdmMuvGnq1igoB24RaDGXkEqA4WpOWjVs/oiPhuKcvOi7AyWEGqaXSbmDXjkfjXjTXB1+k7c7AV2dh5hkDkytKEahh/t2QsUCnL7FIq1zC/cILz5PSJlO7ItK6iQZZmdngiSP2VPvL/oU7PSMUtl3o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqRQ/2Ds; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqRQ/2Ds"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-596a055b1b8so1564295e87.0
        for <regressions@lists.linux.dev>; Thu, 27 Nov 2025 19:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764298801; x=1764903601; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJq+1B1sI6yzhGchPzVcdD4BSJn3WDAPIGOauWfX+bk=;
        b=bqRQ/2DswpvgA/httYJjd2/b/9BrDkUduuAxOBdyyHFiDr4w0qMcgiNy7i64iSxrT4
         49gqzk8afIfWrzKnuYtorb6l0wcgpBiyN34Qshy2JbTEuQWMHkJAo3vets7fOfv5pRPf
         ShEB7DvuDSW85V3ccegCfZmQVQirgfpF8g2fj5jw1SpD1EgCMF48JVxnoqEyPSwc+28B
         dGuhv/qZHOOrqFv5QN9+WRYKIXorwVTVceAzlsVAKeRreia5Za8ZfJn1zy4XtpPKmc9d
         RHxGIEfPnWUiG6VAQ7aHLmw27pHQM4soKTfbHVE1W/brAU78f/PBE4Ma/ZAUJff+uzsy
         2h5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764298801; x=1764903601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cJq+1B1sI6yzhGchPzVcdD4BSJn3WDAPIGOauWfX+bk=;
        b=YKjfWyvgHxfd4PKDtyJiIrsYikv9d2CUoNy20JeuqZQxAbp1GUmvNMmRWsHuIwV9yE
         3BfvHBIxlhHUSoapZA0L/OK2rCsAFTrsuk2wnC6AgGsVZxS77WUVyX/lZI5WjVtic7FY
         NMwCk5IsBog3nQWTM2R2knxepaRDABNGqsm1y8ph+de4ItNW227hp/qD7HZys8MlCPIu
         T3jsa20GptvAhI+s5mOjNq5uXRAtJw09HeyvmgWb6OZ+WzaiNdSDApYaTWve1Zq9olmG
         UN6zmNyPyQHxO3KZuuvFRT4sT5F5YCoANH0YJIcaa2RYTnwvw+0qZxupfjrF6wOFAyu7
         tXDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjWFkug6J0HW9I3w5CLgDFZGqXXgZpzL2lUVa2I7gBCet/Qoqikuswuyg5zMvRHzU/eqarSOLLx2Kwfw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+AJNNSVHXz/bkyVhJd5sSG2iuuYNenkswqRUJKXvZBhB3mS3m
	Yj8K2S+zRQG/I4ijXQsSZOqqUGHXuqCOod8Cyf97oLUGesmfEilNtOBDBR3CvSZAoYMKMhSskBO
	Tjdfcn6L41gDVqRQd/iuk9C6qupCIF3o=
X-Gm-Gg: ASbGnctOegkw1gkJyROsLACgXV+P4t07Cbhq45n+QPN3u4QlzRBKIOA3Op3FeoosqbZ
	dEtmdCylTyj+TOV6OnW8/Pl9eIVK6efjU+Pi6pMeELCbozyLqAH7oFAhKjD8gljEB0s8JUg4/I1
	YaI4i9pyOsSRX0cz65r+9OsFh7mX17dd3ZxEkYgVe5TkTnRO+J7hz7qpqyAniR6rDTeLwi3b28d
	gD5RDew2VuTe1eq9p3CS+gaUt0dIG8H0Rh6moLXibuNfjAucjGtajPwSbeqew6+vqRvEzQ=
X-Google-Smtp-Source: AGHT+IGvOWy7yyiK7f98nc3EO/ukeFU1q3BB62MfykeDDvhHqxD5/kjVdAl0bSZqgV7901NqJCOH/MYwkjyE5oYiH3c=
X-Received: by 2002:a05:6512:b1d:b0:595:7a6c:7db4 with SMTP id
 2adb3069b0e04-596a3eb59afmr8509799e87.4.1764298801222; Thu, 27 Nov 2025
 19:00:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAq5pW8q6V7x6qpYnE3xB99nVwE363keGiu+Jax0_zqPjogULw@mail.gmail.com>
 <CAAq5pW_saBZ+52zz2FYTt9SuWXj2KwX2Ld7AggVKAzca2m0Oow@mail.gmail.com> <CAAq5pW9o3itC0G16LnJO7KMAQ_XoqXUpB=cuJ_7e3-H11zKd5Q@mail.gmail.com>
In-Reply-To: <CAAq5pW9o3itC0G16LnJO7KMAQ_XoqXUpB=cuJ_7e3-H11zKd5Q@mail.gmail.com>
From: Evans Jahja <evansjahja13@gmail.com>
Date: Fri, 28 Nov 2025 11:59:49 +0900
X-Gm-Features: AWmQ_bljV87U_YaWy2CItZO_-S-4IuG82a7APaAjJ3ItWl_P2M7yJwtTlwlAyac
Message-ID: <CAAq5pW8-j6UzruT=SU05QgJ1AjLXeUwASLJ3O3SVKttaMbdTXQ@mail.gmail.com>
Subject: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to no
 longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid display
 hw pipeline when probing mediatek-drm
To: "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	matthias.bgg@gmail.com, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#regzbot ^introduced: e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6
#regzbot monitor: https://bugzilla.kernel.org/attachment.cgi?id=3D308962
Hi,

There has been a regression in the dts for my system
mt8183-kukui-krane, where changes in dts/mediatek/mt8183.dtsi broke my
machine.

The display works under v6.17.9 but is broken in v6.18-rc7. I was able
to replicate / fix the issue just by using the dts from the other
version.

> On Wed, Nov 26, 2025 at 3:01=E2=80=AFAM Evans Jahja <evansjahja13@gmail.c=
om> wrote:
> >
> > Hi,
> >
> > I have a Lenovo IdeaPad Duet Chromebook CT-X636F, detected as Mediatek
> > krane sku176 board. (mt8183-kukui-krane)
> >
> > The display failed to initialize on the mainline kernel (linux
> > 6.18-rc7). Using the same config, on stable (linux 6.17.9) the display
> > works fine.
> >
> > config: https://bugzilla.kernel.org/show_bug.cgi?id=3D220803
> >
> > With the system on mainline kernel, I was able to check the serial
> > console, the error on dmesg looks like this:
> >
> > [    6.513400] mediatek-drm mediatek-drm.18.auto: Building display
> > pipeline for MMSYS 0
> > [    6.514983] mediatek-drm mediatek-drm.18.auto: Display HW Pipeline
> > built with 9 components.
> > [    6.515009] mediatek-drm mediatek-drm.18.auto: Invalid display hw
> > pipeline. Last component: 38 (ret=3D-2)
> > [    6.524422] mediatek-drm mediatek-drm.18.auto: probe with driver
> > mediatek-drm failed with error -22
> >
> > Temporarily modifying mtk_drm_drv.c by commenting calls to
> > mtk_drm_of_ddp_path_build_one CRTC_EXT and CRTC_THIRD allows the
> > display to function even on mainline. I was also able to add some
> > logging and determine that building the HW pipeline for CRTC_MAIN
> > works, but because building CRTC_EXT fails, the entire display would
> > not initialize.
> >

I think this is the issue:
https://lkml.org/lkml/2025/9/12/1242

On Wed, Nov 26, 2025 at 2:06=E2=80=AFPM Evans Jahja <evansjahja13@gmail.com=
> wrote:
>
> Hi Angelo, I was able to isolate the problem further to the dts. After
> bisecting the arch/arm64/boot/dts/mediatek/ and building the dts, it
> seems like this is the first commit that introduced the issue on my
> device.
>
> commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.c=
om>
> Date:   Thu Jul 24 10:39:08 2025 +0200
>
>     arm64: dts: mediatek: mt8183: Migrate to display controller OF graph
>
> I am linking my full bisect log here:
>
> https://bugzilla.kernel.org/attachment.cgi?id=3D308962&action=3Dedit

where we're unconditionally adding mmsys_ep_ext.

The issue seems to be caused by the recent addition of CRTC_EXT on the
base mt8183

Please kindly take a look. Apologies for any mistake, this is my first issu=
e.

Evans Jahja
