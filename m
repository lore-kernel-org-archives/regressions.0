Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0686F2115
	for <regressions@lists.linux.dev>; Fri, 13 Jan 2023 19:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2jFGVJyJ/iosZVuHIVC8047QtfgIKPOOdSnUPFqHVR4=; b=io34DlsqpWudAAwKTIGL2I9Mte
	qGFUz/cB1rR9ifWOxojzItN5ZnRD4ANxVfw2TlU1628oI/TT43CdD2ml09NNpbVK/dloopLqJmkYf
	dS9t/g1xGSpKg3U383Wop3rWMd+iQpEtRfXEWV+SkUM123Hl4kDhAsN+NU6SfBVC4M0TiKKVJk6gv
	t2s8KYOEV3ljETtuI1edG8vmUmkVtQJmegphfIEwMqEtNti63eaLf+HRIRSQ/mXaLzztvOU9ymoX9
	WWwHzjPvYUGVS3dpPmrKH8RXUincsc5FXWdsc7zkEUzRCZCTQ9VT1KH7r1IZqqZyM9ML6nW/cMBPL
	xEPGhLKQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGQ84-006Oq6-BL; Fri, 13 Jan 2023 19:54:20 +0000
Date: Fri, 13 Jan 2023 19:54:20 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Mark Brown <broonie@kernel.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: next: BUG: kernel NULL pointer dereference, address:
 0000000000000008 - RIP: 0010:do_wp_page
Message-ID: <Y8G27N+0Mpr9WmgD@casper.infradead.org>
References: <CA+G9fYt_b04YNCCv-iTZTtwb5fmNEQ0abiO46qW_-SrA1GQX8w@mail.gmail.com>
 <Y8Fkjxsq5EOtGiql@casper.infradead.org>
 <CA+G9fYuahjaNs6ia1UOeF98hUhonAt0Z4YOFGcqOKt3J4tRvTw@mail.gmail.com>
 <Y8F+iKuJWAFsUg2m@casper.infradead.org>
 <Y8G0fu7Kpkd8s7DE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8G0fu7Kpkd8s7DE@sirena.org.uk>

On Fri, Jan 13, 2023 at 07:43:58PM +0000, Mark Brown wrote:
> On Fri, Jan 13, 2023 at 03:53:44PM +0000, Matthew Wilcox wrote:
> 
> > Uh, are you compiling your kernels without debuginfo?  The results
> > from syzbot & 0day are much more useful:
> 
> FWIW here's a decode from arm64 (the boards I sampled all looked very
> similar):

We've identified the bad commit now ... this thread is just about
improving the process for next time ;-)

> <1>Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
> <1>Mem abort info:
> <1>  ESR = 0x0000000096000005
> <1>  EC = 0x25: DABT (current EL), IL = 32 bits
> <1>  SET = 0, FnV = 0
> <1>  EA = 0, S1PTW = 0
> <1>  FSC = 0x05: level 1 translation fault
> <1>Data abort info:
> <1>  ISV = 0, ISS = 0x00000005
> <1>  CM = 0, WnR = 0
> <1>user pgtable: 4k pages, 39-bit VAs, pgdp=00000000422b3000
> <1>[0000000000000008] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
> <0>Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
> <4>Modules linked in:
> <4>CPU: 3 PID: 58 Comm: modprobe Not tainted 6.2.0-rc3-next-20230113 #2
> <4>Hardware name: Libre Computer Board ALL-H3-CC H5 (DT)
> <4>pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> <4>pc : do_wp_page (include/linux/page-flags.h:251 mm/memory.c:3047 mm/memory.c:3425) 
> <4>lr : do_wp_page (mm/memory.c:3046 mm/memory.c:3425) 
> <4>sp : ffffffc00972bc50
> <4>x29: ffffffc00972bc50 x28: ffffff80022e8000 x27: ffffff8002f9c060
> <4>x26: 0000000000000002 x25: ffffff80022b4990 x24: 0000000000000000
> <4>x23: ffffff8002f9c000 x22: 0000000000000000 x21: 0000000000000000
> <4>x20: 0000000000000a55 x19: ffffffc00972bd38 x18: 0000000000000000
> <4>x17: 0000000000000000 x16: 0000000000000000 x15: ffffff80022bfa00
> <4>x14: ffffff8002f9c000 x13: ffffffc008b3bc88 x12: 0000007f9b02bfff
> <4>x11: 0000007f9ad49fc0 x10: ffffff80022bfa0c x9 : ffffff80022bfa00
> <4>x8 : ffffff80022bfa50 x7 : ffffff8002f9c000 x6 : 0000000000000000
> <4>x5 : 0000000000041362 x4 : 0000007f9ad49000 x3 : ffffff80022b4990
> <4>x2 : 0000000000100073 x1 : ffffff80022e8000 x0 : 0000000000000a55
> <4>Call trace:
> <4> do_wp_page (include/linux/page-flags.h:251 mm/memory.c:3047 mm/memory.c:3425) 
> <4> __handle_mm_fault (mm/memory.c:4937 mm/memory.c:5061) 
> <4> handle_mm_fault (mm/memory.c:5207) 
> <4> do_page_fault (arch/arm64/mm/fault.c:512 arch/arm64/mm/fault.c:612) 
> <4> do_mem_abort (arch/arm64/mm/fault.c:831) 
> <4> el0_da (arch/arm64/include/asm/daifflags.h:28 arch/arm64/kernel/entry-common.c:133 arch/arm64/kernel/entry-common.c:142 arch/arm64/kernel/entry-common.c:516) 
> <4> el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:659) 
> <4> el0t_64_sync (arch/arm64/kernel/entry.S:584) 
> <0>Code: aa1503f8 b9402a60 aa1503f6 b90063e0 (f94006a0)
> All code
> ========
>    0:	aa1503f8 	.word	0xaa1503f8
>    4:	b9402a60 	.word	0xb9402a60
>    8:	aa1503f6 	.word	0xaa1503f6
>    c:	b90063e0 	.word	0xb90063e0
>   10:*	f94006a0 	.word	0xf94006a0		<-- trapping instruction
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	f94006a0 	.word	0xf94006a0
> <4>---[ end trace 0000000000000000 ]---
> 
> The disassembly is disappointing, I didn't peer at why that is.


