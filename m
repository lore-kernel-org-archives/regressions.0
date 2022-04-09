Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257D2A52
	for <regressions@lists.linux.dev>; Sat,  9 Apr 2022 22:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C41C385A0;
	Sat,  9 Apr 2022 22:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1649542631;
	bh=SSof2Ous81vQ0QbF3W9CmaDN73qqvK5z2RaO1OMDPHo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h2054lt6djFhf2sO5gwbOtenn6y9nH+QkjFDtSYieD+3eILv2qzBD80EDjIDNmRLz
	 qWxoIQMnhCg/CLns7bysn4tvSM0cNxMZVE8OIKyPvboNPHrmHjNx79KjI+PnZ06z8K
	 eCTMRQ5Oe/IqguOE4xaH4Ov+FR624HKgQE5Sn/iw=
Date: Sat, 9 Apr 2022 15:17:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Chris Kennelly <ckennelly@google.com>, Al
 Viro <viro@zeniv.linux.org.uk>, Alexey Dobriyan <adobriyan@gmail.com>, Song
 Liu <songliubraving@fb.com>, David Rientjes <rientjes@google.com>, Ian
 Rogers <irogers@google.com>, Hugh Dickins <hughd@google.com>, Suren
 Baghdasaryan <surenb@google.com>, Sandeep Patil <sspatil@google.com>,
 Fangrui Song <maskray@google.com>, Nick Desaulniers
 <ndesaulniers@google.com>, "Kirill A. Shutemov"
 <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 Shuah Khan <shuah@kernel.org>
Subject: Re: Bug 215734 - shared object loaded very low in memory ARM 32bit
 with kernel 5.17.0
Message-Id: <20220409151710.2aa22be82ce554e779c42744@linux-foundation.org>
In-Reply-To: <b685f3d0-da34-531d-1aa9-479accd3e21b@leemhuis.info>
References: <e2b90c55-1a4a-4cf1-2dc7-2b2a4dc7d168@leemhuis.info>
	<b685f3d0-da34-531d-1aa9-479accd3e21b@leemhuis.info>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 9 Apr 2022 13:52:17 +0200 Thorsten Leemhuis <regressions@leemhuis.info> wrote:

> Hi, this is your Linux kernel regression tracker. Top-posting for once,
> to make this easily accessible to everyone.
> 
> Hey, what's up here? Was this regressions fixed already?

I didn't know about these post-Mike regressions.

> H.J. Lu: reminder, this is caused by a patch of yours. One that causes
> two regressions I track, and it seem neither is getting addressed with
> the appropriate urgency. FWIW, the other regression can can be found here:
> https://lore.kernel.org/lkml/cb5b81bd-9882-e5dc-cd22-54bdbaaefbbc@leemhuis.info/
> https://bugzilla.kernel.org/show_bug.cgi?id=215720
> 
> Mike, if you have a minute: '925346c129da' ("fs/binfmt_elf: fix PT_LOAD
> p_align values for loaders") in 'next' contains a 'Fixes:' tag for the
> culprit of this regression, but I assume it fixes a different issue?

I'm assuming Mike's fix was indeed targeted at these regressions and
presumably only partly fixed them.

Thanks.  I have queued reverts for both Mike's fix (925346c129da117)
and for the original patch (9630f0d60fec5fb).  Both reversions have
cc:stable.

I'll hold onto these reversions for a week or so before sending them
upstream, if they are still needed.

