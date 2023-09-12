Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74436AD49
	for <regressions@lists.linux.dev>; Tue, 12 Sep 2023 10:58:05 +0000 (UTC)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1qg0bl-000440-S5; Tue, 12 Sep 2023 12:27:01 +0200
Date: Tue, 12 Sep 2023 12:27:01 +0200
From: Florian Westphal <fw@strlen.de>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Timo Sigurdsson <public_timo.s@silentcreek.de>,
	kadlec@netfilter.org, fw@strlen.de, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, sashal@kernel.org, carnil@debian.org,
	1051592@bugs.debian.org
Subject: Re: Regression: Commit "netfilter: nf_tables: disallow rule addition
 to bound chain via NFTA_RULE_CHAIN_ID" breaks ruleset loading in
 linux-stable
Message-ID: <20230912102701.GA13516@breakpoint.cc>
References: <20230911213750.5B4B663206F5@dd20004.kasserver.com>
 <ZP+bUpxJiFcmTWhy@calendula>
 <b30a81fa-6b59-4bac-b109-99a4dca689de@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b30a81fa-6b59-4bac-b109-99a4dca689de@leemhuis.info>
User-Agent: Mutt/1.10.1 (2018-07-13)

Linux regression tracking (Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
> On 12.09.23 00:57, Pablo Neira Ayuso wrote:
> > Userspace nftables v1.0.6 generates incorrect bytecode that hits a new
> > kernel check that rejects adding rules to bound chains. The incorrect
> > bytecode adds the chain binding, attach it to the rule and it adds the
> > rules to the chain binding. I have cherry-picked these three patches
> > for nftables v1.0.6 userspace and your ruleset restores fine.
> > [...]
> 
> Hmmmm. Well, this sounds like a kernel regression to me that normally
> should be dealt with on the kernel level, as users after updating the
> kernel should never have to update any userspace stuff to continue what
> they have been doing before the kernel update.

This is a combo of a userspace bug and this new sanity check that
rejects the incorrect ordering (adding rules to the already-bound
anonymous chain).

nf_tables uses a transaction allor-nothing model, this means that any
error that occurs during a transaction has to be reverse/undo all the
pending changes.  This has caused a myriad of bugs already.

So while this can be theoretically fixed in the kernel I don't see
a sane way to do it.  Error unwinding / recovery from deeply nested
errors is already too complex for my taste.

> Can't the kernel somehow detect the incorrect bytecode and do the right
> thing(tm) somehow?

Theoretically yes, but I don't feel competent enough to do it, just look
at all the UaF bugs of the past month.

