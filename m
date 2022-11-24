Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4837D2F26
	for <regressions@lists.linux.dev>; Thu, 24 Nov 2022 17:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PbmppnJ6peRHw9rwdAbdS45dXmoXZMyXZ7qI/el0I10=; b=slVFYodzDYzc7/QGXdh1S3LDGE
	hb21aJ381Hfol/8n778iHvHHlUdELze04qweZ0uKmYXYl7lmexvF0lZZz6iTR0pnJ0HmgxMuD1AcW
	m1l3SEarVPQfFj+2z1iNjWHZuBV4qHD0IATUTpdxUShtjVx4v+LVZqzEOqSPW3U+DK8E6f/kLCgp+
	N18nDiyCJy15tRk3ZmpDnUz9pBgfQSNakvSSe/9RUDKT68Yyn6MMaPQiyLJYy0hH7N2e4WWmvb0rh
	hsksonkUoqfK6KbI5aHkmcwSb6XhXPk1509g0LBMWEEp5AGP9q6WIVzTCHGBkGBRAeKYskSs9gyvJ
	gxoRlj/Q==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1oyFd1-006TzA-1p;
	Thu, 24 Nov 2022 17:03:11 +0000
Date: Thu, 24 Nov 2022 17:03:11 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>,
	"Christian Brauner (Microsoft)" <brauner@kernel.org>,
	Pierre Labastie <pierre.labastie@neuf.fr>,
	Miklos Szeredi <miklos@szeredi.hu>, linux-unionfs@vger.kernel.org
Subject: Re: [regression, =?iso-8859-1?Q?bisected?=
 =?iso-8859-1?Q?=5D_Bug=A0216738_-_Adding_O=5FAPPEND_to_O=5FRDW?=
 =?iso-8859-1?Q?R?= with fcntl(fd, F_SETFL) does not work on overlayfs
Message-ID: <Y3+jz5CVA9S+h2+b@ZenIV>
References: <2505800d-8625-dab0-576a-3a0221954ba3@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2505800d-8625-dab0-576a-3a0221954ba3@leemhuis.info>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Nov 24, 2022 at 04:47:56PM +0100, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developer don't keep an eye on it, I decided to forward it by
> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216738 :
> 
> >  Pierre Labastie 2022-11-24 14:53:33 UTC
> > 
> > Created attachment 303287 [details]
> > C program for reproducing the bug
> > 
> > Not sure this is the right place to report this, but at least the offending commit
> 
> [offending commit is 164f4064ca8 ("keep iocb_flags() result cached in
> struct file"), as specified in the "Kernel Version:" field in bugzilla]

So basically we have this
static int ovl_change_flags(struct file *file, unsigned int flags)
{
        struct inode *inode = file_inode(file);
        int err;

        flags &= OVL_SETFL_MASK;

        if (((flags ^ file->f_flags) & O_APPEND) && IS_APPEND(inode))
                return -EPERM;

        if ((flags & O_DIRECT) && !(file->f_mode & FMODE_CAN_ODIRECT))
                return -EINVAL;

        if (file->f_op->check_flags) {
                err = file->f_op->check_flags(flags);
                if (err)
                        return err;
        }

        spin_lock(&file->f_lock);
        file->f_flags = (file->f_flags & ~OVL_SETFL_MASK) | flags;
        spin_unlock(&file->f_lock);

        return 0;
}
open-coding what setfl() would've done, without updating ->f_iocb_flags...
Not hard to deal with...

I could pick it in vfs.git #fixes, or Miklos could put it through his tree.
Miklos, which way would you prefer that to go?

[PATCH] update ->f_iocb_flags when ovl_change_flags() modifies ->f_flags

ovl_change_flags() is an open-coded variant of fs/fcntl.c:setfl() and it got
missed by 164f4064ca81e "keep iocb_flags() result cached in struct file";
the same change applies there.

Reported-by: Pierre Labastie <pierre.labastie@neuf.fr>
Fixes: 164f4064ca81e "keep iocb_flags() result cached in struct file"
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
diff --git a/fs/overlayfs/file.c b/fs/overlayfs/file.c
index a1a22f58ba18..dd688a842b0b 100644
--- a/fs/overlayfs/file.c
+++ b/fs/overlayfs/file.c
@@ -96,6 +96,7 @@ static int ovl_change_flags(struct file *file, unsigned int flags)
 
 	spin_lock(&file->f_lock);
 	file->f_flags = (file->f_flags & ~OVL_SETFL_MASK) | flags;
+	file->f_iocb_flags = iocb_flags(file);
 	spin_unlock(&file->f_lock);
 
 	return 0;
