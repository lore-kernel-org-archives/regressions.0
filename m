Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1345A32ED4E
	for <regressions@lists.linux.dev>; Wed, 15 Oct 2025 15:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760543176; cv=none; b=JgK9K01atPY4sm+jMk9uwLY+OA6TRToJ8LLJozwVNAtktELEUp83nSPzdSv/1/HGnxcDWuV1yBxBofcGBLLctNaTepoTAtFpPtLR2I3FUr7AwErTOXS+hWk+kZr54exZED2dmYZGeV7R813qc/VdPDJorVa+HL7uzmSd3wL8qU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760543176; c=relaxed/simple;
	bh=Nd5hXUmEuB5qRp8pWl35xSOUTluz6/AfHU93GdFCKoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHSW2PtuW3We3ss9FWC9yvkDopp0YcUDxIbZYVlYGcXr6Awi50Us1mn4l/1rBzLtKump3IMYaP2iRnrzyE2GHkLKQWv0HcE10fto1Bye8yrQ0dPlfZOdrdWId+Juwnq3vC00W2U27HndcSGLBjOXcthbMk/fhr1d0zFVx9CoHDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vyw0XXR0; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vyw0XXR0"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-636d5cefab2so7095548d50.2
        for <regressions@lists.linux.dev>; Wed, 15 Oct 2025 08:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760543174; x=1761147974; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkmO8kwNPXSyL42vtuMXueXt3VwnQ3PwUmTN5CpC5Ug=;
        b=Vyw0XXR0V4Kt+LhfyINqSmuc1Wx4W6fq4IKaoHjJUijTtawau8wdNuN89Pbn/0wzft
         PaC9cthNjuudVms7fbxBfVAjOhvb9tA7L27Ew9E1GIBY31gS17ztZU8aQYH3AZaERyLh
         QDOP97H96nxS58HzFTHOeSotlzROVuFDs7MJGLJJIoeAX8qAAeON3w8UO3NPMDuoc9Sp
         APazGp8fyucV9N7jK0EFtgEHZFPuVUFOBiU7AW9K+J8otk+oZYhF28EGSU1gKEfRu6IZ
         hotL9mlXCtibicRJzqC16QD+MHqrkAEcODZI5YAqOlh0ocHgtA5spBopqBVNT5FBKcGH
         Ej/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760543174; x=1761147974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkmO8kwNPXSyL42vtuMXueXt3VwnQ3PwUmTN5CpC5Ug=;
        b=ZOcVKaZ0IgTJFCEKiIgG5oz18POk92RW0HJYSFI3d5CGB9wC9Pk6T51uMA1neV7cNp
         RpfWovuLx3uIWc49aiENdRDquYi44S/wBaI0mz+HoJiypXJWi5aIjlIxGS3qimsGtO0/
         V2XfRAEKULvpb2qDKsFSHjVm/ga4M1zA+iNGkdgTH9F32NcUbotv0x9ikip+B/JPzRdi
         ON3a0AjguT/T93uHfxrO3OATFL0fqcpjxVvbPrRZfm4NQEyiAoaAuIEUwtWb8kUSgugR
         8hGpNF6YdOBaRAEXwioL6H4pP08SDxYV3Emo2fAnSzn6716G1sjiDi3mJqV2yzCzf9Rz
         FVzA==
X-Forwarded-Encrypted: i=1; AJvYcCXugbs/0Jqq1HdZ5T0t9konLxLtOTXLIWERENmZ2NYgeVPxXkBzk2BRGsnVWTULE2TNMSBtFplnNBbvgg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGnyTC5KLajnXEwnMVdI24PMyIl2XVGUWBElEpes6KFdx6Yrmi
	U3OPJTkbXH5FHdwyS2h5KEAMGdrl/tBkQWFAlUWtBwIFiybm2q7rAbjXujYDwSVtI89n/Gk8CPo
	LNqcIQ1MV9zBBxdrCSfnp8Wmbyoh+Q00=
X-Gm-Gg: ASbGncuaPw3GH4X1J6h68a3B18YIN/394cnZy6ECkqw+Lj4rs6jsSU6xgx78Pg1a2cC
	5nbw2Tgc2euopF5rx39ERtCfZv25hrO9L1x8RJTcQ8ei8EqySrYRftQOZD/cm/pfGVHL6StG6th
	lZ8t+YhIaG99ZUTbz5/t6d3CTAzpaD3LjEXYpXH1uTfzHh7+YI+9mzlMK6i88bBAvwwiPWsozAH
	xLyYSONmIjlHyY9ZVUgsCeUJO8szx0IaZAskURXQoHdQiEtab4=
X-Google-Smtp-Source: AGHT+IFgFgiCn2MXat9mzlismka2yMZKZPJMj5/8ogylK7npyFOu2pzbbuaB1mNpotL/j1a2GlPY5/iLw60S1YQr77E=
X-Received: by 2002:a05:690e:4291:20b0:63c:f5a6:f30d with SMTP id
 956f58d0204a3-63cf5a70755mr10874437d50.55.1760543173814; Wed, 15 Oct 2025
 08:46:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87o6q8l68r.wl-tiwai@suse.de> <20251015145749.2572-1-safinaskar@gmail.com>
 <878qhckxc5.wl-tiwai@suse.de>
In-Reply-To: <878qhckxc5.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Wed, 15 Oct 2025 18:45:37 +0300
X-Gm-Features: AS18NWAiuA0FoKwp8uia1YrxNnyhxfuszDQDYT8g_Hy9a2KLASwscAn4IzjGr_Q
Message-ID: <CAPnZJGDeCkqqUpEh0SBfwvsxfMp9ZDXqvhrC1s9zRp6jX+Fvnw@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA:
 hda: Move controller drivers into sound/hda/controllers directory)
To: Takashi Iwai <tiwai@suse.de>
Cc: Dell.Client.Kernel@dell.com, amadeuszx.slawinski@linux.intel.com, 
	baojun.xu@ti.com, bo.liu@senarytech.com, cezary.rojewski@intel.com, 
	kai.vehmanen@linux.intel.com, kailang@realtek.com, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	regressions@lists.linux.dev, rf@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 6:18=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
> Good to hear.  So a part of the problem was the incomplete kconfig

Another data point: Debian's experimental kernel (6.17.2-1~exp1) does conta=
in
culprit (2d9223d2d64c), yet it works.
So, it seems that Debian's people somehow cope with this bug.

Also, when I take vanilla stable kernel 6.17.2 and apply to it Debian patch=
es,
listed in this file:
https://salsa.debian.org/kernel-team/linux/-/blob/debian/6.17.2-1_exp1/debi=
an/patches/series?ref_type=3Dtags
and build with Debian's config (with "localmodconfig"), then... the bug hap=
pens.

I. e. Debian's kernel has some unknown magic, and I cannot reproduce it by
taking vanilla kernel, applying Debian's patches and Debian's config.


--=20
Askar Safin
