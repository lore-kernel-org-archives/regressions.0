Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E518008
	for <regressions@lists.linux.dev>; Tue, 27 Jun 2023 16:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4024C433C0;
	Tue, 27 Jun 2023 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687882249;
	bh=2aOnkNNVe6yhqp19uUA0sWVcSn4XTIaNZ6lJ4idUO/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ni4544vdzZ9f+x8R3vSLZBcmkDQhC8cvvIPCUPilWV2BPAKNdrMEzIQKM1hQFZtJ8
	 Upkpdc6tVA3WJDyh2hg1hvWFtr+94TxKb33s6lHxCZNoGIO3SXeddpkgFHUCdHzBk+
	 PJhK/tw/eLWeiIWAqTWMfO0ikVuzk8JN5ARd0vFKpvmdp116CNjA/6CRiiALDxYeVF
	 4SUzObr6CK5oJ/aUJFa00lExqjOrqJNPsxfnv5AT1rw6XUusRA70tLmvWeKfpvSF3B
	 anObYKVsdfZbv8/CMHvbIVjm8iHVDrDlFXdCL5BekgN0LNHuick2x60k+Gz7r0is3t
	 1jKV4oQHSuQEQ==
Date: Tue, 27 Jun 2023 10:10:46 -0600
From: Keith Busch <kbusch@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	"Clemens S." <cspringsguth@gmail.com>,
	Martin Belanger <martin.belanger@dell.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	John Meneghini <jmeneghi@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux NVMe <linux-nvme@lists.infradead.org>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>
Subject: Re: Fwd: Need NVME QUIRK BOGUS for SAMSUNG MZ1WV480HCGL-000MV
 (Samsung SM-953 Datacenter SSD)
Message-ID: <ZJsKBkPqoWzYyngS@kbusch-mbp.dhcp.thefacebook.com>
References: <d18d2a08-9d24-0209-c2cf-baf60bbf5048@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d18d2a08-9d24-0209-c2cf-baf60bbf5048@gmail.com>

On Mon, Jun 26, 2023 at 08:15:49AM +0700, Bagas Sanjaya wrote:
> See Bugzilla for the full thread.
> 
> The reporter had a quirk (see above) that fixed this regression,
> nevertheless I'm adding it to regzbot to make sure it doesn't fall
> through cracks unnoticed:
> 
> #regzbot introduced: 86c2457a8e8112f https://bugzilla.kernel.org/show_bug.cgi?id=217593
> #regzbot title: NVME_QUIRK_BOGUS_NID is needed for SAMSUNG MZ1WV480HCGL-000MV

These bug reports really should go to the vendors that created the
broken device with non-unique "unique" fields. It's easy enough for me
to write the quirk patch, but it's not the ideal solution and may harm
devices/firmwares with the same VID:DID that don't have this problem.
Not being the vendor, I'm not in a postition to know that, so CC'ing
some Samsung folks.
