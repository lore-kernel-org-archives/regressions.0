Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0557EE
	for <regressions@lists.linux.dev>; Mon,  4 Dec 2023 01:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stgraber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stgraber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=stgraber.org header.i=@stgraber.org header.b="J6S+4Tkq"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-54917ef6c05so4894194a12.1
        for <regressions@lists.linux.dev>; Sun, 03 Dec 2023 17:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stgraber.org; s=google; t=1701653691; x=1702258491; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9t2V5+NJCqwOjXhsbRgq5ZBfr9i3FMQN1H8XXR51sM=;
        b=J6S+4TkqUzR2omKvc/rQZbrijnMOWIN+SlnJjy3c8897Kc5d2pVGxpXGVYHhPdb4rJ
         P2m1xzLd/AwJ9+eWHbtPy482JbXAI6FL/GcE3VM438tjcBjrLVrD0X/yPY5Z9GE3t3+E
         MIB/BCL3LejcraTQ6Gdn4epKD2c3+Mjjsjlos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701653691; x=1702258491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9t2V5+NJCqwOjXhsbRgq5ZBfr9i3FMQN1H8XXR51sM=;
        b=pHK/LGAv0Vc2nfY0gueL0WE1M/7noJ5wQJA9E5IRv9gSBj6TyVZFx9fbcOrZIdht4n
         XidmLpekeHMwoJxtAjTucVL4mOpMIk2DJ3+d7i+UjpMr+kn1e2Y63bwvZQyC5PgIMH9r
         WSNNskXb6NSQeoLYxE9WefYlp7Nt8ggIHGk4IJIh0o5DDz+5kqHZ+etu20xk5mEG4JfY
         VtQJo3kUsrpVnkM5UKcP8bI2RCf9d7F+JyxDTPBOqS9XF6T9oMII4aYTpHo5BnrobnWj
         36vD6UE/KqEyTAUe2fsyEivesXeSlYpnHetuJ09F3mlQdQnpsIsyzxUR2H5dFf0wgwUK
         DU/w==
X-Gm-Message-State: AOJu0YwguQbLdzBHsTUlfPTdpD1uw2n68as8LwmJdY3q0/phZ7fygALS
	zUhQPnTrBc46mEqPywRNLFi8MJ8Mp7LKhjC/tlROTQ==
X-Google-Smtp-Source: AGHT+IEDMKNviHvPqikL69FsC4De+/OggKMbcuIloCuCxdzzg4ljHdWYt8CW/jLuYI8wMTtstrgkpFhGxhLBz9VZT60=
X-Received: by 2002:aa7:d6c1:0:b0:54c:4837:7d1a with SMTP id
 x1-20020aa7d6c1000000b0054c48377d1amr1400515edr.89.1701653690551; Sun, 03 Dec
 2023 17:34:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+enf=sWQ+-YP+uj9XfN_ykDsK=CYFFa35aPpeuS9B6qyLkjtg@mail.gmail.com>
 <582eb2e9-ce80-4f96-a4bc-bef1a508e0ab@canonical.com>
In-Reply-To: <582eb2e9-ce80-4f96-a4bc-bef1a508e0ab@canonical.com>
From: =?UTF-8?Q?St=C3=A9phane_Graber?= <stgraber@stgraber.org>
Date: Sun, 3 Dec 2023 20:34:39 -0500
Message-ID: <CA+enf=u0UmgjKrd98EYkxFu7FYV8dR1SBYJn_1b0Naq=3twbbQ@mail.gmail.com>
Subject: Re: Apparmor move_mount mediation breaks mount tool in containers
To: John Johansen <john.johansen@canonical.com>
Cc: Christian Brauner <brauner@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	Aleksa Sarai <cyphar@cyphar.com>, Alexander Mihalicyn <alexander@mihalicyn.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 3, 2023 at 8:21=E2=80=AFPM John Johansen
<john.johansen@canonical.com> wrote:
>
> On 12/2/23 17:20, St=C3=A9phane Graber wrote:
> > Hey John,
> >
> > Upstream commit 157a3537d6bc28ceb9a11fc8cb67f2152d860146 which just
> > landed in 6.6.3 stable as 96af45154a0be30485ad07f70f852b1456cb13d7 is
> > blocking new mounts for all LXC, LXD and Incus users (at least) on
> > distributions using the newer version of util-linux.
> >
> > That's because for a simple mount like "mount -t tmpfs tmpfs /tmp",
> > the new mount command now performs:
> > ```
> > fsconfig(3, FSCONFIG_SET_STRING, "source", "tmpfs", 0) =3D 0
> > fsconfig(3, FSCONFIG_CMD_CREATE, NULL, NULL, 0) =3D 0
> > fsmount(3, FSMOUNT_CLOEXEC, 0)          =3D 4
> > statx(4, "", AT_STATX_SYNC_AS_STAT|AT_EMPTY_PATH, STATX_MNT_ID,
> > {stx_mask=3DSTATX_BASIC_STATS|STATX_MNT_ID,
> > stx_attributes=3DSTATX_ATTR_MOUNT_ROOT, stx_mode=3DS_IFDIR|S_ISVTX|0777=
,
> > stx_size=3D40, ...}) =3D 0
> > move_mount(4, "", AT_FDCWD, "/tmp", MOVE_MOUNT_F_EMPTY_PATH) =3D 0
> > ```
> >
> > That last call to "move_mount" is incorrectly interpreted by AppArmor
> > as an attempt to move-mount "/" to "/mnt" rather than as a new mount
> > being created, this therefore results in:
> > ```
> > Dec 03 01:05:03 kernel-test kernel: audit: type=3D1400
> > audit(1701565503.599:34): apparmor=3D"DENIED" operation=3D"mount"
> > class=3D"mount" info=3D"failed perms check" error=3D-13
> > profile=3D"incus-a_</var/lib/incus>" name=3D"/tmp/" pid=3D2190 comm=3D"=
mount"
> > srcname=3D"/" flags=3D"rw, move"
> > ```
> >
> > Note that the flags here show "move", the fstype isn't even set and
> > the source path at srcname incorrectly shows "/".
> >
> > This operation therefore trips any container manager which has an
> > apparmor security policy preventing arbitrary move-mount (as those
> > could be used to bypass other apparmor path based policies).
> >
> >
> > The way I see it, the current mediation support effectively breaks any
> > attempt at mediating mounts in a useful way in apparmor as it's now
> > impossible to mediate new mounts based on their fstype or even
> > distinguish them from a move-mount operation.
> >
> Indeed it is a far from good solution. It is a stop gap.
> >
> > I don't know if this warrants pulling the mediation patch out of
> > stable (and out of linus' tree), obviously doing that would
> > reintroduce that hole in mount coverage, but at the same time, the
> > current coverage is broken enough that our only alternative is to
> > effectively allow all mounts, making the current mediation useless.
>
> pulling it effectively means ALL applications by-pass mediation, the
> alternative is to block all applications from using the move_mount
> system call as part of mediation. Which might have been acceptable
> as a stop gap when the syscall first landed but not now.

Pulling it from the stable branch may still make sense, you now have
folks who are updating to get actual bugfixes and end up with broken
containers, that doesn't exactly seem like a good outcome...

> The situation can be broken down like this
> unconfined applications have no restrictions, this doesn't affect
> hem.
>
> confined applications using the old mount interface continue to
> work as expected.
>
> confined applications using the new mount interface now are blocked
> unless there is, admittedly, a very broad mount rule granted. This
> is however better than the old situation in which confined
> applications where not mediated at all.

It depends from your point of view. If you are using apparmor around a
single application and have tailored rules for exactly what it is
doing, then yes, I agree.
But for all cases where apparmor is used as a safety net to block
potentially dangerous/problematic actions, this is causing the kind of
breakage which will cause people to just plain turn off apparmor.

> The regression is in the policy, where an application like LXD/Incus
> are specify mount rules and loading policy based on it. Those
> restrictions continue to work on the old mount interface, they
> however do not work as one would expect when the new mount interface
> is used. To allow applications to use the new mount interface
> a broad mount rule is needed, which basically makes the other
> mount restrictions useless.
>
> This situation is however still better than without the patch
> because, applications trying to use the new mount interface
> were not restricted at all. The only regression is in mediation
> of applications that are using the old mount interface. But
> again those application, without the patch, can just use the
> new interface and by-pass the restrictions from those rules. In
> this case the broad rule is not good, but better than the by-pass.
>
> I am working on a patch that will improve the situation, over the
> current patch using the existing move_mount hook. I wanted to
> be able to get more testing in place, before we did more, and
> just didn't have the time.

So just to understand, this change went upstream while it was known
that effectively no sane mount policy would work with it?

That seems very odd, at that point, why not instead upstream a patch
that disables the new mount API when apparmor is in use with mount
rules?
That feels like it would have had the same theoretical benefits
without the breakage that this change caused.

> But the reality is, apparmor won't be able to achieve equivalent
> mediation without new hooks or at least more mount context passed
> into the existing hook. That to is being looked at but won't be
> is even further out.

That doesn't sound encouraging as far as getting a suitable fix to our user=
s...


Is there even a way in apparmor policies to cleanly prevent the use of
the new mount API (return ENOSYS back to userspace)?
We can obviously do this through a separate seccomp filter, but not
everyone is using seccomp...

St=C3=A9phane
