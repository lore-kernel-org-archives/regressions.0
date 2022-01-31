Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0AB2C82
	for <regressions@lists.linux.dev>; Mon, 31 Jan 2022 22:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5486BC340E8;
	Mon, 31 Jan 2022 22:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643667406;
	bh=l2z+lAUe/+F6BZPZI6f7qXZoGRCMMHhZIn0CHGQl3Nk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qj1RwbOA2eih9YWp46SPpm1Br65lLRzdJp20ake/jCWpIvH/YaXcdseDLHaGL1EV7
	 Q4RqxWvUglPguB2c0iD+Pu6siiVTc6sFUpdvdkSuAIcyQFEItUxRWex80yd0pp4/0u
	 JkqrOxLUXVzGIPVaatF8vd59IV/4g+qYx1fyVvp6qBJB4aGwGpAvN+vbninrddAZBu
	 wNSd72vZ2da8h+xKIDtXPNpWDN/oFVARuG3kX6UTx6Mg1y49nmuxb5ngKkjSqzMYIW
	 FeKKqQK5jJw8veLLqLavjL4o/s99OmyKfUMxOG0F7zuQXT/OXLiX2xSfAXIYJEpRRj
	 jLebys6Qd+8JQ==
Date: Mon, 31 Jan 2022 16:16:44 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: 100 ms boot time increase regression in
 acpi_init()/acpi_scan_bus()
Message-ID: <20220131221644.GA516851@bhelgaas>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b177cb21-aa01-2408-9b26-164c028b6593@molgen.mpg.de>

On Mon, Jan 10, 2022 at 12:29:44PM +0100, Paul Menzel wrote:
> PS: Do you know of GNU/Linux live systems that are available for all Linux
> kernel releases and have an initrd, that just stores/uploads the output of
> `dmesg`?

That would be pretty slick.

There is a collection of dmesg logs at https://github.com/linuxhw/Dmesg,
mentioned earlier:
https://lore.kernel.org/r/82035130-d810-9f0b-259e-61280de1d81f@redhat.com 
