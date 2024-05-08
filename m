Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A206256742
	for <regressions@lists.linux.dev>; Wed,  8 May 2024 14:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715177941; cv=none; b=slRcz+7Mm4zpS2iPdV/l0xiHhHqPILcmK5Z9pVoQaG3dcJO9Pd6+z3eHShhTtLOaaKuITbGbL3F0BmU02xvd4qRNwU/K9iy4UPHtVEWfKhUmUm6YMpRbe6C3Pzv78v57t+PKKdFRMfyNElJ+bPDc4s9nbZoqfNHEH54Q+VpVCf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715177941; c=relaxed/simple;
	bh=2kkirt6e1tPPOnZq3X5WtkWdhQIf6ryAuUYhO5Df7RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sfgGwym6NyrtYIcswAJSY16oslW0HPnb69lyl4uMfgK2XwvVPv11KpiFWRA44+5xuXp5y9h8PSN59tCGwSOGVeOFdy/dpsaMsSlHnGWbad3YSF4bhEOJU9s5ewOtsNW6IgoN0kym7SDBZ/keM2eHHJ2i0kqEkcsrTHujN38uSMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTPVUyrB; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTPVUyrB"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e0a0cc5e83so53568071fa.1
        for <regressions@lists.linux.dev>; Wed, 08 May 2024 07:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715177937; x=1715782737; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/o8FZDVnI5HiA6gRp5LYG7KHS1m880+Mz+IUrCObIk=;
        b=fTPVUyrB8tBjq75kipvfJyGf/yXsB36AEyGIi2RpjsRNwZDXWrM7R5EHqDpAVy34GN
         g8Oj/fVV19Pr2Zzcy7K8fPx2rz0bMKEOZbwOdLiUkptvjYh9JBMjuem/XIv3LpjYVcSF
         AijbJD8KofMIMyK/JUx6YP7EmssZiweP89IzjA71rNE7jBA7I/6E70yjjYUuAJCgiXn7
         O6Xe4QDaomGO+U0XijDnqGAhHL+D8tx4QBAhOwetopeYjDu2CHCeK/9VwYTxAdeT/nDN
         TpS7QTLMqmj9Q2baRvRg1ClQrNuJw6I403ctB3IM/IBQFyO8lkWtag8TAa9OlMov5bp5
         jNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715177937; x=1715782737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/o8FZDVnI5HiA6gRp5LYG7KHS1m880+Mz+IUrCObIk=;
        b=aJGsRviXxdJfhh+chDOyCsHGLHRE1TGTIzhw81cx13RdlTSexaKLm9+mZ8Mv+3We4T
         CedQfZfQgR5bbdtlCy5HDPdLnT/Sc99033EbjFyPhnQGQV9AUx7HLkq8synHe0Ts/scx
         qDW4b5MmkBy96YQ2LBAP1QZxWpVt8TSmZNrV6+5ZmI8cMMT73hEbJ/EV7XIMifTVWVJ/
         BNANPTUUTyMQjbP4wSSYXN/c9NJnxrKXBoez86TreoHrUsoWiLGcJhvIoh/Ozdj92z58
         vqdBELZXXG10Q6oJ0fGl/ueTIm3uXpei6AaKaheQCV99XbPKsDl198eYtmmD1e4qC0L2
         k6dQ==
X-Gm-Message-State: AOJu0Yx4X0jKI80OEJGtXSbqmYAARFPyOQrlroTV6fo7GVg2Aq0AGiTs
	mAZePpak4eKun32JUfnoa8wvOuSeDxIYzZDBmoUNWMU5rbc+db597JeUQW1ZcKfC2oJTN6sFhnx
	A4ZYhgZu/n8/lDl05nFXUvlG2+eVJ+A==
X-Google-Smtp-Source: AGHT+IHNN2Jg6pxtqKtrszRPpVa+3MamJp9KOJV7TV2Xe0scCtageC9Am3BgR9TNsbvf9fMR9gNXRhBjiHur8eRokC4=
X-Received: by 2002:a05:651c:617:b0:2e2:be7a:e497 with SMTP id
 38308e7fff4ca-2e447cac611mr13719581fa.49.1715177936843; Wed, 08 May 2024
 07:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240415141922.25055-1-peter.tsao@mediatek.com>
 <171328023414.16225.12939333659144302573.git-patchwork-notify@kernel.org> <0d59ae68-7552-454a-8d01-72c359496901@leemhuis.info>
In-Reply-To: <0d59ae68-7552-454a-8d01-72c359496901@leemhuis.info>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 8 May 2024 10:18:44 -0400
Message-ID: <CABBYNZK1QWNHpmXUyne1Vmqqvy7csmivL7q7N2Mu=2fmrUV4jg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: Fix the patch for MT7920 the affected
 to MT7921
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, sean.wang@mediatek.com, 
	deren.Wu@mediatek.com, chris.lu@mediatek.com, aaron.hou@mediatek.com, 
	steve.lee@mediatek.com, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	patchwork-bot+bluetooth@kernel.org, Peter Tsao <peter.tsao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 8, 2024 at 4:34=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 16.04.24 17:10, patchwork-bot+bluetooth@kernel.org wrote:
> >
> > This patch was applied to bluetooth/bluetooth-next.git (master)
> > by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:
> >
> > On Mon, 15 Apr 2024 22:19:22 +0800 you wrote:
> >> Because both MT7920 and MT7921 use the same chip ID.
> >> We use the 8th bit of fw_flavor to distingush MT7920.
> >> The original patch made a mistake to check whole fw_flavor,
> >> that makes the condition both true (dev_id =3D=3D 0x7961 && fw_flavor)=
,
> >> and makes MT7921 flow wrong.
> >>
> >> In this patch, we correct the flow to get the 8th bit value for MT7920=
.
> >> And the patch is verified pass with both MT7920 and MT7921.
> >>
> >> [...]
> >
> > Here is the summary with links:
> >   - Bluetooth: btusb: Fix the patch for MT7920 the affected to MT7921
> >     https://git.kernel.org/bluetooth/bluetooth-next/c/263296438807
>
> Hi! 6.9 is only days close and this is fixing a 6.9 regression, so allow
> me to quickly ask: do you still plan to submit this for mainline merge
> soon? Or did you already and I just missed it? Ciao, Thorsten

It wasn't marked with Fixes or stable though which is what I usually
use as an indicator to backport.

--=20
Luiz Augusto von Dentz
