Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCF228EB;
	Sat,  1 Oct 2022 13:07:59 +0000 (UTC)
Received: from letrec.thunk.org ([50.224.35.3])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 291D7mfE023702
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 1 Oct 2022 09:07:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1664629670; bh=P//OoxldAkFk/Vwn6LleaNPxpx993z2UARUWlfwcR/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wtad/A92qbRt2lM7qmzOx9Rdoc+3ZM9ULvYkOtsv74oJMUwVS6bhFa7gjrfMnjJTo
	 kfMMCvqDJ2NY4SLgyqFFVyPRkp7mTV7e7pag3jFQE2rf7wFCG351kup9pGm8FvL0Mm
	 wpv+vqMm8XevT39t634KhrTk24sJszdKj73ng1HUcGzDknMhj88ZEaDzox5fYBt3DK
	 2+Na2UYYtyulTO21fZhx2kchB9MIj7BZ1fMiPSV5PnK6LxrExyKeiHj5lkYEFZalh5
	 jN5rzaMj9nuA452+XW53X6UssUa0lqoFTtMb+V7qe7D3Ey3wf/3thubo//hWtcvqj9
	 KHQbxvpjwMhsg==
Received: by letrec.thunk.org (Postfix, from userid 15806)
	id 2AD758C2AB4; Sat,  1 Oct 2022 09:07:48 -0400 (EDT)
Date: Sat, 1 Oct 2022 09:07:48 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: "Artem S. Tashkinov" <aros@gmx.com>, Greg KH <gregkh@linuxfoundation.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        ksummit@lists.linux.dev
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <Yzg7pHspc72I7TAb@mit.edu>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com>
 <YzgY9X/DM9t/ZuJe@kroah.com>
 <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
 <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
 <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>

On Sat, Oct 01, 2022 at 01:34:26PM +0200, Thorsten Leemhuis wrote:
> 
> Is that perfect and will in work in 100% of the cases? No, definitely
> not. Would it be good to have a a kind of first level support group that
> can help in this case? Sure. But we don't have one right now. I sooner
> or later hope to work towards forming such a group, but there are other
> things that are higher on my todo list for now.

I think the other thing which we really need to say is that if you
really want better support, there are plenty of places who will
happily accept your money and provide you that support.  

Artem, it seems to me that you are hoping that volunteers will provide
a commercial level of support --- and that's just never going to
happen.

The users vastly outnumber us developers by orders of magnitude, and
if someone needs a huge amount of hand-holding, maybe they should be
paying for a support contract with Red Hat, or Suse or Canonical, or
CIQ.

Can we do better?  Sure!  But I think we need to clearly set
expectations for what upstream developers will and will not provide
support for.  (Example: bug reports for LTS kernels are not
interesting to me, unless you can also reproduce them in the latest
upstream kernel --- and if you can't build your own kernel from
scratch --- boo, hoo, maybe you need to pay someone to help you out.)

I also think that we need to clearly express that any kind of support
is best efforts only, and if someone has anything business-, mission-,
or life-critical, they should darned well pay $$$ for a proper support
contract.

						- Ted

