Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF56290B
	for <regressions@lists.linux.dev>; Thu, 14 Jul 2022 08:22:23 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3917168AA6; Thu, 14 Jul 2022 10:22:12 +0200 (CEST)
Date: Thu, 14 Jul 2022 10:22:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
	linux-mm <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Christoph Hellwig <hch@lst.de>,
	"open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	Tom Lendacky <thomas.lendacky@amd.com>, conor@kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [next] Kernel panic - not syncing: swiotlb_init_remap: nslabs
 = 0 too small
Message-ID: <20220714082212.GA30886@lst.de>
References: <CA+G9fYuxp2Ge1JGwuXase633r8_7zPZkxrD6doCKi6aYY3mfPw@mail.gmail.com> <ca41951e-e662-c4ba-eb78-68ddc77cba2b@arm.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca41951e-e662-c4ba-eb78-68ddc77cba2b@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jul 14, 2022 at 01:50:02PM +0530, Anshuman Khandual wrote:
> 26ffb91fa5e0fb282e8 ("swiotlb: split up the global swiotlb lock")

This has been replace with 20347fca71a387a3751f7bb270062616ddc5317a
that should fix the issue.
