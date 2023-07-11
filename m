Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9682818AE0
	for <regressions@lists.linux.dev>; Tue, 11 Jul 2023 11:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DC2C433C7;
	Tue, 11 Jul 2023 11:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689073306;
	bh=R05i0tfIilRVHzTS9Y6rvcMfdBq0WFxNA/CtDRe9kk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vB76sJ66UWbSFxqdwf7J5SwQ7MdPBoPk4RK9avcVbGxISO6cLmi8tu422q2aRHNRb
	 XSiGx9a08oyMinnRV4gFgj2enU1kyNlVB0Atn9FfjOz2PAdT0Arse2cR/UMwIq9uEV
	 +BDDjI0ZOxha16mUE5TbYZd9/bhO8444m4dJbCD/Eq0aUGQJROHd4RdJvSQSgYRyVF
	 nQUsgsaa9CbO4JC54oVkjyO48OYqRSh4e4cldVtSgmFmpyrQfqZ3ecDjzFNEknvtuz
	 OJkBU/CFCRhPoPCDLbCeGfkwOSVJ2avvOo+6ibWOqwsZTaFLSw9dr2ty8M3swOBF2U
	 4B0fNwUdBnCyA==
Date: Tue, 11 Jul 2023 14:01:41 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Suren Baghdasaryan <surenb@google.com>,
	Laurent Dufour <ldufour@linux.ibm.com>,
	Sachin Sant <sachinp@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>, michel@lespinasse.org,
	jglisse@google.com, mhocko@suse.com, hannes@cmpxchg.org,
	mgorman@techsingularity.net, dave@stgolabs.net, willy@infradead.org,
	liam.howlett@oracle.com, peterz@infradead.org, paulmck@kernel.org,
	mingo@redhat.com, will@kernel.org, luto@kernel.org,
	songliubraving@fb.com, peterx@redhat.com, david@redhat.com,
	dhowells@redhat.com, hughd@google.com, bigeasy@linutronix.de,
	kent.overstreet@linux.dev, punit.agrawal@bytedance.com,
	lstoakes@gmail.com, peterjung1337@gmail.com, rientjes@google.com,
	chriscli@google.com, axelrasmussen@google.com, joelaf@google.com,
	minchan@google.com, rppt@kernel.org, jannh@google.com,
	shakeelb@google.com, tatashin@google.com, edumazet@google.com,
	gthelen@google.com, gurua@google.com, arjunroy@google.com,
	soheil@google.com, leewalsh@google.com, posk@google.com,
	michalechner92@googlemail.com, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, regressions@leemhuis.info,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	maorg@nvidia.com, gal@nvidia.com, ranro@nvidia.com,
	drort@nvidia.com, idok@nvidia.com, sergeyy@nvidia.com
Subject: Re: [PATCH v4 00/33] Per-VMA locks
Message-ID: <20230711110141.GN41919@unreal>
References: <20230227173632.3292573-1-surenb@google.com>
 <20230711103541.GA190975@unreal>
 <53676850-539f-2813-d55d-a8bc0ec88092@suse.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53676850-539f-2813-d55d-a8bc0ec88092@suse.cz>

On Tue, Jul 11, 2023 at 12:39:34PM +0200, Vlastimil Babka wrote:
> On 7/11/23 12:35, Leon Romanovsky wrote:
> > 
> > On Mon, Feb 27, 2023 at 09:35:59AM -0800, Suren Baghdasaryan wrote:
> > 
> > <...>
> > 
> >> Laurent Dufour (1):
> >>   powerc/mm: try VMA lock-based page fault handling first
> > 
> > Hi,
> > 
> > This series and specifically the commit above broke docker over PPC.
> > It causes to docker service stuck while trying to activate. Revert of
> > this commit allows us to use docker again.
> 
> Hi,
> 
> there have been follow-up fixes, that are part of 6.4.3 stable (also
> 6.5-rc1) Does that version work for you?

I'll recheck it again on clean system, but for the record:
1. We are running 6.5-rc1 kernels.
2. PPC doesn't compile for us on -rc1 without this fix.
https://lore.kernel.org/all/20230629124500.1.I55e2f4e7903d686c4484cb23c033c6a9e1a9d4c4@changeid/
3. I didn't see anything relevant -rc1 with "git log arch/powerpc/mm/fault.c".

Do you have in mind anything specific to check?

Thanks
