Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D080F6FD0
	for <regressions@lists.linux.dev>; Thu, 16 Mar 2023 18:27:57 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D14FA823;
	Thu, 16 Mar 2023 18:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D14FA823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1678991277; bh=OwZBhz9VMbfwLaD6vDW+gcJbWhV8x+C3/Q50X51+JhM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QFstPU4oaTDsTc2nbT7WD/XIDOTQ92knb79vNLSDyNlTuLSVTuHbnrG33v4DZG6/z
	 ScKv9Fw6tZhUWrmKPBuKeNC4Wpwpk0A5ELxE8awvHZjIzaiKu424sgXKxjQxVAv8HA
	 wuazJA60F7mewuumNZaL1xo0aBfcRbqanhnSCYU95qNms0+0XCx5BFul00AazkRzSy
	 LfTfAzHdZ3p3BFXcWxBJhKtd37+ajbeRa3UzS+OZ2lTaMWc4FG60rYHnTgdQc+xGr6
	 An7PAhN7AOZ0di42WKOrdrk20ZDtt9KB3z5jNPPKOmKpbKDg50D6KwDbs1bh63do1Q
	 G0lZ0aIk1TO+w==
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Randy Dunlap <rdunlap@infradead.org>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v3] docs: describe how to quickly build a trimmed kernel
In-Reply-To: <d233a796-1cb8-a9b3-5a50-043dd2f98b3e@leemhuis.info>
References: <1a788a8e7ba8a2063df08668f565efa832016032.1678021408.git.linux@leemhuis.info>
 <87a60frxk0.fsf@meer.lwn.net>
 <d233a796-1cb8-a9b3-5a50-043dd2f98b3e@leemhuis.info>
Date: Thu, 16 Mar 2023 12:27:56 -0600
Message-ID: <87edpomtzn.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> Documentation/doc-guide/contributing.rst says that "books" are meant to
> "group documentation for specific readers"; creating a new book for
> tutorials would work against that, as readers (users and administrators
> in this case) then would have to consult two books.

The idea behind that guideline is that readers should be able to know
where to look and to not have to dig through a lot of material that was
not intended for them.  Not that, for any given reader, there should be
exactly one book that has everything they might want.

One could also argue, of course, that readers seeking tutorials are a
different group than those seeking reference material.

> And isn't for example Documentation/process/submitting-patches.rst also
> more of a tutorial than reference material (which we also have in the
> form of Documentation/process/development-process.rst)?

It's a pretty clear example of what happens when you try to combine both
types of documentation - you get something that isn't ideal for either
type of reader.  It tries to take people through the process, but it is
also the only reference document we have on how patches should be
submitted. 

> Does that mean
> it should be moved? Into the same book or a separate book, as it has a
> different target audience? I fear that might quickly get confusing for
> readers without any real benefits

No, I wouldn't move it.  We could, someday, consider splitting it into
two more focused documents, one of which could (say) go under tutorials/.

> Or did I understand the idea of a new book wrong and you meant something
> else? Like creating Documentation/admin-guide/tutorials/ and putting the
> text there? That might work and would help future authors to get the
> right mental model when writing new texts. But I'm not sure that's worth it.

I wasn't thinking of doing it that way, but we could certainly consider
it.  It doesn't seem like we would have vast numbers of these, though,
and they would mostly cover relatively elementary topics, so a single,
top-level directory might be better if we decide to take this path.

Thanks,

jon
