Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EADD219F1
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 22:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKabVdIk"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1f00b95dc43so843133fac.3
        for <regressions@lists.linux.dev>; Thu, 02 Nov 2023 15:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698965601; x=1699570401; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywkZ1ZWfNmiVp7a6UPS372ot5uoGxaI4T7nCnN1k30I=;
        b=hKabVdIkbnSiStNMX4+L6HgIEI2XnK2EVULyDEmHEbC1F+h3VhhBOitOQlPKvo1r9o
         h/IFssCKfQm+aYd+XQEEAlVoJP7jouIt07eaZFmTc7IRLuCgosxxFTHmrEMpBkuTrQeZ
         qmOuTK3QILZ137ULMvqLJMXpdu0jEiFcyybY5UU6eH2pszLd9Y0jxm7Odp6T1GxEodda
         2YujifuZb+7R6L+52CgOZHArfk9c2SCxGrVXhM5Kb7bBYuMisn8OJATSnUCsRlmEwvHM
         M/FRt18GBF5xteq09jxCQ/DTp2S9af8q+GWHv9qXHqkogvdU7A3kUJ0j2dmNcAszCf4z
         qdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698965601; x=1699570401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywkZ1ZWfNmiVp7a6UPS372ot5uoGxaI4T7nCnN1k30I=;
        b=bFP+d4bEaCvVVwitBqahlOoC1XrGDZ4X2BP9TTPBzWe60lSlcULNKR8OU/YJsxIq67
         no8YXliPS95vrnIaB8JTZM3kEDH4hgZOztmfJ+DKhpyaIN4inC9D1uRfdGvQu0i/GrQE
         jZOXtFxldV/1mB8xuKwTuLnePXsT6JaXRxJEQazmJwrAmLMi/lELaQAeZ2AvyInrJbp4
         zm6HnQbs+1Odt1WcSAhs5W/31IcHWawtvo18BAs+qAozU2jIXXvu/f4ellXP5NUS0Nc3
         37rkbXyk1zHc2UZglkIkAH2irRBjirpp4oNS3kTjkxNdfB1frKWZ4hskRCv0yCAKmw/y
         Zoow==
X-Gm-Message-State: AOJu0YwzyREpW3Igg5EZWu1p0FjcEAn2Mz7355p4uGRoi/Yl74duXiHy
	spDYFYHCYJ7XTiHFo4QvZgiEjudVSd0+y+CdyHY=
X-Google-Smtp-Source: AGHT+IE1yCCtzM/K8cFr0IT8oP2y3RjE6Uh5RrkvdH5l8sS2cDigljS/xmdpOFoQ2Ifca4c1s8xNpN5SqSINFrPB+PA=
X-Received: by 2002:a05:6870:2007:b0:1dc:c65e:ded2 with SMTP id
 o7-20020a056870200700b001dcc65eded2mr24706945oab.12.1698965601603; Thu, 02
 Nov 2023 15:53:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZUNsmJGbYwgPaUpY@debian> <CADnq5_Minarw2D_TeRdkm6nJOP_4qHM+MxiMeLWMXqHxjq22Xw@mail.gmail.com>
 <CADVatmO9NCs=ryNg72HNzMDpqg862gpGnnFhQ4uwTpEkjOkCLw@mail.gmail.com>
In-Reply-To: <CADVatmO9NCs=ryNg72HNzMDpqg862gpGnnFhQ4uwTpEkjOkCLw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 2 Nov 2023 18:53:10 -0400
Message-ID: <CADnq5_Ou7Cq071DJZnq+3PDNqkd3ZJb+dCEvMjiked6_t=E6MA@mail.gmail.com>
Subject: Re: mainline build failure due to 7966f319c66d ("drm/amd/display:
 Introduce DML2")
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>, 
	Qingqing Zhuo <Qingqing.Zhuo@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	regressions@lists.linux.dev, Leo Li <sunpeng.li@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, 
	"linux-kernel@vger.kernel.orgLinus Torvalds" <torvalds@linux-foundation.org>, dri-devel@lists.freedesktop.org, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2023 at 1:07=E2=80=AFPM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> On Thu, 2 Nov 2023 at 16:52, Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Thu, Nov 2, 2023 at 5:32=E2=80=AFAM Sudip Mukherjee (Codethink)
> > <sudipm.mukherjee@gmail.com> wrote:
> > >
> > > Hi All,
> > >
> > > The latest mainline kernel branch fails to build x86_64 allmodconfig
> > > with the error:
> > >
> > > drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In=
 function 'dml_prefetch_check':
> > > drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:670=
7:1: error: the frame size of 2056 bytes is larger than 2048 bytes [-Werror=
=3Dframe-larger-than=3D]
> > >  6707 | }
> > >       | ^
> > >
> > > git bisect pointed to 7966f319c66d ("drm/amd/display: Introduce DML2"=
)
> > >
> > > I will be happy to test any patch or provide any extra log if needed.
> >
> > This was reported earlier and fixed by:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D089dbf6a06f1dcaeed4f8b86d619e8d28b235207
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Db141fa036c901303ca5659cc22e9c08f8b097892
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D5b2c54e0d0ea09f7a3b500510731878326e1117e
> > but I guess maybe different compiler versions are still hitting this.
>
> Yes, I should have mentioned. gcc-11 and gcc-12 failed to build. but
> gcc-13 was ok.

Should be fixed with Nathan's patch:
https://patchwork.freedesktop.org/patch/565675/

Alex
