Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538EF1078D
	for <regressions@lists.linux.dev>; Thu, 13 Jul 2023 11:44:20 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id E91E668AA6; Thu, 13 Jul 2023 13:44:12 +0200 (CEST)
Date: Thu, 13 Jul 2023 13:44:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Keith Busch <kbusch@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>,
	"Clemens S." <cspringsguth@gmail.com>,
	Martin Belanger <martin.belanger@dell.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	John Meneghini <jmeneghi@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux NVMe <linux-nvme@lists.infradead.org>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Javier Gonzalez <javier.gonz@samsung.com>,
	=?utf-8?B?67CV7KeE7ZmY?= <jh.i.park@samsung.com>
Subject: Re: Fwd: Need NVME QUIRK BOGUS for SAMSUNG MZ1WV480HCGL-000MV
 (Samsung SM-953 Datacenter SSD)
Message-ID: <20230713114412.GA23427@lst.de>
References: <CGME20230710155902eucas1p2b464a29adc35e983c73b00d18ab5344c@eucas1p2.samsung.com> <ZKwqvTMPVmhnkZjS@kbusch-mbp.dhcp.thefacebook.com> <f0fdf86e-4293-8e07-835d-b5a866252068@samsung.com> <462e0e1e-98ea-0f3c-4aaa-8d44f0a8e664@leemhuis.info> <20230711120609.GB27050@lst.de> <CAHk-=whXh9sgLo24RO02JjfD0m3HE5NADRPWoEd+dW6bruFhVA@mail.gmail.com> <20230712164546.GA31434@lst.de> <CAHk-=whA9rmvNfo=8iKmtimayiA2Aus4XvPwcDrA53G2rfGP0w@mail.gmail.com> <20230712165721.GA31965@lst.de> <CAHk-=wgzetYEqj7phbJBE_ZshFq0=k3zWouJ8XyFyERgDX5sZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgzetYEqj7phbJBE_ZshFq0=k3zWouJ8XyFyERgDX5sZg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jul 12, 2023 at 10:34:05AM -0700, Linus Torvalds wrote:
> That's a *FACT*.
> 
> You then say "Some devices have UUID's, so all devices must have UUIDs".

Please stop putting words in my mouth.  Maybe instead of shouting it
would help to actually read the text?

You said we've never seen devices with reliably IDs, which simply isn't
true.  And that doesn't mean I'm saying all devices have reliably IDs,
which somehow you're not trying to make me say.
