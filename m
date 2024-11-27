Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A82210E6
	for <regressions@lists.linux.dev>; Wed, 27 Nov 2024 04:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732681052; cv=none; b=H7mwL3QoaOAarzwrWIk6DNiFvCy7fWvqh2HXin/B3uaZcF4ioTCAsqG+EqWMVpi/VyhSFvWDDMF42TL7yj/kPf39xCDt9TIU4RWSndvBEN1Pfq6xSIulzO4OjVJ60q6KhjOLe9vemCk2/DNGmG6G6C0wc2fq0mYlYY3fxvC2kgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732681052; c=relaxed/simple;
	bh=3XeU/4V/Sr4YWgBMd+JGTL2NUBHoyZBYkokHxbYNh0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eevpM1lkZNLilosEoSEu9D1Iw2sPQ6O//C6OQo6gGNEnUR4OsgP7Q2Y4ZSn1rqvtXsVQY/6442ot412XCAeWXnmeH5y5KePdmokZhYDuBqczq3mc6WIm+tpCvfFApiuQ3tTNxp5hFagd5YxK9HFvOL3V69q5YHSyMMWyxcu8cmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=UUc1k0M8; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="UUc1k0M8"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e38c1ac8e3cso389893276.0
        for <regressions@lists.linux.dev>; Tue, 26 Nov 2024 20:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1732681049; x=1733285849; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hm7ENvoP6HhdoXpahiQX6CDXmuqD55Pzj7gK8dROaY0=;
        b=UUc1k0M8qDlyiw3zbsvD3tiYn2KCynZTf3xJYHS/y7LmTlDIVnAqWsEQzXGeMC23zg
         iPq8RwCr9NRcq996SY0h5y++xxa4rIDuG9TTYhM2IA5JG6VSQsiRmI31nozGQKhH4aH8
         u+VdkDzQ4ECYjewuxNU6NSlGOHQ0ZjwCqiIfPkN7ENd945+Y7gratyYKiyZg8HPySLPp
         YaPajapt+0kOQBR7nO7D+47ysIFW1uH5wG/+y8hsJTiP56yX/Vgs4D8+L4Nb3wb+7RD1
         D0sxJP1T7UQYGJsNZX8a3DImn0CVsP1xuwLYoanSBb6yGFEUSvUXW9wNShxu/aJQhr5u
         +Onw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732681049; x=1733285849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hm7ENvoP6HhdoXpahiQX6CDXmuqD55Pzj7gK8dROaY0=;
        b=WKT1J4/OjnPj91vxWIOWgQCJP3BCT89k77czo2QvciN030dmk7MbryGAJ6I/2zQNet
         XBw9haQ1FyfacNWeFOP/fP/+Ab3LxBjEorYDOYDT6PJ9o7fqI6lWy3wYlIzT5cC72/ZQ
         5HvhIdqNaEC+CvnHdK1KkEqeleiHT7lkLpnYHL/yQQxxpvs8eibNsbQMHHiWdodSt3Ek
         PvS8aV61SnzXQy0Ayc7YjsRTvppLbCD5gcNfDU500TmrxBb8XRRrvgE5VBBy6G5D1/n0
         ueiKJCc0NY6+jDm6LjDFupngURBBvMo4uSXAOR9XBdXQFiqcPFN3LV1HgE2Eafoe+D7T
         dbCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE0AuwSff6vVc21OnMJd51rTodhiBVtvXxSxvg1DjH+AKRm2VTFcl54CqzURQV3m8C8QsIShDRO4sf+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFv6Wlse8cEzQqRuwJbqPurcrK4JtCQk4ugmNWwGlcU7wS4dqv
	O33/blQ34wVcF+06d6NUDvwWJcArv+2wMJM54EZR5dXrhVFlYET24nQcgsGmnD3rVwXqdM0Igl3
	LZs7+mBgq1lL2ptRX2/AoRu5rahP2POnjdLsX
X-Gm-Gg: ASbGncsvUvz5lUVN6OAPtEjKGKMKY/q+JTCUM2QvjHeqmqQUjl+CsBbbb96TzEmGLr/
	sVskj6F4+BSsDpRL1pl+YB0Iqy+9fUQ==
X-Google-Smtp-Source: AGHT+IGXltr9ckprSIGJ0zk8EcAJ0ecH4ajUfDHmT84fEIG+PhA0s/gKfL7agqnI0QojZ8X6EzqtwtUPYNqjUQ4yOIw=
X-Received: by 2002:a05:6902:1505:b0:e2b:b9bf:f248 with SMTP id
 3f1490d57ef6-e395af39d32mr1792887276.24.1732681049420; Tue, 26 Nov 2024
 20:17:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv_Y2tzs+uYhMGtfUK9dSYV2mFr6WyKEzJazDsdk9o5zw@mail.gmail.com>
 <20241101095620.2526421-1-aliceryhl@google.com> <CAHC9VhS5wLQeF4LX67UgUYVG3oViA7CmSZS_kugH+M5J0XS2Vg@mail.gmail.com>
 <CAHC9VhTKzXPja5mLHmqOoTiDm1K8k=vtK+x9Hfa6t-7hpMmwag@mail.gmail.com>
In-Reply-To: <CAHC9VhTKzXPja5mLHmqOoTiDm1K8k=vtK+x9Hfa6t-7hpMmwag@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 26 Nov 2024 23:17:18 -0500
Message-ID: <CAHC9VhS=gqq6JuXsvzhsX2qEbDyxsvU_5cmx5dZF17kfb_bpsQ@mail.gmail.com>
Subject: Re: [PATCH] rust: lsm: replace context+len with lsm_context
To: Alice Ryhl <aliceryhl@google.com>
Cc: naresh.kamboju@linaro.org, casey@schaufler-ca.com, 
	anders.roxell@linaro.org, arnd@arndb.de, brauner@kernel.org, 
	dan.carpenter@linaro.org, kees@kernel.org, linux-kernel@vger.kernel.org, 
	lkft-triage@lists.linaro.org, ojeda@kernel.org, regressions@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-security-module@vger.kernel.org, 
	lkft@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 1:02=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
> On Fri, Nov 1, 2024 at 12:56=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Fri, Nov 1, 2024 at 5:56=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> > >
> > > This brings the Rust SecurityCtx abstraction [1] up to date with the =
new
> > > API where context+len is replaced with an lsm_context [2] struct.
> > >
> > > Link: https://lore.kernel.org/r/20240915-alice-file-v10-5-88484f7a3dc=
f@google.com [1]
> > > Link: https://lore.kernel.org/r/20241023212158.18718-3-casey@schaufle=
r-ca.com [2]
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > > Closes: https://lore.kernel.org/r/CA+G9fYv_Y2tzs+uYhMGtfUK9dSYV2mFr6W=
yKEzJazDsdk9o5zw@mail.gmail.com
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > >  rust/helpers/security.c |  8 ++++----
> > >  rust/kernel/security.rs | 38 +++++++++++++++++---------------------
> > >  2 files changed, 21 insertions(+), 25 deletions(-)
> >
> > Thanks Alice.  Would you like me to pull this in via the LSM tree with
> > the associated LSM changes, or would you prefer to do this some other
> > way?
> >
> > I'm going to merge this into lsm/dev for now so that we fix the issue
> > in linux-next, but I'm happy to drop it or do something else, let me
> > know.
>
> Nevermind, no I'm not, as I don't have the LSM/security rust helpers
> in the LSM tree as it looks like those aren't in Linus' tree yet.

With all of the dependencies now in Linus' tree, I'm going to merge
this into lsm/dev-staging so we can get some crude testing done.
Thanks again :)

--=20
paul-moore.com
