Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145995CA1
	for <regressions@lists.linux.dev>; Sat, 28 Jan 2023 14:26:22 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6AF661EC04DA;
	Sat, 28 Jan 2023 15:26:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1674915970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=lBFGP4yA9k5cO2OLJZCLuNTIHgdD3+vaWhJ4I1sxvM8=;
	b=AfJTMGFn5O5ltgpj5wdZsOMxfOG21YLDguHUh+Oulfh93dCDMNc19PIu/BNcm/hUvbdKgE
	GVSwQ+8KgFuZT5ARsolPiWAtc4kR0mctikdlWuKFKH1c4Y7ZYyaYCAgpV8Lid6e0xZI5zz
	evcMq872nYblde6/DG7F15KQLL8Te7M=
Date: Sat, 28 Jan 2023 15:26:00 +0100
From: Borislav Petkov <bp@alien8.de>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	linux-mm <linux-mm@kvack.org>, lkml <linux-kernel@vger.kernel.org>
Subject: Re: Failure during Stack Depot allocating hash table of 1048576
 entries with kvcalloc
Message-ID: <Y9UweHxSfPiAqgZx@zn.tnic>
References: <Y8Fq5m0CLfcFLCOY@zn.tnic>
 <07e42002-e78d-7947-19a7-0dd035466f50@alu.unizg.hr>
 <Y9UBFNwBeuePPsk3@zn.tnic>
 <d4871e70-c7c9-e638-d7c0-304ec8aea77b@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d4871e70-c7c9-e638-d7c0-304ec8aea77b@leemhuis.info>

On Sat, Jan 28, 2023 at 02:55:58PM +0100, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
> On 28.01.23 12:03, Borislav Petkov wrote:
> > On Sat, Jan 28, 2023 at 03:41:50AM +0100, Mirsad Goran Todorovac wrote:
> >> This appears to be a duplicate of the report:
> >> https://lore.kernel.org/linux-mm/2c677d85-820c-d41a-fc98-7d3974b49e42@alu.unizg.hr/raw
> > 
> > Yah, looks like
> > 
> > 56a61617dd22 ("mm: use stack_depot for recording kmemleak's backtrace")
> > 
> > needs to be reverted.
> 
> Unless I'm missing something (which might easily be the case) there is a
> patch for that issue in -mm already:
> 
> https://lore.kernel.org/all/20230119224022.80752C433F0@smtp.kernel.org/
> 
> Or where two different issues discussed in the thread Mirsad mentioned
> above?

Probably the same issue. This one fixes the issue on my machine - thanks!

Tested-by: Borislav Petkov (AMD) <bp@alien8.de>

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
