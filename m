Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0478A5244
	for <regressions@lists.linux.dev>; Sun,  6 Aug 2023 16:30:24 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-986d8332f50so508861266b.0
        for <regressions@lists.linux.dev>; Sun, 06 Aug 2023 09:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691339423; x=1691944223;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4FzIGJB3RF9rAhmTZEhvxM+refdOYwtltFRNRcqfwUU=;
        b=MYpX1fWWRMg7736RNBD69cMPy67TLJxBxJnyk1gXkqaz6uXV19IgSd+K7dT8JWKhjw
         Zsuwa+dgW2zOu8HtICpnZDFBL+HRmcVHDYSxjA7RyVIwhPT59nOUa0LIlITuC+BlFfGd
         iRx3yLe4tPS3rpA4oM7pSGu7v+DvR2uV+dwsH4JAKDxQkyTodGC0JTcyZ8L5UQYFoGq2
         RBMTFh7RrZ9iLYqldgjb4YTNpH0V6aHysGSLF9WdhEqvnSEz2ba363CqDQBf9z1+brB/
         NUPmu/UkMvlvHgisnt+yZSItJdRZ57f7Zo4qaYd58PJyGiuXAs3AwJA7djJoAKFRwOtZ
         sbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691339423; x=1691944223;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4FzIGJB3RF9rAhmTZEhvxM+refdOYwtltFRNRcqfwUU=;
        b=exlmSNKtXywQ9RDGHW3Dihu/UK4ioixyYGmJXcqX+JQ4bv0bbjzjkOR5JEUak83v48
         il2jAU5DSr7yaOx3NU3byu3zRTLJ1vqbP1uHMDfaGtydpiZHQ6Od0xsGvvMA4W33cNCl
         HwNgLXAhBkohVfl3nGPBFOdvJ120A26NvfKd9gI4jdqTT8qe+1uM0SHjibQhD/cCr1cR
         Iga/OxlOoPZGEjnuinXq0QNtSvvif8kAedvsUywE9vONHc2zWH95nt2jHQitOJddfr+I
         dAWRwSN0upCrFUwCEC6+isz7+yqsuV/VJ1aCk2PmhYDK6RAShULeySFoYujhkpho7rPR
         bmXw==
X-Gm-Message-State: AOJu0Yx7xwPR4o6nbSjjdwgiRutdjOEyqmXM9w+2ami9EknlRBMKHYp1
	Hj1GnKcgUSLNZ6rxujD51Vs=
X-Google-Smtp-Source: AGHT+IFBgcTomtBPCWj3ELlkRqpOeLLFbgNNd0voEnTkW6Tkl4KJgY/36xffVukkLB+Ou2WdyYy81Q==
X-Received: by 2002:a17:906:2d4:b0:99c:c15f:31b2 with SMTP id 20-20020a17090602d400b0099cc15f31b2mr3356297ejk.8.1691339422791;
        Sun, 06 Aug 2023 09:30:22 -0700 (PDT)
Received: from [192.168.1.23] ([176.232.63.90])
        by smtp.gmail.com with ESMTPSA id y7-20020a17090668c700b0099315454e76sm4008742ejr.211.2023.08.06.09.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 09:30:22 -0700 (PDT)
Message-ID: <fdd5fd9ece045ebd1888672a75f157e64ade98fb.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] tpm/tpm_tis: Disable interrupts for Framework
 Laptop Intel 12th gen
From: Grundik <ggrundik@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>, Christian Hesse <list@eworm.de>, 
	linux-integrity@vger.kernel.org, Lino Sanfilippo <LinoSanfilippo@gmx.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Linux kernel regressions
 list <regressions@lists.linux.dev>, Peter Huewe <peterhuewe@gmx.de>,
 Christian Hesse <mail@eworm.de>,  stable@vger.kernel.org,
 roubro1991@gmail.com, Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 06 Aug 2023 19:30:19 +0300
In-Reply-To: <0f272843a33a1706dbcbb2d84b02e3951ee60cbb.camel@kernel.org>
References: <20230710133836.4367-1-mail@eworm.de>
	 <20230710142916.18162-1-mail@eworm.de>
	 <20230710231315.4ef54679@leda.eworm.net>
	 <bd0587e16d55ef38277ab1f6169909ae7cde3542.camel@kernel.org>
	 <bb5580e93d244400c3330d7091bf64868aa2053f.camel@gmail.com>
	 <0f272843a33a1706dbcbb2d84b02e3951ee60cbb.camel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2023-07-12 at 00:50 +0300, Jarkko Sakkinen wrote:
> > I want to say: this issue is NOT limited to Framework laptops.
> >=20
> > For example this MSI gen12 i5-1240P laptop also suffers from same
> > problem:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Manufacturer: Micro-Star Int=
ernational Co., Ltd.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Product Name: Summit E13Flip=
Evo A12MT
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Version: REV:1.0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SKU Number: 13P3.1
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Family: Summit
> >=20
> > So, probably just blacklisting affected models is not the best
> > solution...
>=20
> It will be supplemented with
>=20
> https://lore.kernel.org/linux-integrity/CTYXI8TL7C36.2SCWH82FAZWBO@suppil=
ovahvero/T/#me895f1920ca6983f791b58a6fa0c157161a33849
>=20
> Together they should fairly sustainable framework.
>=20

Unfortunately, they dont. Problem still occurs in debian 6.5-rc4
kernel, with forementioned laptop. According to sources, these patches
are applied in that kernel version.

What can I do to assist fixing it?..

