Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3692ED848;
	Wed, 21 Jan 2026 01:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768958317; cv=none; b=SR/nFOo3Xn6KCtNa14WCo1I94JoTe1L0w7rzUcOYAHndTSGPjksW+rBnyNYQkbi4haF6PrSm8BGN5FegCRq2MfENmAxf/veYab7Zh0gyt5L4K4xaJD/w9E2zATCUzj220R6osy589dkmS3ivCDIFpWFzEmGRGuvmX4WtaTKBokg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768958317; c=relaxed/simple;
	bh=L5lgr2viEBEBnLEtjKy0LtvPZ5E4NtTrrxDv5yOTz9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jV0ge1vyMHu1mGxQo0C3kkLI1/x3dVD9hqjdHKQoTS0YkfK1Xpl42hZNq8/Mea5QrG8AtpdKc//irrmUMyaGs7qsz8Gb2bFlqjJTDRpLM4bicnvZ0EihKCibUtM/Y836g3D/7piw/lMjSQyvFP5s+/ET2LWwaPcszt/gNPHRfYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r017FxKt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r017FxKt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F40CC16AAE;
	Wed, 21 Jan 2026 01:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768958316;
	bh=L5lgr2viEBEBnLEtjKy0LtvPZ5E4NtTrrxDv5yOTz9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r017FxKtE/ILQ978NrLSLvXDm2VwVJ8jW6sZorgXU3nrMB9BM/AVVxIVrbe1IU0b5
	 gHAZKUg+tsndUY4kxF2nhJ335rMj4qHhLZVAK3pcmKUwTfkkiCT+wZJNzXYKl0sAFd
	 KBeCsEKy+bH1w8eUQRwsOIoLkZz3fBQv3LjuzDqKkyBaLCu9Yp5cDuqJ4kyVPxvcD1
	 i8cd9XW2e9AoCe+GFdLBbEWf+W9xHOJ611gaFMArfvC2SG1RJ6NXZD27ty25togH0R
	 Dn3w8cxTv/jLD4HESNe8u+26hRc1ETKJZ/cfipK2AgxYi9hfSAo6D/Jd92kOSGxelu
	 O0BY8llfVVKVg==
Date: Tue, 20 Jan 2026 20:18:35 -0500
From: Sasha Levin <sashal@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	irogers@google.com
Subject: Re: [Regression in 6.19-rc6] Build breakage after commit 436326bc525d
Message-ID: <aXApa2hHOjOTZkz7@laps>
References: <CAJZ5v0gkhSxWZ9wTY+2AGDCtZgSKmOwpg7Np9OVDMJptqnntUQ@mail.gmail.com>
 <20260120102832.GJ1890602@noisy.programming.kicks-ass.net>
 <aW--GBGlZ6FH2m8P@laps>
 <CAJZ5v0i6Uw0+L5SY3QW+py82uEVktNWcHGHf=Za96mQpN7X8Bw@mail.gmail.com>
 <aW_eTgksTr1P2Gh1@laps>
 <CAJZ5v0g2S9_nCxmO=3pc24ESQ=qSFRWoZwfDw4W6hkXc3uo3qQ@mail.gmail.com>
 <aW_j_aqyipRqtupO@laps>
 <CAJZ5v0h11g4jcXghK4FL=di4jirYDwMcf1m=k7E=Jpc5VobciA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0h11g4jcXghK4FL=di4jirYDwMcf1m=k7E=Jpc5VobciA@mail.gmail.com>

On Tue, Jan 20, 2026 at 10:33:12PM +0100, Rafael J. Wysocki wrote:
>On Tue, Jan 20, 2026 at 9:22 PM Sasha Levin <sashal@kernel.org> wrote:
>>
>> On Tue, Jan 20, 2026 at 09:04:25PM +0100, Rafael J. Wysocki wrote:
>> >On Tue, Jan 20, 2026 at 8:58 PM Sasha Levin <sashal@kernel.org> wrote:
>> >>
>> >> On Tue, Jan 20, 2026 at 07:29:58PM +0100, Rafael J. Wysocki wrote:
>> >> >On Tue, Jan 20, 2026 at 6:40 PM Sasha Levin <sashal@kernel.org> wrote:
>> >> >>
>> >> >> On Tue, Jan 20, 2026 at 11:28:32AM +0100, Peter Zijlstra wrote:
>> >> >> >On Mon, Jan 19, 2026 at 09:19:31PM +0100, Rafael J. Wysocki wrote:
>> >> >> >> Hi Sasha,
>> >> >> >>
>> >> >> >> Commit 436326bc525d ("objtool: fix build failure due to missing
>> >> >> >> libopcodes check") breaks kernel build for me.
>> >> >> >>
>> >> >> >> Here's what I get when I try to build the kernel after that commit:
>> >> >> >>
>> >> >> >>   LD      /scratch/rafael/work/build/xps13/tools/objtool/objtool-in.o
>> >> >> >>   LINK    /scratch/rafael/work/build/xps13/tools/objtool/objtool
>> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
>> >> >> >> in function `print_operands':
>> >> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:3945:(.text+0x6317):
>> >> >> >> undefined reference to `xmalloc'
>> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:3992:(.text+0x6723):
>> >> >> >> undefined reference to `_sch_istable'
>> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
>> >> >> >> in function `print_insn_aarch64':
>> >> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:4559:(.text+0x6b1e):
>> >> >> >> undefined reference to `bfd_get_bits'
>> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
>> >> >> >> in function `parse_aarch64_dis_option':
>> >> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:103:(.text+0x6dea):
>> >> >> >> undefined reference to `_bfd_error_handler'
>> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-opc.o):
>> >> >> >> in function `init_insn_sequence':
>> >> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-opc.c:5561:(.text+0x5c06):
>> >> >> >> undefined reference to `xcalloc'
>> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(disassemble.o):
>> >> >> >> in function `remove_whitespace_and_extra_commas':
>> >> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/disassemble.c:801:(.text+0x346):
>> >> >> >> undefined reference to `_sch_istable'
>> >> >> >> ...
>> >> >> >>
>> >> >> >> (many more similar messages skipped).
>> >> >> >>
>> >> >> >> Reverting commit 436326bc525d makes the problem go away.
>> >> >>
>> >> >> Thanks for the report Rafael!
>> >> >>
>> >> >> Could you confirm that you're linking against static libraries? I haven't
>> >> >> tested that scenario.
>> >> >
>> >> >How do I check that?
>> >>
>> >> What do you get running the below?
>> >>
>> >>    ls /usr/lib/*/libopcodes*
>> >
>> >"No such file or directory"
>> >
>> >However,
>> >
>> >> ls /usr/lib64/libopcodes*
>> >/usr/lib64/libopcodes-2.45.0.20251103-150100757.so  /usr/lib64/libopcodes.a
>>
>> The linker looks for libopcodes.so (not the versioned .so). Without that
>> symlink, it falls back to libopcodes.a. So yes, looks like you're using static
>> linking.
>>
>> To confirm, can you try to:
>>
>>    sudo ln -s libopcodes-2.45.0.20251103-150100757.so /usr/lib64/libopcodes.so
>>
>> Any then running the build again?
>
>Yes, this makes the build work (without reverting the commit in question).

Great! So something like the patch below should fix the static scenario. I've
tested it locally on Debian but it'll be great to give it a go on a different
distro.

It's also a bit ugly, but I'm not really sure what we can do about it. No
dependency info in static libs :/


diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 9b4503113ce5f..a40f302329291 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -77,8 +77,21 @@ HOST_OVERRIDES := CC="$(HOSTCC)" LD="$(HOSTLD)" AR="$(HOSTAR)"
  # We check using HOSTCC directly rather than the shared feature framework
  # because objtool is a host tool that links against host libraries.
  #
-HAVE_LIBOPCODES := $(shell echo 'int main(void) { return 0; }' | \
-                       $(HOSTCC) -xc - -o /dev/null -lopcodes 2>/dev/null && echo y)
+# When using shared libraries, -lopcodes is sufficient as dependencies are
+# resolved automatically. With static libraries, we must explicitly link
+# against libopcodes' dependencies: libbfd, libiberty, and sometimes libz.
+# Try each combination and use the first one that succeeds.
+#
+LIBOPCODES_LIBS := $(shell \
+       for libs in "-lopcodes" \
+                   "-lopcodes -lbfd" \
+                   "-lopcodes -lbfd -liberty" \
+                   "-lopcodes -lbfd -liberty -lz"; do \
+               echo 'extern void disassemble_init_for_target(void *);' \
+                    'int main(void) { disassemble_init_for_target(0); return 0; }' | \
+                       $(HOSTCC) -xc - -o /dev/null $$libs 2>/dev/null && \
+                       echo "$$libs" && break; \
+       done)
  
  # Styled disassembler support requires binutils >= 2.39
  HAVE_DISASM_STYLED := $(shell echo '$(pound)include <dis-asm.h>' | \
@@ -86,10 +99,10 @@ HAVE_DISASM_STYLED := $(shell echo '$(pound)include <dis-asm.h>' | \
  
  BUILD_DISAS := n
  
-ifeq ($(HAVE_LIBOPCODES),y)
+ifneq ($(LIBOPCODES_LIBS),)
         BUILD_DISAS := y
         OBJTOOL_CFLAGS += -DDISAS -DPACKAGE='"objtool"'
-       OBJTOOL_LDFLAGS += -lopcodes
+       OBJTOOL_LDFLAGS += $(LIBOPCODES_LIBS)
  ifeq ($(HAVE_DISASM_STYLED),y)
         OBJTOOL_CFLAGS += -DDISASM_INIT_STYLED
  endif

-- 
Thanks,
Sasha
