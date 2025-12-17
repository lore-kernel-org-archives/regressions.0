Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D3733B6D9
	for <regressions@lists.linux.dev>; Wed, 17 Dec 2025 08:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765959380; cv=none; b=taoJ+p4S92QInQWys44diQq8mJtumEvgzUzO6gqvAJ8p3lHNGS5AjXTuGmdCHdlwZA3kvlU4gsjhcugHzoZW0btcK6iHbJoMDDm4SXfC9PCd8u9p6TcKFDombLKLQA/rdGQSdF2ZCEOr+frKrNhdeIY/oXQXZ3T+ZkXzJKVTVFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765959380; c=relaxed/simple;
	bh=HrmkhODKvxn4lwmEaJbddNIbNA24U3WIS4xnezDHHJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qA6nrtap/tSUC4GzL5laOZaHEJzw+jE0qSULEg3CAN1A14GnFMUvsInAiOL9L682HFubEXkKGkm6AdFilVntHzObjdGsSOO+4nGyfLgaAQCIJ0qOhYREPfZoDUJ4Pr6282W48ASsJMP5iZB/QvKbJG87MkJlzz4Yim4rInQtbZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C5HQ8Zm7; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C5HQ8Zm7"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37e6dd536b0so51374141fa.2
        for <regressions@lists.linux.dev>; Wed, 17 Dec 2025 00:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765959374; x=1766564174; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gj1Qql5Edxq3mPVTrLbdon/fewAfsgf7zjBa/vJ2SzQ=;
        b=C5HQ8Zm7vmHLhIaQDTvEbbOjjiBXq9DbOlCkdf9LTbpa5wCc2y/3fZFs/9UtK8/FQz
         cU2Srhd79eM24TDo5anLFw46jQ6NPKp3vOIvvtOBjFfHkzX+go1sGinvI8e/u/0b6i9w
         zsBFMm5le9xx5BZhFFVPmZssVGaXm3fuZmWQwYA2F35pexDFsXeEJsa4t1F4LLH06onR
         f/CH/PmG9CwSWvZxNFGrkB9mF4IEDtUgi4qT5qQONWUYCRwvzXCov+FKkxM8vP0sPu+c
         yqBbE1vHKhd+IHqX+oUHR8MLpw3bx03xL7zos5grKgJasuTeOaw0PAUtirc1FniZ8bMZ
         gnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765959374; x=1766564174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gj1Qql5Edxq3mPVTrLbdon/fewAfsgf7zjBa/vJ2SzQ=;
        b=VswPvMTwQ5R8q4XN1Z4bGnrufT1apYdU3zkQyZPU/KnOcSTxL9zqEIuV8jOZcxEbLj
         edOaTtARuXcpDp5LsiMjbihho7MwtnA/XCh9WqK3q1ZrPCy6JWXQ+1Gcsq7nkwqfZjgV
         uBKrq95K0dMmO7To6bAl7G9/rhHokpGVplrPZ/K+zXn7s4r7iWuEYTSe1Y0HYF53txv3
         bnF/ax/oOeEU4Scre1EuwGXPcFNMzTD9/CypizaTinZrKLb6kS7pGrAanYfrH0b46TNv
         cCGMbyXz69hv15XiQrPd8fW8itWADOdMDcYaHQzsYhWKlgzx1dNgtGonj9vPvXqqwP50
         EoGA==
X-Forwarded-Encrypted: i=1; AJvYcCV4myXu5JfDO1kTmRwwVIA198khonz2yLNuw0C7PspKHOC2P08xih+3XqWCNly28z0jPfDJlEwCiqWFhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3dwKq2wVcUytpqtxa2qX/TXwywM5hazXFLnnib4awZPeDLmxe
	Dab3Ikto132qcoNtNNA2aC7YTLzntMuZdu+k3SNFO3kmdEBcgoDt7uS6F6qDAvud0YMb0dHaWF8
	rXZDX6arYT9RKMZaeoeF2kyBAjOuFXDq01cUjrhV4
X-Gm-Gg: AY/fxX4AnA/c8L4j50kj4p6E1bLcf2GJruNKGKfKWVU63H+Y2ZtVUsXpW8G8l+LBJop
	6Rd1nspnQOP8EbcAc+vOgh/2wAD93RLoGqj1RDloWJ+rKu3sXEDeKDv+eVPgQvua8qFqmhX/rvv
	JgzXK9VuqxhoHkqfcdsvf2XzVrfOmBg2H8TLAMkl9jahnkoSNrtH/EDKpFD1pOMNVQIm4JZc4C3
	k3NLBsdrTL+ff+GLT5hmfVVkPd9QK0bEKltAUXlLHyvqHEZzX25dRUgT1UvXbvlLXFAzBerCzvX
	onLYOOglFMdcX5+3qkiSh31JhQ==
X-Google-Smtp-Source: AGHT+IHmbMl+Ifg/xTf2MvNYy6RWKFMiDTeAxP2Vw6Hn1W+hFt/ZThwMLwBYlD3X27szZcPykn66XqQ854C4d9jiLb4=
X-Received: by 2002:a05:651c:50a:b0:381:a8d:3561 with SMTP id
 38308e7fff4ca-3810a8d3699mr3173611fa.19.1765959373888; Wed, 17 Dec 2025
 00:16:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aS22QhwdrHN24ToD@levanger>
In-Reply-To: <aS22QhwdrHN24ToD@levanger>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 17 Dec 2025 17:16:02 +0900
X-Gm-Features: AQt7F2pRhmBHrT3aWtxHAN-phTtkj2tBHCKo-APn2oxJ0-DhUz0HlQDbB6L6B6A
Message-ID: <CACT4Y+Z8aCz0XcoJx9XXPHZSZHxGF8Kx9iUbFarhpTSEPDhMfg@mail.gmail.com>
Subject: Re: [GIT PULL] kbuild changes for v6.19
To: Nicolas Schier <nsc@kernel.org>, patso@likewhatevs.io, 
	Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, eddyz87@gmail.com
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Dec 2025 at 16:38, Nicolas Schier <nsc@kernel.org> wrote:
>
> Hi Linus,
>
> please pull these update to Kbuild for v6.19.  This is my first pull
> request, so please let me know if anything is incorrect and not matching
> your standards.
>
> All changes have been in -next, most for several cycles without reported
> problems.
>
> Non-native kbuild changes are related to addition of -fms-extensions and
> a conversion example; as well as for the userspace CC_CAN_LINK addition.
>
> Thanks and kind regards,
> Nicolas
>
>
> ----------------------------------------------------------------
>
> The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:
>
>   Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)
>
> are available in the Git repository at:
>
>   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-6.19-1
>
> for you to fetch changes up to 2a9c8c0b59d366acabb8f891e84569376f3e2709:
>
>   kbuild: add target to build a cpio containing modules (2025-11-26 21:56:14 +0100)
>
> ----------------------------------------------------------------
> Kbuild updates for v6.19
>
>   - Enable -fms-extensions, allowing anonymous use of tagged struct or
>     union in struct/union (tag kbuild-ms-extensions-6.19).  An exemplary
>     conversion patch is added here, too (btrfs).
>
>   - Introduce architecture-specific CC_CAN_LINK and flags for userprogs
>
>   - Add new packaging target 'modules-cpio-pkg' for building a initramfs
>     cpio w/ kmods
>
>   - Handle included .c files in gen_compile_commands
>
>   - Minor kbuild changes:
>     - Use objtree for module signing key path, fixing oot kmod signing
>     - Improve documentation of KBUILD_BUILD_TIMESTAMP
>     - Reuse KBUILD_USERCFLAGS for UAPI, instead of defining twice
>     - Rename scripts/Makefile.extrawarn to Makefile.warn
>     - Drop obsolete types.h check from headers_check.pl
>     - Remove outdated config leak ignore entries
>
> Signed-off-by: Nicolas Schier <nsc@kernel.org>
>
> ----------------------------------------------------------------
> Ahmad Fatoum (1):
>       initramfs: add gen_init_cpio to hostprogs unconditionally
>
> Gang Yan (1):
>       kbuild: doc: improve KBUILD_BUILD_TIMESTAMP documentation
>
> Mikhail Malyshev (1):
>       kbuild: Use objtree for module signing key path
>
> Nathan Chancellor (4):
>       jfs: Rename _inline to avoid conflict with clang's '-fms-extensions'
>       kbuild: Add '-fms-extensions' to areas with dedicated CFLAGS
>       kbuild: Rename Makefile.extrawarn to Makefile.warn
>       kbuild: uapi: Drop types.h check from headers_check.pl
>
> Nicolas Schier (3):
>       Merge tag 'kbuild-ms-extensions-6.19' into kbuild-next
>       MAINTAINERS, .mailmap: Update mail address for Nicolas Schier
>       scripts: headers_install.sh: Remove two outdated config leak ignore entries
>
> Pat Somaru (1):
>       scripts/clang-tools: Handle included .c files in gen_compile_commands

/\/\/\/\/\/\/\

This commit breaks invocation of clang tools for me.

For example I now have this fake entry for mock_uncore.c which
pretends to produce intel_uncore.o (along with 2 other commands which
produce the same object file):

  {
    "command": "clang -Wp,-MMD,drivers/gpu/drm/i915/.intel_uncore.o.d
-nostdinc -Iarch/x86/include -I./arch/x86/include/generated -Iinclude
-I./include -Iarch/x86/include/uapi
-I./arch/x86/include/generated/uapi -Iinclude/uapi
-I./include/generated/uapi -include include/linux/compiler-version.h
-include include/linux/kconfig.h -include
include/linux/compiler_types.h -D__KERNEL__ --target=x86_64-linux-gnu
-fintegrated-as -Werror=unknown-warning-option
-Werror=ignored-optimization-argument -Werror=option-ignored
-Werror=unused-command-line-argument -fmacro-prefix-map== -std=gnu11
-fshort-wchar -funsigned-char -fno-common -fno-PIE
-fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
-mno-sse4a -fcf-protection=branch -fno-jump-tables -m64
-falign-loops=1 -mno-80387 -mno-fp-ret-in-387 -mstack-alignment=8
-mskip-rax-setup -march=x86-64 -mtune=generic -mno-red-zone
-mcmodel=kernel -mstack-protector-guard-reg=gs
-mstack-protector-guard-symbol=__ref_stack_chk_guard -Wno-sign-compare
-fno-asynchronous-unwind-tables -mretpoline-external-thunk
-mindirect-branch-cs-prefix -mfunction-return=thunk-extern
-fpatchable-function-entry=16,16 -fno-delete-null-pointer-checks -O2
-fstack-protector-strong -fomit-frame-pointer
-ftrivial-auto-var-init=zero -fno-stack-clash-protection
-falign-functions=16 -fstrict-flex-arrays=3 -fms-extensions
-fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall
-Wextra -Wundef -Werror=implicit-function-declaration
-Werror=implicit-int -Werror=return-type -Werror=strict-prototypes
-Wno-format-security -Wno-trigraphs -Wno-frame-address
-Wno-address-of-packed-member -Wmissing-declarations
-Wmissing-prototypes -Wframe-larger-than=2048 -Wno-gnu
-Wno-microsoft-anon-tag -Wno-format-overflow-non-kprintf
-Wno-format-truncation-non-kprintf -Wno-pointer-sign
-Wcast-function-type -Wimplicit-fallthrough -Werror=date-time
-Werror=incompatible-pointer-types -Wenum-conversion -Wunused
-Wno-unused-but-set-variable -Wno-unused-const-variable
-Wno-format-overflow -Wno-override-init -Wno-pointer-to-enum-cast
-Wno-tautological-constant-out-of-range-compare -Wno-unaligned-access
-Wno-enum-compare-conditional -Wno-missing-field-initializers
-Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-conversion
-Wno-sign-compare -Wno-unused-parameter -g -gdwarf-4 -Wextra -Wunused
-Wno-unused-parameter -Wmissing-format-attribute
-Wold-style-definition -Wmissing-include-dirs
-Wunused-but-set-variable -Wunused-const-variable -Wformat-overflow
-Wno-missing-field-initializers -Wno-type-limits
-Wno-shift-negative-value -Wno-sign-compare -Wformat-truncation -DI915
-Idrivers/gpu/drm/i915    -fsanitize=kernel-address -mllvm
-asan-mapping-offset=0xdffffc0000000000  -mllvm
-asan-instrumentation-with-call-threshold=10000  -mllvm -asan-stack=1
  -mllvm -asan-globals=1  -mllvm -asan-kernel-mem-intrinsic-prefix=1
-fsanitize=array-bounds -fsanitize=shift
-fsanitize-coverage=trace-pc -fsanitize-coverage=trace-cmp
-Idrivers/gpu/drm/i915 -Idrivers/gpu/drm/i915
-DKBUILD_MODFILE='\"drivers/gpu/drm/i915/i915\"'
-DKBUILD_BASENAME='\"intel_uncore\"' -DKBUILD_MODNAME='\"i915\"'
-D__KBUILD_MODNAME=i915 -c -o drivers/gpu/drm/i915/intel_uncore.o
-include linux/pm_runtime.h -include drm/drm_managed.h -include
drm/drm_print.h -include
drivers/gpu/drm/i915/display/intel_display_core.h -include
drivers/gpu/drm/i915/gt/intel_engine_regs.h -include
drivers/gpu/drm/i915/gt/intel_gt.h -include
drivers/gpu/drm/i915/gt/intel_gt_regs.h -include
drivers/gpu/drm/i915/i915_drv.h -include
drivers/gpu/drm/i915/i915_iosf_mbi.h -include
drivers/gpu/drm/i915/i915_reg.h -include
drivers/gpu/drm/i915/i915_vgpu.h -include
drivers/gpu/drm/i915/i915_wait_util.h -include
drivers/gpu/drm/i915/i915_mmio_range.h -include
drivers/gpu/drm/i915/intel_uncore_trace.h
drivers/gpu/drm/i915/selftests/mock_uncore.c",
    "directory": "build/b405de752a64d7657dcad6b5042d7bf4327a3bd8",
    "file": "drivers/gpu/drm/i915/selftests/mock_uncore.c"
  },


An attempt to invoke a clang tool using this database legitimately
fails with the following errors (the file is not supposed and can't
compile on its own):

clang-tool: drivers/gpu/drm/i915/selftests/mock_uncore.c: exit status 1
drivers/gpu/drm/i915/selftests/mock_uncore.c:47:2: error: call to
undeclared function 'ASSIGN_RAW_WRITE_MMIO_VFUNCS'; ISO C99 and later
do not support implicit function declarations
[-Wimplicit-function-declaration]
   47 |         ASSIGN_RAW_WRITE_MMIO_VFUNCS(uncore, nop);
      |         ^
drivers/gpu/drm/i915/selftests/mock_uncore.c:47:39: error: use of
undeclared identifier 'nop'; did you mean 'nopv'?
   47 |         ASSIGN_RAW_WRITE_MMIO_VFUNCS(uncore, nop);
      |                                              ^~~
      |                                              nopv
/arch/x86/include/asm/hypervisor.h:71:13: note: 'nopv' declared here
   71 | extern bool nopv;
      |             ^
drivers/gpu/drm/i915/selftests/mock_uncore.c:48:2: error: call to
undeclared function 'ASSIGN_RAW_READ_MMIO_VFUNCS'; ISO C99 and later
do not support implicit function declarations
[-Wimplicit-function-declaration]
   48 |         ASSIGN_RAW_READ_MMIO_VFUNCS(uncore, nop);
      |         ^
drivers/gpu/drm/i915/selftests/mock_uncore.c:48:38: error: use of
undeclared identifier 'nop'; did you mean 'nopv'?
   48 |         ASSIGN_RAW_READ_MMIO_VFUNCS(uncore, nop);
      |                                             ^~~
      |                                             nopv
/arch/x86/include/asm/hypervisor.h:71:13: note: 'nopv' declared here
   71 | extern bool nopv;
      |             ^
4 errors generated.
Error while processing /drivers/gpu/drm/i915/selftests/mock_uncore.c.


What am I doing wrong?

#regzbot introduced: 9362d34acf91a706c543d919ade3e651b9bd2d6f
#regzbot title: scripts/clang-tools: included .c files don't compile
