Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B932935F11
	for <regressions@lists.linux.dev>; Thu, 23 Nov 2023 15:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="L/HubkwK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=s7ekhSuoXxWlw3uFMenhrsDmT0xI7DRa/z1sU8Z+EW4=; b=L/HubkwKeFULvuKpdH+LQqMTRj
	e8DkQyvYc9norxdz5rus6WwdDaASMKeKSWAi7uP6vG3pbZr32kgA5AoZVQdeA2Jti4KHWSVd2LTYa
	+IBv2B9FqQ1xgGlwzRFOoa4Vqy5OG7uOkzuhqnOkuAMEUjJ1tQ6Dp4jqtQz6XyQ0fOv9k9xNXQJyG
	GJtD1L3S37xtaAagdZIDmO7t+ah4bg7tVgTFUmxbAiWnRnVp58bE4fkvKVTUD5CR/TL4nouVog+R9
	PNK5JT9pic/gBOT/LNYY2DdQpD2Gn+q9cDWOEad1/zTsSqBDPOsA1NLNnWkfHdU9XG4K6AtebfDbm
	2zJgIgxA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r6BmU-007ftN-2B; Thu, 23 Nov 2023 15:38:18 +0000
Date: Thu, 23 Nov 2023 15:38:18 +0000
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
Message-ID: <ZV9x6qZ5z8YTvTC4@casper.infradead.org>
References: <PH7PR12MB7937B0DF19E7E8539703D0E3D6BAA@PH7PR12MB7937.namprd12.prod.outlook.com>
 <ZV7eHE2Fxb75oRpG@archie.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZV7eHE2Fxb75oRpG@archie.me>

On Thu, Nov 23, 2023 at 12:07:40PM +0700, Bagas Sanjaya wrote:
> Anyway, I'm adding this regression to regzbot:
> 
> #regzbot ^introduced: v6.0..v6.1

this is not a regression.  close it, you idiot.


