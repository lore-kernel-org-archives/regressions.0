Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4498C1DA2B
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 17:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jlc1SAiR"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9d465d1c86bso186473366b.3
        for <regressions@lists.linux.dev>; Thu, 02 Nov 2023 10:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698944874; x=1699549674; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xl4I+HvP3J5ZJKuSb/CouLtm+Hi9ya1nTcmqWDQztKk=;
        b=Jlc1SAiRcaVAs8gFuak5bdo5YRi44BKkkZn9LKiBSwRAgXM1FY8ByzsRdVfp9q47/K
         3fQMQ36yFZEdbE5tmLoJ1DrtpqO7/y0WvjxSXc3dV9Epm2GPVkJ/OVJt2egqAZVpfrdr
         Sku+rqDRvlZ48lqGvIzDx02e444ETJm/xghr8o11J58PI5qWzdVLED1QVLXO56oTgYTc
         +yFom2hApoVfz5+PKDI7GTL6tsV2x9JOWGCKm9hGv0VDLVe2jc3QNnSknEPu3rNmYwwp
         jpwOwznCU4L/lwRPv5i4+uHmePqyMwby159wGvBD6dh5rvGt7bm5ZdPRqAn4xANS3/1B
         eVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698944874; x=1699549674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xl4I+HvP3J5ZJKuSb/CouLtm+Hi9ya1nTcmqWDQztKk=;
        b=Y4AGhT/ncJ8zxilc26rftzs+QpU6nOANV4MgX3dThi5LGC4xXHUqrsTSOJJrM25n1F
         z0LC1PvovTnq+bMiOccWOUt3HUDhdLp/R4JhklVL7iJsb26EcvagaiYowIcb0BGcqgVx
         qjRrn0iQ4nXkOtxXQIrjbHlGFUDQV0qvAJUNJJzS3p2/QWWoGtsfroW04OmuPuT/ISBl
         0rZX/P5ITufgtmiVKa6c2vOo1Y0k2WpIhy6ZD+L86mmQQonArSvW65mu7N/Gm/fDPyUo
         CPCj8LnGY1arfESpvfeOXfhtd4tsUvVdhxK1cP8d0/vbMx2k9EzotKcifmehO3qHyvCj
         uixQ==
X-Gm-Message-State: AOJu0YytbMz8LcVULaFLs/ZWa7ptao9m7zAOYskmpWRxTAaJ2rTgtpIp
	IpkKzCiGJN8WWUCVdTPvIIMCQvkgO2Jq43IB9Lc=
X-Google-Smtp-Source: AGHT+IELCuRpMJYiWl0Qrpfp672D7mV32NZ7IqUrU0Waf2iuqATWpRIDQA27z7e6YAK1wp9d4NaPJSOdvn5cL7zLluI=
X-Received: by 2002:a17:906:d552:b0:9be:77cd:4c2c with SMTP id
 cr18-20020a170906d55200b009be77cd4c2cmr3767379ejc.28.1698944874378; Thu, 02
 Nov 2023 10:07:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZUNsmJGbYwgPaUpY@debian> <CADnq5_Minarw2D_TeRdkm6nJOP_4qHM+MxiMeLWMXqHxjq22Xw@mail.gmail.com>
In-Reply-To: <CADnq5_Minarw2D_TeRdkm6nJOP_4qHM+MxiMeLWMXqHxjq22Xw@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 2 Nov 2023 17:07:18 +0000
Message-ID: <CADVatmO9NCs=ryNg72HNzMDpqg862gpGnnFhQ4uwTpEkjOkCLw@mail.gmail.com>
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

On Thu, 2 Nov 2023 at 16:52, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Thu, Nov 2, 2023 at 5:32=E2=80=AFAM Sudip Mukherjee (Codethink)
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > Hi All,
> >
> > The latest mainline kernel branch fails to build x86_64 allmodconfig
> > with the error:
> >
> > drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In f=
unction 'dml_prefetch_check':
> > drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6707:=
1: error: the frame size of 2056 bytes is larger than 2048 bytes [-Werror=
=3Dframe-larger-than=3D]
> >  6707 | }
> >       | ^
> >
> > git bisect pointed to 7966f319c66d ("drm/amd/display: Introduce DML2")
> >
> > I will be happy to test any patch or provide any extra log if needed.
>
> This was reported earlier and fixed by:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D089dbf6a06f1dcaeed4f8b86d619e8d28b235207
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Db141fa036c901303ca5659cc22e9c08f8b097892
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D5b2c54e0d0ea09f7a3b500510731878326e1117e
> but I guess maybe different compiler versions are still hitting this.

Yes, I should have mentioned. gcc-11 and gcc-12 failed to build. but
gcc-13 was ok.


--=20
Regards
Sudip
