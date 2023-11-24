Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE80621
	for <regressions@lists.linux.dev>; Fri, 24 Nov 2023 01:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Y/x8ZV+B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=McEkrzvQsANR3dYBGG5TkcCVdpI5YO1hkWmFCI4Iqi4=; b=Y/x8ZV+B5upfkW4D5wDII1uNdq
	JCnsvRikF+RjrCc5e6ocn9/lzN6IqfKw6yEIMgwn7KxoWG13qwrAU6ZAj5ejK1uhOOKiFW9A9I/qq
	EYLtirfPw9aRQNcQkrQRaT2Dq7f3i543CJVKooUXzYEPMDVAblLxSZ8Bo82pGhEOzgir2GRVb9oDK
	zA7gnSppFmB2Vls3V6+9kiVLFjGaqvQ7d5m52ZNrY+QihN/yCmIjIs0Fbwm0zk6oDh6Tdqwzxum9q
	ot49HUYL44skF3MAOfAl5b5dKpzxdLpiKDBx3QJEl1+GG3dxgXshmM5CACOF/SQBogrBsocQu1UXz
	bvCxHSXA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r6KcO-0083NW-9a; Fri, 24 Nov 2023 01:04:28 +0000
Date: Fri, 24 Nov 2023 01:04:28 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Chun Ng <chunn@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Ankita Garg <ankitag@nvidia.com>
Subject: Re: [REGRESSION]: mmap performance regression starting with k-6.1
Message-ID: <ZV/2nPBs5r1nIaW4@casper.infradead.org>
References: <PH7PR12MB7937B0DF19E7E8539703D0E3D6BAA@PH7PR12MB7937.namprd12.prod.outlook.com>
 <ZV7eHE2Fxb75oRpG@archie.me>
 <ZV9x6qZ5z8YTvTC4@casper.infradead.org>
 <ZV_rJtxdn1dU9ip0@archie.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZV_rJtxdn1dU9ip0@archie.me>

On Fri, Nov 24, 2023 at 07:15:34AM +0700, Bagas Sanjaya wrote:
> On Thu, Nov 23, 2023 at 03:38:18PM +0000, Matthew Wilcox wrote:
> > On Thu, Nov 23, 2023 at 12:07:40PM +0700, Bagas Sanjaya wrote:
> > > Anyway, I'm adding this regression to regzbot:
> > > 
> > > #regzbot ^introduced: v6.0..v6.1
> > 
> > this is not a regression.  close it, you idiot.
> > 
> > 
> 
> why?
> 
> Confused...

yes.  you're perpetually confused.  stop trying to help, you only make
things worse.  learn about the things you work on, or give up.

