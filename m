Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32AD23BD
	for <regressions@lists.linux.dev>; Mon,  6 Jun 2022 09:42:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 955B52B;
	Mon,  6 Jun 2022 02:42:02 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.39.103])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1EAA3F66F;
	Mon,  6 Jun 2022 02:41:59 -0700 (PDT)
Date: Mon, 6 Jun 2022 10:41:50 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	John Donnelly <john.p.donnelly@oracle.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Zhen Lei <thunder.leizhen@huawei.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: gcc-12: build errors: arch/arm64/kernel/setup.c:225:56: warning:
 array subscript -1 is outside array bounds of 'char[]' [-Warray-bounds]
Message-ID: <Yp3L0JgLpk+s54Lw@FVFF77S0Q05N>
References: <CA+G9fYts-KH-R5EkBpz2u6H_Cx6YTXus1JKJS6yBxGhb0O2qQQ@mail.gmail.com>
 <CAK8P3a3QKWxqGore3+_DJnWo7bJgvDhkZjtkyg5EUg4_D=mE2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3QKWxqGore3+_DJnWo7bJgvDhkZjtkyg5EUg4_D=mE2w@mail.gmail.com>

On Fri, Jun 03, 2022 at 09:40:07AM +0200, Arnd Bergmann wrote:
> On Fri, Jun 3, 2022 at 4:03 AM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >     inlined from 'setup_arch' at arch/arm64/kernel/setup.c:350:2:
> > arch/arm64/kernel/setup.c:225:56: warning: array subscript -1 is
> > outside array bounds of 'char[]' [-Warray-bounds]
> >   225 |         kernel_code.end     = __pa_symbol(__init_begin - 1);
> >
> 
> Is this the only warning of this type that you get for arm64?

There are a handful of those subscript warnings. Looking at v5.19-rc1
defconfig, using the kernel.org GCC 12.1.0 cross toolchain:

| [mark@lakrids:~/src/linux]% usekorg 12.1.0 make ARCH=arm64 CROSS_COMPILE=aarch64-linux- -j50 2>&1 | grep -A1 subscript
| arch/arm64/kernel/setup.c:225:56: warning: array subscript -1 is outside array bounds of 'char[]' [-Warray-bounds]
|   225 |         kernel_code.end     = __pa_symbol(__init_begin - 1);
| --
| arch/arm64/kernel/setup.c:227:48: warning: array subscript -1 is outside array bounds of 'char[]' [-Warray-bounds]
|   227 |         kernel_data.end     = __pa_symbol(_end - 1);
| --
| arch/arm64/kernel/hibernate.c:94:65: warning: array subscript -1 is outside array bounds of 'const void[]' [-Warray-bounds]
|    94 |         unsigned long nosave_end_pfn = sym_to_pfn(&__nosave_end - 1);

The last of those can't have the `- 1` pulled out, but we could stuff a
RELOC_HIDE() in there, as __pa_symbol() has internally.

Ideally we'd rework the section markers to not have this problem, either
rethinking the way we mark them as flexible arrays, or giving them accessors,
e.g.

	#define va_init_begin()	RELOC_HIDE((unsigned long)__init_begin)

... which'd be a pain, but at least it'd solve this generally.

> I think the easy fix would be to reword this line to
> 
>        kernel_code.end     = __pa_symbol(__init_begin) - 1;
> 

I agree that'd work for the __pa_symbol() cases.

For consistency it might be worth using RELOC_HIDE(), e.g.

	kernel_code.end     = __pa_symbol(RELOC_HIDE(__init_begin)) - 1);

... which IIUC should do the trick.

Thanks,
Mark.
