Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E00F7EB
	for <regressions@lists.linux.dev>; Wed,  5 Apr 2023 06:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iy+DkM8QopnBWlLUvh2xM4PdmRnRYTADgbqyAMl3R8k=; b=E/6IctnuT7XUMqpi10BFNAo/MS
	HekDrJr5UY/8b9PRaAcb/MpJXMfxIizZlNqKYI0sBSF3+P58heZ2kNs8T/wmLU6tCiQQkWiUEfGIh
	Y4Gb+6Wu8Og1H5wFJYyvELvbNf9qh9VSa5gkVShoWr1YNdnBmjVL7HPvimGNSsS0tXD3PcrS42QX0
	Q8iUbtKwXhpnf5iYS/x8TWb28jBMiKHh7xzBVrpz6QBEbZWksIgXfHQmP9c9sKiq6/8BzodfocZfC
	Kg9M2Q9RzUJnvxTzYmJ5p9CL2KWfk1rUNNO/Gmh+jj13SWgCnhBbNkGxFqH6fG8+7GeuyBySz+GKU
	xhWVGwEA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pjwTo-003UdU-3B;
	Wed, 05 Apr 2023 06:18:48 +0000
Date: Tue, 4 Apr 2023 23:18:48 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Chris Mason <clm@meta.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Sergei Trofimovich <slyich@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Christopher Price <pricechrispy@gmail.com>, anand.jain@oracle.com,
	boris@bur.io, clm@fb.com, dsterba@suse.com,
	linux-btrfs@vger.kernel.org
Subject: Re: [6.2 regression][bisected]discard storm on idle since
 v6.1-rc8-59-g63a7cb130718 discard=async
Message-ID: <ZC0SyJbFJuS2ZEOY@infradead.org>
References: <CAHmG9huwQcQXvy3HS0OP9bKFxwUa3aQj9MXZCr74emn0U+efqQ@mail.gmail.com>
 <CAEzrpqeOAiYCeHCuU2O8Hg5=xMwW_Suw1sXZtQ=f0f0WWHe9aw@mail.gmail.com>
 <ZBq+ktWm2gZR/sgq@infradead.org>
 <20230323222606.20d10de2@nz>
 <20d85dc4-b6c2-dac1-fdc6-94e44b43692a@leemhuis.info>
 <ZCxKc5ZzP3Np71IC@infradead.org>
 <41141706-2685-1b32-8624-c895a3b219ea@meta.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41141706-2685-1b32-8624-c895a3b219ea@meta.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Apr 04, 2023 at 02:15:38PM -0400, Chris Mason wrote:
> It seems like a good time to talk through a variations of discard usage
> in fb data centers.  We run a pretty wide variety of hardware from
> consumer grade ssds to enterprise ssds, and we've run these on
> ext4/btrfs/xfs.

Remember what you guys call consumer grade is the top of the shelve
consumer grade SSDs, or in fact low-end enterprise ones that are based
on the latest and greatest top shelve SSDs with firmware specifically
tweaked for you.  That is a whole differnet level from random crappy
no-name SSD from 5 years ago.

