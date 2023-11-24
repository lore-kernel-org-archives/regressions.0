Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977142D781
	for <regressions@lists.linux.dev>; Fri, 24 Nov 2023 15:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YRXAk877"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Q78WGe4buDmFTY2CNafH/GdHZsiQ6etEmfh4tkpfnOU=; b=YRXAk877eHcw4jEKun+aoPzTE9
	CYfF/sgXjTuK19iWbf8NmsYKTNmGxDQ+fmIfQhvErcUre8w0XhdASts6xux6L7d5Fx5ump381csYl
	QgWniTOVATOJ6P4u2tPOX9zm+0wx1AccWYL5p8kHFlL2ZzOZl8NPaqhOWBOoSI1zwDPoPwR971/Jm
	UEdsW0CZ+iQj+jCPP2Tz0eWhcCg3NESrtD//5s7brjqXRZy+ra4D8vEUYr+wv3HaEt5NuL9XvQXtW
	mPE5Fw0pPoL46h0I98kVI9Gbob1m7tXrlS0oMCGztNVYuAq1ELNYnJgwT7YI11SLSTUSM8C093xcU
	5rExqhRA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r6XlU-008ggk-2W; Fri, 24 Nov 2023 15:06:44 +0000
Date: Fri, 24 Nov 2023 15:06:44 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Chun Ng <chunn@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Ankita Garg <ankitag@nvidia.com>
Subject: Re: [REGRESSION]: mmap performance regression starting with k-6.1
Message-ID: <ZWC8BOtPW2bWBFqh@casper.infradead.org>
References: <PH7PR12MB7937B0DF19E7E8539703D0E3D6BAA@PH7PR12MB7937.namprd12.prod.outlook.com>
 <ZV7eHE2Fxb75oRpG@archie.me>
 <ZV9x6qZ5z8YTvTC4@casper.infradead.org>
 <ZV_rJtxdn1dU9ip0@archie.me>
 <ZV/2nPBs5r1nIaW4@casper.infradead.org>
 <2023112402-posing-dress-4bf2@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023112402-posing-dress-4bf2@gregkh>

On Fri, Nov 24, 2023 at 11:52:06AM +0000, Greg KH wrote:
> On Fri, Nov 24, 2023 at 01:04:28AM +0000, Matthew Wilcox wrote:
> > On Fri, Nov 24, 2023 at 07:15:34AM +0700, Bagas Sanjaya wrote:
> > > On Thu, Nov 23, 2023 at 03:38:18PM +0000, Matthew Wilcox wrote:
> > > > On Thu, Nov 23, 2023 at 12:07:40PM +0700, Bagas Sanjaya wrote:
> > > > > Anyway, I'm adding this regression to regzbot:
> > > > > 
> > > > > #regzbot ^introduced: v6.0..v6.1
> > > > 
> > > > this is not a regression.  close it, you idiot.
> > > > 
> > > > 
> > > 
> > > why?
> > > 
> > > Confused...
> > 
> > yes.  you're perpetually confused.  stop trying to help, you only make
> > things worse.  learn about the things you work on, or give up.
> 
> Um, is this really called for?  Bagas is trying to help track
> regressions, and if something isn't a regression like you say here, a
> simple "This is not a regression, it's already resolved in newer
> kernels" is fine.

Bagas has a long history of inappropriately attempting to "help" and due
to a lack of understanding wasting peoples time.  He's not too dissimilar
to the various wrongbots we've had over the years, including Richard B
Johnson, Markus Elfring, etc.  I've tried to help guide him towards being
a more productive contributor, but'have failed.  Mostly I ignore him now,
but when he's instructing a bot to harass me, that crosses a line.
