Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178F237146
	for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 15:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDrC190x"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1fa289a35e7so2148431fac.1
        for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 07:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701271389; x=1701876189; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCUywg88tT8nR8OAzlEKxFmQomFdBEbseNCKYUwF6z0=;
        b=TDrC190xu3EYlG4ywtwxm5AtQh7B+OyPak/bkDEKO3TzUYvfTj27Ztd9KHw6uNLeu4
         3vZhErEPvQYQoH/62J0Np7CDoX7w0NIDCf5t1Cd9JXmVljDsCAp4sGsSWxiZJAT9jCEF
         WmgHrFUBZq4MmTTpAjTsMNPZ9/zcR1bdr2Z9LxiyFkIXu3MCNwSn3TP8l0vjJfx2hRQ7
         GdOrj9ALJ+IrdSLXIpav5YOFm8+tn8ETgn4qs0V3guZ2jDhJp+Tib5njn/6FMc5bUrUE
         1rU9stw/ki+bfir0FxXy1z/zqnexwJu1LzNbcQNtfayzzP/axQrX2ArN/S+rzkJ+hnG0
         knBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701271389; x=1701876189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCUywg88tT8nR8OAzlEKxFmQomFdBEbseNCKYUwF6z0=;
        b=L+zCkckMkqoJyraDROMojV+eNpkSe1nDvKXFrOD3JZTqkz7DbAPvrBNWGscdquOMgj
         Hd8XMkWkwfdTHdpY/HPehBrRemKTjS4kBp3WgHxC//ZS/1t9ZlXyAbRj2mGbDmE/RkS/
         Q05+9Sr9GLEhU0u5fyiES78SdwF+U1qNvnJTv/bDnVo0M2/pyKs6BzJkP2my9LncylYV
         a2r6uCHqeem0BK4rJ+lxhHJ2Um3PEpaOcFiiVmTczC45q+wa9otYyQChr7q6fEqZys/O
         jNYCGyO9fM8Odat9ZC0Ert7CvSyPwfKKkXVAH7z0RDdv5E8gNLhwYYOJ7mIRFVGmQSR1
         X/ZQ==
X-Gm-Message-State: AOJu0YzBwtN+WRDoMf9+5QTPdn46sdrWcQ4MCn7lna5NCm3OeBLUfCS/
	uZiLEWHsWggWVMjsnSeKKndt+ejiD5Wb0Wi3a2s=
X-Google-Smtp-Source: AGHT+IGbi8FXFb8iIYdiAjppd2yUdKIHbDEmAip93Ro7/8+qtzvhgxIyR0+q8J5YJuIzV7KOp/r4TqyhsH8NZT9HSAc=
X-Received: by 2002:a05:6870:c45:b0:1fa:345e:5e15 with SMTP id
 lf5-20020a0568700c4500b001fa345e5e15mr15412255oab.13.1701271389082; Wed, 29
 Nov 2023 07:23:09 -0800 (PST)
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
In-Reply-To: <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Nov 2023 10:22:57 -0500
Message-ID: <CADnq5_OC=JFpGcN0oGbTF5xYEt4X3r0=jEY6hJ12W8CzYq1+cA@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: Luben Tuikov <ltuikov89@gmail.com>
Cc: Phillip Susi <phill@thesusis.net>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	linux-kernel@vger.kernel.org, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 8:50=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89@gmail.co=
m> wrote:
> >
> > On 2023-11-28 17:13, Alex Deucher wrote:
> > > On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@thesusis.=
net> wrote:
> > >>
> > >> Alex Deucher <alexdeucher@gmail.com> writes:
> > >>
> > >>>> In that case those are the already known problems with the schedul=
er
> > >>>> changes, aren't they?
> > >>>
> > >>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Maybe I'm
> > >>> misunderstanding what the original report was actually testing.  If=
 it
> > >>> was 6.7, then try reverting:
> > >>> 56e449603f0ac580700621a356d35d5716a62ce5
> > >>> b70438004a14f4d0f9890b3297cd66248728546c
> > >>
> > >> At some point it was suggested that I file a gitlab issue, but I too=
k
> > >> this to mean it was already known and being worked on.  -rc3 came ou=
t
> > >> today and still has the problem.  Is there a known issue I could tra=
ck?
> > >>
> > >
> > > At this point, unless there are any objections, I think we should jus=
t
> > > revert the two patches
> > Uhm, no.
> >
> > Why "the two" patches?
> >
> > This email, part of this thread,
> >
> > https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
> >
> > clearly states that reverting *only* this commit,
> > 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable number =
of run-queues
> > *does not* mitigate the failed suspend. (Furthermore, this commit doesn=
't really change
> > anything operational, other than using an allocated array, instead of a=
 static one, in DRM,
> > while the 2nd patch is solely contained within the amdgpu driver code.)
> >
> > Leaving us with only this change,
> > b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
> > to be at fault, as the kernel log attached in the linked email above sh=
ows.
> >
> > The conclusion is that only b70438004a14f4 needs reverting.
>
> b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a14f4,
> 56e449603f0ac5 breaks amdgpu.

We can try and re-enable it in the next kernel.  I'm just not sure
we'll be able to fix this in time for 6.7 with the holidays and all
and I don't want to cause a lot of scheduler churn at the end of the
6.7 cycle if we hold off and try and fix it.  Reverting seems like the
best short term solution.

Alex

>
> Alex
