Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311A53FB01
	for <regressions@lists.linux.dev>; Thu, 28 Sep 2023 14:43:30 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-77421a47db6so632586385a.0
        for <regressions@lists.linux.dev>; Thu, 28 Sep 2023 07:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695912210; x=1696517010; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEvAYAapqiaXm0tIJM5yoNgVHww0X7eA8eny72ES378=;
        b=HyYiz0x5olvw79h69kFRmL5T38Z9XxZCKKv/dljN1GXA8GB9vJ3KWXwOz8tA1mWlsq
         h2G5oMCLDefokaMbPLuR4uYLUmy2laZYzscZ1FVxgMT+6x4p9AnQLxlThGFSHMkUBH1U
         L3RwbW0kY9u/KHttXRA7IHN7MdQwFMuvuOojlfaoeryC/xLfslGhhgQUCH7aaMVCfp7q
         hmy/G4pgqDNYUA1W4fQBvfEWt4V5Syhj8hBafGP9Cos41aznGE+qyk7NpQGzx7a1S9t/
         9wVDEr1rvYJ09PqQnobsVab8mw0Yy9oV5R2P3G1w/o0KKj/cQeVvfdppMgwjEB+C3RBG
         qdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695912210; x=1696517010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEvAYAapqiaXm0tIJM5yoNgVHww0X7eA8eny72ES378=;
        b=JIS1NFmIcu/gFk1eVYcvoO9+a2h4PWzo4Qa1WVAjUYKl/QUbR+RiZMcm6nCDzTfjHr
         zU4cfRYVmhEX53axw6CpiF399hVfoMC3KHpQAq1A35CK6yENyeNV0QwjDYUILzHwZw4a
         kgovbEb5C3e+sKPhCN8HXpNuk+auMPo9oGdRpEAnu3IWReUahn1aZunCNgqQHoLulipW
         xSFEuURYe8uJRHEi+g3+ioAGYzK9LIesTJlFRVzLEg3EgwqhbztzVtQ9eh/Eld8tlrDx
         ziC+EVpa8NUsW4CQdl1X1puyj16+TqyY+tJzowAk4DxmsEpd4Mpy4tHEoECwinSU+OCo
         VTTg==
X-Gm-Message-State: AOJu0Yyu79gz0iLyPUSMTQoURD+dyjKKrEitqd5RlHtZ1+1tYES3Dor0
	VKvixcuoDn/ys8+B2NDQEnJxkywYJvsToCDAYxM=
X-Google-Smtp-Source: AGHT+IG+ec8FIIBvgJDkegfTZ8Pve3+o4Pl8ogfUyDno53sg8GfpCoV7qHr3TG+xffedjcZ9vcaaXEeAkll2Yy5EAUA=
X-Received: by 2002:a0c:b384:0:b0:655:f784:9d25 with SMTP id
 t4-20020a0cb384000000b00655f7849d25mr1222960qve.59.1695912209847; Thu, 28 Sep
 2023 07:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACW2H-5W6KE6UJ8HwD6r9pOx4Ow_W6ACZyg9LpTykjU6tHHB3g@mail.gmail.com>
 <9c208dd856b82a4012370b201c08b2d73a6c130e.camel@kernel.org>
In-Reply-To: <9c208dd856b82a4012370b201c08b2d73a6c130e.camel@kernel.org>
From: Simon Kaegi <simon.kaegi@gmail.com>
Date: Thu, 28 Sep 2023 10:43:17 -0400
Message-ID: <CACW2H-7-KyYrAcnO+QKBV9fs4mGfzOpKvAutbj6hkq7D0m+EzQ@mail.gmail.com>
Subject: Re: [REGRESSION] EINVAL with mount in selinux_set_mnt_opts when
 mounting in a guest vm with selinux disabled
To: Jeff Layton <jlayton@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, dhowells@redhat.com, 
	jpiotrowski@linux.microsoft.com, brauner@kernel.org, sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Jeff. I've confirmed that Ondrej's patch fixes the issue we
were having. Definitely would be great to get this in 6.1.x. soon.
-Simon

On Wed, Sep 27, 2023 at 4:21=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> On Wed, 2023-09-27 at 15:55 -0400, Simon Kaegi wrote:
> > #regzbot introduced v6.1.52..v6.1.53
> > #regzbot introduced: ed134f284b4ed85a70d5f760ed0686e3cd555f9b
> >
> > We hit this regression when updating our guest vm kernel from 6.1.52 to
> > 6.1.53 -- bisecting this problem was introduced
> > in ed134f284b4ed85a70d5f760ed0686e3cd555f9b -- vfs, security: Fix autom=
ount
> > superblock LSM init problem, preventing NFS sb sharing --
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit=
/?h=3Dv6.1.53&id=3Ded134f284b4ed85a70d5f760ed0686e3cd555f9b
> >
> > We're getting an EINVAL in `selinux_set_mnt_opts` in
> > `security/selinux/hooks.c` when mounting a folder in a guest VM where
> > selinux is disabled. We're mounting from another folder that we suspect=
 has
> > selinux labels set from the host. The EINVAL is getting set in the
> > following block...
> > ```
> > if (!selinux_initialized(&selinux_state)) {
> >         if (!opts) {
> >                 /* Defer initialization until selinux_complete_init,
> >                         after the initial policy is loaded and the secu=
rity
> >                         server is ready to handle calls. */
> >                 goto out;
> >         }
> >         rc =3D -EINVAL;
> >         pr_warn("SELinux: Unable to set superblock options "
> >                 "before the security server is initialized\n");
> >         goto out;
> > }
> > ```
> > We can reproduce 100% of the time but don't currently have a simple
> > reproducer as the problem was found in our build service which uses
> > kata-containers (with cloud-hypervisor and rootfs mounted via virtio-bl=
k).
> >
> > We have not checked the mainline as we currently are tied to 6.1.x.
> >
> > -Simon
>
> This sounds very similar to the bug that Ondrej fixed here:
>
>     https://lore.kernel.org/selinux/20230911142358.883728-1-omosnace@redh=
at.com/
>
> You may want to try that patch and see if it helps.
> --
> Jeff Layton <jlayton@kernel.org>
