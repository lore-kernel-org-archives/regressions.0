Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87032F2A
	for <regressions@lists.linux.dev>; Fri, 13 Jan 2023 15:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VqBqrKHoTF1oEfmV1b5/RHZVp974/h799RFrDq7FowI=; b=alEPbzL6ZHKE0rtbINvVU+EaOJ
	dr4qmn5NL9AEasyHZ1FOnCoC/dxA2IxxUdLL5EbilZ2F7GBSsXWaGYgonBamLQRSyoG0hvvN5uw9L
	A7RVK9slnPvcRnGJ6XbP4ngq1WDjgixPw9ZIXPcdbdjNS/VNKy1KYWl/sfkAgNuq0JsOYpflMaNV1
	BOz/dCHipEluvT6D7/s+IMaoao0DNQG5HSKd47lh5smzkDWJ6ZmHWfrqFWyplJEuVZny6u/acxV02
	CoorxpEE5E3K2dHRR+orNVB2IoBx18OU8CLU8V1mlcj+GRFmSsHYSchYvfePKPCmtqo6MNGc5+FAj
	TN0emfwQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGMNE-006Dpp-9t; Fri, 13 Jan 2023 15:53:44 +0000
Date: Fri, 13 Jan 2023 15:53:44 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Mark Brown <broonie@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: next: BUG: kernel NULL pointer dereference, address:
 0000000000000008 - RIP: 0010:do_wp_page
Message-ID: <Y8F+iKuJWAFsUg2m@casper.infradead.org>
References: <CA+G9fYt_b04YNCCv-iTZTtwb5fmNEQ0abiO46qW_-SrA1GQX8w@mail.gmail.com>
 <Y8Fkjxsq5EOtGiql@casper.infradead.org>
 <CA+G9fYuahjaNs6ia1UOeF98hUhonAt0Z4YOFGcqOKt3J4tRvTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuahjaNs6ia1UOeF98hUhonAt0Z4YOFGcqOKt3J4tRvTw@mail.gmail.com>

On Fri, Jan 13, 2023 at 09:14:15PM +0530, Naresh Kamboju wrote:
> Hi Matthew,
> 
> On Fri, 13 Jan 2023 at 19:32, Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Fri, Jan 13, 2023 at 06:53:01PM +0530, Naresh Kamboju wrote:
> > > Linux next tag 20230113 boot failed on x86_64, arm64, arm and i386.
> >
> > Why are you still not running these stack dumps through
> > scripts/decode_stacktrace.sh ?  That seems like it's much easier for you
> > to do than expecting everybody who might be interested in investigating
> > your reports to pull down enough of the build artifacts to make it work.
> 
> Hope this will help you.
> 
> # ./scripts/decode_stacktrace.sh vmlinux  < input.txt > output.txt
> 
> stack dumps:
> ------------------
> [   15.945626] BUG: kernel NULL pointer dereference, address: 0000000000000008
> [   15.952588] #PF: supervisor read access in kernel mode
> [   15.957720] #PF: error_code(0x0000) - not-present page
> [   15.962850] PGD 8000000103213067 P4D 8000000103213067 PUD 103212067 PMD 0
> [   15.969724] Oops: 0000 [#1] PREEMPT SMP PTI
> [   15.973909] CPU: 3 PID: 1 Comm: init Not tainted 6.2.0-rc3-next-20230113 #1
> [   15.980869] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
> 2.0b 07/27/2017
> [   15.988336] RIP: 0010:do_wp_page (memory.c:?)

Uh, are you compiling your kernels without debuginfo?  The results
from syzbot & 0day are much more useful:

https://lore.kernel.org/linux-mm/Y8FnAwWOxLrfoWTN@casper.infradead.org/T/#u

for an example.

> [   16.087446] Call Trace:
> [   16.089893]  <TASK>
> [   16.091991] ? trace_preempt_off (??:?)
> [   16.096087] ? __handle_mm_fault (memory.c:?)
> [   16.100439] __handle_mm_fault (memory.c:?)
> [   16.104617] handle_mm_fault (??:?)
> [   16.108457] do_user_addr_fault (fault.c:?)
> [   16.112642] exc_page_fault (??:?)
> [   16.116394] asm_exc_page_fault (??:?)
> [   16.120408] RIP: 0033:0x7fe169dbf31e

> Call Trace:
>  <TASK>
>  wp_page_copy mm/memory.c:3047 [inline]
>  do_wp_page+0x749/0x3880 mm/memory.c:3425
>  handle_pte_fault mm/memory.c:4937 [inline]
>  __handle_mm_fault+0x2183/0x3eb0 mm/memory.c:5061
>  handle_mm_fault+0x1b6/0x850 mm/memory.c:5207
>  do_user_addr_fault+0x475/0x1210 arch/x86/mm/fault.c:1407
>  handle_page_fault arch/x86/mm/fault.c:1498 [inline]
>  exc_page_fault+0x98/0x170 arch/x86/mm/fault.c:1554
>  asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:570
> RIP: 0033:0x7f92c0e2df98

See how much more useful that is?
