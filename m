Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122C82BF01D
	for <regressions@lists.linux.dev>; Mon, 16 Jun 2025 13:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080615; cv=none; b=RXdFrdxjIBMn3JzXEO2Q8omd7aA5TbI0chYfciLT9wrR/x5g896GWh2om2A235jW1yS0FqOIzAuAZDDZcK5DgRAL+K8Y42oSQXAsasbPZpcvThcmmVq2lP3j191M8ESv8Ko/jlfXd7JVd6/nx4gIRhAuthOl4LsuIXjnPYTfPhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080615; c=relaxed/simple;
	bh=59qFySa7X+/ac5Ydc1pV7JddQfv8+DTKdIh521qRg7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B9A/vHOmq9MHX6SMLD5IFsFjgArYcr668PtL2AtduLxAZIY9PlkZph3xeB+rl1PTJlw/0j0dBLhHGEVYQ/N6w7GdQBiFfudUmxld7CgQiKoyh2BMuMBiu8gTZpryWdYq9uLxxxWmwX6rxyNAbNUDQove9NCatbC8jx/0OMN6n5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsGet4Ze; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsGet4Ze"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b2c43cbce41so681748a12.2
        for <regressions@lists.linux.dev>; Mon, 16 Jun 2025 06:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750080613; x=1750685413; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+QmnhYc0vGa92UC7MvCez/Zyxtl9c45qHEYK1lXUtU=;
        b=BsGet4ZerJSqjyMtLhAbNnZm9kkVNCHMm+fc/Ypd1FMYS66bcIdLWsrzdXzjiOq0HW
         CeV3OjxP0IugILjL9aUwJWjpZiKGSOlDTWl5f8dSsVtc0YS1yvwylkM78Lep5lWbjCgP
         cplg9el99PSycpdaYU5pYJ/AVzeVU6E14tSanqFUnGJ02eGmLhw0/65blFfMWjet7Zao
         6fFYk7hGJfjkVq3HG7+IEQQ+sqDDlCcQZLd0fF/dFwu4eG2u7YA0r/6VS6As4jAf8hwr
         Yzn/MzaIOulain869NjwpRG8Gm6Uq+bX1Luhbh59PCSW8R1ShViONzlHv9m+AsvSohtR
         AExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080613; x=1750685413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+QmnhYc0vGa92UC7MvCez/Zyxtl9c45qHEYK1lXUtU=;
        b=oV/Dbjsf17sbW3Rl8jh68B/FTULH15NHRDK/wiEigqIZu79tvEx8757+VIwl1sclE6
         LCxGGhWGYZd7sX13zHBSO1vL2npEDBuTCXsuk+sbRLPJwYyz3UpH1lTzlsFACXdzNF2y
         Pi3RSJpqR+Ox6ErnVD4KVxmDnBCPeLvejDOf9liGp55JhcczQCJM2LH+VbJdwAYuP1jm
         +C0u8L7Jjtr31pafaIHqucsdCtDR//KpGgAQXv+Aq5VvxxYW13LD+kVsRGbuorSWS7o7
         CidPSzuphhqh8dNqCZJ6dqSLaAHkStB+REs96BJLxxnhV2hmLHh8xlHHTfvLeq2ni8Aj
         4vbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHMWhaDM/GoFE6eylbgdBrwhvdkAvImjkppaLgbvR4U5zPL4mNh10FsECtu0yi9y9G1a7Ah0eQdu2awg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaziM6N8+AbrxuGDnaKgxqnQh1hcoNni2uMYCAziyyprnxMum0
	IN0lfTlHLl05xgl7gD/CKWKF7A+doVU7lqGRTH8xxeLmKGChjkQNTTTaTi0a+UdUDAjfbJfPbpg
	hfe4YKjhGGP+wr9VyDffYmSS4XyPaElo=
X-Gm-Gg: ASbGncuqNXFOzumlE0cuUH7LL6DCzmEyl/jxf31kldgV0QpYTldI1tb6vxFGq5R7++m
	1hdLZpC/aeXtRyXkDr9hmul4jt0fLXmNtzHEh6gq+549U0otC7uF87Gah1GK7AMbvqxHgwqgXh/
	BuXslnZZO9DRa1/+YOmazHhLlFV5Uz/m9JRrj9IPCD3Qh7
X-Google-Smtp-Source: AGHT+IGh7h6yA8zvALC5hiiGFj0J/FBflTGa0Uz6Pkt1gyHm0RW4BdoiBIlQbL9w6OGrh/35fpnh4uTxfdlAObUNoZM=
X-Received: by 2002:a17:90b:1ccc:b0:311:c939:c842 with SMTP id
 98e67ed59e1d1-313f1de6397mr5102153a91.7.1750080613063; Mon, 16 Jun 2025
 06:30:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c415d9e0b08bcba068b01700225bf560@disroot.org> <CADnq5_PX1dYF2Jd3q7ghaBjpPhNLq9EmFJtN1w6YOSfVo++7sA@mail.gmail.com>
 <69b5ebaa719355994a383fa026dc3fba@disroot.org>
In-Reply-To: <69b5ebaa719355994a383fa026dc3fba@disroot.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Jun 2025 09:29:59 -0400
X-Gm-Features: AX0GCFthNM7567uej1TQBWHUevhiCE9wm4x56veEnyNPJYkkpKzt0iW-4Hg9ffs
Message-ID: <CADnq5_PkOuAHuDjMNXABEcenaZFZgU044G=9pTu=EgMr_grXbw@mail.gmail.com>
Subject: Re: Unplayable framerates in game but specific kernel versions work,
 maybe amdgpu problem
To: machion@disroot.org
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, 
	christian.koenig@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 3:38=E2=80=AFPM <machion@disroot.org> wrote:
>
> Hi,
> sorry for the delay.
> Besides less time, I had to make myself familiar with bisecting and
> again kernel compiling. Last time I compiled the kernel myself was
> around 2010 I think.
>
> Anyway it seems I found the bad commit. The result after bisecting 10
> commits is:
>
> a53d959fe660341788cb8dbc3ac3330d90a09ecf is the first bad commit
> commit a53d959fe660341788cb8dbc3ac3330d90a09ecf
> Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> Date:   Thu Mar 20 14:46:18 2025 +0100
>
>      drm/amdgpu: immediately use GTT for new allocations
>
>      commit a755906fb2b8370c43e91ba437ae1b3e228e8b02 upstream.
>
>      Only use GTT as a fallback if we already have a backing store. This
>      prevents evictions when an application constantly allocates and
> frees new
>      memory.
>
>      Partially fixes
>      https://gitlab.freedesktop.org/drm/amd/-/issues/3844#note_2833985.
>
>      Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>      Fixes: 216c1282dde3 ("drm/amdgpu: use GTT only as fallback for
> VRAM|GTT")
>      Acked-by: Alex Deucher <alexander.deucher@amd.com>
>      Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>      Cc: stable@vger.kernel.org
>      Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Unfortunately reverting that commit will reintroduce a similar
performance issue for lots of other uses.  See:
https://gitlab.freedesktop.org/drm/amd/-/issues/3844#note_2827990
for a description of the fundemental problem.

Alex

>
> Marion
>
>
> Am 2025-05-08 15:18, schrieb Alex Deucher:
> > On Thu, May 8, 2025 at 9:13=E2=80=AFAM <machion@disroot.org> wrote:
> >>
> >> Hello kernel/driver developers,
> >>
> >> I hope, with my information it's possible to find a bug/problem in the
> >> kernel. Otherwise I am sorry, that I disturbed you.
> >> I only use LTS kernels, but I can narrow it down to a hand full of
> >> them,
> >> where it works.
> >>
> >> The PC: Manjaro Stable/Cinnamon/X11/AMD Ryzen 5 2600/Radeon HD
> >> 7790/8GB
> >> RAM
> >> I already asked the Manjaro community, but with no luck.
> >>
> >> The game: Hellpoint (GOG Linux latest version, Unity3D-Engine v2021),
> >> uses vulkan
> >>
> >> ---
> >>
> >> I came a long road of kernels. I had many versions of 5.4, 5.10, 5.15,
> >> 6.1 and 6.6 and and the game was always unplayable, because the frames
> >> where around 1fps (performance of PC is not the problem).
> >> I asked the mesa and cinnamon team for help in the past, but also with
> >> no luck.
> >> It never worked, till on 2025-03-29 when I installed 6.12.19 for the
> >> first time and it worked!
> >>
> >> But it only worked with 6.12.19, 6.12.20 and 6.12.21
> >> When I updated to 6.12.25, it was back to unplayable.
> >
> > Can you bisect to see what fixed it in 6.12.19 or what broke it in
> > 6.12.25?  For example if it was working in 6.12.21 and not working in
> > 6.12.25, you can bisect between 6.12.21 and .25.
> >
> > Alex
> >
> >>
> >> For testing I installed 6.14.4 with the same result. It doesn't work.
> >>
> >> I also compared file /proc/config.gz of both kernels (6.12.21 <>
> >> 6.14.4), but can't seem to see drastic changes to the graphical part.
> >>
> >> I presume it has something to do with amdgpu.
> >>
> >> If you need more information, I would be happy to help.
> >>
> >> Kind regards,
> >> Marion
