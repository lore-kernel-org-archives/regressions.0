Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E306424126
	for <regressions@lists.linux.dev>; Fri, 12 May 2023 15:17:53 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-19615d6ef9eso4699498fac.0
        for <regressions@lists.linux.dev>; Fri, 12 May 2023 08:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683904673; x=1686496673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctKppkhAw3uRkR+N6SWCnWkmJDaZRwXzqRl9zakaLVI=;
        b=YLWU0PQIt0qPnshnk+WbMGy0Px50gQSNPK19Vl1gUU7zWV9Qt9feSZsWdFyJljGwNp
         Pt3Wo4iGof6VXY2WMKUDcTX1qumZvKtzVag9kfo5TMvvrrVvbarlU3T972DPmK/cW8+1
         9R+/R+BFvC6v+cWe25ZFg5GfIe1quh72gYY027YCsTDIfMlvHIBnYvhzFmrX/DKVjq4X
         1ukeOs0d1iUr22XUMTUVB/Lhm692xVtglImstRg4rj7LIVdFBCrH0YCenDCCioxkPTvX
         cRMabkhh6IkgZXE3nXBjh5jSj4dB/NoEbhG3XnfC3MRp3Dd40HDWSGD5OW2wAi4HNpfR
         qy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683904673; x=1686496673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctKppkhAw3uRkR+N6SWCnWkmJDaZRwXzqRl9zakaLVI=;
        b=XNG1GVtzyt7ZeL0xyvMVkr5dbkEv7bboReqpgxK0XI/oLyZDNfZN5fP33vpRy0PiSC
         HvmkmtKL6nSXFNHdxU90JoYXlc9wQFLxtHMJtZ20YDxW189H2Qrcrbjwp2J7LtctnDGN
         e2xwgVmre14isnoLfpfUup732vzBu1pC07+QvSfnYfNFxogpD3Fautggh9sIGRly1Ivr
         j5ShA02nUMi1Y6RMiNo8S8u2T8tAH89FTT3S5Ryktk66xfdfu2yhzE2pQeRBAwLP15ZK
         z5OCh3EDA2y+p44jatoYxrmSJ8XOFFbkvDbYXfbOi4i/XAsQrOJb/QqV8WcBqam+x/eR
         b3jw==
X-Gm-Message-State: AC+VfDyZQpcvql7dglvPyzB8/UJf5AftxxGJN86S4Z7k60ie59p5/3dL
	D9vcDWv3h4yrITYUYKYNEvgsNad0VQX4R/z/hgw=
X-Google-Smtp-Source: ACHHUZ4rmrc0Ep+iH+w4WCG4PF2+BkLxKvQ+iN3CIt+pBpeBslZBk3HS6BqY26uH+Pwez3s2rEeG3bYwMR251ayxsCw=
X-Received: by 2002:a05:6870:4294:b0:187:be3c:28b6 with SMTP id
 y20-20020a056870429400b00187be3c28b6mr13338235oah.41.1683904672864; Fri, 12
 May 2023 08:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <588c1a66-9976-c96f-dcdd-beec8b7410f0@gmail.com>
 <3e5548e4-5a3e-9346-ec58-3617e1947186@gmail.com> <a50537d1f1af34104793218acb954a61@linuxsystems.it>
 <3383ba6e-e62b-cd9b-8a61-39b0de8af579@csgroup.eu>
In-Reply-To: <3383ba6e-e62b-cd9b-8a61-39b0de8af579@csgroup.eu>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 12 May 2023 11:17:41 -0400
Message-ID: <CADnq5_Nuu+Lvt8SdHmzRZ1eZcHzoSRocGjgwCHBqf9fFd9nubQ@mail.gmail.com>
Subject: Re: Fwd: Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel attempted to
 read user page (1128) - exploit attempt? (uid: 0)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: =?UTF-8?Q?Niccol=C3=B2_Belli?= <darkbasic@linuxsystems.it>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sasha Levin <sashal@kernel.org>, Linux Regressions <regressions@lists.linux.dev>, 
	Michael Ellerman <mpe@ellerman.id.au>, Qingqing Zhuo <qingqing.zhuo@amd.com>, 
	Daniel Wheeler <daniel.wheeler@amd.com>, Linux AMDGPU <amd-gfx@lists.freedesktop.org>, 
	Fangzhi Zuo <Jerry.Zuo@amd.com>, Hersen Wu <hersenxs.wu@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, 
	Linux for PowerPC <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 11:16=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 11/05/2023 =C3=A0 19:25, Niccol=C3=B2 Belli a =C3=A9crit :
> > [Vous ne recevez pas souvent de courriers de darkbasic@linuxsystems.it.
> > D?couvrez pourquoi ceci est important ?
> > https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Il 2023-05-12 10:32 Bagas Sanjaya ha scritto:
> >> #regzbot introduced: f4f3b7dedbe849
> >> #regzbot link: https://gitlab.freedesktop.org/drm/amd/-/issues/2553
> >
> > It doesn't look like the aforementioned patch made its way into 6.3 yet=
:
> >
> > niko@talos2 ~/devel/linux-stable $ git branch
> > * linux-6.3.y
> >    master
> > niko@talos2 ~/devel/linux-stable $ git show f4f3b7dedbe8 | patch -p1
> > patching file
> > drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > Hunk #1 succeeded at 227 (offset 15 lines).
> > Hunk #2 succeeded at 269 with fuzz 2 (offset 19 lines).
> > patching file
> > drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> > Hunk #1 succeeded at 49 with fuzz 2 (offset 15 lines).
>
> As far as I can see that patch has no Fixes: tag, so it will unlikely be
> automatically merged into stable.
>
> Has anybody requested greg/sasha to get it into 6.3 ?

This is no fix identified yet.

Alex
