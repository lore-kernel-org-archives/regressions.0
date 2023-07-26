Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570AE1DA20
	for <regressions@lists.linux.dev>; Wed, 26 Jul 2023 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3k28+zvPVrQmllp4Y1yDLUbb9Odau4PMyGcZXH9Q2X0=; b=J1IA4J8sAda/QvW3cxq0oyestk
	jSlACYqE9Ya3NsypgUKmoh4kr5NL0B/RZt96Dc+0vx18U9paJ7brvNDvczndFWdf3CFkz9TbGu08P
	GiE37cN9ZjhvFhHOnIpcRlp0qUg6c3/M5b6WIITLuSh/6PwTEG+UJAUBpJPI3N2qlMlHmzPPZq2oS
	xRhlRGRBt7AAdmcdqmgpKI/yqegcLbJUX49daFtTje6IQZ6DGyqqcmzJX0OecJNu22ODemfuhw2Ga
	n7hjETchULoXb9gyAe5xAJQx2wygg6GqcAJFDrynw3Sn0xZLY6mFFfEnwXaDZLWTy3DQXil0Evt2T
	hxsrzRSQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qOfuc-006aFm-5k; Wed, 26 Jul 2023 14:54:50 +0000
Date: Wed, 26 Jul 2023 15:54:50 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux-MM <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: two reports about NULL pointer dereferences in mm subsystem
 since 5.18(?) with qbittorrent on XFS
Message-ID: <ZMEzuqTOdT1EDApa@casper.infradead.org>
References: <2e453cab-9049-98e5-1d96-2305fbb751ee@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e453cab-9049-98e5-1d96-2305fbb751ee@leemhuis.info>

On Wed, Jul 26, 2023 at 02:43:24PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi everyone! There are two regression reports with somewhat similar
> symptoms in bugzilla.kernel.org that seem to not get the attention they
> IMHO deserve.

I'm sorry you think this regression hasn't received the attention that
it deserves.  I've spent weeks thinking about this problem and trying to
track it down, with no success so far.

I'm not used to being matrix managed.  Perhaps you can schedule a 1:1
with my actual boss who pays me money.
