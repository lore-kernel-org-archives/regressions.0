Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA57136F
	for <regressions@lists.linux.dev>; Sun, 17 Sep 2023 06:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3396FC433C7;
	Sun, 17 Sep 2023 06:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694931054;
	bh=JyvYGLdb8BIcaE9svmQ+0s9rrC3nDZAE3iwY4+nnvU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozJuRew/hURbGLEz/9HsHn/MrUr7gGBlsirFxecZQUU07YvGd+Gco8FPD/ywCbjUa
	 NxGls4aIN57FIkGyA1TulgZMqk3fA0uRePo/bSDTzPXqrBQs2iJ+FiAvf04/H+6Qmn
	 c+sscAv5aRP2paUGhBVZxQ0u5DTZNRsXNUkIuEgk=
Date: Sun, 17 Sep 2023 08:10:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Helge Deller <deller@gmx.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	stable <stable@vger.kernel.org>, Sasha Levin <sashal@kernel.org>,
	Linux PARISC <linux-parisc@vger.kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Michael Labiuk <michael.labiuk@virtuozzo.com>,
	Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Subject: Re: Possible 6.5 regression: Huge values for "commited memory"
Message-ID: <2023091742-static-unedited-b414@gregkh>
References: <1694366957@msgid.manchmal.in-ulm.de>
 <ZQWUzwiKWLk79qbp@debian.me>
 <CAHk-=wh29JJSVGyJM7ubxOs51-Nxp6YnmU9Bw1gdOk3rrQ_0mg@mail.gmail.com>
 <CAHk-=wjrEjaUw3oFVEYpF=AWAwrSM3sQTQHuPfFjFdQsvQxHeg@mail.gmail.com>
 <3ee4b922-7686-ec20-f280-48c06bff09cf@gmx.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ee4b922-7686-ec20-f280-48c06bff09cf@gmx.de>

On Sun, Sep 17, 2023 at 07:02:50AM +0200, Helge Deller wrote:
> Greg & Sasha,
> 
> can you please queue-up this upstream patch for kernel v6.5-stable ?
> 
> commit 3cec50490969afd4a76ccee441f747d869ccff77
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sat Sep 16 12:31:42 2023 -0700
> 
>     vm: fix move_vma() memory accounting being off

Now queued up, thanks.

greg k-h
