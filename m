Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F853C07
	for <regressions@lists.linux.dev>; Tue,  4 Apr 2023 16:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AIQoaJjLGvMKIM9H6StwFqIBqyuniKMBTqapbhz/gN0=; b=C5QndD65ObgzxSp4zngLt0Le02
	M4pcmQkV5RoeW4zf15Tylbc52Bh+F8gRtqAJR4Axx0t3lgLGtZZ0i54vpqscF159sl/cPov8C8vRw
	OKj2ct8Gm5NdQJp3IOM0B4kkk5Y+fg3KoNaEQfx8evn2UkLsvhjqxCbhQgIWzP21C6hccqdgl5tny
	lJRxoHMNe1TB959xCi0rmepfXNSxWlox4PDeE1jfbQrfU3vacFQrBnZuCXLzuL41EeLdju8DJMawx
	y+0mR4XIQ5lemf90bWDc1Zv5KHArFeO0fGYuLxz9plkzegl4F8oy+dgIOowloK1UeNn811y0bXZ18
	lTumzf6g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pjj8e-0028oS-02;
	Tue, 04 Apr 2023 16:04:04 +0000
Date: Tue, 4 Apr 2023 09:04:03 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Sergei Trofimovich <slyich@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Christopher Price <pricechrispy@gmail.com>, anand.jain@oracle.com,
	boris@bur.io, clm@fb.com, dsterba@suse.com,
	linux-btrfs@vger.kernel.org
Subject: Re: [6.2 regression][bisected]discard storm on idle since
 v6.1-rc8-59-g63a7cb130718 discard=async
Message-ID: <ZCxKc5ZzP3Np71IC@infradead.org>
References: <CAHmG9huwQcQXvy3HS0OP9bKFxwUa3aQj9MXZCr74emn0U+efqQ@mail.gmail.com>
 <CAEzrpqeOAiYCeHCuU2O8Hg5=xMwW_Suw1sXZtQ=f0f0WWHe9aw@mail.gmail.com>
 <ZBq+ktWm2gZR/sgq@infradead.org>
 <20230323222606.20d10de2@nz>
 <20d85dc4-b6c2-dac1-fdc6-94e44b43692a@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20d85dc4-b6c2-dac1-fdc6-94e44b43692a@leemhuis.info>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Apr 04, 2023 at 12:49:40PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> >> And that jut NVMe, the still shipping SATA SSDs are another different
> >> story.  Not helped by the fact that we don't even support ranged
> >> discards for them in Linux.
> 
> Thx for your comments Christoph. Quick question, just to be sure I
> understand things properly:
> 
> I assume on some of those problematic devices these discard storms will
> lead to a performance regression?

Probably.

> I also heard people saying these discard storms might reduce the life
> time of some devices - is that true?

Also very much possible.  There are various SSDs that treat a discard
as a write zeroes and always return zeroes from all discarded blocks.
If the discards are smaller than or not aligned to the internal erase
(super)blocks, this will actually cause additional writes.

> If the answer to at least one of these is "yes" I'd say we it might be
> best to revert 63a7cb130718 for now.

I don't think enabling it is a very a smart idea for most consumer
devices.
