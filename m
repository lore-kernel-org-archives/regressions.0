Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1521A59143
	for <regressions@lists.linux.dev>; Thu, 30 Nov 2023 21:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUpFL7vb"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1efb9571b13so773012fac.2
        for <regressions@lists.linux.dev>; Thu, 30 Nov 2023 13:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701379811; x=1701984611; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AdLM7lBVKO5z85JUEsbZhnOFnXHXkAG5gRF28PcXpY=;
        b=eUpFL7vbV/EOlT1W+0R57qQ8XIxKFFY9VV5XniIszimrcVz7usZy/kbJBVgAos2rKt
         hOOcvYO354m6xglSA3VOZ4MYtpVZp+Saik3e7S28AP9EFcFOgGVfiemvrZkBRL6vAFLG
         p3PTAb4G7IIdOdoSWpVGQeyYTsa6WwGkt9Hv7YSm5WMJldRb8aed0ZKaiYMKD2+DKdya
         y4Y2/s+VXV7IkRl7N5Qk6x5BkPQlH3RZxkzGFMdQRi7FSY9Ttvt6gntH8N9+iaqnjOsu
         eaEHfS55TpmFqfrLtE/w+5aKakmIzHELMfNsVHIwmsKLmJRR+/fq2cU8DXwn01NyZf/z
         TVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701379811; x=1701984611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AdLM7lBVKO5z85JUEsbZhnOFnXHXkAG5gRF28PcXpY=;
        b=rPe4KeYP2SuMjdIQqn4l5MCqxtvkKBfBneWrZNSStVgbMsKBHfUKIl3f6FrO5nMmk2
         txxhHJ+3XU9mzlu0cZspYPL/k71ia/zeN5tEgNSUUeLPHKIQYFN8pnBIoA/y+H2MXTJL
         0YbjwWgwgBFvodVLzawzpDAeCgGoDJLl3b8Rsxlz1yPNTRPczd39sjRZPWdawf+Y9ALz
         rWMRKjlxXvkpyv0f8s/+8h61hO3JPhBsJwLjzCKgff9rfAFc84/W/V6LKstI4d5bYiyU
         631veMTMCEvrO602gYKoFnmW8wU73AJUhfXX5ez1DG7ryG8n95BkTKxmNUBfVxh8gk8n
         8dsA==
X-Gm-Message-State: AOJu0YygkXy0YSxtkZ5p/RQZL9F5ogRqLAvRc31WtLY99l5wCOgb20OZ
	ELrLiZzUAfTDF0eL+ByUvR/qrV919ihoBLpIqkY=
X-Google-Smtp-Source: AGHT+IHRTBmBvngzFuhZ/hAvU/HjEpkJ6562bbm429mg+ZXfGWU9OhuYmYnadn/s6OrB7cxyCnXK4nnGzGZfGpj5Sms=
X-Received: by 2002:a05:6870:9a90:b0:1fa:82:3d69 with SMTP id
 hp16-20020a0568709a9000b001fa00823d69mr28555314oab.46.1701379811130; Thu, 30
 Nov 2023 13:30:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87edgv4x3i.fsf@vps.thesusis.net> <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com> <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com> <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
 <87jzq2ixtm.fsf@vps.thesusis.net> <CADnq5_Ou-MVVm0rdWDmDnJNLkWUayXzO26uCEtz3ucNa4Ghy2w@mail.gmail.com>
 <95fe9b5b-05ce-4462-9973-9aca306bc44f@gmail.com> <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>
 <CADnq5_OC=JFpGcN0oGbTF5xYEt4X3r0=jEY6hJ12W8CzYq1+cA@mail.gmail.com>
 <9595b8bf-e64d-4926-9263-97e18bcd7d05@gmail.com> <CADnq5_N6DF-huOzgaVygvS5N_j_oNUEC1aa4zRsZTzx8GOD_aw@mail.gmail.com>
 <CADnq5_PgMxoW=4iabtgeHydwye-6DvwvCyETdfBToEpuYWocmA@mail.gmail.com>
 <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com> <05a4dec0-1c07-4a64-9439-e2c306807ded@gmail.com>
In-Reply-To: <05a4dec0-1c07-4a64-9439-e2c306807ded@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Nov 2023 16:29:59 -0500
Message-ID: <CADnq5_M6PtLPHxd7kaS6Rtkun5G2wNMs6aZ84pj58wniZ8Smsg@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: Luben Tuikov <ltuikov89@gmail.com>
Cc: Phillip Susi <phill@thesusis.net>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	linux-kernel@vger.kernel.org, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Danilo Krummrich <dakr@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 10:36=E2=80=AFPM Luben Tuikov <ltuikov89@gmail.com>=
 wrote:
>
> On 2023-11-29 15:49, Alex Deucher wrote:
> > On Wed, Nov 29, 2023 at 3:10=E2=80=AFPM Alex Deucher <alexdeucher@gmail=
.com> wrote:
> >>
> >> Actually I think I see the problem.  I'll try and send out a patch
> >> later today to test.
> >
> > Does the attached patch fix it?
>
> Thanks for the patch, Alex.
>
> Is it possible for AMD to also reproduce this issue and test this patch o=
n a Navi23 system?

I haven't had a chance to dig into it much due to LPC and thanksgiving
and other end of year stuff.

>
> > From 96e75b5218f7a124eafa53853681eef8fe567ab8 Mon Sep 17 00:00:00 2001
> > From: Alex Deucher <alexander.deucher@amd.com>
> > Date: Wed, 29 Nov 2023 15:44:25 -0500
> > Subject: [PATCH] drm/amdgpu: fix buffer funcs setting order on suspend
> >
> > We need to make disable this after the last eviction
>
> "make disable" --> "disable"
>
> > call, but before we disable the SDMA IP.
> >
> > Fixes: b70438004a14 ("drm/amdgpu: move buffer funcs setting up a level"=
)
> > Link: https://lists.freedesktop.org/archives/amd-gfx/2023-November/1011=
97.html
>
> Link: https://lore.kernel.org/r/87edgv4x3i.fsf@vps.thesusis.net
>
> Let's link the start of the thread.

Thanks, I will update the patch.

Alex

>
> Regards,
> Luben
>
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Phillip Susi <phill@thesusis.net>
> > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_device.c
> > index b5edf40b5d03..78553e027db4 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -4531,8 +4531,6 @@ int amdgpu_device_suspend(struct drm_device *dev,=
 bool fbcon)
> >
> >       amdgpu_ras_suspend(adev);
> >
> > -     amdgpu_ttm_set_buffer_funcs_status(adev, false);
> > -
> >       amdgpu_device_ip_suspend_phase1(adev);
> >
> >       if (!adev->in_s0ix)
> > @@ -4542,6 +4540,8 @@ int amdgpu_device_suspend(struct drm_device *dev,=
 bool fbcon)
> >       if (r)
> >               return r;
> >
> > +     amdgpu_ttm_set_buffer_funcs_status(adev, false);
> > +
> >       amdgpu_fence_driver_hw_fini(adev);
> >
> >       amdgpu_device_ip_suspend_phase2(adev);
>
> >
> > Alex
> >
> >>
> >> Alex
> >>
> >> On Wed, Nov 29, 2023 at 1:52=E2=80=AFPM Alex Deucher <alexdeucher@gmai=
l.com> wrote:
> >>>
> >>> On Wed, Nov 29, 2023 at 11:41=E2=80=AFAM Luben Tuikov <ltuikov89@gmai=
l.com> wrote:
> >>>>
> >>>> On 2023-11-29 10:22, Alex Deucher wrote:
> >>>>> On Wed, Nov 29, 2023 at 8:50=E2=80=AFAM Alex Deucher <alexdeucher@g=
mail.com> wrote:
> >>>>>>
> >>>>>> On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89@g=
mail.com> wrote:
> >>>>>>>
> >>>>>>> On 2023-11-28 17:13, Alex Deucher wrote:
> >>>>>>>> On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@thes=
usis.net> wrote:
> >>>>>>>>>
> >>>>>>>>> Alex Deucher <alexdeucher@gmail.com> writes:
> >>>>>>>>>
> >>>>>>>>>>> In that case those are the already known problems with the sc=
heduler
> >>>>>>>>>>> changes, aren't they?
> >>>>>>>>>>
> >>>>>>>>>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Mayb=
e I'm
> >>>>>>>>>> misunderstanding what the original report was actually testing=
.  If it
> >>>>>>>>>> was 6.7, then try reverting:
> >>>>>>>>>> 56e449603f0ac580700621a356d35d5716a62ce5
> >>>>>>>>>> b70438004a14f4d0f9890b3297cd66248728546c
> >>>>>>>>>
> >>>>>>>>> At some point it was suggested that I file a gitlab issue, but =
I took
> >>>>>>>>> this to mean it was already known and being worked on.  -rc3 ca=
me out
> >>>>>>>>> today and still has the problem.  Is there a known issue I coul=
d track?
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> At this point, unless there are any objections, I think we shoul=
d just
> >>>>>>>> revert the two patches
> >>>>>>> Uhm, no.
> >>>>>>>
> >>>>>>> Why "the two" patches?
> >>>>>>>
> >>>>>>> This email, part of this thread,
> >>>>>>>
> >>>>>>> https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
> >>>>>>>
> >>>>>>> clearly states that reverting *only* this commit,
> >>>>>>> 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable n=
umber of run-queues
> >>>>>>> *does not* mitigate the failed suspend. (Furthermore, this commit=
 doesn't really change
> >>>>>>> anything operational, other than using an allocated array, instea=
d of a static one, in DRM,
> >>>>>>> while the 2nd patch is solely contained within the amdgpu driver =
code.)
> >>>>>>>
> >>>>>>> Leaving us with only this change,
> >>>>>>> b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
> >>>>>>> to be at fault, as the kernel log attached in the linked email ab=
ove shows.
> >>>>>>>
> >>>>>>> The conclusion is that only b70438004a14f4 needs reverting.
> >>>>>>
> >>>>>> b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a14=
f4,
> >>>>>> 56e449603f0ac5 breaks amdgpu.
> >>>>>
> >>>>> We can try and re-enable it in the next kernel.  I'm just not sure
> >>>>> we'll be able to fix this in time for 6.7 with the holidays and all
> >>>>> and I don't want to cause a lot of scheduler churn at the end of th=
e
> >>>>> 6.7 cycle if we hold off and try and fix it.  Reverting seems like =
the
> >>>>> best short term solution.
> >>>>
> >>>> A lot of subsequent code has come in since commit 56e449603f0ac5, as=
 it opened
> >>>> the opportunity for a 1-to-1 relationship between an entity and a sc=
heduler.
> >>>> (Should've always been the case, from the outset. Not sure why it wa=
s coded as
> >>>> a fixed-size array.)
> >>>>
> >>>> Given that commit 56e449603f0ac5 has nothing to do with amdgpu, and =
the problem
> >>>> is wholly contained in amdgpu, and no other driver has this problem,=
 there is
> >>>> no reason to have to "churn", i.e. go back and forth in DRM, only to=
 cover up
> >>>> an init bug in amdgpu. See the response I just sent in @this thread:
> >>>> https://lore.kernel.org/r/05007cb0-871e-4dc7-af58-1351f4ba43e2@gmail=
.com
> >>>>
> >>>> And it's not like this issue is unknown. I first posted about it on =
2023-10-16.
> >>>>
> >>>> Ideally, amdgpu would just fix their init code.
> >>>
> >>> You can't make changes to core code that break other drivers.
> >>> Arguably 56e449603f0ac5 should not have gone in in the first place if
> >>> it broke amdgpu.  b70438004a14f4 was the code to fix amdgpu's init
> >>> code, but as a side effect it seems to have broken suspend for some
> >>> users.
> >>>
> >>> Alex
