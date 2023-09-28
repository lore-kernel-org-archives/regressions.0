Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE87E38DF9
	for <regressions@lists.linux.dev>; Thu, 28 Sep 2023 15:20:40 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-65af726775eso46926916d6.0
        for <regressions@lists.linux.dev>; Thu, 28 Sep 2023 08:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695914440; x=1696519240; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AETJrlvFJ0cIdb5tq1g9p7AMJQG7QgUXqW2J3LTW7GM=;
        b=ewXXWYcUFkDQV5KWYJpkfpOF+qfn6Np4fEa3rjQ5vMtiqsecwsaNn+fFDPjGxNTd0W
         5heiQG8SaEif92sMU21E7KyxLkiECD1SJeT7gf4Q244kmwpcR+oaD3FwGGJDqHfVDCio
         U+OmPxLnrF6oKtHmgbGOrhk7UKdYWJiSohQrmhnaE1O8yO48SWYCwbJ612BjJupC1tDG
         a+kI5Il02PMZMGD5zQaMidhNOiFJ5dNeAWB1oOmPrHYEtMFy0ekGDYFlnL4pGwTcbfYe
         5nm4sRDqZ7RdJFa+43tHaqCAbpm8aj6s++JnlRi5c0w/BX7lWeDnWYV4TWFvYDjfbH/s
         riGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695914440; x=1696519240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AETJrlvFJ0cIdb5tq1g9p7AMJQG7QgUXqW2J3LTW7GM=;
        b=ArhqwxZzV3kEwA21ruCwQebHPE6kEMytTP94dp0miPtcQAaRpn09Dgsvm1UNSwXAOX
         VVYTjuV+blJV4+S/udKsrs45RUz5KZp/bFlm6BeRwxWlvcPY52U4US5qWhQ2ykCxo0iZ
         2cQ/4K95J3ShDqMpL+CzpiUuQbDWZHNGVvZ0Cq8fpD5LLmw87zn/7TTicl+MRNecBcY/
         R3q2kEN75n1pPaxlJwU7g+vvLyzkSzKtiTcLXcWqK/5613b4NMAP7wmN+bcRvAAHxiyt
         1R21y30gLUQ+ddeCVTV7mS2/oF3fH9sUGnHWNUvQvL5Q0vxOe3BFLJHMmooHHuaHBI66
         RtWg==
X-Gm-Message-State: AOJu0YxFu1A53YqB/x+qaK7d5XvfdzwsE9/Nv6j/tuF4jJHd12RPNTrP
	wLnBS8iOR1x7cCwlXydJ9bkwMc2geJUDGfAedGk=
X-Google-Smtp-Source: AGHT+IGBzt2VnTIFh/akvUGAGezV0EEpqe6DzZVnHJCqNHU31whUJvU8YnPWWJvzlzMFV8jyNaATUg8e0xzrjKUq72E=
X-Received: by 2002:a0c:ab10:0:b0:648:190c:bdd5 with SMTP id
 h16-20020a0cab10000000b00648190cbdd5mr1387953qvb.9.1695914439717; Thu, 28 Sep
 2023 08:20:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACW2H-5W6KE6UJ8HwD6r9pOx4Ow_W6ACZyg9LpTykjU6tHHB3g@mail.gmail.com>
 <9c208dd856b82a4012370b201c08b2d73a6c130e.camel@kernel.org> <CACW2H-7-KyYrAcnO+QKBV9fs4mGfzOpKvAutbj6hkq7D0m+EzQ@mail.gmail.com>
In-Reply-To: <CACW2H-7-KyYrAcnO+QKBV9fs4mGfzOpKvAutbj6hkq7D0m+EzQ@mail.gmail.com>
From: Simon Kaegi <simon.kaegi@gmail.com>
Date: Thu, 28 Sep 2023 11:20:28 -0400
Message-ID: <CACW2H-4ABAXpPrUVAE=THOpJNzED_CkcBgysCw6PtVM2vGSd+Q@mail.gmail.com>
Subject: Re: [REGRESSION] EINVAL with mount in selinux_set_mnt_opts when
 mounting in a guest vm with selinux disabled
To: Jeff Layton <jlayton@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, dhowells@redhat.com, 
	jpiotrowski@linux.microsoft.com, brauner@kernel.org, sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah... I see it's already in 6.1.55 -- tested that and confirmed we're all g=
ood.
Thanks.
-Simon

On Thu, Sep 28, 2023 at 10:43=E2=80=AFAM Simon Kaegi <simon.kaegi@gmail.com=
> wrote:
>
> Thanks Jeff. I've confirmed that Ondrej's patch fixes the issue we
> were having. Definitely would be great to get this in 6.1.x. soon.
> -Simon
>
> On Wed, Sep 27, 2023 at 4:21=E2=80=AFPM Jeff Layton <jlayton@kernel.org> =
wrote:
> >
> > On Wed, 2023-09-27 at 15:55 -0400, Simon Kaegi wrote:
> > > #regzbot introduced v6.1.52..v6.1.53
> > > #regzbot introduced: ed134f284b4ed85a70d5f760ed0686e3cd555f9b
> > >
> > > We hit this regression when updating our guest vm kernel from 6.1.52 =
to
> > > 6.1.53 -- bisecting this problem was introduced
> > > in ed134f284b4ed85a70d5f760ed0686e3cd555f9b -- vfs, security: Fix aut=
omount
> > > superblock LSM init problem, preventing NFS sb sharing --
> > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/comm=
it/?h=3Dv6.1.53&id=3Ded134f284b4ed85a70d5f760ed0686e3cd555f9b
> > >
> > > We're getting an EINVAL in `selinux_set_mnt_opts` in
> > > `security/selinux/hooks.c` when mounting a folder in a guest VM where
> > > selinux is disabled. We're mounting from another folder that we suspe=
ct has
> > > selinux labels set from the host. The EINVAL is getting set in the
> > > following block...
> > > ```
> > > if (!selinux_initialized(&selinux_state)) {
> > >         if (!opts) {
> > >                 /* Defer initialization until selinux_complete_init,
> > >                         after the initial policy is loaded and the se=
curity
> > >                         server is ready to handle calls. */
> > >                 goto out;
> > >         }
> > >         rc =3D -EINVAL;
> > >         pr_warn("SELinux: Unable to set superblock options "
> > >                 "before the security server is initialized\n");
> > >         goto out;
> > > }
> > > ```
> > > We can reproduce 100% of the time but don't currently have a simple
> > > reproducer as the problem was found in our build service which uses
> > > kata-containers (with cloud-hypervisor and rootfs mounted via virtio-=
blk).
> > >
> > > We have not checked the mainline as we currently are tied to 6.1.x.
> > >
> > > -Simon
> >
> > This sounds very similar to the bug that Ondrej fixed here:
> >
> >     https://lore.kernel.org/selinux/20230911142358.883728-1-omosnace@re=
dhat.com/
> >
> > You may want to try that patch and see if it helps.
> > --
> > Jeff Layton <jlayton@kernel.org>
