Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [193.142.43.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE6157EB
	for <regressions@lists.linux.dev>; Fri,  1 Jul 2022 20:23:30 +0000 (UTC)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1o7MpC-00040v-4C; Fri, 01 Jul 2022 22:01:10 +0200
Date: Fri, 1 Jul 2022 22:01:10 +0200
From: Florian Westphal <fw@strlen.de>
To: Kajetan Puchalski <kajetan.puchalski@arm.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Mel Gorman <mgorman@suse.de>, lukasz.luba@arm.com,
	dietmar.eggemann@arm.com, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, netdev@vger.kernel.org,
	stable@vger.kernel.org, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Regression] stress-ng udp-flood causes kernel panic on Ampere
 Altra
Message-ID: <20220701200110.GA15144@breakpoint.cc>
References: <Yr7WTfd6AVTQkLjI@e126311.manchester.arm.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yr7WTfd6AVTQkLjI@e126311.manchester.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Kajetan Puchalski <kajetan.puchalski@arm.com> wrote:
> While running the udp-flood test from stress-ng on Ampere Altra (Mt.
> Jade platform) I encountered a kernel panic caused by NULL pointer
> dereference within nf_conntrack.
> 
> The issue is present in the latest mainline (5.19-rc4), latest stable
> (5.18.8), as well as multiple older stable versions. The last working
> stable version I found was 5.15.40.

Do I need a special setup for conntrack?

No crashes after more than one hour of stress-ng on
1. 4 core amd64 Fedora 5.17 kernel
2. 16 core amd64, linux stable 5.17.15
3. 12 core intel, Fedora 5.18 kernel
4. 3 core aarch64 vm, 5.18.7-200.fc36.aarch64

I used standard firewalld ruleset for all of these and manually tuned
conntrack settings to make sure the early evict path (as per backtrace)
gets exercised.
