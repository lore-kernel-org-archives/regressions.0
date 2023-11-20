Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EAA1D55D
	for <regressions@lists.linux.dev>; Mon, 20 Nov 2023 16:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/j0QSMv"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6d33298f8fdso2776657a34.1
        for <regressions@lists.linux.dev>; Mon, 20 Nov 2023 08:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700496546; x=1701101346; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2oEbSauGOHvjZGkANky2osMy3LrJnK1DvMlgtxNIqU=;
        b=h/j0QSMvbriIYWRcbPrhAqNMlO/8GjHWytTs7mzJhFOvSwgu7xl1Rc5V/CWAqLXEUc
         mLKyRqKMh39zxsKR2N48acHRCil34yF4WfSIshTEKG7v7e903oddM9+m0xowexs5n6HE
         iEcPeiHkCl/MkfTen7yrk/Z9NqNzCE5pELnXMc93e+okOjA+p7n+jL1LoTSyPQdaJJEe
         c+Syg6kLbcd3aakpo5UpVmOGOhZ9WDRy76fbJAjJoPlcJLQbv8CXevQhs94akjQTMGoL
         l5k8CNnhx4Rgw1ARasWlWGTBcd+8ILgw9AXYpsM1vWoEFySUvBdAf5E73qUQUROx+U26
         8u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700496546; x=1701101346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2oEbSauGOHvjZGkANky2osMy3LrJnK1DvMlgtxNIqU=;
        b=CGRjwReYtYj/MlwG1gTIyDRbDSChS00sDUZNIsj4grQJG5oOJskwGB1ZKPPQ4HSpNZ
         NgHOlRPgR+u6IF8qFzCwnCOq6Rt/ffc0IKQyCaQGDlOQG2YQcOLyJ4gxu008yJADWweJ
         eW6vFq1mgXugNpRafTWDvOgSVoeJOpNm0EK/euDvntRbYSPNOJFlRV/hMVjmMNF5RZfk
         3jnWWAoYoayvz0sddA2shuFN7pr7wSjp+GTdnm1sZt6Q9aZ2lroogD2jPBO3sRwBR/N1
         fcIlHDKHaB0p0DBmtmqyK6m5cQ8EgxTPv6gD8/fm73DzCf01j3et72pj6M54ifvWhvva
         FCew==
X-Gm-Message-State: AOJu0YxD+WxCt3DTVZED3EwBCm9BaQvIQL23csRe+GhTHDHkU1RDhrhT
	oiBtxKIYHcqt0yLTGERwTsz6HymHGeH3PQyxFvQ=
X-Google-Smtp-Source: AGHT+IEvbqXG00KL7aQO3Yc9jfLXnQj4XWLXSx/JaniG8N/Ocl9GUeaAS9Sx0btCzaUWmAP3MwcAMlhcoTbsFJ35TUM=
X-Received: by 2002:a05:6870:7987:b0:1f9:34b3:7ae9 with SMTP id
 he7-20020a056870798700b001f934b37ae9mr4808940oab.17.1700496546587; Mon, 20
 Nov 2023 08:09:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87edgv4x3i.fsf@vps.thesusis.net> <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com> <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
In-Reply-To: <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 Nov 2023 11:08:55 -0500
Message-ID: <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Dave Airlie <airlied@gmail.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, linux-kernel@vger.kernel.org, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, Luben Tuikov <luben.tuikov@amd.com>, 
	dri-devel@lists.freedesktop.org, Phillip Susi <phill@thesusis.net>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 10:57=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 19.11.23 um 07:47 schrieb Dave Airlie:
> >> On 12.11.23 01:46, Phillip Susi wrote:
> >>> I had been testing some things on a post 6.6-rc5 kernel for a week or
> >>> two and then when I pulled to a post 6.6 release kernel, I found that
> >>> system suspend was broken.  It seems that the radeon driver failed to
> >>> suspend, leaving the display dead, the wayland display server hung, a=
nd
> >>> the system still running.  I have been trying to bisect it for the la=
st
> >>> few days and have only been able to narrow it down to the following 3
> >>> commits:
> >>>
> >>> There are only 'skip'ped commits left to test.
> >>> The first bad commit could be any of:
> >>> 56e449603f0ac580700621a356d35d5716a62ce5
> >>> c07bf1636f0005f9eb7956404490672286ea59d3
> >>> b70438004a14f4d0f9890b3297cd66248728546c
> >>> We cannot bisect more!
> >> Hmm, not a single reply from the amdgpu folks. Wondering how we can
> >> encourage them to look into this.
> >>
> >> Phillip, reporting issues by mail should still work, but you might hav=
e
> >> more luck here, as that's where the amdgpu afaics prefer to track bugs=
:
> >> https://gitlab.freedesktop.org/drm/amd/-/issues
> >>
> >> When you file an issue there, please mention it here.
> >>
> >> Furthermore it might help if you could verify if 6.7-rc1 (or rc2, whic=
h
> >> comes out later today) or 6.6.2-rc1 improve things.
> > It would also be good to test if reverting any of these is possible or =
not.
>
> Well none of the commits mentioned can affect radeon in any way. Radeon
> simply doesn't use the scheduler.
>
> My suspicion is that the user is actually using amdgpu instead of
> radeon. The switch potentially occurred accidentally, for example by
> compiling amdgpu support for SI/CIK.
>
> Those amdgpu problems for older ASIC have already been worked on and
> should be fixed by now.

In this case it's a navi23 (so radeon in the marketing sense).

Alex

>
> Regards,
> Christian.
>
> >
> > File the gitlab issue and we should poke amd a but more to take a look.
> >
> > Dave.
>
