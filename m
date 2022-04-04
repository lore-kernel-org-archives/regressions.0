Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB127C
	for <regressions@lists.linux.dev>; Mon,  4 Apr 2022 16:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235B7C2BBE4;
	Mon,  4 Apr 2022 16:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649091441;
	bh=3DwgQQibm4QtCGLBPHzzEvuy5aoVnSuQo3AjjdM3vbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fk4AO+Sm8xS1TVN83Ht+dupzgBCUyMwmk3BdxRedx7gSUjUC8tNpe6fkePJnDCgvn
	 6z1ffAw+tRmbJc42ieFu4+y8g6Py2fjyb6A9BWRheaeI2tn5z4tAHTbLbEp2080+S9
	 CxB1WsVq5EIoeUe1he75gyGAxOSSKUfgy6CHbfw+TkSwcXK04OcBTqJ0zH0UGN8jud
	 gmLhXFq4Iv4cp4M9T+2ayVMUt/M0PSzt/xTjSrezEkmuwfcU4AMwGoj8W8UL1mjetC
	 QdQOK6sowskP4tRwiSnLlB0DFDguDCHON0Eg949oEq3JMuR6oVLAgcBK5/sITPY06j
	 QtceSyWGBreOw==
Date: Mon, 4 Apr 2022 09:57:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Guo Ren <guoren@linux.alibaba.com>, Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [next] riscv: Linux next-20220404 riscv defconfig builds failed.
Message-ID: <Yksjb9Mkq658k4YJ@dev-arch.thelio-3990X>
References: <CA+G9fYu_ZHOeOPDiwzXGL6Re8aFYW3K+JSL2Dozw=VHwaUFxyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYu_ZHOeOPDiwzXGL6Re8aFYW3K+JSL2Dozw=VHwaUFxyQ@mail.gmail.com>

On Mon, Apr 04, 2022 at 03:28:41PM +0530, Naresh Kamboju wrote:
> Linux next-20220404 riscv defconfig builds failed.
> 
> Regressions found on riscv:
>    - riscv-riscv-clang-14-defconfig
>    - riscv-riscv-gcc-10-defconfig
>    - riscv-riscv-clang-13-defconfig
>    - riscv-riscv-clang-12-defconfig
>    - riscv-riscv-clang-11-defconfig
>    - riscv-riscv-gcc-11-defconfig
>    - riscv-riscv-gcc-8-defconfig
>    - riscv-riscv-gcc-9-defconfig
>    - riscv-riscv-clang-nightly-defconfig
> 
> 
> arch/riscv/kernel/compat_signal.c:7:10: fatal error:
> linux/tracehook.h: No such file or directory
>   7 | #include <linux/tracehook.h>
>     |          ^~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[3]: *** [scripts/Makefile.build:289:
> arch/riscv/kernel/compat_signal.o] Error 1

For what it's worth, I also see:

$ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- defconfig all
arch/riscv/kernel/compat_vdso/compat_vdso.lds.S:3:10: fatal error: ../vdso/vdso.lds.S: No such file or directory
    3 | #include <../vdso/vdso.lds.S>
      |          ^~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.build:462: arch/riscv/kernel/compat_vdso/compat_vdso.lds] Error 1
arch/riscv/kernel/compat_vdso/rt_sigreturn.S:3:10: fatal error: ../vdso/rt_sigreturn.S: No such file or directory
    3 | #include <../vdso/rt_sigreturn.S>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
arch/riscv/kernel/compat_vdso/note.S:3:10: fatal error: ../vdso/note.S: No such file or directory
    3 | #include <../vdso/note.S>
      |          ^~~~~~~~~~~~~~~~
compilation terminated.
arch/riscv/kernel/compat_vdso/getcpu.S:3:10: fatal error: ../vdso/getcpu.S: No such file or directory
    3 | #include <../vdso/getcpu.S>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/rt_sigreturn.o] Error 1
make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/note.o] Error 1
make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/getcpu.o] Error 1
arch/riscv/kernel/compat_vdso/flush_icache.S:3:10: fatal error: ../vdso/flush_icache.S: No such file or directory
    3 | #include <../vdso/flush_icache.S>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/flush_icache.o] Error 1

I am guessing this code was never tested with $(srctree) == $(objtree).

Cheers,
Nathan
