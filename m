Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B8C330B32;
	Tue, 18 Aug 2026 16:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787071882; cv=none; b=gyEqZgNX3YqQHjKSr5QboyTs+AD4WljNtvidBixRjfUk7GcXzrm7qMkKyabgctgPpJrnmHLTtfQ8auQiEbJXWqcqvAgvFblrCuiC5fBL8H/FaC93sdSlkHTjuszOfChyzxbkfVk4rCYl9D3L9HEdSIdnBw/FJT3PNhr64bwvqZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787071882; c=relaxed/simple;
	bh=d4YQSdFtaBJ+huM+p9Gjiq0MyjwcPmwCWsqIte20cvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdBW76IbRAw1prbPyOLHOkxYXfPNkKsjTpLgy0cytDME1OaHYcHXuG09CyDHDAdAOE6EsTQnPjsikWQi9uT/rl7pXM0JAfXISVnNmYtvtVU86e3sjXfSTVxJBJ2dJHwUHHORY+mZL04XKE1lpRwXjaMQWi3MVeWGKoxh8rAKCVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsnVy6uv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsnVy6uv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BF91F000E9;
	Tue, 18 Aug 2026 16:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787071881;
	bh=oxw/kaFYuUrBUpB5/Q2zLu+26H/MoNjv/y8zwuY+8yI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SsnVy6uv0+jtNijG4un/Rs/+gGCONknafAE5XVpunNG35p+ZOZCKLBoC1daAG/EsZ
	 SrOdMj3OejAumf7dxUcF1OI7Igz/ucU4wYkoFEOHh4NeZcW4giKTgJoI7O9YlonwLB
	 s0IEZcTEM2d6dNvXouGJzyzkcGzZOzmpsOyYFsIbWtd4HQ2b/1oe+5BSzbrdlDvz84
	 LNMrooRX/gVgbIlnFF7D1GWVw8saxMsE5XzWkGtjngHp1ljKURLyGsac0i01MBNtq8
	 LntAogvlhXz8R0r/4S0xUrm7aq6th6OSbX+/YL3Vao+H2QxvivhoQGeht7IuB/3xo7
	 tEvdFO3OBzTTg==
Date: Tue, 18 Aug 2026 09:51:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	regressions@lists.linux.dev, laura.nao@collabora.com,
	shreeya.patel@collabora.com, broonie@kernel.org,
	kernelci-results@groups.io, kernelci@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [REGRESSION] mainline/master: (build) in
 arch/arm/kernel/entry-common.o (/tmp/kci/linux/scripts/Makefile...
Message-ID: <20260818165116.GA1335107@ax162>
References: <178701474442.5156.12765087253678603047@kernelci.org>
 <c9ba4aeb-a288-4597-b13a-9da55666f96a@leemhuis.info>
 <CAKwvOdkcCnhM-395QVriu3hnjmtX1H-3i_1tU5Jpb1Ybr2Q77g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdkcCnhM-395QVriu3hnjmtX1H-3i_1tU5Jpb1Ybr2Q77g@mail.gmail.com>

On Tue, Aug 18, 2026 at 09:19:04AM -0700, Nick Desaulniers wrote:
> + Ard
> 
> On Mon, Aug 17, 2026 at 11:00 PM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
> > Nathan, Nick, do you still care about clang problems like this?
> 
> Yes, from the logs, it looks like ARCH=arm allmodconfig with clang-21
> (perhaps, there's a funny warning about the compiler version in the
> logs).
> 
> > And do
> > you by chance know what's wrong here?
> >
> > """
> > <instantiation>:2:11: error: out of range pc-relative fixup value
> >  ldr r10, =__per_cpu_offset
> >           ^
> > <instantiation>:2:11: error: out of range pc-relative fixup value
> >  ldr tsk, =__current
> >           ^
> > <instantiation>:2:11: error: out of range pc-relative fixup value
> >  ldr tsk, =__current
> >           ^
> 
> Smells like the same problem that was addressed by
> commit 5fe41793bc78 ("ARM: 9176/1: avoid literal references in inline assembly")
> 
> What tree was being tested? 5fe41793bc78 landed in v5.18-rc1. Whatever
> was being tested is probably missing that patch.

As Mark notes, this is mainline. This error is visible with LLVM 23 as
well. I bisected it to commit 79d27fd71854 ("arch: hookup fchroot()
system call").

  # bad: [0f23d56f17fdfc7db69d51f64c8b91bbab947aa9] Merge tag 'linux_kselftest-next-7.3-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
  # good: [8d3ae59288f1e7d58d76558a6ee96d533bc5019f] Linux 7.2
  git bisect start '0f23d56f17fdfc7db69d51f64c8b91bbab947aa9' 'v7.2'
  # bad: [1c3e8cef79ea5f1415cff0d3c507e2e07b71ade8] Merge tag 'vfs-7.3-rc1.misc' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs
  git bisect bad 1c3e8cef79ea5f1415cff0d3c507e2e07b71ade8
  # bad: [9ea8d6197d9f43a15ccb9c0dce601ec535d5da7e] Merge tag 'vfs-7.3-rc1.iomap' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs
  git bisect bad 9ea8d6197d9f43a15ccb9c0dce601ec535d5da7e
  # good: [a7b880449ab1b2389b31ed9da703691dcac54655] binfmt_misc: carry pre-opened interpreters in struct binfmt_misc_interp
  git bisect good a7b880449ab1b2389b31ed9da703691dcac54655
  # good: [7c7fe554f40adac2a7f8d9b6d5886ca332edd496] docs: fix grammatical error in iomap docs
  git bisect good 7c7fe554f40adac2a7f8d9b6d5886ca332edd496
  # good: [d31a688a49a82a48e0434aee9d851e094270a6ee] Merge tags 'vfs-7.3-rc1.efs' and 'vfs-7.3-rc1.freevxfs' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs
  git bisect good d31a688a49a82a48e0434aee9d851e094270a6ee
  # bad: [a45a6605cd04f2e55c1650a49bdb05106ac07ccc] Documentation: add failfs documentation
  git bisect bad a45a6605cd04f2e55c1650a49bdb05106ac07ccc
  # good: [20370a5f5d9b1549ab3bf10a898b4e024b8841fa] fs: add fchroot()
  git bisect good 20370a5f5d9b1549ab3bf10a898b4e024b8841fa
  # bad: [79d27fd718545db4731691e0a77e51d27dc1a41e] arch: hookup fchroot() system call
  git bisect bad 79d27fd718545db4731691e0a77e51d27dc1a41e
  # good: [b1221afa31cc2daf6b83d72e45827cffb4e86aff] fs: support FD_FAILFS_ROOT in fchroot()
  git bisect good b1221afa31cc2daf6b83d72e45827cffb4e86aff
  # first 'bad' commit: [79d27fd718545db4731691e0a77e51d27dc1a41e] arch: hookup fchroot() system call

I do see that change in -next and there is no error there so was this a
known issue that was fixed in another tree? I will keep looking.

-- 
Cheers,
Nathan
