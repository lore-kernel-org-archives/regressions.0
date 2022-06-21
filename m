Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CFD1C0C
	for <regressions@lists.linux.dev>; Tue, 21 Jun 2022 23:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0541FC3411C;
	Tue, 21 Jun 2022 23:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655854379;
	bh=KUFldZDOWzF29Fw8oxWmlptCGlug7MaVxTpjrB6Z71Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=glnbAs7yOUm3A15oxIScXlj1d8r2W6PlYM03YYu5tsS7nfoFiX50dODjrF3eerESw
	 Im2aFI6jXmi2eCpLTSIj2MHK5SRTeG13x6yzelkdm4nNoGGIsLa1MuJWzITKrytH1N
	 s7S1vROFSmlvTsJCtG+C8yZ3kd3cZsrzU/cdXvXTJJA4o5Z3f4nK8XZnn4yMNj4aLf
	 eV63CC4Ypf6OEOjLNDbQeDGTWRLDszm9fvBDZlNGD9hcRRtjCi8mR5B82ZBpQX/yIq
	 QB0ScxGgUXFR/I4s9tIHyhmg7W8+s0ow6sPS37vlK4+zluPaFxneoP36GgP0tBI5t8
	 owrjVtqCjyRvg==
Date: Tue, 21 Jun 2022 18:32:57 -0500
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
Message-ID: <20220621233257.GA1342369@bhelgaas>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANCKTBtgZoXZikHVoLUVLGk04dzXYzdi-vdD-xaHnt0Z3BD45Q@mail.gmail.com>

On Tue, Jun 14, 2022 at 02:59:02PM -0400, Jim Quinlan wrote:
> ...

> The original patchset was and is controversial, as it is basically a
> square peg that does not fit nicely into a round Linux hole. It took
> 11 versions of following reviewers' suggestions until it was
> accepted.  And now it has been reverted, I am wondering if it will
> ever be let in again or whether I should even try.

The original patchset [1] may have been controversial, but that's not
the issue here.  The only thing we need to solve here is to post the
four patches I reverted with a tiny change to one of them to avoid the
regression.  I don't think that should be a problem.

Bjorn

[1] https://lore.kernel.org/r/20220106160332.2143-1-jim2101024@gmail.com
