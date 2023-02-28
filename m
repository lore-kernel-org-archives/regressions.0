Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE282636
	for <regressions@lists.linux.dev>; Tue, 28 Feb 2023 02:18:20 +0000 (UTC)
Date: Tue, 28 Feb 2023 02:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1677550698;
	bh=M6DbHO+PeywxABD2rLvdeB8pVgOEidTHxi8y5J0nZ7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r9pbiEkv4aT4jJ3hyrNCr5GPqcRL8nDqobRz4+3qRr/5auhAaTgB5RYprY3BzJWG6
	 LytGoIeP3k9XiCjQRc/VoY+dzH4Q1Y3IA0iX2buKDpS4Epd1PJunUR7PGeDAaPKyYH
	 XdXecx0lioG8Wb/0uiDAhgo66/duT3MCDp/faKs4=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: George Kennedy <george.kennedy@oracle.com>, jirislaby@kernel.org,
	gregkh@linuxfoundation.org, sfr@canb.auug.org.au,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v2] vc_screen: modify vcs_size() handling in vcs_read()
Message-ID: <64981d94-d00c-4b31-9063-43ad0a384bde@t-8ch.de>
References: <1677529301-19530-1-git-send-email-george.kennedy@oracle.com>
 <face2b1b-0f2e-4a79-a71b-79681fc56273@t-8ch.de>
 <CAHk-=whxC0ob3f--B-igBp34ujA5PZQMcTnDQ8Zh8HA7+ZbeWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=whxC0ob3f--B-igBp34ujA5PZQMcTnDQ8Zh8HA7+ZbeWg@mail.gmail.com>

On Mon, Feb 27, 2023 at 05:58:12PM -0800, Linus Torvalds wrote:
> On Mon, Feb 27, 2023 at 5:46 PM <linux@weissschuh.net> wrote:
> >
> > This still seems to be broken for me.
> 
> Looks that way.
> 
> > I still need the patch from
> >
> > https://lore.kernel.org/lkml/20230220064612.1783-1-linux@weissschuh.net/
> 
> .. and that has the same problem with "what if the error happens
> during an iteration that wasn't the first, and we already succeeded
> partially".

Indeed.

> The "goto unlock_out" is bogus, since it jumps over all the "update
> pos and check if we read something".
> 
> It was the correct thing to do *above* the loop, but not inside the loop.
> 
> IOW, I think the proper patch is to also turn the "goto unlock_out"
> into a "break". Mind testing something like this (whitespace-damaged,
> but you get the idea):

Makes sense and seems to work correctly.

Tested-By: Thomas Weißschuh <linux@weissschuh.net>

(Or feel free to use my patch from above and fixup the goto/break line)

> 
>     --- a/drivers/tty/vt/vc_screen.c
>     +++ b/drivers/tty/vt/vc_screen.c
>     @@ -403,10 +403,11 @@ vcs_read(struct file *file, char __user
> *buf, size_t count, loff_t *ppos)
>                 unsigned int this_round, skip = 0;
>                 int size;
> 
>     -           ret = -ENXIO;
>                 vc = vcs_vc(inode, &viewed);
>     -           if (!vc)
>     -                   goto unlock_out;
>     +           if (!vc) {
>     +                   ret = -ENXIO;
>     +                   break;
>     +           }
> 
>                 /* Check whether we are above size each round,
>                  * as copy_to_user at the end of this loop
> 
> which hopefully really fixes this (at least I don't see any other
> "goto unlock_out" cases).
> 
>               Linus
