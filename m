Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977B65E0D4
	for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 20:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WV6Plh22"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1fa37df6da8so48672fac.2
        for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 12:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701288625; x=1701893425; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kY1GN59hmbEJaNOpwQAxi652Fp3hiuaW7jARiW8zew8=;
        b=WV6Plh22P5mLXVuBo2yCUP4VFmm99DnG259BWoA4jij0l7j1POuUEAoewhlDgWXO7p
         8ERHlS3Az5n1pAFCA5vdiQ1auxJBrp+YPpk0k3nTRugLFISf5+1mEi6VwtFqHn2z7Kcz
         UK7ia9Ibk4qqY7au75UK5kGJ6AZdodHdclj86S3I+pR56FwdmTewT/BIP9yMfpFI7Akx
         TXR29VVNZ1bz3y9C2RKfsGaKEhF+xacVEQbBtppFKjfCoLwiG9divvx5SAUnKzOx3OF1
         okjRdetFJJAtpHa1cbo3f3mTQDaTpbZuuReSRN6bOLraTGGmLsA0Zwti7kisTgxTcmZr
         5/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701288625; x=1701893425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kY1GN59hmbEJaNOpwQAxi652Fp3hiuaW7jARiW8zew8=;
        b=AXXRHtUWIP9tq8TyNh2gqFaXw6i3XC+QJ7HUBAlKhDyh+TZGMbMjPu3N1uLM2PDrpF
         jk8k01bWSV9GZoOfG4IMVYuevYjUGl4CIsB1fs+sNOHGl9PkBcdNzGkWa3xm/fYX4JFY
         4cm0MJQTG30HTBarWzV5x4NIfptBSkKBXqrw69552je2Q+ukBvAHQ3JZESkg90vbOksd
         khRr89jQPWM1xGStqsn2ALDfZmondNsczD72OKYAevHhAy7QEJ4UxRPeHvDHKU9siBbv
         9xCkvhQAvhcgS+IRue4cYHpZTK3TkOIwug02oJDhh9fRe7/kXaKySPjU32Ihi0km9Su5
         u1ZQ==
X-Gm-Message-State: AOJu0YzxwYQQIBcUVngzQcMtF0p2dQNIqZcOy3Ot4zzd/w1zUdbBOQYo
	lcqXK+tVXQl8sG64zxYW27Ftp6qNULWiJwPkGHU=
X-Google-Smtp-Source: AGHT+IFF/qP3ukLLaH5SkwRpcG5Rn/G/+5CcGHEnukHZQgqdbv6oOYgnqOot/gbgWz4i5R1mWdpkT+sWBSqNGDxsaho=
X-Received: by 2002:a05:6870:2248:b0:1fa:a6d4:3b10 with SMTP id
 j8-20020a056870224800b001faa6d43b10mr3117415oaf.50.1701288625588; Wed, 29 Nov
 2023 12:10:25 -0800 (PST)
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
In-Reply-To: <CADnq5_N6DF-huOzgaVygvS5N_j_oNUEC1aa4zRsZTzx8GOD_aw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Nov 2023 15:10:14 -0500
Message-ID: <CADnq5_PgMxoW=4iabtgeHydwye-6DvwvCyETdfBToEpuYWocmA@mail.gmail.com>
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

Actually I think I see the problem.  I'll try and send out a patch
later today to test.

Alex

On Wed, Nov 29, 2023 at 1:52=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Wed, Nov 29, 2023 at 11:41=E2=80=AFAM Luben Tuikov <ltuikov89@gmail.co=
m> wrote:
> >
> > On 2023-11-29 10:22, Alex Deucher wrote:
> > > On Wed, Nov 29, 2023 at 8:50=E2=80=AFAM Alex Deucher <alexdeucher@gma=
il.com> wrote:
> > >>
> > >> On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89@gma=
il.com> wrote:
> > >>>
> > >>> On 2023-11-28 17:13, Alex Deucher wrote:
> > >>>> On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@thesus=
is.net> wrote:
> > >>>>>
> > >>>>> Alex Deucher <alexdeucher@gmail.com> writes:
> > >>>>>
> > >>>>>>> In that case those are the already known problems with the sche=
duler
> > >>>>>>> changes, aren't they?
> > >>>>>>
> > >>>>>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Maybe =
I'm
> > >>>>>> misunderstanding what the original report was actually testing. =
 If it
> > >>>>>> was 6.7, then try reverting:
> > >>>>>> 56e449603f0ac580700621a356d35d5716a62ce5
> > >>>>>> b70438004a14f4d0f9890b3297cd66248728546c
> > >>>>>
> > >>>>> At some point it was suggested that I file a gitlab issue, but I =
took
> > >>>>> this to mean it was already known and being worked on.  -rc3 came=
 out
> > >>>>> today and still has the problem.  Is there a known issue I could =
track?
> > >>>>>
> > >>>>
> > >>>> At this point, unless there are any objections, I think we should =
just
> > >>>> revert the two patches
> > >>> Uhm, no.
> > >>>
> > >>> Why "the two" patches?
> > >>>
> > >>> This email, part of this thread,
> > >>>
> > >>> https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
> > >>>
> > >>> clearly states that reverting *only* this commit,
> > >>> 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable num=
ber of run-queues
> > >>> *does not* mitigate the failed suspend. (Furthermore, this commit d=
oesn't really change
> > >>> anything operational, other than using an allocated array, instead =
of a static one, in DRM,
> > >>> while the 2nd patch is solely contained within the amdgpu driver co=
de.)
> > >>>
> > >>> Leaving us with only this change,
> > >>> b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
> > >>> to be at fault, as the kernel log attached in the linked email abov=
e shows.
> > >>>
> > >>> The conclusion is that only b70438004a14f4 needs reverting.
> > >>
> > >> b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a14f4=
,
> > >> 56e449603f0ac5 breaks amdgpu.
> > >
> > > We can try and re-enable it in the next kernel.  I'm just not sure
> > > we'll be able to fix this in time for 6.7 with the holidays and all
> > > and I don't want to cause a lot of scheduler churn at the end of the
> > > 6.7 cycle if we hold off and try and fix it.  Reverting seems like th=
e
> > > best short term solution.
> >
> > A lot of subsequent code has come in since commit 56e449603f0ac5, as it=
 opened
> > the opportunity for a 1-to-1 relationship between an entity and a sched=
uler.
> > (Should've always been the case, from the outset. Not sure why it was c=
oded as
> > a fixed-size array.)
> >
> > Given that commit 56e449603f0ac5 has nothing to do with amdgpu, and the=
 problem
> > is wholly contained in amdgpu, and no other driver has this problem, th=
ere is
> > no reason to have to "churn", i.e. go back and forth in DRM, only to co=
ver up
> > an init bug in amdgpu. See the response I just sent in @this thread:
> > https://lore.kernel.org/r/05007cb0-871e-4dc7-af58-1351f4ba43e2@gmail.co=
m
> >
> > And it's not like this issue is unknown. I first posted about it on 202=
3-10-16.
> >
> > Ideally, amdgpu would just fix their init code.
>
> You can't make changes to core code that break other drivers.
> Arguably 56e449603f0ac5 should not have gone in in the first place if
> it broke amdgpu.  b70438004a14f4 was the code to fix amdgpu's init
> code, but as a side effect it seems to have broken suspend for some
> users.
>
> Alex
