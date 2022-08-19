Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F77F23CD
	for <regressions@lists.linux.dev>; Fri, 19 Aug 2022 11:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99889C433C1;
	Fri, 19 Aug 2022 11:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660907078;
	bh=Q1fuI6kaHUAKv7wckjSX+NjcOnO//x+YueLRXxDkRVo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=OiH9oAxVgOifiMh44MQ7+gci9H9HpPzkUVcSXO2NlagkWNs+eW2yhvdrtgbBPsYYk
	 rNzaSQ6i6Udw9TmNlTPvYQnZ9Pe/IdaQr5FY1wwpRW0/XK+o7vPgd6w6GAo71JNbnY
	 9s6GtGMpRvVicUzj64cVvG6tpr3SWtC1H1GBpu+KrPW+z6AlJFPVU6IHF1LZpOtNXn
	 VuHxQI4LBR1x0czrNCfqsU7uDKyhX6njsOkBIsMl/iuzyGaqit1yLwUgHRFJaugeHw
	 0IxtxOfAj/x/+FP9LfZ19q9XRtgUaCu0Zfvd9UDqidQr/gaql2+USeEBSgVC63HgtQ
	 2YkTgG9vK/aEQ==
Date: Fri, 19 Aug 2022 06:04:37 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, regressions@lists.linux.dev,
	David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, Tom Seewald <tseewald@gmail.com>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Daniel Vetter <daniel@ffwll.ch>, Stefan Roese <sr@denx.de>
Subject: Re: [Bug 216373] New: Uncorrected errors reported for AMD GPU
Message-ID: <20220819110437.GA2432401@bhelgaas>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc036a10-5c13-fdd7-9d98-2b5f0f8af383@amd.com>

On Fri, Aug 19, 2022 at 02:03:59PM +0530, Lazar, Lijo wrote:

> Or, it could be amdgpu or some other software component -
> 
> register mmio base: 0x95E00000
> Address       0x95e7f000
> 
> 0x95e7f000 indicates access from CPU to a register offset 0x7FE000. This
> doesn't look like a valid register offset for this chip (device
> [1002:73df]). Any other clues in dmesg?

The complete dmesg is at
https://bugzilla.kernel.org/attachment.cgi?id=301596
