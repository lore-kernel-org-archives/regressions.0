Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB49284B45
	for <regressions@lists.linux.dev>; Tue, 10 Jun 2025 11:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555428; cv=none; b=I/WCGOrGmrz+eAjFguF6JyACQvqgoPjew/VcZfSbOV144I2ogH+7C9V7j0vyrc1afxgIxMB/V8SRSL1LBe625XJJqE2EUCzmAvFoKSpnDXB4vmhh/NWB3UkwarQMqtqNfB34UCf451CfkNuhAGIu/w/FIWXYiH37BCs4tiU6sB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555428; c=relaxed/simple;
	bh=Nnx5SwmZD0+RTHgrHJfEuPfmmfeN1X0Axl/gTjNoQjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfFo6eHdANgdirjgRvScoqd7V7gGz/7Ww7j+PwCHC1Df60dx2Abp3KClr0f7p6u37J3FMegvWSun6CWhtKcgsLWWMCnDGOlU2fmsD7+qYNUyVPC049kQaFnUVCcaew6NnFAByl304CJUUMwISw1tTpBVE9gsTbnkobx4eSUjbqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QU0dERuv; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QU0dERuv"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f2b58f0d09so1639786d6.3
        for <regressions@lists.linux.dev>; Tue, 10 Jun 2025 04:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749555425; x=1750160225; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IEUo4OXi/6u8Jsr6TBxYCa+QoyT/MABPEkrypIa5tU=;
        b=QU0dERuvXiZr9SUmEVBCjQ4D6VHi6q59+/WNqrn82BOphnXhGMe5M6sX3OdK0uCQXi
         E3LB0+rU3Md7g+eFCkaSH7W43tLu0h7hYAaNVZunzEFCHx9vqs+HLTAwUsEKS0VO5kMF
         vRGHLPdNm6KGOUlgf1msCQKw3CwFQfotSw/EFCZS8IaIGki+xC9O8yxaK43VGI49BsRS
         T6Kwiys/bD1yUglKe+Z6Kely05ZHyBAazAxAMsOCebtq6RSP/lFOTmmMPFiXhVOXPMen
         Ljc80OslRZpc02IhXnGeUaS6eQJz7CIVhb4m4UqzkXdn35xnBlkvhirXnCjOurrm5Ad+
         UVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749555425; x=1750160225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IEUo4OXi/6u8Jsr6TBxYCa+QoyT/MABPEkrypIa5tU=;
        b=ba9lsSCEgHBO4lI6txGEt1LItVDD/mt3EP4FN0CtUHV2wTYGvxUelNW5YlQmwApDPI
         BnVABpOSYtRzAYGiLnWZHxecAQ1nZobGa7vjTjeeUxi8n5KZuzRur0hSc9pSadLGQtf4
         fM2bJ1Rva1LkylD01uoMr3/v+0AXBnyRkR8w28mex6ZxRz0Ijk1Sze82sUISPvsY4Is0
         M+GV/viL/yPw2PeCTbYjh+Zrshzt64ZjdfMRDJRwyQ73r2xYO8CFHWEEGFnhpRL6fS8z
         gkJIJrJWADjs9e1L4kaT8/ObAOwG015TeMRRE/txHCmV/tDxOttkjPdi09x8KiQZglD+
         Rlfg==
X-Forwarded-Encrypted: i=1; AJvYcCWyW+dvST/MHFIscz0j+2RMIsUk984KYGFwCkdhL5QdoeM9oGkGk77EBh4HgZA9aQ2DuICpDPKIkHvnjg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyX0CYHI6EhpIhfxRIR4Sr57e2uN3MhT6bvUE8ZiaLBWx0mBYsk
	RQRnC0N/ivZ1SfuiBnSd/aIS+YcSDIu2zzofc2rhsAT3Oota0//b2ithnf5uZHIIOqg/pUng/6z
	RYDxi1/JlZf0tZnq1u0AtlTZIST5df3fajxsjpoL5uW5zRHzbZMD/Z3w=
X-Gm-Gg: ASbGncsDP4EndF+yN3w962j5n5Uk+j4yNBDqHiKpsJHOXQsjWfwHzKwg0OXXHkyVOXi
	J14I5S/K1Bd0IM6K744vt/a21aQiqOx0DDZWHNVGijw2iwvL0cGxbWwPEUOVKOCESxoD6krg4Jg
	DAWr8EWnCDqGwRk/W7Q0lxibeT3vSHUtFtFb3nsjNvOQ==
X-Google-Smtp-Source: AGHT+IHvHKo08me5RcB6HhT8MUj1njWXYeU3P86l+7s/He8833skTN9xQoNPfcqRdrNFzqssiZdslfW5Rg84q+3rI0M=
X-Received: by 2002:ad4:5d44:0:b0:6fa:c5be:dabd with SMTP id
 6a1803df08f44-6fb09f8a766mr87178436d6.11.1749555424663; Tue, 10 Jun 2025
 04:37:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuppX5LeRjOAZWsYRCs76PVbnv-TN_RrszhDsk=KregyA@mail.gmail.com>
 <15979303.uLZWGnKmhe@diego>
In-Reply-To: <15979303.uLZWGnKmhe@diego>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 10 Jun 2025 13:36:53 +0200
X-Gm-Features: AX0GCFt6fIa22bGlOZEBQVbwxbv765S6LyHqHyQH8BFAYJiOCtlXCLCPP7EEZaI
Message-ID: <CADYN=9L+Gao0w_CThNd96-yYbZDMZnwY7RvagCOdzUC4rKc-Ug@mail.gmail.com>
Subject: Re: next-20250610: arm64 No rule to make target rockchip rk3399-rockpro64-screen.dtso
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Regressions <regressions@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Peter Robinson <pbrobinson@gmail.com>, krzk+dt@kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Jun 2025 at 13:22, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Naresh,

Hi Heiko,

>
> Am Dienstag, 10. Juni 2025, 12:25:31 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Naresh Kamboju:
> > Regression while building arm64 with the Linux next-20250610

[...]

> > https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgm=
zjEl7VszYE9/build.log
> > * Build link:  https://storage.tuxsuite.com/public/linaro/lkft/builds/2=
yJ4IOQa1XxMqDgmzjEl7VszYE9/
> > * Kernel config:
> > https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgm=
zjEl7VszYE9/config
>
> thanks a lot for this notification.
>
> I'm surprised that overlay build at all when I built it yesterday.
> But yeah, the dtbs_install target really broke with that change.
>
> I've amended the commit now [0]

Thank you for the quick fix.
I applied your patch and built it, it worked fine for me.

I built it like this:
tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
--kconfig defconfig dtbs

Tested-by: Anders Roxell <anders.roxell@linaro.org>


Cheers,
Anders

>, to change dtso to dtbo and ran the
> dtbs_install target sucessfully with that change.
>
> So on the next linux-next creation, this should hopefully be gone.
>
>
> Heiko
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.=
git/commit/?h=3Dv6.17-armsoc/dts64&id=3De14491aaa6ff598bbe9d462e44c01ac6575=
4f445
>
>
>
> >
> > ## Steps to reproduce
> >  - tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
> > --kconfig defconfig
> >
> > --
> > Linaro LKFT
> > https://lkft.linaro.org
> >
>
>
>
>
