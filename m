Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906563C00AE
	for <regressions@lists.linux.dev>; Tue, 20 Jan 2026 21:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768944810; cv=none; b=sVqUVbxNavZmfeoCI1Uxfu7ZdhqLsSKa13iGaMz2N6DVTfnKrUlrg7drsomA2/W8uRn8Ory7vOEutJ8i74xh2rHTP2DyYOxTQRx36FQ1t8Gv9MUO9EAxj4H7VuHOngIOnysEuc//MN1xZxZaD6ezSoVYbyNs2ZPnht8cAPx7fio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768944810; c=relaxed/simple;
	bh=5tUtJYwOHNw5OXfJe+v4SbHbwcane96w8xOI7Qr/p1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFCaKbXFWBQ7WLc8cWTsgS29cPMmWwSDAF21dfIbJTyHuOsoj63Tl9Vm+R674A2xmnAbdukZEQ/KZ2X3LWYOGDhxievAQgBbbxDatH3k/RCFD7CrDODd1rNS1NgodeEGCtYbaA3BSccab/MFDXzzd+jhpKoeQYCCSqkqpvsuRis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=unFwvavP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="unFwvavP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD007C19421
	for <regressions@lists.linux.dev>; Tue, 20 Jan 2026 21:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768944809;
	bh=5tUtJYwOHNw5OXfJe+v4SbHbwcane96w8xOI7Qr/p1c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=unFwvavP79TlA9RTA1z34fsvj/O7m10ZPEynSiyc+wRWqpu5wOkiuxS46I1htr3A0
	 moJfM0jST8BDSIShQ0GNJdDURbrr2Uk/DZNMuWaFwsH3vxGksJwWrgpzfyPwD1vimj
	 tIHow7ryvtC7HeqDWU5qA8OW9wIfmTGwctY3dm5BvJMdX/grpXFQwSIds7apQ8HXDZ
	 RumNBgQKWpEg28pQSN2PgWv5RPMZb8GBMMdBjXNlzF3bidntvArkEbrIOg29wD8dFw
	 RWzGjTAlHWzNvMQqES9cgX6g5HFbSqCaEY77BtZaCrxab9bMe9ce4cVJviowdcJisK
	 QwYnA+kIyCfyg==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-65f67f56b81so2442652eaf.0
        for <regressions@lists.linux.dev>; Tue, 20 Jan 2026 13:33:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUi4M14YbANz3ZpNbNFrJqpcU/vEioYmh1WhSnaaxShfWRNOZttNsdVJXRQM2RwGOmS4128n3jBDoFS+w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi0o+Ufvk3LoEAL5cTcf1k/4GFmGpNLXJta4eMYPJY/+MeTW62
	qwOtA9i8aUS/sCmilRskZqxO7a6AId3MxTOVmbiNNxCjnANBsOM05tX1yN3YRUcy3GNOutZWkGh
	1HeQ+kGi6G7cG7XC4H/gtkxze1RhTUT8=
X-Received: by 2002:a05:6820:1893:b0:659:9a49:8fe1 with SMTP id
 006d021491bc7-6611793c576mr7540309eaf.14.1768944803957; Tue, 20 Jan 2026
 13:33:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJZ5v0gkhSxWZ9wTY+2AGDCtZgSKmOwpg7Np9OVDMJptqnntUQ@mail.gmail.com>
 <20260120102832.GJ1890602@noisy.programming.kicks-ass.net>
 <aW--GBGlZ6FH2m8P@laps> <CAJZ5v0i6Uw0+L5SY3QW+py82uEVktNWcHGHf=Za96mQpN7X8Bw@mail.gmail.com>
 <aW_eTgksTr1P2Gh1@laps> <CAJZ5v0g2S9_nCxmO=3pc24ESQ=qSFRWoZwfDw4W6hkXc3uo3qQ@mail.gmail.com>
 <aW_j_aqyipRqtupO@laps>
In-Reply-To: <aW_j_aqyipRqtupO@laps>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 20 Jan 2026 22:33:12 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0h11g4jcXghK4FL=di4jirYDwMcf1m=k7E=Jpc5VobciA@mail.gmail.com>
X-Gm-Features: AZwV_QjeapQlx06s2rVGQCIRkJ1U_OKw1IeCqFJnIvh3UVkfrqJBbAPTGvKHNRk
Message-ID: <CAJZ5v0h11g4jcXghK4FL=di4jirYDwMcf1m=k7E=Jpc5VobciA@mail.gmail.com>
Subject: Re: [Regression in 6.19-rc6] Build breakage after commit 436326bc525d
To: Sasha Levin <sashal@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	"the arch/x86 maintainers" <x86@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, irogers@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 9:22=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> On Tue, Jan 20, 2026 at 09:04:25PM +0100, Rafael J. Wysocki wrote:
> >On Tue, Jan 20, 2026 at 8:58=E2=80=AFPM Sasha Levin <sashal@kernel.org> =
wrote:
> >>
> >> On Tue, Jan 20, 2026 at 07:29:58PM +0100, Rafael J. Wysocki wrote:
> >> >On Tue, Jan 20, 2026 at 6:40=E2=80=AFPM Sasha Levin <sashal@kernel.or=
g> wrote:
> >> >>
> >> >> On Tue, Jan 20, 2026 at 11:28:32AM +0100, Peter Zijlstra wrote:
> >> >> >On Mon, Jan 19, 2026 at 09:19:31PM +0100, Rafael J. Wysocki wrote:
> >> >> >> Hi Sasha,
> >> >> >>
> >> >> >> Commit 436326bc525d ("objtool: fix build failure due to missing
> >> >> >> libopcodes check") breaks kernel build for me.
> >> >> >>
> >> >> >> Here's what I get when I try to build the kernel after that comm=
it:
> >> >> >>
> >> >> >>   LD      /scratch/rafael/work/build/xps13/tools/objtool/objtool=
-in.o
> >> >> >>   LINK    /scratch/rafael/work/build/xps13/tools/objtool/objtool
> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linu=
x/bin/ld:
> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes=
.a(aarch64-dis.o):
> >> >> >> in function `print_operands':
> >> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../.=
./opcodes/aarch64-dis.c:3945:(.text+0x6317):
> >> >> >> undefined reference to `xmalloc'
> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linu=
x/bin/ld:
> >> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../.=
./opcodes/aarch64-dis.c:3992:(.text+0x6723):
> >> >> >> undefined reference to `_sch_istable'
> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linu=
x/bin/ld:
> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes=
.a(aarch64-dis.o):
> >> >> >> in function `print_insn_aarch64':
> >> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../.=
./opcodes/aarch64-dis.c:4559:(.text+0x6b1e):
> >> >> >> undefined reference to `bfd_get_bits'
> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linu=
x/bin/ld:
> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes=
.a(aarch64-dis.o):
> >> >> >> in function `parse_aarch64_dis_option':
> >> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../.=
./opcodes/aarch64-dis.c:103:(.text+0x6dea):
> >> >> >> undefined reference to `_bfd_error_handler'
> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linu=
x/bin/ld:
> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes=
.a(aarch64-opc.o):
> >> >> >> in function `init_insn_sequence':
> >> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../.=
./opcodes/aarch64-opc.c:5561:(.text+0x5c06):
> >> >> >> undefined reference to `xcalloc'
> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linu=
x/bin/ld:
> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes=
.a(disassemble.o):
> >> >> >> in function `remove_whitespace_and_extra_commas':
> >> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../.=
./opcodes/disassemble.c:801:(.text+0x346):
> >> >> >> undefined reference to `_sch_istable'
> >> >> >> ...
> >> >> >>
> >> >> >> (many more similar messages skipped).
> >> >> >>
> >> >> >> Reverting commit 436326bc525d makes the problem go away.
> >> >>
> >> >> Thanks for the report Rafael!
> >> >>
> >> >> Could you confirm that you're linking against static libraries? I h=
aven't
> >> >> tested that scenario.
> >> >
> >> >How do I check that?
> >>
> >> What do you get running the below?
> >>
> >>    ls /usr/lib/*/libopcodes*
> >
> >"No such file or directory"
> >
> >However,
> >
> >> ls /usr/lib64/libopcodes*
> >/usr/lib64/libopcodes-2.45.0.20251103-150100757.so  /usr/lib64/libopcode=
s.a
>
> The linker looks for libopcodes.so (not the versioned .so). Without that
> symlink, it falls back to libopcodes.a. So yes, looks like you're using s=
tatic
> linking.
>
> To confirm, can you try to:
>
>    sudo ln -s libopcodes-2.45.0.20251103-150100757.so /usr/lib64/libopcod=
es.so
>
> Any then running the build again?

Yes, this makes the build work (without reverting the commit in question).
