Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [193.142.43.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBFE638
	for <regressions@lists.linux.dev>; Thu,  7 Jul 2022 18:59:28 +0000 (UTC)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1o9Wid-00047U-6c; Thu, 07 Jul 2022 20:59:19 +0200
Date: Thu, 7 Jul 2022 20:59:19 +0200
From: Florian Westphal <fw@strlen.de>
To: Will Deacon <will@kernel.org>
Cc: Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org,
	regressions@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Kajetan Puchalski <kajetan.puchalski@arm.com>
Subject: Re: [PATCH nf v3] netfilter: conntrack: fix crash due to confirmed
 bit load reordering
Message-ID: <20220707185919.GA14663@breakpoint.cc>
References: <20220706124007.GB7996@breakpoint.cc>
 <20220706145004.22355-1-fw@strlen.de>
 <20220707081949.GA4057@willie-the-truck>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707081949.GA4057@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)

Will Deacon <will@kernel.org> wrote:
> On Wed, Jul 06, 2022 at 04:50:04PM +0200, Florian Westphal wrote:
> >  net/netfilter/nf_conntrack_core.c       | 22 ++++++++++++++++++++++
> >  net/netfilter/nf_conntrack_netlink.c    |  1 +
> >  net/netfilter/nf_conntrack_standalone.c |  3 +++
> >  3 files changed, 26 insertions(+)
> 
> Acked-by: Will Deacon <will@kernel.org>

Thanks, I pushed this patch to nf.git.
