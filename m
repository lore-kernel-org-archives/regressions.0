Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FD027B4EA
	for <regressions@lists.linux.dev>; Thu, 24 Apr 2025 13:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745500347; cv=none; b=Yla7c/sMiaqE31Ge8zsca1CwgEIbue9jflux55SFclTvjuM/IXePFn7eqWnUyfIeLdkSD+nLRSMaPFquwJR5l2Up2i0YxYK7m0e0GaQMvCrjUVv7srk2PERHY7JDgJ1gwLjIEL2YsgAKxFr+7Ym5TugjGJSoUZA7wKO5Yfs3pG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745500347; c=relaxed/simple;
	bh=eA7Xuy6k9ONAPkP6AgSuyk9zFim9A6uFvmLfDwCH8vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdPiRoXo8WbgyOoLB+mykFB33NFgPZdC/mQHO7USp2jGLXwFl31CEh93cvjsyDk5iwFMbQ/KftKrIFiiatb1G2P1H4OoRgKV8iyQDnpvyNQ57U45HFJuLGRvSVFZpvMe8qDydIbsm7gQPMvN478qMMVXXf62Vsac55od9DU66bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZQJd5uL; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZQJd5uL"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so138362a91.0
        for <regressions@lists.linux.dev>; Thu, 24 Apr 2025 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745500345; x=1746105145; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eA7Xuy6k9ONAPkP6AgSuyk9zFim9A6uFvmLfDwCH8vs=;
        b=bZQJd5uLIHiqvdd60ZN6YbOJVPBc4lZCkCIogFI8kSJAjne4GIBhRr7uGCbsWr2oA7
         2LbVXzFIYq5FRBZoSL9qfZbo8ereRGnOzepOGLQElUTj0QYLaod3BrNmFN7DDEmVc0wV
         ZBknh0JBLc9Sd55gC9r6tJ4RwNt6T3N26jcDVyTwOgZocmBV/zz+6QohNa1BoodoAE/u
         n58EIHxus5e4ouWjLBuORXrwO4dwhyRi8Yij+KPwbToEOQlzHV5jTRMI4hrJrAme+f+s
         uVSOndc28wXPf4De2yCt+Vf+mKGrD1cB6EtJYFmhK6CIsb7WQWZK2T6hlBTGUTbeqAn8
         4unQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745500345; x=1746105145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eA7Xuy6k9ONAPkP6AgSuyk9zFim9A6uFvmLfDwCH8vs=;
        b=iM/bUuALjHvqAwlAJHHgdchZ8D8emkicJwFKf3bPX5tRbL8JWqUYRBFWGHMYGfWTcN
         LBb2m93ZZUWoT/Aw8pBTe2jKBw7qy9KxDPBoG9nos1reUlXT0rl3Bh8o0vTRYna+H4BS
         OZ37xWne39kJbUYUv4oigSHIpghVdg62Xr8ekscbk0KSBgRZyO07cPnsl8kRJ5bYu7uh
         YIQlvm9T+CQZ038/UBibs2+nIyplMeM5FkrdnMQplzo+3Q46bBNns73t5oXIFKE6Z4ie
         cYR/xh6ojDfy8OIRJvlBgFQlRixZdn3UxsbY5QkvukhdLuz+M7iOeJcLPfm3+cqh/Cla
         phIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ5LfUjaOqRBAXJ/Igc6jrDeOnojKl538xXM2FFDer/03rCN87KIm225O6z8gtGj5KMhyzugweaF9O3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiivAQcJbyFDKuZUmJDfeQ7yTXNfN8g4/KqqSfldzISFZkylK1
	hl36jrx9EvUXGSwX8zHjSgHU4YbkF/geTihawp2Ud2v0pjHcMtc9fCXR8mLzS7Y668r1d7ehzJ5
	P90g3+he2uFVyx78Aw+0T7zV82x4=
X-Gm-Gg: ASbGnctPdYmrjiP77MLrRXlLAiXPiBCUaslQUI1zwg1ZjZEcleAKsc988hOj/r3aF+z
	F7QVo0EQIis1bGASt+6utFYwISTAj8rg67A4DArjczKYdc5q+MXTMhFB//HzDswYmlhpD4cN7W1
	xh7Wkb9ih5nA9x9nFvg/akhQ==
X-Google-Smtp-Source: AGHT+IEFvo9XYRtQEvgfEvNW3YyXCDl9i/8QVWCKx/TXGNL9aOOZJwdPzKvHZ6KZW7h65cYldr4AhFdLlL3QAZqAS3M=
X-Received: by 2002:a17:90b:3906:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-309ed24cc88mr1706401a91.1.1745500345346; Thu, 24 Apr 2025
 06:12:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu>
 <8963a409dd575e040e5f07e4ad5e9c1d26b421f2.camel@irl.hu> <CALT56yPd-xfd=47xRxrCk4F3jib4Ti7kg8pRXy-gVAQpbOc=pw@mail.gmail.com>
 <e323219b52cda1891a55d12ad77a2b34edc8688b.camel@irl.hu> <Z_jodBrNFdEpJRKA@mail-itl>
 <aAn6wsnJ-6mqK4vR@mail-itl>
In-Reply-To: <aAn6wsnJ-6mqK4vR@mail-itl>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Apr 2025 09:12:13 -0400
X-Gm-Features: ATxdqUFwuh2Liv704M5KwrRa6klhoiIfTdC591MnFCPLJIk1C-iKiwHLYfgFHos
Message-ID: <CADnq5_Ptzieevwysn1Qz5yxTOujMtEDW=Rbwqpvmd_3o2Gd--Q@mail.gmail.com>
Subject: Re: amdgpu_dm_connector_mode_valid regression
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Gergo Koteles <soyer@irl.hu>, Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, regressions@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 4:49=E2=80=AFAM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Fri, Apr 11, 2025 at 12:01:28PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> >
> > Hi,
> >
> > On Wed, Apr 02, 2025 at 04:35:05PM +0200, Gergo Koteles wrote:
> > > Hi Dmitry,
> > >
> > > But the code would start to become quite untraceable.
> > > duplicate mode in amdgpu_dm_connector_mode_valid()
> > > call drm_mode_set_crtcinfo() in amdgpu_dm_connector_mode_valid()
> > > duplicate mode in create_stream_for_sink()
> > > overwrite ctrc in decide_crtc_timing_for_drm_display_mode()
> > > if crtc_clock =3D=3D 0 call drm_mode_set_crtcinfo() again in
> > > create_stream_for_sink()
> >
> > FWIW I'm affected by the same issue (on HP ProBook 445 G7, with AMD
> > Ryzen 5 4500U). And the patch quoted below fixes it for me too.
>
> I've re-tested it with 6.15-rc3 and the issue is still there. Is there
> something I can do to help fixing it before final 6.15 is out?

I believe this should be fixed in this patch which is already in this
week's -fixes PR:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/b316727a27d0dac1e6b7ae5=
1204df4d0f241fcc2

Alex

>
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab
