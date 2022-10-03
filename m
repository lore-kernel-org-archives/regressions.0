Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77BE8F53;
	Mon,  3 Oct 2022 06:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zyB1B35xZgtQIx8vMJGKAY+ZN6kqhFqdH8GFiF/HPg8=; b=u5XrZEUPUQtuEJlDxqf/VHiaPx
	1IjViOeH56mx2j3w4QDqPAFt2yxKJuIIhyALch5vsOqgTxEiSOigwUrzO7VCBa4jbcSVFwYNjqDoT
	kjvwAdweXbSQuw5LKulwpMsJvugw4kjgLfUrgGpi1+SAzqdsMVcDRLZbYKVtiHgTvlioBsDIxnNMY
	v/pLBOXkIs5J459poLzAyXit9GMxNNuFgGmm1ZI8nL1R0H2uRBMIoXmuxK/EnQdPzwms7mpBXjLAd
	ILxy5PvteRMBKnNZv1qUPfJ14S1kpVacZEoyqmFB1fM/SnjOzWFQAuJdqpaBZ5sBELWDvOf9BX8X3
	lGP+oBVA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofFMI-004GVH-MA; Mon, 03 Oct 2022 06:55:22 +0000
Date: Sun, 2 Oct 2022 23:55:22 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Artem S. Tashkinov" <aros@gmx.com>,
	"Bird, Tim" <Tim.Bird@sony.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Slade Watkins <srw@sladewatkins.net>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	"workflows@vger.kernel.org" <workflows@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <YzqHWtbmaYkkzIzw@infradead.org>
References: <20220929135325.4riz4ijva2vc7q5p@meerkat.local>
 <95c3384b-53d0-fd6c-6ec5-a7e03fdeddfc@gmx.com>
 <F300ED64-5E8E-4060-89DC-C98BC5FF08E6@sladewatkins.net>
 <YzXK6Px+BrNuuMZH@pendragon.ideasonboard.com>
 <a86adc6d-05db-ec2e-c5de-d280aad9fb8a@leemhuis.info>
 <Yzbtuz6L1jlDCf9/@pendragon.ideasonboard.com>
 <BYAPR13MB250377AAFCC43AC34E244795FD569@BYAPR13MB2503.namprd13.prod.outlook.com>
 <3cfaef48-744f-000f-1be5-6f96d64dea24@gmx.com>
 <YzcdnnjJA4M09dNH@pendragon.ideasonboard.com>
 <YzeVVV+nPaxsqS0V@mit.edu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzeVVV+nPaxsqS0V@mit.edu>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Sep 30, 2022 at 09:18:13PM -0400, Theodore Ts'o wrote:
> Funny thing.  I've largely given up on getting any kind of useful bug
> report from Launchpad, so I've largely ignored it.  In contast, the
> bug reports I get for e2fsprogs from Debian are generally far more
> actionable, with bug reports that have all of the data so I can
> actually root cause the problem, and help the user.

As someone who uses the Debian BTS as a bug reported only these days,
and a as maintainer (but not DD) in the past I love it.  For the
developer the email interface is perfect for quick actions, while
the website allows for a good overview.  And as a user the reportbug
tools works really nicely and tends to collect the important information
automatically.  Most importantly it does not require creating a user
account with some random entity.
