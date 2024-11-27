Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEC41FCF45
	for <regressions@lists.linux.dev>; Wed, 27 Nov 2024 13:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732714807; cv=none; b=cO0iP5kBdA0HBfK66+JP6V+aLi6Vu1fYVP2aBzOAt/7vRhaiGZ+GhCoM2zprooCjCFjKancYe/+UgSdmFtA1oy2odiGXjqEh7VJ6mIK1bXWjqJZIDadmPduwV48Qv7JAlZ2mHfhaxnhj2ybw3iYfwMmdQ33JXE98yGMoH/XQkK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732714807; c=relaxed/simple;
	bh=XybhIwlptG3RWjD6dLrxMlzRYFTvMb5ZDn2ZOdLmhW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLgI1F/aS6u2YvqyXs7QZ8WP3Xhz+CfHlS18452GZqx2ooY8M/M3cfiGBZOAyiwm7p94POIS7nACdj7U9ZqYVNfrExWBTlB5yBZXcmoTjbwcC3Ecn8n/JKWUoNUMXhI/X0gKgVJnsgILD+nfqG1abv5LosWzxfzM7npOhIk4zhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DW9al19Y; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DW9al19Y"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-841acc8151aso99860539f.1
        for <regressions@lists.linux.dev>; Wed, 27 Nov 2024 05:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732714804; x=1733319604; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0OvxuddvI1D8zzGSyN9DJ1VP3rgYrJg8KBeyIV2RRc=;
        b=DW9al19Y5GBbCcM1YQaghUdPG8mcUlQtIS9UFTKX/LIubVLHNWoUi95wp1ZiX9NCqw
         Um3FFSpU62xHOQwclAWxs3ddR+FeVVeehRnjsSPaMsrBAMQTtv/XMSIA2FVtMdzD3xUT
         6SC1m1vlD6WVhM6Kfi3kQG+dPH4nbsibP5GvLtnQ6fl7Gcm/daLTQIWjWjojkqrH1ikZ
         4cBkmXAdS9aWtT9UuQzoRzxh1SDGKBhHBEtA9eWtN2f2K4uUs4T2PIwi4N+MdtNPHVci
         bF+CNiymeJ7v8eemICOsDEpN3aZ0ImlfzH9Kd+FbikWXFZaMInjmzEAKV8/uJy/JXbNJ
         sGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732714804; x=1733319604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0OvxuddvI1D8zzGSyN9DJ1VP3rgYrJg8KBeyIV2RRc=;
        b=lU7YFz+6jOaMa88p2HNV2Kb79aNxNPhkhNZvGWqYJ1wAlddYqkGA0YAyeSbJCTWBha
         AKPrNLXux8hf16bcvaDlJkk8KJ92FrZ+FhaYXQ3eUTRzMX9EMgsY+AB+oQ+ivMsgBRWh
         mLZrL8JYzebEdIS4Njvms+WbtVZYLGa852JKfNln5MPmeynkhwTQzV9i9CbamPfUddSU
         rWtrL5rZcYySTIVpv2xylKCFoV9tbe8n4GKz2NKIOW/dAeq/AWunT+s8NkBbCNpgbHvh
         pCWHpEvIDrLc1ujjzL28QqXvSKjvp/3u82Ba68ju1Jh0DAaxrZ4GpHl+vdhq6Jl5Q8Rt
         /I5g==
X-Forwarded-Encrypted: i=1; AJvYcCWveoOCwrD1QDqLdA9hu5liC7M7yPuCxoAM3RHqacNO06IEbIO+TFZDLHYAP7wFO//2dgfFbhBdkSB7OA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyogJXXnoAHbCLuDJafPA5gewTPYQ//Vus9jRWHVvGwocXV9Jbf
	CSuyxxBQ5FhJJKZde6AHOf8b+ibwnC+3/LZ9g+FPWHJtUZSxE2QhxlmaUxOgoTjS51gzDFzSeyQ
	sxthXXu1l6DkIoB49nteblywEAbY=
X-Gm-Gg: ASbGnctiY2tKep2af/cS3NllnktI6mbTym416R39S9ZBdDkDyeut6xqXICS3xEBklQ3
	dDYxvirL3sdmio66VKDTKtFHTHaHnIiuO41HR48C/1obPgbLE9rIpvdOKDjHgAIk0
X-Google-Smtp-Source: AGHT+IFw+Hy3debmQQWfB5c82VSTFahHQVa4B5dF8Vi5vW9WtYDtqXgFvQqyvh8tCLVLPi7bEbWqP5yucfD+Cnpi3AM=
X-Received: by 2002:a05:6602:641b:b0:83b:2c8e:c4 with SMTP id
 ca18e2360f4ac-843ecf7adabmr385607039f.9.1732714804645; Wed, 27 Nov 2024
 05:40:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACKH++YAtEMYu2nTLUyfmxZoGO37fqogKMDkBpddmNaz5HE6ng@mail.gmail.com>
 <4a2bc207-76be-4715-8e12-7fc45a76a125@leemhuis.info> <CACKH++YYM2uCOrFwELeJZzHuTn5UozE-=7PS3DiVnsJfXg1SDw@mail.gmail.com>
 <20241127-frisst-anekdote-3e6d724cb311@brauner>
In-Reply-To: <20241127-frisst-anekdote-3e6d724cb311@brauner>
From: Rui Ueyama <rui314@gmail.com>
Date: Wed, 27 Nov 2024 22:39:53 +0900
Message-ID: <CACKH++ZXsLOhtReCucvxkqUATcXNtuW3A=idjskOt+fdme35Jg@mail.gmail.com>
Subject: Re: [REGRESSION] mold linker depends on ETXTBSY, but open(2) no
 longer returns it
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jan Kara <jack@suse.cz>, 
	Amir Goldstein <amir73il@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux-fsdevel <linux-fsdevel@vger.kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 9:11=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Wed, Nov 27, 2024 at 07:33:53AM +0900, Rui Ueyama wrote:
> > On Mon, Nov 11, 2024 at 9:02=E2=80=AFPM Thorsten Leemhuis
> > <regressions@leemhuis.info> wrote:
> > >
> > > [adding a few CCs, dropping stable]
> > >
> > > On 28.10.24 12:15, Rui Ueyama wrote:
> > > > I'm the creator and the maintainer of the mold linker
> > > > (https://github.com/rui314/mold). Recently, we discovered that mold
> > > > started causing process crashes in certain situations due to a chan=
ge
> > > > in the Linux kernel. Here are the details:
> > > >
> > > > - In general, overwriting an existing file is much faster than
> > > > creating an empty file and writing to it on Linux, so mold attempts=
 to
> > > > reuse an existing executable file if it exists.
> > > >
> > > > - If a program is running, opening the executable file for writing
> > > > previously failed with ETXTBSY. If that happens, mold falls back to
> > > > creating a new file.
> > > >
> > > > - However, the Linux kernel recently changed the behavior so that
> > > > writing to an executable file is now always permitted
> > > > (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/commit/?id=3D2a010c412853).
> > >
> > > FWIW, that is 2a010c41285345 ("fs: don't block i_writecount during
> > > exec") [v6.11-rc1] from Christian Brauner.
> > >
> > > > That caused mold to write to an executable file even if there's a
> > > > process running that file. Since changes to mmap'ed files are
> > > > immediately visible to other processes, any processes running that
> > > > file would almost certainly crash in a very mysterious way.
> > > > Identifying the cause of these random crashes took us a few days.
> > > >
> > > > Rejecting writes to an executable file that is currently running is=
 a
> > > > well-known behavior, and Linux had operated that way for a very lon=
g
> > > > time. So, I don=E2=80=99t believe relying on this behavior was our =
mistake;
> > > > rather, I see this as a regression in the Linux kernel.
> > > >
> > > > Here is a bug report to the mold linker:
> > > > https://github.com/rui314/mold/issues/1361
> > >
> > > Thx for the report. I might be missing something, but from here it lo=
oks
> > > like nothing happened. So please allow me to ask:
> > >
> > > What's the status? Did anyone look into this? Is this sill happening?
>
> Linus, it seems that the mold linker relies on the deny_write_access()
> mechanism for executables. The mold linker tries to open a file for
> writing and if ETXTBSY is returned mold falls back to creating a new
> file.
>
> There is now a fix in mold upstream in
> https://github.com/rui314/mold/commit/8e4f7b53832d8af4f48a633a8385cbc932d=
1944e
>
> However, mold upstream still insists on a revert (no judgement on my
> part in case that sentence is misinterpreted).

I don't have a strong opinion on whether returning ETXTBSY is
desirable or not. We can cooperate to make a smooth transition to the
new behavior of open(2). That being said, making an abrupt kernel
change that breaks userland in a very mysterious way is, in my
opinion, not acceptable. I'm not personally affected by this issue,
but I needed to speak for our users who may upgrade their kernels
before upgrading their linker.

> Note, that the revert will cause issues for the fanotify pre-content
> hook patch series in [1] which was the cause for the removal of the
> deny_write_access() protection for executables so that on page faults
> the contents of executables could be filled-in by userspace. This is
> useful when dealing with very large executables and is apparently used
> by Meta.
>
> [1]: https://lore.kernel.org/r/20241121112218.8249-1-jack@suse.cz
>
> While Amir tells me that they may have a way around this I expect this
> to be hacky.
>
> This will also trigger a revert/rework of the LTP testsuite which has
> adapted various tests to the deny_write_access() removal for
> executables.
>
> There's been some delay in responding to this after my initial comment
> on Github because I entered into a month of sickness. So I just got
> reminded of this issue now. In any case, here's a tag that you can pull
> if you agree with the revert.
>
> The following changes since commit 7eef7e306d3c40a0c5b9ff6adc9b273cc894db=
d5:
>
>   Merge tag 'for-6.13/dm-changes' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/device-mapper/linux-dm (2024-11-25 18:54:00 -0800)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/vfs/vfs tags/vfs-6.13.=
exec.deny_write_access.revert
>
> for you to fetch changes up to 3b832035387ff508fdcf0fba66701afc78f79e3d:
>
>   Revert "fs: don't block i_writecount during exec" (2024-11-27 12:51:30 =
+0100)
>
> ----------------------------------------------------------------
> vfs-6.13.exec.deny_write_access.revert
>
> ----------------------------------------------------------------
> Christian Brauner (1):
>       Revert "fs: don't block i_writecount during exec"
>
>  fs/binfmt_elf.c       |  2 ++
>  fs/binfmt_elf_fdpic.c |  5 ++++-
>  fs/binfmt_misc.c      |  7 +++++--
>  fs/exec.c             | 23 +++++++++++++++--------
>  kernel/fork.c         | 26 +++++++++++++++++++++++---
>  5 files changed, 49 insertions(+), 14 deletions(-)
