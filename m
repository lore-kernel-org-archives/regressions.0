Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811FB7BB15
	for <regressions@lists.linux.dev>; Fri, 31 May 2024 06:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717135714; cv=none; b=rbpscpQaHuq/mUc9Romo6V94ysCqgJ/FDFcU+d83dV8t5ICRKQ0nhF8RbvnXJK1DZtW01apAnFMe42Le2xZDERnJpb0huUH0H4BvLE5u9AHsFHT3gbysbmTt4ZKfLdtA/9t10WlshtZqIQShqSkqKpguaTEtdxqqHRFS/DDdwTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717135714; c=relaxed/simple;
	bh=9Lq7tTCG32vvV5D4xtot6/ifQLTN+b3T5AJN9EhOLao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oET9iPB3KNMVTwvKIc/nzdwVEUumbyPxoOFZXWLAozADyDJ1BPyZdJH4INmV41o1/zEMw6J6nhQlzrNNug6axqurHLYrm7AClG30uRYSOVdt/TY7R+wO3bTrROJX0Oo1bZCsEKnW1MSn/DHJqzRGmH6890TAOqFq5RGio2MTxAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id CE58A68BEB; Fri, 31 May 2024 08:08:27 +0200 (CEST)
Date: Fri, 31 May 2024 08:08:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	John Garry <john.g.garry@oracle.com>, Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, linux-block@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
	benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org,
	Guenter Roeck <linux@roeck-us.net>, Christoph Hellwig <hch@lst.de>,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH 04/23] scsi: initialize scsi midlayer limits before
 allocating the queue
Message-ID: <20240531060827.GA17723@lst.de>
References: <20240520151536.GA32532@lst.de> <fc6a2243-6982-45e9-a640-9d98c29a8f53@leemhuis.info> <8734pz4gdh.fsf@mail.lhotse> <87wmnb2x2y.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmnb2x2y.fsf@mail.lhotse>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, May 31, 2024 at 12:28:21AM +1000, Michael Ellerman wrote:
> No that's wrong. The actual hardware page size is 4K, but
> CONFIG_PAGE_SIZE and PAGE_SHIFT etc. is 64K.
> 
> So at least for this user the driver used to work with 64K pages, and
> now doesn't.

Which suggested that the communicated max_hw_sectors is wrong, and
previously we were saved by the block layer increasing it to
PAGE_SIZE after a warning.  Should we just increment it to 64k?

