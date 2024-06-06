Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70928440C
	for <regressions@lists.linux.dev>; Thu,  6 Jun 2024 05:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717653253; cv=none; b=AvHGMzut7rwJFPHOC+vwypmE1OJQNW30Ki29EnKRu0mgi8iKIt1uxOl1Sx3tNWZzBrsQbviGb0LsCocPQ9lk+fxVLuLYqGzB/QttNj7X4zetJ5szWhsadYu6K6kbKTUbT4Bub8l2mCFu1iW0eIxcchFKWlQAnBjLKKTuqRKMAL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717653253; c=relaxed/simple;
	bh=QAgsoikseMC/U92jpGqQlmDkiPMIM9Digq+OV/CqAa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igvMyf4gGoplGBWCKilk2xAfxnFNub9oUrPE2koxrMxhO9NifEGHrAvFsAAysHu88BF09zHv8GRP8JMIB60ZJsfVFGRqY5nM2wJ0HF1LkiXlcsfZpv45gEsfKCc2B0Mdef2xQcaw8LYZl3y4d54TfFWrI22a+wNCwZN0M5NKfmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 513FC68CFE; Thu,  6 Jun 2024 07:54:08 +0200 (CEST)
Date: Thu, 6 Jun 2024 07:54:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christoph Hellwig <hch@lst.de>,
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	John Garry <john.g.garry@oracle.com>, Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, linux-block@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
	benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org,
	Guenter Roeck <linux@roeck-us.net>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	doru.iorgulescu1@gmail.com
Subject: Re: [PATCH 04/23] scsi: initialize scsi midlayer limits before
 allocating the queue
Message-ID: <20240606055408.GA9379@lst.de>
References: <20240520151536.GA32532@lst.de> <fc6a2243-6982-45e9-a640-9d98c29a8f53@leemhuis.info> <8734pz4gdh.fsf@mail.lhotse> <87wmnb2x2y.fsf@mail.lhotse> <20240531060827.GA17723@lst.de> <87sexy2yny.fsf@mail.lhotse> <87wmn3pntq.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmn3pntq.fsf@mail.lhotse>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jun 05, 2024 at 10:37:53PM +1000, Michael Ellerman wrote:
> On the other hand increasing max_segment_size to 64K while leaving MAX_DBDMA_SEG
> at 0xff00 seems to work fine. And that's effectively what's been happening on
> existing kernels until now.

Exactly.

> 
> The only question is whether that violates some assumption elsewhere in the
> SCSI layer?

It shouldn't.

> Anyway patch below that works for me on v6.10-rc2.

This looks good to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>

