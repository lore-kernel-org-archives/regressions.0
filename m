Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231C3421EFF;
	Tue, 20 Jan 2026 17:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768930843; cv=none; b=E56PsPX9/3iFIhq90MI9Yy0CvZ7U2Ji0pjrzLYy9Ef4UwTCxVFRQhM5P7fqzCiukbkoU2vYoV8poE9dEF8WVz26Zfn0Sffff+4LQbyWKAmGU0hMKj8Wck4WTKyJbKNiIWweRDwyrPa1JeCdJRYVLUuxQOnS+D67DuMigH6wizWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768930843; c=relaxed/simple;
	bh=Mnexb/wtCXISiei/N4ynXc3ieglnwPBr/cnLR6r2Als=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQ5FrrZUE8Kos6EIfjpka+NfqnVbqdpLu9d2p8CtSxUBeHifwfDVVpkG3K+6ye/tnQeTYjsAWawLHCRWdj8WZxSiFPf8Ze80VsApWnQTkiE30UAyM75fEhdHg31OWh2NcngDuasOAjurRnPNYr1OENzTKvv5Nr+pGD2dJVrRVtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Co9Az+cN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Co9Az+cN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62127C16AAE;
	Tue, 20 Jan 2026 17:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768930842;
	bh=Mnexb/wtCXISiei/N4ynXc3ieglnwPBr/cnLR6r2Als=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Co9Az+cNLNncyYWo3Kn7S9co8123sLrFvTdFA4pst6jVvVBym33Wee+QnfiuipzGf
	 siaFWjUtoSrjditORSZRBSNYsCBeA07TKSp8RRKr9pfb/sugM9ZC/uupDoePh7XEFS
	 XxQfOt6CjHDsyZ/cY4XtXepbPIxl0hbHhLNY93C/kaWPMO+S9+CoI74Xs6s2XU8Ims
	 4wXFbr31LT8G04RMAZbV8XGeHarJQSTQ4L9ldpwmVxmTvaMwmGXtjOdFpYUBl6mIAe
	 Rr9vtGksIrm83MT3rIkkehxMjYe9FZItuvfFggMw42JuwBBvixF1Ug3dTYsMSnKqwa
	 U0u4mfImdd0xw==
Date: Tue, 20 Jan 2026 12:40:40 -0500
From: Sasha Levin <sashal@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	irogers@google.com
Subject: Re: [Regression in 6.19-rc6] Build breakage after commit 436326bc525d
Message-ID: <aW--GBGlZ6FH2m8P@laps>
References: <CAJZ5v0gkhSxWZ9wTY+2AGDCtZgSKmOwpg7Np9OVDMJptqnntUQ@mail.gmail.com>
 <20260120102832.GJ1890602@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260120102832.GJ1890602@noisy.programming.kicks-ass.net>

On Tue, Jan 20, 2026 at 11:28:32AM +0100, Peter Zijlstra wrote:
>On Mon, Jan 19, 2026 at 09:19:31PM +0100, Rafael J. Wysocki wrote:
>> Hi Sasha,
>>
>> Commit 436326bc525d ("objtool: fix build failure due to missing
>> libopcodes check") breaks kernel build for me.
>>
>> Here's what I get when I try to build the kernel after that commit:
>>
>>   LD      /scratch/rafael/work/build/xps13/tools/objtool/objtool-in.o
>>   LINK    /scratch/rafael/work/build/xps13/tools/objtool/objtool
>> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
>> in function `print_operands':
>> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:3945:(.text+0x6317):
>> undefined reference to `xmalloc'
>> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:3992:(.text+0x6723):
>> undefined reference to `_sch_istable'
>> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
>> in function `print_insn_aarch64':
>> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:4559:(.text+0x6b1e):
>> undefined reference to `bfd_get_bits'
>> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
>> in function `parse_aarch64_dis_option':
>> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:103:(.text+0x6dea):
>> undefined reference to `_bfd_error_handler'
>> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-opc.o):
>> in function `init_insn_sequence':
>> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-opc.c:5561:(.text+0x5c06):
>> undefined reference to `xcalloc'
>> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(disassemble.o):
>> in function `remove_whitespace_and_extra_commas':
>> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/disassemble.c:801:(.text+0x346):
>> undefined reference to `_sch_istable'
>> ...
>>
>> (many more similar messages skipped).
>>
>> Reverting commit 436326bc525d makes the problem go away.

Thanks for the report Rafael!

Could you confirm that you're linking against static libraries? I haven't
tested that scenario.

>Bah, I hate makefiles.
>
>Anyway, the below is that revert + adding an explicit libbfd-opcodes
>feature test.

If the issue is indeed static libs, then I don't think that the below would
work.

I think that we need to explicitly list out all the dependencies rather than
just -lopcodes.

With only -lopcodes:

$ echo '#include <dis-asm.h>                                                                                                                                              
   int main(void) { disassemble_init_for_target(NULL); return 0; }' | gcc -xc - -DPACKAGE='"test"' -lopcodes -o /tmp/test

/usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/15/../../../x86_64-linux-gnu/libopcodes.a(i386-dis.o): warning: relocation against `_sch_istable' in read-only section `.text'
/usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/15/../../../x86_64-linux-gnu/libopcodes.a(i386-dis.o): in function `i386_dis_printf':
./builddir-single/opcodes/../../opcodes/i386-dis.c:9675:(.text+0x673): undefined reference to `_sch_istable'
/usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/15/../../../x86_64-linux-gnu/libopcodes.a(i386-dis.o): in function `putop':
./builddir-single/opcodes/../../opcodes/i386-dis.c:10825:(.text+0x8f65): undefined reference to `_sch_istable'
/usr/bin/ld: ./builddir-single/opcodes/../../opcodes/i386-dis.c:11075:(.text+0x9eb1): undefined reference to `_sch_istable'
/usr/bin/ld: ./builddir-single/opcodes/../../opcodes/i386-dis.c:10919:(.text+0xa007): undefined reference to `_sch_istable'
/usr/bin/ld: ./builddir-single/opcodes/../../opcodes/i386-dis.c:11002:(.text+0xa190): undefined reference to `_sch_istable'
/usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/15/../../../x86_64-linux-gnu/libopcodes.a(i386-dis.o):./builddir-single/opcodes/../../opcodes/i386-dis.c:11071: more undefined references to `_sch_istable' follow
/usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/15/../../../x86_64-linux-gnu/libopcodes.a(disassemble.o): in function `opcodes_assert':
./builddir-single/opcodes/../../opcodes/disassemble.c:856:(.text+0x2ae): undefined reference to `_bfd_error_handler'
/usr/bin/ld: ./builddir-single/opcodes/../../opcodes/disassemble.c:857:(.text+0x2d0): undefined reference to `_bfd_error_handler'
/usr/bin/ld: warning: creating DT_TEXTREL in a PIE
collect2: error: ld returned 1 exit status


With the rest of the dependencies:

$ echo '#include <dis-asm.h>
   int main(void) { disassemble_init_for_target(NULL); return 0; }' | gcc -xc - -DPACKAGE='"test"' -lopcodes -lbfd -liberty -lz -o /tmp/test

$ echo $?
0

But I'm not sure how we determine what the dependencies are exactly without
trying all the various combinations of them...

The below patch also brings back the cross compilation issue that originally
prompted my patch (see
https://qa-reports.linaro.org/lkft/sashal-linus-next/build/v6.18-rc7-14082-gef67311bf79e/testrun/30638724/suite/build/test/gcc-14-ppc6xx_defconfig/log)

>Did I do this right? Josh, Arnaldo, could you comment on that CC vs
>HOSTCC issue that Sasha mentioned?
>
>---
>diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
>index 362cf8f4a0a0..4d93375a6474 100644
>--- a/tools/build/Makefile.feature
>+++ b/tools/build/Makefile.feature
>@@ -117,6 +117,7 @@ FEATURE_TESTS_EXTRA :=                  \
>          libcapstone                    \
>          libbfd-liberty                 \
>          libbfd-liberty-z               \
>+         libbfd-opcodes                 \
>          libopencsd                     \
>          libperl                        \
>          cxx                            \
>diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
>index 0d5a15654b17..4a9fc7a1b2ed 100644
>--- a/tools/build/feature/Makefile
>+++ b/tools/build/feature/Makefile
>@@ -19,6 +19,7 @@ FILES=                                          \
>          test-reallocarray.bin			\
>          test-libbfd-liberty.bin                \
>          test-libbfd-liberty-z.bin              \
>+         test-libbfd-opcodes.bin                \
>          test-cplus-demangle.bin                \
>          test-cxa-demangle.bin                  \
>          test-libcap.bin			\
>@@ -288,6 +289,9 @@ endif
> $(OUTPUT)test-libbfd-liberty-z.bin:
> 	$(CC) $(CFLAGS) -Wall -Werror -o $@ test-libbfd.c -DPACKAGE='"perf"' $(LDFLAGS) -lbfd -ldl -liberty -lz
>
>+$(OUTPUT)test-libbfd-opcodes.bin:
>+	$(CC) $(CFLAGS) -Wall -Werror -o $@ test-libbfd.c $(LDFLAGS) -lbfd -ldl -lopcodes
>+
> $(OUTPUT)test-cplus-demangle.bin:
> 	$(BUILD) -liberty
>
>diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
>index 9b4503113ce5..5b85652cbfd7 100644
>--- a/tools/objtool/Makefile
>+++ b/tools/objtool/Makefile
>@@ -72,27 +72,23 @@ HOST_OVERRIDES := CC="$(HOSTCC)" LD="$(HOSTLD)" AR="$(HOSTAR)"
>
> #
> # To support disassembly, objtool needs libopcodes which is provided
>-# with libbfd (binutils-dev or binutils-devel package).
>+# with libbdf (binutils-dev or binutils-devel package).
> #
>-# We check using HOSTCC directly rather than the shared feature framework
>-# because objtool is a host tool that links against host libraries.
>-#
>-HAVE_LIBOPCODES := $(shell echo 'int main(void) { return 0; }' | \
>-			$(HOSTCC) -xc - -o /dev/null -lopcodes 2>/dev/null && echo y)
>+FEATURE_USER = .objtool
>+FEATURE_TESTS = libbfd-opcodes disassembler-init-styled
>+FEATURE_DISPLAY =
>+include $(srctree)/tools/build/Makefile.feature
>
>-# Styled disassembler support requires binutils >= 2.39
>-HAVE_DISASM_STYLED := $(shell echo '$(pound)include <dis-asm.h>' | \
>-			$(HOSTCC) -E -xc - 2>/dev/null | grep -q disassembler_style && echo y)
>+ifeq ($(feature-disassembler-init-styled), 1)
>+	OBJTOOL_CFLAGS += -DDISASM_INIT_STYLED
>+endif
>
> BUILD_DISAS := n
>
>-ifeq ($(HAVE_LIBOPCODES),y)
>+ifeq ($(feature-libbfd-opcodes),1)
> 	BUILD_DISAS := y
>-	OBJTOOL_CFLAGS += -DDISAS -DPACKAGE='"objtool"'
>+	OBJTOOL_CFLAGS += -DDISAS -DPACKAGE="objtool"
> 	OBJTOOL_LDFLAGS += -lopcodes
>-ifeq ($(HAVE_DISASM_STYLED),y)
>-	OBJTOOL_CFLAGS += -DDISASM_INIT_STYLED
>-endif
> endif
>
> export BUILD_DISAS

-- 
Thanks,
Sasha
