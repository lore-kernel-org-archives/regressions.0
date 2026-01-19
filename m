Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC3B21FF26
	for <regressions@lists.linux.dev>; Mon, 19 Jan 2026 20:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768853984; cv=none; b=XAcmdXxgA94TXQBvo//OriH7j7y8hGQXEkV+iaWrI/CWU5vZujPDfyitw43WbSmHDTXJHcS4AxWg1xQVRvJu2EUCJMPfi43GX40DUd7bTivth45fHolY2LfcfSORvsj2DWffomRXeDgND0NDARvcsVxCAEhlgtC/3NOfuOVIAYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768853984; c=relaxed/simple;
	bh=zaC2qTrN5bA4wu2+/1/syFQCIEgSz0rj/0LOsc6Gv24=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BYZfPE49+FBfhJ6UAQX36IiXKcZ05z7OM9sYhZzP9Xqel1KqyYrI2m18CXDuY4ZyJwru/15D/Z4zA96pxo4ZtTl6WYymU14IrYPL/VxJaZBl/+l5tqgOCoE/R2YthiZALeovJvc/FC9e7aiPka0BlIjIdQpMYzgEQqgLyCsEBCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWKQw3Vd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWKQw3Vd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A501EC19422
	for <regressions@lists.linux.dev>; Mon, 19 Jan 2026 20:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768853983;
	bh=zaC2qTrN5bA4wu2+/1/syFQCIEgSz0rj/0LOsc6Gv24=;
	h=From:Date:Subject:To:Cc:From;
	b=FWKQw3VdvY2xAux6eLNWDNEHUgd5xCiGOG2PTJ5sm1PiKc49SPo1+5uF/qJM0szxf
	 g4dwTzYkkJjiAPGuPKUuAOly5QjRtYO5JNj5ZWbLQEyXgC/tNTQ+stm6+AsoXrYEaL
	 7KOXtJjTRd2f+d9giaU1neNxpgu1NQkhYmzwDmTW+/TS5/UMBP6jw5quF0jd+VvwyB
	 hAJ/dAX1l2GBrD1kFk3Oy25uUX3XBmtnEBg9PeVpVdZi4DbxBHYvy9JBGGnfGXCiab
	 Rj65YKijFOyMjfkgSL2wkxwNJAav9uWhxkB5ArGb3vE15Vw5aSaqDdrWSlXrrF3BMl
	 5yJIuuIfj4aIw==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4045ccdd239so1058494fac.2
        for <regressions@lists.linux.dev>; Mon, 19 Jan 2026 12:19:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUV07C/kjJMsB2FPrSRwSSJbplgMWm/sRKrVL4sOEbNjdmvbuD9/Xv3cZQXOB9VUHU/IjMkd59gKUm4sg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2CxntyIItSsCA1S1oKvgymW0gl5CktDmA5DjmQYyzBVAJrIRR
	L3jWJhm/gxo9eDuifuZ0PsU3WeBBcmpStqq3/9HkkROOz0zbqjJAhhBUPuIgbm2AOjbpiKiG9t7
	fA1DaNikDpla+fXVxuG2m42/UziIOMNE=
X-Received: by 2002:a05:6820:160a:b0:659:9a49:9099 with SMTP id
 006d021491bc7-6611796adb5mr5007918eaf.24.1768853982741; Mon, 19 Jan 2026
 12:19:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 19 Jan 2026 21:19:31 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gkhSxWZ9wTY+2AGDCtZgSKmOwpg7Np9OVDMJptqnntUQ@mail.gmail.com>
X-Gm-Features: AZwV_QjoOLWGYF5ZfynLYMzpuvz14X4O_f289bVEz3-ZE9DjD2gspsx0ESZFpQU
Message-ID: <CAJZ5v0gkhSxWZ9wTY+2AGDCtZgSKmOwpg7Np9OVDMJptqnntUQ@mail.gmail.com>
Subject: [Regression in 6.19-rc6] Build breakage after commit 436326bc525d
To: Sasha Levin <sashal@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, "the arch/x86 maintainers" <x86@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

Commit 436326bc525d ("objtool: fix build failure due to missing
libopcodes check") breaks kernel build for me.

Here's what I get when I try to build the kernel after that commit:

  LD      /scratch/rafael/work/build/xps13/tools/objtool/objtool-in.o
  LINK    /scratch/rafael/work/build/xps13/tools/objtool/objtool
/usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
/usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
in function `print_operands':
/home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:3945:(.text+0x6317):
undefined reference to `xmalloc'
/usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
/home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:3992:(.text+0x6723):
undefined reference to `_sch_istable'
/usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
/usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
in function `print_insn_aarch64':
/home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:4559:(.text+0x6b1e):
undefined reference to `bfd_get_bits'
/usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
/usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
in function `parse_aarch64_dis_option':
/home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:103:(.text+0x6dea):
undefined reference to `_bfd_error_handler'
/usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
/usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-opc.o):
in function `init_insn_sequence':
/home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-opc.c:5561:(.text+0x5c06):
undefined reference to `xcalloc'
/usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
/usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(disassemble.o):
in function `remove_whitespace_and_extra_commas':
/home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/disassemble.c:801:(.text+0x346):
undefined reference to `_sch_istable'
...

(many more similar messages skipped).

Reverting commit 436326bc525d makes the problem go away.

BR, Rafael
