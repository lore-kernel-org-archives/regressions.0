Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E9F3EDABD;
	Tue, 20 Jan 2026 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904918; cv=none; b=CBdpA4R4IlV/jPIQPGS43/Mw7+3yLgALMZh6ZhEpsZfOMysIvEJNMTvrb9iS3ti0lbUPzctxQXClUNEAzcCEpb0VphGoLtzGdrmjs0xppuIWCoq1CWHCv8XMuPfAMFwstaL8KQhRInRAaaGsMPRWhjd+w9JGYm3w8DwKil2LxIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904918; c=relaxed/simple;
	bh=gMtToEHU3bdyf63Jm1PYqaPKqZJdyqzoVHghJG7Uqv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzo+4oVZbN6qrwdK8lyy94L6QGTXBu+mXztwD4P/CjlYF8DbrmU13wfT0NaVAAub0Fe7nqXfTbSy/NWsQ5cM1DwK1PGpDTR3MYdqPoRW6LlIeGWPC1GhkPXtd2AVvnB8SSl02sb9bRj+ZpddnEt6lZ2oEWyPk/T8Hd/KMkHTdKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XRL9jEuP; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XRL9jEuP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dXVE8AxTKVAG9SkN9IHhazI1Ltr4PeMiulhfYU7pT+U=; b=XRL9jEuPu+c5u+26ByHsV4z5To
	EDilTqXo4GWfiPsyPaOwXmrGxLzKu5eTTjLUQtLAQuNzbj3x/0UB5wwY+MErhK2s5CkCXOpH+Xn/P
	3EExOnC32Vg/GgzY1ZqDT1bEs1bcufLLT8LDgX1M3zAMHQBzM0Z6KeJ5rrhD4HDtCoThapXEZ3Sv7
	vOyZgtz8RtiLGSkcApUSrVCRRxxyS724IyYxWlHYqnM12VZ8boqGvqMgm1FJQ9pJX5WM42negfWKK
	yRoK0gytxT0baI/xyRFnH3HtfVD7fO9X3+Ewn8YD00/QT67GepFWdlmJbaxQMvbYdBQZTbso2EG10
	K916HiSg==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8yP-0000000Do4g-1GGP;
	Tue, 20 Jan 2026 10:28:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2A0AB303045; Tue, 20 Jan 2026 11:28:32 +0100 (CET)
Date: Tue, 20 Jan 2026 11:28:32 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	irogers@google.com
Subject: Re: [Regression in 6.19-rc6] Build breakage after commit 436326bc525d
Message-ID: <20260120102832.GJ1890602@noisy.programming.kicks-ass.net>
References: <CAJZ5v0gkhSxWZ9wTY+2AGDCtZgSKmOwpg7Np9OVDMJptqnntUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0gkhSxWZ9wTY+2AGDCtZgSKmOwpg7Np9OVDMJptqnntUQ@mail.gmail.com>

On Mon, Jan 19, 2026 at 09:19:31PM +0100, Rafael J. Wysocki wrote:
> Hi Sasha,
> 
> Commit 436326bc525d ("objtool: fix build failure due to missing
> libopcodes check") breaks kernel build for me.
> 
> Here's what I get when I try to build the kernel after that commit:
> 
>   LD      /scratch/rafael/work/build/xps13/tools/objtool/objtool-in.o
>   LINK    /scratch/rafael/work/build/xps13/tools/objtool/objtool
> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
> in function `print_operands':
> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:3945:(.text+0x6317):
> undefined reference to `xmalloc'
> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:3992:(.text+0x6723):
> undefined reference to `_sch_istable'
> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
> in function `print_insn_aarch64':
> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:4559:(.text+0x6b1e):
> undefined reference to `bfd_get_bits'
> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
> in function `parse_aarch64_dis_option':
> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:103:(.text+0x6dea):
> undefined reference to `_bfd_error_handler'
> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-opc.o):
> in function `init_insn_sequence':
> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-opc.c:5561:(.text+0x5c06):
> undefined reference to `xcalloc'
> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(disassemble.o):
> in function `remove_whitespace_and_extra_commas':
> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/disassemble.c:801:(.text+0x346):
> undefined reference to `_sch_istable'
> ...
> 
> (many more similar messages skipped).
> 
> Reverting commit 436326bc525d makes the problem go away.

Bah, I hate makefiles.

Anyway, the below is that revert + adding an explicit libbfd-opcodes
feature test.

Did I do this right? Josh, Arnaldo, could you comment on that CC vs
HOSTCC issue that Sasha mentioned?

---
diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
index 362cf8f4a0a0..4d93375a6474 100644
--- a/tools/build/Makefile.feature
+++ b/tools/build/Makefile.feature
@@ -117,6 +117,7 @@ FEATURE_TESTS_EXTRA :=                  \
          libcapstone                    \
          libbfd-liberty                 \
          libbfd-liberty-z               \
+         libbfd-opcodes                 \
          libopencsd                     \
          libperl                        \
          cxx                            \
diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index 0d5a15654b17..4a9fc7a1b2ed 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -19,6 +19,7 @@ FILES=                                          \
          test-reallocarray.bin			\
          test-libbfd-liberty.bin                \
          test-libbfd-liberty-z.bin              \
+         test-libbfd-opcodes.bin                \
          test-cplus-demangle.bin                \
          test-cxa-demangle.bin                  \
          test-libcap.bin			\
@@ -288,6 +289,9 @@ endif
 $(OUTPUT)test-libbfd-liberty-z.bin:
 	$(CC) $(CFLAGS) -Wall -Werror -o $@ test-libbfd.c -DPACKAGE='"perf"' $(LDFLAGS) -lbfd -ldl -liberty -lz
 
+$(OUTPUT)test-libbfd-opcodes.bin:
+	$(CC) $(CFLAGS) -Wall -Werror -o $@ test-libbfd.c $(LDFLAGS) -lbfd -ldl -lopcodes
+
 $(OUTPUT)test-cplus-demangle.bin:
 	$(BUILD) -liberty
 
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 9b4503113ce5..5b85652cbfd7 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -72,27 +72,23 @@ HOST_OVERRIDES := CC="$(HOSTCC)" LD="$(HOSTLD)" AR="$(HOSTAR)"
 
 #
 # To support disassembly, objtool needs libopcodes which is provided
-# with libbfd (binutils-dev or binutils-devel package).
+# with libbdf (binutils-dev or binutils-devel package).
 #
-# We check using HOSTCC directly rather than the shared feature framework
-# because objtool is a host tool that links against host libraries.
-#
-HAVE_LIBOPCODES := $(shell echo 'int main(void) { return 0; }' | \
-			$(HOSTCC) -xc - -o /dev/null -lopcodes 2>/dev/null && echo y)
+FEATURE_USER = .objtool
+FEATURE_TESTS = libbfd-opcodes disassembler-init-styled
+FEATURE_DISPLAY =
+include $(srctree)/tools/build/Makefile.feature
 
-# Styled disassembler support requires binutils >= 2.39
-HAVE_DISASM_STYLED := $(shell echo '$(pound)include <dis-asm.h>' | \
-			$(HOSTCC) -E -xc - 2>/dev/null | grep -q disassembler_style && echo y)
+ifeq ($(feature-disassembler-init-styled), 1)
+	OBJTOOL_CFLAGS += -DDISASM_INIT_STYLED
+endif
 
 BUILD_DISAS := n
 
-ifeq ($(HAVE_LIBOPCODES),y)
+ifeq ($(feature-libbfd-opcodes),1)
 	BUILD_DISAS := y
-	OBJTOOL_CFLAGS += -DDISAS -DPACKAGE='"objtool"'
+	OBJTOOL_CFLAGS += -DDISAS -DPACKAGE="objtool"
 	OBJTOOL_LDFLAGS += -lopcodes
-ifeq ($(HAVE_DISASM_STYLED),y)
-	OBJTOOL_CFLAGS += -DDISASM_INIT_STYLED
-endif
 endif
 
 export BUILD_DISAS
