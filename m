Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA7211C8B
	for <regressions@lists.linux.dev>; Mon, 25 Sep 2023 14:25:05 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 798972800BB8A;
	Mon, 25 Sep 2023 16:19:30 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 4F60053E160; Mon, 25 Sep 2023 16:19:30 +0200 (CEST)
Date: Mon, 25 Sep 2023 16:19:30 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Kamil Paral <kparal@redhat.com>, linux-pci@vger.kernel.org,
	regressions@lists.linux.dev, bhelgaas@google.com,
	chris.chiu@canonical.com
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
Message-ID: <20230925141930.GA21033@wunner.de>
References: <20230925045928.GH3208943@black.fi.intel.com>
 <20230925134841.GA382338@bhelgaas>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925134841.GA382338@bhelgaas>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Sep 25, 2023 at 08:48:41AM -0500, Bjorn Helgaas wrote:
> Now pciehp thinks the slot is occupied and the link is up, so we
> re-enumerate the hierarchy.  Is this because thunderbolt did something
> to 06:00.0 that made the link from 05:01.0 come up?

PCIe TLPs are encapsulated into Thunderbolt packets and transmitted
alongside DisplayPort and other data over the same physical link.

For this to work, PCIe tunnels need to be set up between the Thunderbolt
host controller and attached devices.  Once a tunnel is established,
the PCIe link magically goes up and TLPs can be transmitted.

There are two ways to establish those tunnels:

1/ By a firmware in the Thunderbolt host controller.
   (firmware or "internal" connection manager, drivers/thunderbolt/icm.c)

2/ Natively by the kernel.
   (software connection manager)

I'm assuming that the laptop in question exclusively uses the firmware
connection manager, hence the kernel is reliant on that firmware to
establish tunnels and can't really do anything if it fails to do so.

IMO it goes to show that the native approach is more robust.

Thanks,

Lukas
