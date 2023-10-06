Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4046E137B
	for <regressions@lists.linux.dev>; Fri,  6 Oct 2023 01:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BC0oYb8a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+AiG5RcuIRXjXQBaPipww/shhwqPCseS7Zrsx9WocQ0=; b=BC0oYb8aTYOJBZjE50dd8NPPc7
	/73Cl4ZQ6jjJ90vlAM/EoJxzOd5H/w65Jl40qapwuCR4+7/CbkOci6f1rVTuM95HLFwef0uky/c0+
	TqDERrDka6zstklGFvad7asco2exJ0GDEqADstiBXwuKDeYpkc3b7KBBMGwoZcr0Nryib+rDoYbOw
	5QNF2BuRFcLhOqrspD4pB3oeCChYLLOlZXtGanexFxob6KrLb5WOyZck3ba9KYyauokJmgjcw59qE
	3T0nQGcdq19KhbJd+n5sX6HQYaySrZVymsSwsHO/i1UsiwQn2laYEA51/0V7wGYqXV0xWYwyVINtg
	unnCg4lw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qoZUn-00CWqH-Bv; Fri, 06 Oct 2023 01:19:13 +0000
Date: Fri, 6 Oct 2023 02:19:13 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Erhard Furtner <erhard_f@mailbox.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Bisected] PowerMac G5 fails booting kernel 6.6-rc3 (BUG: Unable
 to handle kernel data access at 0xfeffbb62ffec65fe)
Message-ID: <ZR9gkZKafUSNOAEf@casper.infradead.org>
References: <20230929132750.3cd98452@yea>
 <ZR9esG8H17LY2KOX@debian.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZR9esG8H17LY2KOX@debian.me>

On Fri, Oct 06, 2023 at 08:11:12AM +0700, Bagas Sanjaya wrote:
> Matthew Wilcox, did you miss this regression report? You should look into it
> since it is (apparently) cause by a commit of yours.

No, I didn't miss it.  I'm simply choosing to work on other things.
All this regression tracking nonsense and being told to work on things
by people who've appointed themselves my manager has completely sapped
my motivation to work on bugs.  If you want me to work on things, *don't*
harass me.

