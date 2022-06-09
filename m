Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0387C
	for <regressions@lists.linux.dev>; Thu,  9 Jun 2022 22:11:47 +0000 (UTC)
Date: Thu, 9 Jun 2022 15:05:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1654812316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2UPb9iES8+SbQezsY3NnPZtFOJWYv6G44yCeplV12hY=;
	b=AHIturndbBN4CDx+oNBA07koXNaHAnzUcQra6tCpOXsmCewQ4MeJkX80gobs4dh570+SQq
	+Bo4vun5rtA+c12uZE3thcsY5phDz87d6tZkz1IiXOycsCMz7nrpGc2Jh+At2f1ecObMTL
	V4iu5dpTqsNdKlca0Ehf+ZZRKay27Ik=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Shakeel Butt <shakeelb@google.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-mm <linux-mm@kvack.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Raghuram Thammiraju <raghuram.thammiraju@arm.com>,
	Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>,
	Vasily Averin <vvs@openvz.org>, Qian Cai <quic_qiancai@quicinc.com>
Subject: Re: [next] arm64: boot failed - next-20220606
Message-ID: <YqJulJzLKVQ6xn88@carbon>
References: <CA+G9fYv7fESqpGoeKmHoJsst6wfRNMi2wQLGm+PsjbLDuDjdMQ@mail.gmail.com>
 <CA+G9fYsJThWFAxXTbAcJmjshx+oYxVVd+gMM680hS0X1z37+FQ@mail.gmail.com>
 <YqItYKEIvsw4Yzjx@carbon>
 <CALvZod6ojDd8Bc0VcyFEk-ZrdkFezvQPUvbGg3wyzae+NOp_4A@mail.gmail.com>
 <YqI0OYwNzxGo4XRo@carbon>
 <20220609191221.rv3lqbhipnvvzt67@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609191221.rv3lqbhipnvvzt67@google.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Thu, Jun 09, 2022 at 07:12:21PM +0000, Shakeel Butt wrote:
> On Thu, Jun 09, 2022 at 10:56:09AM -0700, Roman Gushchin wrote:
> > On Thu, Jun 09, 2022 at 10:47:35AM -0700, Shakeel Butt wrote:
> > > On Thu, Jun 9, 2022 at 10:27 AM Roman Gushchin <roman.gushchin@linux.dev> wrote:
> > > >
> > > [...]
> > > > +struct mem_cgroup *mem_cgroup_from_obj(void *p)
> > > > +{
> > > > +       struct folio *folio;
> > > > +
> > > > +       if (mem_cgroup_disabled())
> > > > +               return NULL;
> > > > +
> > > > +       if (unlikely(is_vmalloc_addr(p)))
> > > > +               folio = page_folio(vmalloc_to_page(p));
> > > 
> > > Do we need to check for NULL from vmalloc_to_page(p)?
> > 
> > Idk, can it realistically return NULL after is_vmalloc_addr() returned true?
> > I would be surprised, but maybe I'm missing something.
> 
> is_vmalloc_addr() is simply checking the range and some buggy caller can
> provide an unmapped address within the range. Maybe VM_BUG_ON() should
> be good enough (though no strong opinion either way).

No strong opinion here as well, but I think we don't have to be too defensive
here. Actually we'll know anyway, unlikely a null pointer dereference will be
unnoticed. And it's not different to calling mem_cgroup_from_obj() with some
random invalid address now.

Thanks!
