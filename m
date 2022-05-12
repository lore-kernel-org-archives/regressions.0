Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65FC3232
	for <regressions@lists.linux.dev>; Thu, 12 May 2022 12:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38490C385B8;
	Thu, 12 May 2022 12:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652359508;
	bh=CiSM5k5I8BH5wYHCEvRtJ2V4OjBjPHHXnKvJf4ePol0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=gOEOMN0bhj5ST6FQuJLw0g8jT2dwbpHlY4JsjtzoR5VlBiBVbeCJqICEG7bI7Iw3i
	 Yqdj/NBb5yObIBvKKyV4PmwGuRTkfJqQp6W+RBOxnMWadbPG2WVaoyRzDkIduRhs/L
	 XNdoV4K9zlSAzVGT7FI5b3PvLOQ01rHe5fB/T2r9DP5J6N05JiMf1j72PvgdFPV5Ch
	 RDD4m1x5EWp/zKcFBrlT4eqst8V3GhvjYQBFlNJaklqigptB949ij7n2GsltaskD+U
	 xVMasXVchWKRxWo2aD0wuLqZkxDO+uteIDmEKLpRiBsyEc7IpYTQkv9aTQV3Y9uhrW
	 vsucPjLTvuxQg==
Date: Thu, 12 May 2022 07:45:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Jim Quinlan <jim2101024@gmail.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org,
	regressions@lists.linux.dev, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 1/4] Revert "PCI: brcmstb: Do not turn off WOL regulators
 on suspend"
Message-ID: <20220512124506.GA842977@bhelgaas>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d66ec3a0-10b4-fd60-0b03-e9a3f3571645@leemhuis.info>

On Thu, May 12, 2022 at 08:24:00AM +0200, Thorsten Leemhuis wrote:
> On 11.05.22 22:18, Bjorn Helgaas wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > This reverts commit 11ed8b8624b8085f706864b4addcd304b1e4fc38.
> > 
> > This is part of a revert of the following commits:
> > 
> >   11ed8b8624b8 ("PCI: brcmstb: Do not turn off WOL regulators on suspend")
> >   93e41f3fca3d ("PCI: brcmstb: Add control of subdevice voltage regulators")
> >   67211aadcb4b ("PCI: brcmstb: Add mechanism to turn on subdev regulators")
> >   830aa6f29f07 ("PCI: brcmstb: Split brcm_pcie_setup() into two funcs")
> > 
> > Cyril reported that 830aa6f29f07 ("PCI: brcmstb: Split brcm_pcie_setup()
> > into two funcs"), which appeared in v5.17-rc1, broke booting on the
> > Raspberry Pi Compute Module 4.  Apparently 830aa6f29f07 panics with an
> > Asynchronous SError Interrupt, and after further commits here is a black
> > screen on HDMI and no output on the serial console.
> > 
> > This does not seem to affect the Raspberry Pi 4 B.
> > 
> > Reported-by: Cyril Brulebois <kibi@debian.org>
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=215925
> 
> A "Bugzilla" tag? Why don't you just use a proper "Link:" tag, as
> explained by the documentation to use in this case (I clarified the docs
> recently with regards to this). Such inventions (some people use
> "References:", others "BugLink:" and there were a few others I already
> forget about) make my regression tracking efforts hard. :-/

In this case, I actually looked through the history to try to figure
out the most common way to cite bugzilla but didn't see much
uniformity.

Anyway, I updated these to "Link:".
