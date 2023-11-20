Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3862E208BE
	for <regressions@lists.linux.dev>; Mon, 20 Nov 2023 17:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWd+XqtL"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1ef370c2e12so2712103fac.1
        for <regressions@lists.linux.dev>; Mon, 20 Nov 2023 09:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700501509; x=1701106309; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAF1U/lCbnAz9mXeRmxCPX739RNT9Ki2al6h9FhAbIA=;
        b=GWd+XqtL3Y7sbPj5AvRIdcOBIyQivT/SJKeuKKt4wHU6f9mc0MXdsldEN0uQguZKEx
         kxMuC8sYamVfgbKQvoMBoY2IM58C0/Xcw0UdrKyivtrCh0yC9Ag0CZc9Lmc38TU3wDUT
         7x3+wXoT1nMfCk5HUSlRxtpr6i5delEciJ5jXtfZFLlR0Q2QisvRN7SYnq9/DWzCNxbq
         tUhGreNGicadSsxBLYVMVnBr2xTc9L6MpizV2yLLJUYhIvIkv43K7ncAH0UIgC2MP2zd
         cVJxGUJmICrzLdiV+YOAMQSaZq9eGhbgyd3/BPrX5jh05O6j8LqLKT1yMos3zVrThGlc
         VLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700501509; x=1701106309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAF1U/lCbnAz9mXeRmxCPX739RNT9Ki2al6h9FhAbIA=;
        b=YmA1h7PB7vX8EMCmoqThbniBM4oSINCMfjPxKDO3nANffodDoA1IfwYsRti1glivCE
         P3WDzY8O5bDxwckH3xlQKXa/cDUj3XiSmF3gJSXBm4JME/ZGHx1Bg/8xvY1z8e8e8qAy
         9bSteECd6KtLWwFTZ+G2uB5Quf74gbJr6A8BEEyWmPTMkwoJ0gL6iv0zG7MdZa3Gricg
         v9UVG+N6ZYKO6mIwh/hVe2OXOR+jab2GLncygeODbie5ETdnxv+4g1s6MV96qVZbXqDC
         GHHOQCy5REOXyz8u+gIy/87WxWz9zI2etfl/it+iXkifO7EeGFA5uWDLXgnTsvvf4yJR
         IgNw==
X-Gm-Message-State: AOJu0YxMWYB80LkeagsNM8lW4ZhrqfQX154yma45cqKEQRmdtkrXz4nt
	nGPiedm+BK3nS5kDCIM2p9KWG64nufUKNp0xLaU=
X-Google-Smtp-Source: AGHT+IHXGPskkZjPASHv5zjmBj8vTC+m/HXkKut1/0s33s6XPps0+a5t8sGmtHhxRowQsRtHWKhR/1Ty6hqrzEufKKE=
X-Received: by 2002:a05:6870:d3cc:b0:1f0:c29:d75c with SMTP id
 l12-20020a056870d3cc00b001f00c29d75cmr9798494oag.47.1700501509193; Mon, 20
 Nov 2023 09:31:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87edgv4x3i.fsf@vps.thesusis.net> <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com> <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
In-Reply-To: <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 Nov 2023 12:31:38 -0500
Message-ID: <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Dave Airlie <airlied@gmail.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, linux-kernel@vger.kernel.org, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, Luben Tuikov <luben.tuikov@amd.com>, 
	dri-devel@lists.freedesktop.org, Phillip Susi <phill@thesusis.net>, 
	Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 11:24=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 20.11.23 um 17:08 schrieb Alex Deucher:
> > On Mon, Nov 20, 2023 at 10:57=E2=80=AFAM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Am 19.11.23 um 07:47 schrieb Dave Airlie:
> >>>> On 12.11.23 01:46, Phillip Susi wrote:
> >>>>> I had been testing some things on a post 6.6-rc5 kernel for a week =
or
> >>>>> two and then when I pulled to a post 6.6 release kernel, I found th=
at
> >>>>> system suspend was broken.  It seems that the radeon driver failed =
to
> >>>>> suspend, leaving the display dead, the wayland display server hung,=
 and
> >>>>> the system still running.  I have been trying to bisect it for the =
last
> >>>>> few days and have only been able to narrow it down to the following=
 3
> >>>>> commits:
> >>>>>
> >>>>> There are only 'skip'ped commits left to test.
> >>>>> The first bad commit could be any of:
> >>>>> 56e449603f0ac580700621a356d35d5716a62ce5
> >>>>> c07bf1636f0005f9eb7956404490672286ea59d3
> >>>>> b70438004a14f4d0f9890b3297cd66248728546c
> >>>>> We cannot bisect more!
> >>>> Hmm, not a single reply from the amdgpu folks. Wondering how we can
> >>>> encourage them to look into this.
> >>>>
> >>>> Phillip, reporting issues by mail should still work, but you might h=
ave
> >>>> more luck here, as that's where the amdgpu afaics prefer to track bu=
gs:
> >>>> https://gitlab.freedesktop.org/drm/amd/-/issues
> >>>>
> >>>> When you file an issue there, please mention it here.
> >>>>
> >>>> Furthermore it might help if you could verify if 6.7-rc1 (or rc2, wh=
ich
> >>>> comes out later today) or 6.6.2-rc1 improve things.
> >>> It would also be good to test if reverting any of these is possible o=
r not.
> >> Well none of the commits mentioned can affect radeon in any way. Radeo=
n
> >> simply doesn't use the scheduler.
> >>
> >> My suspicion is that the user is actually using amdgpu instead of
> >> radeon. The switch potentially occurred accidentally, for example by
> >> compiling amdgpu support for SI/CIK.
> >>
> >> Those amdgpu problems for older ASIC have already been worked on and
> >> should be fixed by now.
> > In this case it's a navi23 (so radeon in the marketing sense).
>
> Thanks, couldn't find that in the mail thread.
>
> In that case those are the already known problems with the scheduler
> changes, aren't they?

Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Maybe I'm
misunderstanding what the original report was actually testing.  If it
was 6.7, then try reverting:
56e449603f0ac580700621a356d35d5716a62ce5
b70438004a14f4d0f9890b3297cd66248728546c

Alex

>
> Christian.
>
> >
> > Alex
> >
> >> Regards,
> >> Christian.
> >>
> >>> File the gitlab issue and we should poke amd a but more to take a loo=
k.
> >>>
> >>> Dave.
>
