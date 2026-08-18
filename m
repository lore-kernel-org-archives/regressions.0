Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710503A3E7A;
	Tue, 18 Aug 2026 17:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787075535; cv=none; b=HFcYYlDmydbp+DQNuziDri9aiQWvjyPctNBiS3BWrasdptRq7WSm0boSNoTqiWtt02mrlKF6lqfFXIBpqC4QK062W0OZV8/V6yORawEOqhDNZRkTNBgWa9Ao0TeNxtUGex6jfK9yK3anvc1JxoMvoIVcNperlpZiJ7a+auV7Muk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787075535; c=relaxed/simple;
	bh=2f+UDXlqJmIa38D//2amUkmnDC6BDnKtnHxdMwySMHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhNJ2ePSGvw4fI1Qymuni2Uz38aJSJAiAMeq5GYvFr/CsVNkNLOTukLliU0XOc0n3UYtwP6Mq2zH6hj7i0yLIwOI/air0jxOsEqyKFuSbSCm/DLiHE3dPRIIMPzsbgLwsJavHdgYoq1rOyl7QkkIrgnuozRpm+JJS02gjZgV8hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUpt9y85; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUpt9y85"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5EC1F000E9;
	Tue, 18 Aug 2026 17:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787075534;
	bh=ih5b44fWr5eZq8gxpfmXgRh79tDpoua4fcI/1MqAgL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KUpt9y850YUF0l7AciDUSthfA1ESi3xEoJQk3PteIJD96fDuOWfgPs2lkFSt1aX1h
	 qPx/8aNLAKi4eA5PwoOemmsB/13yJEE5iRBZ2eQfD00TUPhxk1xoBuVZBc8rDK3D36
	 JeweCNPYaos3Brf+f1lhCLydNOowwjXiVfYCvttIPQrVvTLZ1E+E+mTVSN8aCUt+lG
	 BogBKTm4mmWwwHLjK702uhIpCuaR0RO+PWbT7Zla5fOSelANdmXUfPg0hl/sm7PBH4
	 tcdp/SZthL+s+66se6so0x2Zq8+rQ/JA8lZAt+nfv8lDu8T3ylpbQBMk5jQ8RRGQ3D
	 Ko2Xq/NgutvBw==
Date: Tue, 18 Aug 2026 10:52:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	regressions@lists.linux.dev, laura.nao@collabora.com,
	shreeya.patel@collabora.com, broonie@kernel.org,
	kernelci-results@groups.io, kernelci@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [REGRESSION] mainline/master: (build) in
 arch/arm/kernel/entry-common.o (/tmp/kci/linux/scripts/Makefile...
Message-ID: <20260818175209.GA1675024@ax162>
References: <178701474442.5156.12765087253678603047@kernelci.org>
 <c9ba4aeb-a288-4597-b13a-9da55666f96a@leemhuis.info>
 <CAKwvOdkcCnhM-395QVriu3hnjmtX1H-3i_1tU5Jpb1Ybr2Q77g@mail.gmail.com>
 <20260818165116.GA1335107@ax162>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260818165116.GA1335107@ax162>

On Tue, Aug 18, 2026 at 09:51:21AM -0700, Nathan Chancellor wrote:
> On Tue, Aug 18, 2026 at 09:19:04AM -0700, Nick Desaulniers wrote:
> > + Ard
> > 
> > On Mon, Aug 17, 2026 at 11:00 PM Thorsten Leemhuis
> > <regressions@leemhuis.info> wrote:
> > > Nathan, Nick, do you still care about clang problems like this?
> > 
> > Yes, from the logs, it looks like ARCH=arm allmodconfig with clang-21
> > (perhaps, there's a funny warning about the compiler version in the
> > logs).
> > 
> > > And do
> > > you by chance know what's wrong here?
> > >
> > > """
> > > <instantiation>:2:11: error: out of range pc-relative fixup value
> > >  ldr r10, =__per_cpu_offset
> > >           ^
> > > <instantiation>:2:11: error: out of range pc-relative fixup value
> > >  ldr tsk, =__current
> > >           ^
> > > <instantiation>:2:11: error: out of range pc-relative fixup value
> > >  ldr tsk, =__current
> > >           ^
> > 
> > Smells like the same problem that was addressed by
> > commit 5fe41793bc78 ("ARM: 9176/1: avoid literal references in inline assembly")
> > 
> > What tree was being tested? 5fe41793bc78 landed in v5.18-rc1. Whatever
> > was being tested is probably missing that patch.
> 
> As Mark notes, this is mainline. This error is visible with LLVM 23 as
> well. I bisected it to commit 79d27fd71854 ("arch: hookup fchroot()
> system call").
> 
> I do see that change in -next and there is no error there so was this a
> known issue that was fixed in another tree? I will keep looking.

It looks like commit 25900bd99d4d ("ARM: limit OABI support to StrongARM
CPUs") in the soc tree avoids this error by disabling CONFIG_OABI_COMPAT
for allmodconfig. If I disable that on top of allmodconfig with current
mainline, the error goes away.

I narrowed down a reproducer to

  $ cat arch/arm/configs/repro.config
  CONFIG_ARCH_MULTI_V6=y
  CONFIG_ARCH_REALVIEW=y
  CONFIG_COMPILE_TEST=y
  CONFIG_MACH_REALVIEW_PB1176=y
  CONFIG_OABI_COMPAT=y

  $ make -skj"$(nproc)" ARCH=arm LLVM=1 mrproper defconfig repro.config arch/arm/kernel/entry-common.o
  <instantiation>:2:11: error: out of range pc-relative fixup value
   ldr r10, =__per_cpu_offset
            ^
  <instantiation>:2:11: error: out of range pc-relative fixup value
   ldr tsk, =__current
            ^
  <instantiation>:2:11: error: out of range pc-relative fixup value
   ldr tsk, =__current
            ^

CONFIG_COMPILE_TEST is necessary because it turns off
CONFIG_ARM_HAS_GROUP_RELOCS, which seems relevant here.

-- 
Cheers,
Nathan
