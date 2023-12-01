Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43C72D634
	for <regressions@lists.linux.dev>; Fri,  1 Dec 2023 16:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4zrsqZ2"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-58d98188dc0so1245018eaf.3
        for <regressions@lists.linux.dev>; Fri, 01 Dec 2023 08:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701449749; x=1702054549; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWhV56djU95aQfLVNm7Soh/hXtQRCsN2ft0VIHAER8A=;
        b=Y4zrsqZ2arDDlswdk7/vjv0quvsvn03lzGsys8vyBOTGo/HepXljgrOOVnLEsTWYVj
         +7Iq8L8paEBxPbYomKz9vncw6KmRKI0AaGaDLui7Akd7hHWl2R0C8eWJScTvLRiOA1ZI
         BKKObkf0izO2+bUu6jJume9Oyov52RV/1ZiOYrFP6uXKp88PwPFKekxN8uWcf5kEpfVM
         NVmwXGtxuX0EMBGvI4Eoe0V7flSTwiCSuufgUyrUuwSYCx18BHHXyAIQtLA3baiIQyOl
         Sh0Vi2UgD2vXQhg35YCxUGXHt7HEgBK0zDWiQc4SW9JyOq281sQuqsuxBI7ABK5GU0AX
         KQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701449749; x=1702054549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWhV56djU95aQfLVNm7Soh/hXtQRCsN2ft0VIHAER8A=;
        b=c2kNijtvv6diS0eFy6YMWSdtiIygXyc4ljDyhgAv13gHQvO1+Ck5SnS8X8uT4YX21c
         waPuwWsi4iLAHTja/gtrbPPFi22FSseDPHuavgUErxkpaA+xBRc0DFsnvT9HzU6FXuns
         hGBh9zhx4akCDjt5OIwi+gspqQ9TIN1jUxmf/hlAHTry+QLkHOM5XnHjMocQ2SUGpq/6
         vPWW5OdNP+0UE/5MpOdK7IyjQAky4ubn1xooC+wkXQuHF2O4g5toISeMrgYcPgJmvC90
         0UmlPHQml49yKLV6njHwONNGcoXrpyD4ESERhZlMqa0uoAdrL1pCULrC2ly4LiWzT1FK
         JPvg==
X-Gm-Message-State: AOJu0YyBsKRkbhjh3RdjXiOXX+3PSSTNMXAms4l2QnVAQ0FtjkP2Avay
	1iEiKT++XTdUlUmpILDVVxrfIt4FJBkd6ApVT34=
X-Google-Smtp-Source: AGHT+IFcxTbgF9xXKMxzTnObK/CQ9MvvfivvyKXOzVzXQNvJW4i8otQvmBPx8yuN1coi/2TEmdpNoBi0J9sKp8BZ7gk=
X-Received: by 2002:a05:6870:2182:b0:1f9:8f1b:86f7 with SMTP id
 l2-20020a056870218200b001f98f1b86f7mr29208291oae.42.1701449748697; Fri, 01
 Dec 2023 08:55:48 -0800 (PST)
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
 <CADnq5_PgMxoW=4iabtgeHydwye-6DvwvCyETdfBToEpuYWocmA@mail.gmail.com> <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com>
In-Reply-To: <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 1 Dec 2023 11:55:36 -0500
Message-ID: <CADnq5_Oy6RMyJ52TbsxVjZ=0p=wYJHduE4X8B3DiYnqHYJUAvw@mail.gmail.com>
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

Phillip,

Can you test this patch?  I was not able to repro the issue on the
navi2x card I had handy, but I think it should fix it.

Thanks,

Alex

On Wed, Nov 29, 2023 at 3:49=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Wed, Nov 29, 2023 at 3:10=E2=80=AFPM Alex Deucher <alexdeucher@gmail.c=
om> wrote:
> >
> > Actually I think I see the problem.  I'll try and send out a patch
> > later today to test.
>
> Does the attached patch fix it?
>
> Alex
>
> >
> > Alex
> >
> > On Wed, Nov 29, 2023 at 1:52=E2=80=AFPM Alex Deucher <alexdeucher@gmail=
.com> wrote:
> > >
> > > On Wed, Nov 29, 2023 at 11:41=E2=80=AFAM Luben Tuikov <ltuikov89@gmai=
l.com> wrote:
> > > >
> > > > On 2023-11-29 10:22, Alex Deucher wrote:
> > > > > On Wed, Nov 29, 2023 at 8:50=E2=80=AFAM Alex Deucher <alexdeucher=
@gmail.com> wrote:
> > > > >>
> > > > >> On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89=
@gmail.com> wrote:
> > > > >>>
> > > > >>> On 2023-11-28 17:13, Alex Deucher wrote:
> > > > >>>> On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@th=
esusis.net> wrote:
> > > > >>>>>
> > > > >>>>> Alex Deucher <alexdeucher@gmail.com> writes:
> > > > >>>>>
> > > > >>>>>>> In that case those are the already known problems with the =
scheduler
> > > > >>>>>>> changes, aren't they?
> > > > >>>>>>
> > > > >>>>>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Ma=
ybe I'm
> > > > >>>>>> misunderstanding what the original report was actually testi=
ng.  If it
> > > > >>>>>> was 6.7, then try reverting:
> > > > >>>>>> 56e449603f0ac580700621a356d35d5716a62ce5
> > > > >>>>>> b70438004a14f4d0f9890b3297cd66248728546c
> > > > >>>>>
> > > > >>>>> At some point it was suggested that I file a gitlab issue, bu=
t I took
> > > > >>>>> this to mean it was already known and being worked on.  -rc3 =
came out
> > > > >>>>> today and still has the problem.  Is there a known issue I co=
uld track?
> > > > >>>>>
> > > > >>>>
> > > > >>>> At this point, unless there are any objections, I think we sho=
uld just
> > > > >>>> revert the two patches
> > > > >>> Uhm, no.
> > > > >>>
> > > > >>> Why "the two" patches?
> > > > >>>
> > > > >>> This email, part of this thread,
> > > > >>>
> > > > >>> https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
> > > > >>>
> > > > >>> clearly states that reverting *only* this commit,
> > > > >>> 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable=
 number of run-queues
> > > > >>> *does not* mitigate the failed suspend. (Furthermore, this comm=
it doesn't really change
> > > > >>> anything operational, other than using an allocated array, inst=
ead of a static one, in DRM,
> > > > >>> while the 2nd patch is solely contained within the amdgpu drive=
r code.)
> > > > >>>
> > > > >>> Leaving us with only this change,
> > > > >>> b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
> > > > >>> to be at fault, as the kernel log attached in the linked email =
above shows.
> > > > >>>
> > > > >>> The conclusion is that only b70438004a14f4 needs reverting.
> > > > >>
> > > > >> b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a=
14f4,
> > > > >> 56e449603f0ac5 breaks amdgpu.
> > > > >
> > > > > We can try and re-enable it in the next kernel.  I'm just not sur=
e
> > > > > we'll be able to fix this in time for 6.7 with the holidays and a=
ll
> > > > > and I don't want to cause a lot of scheduler churn at the end of =
the
> > > > > 6.7 cycle if we hold off and try and fix it.  Reverting seems lik=
e the
> > > > > best short term solution.
> > > >
> > > > A lot of subsequent code has come in since commit 56e449603f0ac5, a=
s it opened
> > > > the opportunity for a 1-to-1 relationship between an entity and a s=
cheduler.
> > > > (Should've always been the case, from the outset. Not sure why it w=
as coded as
> > > > a fixed-size array.)
> > > >
> > > > Given that commit 56e449603f0ac5 has nothing to do with amdgpu, and=
 the problem
> > > > is wholly contained in amdgpu, and no other driver has this problem=
, there is
> > > > no reason to have to "churn", i.e. go back and forth in DRM, only t=
o cover up
> > > > an init bug in amdgpu. See the response I just sent in @this thread=
:
> > > > https://lore.kernel.org/r/05007cb0-871e-4dc7-af58-1351f4ba43e2@gmai=
l.com
> > > >
> > > > And it's not like this issue is unknown. I first posted about it on=
 2023-10-16.
> > > >
> > > > Ideally, amdgpu would just fix their init code.
> > >
> > > You can't make changes to core code that break other drivers.
> > > Arguably 56e449603f0ac5 should not have gone in in the first place if
> > > it broke amdgpu.  b70438004a14f4 was the code to fix amdgpu's init
> > > code, but as a side effect it seems to have broken suspend for some
> > > users.
> > >
> > > Alex
