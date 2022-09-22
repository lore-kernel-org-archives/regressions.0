Received: from rhlx01.hs-esslingen.de (rhlx01.hs-esslingen.de [129.143.116.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985F92CA2
	for <regressions@lists.linux.dev>; Thu, 22 Sep 2022 20:10:23 +0000 (UTC)
Received: by rhlx01.hs-esslingen.de (Postfix, from userid 102)
	id 17836277FBA8; Thu, 22 Sep 2022 22:10:21 +0200 (CEST)
Date: Thu, 22 Sep 2022 22:10:21 +0200
From: Andreas Mohr <andi@lisas.de>
To: Andreas Mohr <andi@lisas.de>
Cc: Dave Hansen <dave.hansen@intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org, rafael@kernel.org, lenb@kernel.org,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	dave.hansen@linux.intel.com, bp@alien8.de, tglx@linutronix.de,
	puwen@hygon.cn, mario.limonciello@amd.com, peterz@infradead.org,
	rui.zhang@intel.com, gpiccoli@igalia.com, daniel.lezcano@linaro.org,
	ananth.narayan@amd.com, gautham.shenoy@amd.com,
	Calvin Ong <calvin.ong@amd.com>, stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] ACPI: processor_idle: Skip dummy wait for processors
 based on the Zen microarchitecture
Message-ID: <YyzBLc+OFIN2BMz5@rhlx01.hs-esslingen.de>
References: <20220921063638.2489-1-kprateek.nayak@amd.com>
 <20e78a49-25df-c83d-842e-1d624655cfd7@intel.com>
 <0885eecb-042f-3b74-2965-7d657de59953@amd.com>
 <88c17568-8694-940a-0f1f-9d345e8dcbdb@intel.com>
 <Yyy6l94G0O2B7Yh1@rhlx01.hs-esslingen.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yyy6l94G0O2B7Yh1@rhlx01.hs-esslingen.de>
X-Priority: none

On Thu, Sep 22, 2022 at 09:42:15PM +0200, Andreas Mohr wrote:
> So one can see where my profiling effort went
> (*optimizing* things, not degrading them)
> --> hints that current Zen3-originating effort is not
> about a regression in the "regression bug" sense -
> merely a (albeit rather appreciable/sizeable... congrats!)
> performance deterioration vs.
> an optimal (currently non-achieved) software implementation state
> (also: of PORT-based handling [vs. MWAIT], mind you!).

I'd like to add a word of caution here:

AFAIK power management (here: ACPI Cx) handling generally is
about a painful *tradeoff* between
achieving best-possible performance (that's
the respectable Zen3 32MB/s vs. 33MB/s argument) and
achieving maximum power savings.
We all know that one can configure the system for
non-idle mode (idle=poll cmdline?) and
achieve record numbers in performance (...*and* power consumption - ouch!).

Current decision/implementation aspects AFAICS:
- why is the Zen3 config used here choosing
  less-favourable(?) PORT-based operation mode?
- Zen3 is said to not have the STPCLK# issue
  (- but then what about other more modern chipsets?)

--> we need to achieve (hopefully sufficiently precisely) a solution which
takes into account Zen3 STPCLK# improvements while
preserving "accepted" behaviour/requirements on *all* STPCLK#-hampered chipsets
("STPCLK# I/O wait is default/traditional handling"?).

Greetings

Andreas Mohr

-- 
GNU/Linux. It's not the software that's free, it's you.
