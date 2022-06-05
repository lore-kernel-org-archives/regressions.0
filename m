Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10C31389
	for <regressions@lists.linux.dev>; Sun,  5 Jun 2022 11:01:23 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id q14so11353245vsr.12
        for <regressions@lists.linux.dev>; Sun, 05 Jun 2022 04:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T57DzE1a+rfHF5vwDlZCSjEzhalOom7Y2d/yaDhAOXg=;
        b=nhmjt3/5UkoVNe0yRgNoH4HALatrcvrtokQSksaQy824x8qi6oMjW2lSZ3i3pT1YIM
         Wu5+KXgoygidyhF22vroer152RlGd6oIBpr74VCe1jX2vyc3a8KpTiOqGqamXPvtKcos
         Lk32zGXioR9CBe55GR5jGgijHa+pVfhWmc6mP9ML6ijCNkeYJd7hLOJMdd95y5lyRsR1
         UUQ2fPGTEInpj/i+4hh+sRztEJECqR9vJA/JgTU+6GsYZ3zH2Fyz1TQyAnc41idvEkR2
         Hak90lFb/cizHbsgleFXuwRm/8u6LiDJ7lJ4NuVKDBmtB4KJ9yWlPELSt0wluqhyCX5g
         T0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T57DzE1a+rfHF5vwDlZCSjEzhalOom7Y2d/yaDhAOXg=;
        b=X4w346t6OP7Dgrls8jPzueFTLwz5hf+b9OyCN2Mgo97DeGFpenVi0X/XxIy3sq5AUR
         BRtrzAIsyko0vC4Mx5aNc45iA1qe8lbMzoOlLpzxBhGL8yCDi0C4dPKhP71x2khrdspG
         vZdJ5o7WtPRYVJxErdPq6Zv3Au2qra/gEE6AWMj/9sb9CeWAHF6H0upNIMdd2GCj9P7e
         oBnh9StB2fjzrgZfaRjtoGLk6x2ZoSO4fDe8+eLEXrtpHG1ho8B+cyaBCKjICK7iwBAi
         IOyaAmlKWj+6v9O7WRRtxo1b/lPreN5YqUZHfzQcZ/HvomUGyF+FzpvJyzS9Pqzbm2nZ
         lFuQ==
X-Gm-Message-State: AOAM532BNkacw/xBjTnbqfZqAt7FObKCrQTLJKLlDDB6HdzsWYk6Krtg
	q1Boe/Jq4U8AHTzm1M8aNN4So64QL/EXH72yzNs=
X-Google-Smtp-Source: ABdhPJyVyIS3nOKCqX5thnZgmcpLDJkLRQ7w20lDFFUYm+9mr8W1CFAWvPgAK859/Is9UCCxD08O1V/jkU6BQCirZg4=
X-Received: by 2002:a67:df98:0:b0:320:8446:7c6d with SMTP id
 x24-20020a67df98000000b0032084467c6dmr35264162vsk.16.1654426882308; Sun, 05
 Jun 2022 04:01:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFrh3J9soC36+BVuwHB=g9z_KB5Og2+p2_W+BBoBOZveErz14w@mail.gmail.com>
 <87k09wz0ec.fsf@cjr.nz> <CAFrh3J9Mrnw0bhJ-S3wYoZfNkKB-QjcLa5=r+vXMNudZ+zATFA@mail.gmail.com>
In-Reply-To: <CAFrh3J9Mrnw0bhJ-S3wYoZfNkKB-QjcLa5=r+vXMNudZ+zATFA@mail.gmail.com>
From: Satadru Pramanik <satadru@gmail.com>
Date: Sun, 5 Jun 2022 07:01:10 -0400
Message-ID: <CAFrh3J8c5cLhDpbDxOCL0XOx_UAN23_hnhMRy+NLqmRSC46rGQ@mail.gmail.com>
Subject: Re: Failure to access cifs mount of samba share after resume from
 sleep with 5.17-rc5
To: Paulo Alcantara <pc@cjr.nz>
Cc: CIFS <linux-cifs@vger.kernel.org>, Steve French <smfrench@gmail.com>, 
	Shyam Prasad N <nspmangalore@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	ronnie sahlberg <ronniesahlberg@gmail.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I can confirm that the patch fixes the issue on 5.18.1 as well.

Thanks again!

Satadru

On Sat, Jun 4, 2022 at 10:31 PM Satadru Pramanik <satadru@gmail.com> wrote:
>
> The patch appears to fix the issue on the problematic bisected
> pre-5.16 kernel. (I let the machine sleep for 3 hours and the mount
> still worked after resume.)
>
> I'm now booted into a 5.18.1 kernel with this patch, and I'll be able
> to tell tomorrow morning if this also resolves the issue with this
> newer kernel.
>
> Thanks for the help in getting this issue resolved!
>
> Regards,
>
> Satadru
>
> On Sat, Jun 4, 2022 at 3:36 PM Paulo Alcantara <pc@cjr.nz> wrote:
> >
> > Hi Satadru,
> >
> > Thanks for providing all requested files off-list.  With that, I ended
> > up with below changes that should fix your issue.  Please let us if it
> > works.
> >
> > diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
> > index 12c872800326..325423180fd2 100644
> > --- a/fs/cifs/cifsfs.c
> > +++ b/fs/cifs/cifsfs.c
> > @@ -1086,7 +1086,7 @@ struct file_system_type cifs_fs_type = {
> >  };
> >  MODULE_ALIAS_FS("cifs");
> >
> > -static struct file_system_type smb3_fs_type = {
> > +struct file_system_type smb3_fs_type = {
> >         .owner = THIS_MODULE,
> >         .name = "smb3",
> >         .init_fs_context = smb3_init_fs_context,
> > diff --git a/fs/cifs/cifsfs.h b/fs/cifs/cifsfs.h
> > index dd7e070ca243..b17be47a8e59 100644
> > --- a/fs/cifs/cifsfs.h
> > +++ b/fs/cifs/cifsfs.h
> > @@ -38,7 +38,7 @@ static inline unsigned long cifs_get_time(struct dentry *dentry)
> >         return (unsigned long) dentry->d_fsdata;
> >  }
> >
> > -extern struct file_system_type cifs_fs_type;
> > +extern struct file_system_type cifs_fs_type, smb3_fs_type;
> >  extern const struct address_space_operations cifs_addr_ops;
> >  extern const struct address_space_operations cifs_addr_ops_smallbuf;
> >
> > diff --git a/fs/cifs/misc.c b/fs/cifs/misc.c
> > index 35962a1a23b9..eeb2a2957a68 100644
> > --- a/fs/cifs/misc.c
> > +++ b/fs/cifs/misc.c
> > @@ -1211,8 +1211,12 @@ static struct super_block *__cifs_get_super(void (*f)(struct super_block *, void
> >                 .data = data,
> >                 .sb = NULL,
> >         };
> > +       struct file_system_type **fs_type = (struct file_system_type *[]) {
> > +               &cifs_fs_type, &smb3_fs_type, NULL,
> > +       };
> >
> > -       iterate_supers_type(&cifs_fs_type, f, &sd);
> > +       for (; *fs_type; fs_type++)
> > +               iterate_supers_type(*fs_type, f, &sd);
> >
> >         if (!sd.sb)
> >                 return ERR_PTR(-EINVAL);
