Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BACEAF4
	for <regressions@lists.linux.dev>; Tue,  8 Aug 2023 11:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19FC2C433C8;
	Tue,  8 Aug 2023 11:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691493011;
	bh=19pV4hQvMhWN4VhmYApfZmIgWsEXTM2Lh3IfDUNTGGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iCQDO9G8ji1H+6GdiGshIIyY4PytBWNaJy2SZxah+iwRTvhxCieLi7wxdr1fUBO3B
	 tsrUCanSGrqSArW8VW68g3Xk6dzzFT32odY1shRfrCFiFh/5L93oIhAWyCmr5VNBxs
	 CIBlDYyCYnFIzsilA1myxnXm3XhD2LILC2lqswJjBhGdsLXcsD0z8UO8Hp6WVNA4wv
	 Hm++fKFFoFtq1LZZo6cPi32s8mJ0sc8jRYvjRPiSGWY33q13ERcM8/fBpi6nvZbqB7
	 N2gKTebQyZWb++hTRe22D2/OQo7EEDPa5TBzeR5j87vg6+eCMhPHSuaEvo54YYMgOJ
	 OwMDKNeyY7eNg==
Date: Tue, 8 Aug 2023 12:09:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Will Deacon <will@kernel.org>, Hugh Dickins <hughd@google.com>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Yang Shi <shy828301@gmail.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Peter Xu <peterx@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Yu Zhao <yuzhao@google.com>, Alistair Popple <apopple@nvidia.com>,
	Ralph Campbell <rcampbell@nvidia.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Steven Price <steven.price@arm.com>, SeongJae Park <sj@kernel.org>,
	Huang Ying <ying.huang@intel.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Zack Rusin <zackr@vmware.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Miaohe Lin <linmiaohe@huawei.com>, Minchan Kim <minchan@kernel.org>,
	Christoph Hellwig <hch@infradead.org>, Song Liu <song@kernel.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 12/32] mm/vmalloc: vmalloc_to_page() use
 pte_offset_kernel()
Message-ID: <59946f0b-2a31-4bb2-a5a5-a051f3978c26@sirena.org.uk>
References: <42279f1f-7b82-40dc-8546-86171018729c@sirena.org.uk>
 <901ae88d-ad0c-4e9d-b199-f1566cc62a00@lucifer.local>
 <c2358f37-ebaa-44d1-b443-ff91bdedc00b@sirena.org.uk>
 <977ddee4-35f0-fcd1-2fd-1c3057e7ea2a@google.com>
 <fbb2b76c-bc5c-4d75-b8cd-37479de688d4@sirena.org.uk>
 <b479b946-f052-eb75-295d-6fa7c2d8ce8e@google.com>
 <591b5253-47f0-440c-84b6-7786ff59667d@sirena.org.uk>
 <20230720103227.GB11034@willie-the-truck>
 <df264993-107c-44a1-a8ff-245bce044206@sirena.org.uk>
 <88bb7f30-cbfe-feb4-1101-b7c98843652d@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eZf2JqvLz6LnNLGw"
Content-Disposition: inline
In-Reply-To: <88bb7f30-cbfe-feb4-1101-b7c98843652d@leemhuis.info>
X-Cookie: You need not be present to win.


--eZf2JqvLz6LnNLGw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 08, 2023 at 07:52:43AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:

> Hi Mark, just wondering did anything come out of this and is this still
> happening? I'm just wondering, as I still have this on my list of
> tracked regressions.

It's fixed.

--eZf2JqvLz6LnNLGw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTSIoUACgkQJNaLcl1U
h9BB9gf8D/0tBbXWlvputjizTyP1NhPhcuKIekWzHEv5JO2TVYu3O1C0SiegHl+5
L5yPFNALZklT8IjxaY309Fs2oSMY9sETOZGYuMUvPW3Imn2q82NQf/UIxEy6SRAI
W1dmnrXqgMqeJ+njvCeFHoIrTW2B3LvXMaGet06Ju2LPQDnHCRYr9TEAIUYtsvau
a09b83gbjcqwxfwoIGpw8K9/kAVPCBNNKg/6GTpxpqSR2Q9UBM4Y/JYsMnc7l/i0
zBDLETGSBpc5WIgUdJ2nfEacA86G8RTDML9FJlqk5vgrgggb1OFnlsmV48ylrLI3
BgXHZ5r1q+F935f9OM+x8BvoeESSyg==
=ff0m
-----END PGP SIGNATURE-----

--eZf2JqvLz6LnNLGw--
