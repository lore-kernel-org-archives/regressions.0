Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7B13229
	for <regressions@lists.linux.dev>; Mon, 27 Jun 2022 23:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02FCC34115;
	Mon, 27 Jun 2022 23:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656371892;
	bh=rfQeRLN9z1o923FUl9dNISqlTth88b4HeA/7YNV6gyY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kg68D/TcUqGOde/5iF8VLMXjQb5uU+v5M8gaXzd3rh7sndPGEoRdHHjgWSxRqyLUL
	 Ev6tw+R5xX+yDtsSRWT7XDOXf0ZKWBjpZF+ebfa+YVglIeNxhbaiDaaPnJal8FEjKu
	 jJbD8Op1VvIU4V096a9r9ELIbHlZfjd3/R3Y2BWtCvhEOiOtP1H3EyVACyB/BCoVdB
	 DXvpwTj75DFZoQJFQLzgCEsZFHesPo3KpPqf2Vmc/n0K/LtZ/0BjrFuoQPKvz6TRr9
	 DBLJS8lqS5IFnyhW7YRklIHq+PgHu+3wSK0nctZ9qbTYyPDvhppOat2c2QOs3fUcIY
	 nruCj6soZCy/Q==
Date: Mon, 27 Jun 2022 18:18:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jim Quinlan <jim2101024@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
	linux-pci <linux-pci@vger.kernel.org>, regressions@lists.linux.dev,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 0/4] PCI: brcmstb: Revert subdevice regulator stuff
Message-ID: <20220627231810.GA1790539@bhelgaas>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621233257.GA1342369@bhelgaas>

On Tue, Jun 21, 2022 at 06:32:59PM -0500, Bjorn Helgaas wrote:
> On Tue, Jun 14, 2022 at 02:59:02PM -0400, Jim Quinlan wrote:
> > ...
> 
> > The original patchset was and is controversial, as it is basically a
> > square peg that does not fit nicely into a round Linux hole. It took
> > 11 versions of following reviewers' suggestions until it was
> > accepted.  And now it has been reverted, I am wondering if it will
> > ever be let in again or whether I should even try.
> 
> The original patchset [1] may have been controversial, but that's not
> the issue here.  The only thing we need to solve here is to post the
> four patches I reverted with a tiny change to one of them to avoid the
> regression.  I don't think that should be a problem.

I'll be on vacation until July 7 or 8.  Just a heads-up so you know
it's not that I'm ignoring anything you may post in the meantime.

Bjorn

> [1] https://lore.kernel.org/r/20220106160332.2143-1-jim2101024@gmail.com
