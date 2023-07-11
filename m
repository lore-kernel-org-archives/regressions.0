Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F971DDE9
	for <regressions@lists.linux.dev>; Tue, 11 Jul 2023 17:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCCDC433C8;
	Tue, 11 Jul 2023 17:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689095652;
	bh=86IlMeB02kfIELN4JFOeqEXOrye+aqoKhFqCQG7VOig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gr3AhEtagw1brAmYmnAbs73gciLhmKWUnyV6CMkTfay98QySCMTe8OlSZzlG09SVd
	 1Qjm5UA00h0gKH82z50orU4V4fCXQDEEDxtSRDs1Jqqn1f5NQANaT7S8pptqZkCUIA
	 snYd3QSYyCg5y+0NeQb/JZGuQCOzftElGNfruNfCHt3//CU6U18v8afZqq43UvKRZx
	 rYI16JuEjTSp/Nwh/Zui5wammS6a+qu67zO9glI/OzUAyUltRw30ypgk6ukm3le5wi
	 PtegWv/Zw4cITTVeb3HsNGVBkBd1tSAyCuS390q9wDkxbpJWvpIySwyNyjRYuXsWIM
	 Lu7fHWCwg79CA==
Date: Tue, 11 Jul 2023 20:14:07 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>,
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
Message-ID: <20230711171407.GU41919@unreal>
References: <20230227173632.3292573-1-surenb@google.com>
 <20230711103541.GA190975@unreal>
 <53676850-539f-2813-d55d-a8bc0ec88092@suse.cz>
 <20230711110141.GN41919@unreal>
 <20230711110945.GO41919@unreal>
 <CAJuCfpG-dwzT++ZLY-sT2jn_9AHFVZsTfwJu17MwbB4oYJ4M+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpG-dwzT++ZLY-sT2jn_9AHFVZsTfwJu17MwbB4oYJ4M+g@mail.gmail.com>

On Tue, Jul 11, 2023 at 09:35:13AM -0700, Suren Baghdasaryan wrote:
> On Tue, Jul 11, 2023 at 4:09 AM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > On Tue, Jul 11, 2023 at 02:01:41PM +0300, Leon Romanovsky wrote:
> > > On Tue, Jul 11, 2023 at 12:39:34PM +0200, Vlastimil Babka wrote:
> > > > On 7/11/23 12:35, Leon Romanovsky wrote:
> > > > >
> > > > > On Mon, Feb 27, 2023 at 09:35:59AM -0800, Suren Baghdasaryan wrote:
> > > > >
> > > > > <...>
> > > > >
> > > > >> Laurent Dufour (1):
> > > > >>   powerc/mm: try VMA lock-based page fault handling first
> > > > >
> > > > > Hi,
> > > > >
> > > > > This series and specifically the commit above broke docker over PPC.
> > > > > It causes to docker service stuck while trying to activate. Revert of
> > > > > this commit allows us to use docker again.
> > > >
> > > > Hi,
> > > >
> > > > there have been follow-up fixes, that are part of 6.4.3 stable (also
> > > > 6.5-rc1) Does that version work for you?
> > >
> > > I'll recheck it again on clean system, but for the record:
> > > 1. We are running 6.5-rc1 kernels.
> > > 2. PPC doesn't compile for us on -rc1 without this fix.
> > > https://lore.kernel.org/all/20230629124500.1.I55e2f4e7903d686c4484cb23c033c6a9e1a9d4c4@changeid/
> >
> > Ohh, I see it in -rc1, let's recheck.
> 
> Hi Leon,
> Please let us know how it goes.

Once, we rebuilt clean -rc1, docker worked for us.
Sorry for the noise.

> 
> >
> > > 3. I didn't see anything relevant -rc1 with "git log arch/powerpc/mm/fault.c".
> 
> The fixes Vlastimil was referring to are not in the fault.c, they are
> in the main mm and fork code. More specifically, check for these
> patches to exist in the branch you are testing:
> 
> mm: lock newly mapped VMA with corrected ordering
> fork: lock VMAs of the parent process when forking
> mm: lock newly mapped VMA which can be modified after it becomes visible
> mm: lock a vma before stack expansion

Thanks

> 
> Thanks,
> Suren.
> 
> > >
> > > Do you have in mind anything specific to check?
> > >
> > > Thanks
> > >
> >
> > --
> > To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> >
