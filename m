Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D7C7A
	for <regressions@lists.linux.dev>; Thu,  9 Jun 2022 18:01:48 +0000 (UTC)
Date: Thu, 9 Jun 2022 10:56:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1654797378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rnz2K2i3sOABjcYz20JocfHMNMQmCmpt0izotfrjuZE=;
	b=j67AOKPWQZyeQS+DeTeQuRDCfaY/8eqKGeUy1H2zcMJDvHMZ1bY+ozG1F+9aDgFxDAwdG3
	1jmuYudpBlTmQ01sl8S/rN5C524OkNZSYC0+tRoELIWkQNNhr3oPJ4mbEHp6wXD9lnJZ8l
	TnTT8UgAnnC6PdJYB2XoMlkbZyQMk08=
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
Message-ID: <YqI0OYwNzxGo4XRo@carbon>
References: <CA+G9fYv7fESqpGoeKmHoJsst6wfRNMi2wQLGm+PsjbLDuDjdMQ@mail.gmail.com>
 <CA+G9fYsJThWFAxXTbAcJmjshx+oYxVVd+gMM680hS0X1z37+FQ@mail.gmail.com>
 <YqItYKEIvsw4Yzjx@carbon>
 <CALvZod6ojDd8Bc0VcyFEk-ZrdkFezvQPUvbGg3wyzae+NOp_4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvZod6ojDd8Bc0VcyFEk-ZrdkFezvQPUvbGg3wyzae+NOp_4A@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Thu, Jun 09, 2022 at 10:47:35AM -0700, Shakeel Butt wrote:
> On Thu, Jun 9, 2022 at 10:27 AM Roman Gushchin <roman.gushchin@linux.dev> wrote:
> >
> [...]
> > +struct mem_cgroup *mem_cgroup_from_obj(void *p)
> > +{
> > +       struct folio *folio;
> > +
> > +       if (mem_cgroup_disabled())
> > +               return NULL;
> > +
> > +       if (unlikely(is_vmalloc_addr(p)))
> > +               folio = page_folio(vmalloc_to_page(p));
> 
> Do we need to check for NULL from vmalloc_to_page(p)?

Idk, can it realistically return NULL after is_vmalloc_addr() returned true?
I would be surprised, but maybe I'm missing something.
