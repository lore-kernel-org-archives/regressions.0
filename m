Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9648E107BE
	for <regressions@lists.linux.dev>; Tue, 26 Sep 2023 17:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6224C433C8;
	Tue, 26 Sep 2023 17:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695750932;
	bh=lkEslfpHFJOejPCis8PiWAyTpaGoKi32im5FR7jFJx8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=n5YPCAIHTnmW1FD4bOtkgnOUpykgsLjTEpT7DEgr03d28cV6YAhC6CXllVolejvfL
	 6Sd37idQP/cTDjdpRs3jQT9X4hoWkHQniQksV5PD8Ipzq15gTik9ywKZGYY+yEFCEw
	 EcwQDEVbsyRKpEvGp5bqWcQ2OJekkrOb1AVYGk+3goPtv9SuiwK34bYddI5HnHjGrJ
	 Ma0dJiXRBR2qfGt8+5IcJ6T95tmK7HawiqphlthdC8hf1aZW1WG3Dxe2r+mVCnvfve
	 AAgeEAh7FTLKLfBcLeEKWcBT1JZ36z4+Vxs/MShMQnTXLlh6YI917BJsGTHdNoDqs9
	 jzpY95s/gyPhQ==
Date: Tue, 26 Sep 2023 12:55:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Kamil Paral <kparal@redhat.com>, linux-pci@vger.kernel.org,
	regressions@lists.linux.dev, bhelgaas@google.com,
	chris.chiu@canonical.com
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
Message-ID: <20230926175530.GA418550@bhelgaas>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925141930.GA21033@wunner.de>

On Mon, Sep 25, 2023 at 04:19:30PM +0200, Lukas Wunner wrote:
> On Mon, Sep 25, 2023 at 08:48:41AM -0500, Bjorn Helgaas wrote:
> > Now pciehp thinks the slot is occupied and the link is up, so we
> > re-enumerate the hierarchy.  Is this because thunderbolt did something
> > to 06:00.0 that made the link from 05:01.0 come up?
> 
> PCIe TLPs are encapsulated into Thunderbolt packets and transmitted
> alongside DisplayPort and other data over the same physical link.
> 
> For this to work, PCIe tunnels need to be set up between the Thunderbolt
> host controller and attached devices.  Once a tunnel is established,
> the PCIe link magically goes up and TLPs can be transmitted.
> 
> There are two ways to establish those tunnels:
> 
> 1/ By a firmware in the Thunderbolt host controller.
>    (firmware or "internal" connection manager, drivers/thunderbolt/icm.c)
> 
> 2/ Natively by the kernel.
>    (software connection manager)
> 
> I'm assuming that the laptop in question exclusively uses the firmware
> connection manager, hence the kernel is reliant on that firmware to
> establish tunnels and can't really do anything if it fails to do so.

Thanks for the background; that improves my meager understanding a
lot.

Since this seems to be a firmware issue, it does sound like this
laptop uses a firmware connection manager.  But there still seems to
be some kernel connection because pre-e8b908146d44, the link came up
in <5 seconds, and after the minor e8b908146d44 change, it takes >60
seconds.

I'm kind of at a loss here because I don't have a clear path forward.
What I'm hearing is that the real fix is a firmware update or a BIOS
setting change (Thunderbolt "user" instead of "secure" mode).

That is problematic for users, who will think resume got broken and
they don't know how to fix it.  It's problematic for me, because it
*looks* like a PCI issue and a PCI change exposed it, so I'll have to
deal with the reports.

Bjorn
