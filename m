Received: from trent.utfs.org (trent.utfs.org [94.185.90.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621412F21
	for <regressions@lists.linux.dev>; Mon, 13 Feb 2023 22:54:17 +0000 (UTC)
Received: from localhost (localhost [IPv6:::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by trent.utfs.org (Postfix) with ESMTPS id 3C3C15F7C3;
	Mon, 13 Feb 2023 23:54:14 +0100 (CET)
Date: Mon, 13 Feb 2023 23:54:14 +0100 (CET)
From: Christian Kujau <lists@nerdbynature.de>
To: Juergen Gross <jgross@suse.com>
cc: mikelley@microsoft.com, 
    Linux regressions mailing list <regressions@lists.linux.dev>, 
    linux-kernel@vger.kernel.org, x86@kernel.org, 
    torvalds@linux-foundation.org, Dave Hansen <dave.hansen@linux.intel.com>, 
    Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
    Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 5/8] x86/mtrr: revert commit 90b926e68f50
In-Reply-To: <f18e315f-bfe2-426d-0ecf-d82fb22a05f4@suse.com>
Message-ID: <47d6d93f-defd-d18a-276a-417252e7ddce@nerdbynature.de>
References: <20230209072220.6836-1-jgross@suse.com> <20230209072220.6836-6-jgross@suse.com> <9046a3cb-928a-5476-1e72-63bd197c039e@leemhuis.info> <129d8c1d-ffa6-dac2-f516-dab4fc8c6218@suse.com> <6e4198c2-d79c-8ebd-82f7-3826dd807f1b@nerdbynature.de>
 <f18e315f-bfe2-426d-0ecf-d82fb22a05f4@suse.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

On Mon, 13 Feb 2023, Juergen Gross wrote:
> Hmm, this would make Hyper-V SEV-SNP guests slow again.
> 
> I'm not completely against it, but OTOH I'm a little bit biased as the
> maintainer of the Xen code. :-)

Understood. I'm a bit puzzled why nobody else reports this, maybe Xen Dom0 
and external USB enclosures are not that common.

> Michael, would you see major problems with doing the revert before having
> the final patches for fixing your issue, too?

If that revert ends up in mainline, feel free to add:

 Tested-by: Christian Kujau <lists@nerdbynature.de> 

...if that makes any difference.

Thanks,
Christian.
-- 
BOFH excuse #199:

the curls in your keyboard cord are losing electricity.
