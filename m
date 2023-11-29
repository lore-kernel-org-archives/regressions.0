Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBA257304
	for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 20:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+7hx+Vz"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1fa37df6da8so71366fac.2
        for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 12:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701290969; x=1701895769; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uCwSK8iy7hq3osg12qE4HhNLJBHsTSSsnJBjaB7nWDA=;
        b=C+7hx+Vzw8b+i3fYCqGl0oUViuRmWVHVZ2hO8G+zZpGb+FokexioyuxbNcn6VnV2BE
         50SxJIh8OuQiezGfCk3KtLcFJGISDaPRL7CH0clCzNmE2eCfS+OQFa8In+YEcETwOf1E
         uJBA7rHG2SqrcP9C3kIQMHiumZ3zJ0SpUNgeNOtM6fx/CfzCqfOJeyjUlTDKaODH6xhT
         Vc1Ywgkq1NzwksxlyWD5jGnKw5bdwDI8ZRGRhliTL8MNWncztDmYucXdsWizgnXeka6b
         Q8WAEzBeKMtuE+RRCDWHlT69ljhxs9Z86ViYByKE/PzLVxIO5a/HKDoGiH47LldX19sw
         2ATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701290969; x=1701895769;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCwSK8iy7hq3osg12qE4HhNLJBHsTSSsnJBjaB7nWDA=;
        b=bB7z/xBEUKqgknox1TuRXZSVmrdJp0nYMXGz8JGZ0GVYeUzigVA+Q++Yxmg/q8uHqC
         u84w0mhasCPYnx9ChMj1H6+Nvmq72sxe7BUbOJuplModzX2ynAbNoS7/UCj9lb0OD3OU
         Gin2gwEVvGr2Aa+iQrrrlKein6Z+6Xk2Msmup1QrNxiGax7niMV/EtDMUglUzF5A3M52
         5hRRGL6lh1OrTn8DX7NAnCR7X0fjVvyrHO8xeHu/z2FdccjuID6PW/5gylIGQglITYX0
         hPYR+JvePyJlDUn6+xSLy5fgOeEZOfBxgP/EONTWyqqt57we4bmxf3BTUIA1lo+bgjih
         tZpA==
X-Gm-Message-State: AOJu0Yxkunyaj8IceZY2a3WH/W7TMoGYNreFQ8r/oqmlBp47PsM1Yh3j
	byX+XoXNLtZ0nRKCLKO82pJ2Z+mUsauTmsXGG/c=
X-Google-Smtp-Source: AGHT+IHyw8cAX9UfK9a8fY501yC2wNYtr22mgVoI8sSdazvxSzWX4/ffV64sBqiXIbZ1QzuNOcv1vH6FSPHW3piU2iY=
X-Received: by 2002:a05:6870:2328:b0:1f9:faa4:8bd6 with SMTP id
 w40-20020a056870232800b001f9faa48bd6mr21314446oao.17.1701290969390; Wed, 29
 Nov 2023 12:49:29 -0800 (PST)
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
In-Reply-To: <CADnq5_PgMxoW=4iabtgeHydwye-6DvwvCyETdfBToEpuYWocmA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Nov 2023 15:49:17 -0500
Message-ID: <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: Luben Tuikov <ltuikov89@gmail.com>
Cc: Phillip Susi <phill@thesusis.net>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	linux-kernel@vger.kernel.org, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Danilo Krummrich <dakr@redhat.com>
Content-Type: multipart/mixed; boundary="000000000000e4307b060b50ab61"

--000000000000e4307b060b50ab61
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 3:10=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> Actually I think I see the problem.  I'll try and send out a patch
> later today to test.

Does the attached patch fix it?

Alex

>
> Alex
>
> On Wed, Nov 29, 2023 at 1:52=E2=80=AFPM Alex Deucher <alexdeucher@gmail.c=
om> wrote:
> >
> > On Wed, Nov 29, 2023 at 11:41=E2=80=AFAM Luben Tuikov <ltuikov89@gmail.=
com> wrote:
> > >
> > > On 2023-11-29 10:22, Alex Deucher wrote:
> > > > On Wed, Nov 29, 2023 at 8:50=E2=80=AFAM Alex Deucher <alexdeucher@g=
mail.com> wrote:
> > > >>
> > > >> On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89@g=
mail.com> wrote:
> > > >>>
> > > >>> On 2023-11-28 17:13, Alex Deucher wrote:
> > > >>>> On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@thes=
usis.net> wrote:
> > > >>>>>
> > > >>>>> Alex Deucher <alexdeucher@gmail.com> writes:
> > > >>>>>
> > > >>>>>>> In that case those are the already known problems with the sc=
heduler
> > > >>>>>>> changes, aren't they?
> > > >>>>>>
> > > >>>>>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Mayb=
e I'm
> > > >>>>>> misunderstanding what the original report was actually testing=
.  If it
> > > >>>>>> was 6.7, then try reverting:
> > > >>>>>> 56e449603f0ac580700621a356d35d5716a62ce5
> > > >>>>>> b70438004a14f4d0f9890b3297cd66248728546c
> > > >>>>>
> > > >>>>> At some point it was suggested that I file a gitlab issue, but =
I took
> > > >>>>> this to mean it was already known and being worked on.  -rc3 ca=
me out
> > > >>>>> today and still has the problem.  Is there a known issue I coul=
d track?
> > > >>>>>
> > > >>>>
> > > >>>> At this point, unless there are any objections, I think we shoul=
d just
> > > >>>> revert the two patches
> > > >>> Uhm, no.
> > > >>>
> > > >>> Why "the two" patches?
> > > >>>
> > > >>> This email, part of this thread,
> > > >>>
> > > >>> https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
> > > >>>
> > > >>> clearly states that reverting *only* this commit,
> > > >>> 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable n=
umber of run-queues
> > > >>> *does not* mitigate the failed suspend. (Furthermore, this commit=
 doesn't really change
> > > >>> anything operational, other than using an allocated array, instea=
d of a static one, in DRM,
> > > >>> while the 2nd patch is solely contained within the amdgpu driver =
code.)
> > > >>>
> > > >>> Leaving us with only this change,
> > > >>> b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
> > > >>> to be at fault, as the kernel log attached in the linked email ab=
ove shows.
> > > >>>
> > > >>> The conclusion is that only b70438004a14f4 needs reverting.
> > > >>
> > > >> b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a14=
f4,
> > > >> 56e449603f0ac5 breaks amdgpu.
> > > >
> > > > We can try and re-enable it in the next kernel.  I'm just not sure
> > > > we'll be able to fix this in time for 6.7 with the holidays and all
> > > > and I don't want to cause a lot of scheduler churn at the end of th=
e
> > > > 6.7 cycle if we hold off and try and fix it.  Reverting seems like =
the
> > > > best short term solution.
> > >
> > > A lot of subsequent code has come in since commit 56e449603f0ac5, as =
it opened
> > > the opportunity for a 1-to-1 relationship between an entity and a sch=
eduler.
> > > (Should've always been the case, from the outset. Not sure why it was=
 coded as
> > > a fixed-size array.)
> > >
> > > Given that commit 56e449603f0ac5 has nothing to do with amdgpu, and t=
he problem
> > > is wholly contained in amdgpu, and no other driver has this problem, =
there is
> > > no reason to have to "churn", i.e. go back and forth in DRM, only to =
cover up
> > > an init bug in amdgpu. See the response I just sent in @this thread:
> > > https://lore.kernel.org/r/05007cb0-871e-4dc7-af58-1351f4ba43e2@gmail.=
com
> > >
> > > And it's not like this issue is unknown. I first posted about it on 2=
023-10-16.
> > >
> > > Ideally, amdgpu would just fix their init code.
> >
> > You can't make changes to core code that break other drivers.
> > Arguably 56e449603f0ac5 should not have gone in in the first place if
> > it broke amdgpu.  b70438004a14f4 was the code to fix amdgpu's init
> > code, but as a side effect it seems to have broken suspend for some
> > users.
> >
> > Alex

--000000000000e4307b060b50ab61
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-fix-buffer-funcs-setting-order-on-suspend.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-fix-buffer-funcs-setting-order-on-suspend.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lpk8pifj0>
X-Attachment-Id: f_lpk8pifj0

RnJvbSA5NmU3NWI1MjE4ZjdhMTI0ZWFmYTUzODUzNjgxZWVmOGZlNTY3YWI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFdlZCwgMjkgTm92IDIwMjMgMTU6NDQ6MjUgLTA1MDAKU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kZ3B1OiBmaXggYnVmZmVyIGZ1bmNzIHNldHRpbmcgb3JkZXIgb24gc3VzcGVuZAoK
V2UgbmVlZCB0byBtYWtlIGRpc2FibGUgdGhpcyBhZnRlciB0aGUgbGFzdCBldmljdGlvbgpjYWxs
LCBidXQgYmVmb3JlIHdlIGRpc2FibGUgdGhlIFNETUEgSVAuCgpGaXhlczogYjcwNDM4MDA0YTE0
ICgiZHJtL2FtZGdwdTogbW92ZSBidWZmZXIgZnVuY3Mgc2V0dGluZyB1cCBhIGxldmVsIikKTGlu
azogaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvYW1kLWdmeC8yMDIzLU5v
dmVtYmVyLzEwMTE5Ny5odG1sClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KQ2M6IFBoaWxsaXAgU3VzaSA8cGhpbGxAdGhlc3VzaXMubmV0PgpD
YzogTHViZW4gVHVpa292IDxsdHVpa292ODlAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMKaW5kZXggYjVlZGY0MGI1ZDAzLi43ODU1M2UwMjdkYjQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTQ1MzEsOCArNDUz
MSw2IEBAIGludCBhbWRncHVfZGV2aWNlX3N1c3BlbmQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
Ym9vbCBmYmNvbikKIAogCWFtZGdwdV9yYXNfc3VzcGVuZChhZGV2KTsKIAotCWFtZGdwdV90dG1f
c2V0X2J1ZmZlcl9mdW5jc19zdGF0dXMoYWRldiwgZmFsc2UpOwotCiAJYW1kZ3B1X2RldmljZV9p
cF9zdXNwZW5kX3BoYXNlMShhZGV2KTsKIAogCWlmICghYWRldi0+aW5fczBpeCkKQEAgLTQ1NDIs
NiArNDU0MCw4IEBAIGludCBhbWRncHVfZGV2aWNlX3N1c3BlbmQoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgYm9vbCBmYmNvbikKIAlpZiAocikKIAkJcmV0dXJuIHI7CiAKKwlhbWRncHVfdHRtX3Nl
dF9idWZmZXJfZnVuY3Nfc3RhdHVzKGFkZXYsIGZhbHNlKTsKKwogCWFtZGdwdV9mZW5jZV9kcml2
ZXJfaHdfZmluaShhZGV2KTsKIAogCWFtZGdwdV9kZXZpY2VfaXBfc3VzcGVuZF9waGFzZTIoYWRl
dik7Ci0tIAoyLjQyLjAKCg==
--000000000000e4307b060b50ab61--
