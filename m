Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A8020B09
	for <regressions@lists.linux.dev>; Fri, 24 Nov 2023 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rWPQ8txy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9D6C433C8;
	Fri, 24 Nov 2023 11:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700826727;
	bh=rR/aXgCzzONVA73X2vn2J/CDyBB+Mz7i6pIZNUaAT+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rWPQ8txyoumQtc1u0fxAQ4LtWePS7hOY/AE33Ev0biAdTlxwPASNmA8BaObcVTMIl
	 v07i+al7fzlLSsEAn4ExpDX95guynhjgiewUl6tlujxoB66VJjH2A+0BjyuDQcy1Hh
	 /RpQhOm9zIo0DI6oCokt3iJRJcX5Cik8vWBidxXA=
Date: Fri, 24 Nov 2023 11:52:06 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Chun Ng <chunn@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Ankita Garg <ankitag@nvidia.com>
Subject: Re: [REGRESSION]: mmap performance regression starting with k-6.1
Message-ID: <2023112402-posing-dress-4bf2@gregkh>
References: <PH7PR12MB7937B0DF19E7E8539703D0E3D6BAA@PH7PR12MB7937.namprd12.prod.outlook.com>
 <ZV7eHE2Fxb75oRpG@archie.me>
 <ZV9x6qZ5z8YTvTC4@casper.infradead.org>
 <ZV_rJtxdn1dU9ip0@archie.me>
 <ZV/2nPBs5r1nIaW4@casper.infradead.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZV/2nPBs5r1nIaW4@casper.infradead.org>

On Fri, Nov 24, 2023 at 01:04:28AM +0000, Matthew Wilcox wrote:
> On Fri, Nov 24, 2023 at 07:15:34AM +0700, Bagas Sanjaya wrote:
> > On Thu, Nov 23, 2023 at 03:38:18PM +0000, Matthew Wilcox wrote:
> > > On Thu, Nov 23, 2023 at 12:07:40PM +0700, Bagas Sanjaya wrote:
> > > > Anyway, I'm adding this regression to regzbot:
> > > > 
> > > > #regzbot ^introduced: v6.0..v6.1
> > > 
> > > this is not a regression.  close it, you idiot.
> > > 
> > > 
> > 
> > why?
> > 
> > Confused...
> 
> yes.  you're perpetually confused.  stop trying to help, you only make
> things worse.  learn about the things you work on, or give up.

Um, is this really called for?  Bagas is trying to help track
regressions, and if something isn't a regression like you say here, a
simple "This is not a regression, it's already resolved in newer
kernels" is fine.

Resorting to insults on the reporter is not ok.

greg k-h
