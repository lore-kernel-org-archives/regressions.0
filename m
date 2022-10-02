Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5C57B;
	Sun,  2 Oct 2022 15:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=am+vNSJ2PQMpgTtAH0qkPgdA0rAeUEQ2NirI6QhZp3I=; b=UOeLJlBGUZZk6DumbG1kAy3s8J
	XFJFvJ2EtN2eA0UMeylZfIR554hEz1C8gnDMla0yg0rXnk5dneuYeMUM6aDlRwMkyrkFyHBuw+ip+
	qzyPFZAMSD5Id3H505pqIVkUOompFoQd7KZxniprtQPEUdpiLyJWgh4fZF3gzTGDJu5DfVVQMPDNh
	DodzY7gSZfGcw7kclSrzJZmDDhVI0/lG4/a58wi8l2SXx0RQ8qQgNzvx3W/QRgC1w6WgmxPo0n3jK
	sQhb3dNL2LJ+EmbemZbLxmmC7sKfVL7HR8chyY6dhEbY5Y7wXggecEev/1qXzgDjNJ+LWw7Q0X76S
	h3pZQVfQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1of1K6-0060tO-1s;
	Sun, 02 Oct 2022 15:56:10 +0000
Date: Sun, 2 Oct 2022 16:56:10 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Thorsten Leemhuis <linux@leemhuis.info>,
	Greg KH <gregkh@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	ksummit@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <Yzm0mia7ndwFGk2c@ZenIV>
References: <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com>
 <YzgY9X/DM9t/ZuJe@kroah.com>
 <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
 <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
 <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu>
 <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu>
 <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sun, Oct 02, 2022 at 12:49:04PM +0000, Artem S. Tashkinov wrote:

> > Secondly, not everyone is happy with getting an e-mail message sent to
                                                                   ^^^^^^^
> > a mailing list that has a lot of bugzilla metadata associated with it,
    ^^^^^^^^^^^^^^
> > and depending on how they respond, the response might not make it back
> > to bugzilla.
> 
> I've mentioned it a dozen times already - you're unhappy with emails
> from bugzilla? Go there and unsubscribe. It takes a minute and we're
                 ^^^^^^^^^^^^^^^^^^^^^^^^
> talking as if it's the actual issue we are dealing with. It's not.
> Bugzilla maintenance and its up-to-date status are the issues.

OK, then - please tell me how to prevent e.g. linux-fsdevel@vger.kernel.org
getting spammed by that thing.  Where should I go and how do I unsubscribe
it?

The answer along the lines of "unsubscribe yourself from the maillists"
is a non-starter, obviously.
