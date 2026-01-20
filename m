Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513F7314D3D
	for <regressions@lists.linux.dev>; Tue, 20 Jan 2026 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768939478; cv=none; b=Yr1+nguLL6WxbRt7+Pf8msYfePQeRgxdveNMXgm3k4RN54ApISAcLrDzTLkCWwGvHXg/QD1pOtdWHCXFRP6WQ+LRGADz9YJfothoSnyaS28gDvctW5zGaWo3dB9P/NShCLefOB0vYO5u9KzPhsI6igY8K3v+b1r3anQyzEkmjKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768939478; c=relaxed/simple;
	bh=BtE7JZ29XvXAXsMoH+lnsvfLMzeFcUQHm8Kr/ht8OXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uupn5Gd0BJt3rx6wUkTEXqF0H8Hn3qub6TwfGzItsP300ebp3WBDxHjYCLvWsuFXN2Mn16RDa9HUrqAkibxqbC6w9cT6HuqHrKnQ8TZ+Bc6qRMiY8VLbIsVBewWrQug98zDU6cxms8b170VSqq610uDr9sMP+ezZuZCOgerUQP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khO5JaOB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khO5JaOB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00307C19422
	for <regressions@lists.linux.dev>; Tue, 20 Jan 2026 20:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768939478;
	bh=BtE7JZ29XvXAXsMoH+lnsvfLMzeFcUQHm8Kr/ht8OXE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=khO5JaOBZyW4sikn7dsfRSjCyy9m4t7oNJsfHAfgPSx/EVd4zHl+Gif90eFCCbNJ+
	 bJMn1i5UGtDTUwyUG0xW+irKIR0QFINXbYHFjmLSPof6GxpDV0NngbTfibzoXMnRc8
	 ztLorAYw33yrAVJo98OCfJd9OYEAsW1tMNeschs9YJdN83xm47nR3SlPCJHe6fcMXu
	 7uRO3rgUl0lu9kuIx+b/6pi7yJQBwQfQtBuWhxQ9gIhUyCmNICaZVRVxFpdqQh8L6r
	 zyVzAxfsi7nM6m7Q13L9hE6CzEVNHPvAO/rNfc9WafQ9QoUJeyhB6G1F/jgcBN0LBz
	 4SIeuDq2XcRow==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-3ffc3d389a8so3920382fac.1
        for <regressions@lists.linux.dev>; Tue, 20 Jan 2026 12:04:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmDEw+/ZHaO/1W3y73Rcz/oueL6kuR2DzYMvQxQ05j9LedGelfsm70V1TUiaco2ywKT1vFfGVZwEkGHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxnu2oLzcCoRmcOnfJ7icpvmg4M/DBo54o6faYM/XQq4Y3H+nVS
	Q9g9HuPd0aIQdtCJF8Qz7iwbM/Zj0IWmbZeCQrcK2DD75rFB+1bYy4ie/Ee6FVtoaPBqlT/mXGs
	Dse2B5hbl+bL48BiaQ1auwDHzn33qM0M=
X-Received: by 2002:a05:6820:c96:b0:65f:71ec:4ec8 with SMTP id
 006d021491bc7-6611897dc3bmr6529467eaf.47.1768939477029; Tue, 20 Jan 2026
 12:04:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJZ5v0gkhSxWZ9wTY+2AGDCtZgSKmOwpg7Np9OVDMJptqnntUQ@mail.gmail.com>
 <20260120102832.GJ1890602@noisy.programming.kicks-ass.net>
 <aW--GBGlZ6FH2m8P@laps> <CAJZ5v0i6Uw0+L5SY3QW+py82uEVktNWcHGHf=Za96mQpN7X8Bw@mail.gmail.com>
 <aW_eTgksTr1P2Gh1@laps>
In-Reply-To: <aW_eTgksTr1P2Gh1@laps>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 20 Jan 2026 21:04:25 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g2S9_nCxmO=3pc24ESQ=qSFRWoZwfDw4W6hkXc3uo3qQ@mail.gmail.com>
X-Gm-Features: AZwV_Qhij6ltIT4-09dj-J8EHlVaLLAR2lbPqLiziFAGNK5TJjjI2oAujVSluoI
Message-ID: <CAJZ5v0g2S9_nCxmO=3pc24ESQ=qSFRWoZwfDw4W6hkXc3uo3qQ@mail.gmail.com>
Subject: Re: [Regression in 6.19-rc6] Build breakage after commit 436326bc525d
To: Sasha Levin <sashal@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	"the arch/x86 maintainers" <x86@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, irogers@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 8:58=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> On Tue, Jan 20, 2026 at 07:29:58PM +0100, Rafael J. Wysocki wrote:
> >On Tue, Jan 20, 2026 at 6:40=E2=80=AFPM Sasha Levin <sashal@kernel.org> =
wrote:
> >>
> >> On Tue, Jan 20, 2026 at 11:28:32AM +0100, Peter Zijlstra wrote:
> >> >On Mon, Jan 19, 2026 at 09:19:31PM +0100, Rafael J. Wysocki wrote:
> >> >> Hi Sasha,
> >> >>
> >> >> Commit 436326bc525d ("objtool: fix build failure due to missing
> >> >> libopcodes check") breaks kernel build for me.
> >> >>
> >> >> Here's what I get when I try to build the kernel after that commit:
> >> >>
> >> >>   LD      /scratch/rafael/work/build/xps13/tools/objtool/objtool-in=
.o
> >> >>   LINK    /scratch/rafael/work/build/xps13/tools/objtool/objtool
> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/b=
in/ld:
> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(=
aarch64-dis.o):
> >> >> in function `print_operands':
> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../o=
pcodes/aarch64-dis.c:3945:(.text+0x6317):
> >> >> undefined reference to `xmalloc'
> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/b=
in/ld:
> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../o=
pcodes/aarch64-dis.c:3992:(.text+0x6723):
> >> >> undefined reference to `_sch_istable'
> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/b=
in/ld:
> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(=
aarch64-dis.o):
> >> >> in function `print_insn_aarch64':
> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../o=
pcodes/aarch64-dis.c:4559:(.text+0x6b1e):
> >> >> undefined reference to `bfd_get_bits'
> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/b=
in/ld:
> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(=
aarch64-dis.o):
> >> >> in function `parse_aarch64_dis_option':
> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../o=
pcodes/aarch64-dis.c:103:(.text+0x6dea):
> >> >> undefined reference to `_bfd_error_handler'
> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/b=
in/ld:
> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(=
aarch64-opc.o):
> >> >> in function `init_insn_sequence':
> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../o=
pcodes/aarch64-opc.c:5561:(.text+0x5c06):
> >> >> undefined reference to `xcalloc'
> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/b=
in/ld:
> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(=
disassemble.o):
> >> >> in function `remove_whitespace_and_extra_commas':
> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../o=
pcodes/disassemble.c:801:(.text+0x346):
> >> >> undefined reference to `_sch_istable'
> >> >> ...
> >> >>
> >> >> (many more similar messages skipped).
> >> >>
> >> >> Reverting commit 436326bc525d makes the problem go away.
> >>
> >> Thanks for the report Rafael!
> >>
> >> Could you confirm that you're linking against static libraries? I have=
n't
> >> tested that scenario.
> >
> >How do I check that?
>
> What do you get running the below?
>
>    ls /usr/lib/*/libopcodes*

"No such file or directory"

However,

> ls /usr/lib64/libopcodes*
/usr/lib64/libopcodes-2.45.0.20251103-150100757.so  /usr/lib64/libopcodes.a
