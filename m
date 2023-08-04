Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D29125C6
	for <regressions@lists.linux.dev>; Fri,  4 Aug 2023 10:31:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0DFDF68AA6; Fri,  4 Aug 2023 12:31:02 +0200 (CEST)
Date: Fri, 4 Aug 2023 12:31:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>,
	Loic Poulain <loic.poulain@linaro.org>, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH 04/24] PM: hibernate: move finding the resume device
 out of software_resume
Message-ID: <20230804103101.GA23613@lst.de>
References: <20230531125535.676098-1-hch@lst.de> <20230531125535.676098-5-hch@lst.de> <2cfa5f55-1d68-8a4f-d049-13f42e0d1484@suse.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cfa5f55-1d68-8a4f-d049-13f42e0d1484@suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good, thanks!

Reviewed-by: Christoph Hellwig <hch@lst.de>

