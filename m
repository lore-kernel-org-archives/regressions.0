Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E5E13ADC
	for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 18:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgBLW3ni"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1eb39505ba4so11586fac.0
        for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 10:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701283958; x=1701888758; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKCMdliecR8K3FRKmMsgrRyyz7+kEtWPm4FIJ7dTiTY=;
        b=YgBLW3niCAl+FhP/6iUcgI1B5Z93E8Rsp011XKYgjbtLrYiK3yCdg7/BEg4i46pCD6
         vptAVbFmwZgUuQ0BORPxxiZfc1qqGy3/UDHALcav17Zh4WL4WCg62ZRGKq5ET/fJJuDZ
         evR5LKmiaUlnUFQFa4x+UxFHO/GnYk4x6PIiT/05CUcl3Oqtgz+NSChhb8CJMc5zr1W2
         GAwpvb4FLyU0Ewqrj0ZPjfGc+Y8S80V3qPkRR3e1O0rTzy1lWIGuBKWIEcb+sZ5YhEBZ
         /7WBDwK3KTplvVImEsgCtwpkQQdpRHH9beP2fpPhThr6Cs2+4iVlpa4nI1s8FVeHsO3F
         fELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701283958; x=1701888758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKCMdliecR8K3FRKmMsgrRyyz7+kEtWPm4FIJ7dTiTY=;
        b=ek54AwE4WoXrKEq9vi1lYTLYhH9L093+QqL/Yr1fY6oUJRBfRk+U0xZoB0ov4k47DJ
         iSrtuDE4bD4SgsdswuARduizBs6TIro4w5ARKfa0c0oX8OmOGbddvyIL7KObN4Y/ThT2
         X54hjFU0On9aFbZIlw8fR2TxxShgLGKmbKBUnD+yxqcJxVuuWY/04U1DhJqdQhvFknNo
         t6AwWw83yWfBA2EZA//eiJNGGxiu1MOVnty1yY9EfQN880PJ0Sxe49dRCaMrUB4qorOj
         uZu6dJVmSLKiZVwSi41yqycHjbzesGlAHAWJ6hRGAb0/MSwNqCwC/wpqjZSq5jobppuo
         ZCDA==
X-Gm-Message-State: AOJu0YxqxG1Xibk7tg7G0Rbcqrd+ObzgG1HJ1JTuhQIUSchWdJGm+A4h
	dtBvo4h9b/qMw1rG9vm2yAjN8Rrve3P9zoXvpF0=
X-Google-Smtp-Source: AGHT+IF3oOywhpirX3+AP8XTM3+9p+TwpPLHbDmBIZTRg15hZZxmdOFhzj4n/rOsFaUbFqEpr1x9fgbgQl7aRBPDypc=
X-Received: by 2002:a05:6870:7a09:b0:1e9:f0fe:6ba4 with SMTP id
 hf9-20020a0568707a0900b001e9f0fe6ba4mr28988964oab.11.1701283957735; Wed, 29
 Nov 2023 10:52:37 -0800 (PST)
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
 <CADnq5_OC=JFpGcN0oGbTF5xYEt4X3r0=jEY6hJ12W8CzYq1+cA@mail.gmail.com> <9595b8bf-e64d-4926-9263-97e18bcd7d05@gmail.com>
In-Reply-To: <9595b8bf-e64d-4926-9263-97e18bcd7d05@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Nov 2023 13:52:26 -0500
Message-ID: <CADnq5_N6DF-huOzgaVygvS5N_j_oNUEC1aa4zRsZTzx8GOD_aw@mail.gmail.com>
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

On Wed, Nov 29, 2023 at 11:41=E2=80=AFAM Luben Tuikov <ltuikov89@gmail.com>=
 wrote:
>
> On 2023-11-29 10:22, Alex Deucher wrote:
> > On Wed, Nov 29, 2023 at 8:50=E2=80=AFAM Alex Deucher <alexdeucher@gmail=
.com> wrote:
> >>
> >> On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89@gmail=
.com> wrote:
> >>>
> >>> On 2023-11-28 17:13, Alex Deucher wrote:
> >>>> On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@thesusis=
.net> wrote:
> >>>>>
> >>>>> Alex Deucher <alexdeucher@gmail.com> writes:
> >>>>>
> >>>>>>> In that case those are the already known problems with the schedu=
ler
> >>>>>>> changes, aren't they?
> >>>>>>
> >>>>>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Maybe I'=
m
> >>>>>> misunderstanding what the original report was actually testing.  I=
f it
> >>>>>> was 6.7, then try reverting:
> >>>>>> 56e449603f0ac580700621a356d35d5716a62ce5
> >>>>>> b70438004a14f4d0f9890b3297cd66248728546c
> >>>>>
> >>>>> At some point it was suggested that I file a gitlab issue, but I to=
ok
> >>>>> this to mean it was already known and being worked on.  -rc3 came o=
ut
> >>>>> today and still has the problem.  Is there a known issue I could tr=
ack?
> >>>>>
> >>>>
> >>>> At this point, unless there are any objections, I think we should ju=
st
> >>>> revert the two patches
> >>> Uhm, no.
> >>>
> >>> Why "the two" patches?
> >>>
> >>> This email, part of this thread,
> >>>
> >>> https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
> >>>
> >>> clearly states that reverting *only* this commit,
> >>> 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable numbe=
r of run-queues
> >>> *does not* mitigate the failed suspend. (Furthermore, this commit doe=
sn't really change
> >>> anything operational, other than using an allocated array, instead of=
 a static one, in DRM,
> >>> while the 2nd patch is solely contained within the amdgpu driver code=
.)
> >>>
> >>> Leaving us with only this change,
> >>> b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
> >>> to be at fault, as the kernel log attached in the linked email above =
shows.
> >>>
> >>> The conclusion is that only b70438004a14f4 needs reverting.
> >>
> >> b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a14f4,
> >> 56e449603f0ac5 breaks amdgpu.
> >
> > We can try and re-enable it in the next kernel.  I'm just not sure
> > we'll be able to fix this in time for 6.7 with the holidays and all
> > and I don't want to cause a lot of scheduler churn at the end of the
> > 6.7 cycle if we hold off and try and fix it.  Reverting seems like the
> > best short term solution.
>
> A lot of subsequent code has come in since commit 56e449603f0ac5, as it o=
pened
> the opportunity for a 1-to-1 relationship between an entity and a schedul=
er.
> (Should've always been the case, from the outset. Not sure why it was cod=
ed as
> a fixed-size array.)
>
> Given that commit 56e449603f0ac5 has nothing to do with amdgpu, and the p=
roblem
> is wholly contained in amdgpu, and no other driver has this problem, ther=
e is
> no reason to have to "churn", i.e. go back and forth in DRM, only to cove=
r up
> an init bug in amdgpu. See the response I just sent in @this thread:
> https://lore.kernel.org/r/05007cb0-871e-4dc7-af58-1351f4ba43e2@gmail.com
>
> And it's not like this issue is unknown. I first posted about it on 2023-=
10-16.
>
> Ideally, amdgpu would just fix their init code.

You can't make changes to core code that break other drivers.
Arguably 56e449603f0ac5 should not have gone in in the first place if
it broke amdgpu.  b70438004a14f4 was the code to fix amdgpu's init
code, but as a side effect it seems to have broken suspend for some
users.

Alex
