Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93146AA5
	for <regressions@lists.linux.dev>; Thu,  7 Sep 2023 14:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=x59D2IKM2ENcunfMUi31gF7EGAqekeDkgrde65GH5Z4=; b=iaQw9YmCsXUi/lHY8+djPyx76U
	Z0erIVTGHSUeUkSH7loEZJHr6Uqyf3aNHHFmiPpJHk9WEj80MfKX6BkmDnJwWXtGxnlXvI4i6uqTD
	L6R+y9RRrGMOmC0zm7LXAmoexFqTEYUDIEjjoGAJOLKylyZ/9uX2OvSlNaCJuhKnFDihKzFWYiQXB
	7iRg3A3xTtnqZNHjzTnM6hWwxxyjrzTLT3WHCWaxxZuEf6fDfaYMXeoHEhGJvnokgJrmicL70bPrq
	4j+p3G3ISaf7pd3nx1x1IMyIiStCvkKePEtYiIgOAbeDDtTssxnsVHdSn0QW0jKA4OrbQhw0b/FZq
	huzaAurQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qeFna-00BOXj-MV; Thu, 07 Sep 2023 14:15:58 +0000
Date: Thu, 7 Sep 2023 15:15:58 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Zorro Lang <zlang@kernel.org>,
	linux-ext4@vger.kernel.org, fstests@vger.kernel.org,
	regressions@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>
Subject: Re: [fstests generic/388, 455, 475, 482 ...] Ext4 journal recovery
 test fails
Message-ID: <ZPnbHhUDkmUQ5906@casper.infradead.org>
References: <ZPlH7rGfslnFmgYn@casper.infradead.org>
 <87r0na2jit.fsf@doe.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0na2jit.fsf@doe.com>

On Thu, Sep 07, 2023 at 07:05:38PM +0530, Ritesh Harjani wrote:
> Thanks Matthew for proposing the final changes using folio.
> (there were just some minor change required for fs/reiserfs/ for unused variables)
> Pasting the final patch below (you as the author with my Signed-off-by &
> Tested-by), which I have tested it on my system with "ext4/1k -g auto"

I'd rather split that patch up a bit -- I don't think the reiserfs
part fixes any actual problem.  I've pushed out
https://git.infradead.org/users/willy/pagecache.git/shortlog/refs/heads/bh-fixes

or git clone git://git.infradead.org/users/willy/pagecache.git

I credited you as the author on the second two since I just tidied up
your proposed fixes.

I've also checked ocfs2 as the other user of JBD2 and I don't see any
problems there.
