Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B66747B
	for <regressions@lists.linux.dev>; Sat,  4 Nov 2023 09:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeHgSGVI"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-540fb78363bso4782692a12.0
        for <regressions@lists.linux.dev>; Sat, 04 Nov 2023 02:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699090968; x=1699695768; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbfL3NkpfKmXRCHooSUmBGmgS2c222w1KL1iym/+IkE=;
        b=eeHgSGVIUVm/DFoXdE9n8eCoBsREf66xZNBj7o4o/Oxj7NS2X/bgKhanvsfJ3eGyqB
         aPZ2lTWlZPEsoe9/U4HAS4zee+KWoYR43JcyaOdY2Ct6tMSr0pjDp6JQjxsxfXYeZBDn
         pUuVMbEw+kb36yIY2OaRVuai+vMAdreo0jZM/kx6QycOKA8liiwRQ1y+ntJutEeV3+5r
         g0R4r216LyqSRjaiKaVPtB3DaSCN4HZR3ouHwU52T48tFXEPH8mPpEGk0Ckw2Orj0VDB
         SIEA3oD80yGql5Pat+Ob0ZdU9FQ2JfpKrXpJEVaI0quy6jcWJTYFF/7Vp6/KD+ZrNmHD
         tghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699090968; x=1699695768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbfL3NkpfKmXRCHooSUmBGmgS2c222w1KL1iym/+IkE=;
        b=ZLKAfuVZ/26rxkIeKj5M+y1krV4Q7t/QGCPk1exUetJ2SulRW88Sg1+/+owLkbGiUN
         4m9MJ0IDZMQBXKPgu0FTwImu3kZg/K9rS5AMHvFwTX7L5GQ0VJ2a37M8+wRfOnPmCWqH
         NPSWMRVzdbUYxdmNsC3gVU4qBtIheTMDqubnayqr+RF+8wRhaV0h01mw4zcYBswueABd
         P0Fz7zcHxyUlIJ3+q8LRzcQTLLDML7/La2+lh6nPROYTexi32dqHvWhckO6LSbtFY1VQ
         BdSn8w3m/VIbgdezGV+E9ECqv5aa7H/bBp4NEQ8g0sn8wzvqk5WV+tatJFKmHyE4qGWs
         Qdtw==
X-Gm-Message-State: AOJu0YxzcZW/0yFOjcTdb078XfOjgz/tPqW+Tl2sviO7aE6OyAjkIvhA
	DEqt3SKGh/Pk9NPJNNX8eUgPgU5awudWbXOQO5M=
X-Google-Smtp-Source: AGHT+IFAHNDkINjU+Y5YPivroCWJYoBJBuwLvpBetinur2scmP7PDHWMEUo6pHc1DTONAZV4gYyQrLs4lzdWmyR0oUc=
X-Received: by 2002:a17:907:1b02:b0:9ae:82b4:e309 with SMTP id
 mp2-20020a1709071b0200b009ae82b4e309mr9393758ejc.0.1699090967781; Sat, 04 Nov
 2023 02:42:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZUNsmJGbYwgPaUpY@debian> <CADnq5_Minarw2D_TeRdkm6nJOP_4qHM+MxiMeLWMXqHxjq22Xw@mail.gmail.com>
 <CADVatmO9NCs=ryNg72HNzMDpqg862gpGnnFhQ4uwTpEkjOkCLw@mail.gmail.com> <CADnq5_Ou7Cq071DJZnq+3PDNqkd3ZJb+dCEvMjiked6_t=E6MA@mail.gmail.com>
In-Reply-To: <CADnq5_Ou7Cq071DJZnq+3PDNqkd3ZJb+dCEvMjiked6_t=E6MA@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 4 Nov 2023 09:42:11 +0000
Message-ID: <CADVatmN4njCTGxNPjtpX9gdaySUxW07petaRP1uOzHaQNxf7fQ@mail.gmail.com>
Subject: Re: mainline build failure due to 7966f319c66d ("drm/amd/display:
 Introduce DML2")
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>, 
	Qingqing Zhuo <Qingqing.Zhuo@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	regressions@lists.linux.dev, Leo Li <sunpeng.li@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, 
	"linux-kernel@vger.kernel.orgLinus Torvalds" <torvalds@linux-foundation.org>, dri-devel@lists.freedesktop.org, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2 Nov 2023 at 22:53, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Thu, Nov 2, 2023 at 1:07=E2=80=AFPM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > On Thu, 2 Nov 2023 at 16:52, Alex Deucher <alexdeucher@gmail.com> wrote=
:
> > >
> > > On Thu, Nov 2, 2023 at 5:32=E2=80=AFAM Sudip Mukherjee (Codethink)
> > > <sudipm.mukherjee@gmail.com> wrote:
> > > >
> > > > Hi All,
> > > >
> > > > The latest mainline kernel branch fails to build x86_64 allmodconfi=
g
> > > > with the error:
> > > >
> > > > drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: =
In function 'dml_prefetch_check':
> > > > drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6=
707:1: error: the frame size of 2056 bytes is larger than 2048 bytes [-Werr=
or=3Dframe-larger-than=3D]
> > > >  6707 | }
> > > >       | ^
> > > >
> > > > git bisect pointed to 7966f319c66d ("drm/amd/display: Introduce DML=
2")
> > > >
> > > > I will be happy to test any patch or provide any extra log if neede=
d.
> > >
> > > This was reported earlier and fixed by:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D089dbf6a06f1dcaeed4f8b86d619e8d28b235207
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3Db141fa036c901303ca5659cc22e9c08f8b097892
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D5b2c54e0d0ea09f7a3b500510731878326e1117e
> > > but I guess maybe different compiler versions are still hitting this.
> >
> > Yes, I should have mentioned. gcc-11 and gcc-12 failed to build. but
> > gcc-13 was ok.
>
> Should be fixed with Nathan's patch:
> https://patchwork.freedesktop.org/patch/565675/

Yes, it does. Thanks.

Tested-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>


--=20
Regards
Sudip
