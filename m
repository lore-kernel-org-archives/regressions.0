Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4D08480
	for <regressions@lists.linux.dev>; Wed, 25 Oct 2023 13:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IBsiGXJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698240569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RKM+gb1rWlbrsyGe0ru+asYHoehN8Amt0gEY38pCGlY=;
	b=IBsiGXJbcARP/w9BYFZW/T21wCFTOoLYrJ2pffW9FGyGsY4L2gOG8wTK9oacyUE165CAVo
	Owhhy2dUfOKZTO5b/wJ7G9FwRiLCWODgQMdSWNhKwlboTCF/g1u5WWIp5HHeNejjvb4F30
	KfL3JFlS1hF/F8jl6f34B806oRyRMwA=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-0ZZHG2aKOneYrbn_qLeSlQ-1; Wed, 25 Oct 2023 09:29:28 -0400
X-MC-Unique: 0ZZHG2aKOneYrbn_qLeSlQ-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2c50d4a1a33so43932321fa.0
        for <regressions@lists.linux.dev>; Wed, 25 Oct 2023 06:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698240566; x=1698845366;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKM+gb1rWlbrsyGe0ru+asYHoehN8Amt0gEY38pCGlY=;
        b=EYK3a09Y1N0OpnLlLU0D4gK7qrXFwsUvLFOZWOeVwM1BH6JbqLY4WzSD/gaa8iiFwo
         FEprHfPFwV+XnTGYs7xNe3rUzYedHuk1rsnP1L1zD1bnNoTD2ZJCum2K9Oz/meRQrFuc
         edbRToIXNYNlZ5hQn1vsKB0w70CGEk2hcRwEcSaueLXLCHHijatWDa9DUKvSoQ8mr1yV
         xD0TA9di4bzr05K67Z8JoRkNplURo+Ke4UYXHXj6/V+p7BQ/BGnSGaVjVCSFF3hfPaNN
         V25146OWluFzmIsOLD2SijdwhZMCiaUAqCTPGFEjHSqVBZpy3Ibb5gaVepkA6gMn4GB3
         y3xw==
X-Gm-Message-State: AOJu0YyjJdDWAPxsTXuc8Uqd8IVUOP8OsPsd0SBEGsEJsENasBKlLCCW
	O6Za2vR+dS7du7OmCUIpvXzmtfElz6Udxpyo9Pjw3a8KOKRcf0ws6iZa9q2/M/pEgekTdZaf7ce
	7ZNL48uqP5HvBkV9uh/BHclg=
X-Received: by 2002:a2e:a167:0:b0:2c5:2242:ba5f with SMTP id u7-20020a2ea167000000b002c52242ba5fmr10223985ljl.26.1698240566735;
        Wed, 25 Oct 2023 06:29:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/bd1sv994kl11qxaY4JhVZknbw1CMFlecWdVOEe4wLnbmCw3X4wu/FtaHxVQeGg/8wymYQw==
X-Received: by 2002:a2e:a167:0:b0:2c5:2242:ba5f with SMTP id u7-20020a2ea167000000b002c52242ba5fmr10223969ljl.26.1698240566378;
        Wed, 25 Oct 2023 06:29:26 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c2e4c00b0040648217f4fsm19250273wmf.39.2023.10.25.06.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 06:29:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Huacai Chen <chenhuacai@kernel.org>, Thorsten Leemhuis
 <regressions@leemhuis.info>
Cc: Evan Preston <x.arch@epreston.net>, Linux regressions mailing list
 <regressions@lists.linux.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Jaak Ristioja <jaak@ristioja.ee>, Linux
 DRI Development <dri-devel@lists.freedesktop.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad
 L570
In-Reply-To: <CAAhV-H5DH3Oj3ttSpa_k6jUdZ+0_pMwgoaqUTGGFr46j7DMXRw@mail.gmail.com>
References: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>
 <31bdf7b1-0ed9-4217-b459-1d857e53120b@leemhuis.info>
 <CAAhV-H7fRpykesVUEyaTpVnFiGwpP+fPbtdrp6JwfgD=bDp06Q@mail.gmail.com>
 <CAAhV-H7XCmbgS=N4-SE8FnASAws8hnDRZsQJgXE+dwyARaqzNw@mail.gmail.com>
 <ZSO9uArAtsPMPeTP@debian.me>
 <CAAhV-H5GbidUx8YanUc7S9oGqBkDd53xeT=2O4aCuX7KpM-+8A@mail.gmail.com>
 <c9b79a69-bdc1-4457-900d-709a15d99568@leemhuis.info>
 <CAAhV-H4qQW_fOdkTxmT1xbvo4LOapzw_tOw7Kma47xmh0PvpPA@mail.gmail.com>
 <ZTWoDSPxGO-ApR4r@P70.localdomain>
 <82f1b533-3bd8-4418-843a-718d9a6b5786@leemhuis.info>
 <CAAhV-H5DH3Oj3ttSpa_k6jUdZ+0_pMwgoaqUTGGFr46j7DMXRw@mail.gmail.com>
Date: Wed, 25 Oct 2023 15:29:24 +0200
Message-ID: <87v8auhlu3.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Huacai Chen <chenhuacai@kernel.org> writes:

Hello,

> On Wed, Oct 25, 2023 at 6:08=E2=80=AFPM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:

[...]

>>
>> This additional report makes me wonder if we should revert the culprit
>> (60aebc9559492c ("drivers/firmware: Move sysfb_init() from
>> device_initcall to subsys_initcall_sync") [v6.5-rc1]). But I guess that
>> might lead to regressions for some users? But the patch description says
>> that this is not a common configuration, so can we maybe get away with t=
hat?
> From my point of view, this is not a regression, 60aebc9559492c
> doesn't cause a problem, but exposes a problem. So we need to fix the
> real problem (SIMPLEDRM has a blank screen on some conditions). This
> needs Jaak or Evan's help.
>

I agree with this.

> Huacai

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

