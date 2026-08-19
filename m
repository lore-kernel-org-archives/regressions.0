Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427D23FFF8E
	for <regressions@lists.linux.dev>; Wed, 19 Aug 2026 08:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787126947; cv=none; b=W6IGPZ/bDWkJz7dQfMbl5FkF5QMk1Kdw7IK2onqxfNfutWvJo+tlx454Jv9uJO3nx/PJM/d4J2e1AGDVfyLbdjJGImBvf39GV+s5EXtn2c/v8tW7bbvYPTmmFde325FLUWJye5H8pTEqMvfjmo5DrAKuSDtTb5p+Zsybp8nXHLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787126947; c=relaxed/simple;
	bh=Uxf5F+hTeSCEz7+bJUDYvxqE0Hr+uCGPOH8vepoMf0I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=u1KtV0xAFqaAC1+klI9g8BWMB8UGAgTKp303u4dXfT2TwKuaCYru3BI/cLL9nIaNi5DmmrsUsVfqg/Erdh72fcMH0RwuzaPC+N/ii6emZ3Ciz0G+exaawjJClFDhPAaJuuai5dALAF2OwAut3eG0/Rs3HxVLllnJgLhS04+m9HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHDVchDC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aHDVchDC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6801D1F00A3A;
	Wed, 19 Aug 2026 08:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787126946;
	bh=Rel36xmfiSgNiSalsIvb5qVmqE3OGUaO/+xyxkc8SbM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=aHDVchDCdU8i4fqv0o4BdUaKk3gwOg7XXfCYZcwk8NIiYmyZGyVcru7rlTDpecbOp
	 QpJaa6jsH140Z6X5Zs+bHJhZCwALGKYw7E+8YGjGYt9vmYaVF+DeLNGgJJbX3nhyp4
	 vUICaRlsZeAWca+nfYHOGfaL38LA1T99ytopfwXTQ2yheAdOnNxV5xgp+w5fK1bK/a
	 +tICay99X12aK0iKWf370HHukEqIdUJ/LaGg/wdLhzAaeIsovhsM/tBxPOIruLibMc
	 0LU8pswZrxEcYaaojgVg1hMCZFEDqG+nbK83xlslmLkH6L+c9tuPYmiSMTXUkL5ZR2
	 cEWT2aQVQZ/1w==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id ECF1E1980059;
	Wed, 19 Aug 2026 04:09:03 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 19 Aug 2026 04:09:03 -0400
X-ME-Sender: <xms:nWSFahQp4MGyq3Q9WNUCD1Erexm59VQabvJ-2L452kQeCKeIvCWw0A>
    <xme:nWSFallJWAPlleUbLPOr12p-LJs7Ch0cdYbEVtb7L3SMxcemYo4CDGZsPsRkeII1M
    CHFVz401rUVpfkhdtoBukJZK7B5CQF2_ls1Iv7i7ZwJBoXjObJ_xKA>
X-ME-Proxy-Cause: dmFkZTFYDFUAC2rkvrnGmrRoFhG0dxbmQYh99/jQv4Lmm7D4gBy294cGV3+4PezLTZwI4H
    awP0ZBhGpL+W9l9vZCeFxchgM3sJF5/zuJhbMD8Y99RIfrY/4b7FiCBrbH6sP4KsQvDlOV
    Hi70oL9rLSs58hQ90atyjG7Sgf8bG8ylyh/XlK/QDX9K0pB8XBMLAx3Hrmfrizohr0NF+Y
    jh/6EWFQh32emZtcLqzUOCo/0aQK+VxYklI1Dsqlhz3AREXP5Ihp0z81Njx5PHtsOtQx9I
    zwCR9POpxIzfGFCp4qAxKa6XDTSDaLMuCZo1eLkdTtgp54eAycT1ZVDMn5PxLwRbFLtaV9
    FXMykNbPsbBuu9co8J2S597/e4XdqQzoJ1HkGnTnYM/p9SE9SDh+ewsL5fSKpTAkI6Fqb8
    Kt+cnNE1oKpk3al0OvTafH2uoQjHHL/sDTcbziIL/OnJSk8+KTOOQXoeA6UOIK3FsVzSAc
    f9egYZ7JZWd6HuU2mcxZ/iBVxuuq2rVaXVhiDY6dNAfiSMG3piKxDPFq4fLgxgAFvTk6Ab
    QZg9hEtY+5UyCKI1KTVPM/6McUAlMe3Kthtj6WRz9ocbJrohWWccRXNmfzSNpmaodLk9Pe
    LCOZFdgShIYAIaOiTC6z/ejpiTvaNv+nzDCne2dgVbsJ9Uspu3PU27eFdarQ
X-ME-Proxy: <xmx:n2SFamvq6udO082kqIsrC2-PKNonInLeTrP-9h1R-hzJmBq-ZFgjKQ>
    <xmx:n2SFao1aBkZuvbQfb-GTZwUqbAVQJ6tKIMURDFg6MbzUstiP5pxLMQ>
    <xmx:n2SFarRMfQjvU6_KqYGfeCwTDh_NZwD8FIYmFFQANtp6OLRFS_ux4g>
    <xmx:n2SFascirofo22s0ZbqCYdSo-lzXx8R1ue1c1Dn3RJRINHsant7YVA>
    <xmx:n2SFasceUDwS5YU-DoDuJ0Itb0NI5IFaHERFdB2MN1BhyEu2rn9pjsr7>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 43734F80074; Wed, 19 Aug 2026 04:09:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 19 Aug 2026 11:08:39 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>
Cc: "Thorsten Leemhuis" <regressions@leemhuis.info>,
 regressions@lists.linux.dev, laura.nao@collabora.com,
 shreeya.patel@collabora.com, "Mark Brown" <broonie@kernel.org>,
 kernelci-results@groups.io, kernelci@lists.linux.dev,
 "Arnd Bergmann" <arnd@arndb.de>
Message-Id: <e5c6c56c-b0e2-4950-996a-4f9321a1a57a@app.fastmail.com>
In-Reply-To: <20260818175209.GA1675024@ax162>
References: <178701474442.5156.12765087253678603047@kernelci.org>
 <c9ba4aeb-a288-4597-b13a-9da55666f96a@leemhuis.info>
 <CAKwvOdkcCnhM-395QVriu3hnjmtX1H-3i_1tU5Jpb1Ybr2Q77g@mail.gmail.com>
 <20260818165116.GA1335107@ax162> <20260818175209.GA1675024@ax162>
Subject: Re: [REGRESSION] mainline/master: (build) in arch/arm/kernel/entry-common.o
 (/tmp/kci/linux/scripts/Makefile...
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Tue, 18 Aug 2026, at 20:52, Nathan Chancellor wrote:
> On Tue, Aug 18, 2026 at 09:51:21AM -0700, Nathan Chancellor wrote:
>> On Tue, Aug 18, 2026 at 09:19:04AM -0700, Nick Desaulniers wrote:
>> > + Ard
>> >=20
>> > On Mon, Aug 17, 2026 at 11:00=E2=80=AFPM Thorsten Leemhuis
>> > <regressions@leemhuis.info> wrote:
>> > > Nathan, Nick, do you still care about clang problems like this?
>> >=20
>> > Yes, from the logs, it looks like ARCH=3Darm allmodconfig with clan=
g-21
>> > (perhaps, there's a funny warning about the compiler version in the
>> > logs).
>> >=20
>> > > And do
>> > > you by chance know what's wrong here?
>> > >
>> > > """
>> > > <instantiation>:2:11: error: out of range pc-relative fixup value
>> > >  ldr r10, =3D__per_cpu_offset
>> > >           ^
>> > > <instantiation>:2:11: error: out of range pc-relative fixup value
>> > >  ldr tsk, =3D__current
>> > >           ^
>> > > <instantiation>:2:11: error: out of range pc-relative fixup value
>> > >  ldr tsk, =3D__current
>> > >           ^
>> >=20
>> > Smells like the same problem that was addressed by
>> > commit 5fe41793bc78 ("ARM: 9176/1: avoid literal references in inli=
ne assembly")
>> >=20
>> > What tree was being tested? 5fe41793bc78 landed in v5.18-rc1. Whate=
ver
>> > was being tested is probably missing that patch.
>>=20
>> As Mark notes, this is mainline. This error is visible with LLVM 23 as
>> well. I bisected it to commit 79d27fd71854 ("arch: hookup fchroot()
>> system call").
>>=20
>> I do see that change in -next and there is no error there so was this=
 a
>> known issue that was fixed in another tree? I will keep looking.
>
> It looks like commit 25900bd99d4d ("ARM: limit OABI support to StrongA=
RM
> CPUs") in the soc tree avoids this error by disabling CONFIG_OABI_COMP=
AT
> for allmodconfig. If I disable that on top of allmodconfig with current
> mainline, the error goes away.
>
> I narrowed down a reproducer to
>
>   $ cat arch/arm/configs/repro.config
>   CONFIG_ARCH_MULTI_V6=3Dy
>   CONFIG_ARCH_REALVIEW=3Dy
>   CONFIG_COMPILE_TEST=3Dy
>   CONFIG_MACH_REALVIEW_PB1176=3Dy
>   CONFIG_OABI_COMPAT=3Dy
>
>   $ make -skj"$(nproc)" ARCH=3Darm LLVM=3D1 mrproper defconfig repro.c=
onfig=20
> arch/arm/kernel/entry-common.o
>   <instantiation>:2:11: error: out of range pc-relative fixup value
>    ldr r10, =3D__per_cpu_offset
>             ^
>   <instantiation>:2:11: error: out of range pc-relative fixup value
>    ldr tsk, =3D__current
>             ^
>   <instantiation>:2:11: error: out of range pc-relative fixup value
>    ldr tsk, =3D__current
>             ^
>
> CONFIG_COMPILE_TEST is necessary because it turns off
> CONFIG_ARM_HAS_GROUP_RELOCS, which seems relevant here.
>

We're falling back to the mov_l asm macro in this case.

This is unfortunate, because the only reason to avoid these group
relocations is making allyesconfig work, now that LLD has caught up.

I did not manage to reproduce this, but if this is something we care
deeply about, we might tweak mov_l as below when COMPILE_TEST is set,
so that the literal pool is always in range.


--- a/arch/arm/include/asm/assembler.h
+++ b/arch/arm/include/asm/assembler.h
@@ -636,6 +636,12 @@
        .macro          mov_l, dst:req, imm:req, cond
        .if             __LINUX_ARM_ARCH__ < 7
        ldr\cond        \dst, =3D\imm
+#ifdef CONFIG_COMPILE_TEST
+       /* The literal may go out of range in pathological cases */
+       b               .L\@
+       .ltorg
+.L\@:
+#endif
        .else
        movw\cond       \dst, #:lower16:\imm
        movt\cond       \dst, #:upper16:\imm
