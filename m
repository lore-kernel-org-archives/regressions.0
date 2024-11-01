Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DE31CC8AF
	for <regressions@lists.linux.dev>; Fri,  1 Nov 2024 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730483970; cv=none; b=X58GL/OZS5rS1pL+TvEaJexPgz1uZ6jkkz9JFgT3wL1ePj+drLvLKzLSFjW7Ypn+OO2WZsFtjTE0FWf8+eMV99LYyP/GO65UVOL+sL8+sHZ3obgGMW8IUvEDHhvub3p0Ii0RNu68HYJeF4L44Kh+bekj6Wc8KbTGrMbfiCcKIf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730483970; c=relaxed/simple;
	bh=UbgaeArJxEeaLS8DCoPVLztbE9TSjYcjzodPBB5CarA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7C9Zhc/SBk6/g0xOKw0S5I8f0auvBdF/p1TFZBNCE4kovUK9WbUKsVjMdTpfC3TKlmxrtKdVV0WWq3/FlBvau1GSbj36mokdjlf3PGQ5Op0BF3kzsVIdOLKZ1TgI5r0/3UNxrSRo3vdiAWauNK5dXfRwaHgpfUvqxDfWYwZqcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=QpOFTg7j; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="QpOFTg7j"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e28fea0f5b8so2046493276.1
        for <regressions@lists.linux.dev>; Fri, 01 Nov 2024 10:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1730483967; x=1731088767; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHFTRHafBa+64JSQGkZJwqdhjQhl87yn+cc0CQ/Umeo=;
        b=QpOFTg7jegHuHRft5fl6/B2V1W7lVIT7HeQfoONrJHOStsCc9GyL2y5uKgyPWFKsHp
         saqVpIoKL75F/NIncwDogyWoTO8AT49B0rJUKb1zIlFmPg16cC1gnjBtI2mzDcajJYvp
         bBTWRcLucEk4XUgDyD4ijOp0lXezJvq/X8HE521j076ciJeMkmMHbqlYk+c/SNvuNiUq
         rIgrl3BYgqHu2clpcuVgVqsGZJXPzmSZUHcJQRaXWBWLtP61p+HZXSt3UtyAuEK+pbjt
         SLGGzm1RLkqavYPQegwvAGCt36itJFJEEvKxP5lWjcSlCeVT886JTOmPM4w03frkl3md
         QevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730483967; x=1731088767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHFTRHafBa+64JSQGkZJwqdhjQhl87yn+cc0CQ/Umeo=;
        b=JTETmOdz1bAvyjnaPKp0bdj+yxQg7MEcCMFKT7PnynyCWZd29OPtaQjQTzvtGE/rH7
         lZtFI062htDStDRSo13FH9BLwQL+0RDnIhvnQAo5woj2QCxTTSxWKIuB94K2WoSQAcjc
         PFYoF/8660LzYKmD1u+PZI2+wUACyYDn2PSqz4Rq494+uXSduSMnnuAe4tFaYB0lv2Nm
         /bYoCS1K3UpEbumxthzKg5f1DUymq+K5pDfFfqOwjeUNYWabIv+InJ4eXp230Jr9Xxj+
         eHm8LLBJeDSwFolpsiyklCTpeijp+9isQB8XxLlc4GsfQUvD8aRVVgKR6TE09yiAZp2s
         kKmA==
X-Forwarded-Encrypted: i=1; AJvYcCVI4mAJTuccLgFemdm/b2K/Pj7IIPfE4c2vbVVpuqo8XfC8lKs/2S+h8UYgX0XpoJcsHJv5SHJLHbDlqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtPs3Uk7a4q0hVE/+k/HavRYRDZBjPzy0s5G5R1nV00cUqwNpz
	2uQDpMDIEDcydB7cJHnm++fNrspk3pkGHVVR3IvSRjGzk1QzhslxxZpUNp8EbS3D316G4dX4t0Y
	HzvYG7IkY71mVFFLxzumE08cFhk1HYq1CLj7y
X-Google-Smtp-Source: AGHT+IEYCapNRD7ztbrSnudiiod9EpcctaQvgweIgnYm1vysGZdSjWf1HTc6ccTjHniL5WPjg92cjXpUQU0GOISoNXs=
X-Received: by 2002:a05:6902:2505:b0:e2b:e0ba:d50 with SMTP id
 3f1490d57ef6-e3087a48a2emr20973638276.5.1730483967029; Fri, 01 Nov 2024
 10:59:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv_Y2tzs+uYhMGtfUK9dSYV2mFr6WyKEzJazDsdk9o5zw@mail.gmail.com>
 <20241101095620.2526421-1-aliceryhl@google.com> <CAHC9VhS5wLQeF4LX67UgUYVG3oViA7CmSZS_kugH+M5J0XS2Vg@mail.gmail.com>
 <CANiq72kcvpEqpwFTNFmxfJsfBMeBNiDrrvFBf_iS7+ozaECJzw@mail.gmail.com>
 <CAHC9VhTQMo11s7mWg=zzDusJompOp01uJat-q9HjQCoEWzHRRQ@mail.gmail.com> <CAH5fLgi+JJHCA_XTPC0-kaacZC6=aGSa-+DiNt06GSJNFhKc3w@mail.gmail.com>
In-Reply-To: <CAH5fLgi+JJHCA_XTPC0-kaacZC6=aGSa-+DiNt06GSJNFhKc3w@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 1 Nov 2024 13:59:16 -0400
Message-ID: <CAHC9VhSv+ro9gOzanvPS1gZwLkqO7ZoZk7SOZ64FP+-sdmYs2Q@mail.gmail.com>
Subject: Re: [PATCH] rust: lsm: replace context+len with lsm_context
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, naresh.kamboju@linaro.org, 
	casey@schaufler-ca.com, anders.roxell@linaro.org, arnd@arndb.de, 
	brauner@kernel.org, dan.carpenter@linaro.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, ojeda@kernel.org, 
	regressions@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, lkft@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 1:24=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
> On Fri, Nov 1, 2024 at 6:11=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> > On Fri, Nov 1, 2024 at 1:04=E2=80=AFPM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > > On Fri, Nov 1, 2024 at 5:56=E2=80=AFPM Paul Moore <paul@paul-moore.co=
m> wrote:
> > > >
> > > > Thanks Alice.  Would you like me to pull this in via the LSM tree w=
ith
> > > > the associated LSM changes, or would you prefer to do this some oth=
er
> > > > way?
> > > >
> > > > I'm going to merge this into lsm/dev for now so that we fix the iss=
ue
> > > > in linux-next, but I'm happy to drop it or do something else, let m=
e
> > > > know.
> > >
> > > Christian has the VFS side, and both are needed for this -- do you
> > > mean you will cross-merge vfs' branch too?
> >
> > I think our last emails crossed paths.  I'm not going to merge this
> > via the LSM tree as we don't have the Rust security.c helpers.
> > Ideally it would have been better to have the Rust LSM/security
> > helpers in the LSM tree for reasons like this, but it looks like it's
> > too late for that now.
>
> If Christian is okay with rewriting the vfs.rust.file tree, we can
> drop commit 94d356c0335f ("rust: security: add abstraction for
> secctx") from there and I'll update it and send it for inclusion in
> the LSM tree instead. I'll need to drop the piece that ties together
> `struct cred` and `secctx` from the patch, but I can follow up with a
> small patch for that for the 6.14 merge window.

I can only guess at what Chrisitian wants to do, but my guess is that
he isn't going to be very excited about rewriting a VFS tree at this
stage ... which is very understandable as far as I'm concerned.

I wouldn't worry too much about this right now, I'm going to plan on
holding Casey's patchset in a staging area until after the upcoming
merge window.

--=20
paul-moore.com
