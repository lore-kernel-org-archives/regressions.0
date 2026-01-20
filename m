Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285B6441031
	for <regressions@lists.linux.dev>; Tue, 20 Jan 2026 18:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768933812; cv=none; b=Tvc4NhokQAgVFXpuQrzSKrP7F3mbj5LzrbiDE8bzWQzn82Qu5nLok++THHMqePCut35YMa+lfmUqPMbI4R8HSzoCN4x4+ttJ+yDx9REHEgqio5PxwQln1zOjMCb8i8UBuY6d7mhXdJl8fSpxEzdr7419idOX7WLxLwRESWKjjjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768933812; c=relaxed/simple;
	bh=Fpp/8BQXFSOh7igofcI4AWwSUmZCSYco9Av/dOYiolc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyQtRmyrAaLvEZnKt9xVAi3zr1NG+gq5LMoknJVpK3QOE75EmW1QkRXCV++WYnYHer8XRpDQAunRF1ymH11hriCBDUqFVDF3usJ3CrvzgkLMXgSxKWojtSzdkR8jzrx7ugw50wupJ1TRklZB+Ybt5jXboTW23a5HYy3lBL/irUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyHmua08; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyHmua08"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA763C19422
	for <regressions@lists.linux.dev>; Tue, 20 Jan 2026 18:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768933811;
	bh=Fpp/8BQXFSOh7igofcI4AWwSUmZCSYco9Av/dOYiolc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fyHmua084bNjo25S9RQQQq8et79JVMTMbrY3CsWUNMRNyzgM5RdJRDhnMk9PMvZ5L
	 PvcvRliWtaGXlhzmi8LcTnu0PKYytI1icavsWNMRx86YvoIji/OFeIKH++jo45LoIn
	 MDyr4xF+CQrY+2og9cD02TgCHBfuLqxYC1Yb+I0ET0CEubK/N3oGRFor6fc0jd9pLl
	 Y+rmu5S2jTAIDQDDyJEY9Nx4oG/ax1ZU/XE5JirKq3OVhqDiyq6t6dabYNvToIaha2
	 Ix7+z6oBGeCNCuCjrO3RAXhglFJercEv6wzZKZ/JFSpgtQTDBoGihH++TC1AIJTYJc
	 sS09ZRI/cAGOg==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-66109b09b53so1908844eaf.1
        for <regressions@lists.linux.dev>; Tue, 20 Jan 2026 10:30:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbsub+sPTpazUfjWgGLlG+hWQ3A/HddVbYQbaKbYnMDyhFXvolLfqmFw4EOOx8YrlAI9ozaYSCoOA7qw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyewqwpkU/MtCc84d2IVAxRjBS0RtxL1mJNMz36Mg187Y+Hx9xm
	d9IcHg7GDO5/u0nTgGl+6KdAV1CHWjYcdx4OuaTxHzLmRIDPvds0bCwaPUeSQ1Xgq1K9QIMWQff
	iAnMDXdkeQOD83ZGXfBdHg5ZPUTuum/0=
X-Received: by 2002:a05:6820:4611:b0:65e:eec4:6fbc with SMTP id
 006d021491bc7-661179335a0mr4912102eaf.1.1768933810673; Tue, 20 Jan 2026
 10:30:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJZ5v0gkhSxWZ9wTY+2AGDCtZgSKmOwpg7Np9OVDMJptqnntUQ@mail.gmail.com>
 <20260120102832.GJ1890602@noisy.programming.kicks-ass.net> <aW--GBGlZ6FH2m8P@laps>
In-Reply-To: <aW--GBGlZ6FH2m8P@laps>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 20 Jan 2026 19:29:58 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0i6Uw0+L5SY3QW+py82uEVktNWcHGHf=Za96mQpN7X8Bw@mail.gmail.com>
X-Gm-Features: AZwV_QhZniuwE5scOREHv4G5F_ULTyDyaKj2KXHUvkoGkfwn1K0Ekm0k7BB09W8
Message-ID: <CAJZ5v0i6Uw0+L5SY3QW+py82uEVktNWcHGHf=Za96mQpN7X8Bw@mail.gmail.com>
Subject: Re: [Regression in 6.19-rc6] Build breakage after commit 436326bc525d
To: Sasha Levin <sashal@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	"the arch/x86 maintainers" <x86@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, irogers@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 6:40=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> On Tue, Jan 20, 2026 at 11:28:32AM +0100, Peter Zijlstra wrote:
> >On Mon, Jan 19, 2026 at 09:19:31PM +0100, Rafael J. Wysocki wrote:
> >> Hi Sasha,
> >>
> >> Commit 436326bc525d ("objtool: fix build failure due to missing
> >> libopcodes check") breaks kernel build for me.
> >>
> >> Here's what I get when I try to build the kernel after that commit:
> >>
> >>   LD      /scratch/rafael/work/build/xps13/tools/objtool/objtool-in.o
> >>   LINK    /scratch/rafael/work/build/xps13/tools/objtool/objtool
> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/=
ld:
> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aar=
ch64-dis.o):
> >> in function `print_operands':
> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opco=
des/aarch64-dis.c:3945:(.text+0x6317):
> >> undefined reference to `xmalloc'
> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/=
ld:
> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opco=
des/aarch64-dis.c:3992:(.text+0x6723):
> >> undefined reference to `_sch_istable'
> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/=
ld:
> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aar=
ch64-dis.o):
> >> in function `print_insn_aarch64':
> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opco=
des/aarch64-dis.c:4559:(.text+0x6b1e):
> >> undefined reference to `bfd_get_bits'
> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/=
ld:
> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aar=
ch64-dis.o):
> >> in function `parse_aarch64_dis_option':
> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opco=
des/aarch64-dis.c:103:(.text+0x6dea):
> >> undefined reference to `_bfd_error_handler'
> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/=
ld:
> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aar=
ch64-opc.o):
> >> in function `init_insn_sequence':
> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opco=
des/aarch64-opc.c:5561:(.text+0x5c06):
> >> undefined reference to `xcalloc'
> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/=
ld:
> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(dis=
assemble.o):
> >> in function `remove_whitespace_and_extra_commas':
> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opco=
des/disassemble.c:801:(.text+0x346):
> >> undefined reference to `_sch_istable'
> >> ...
> >>
> >> (many more similar messages skipped).
> >>
> >> Reverting commit 436326bc525d makes the problem go away.
>
> Thanks for the report Rafael!
>
> Could you confirm that you're linking against static libraries? I haven't
> tested that scenario.

How do I check that?
