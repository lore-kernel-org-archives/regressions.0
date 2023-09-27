Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D7F347DC
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 14:31:51 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 895A72800A28A;
	Wed, 27 Sep 2023 16:31:43 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 7C0A38030C; Wed, 27 Sep 2023 16:31:43 +0200 (CEST)
Date: Wed, 27 Sep 2023 16:31:43 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Kamil Paral <kparal@redhat.com>,
	linux-pci@vger.kernel.org, regressions@lists.linux.dev,
	bhelgaas@google.com, chris.chiu@canonical.com
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
Message-ID: <20230927143143.GA16217@wunner.de>
References: <20230927051602.GX3208943@black.fi.intel.com>
 <20230927115703.GA445616@bhelgaas>
 <20230927124732.GI3208943@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927124732.GI3208943@black.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Sep 27, 2023 at 03:47:32PM +0300, Mika Westerberg wrote:
> This is not a Linux defect. The firmware is expected to create that
> tunnel so regardless of the "delay" the devices are already back. This
> is not happening.

I recall that newer chips can be switched over to software connection
manager at runtime.

Can we determine that the ICM firmware failed to do what it should,
kick it out and let the software connection manager take over?

Thanks,

Lukas
