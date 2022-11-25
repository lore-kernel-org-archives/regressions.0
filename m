Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E857E
	for <regressions@lists.linux.dev>; Fri, 25 Nov 2022 04:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dhcCjaJ57IsbkqSUTzblE3Oegbl0RdETkw+TxczXs2o=; b=DCfYm8tP3312DF88DmAxxJkMHK
	OPNDqWf+GWrd7eM6AiDwT5jVSQrgxVs//5FMqENYi8QqpoRy34Qjtu0Cea4NMTohQNykElKKlk667
	LbodGSP0owEIB7D5tBEHZoFwoiFlHGCFxBGzuJ+WYwNJjNEvWaVoPwZWmAyq+qI/iG/UU7zxlfN0u
	sq44/Ivv8twQDYsYak2ylZ9+Wx1zVZvNOfvY20hnCa0+KPjoMicOfJzyxDDbTHx9CC/BGxvlVIxIr
	clV7jsaxmrD1QtfIUIjJq1WNKmjg4u0lXVJRBbZZRe9Hu483FzPqBWAR4vAF+do05PW/qR0bFNQU0
	ChfJ7fAA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1oyQ1h-006aTm-1R;
	Fri, 25 Nov 2022 04:09:21 +0000
Date: Fri, 25 Nov 2022 04:09:21 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>,
	"Christian Brauner (Microsoft)" <brauner@kernel.org>,
	Pierre Labastie <pierre.labastie@neuf.fr>,
	linux-unionfs@vger.kernel.org
Subject: Re: [regression, bisected] Bug 216738 - Adding O_APPEND to O_RDWR
 with fcntl(fd, F_SETFL) does not work on overlayfs
Message-ID: <Y4A/8VsEidcUchG2@ZenIV>
References: <2505800d-8625-dab0-576a-3a0221954ba3@leemhuis.info>
 <Y3+jz5CVA9S+h2+b@ZenIV>
 <CAJfpeguqCrEbvv4d4jdOnczQ9VOf4u9sSghvnDOWvUb84fv6OQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJfpeguqCrEbvv4d4jdOnczQ9VOf4u9sSghvnDOWvUb84fv6OQ@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Nov 24, 2022 at 09:33:54PM +0100, Miklos Szeredi wrote:
> > I could pick it in vfs.git #fixes, or Miklos could put it through his tree.
> > Miklos, which way would you prefer that to go?
> 
> I'll pick this into #overlayfs-next, as a PR for this cycle is needed anyway.

OK...  FWIW, I wonder if exposing setfl() would and using it instead of
open-coding would be a good idea - these two are very close to each other...
