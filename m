Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04783FC7
	for <regressions@lists.linux.dev>; Sun, 26 Sep 2021 02:08:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB93761090;
	Sun, 26 Sep 2021 02:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632622122;
	bh=5jox8j1FhFcEcbka5HbxQzgLIhab0NqBEibSv3/IJJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d7Q3mt0ZFhAeuW2m3fNMTeWYbhle4gbt5/OKVNcOiDzIVuiSQ6cj6Sp0KMieQgAa1
	 POZomGN9wpJmhiWeOoH/sn2KVI9Ylm44XimgC+gvIPs2hF0AaxbNlzfnQPlK8aONPy
	 +KhnTm/YKJPpxdchJCAkqr8jPZeje44Jf27vY2KRXrPNUDh3mA2/nVqCjf97XRaCCU
	 2R5JrHrqDSaSzun2ADYUdsGzW0lpf0IBLV0wGJdAsKftnRiygfiCUR5u8+t+aLp1Rc
	 Tcz9iceuy56YQ803RyH1CKWzIJWQZ3UYVjAFxc3G5rZEBGaXWliqjjRz+37gGVVYTz
	 RKHrHJXYrKFxQ==
Date: Sat, 25 Sep 2021 20:08:39 -0600
From: Keith Busch <kbusch@kernel.org>
To: Orlando Chamberlain <redecorating@protonmail.com>
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"gargaditya08@live.com" <gargaditya08@live.com>,
	"sagi@grimberg.me" <sagi@grimberg.me>,
	"hare@suse.de" <hare@suse.de>, "dwagner@suse.de" <dwagner@suse.de>,
	"hch@lst.de" <hch@lst.de>
Subject: Re: [REGRESSION] nvme: code command_id with a genctr for
 use-after-free validation crashes apple T2 SSD
Message-ID: <20210926020839.GA96176@C02WT3WMHTD6>
References: <cjJiSFV77WM51ciS8EuBcdeBcv9T83PUB-Kw3yi8PuC_LwrrUUnQ3w5RC1PbKvSYE72KryXp3wOJhv4Ov_WWIe2gKWOOo5uwuUjbbFA8HDM=@protonmail.com>
 <20210925171618.GA116968@dhcp-10-100-145-180.wdc.com>
 <fa9de055-c3b8-20d3-41e0-12e43d0c336a@protonmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa9de055-c3b8-20d3-41e0-12e43d0c336a@protonmail.com>

On Sat, Sep 25, 2021 at 11:40:19PM +0000, Orlando Chamberlain wrote:
> I've managed to get it to boot by commenting out the counter increment, which might work
> as a quirk:

Great, that's essentially what I proposed in a different thread (sorry, I see
now you were not copied there):

  http://lists.infradead.org/pipermail/linux-nvme/2021-September/027665.html

The final patch may look a bit different, but it should be okay to test with
the one in the link.
