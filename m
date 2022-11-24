Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706FD79E3
	for <regressions@lists.linux.dev>; Thu, 24 Nov 2022 20:34:07 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id m19so2615269edj.8
        for <regressions@lists.linux.dev>; Thu, 24 Nov 2022 12:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+zbdt+3aJ/puBsqwQA0QSSEIHoZCeyYKLKFOfyKPSpI=;
        b=QLUMjAXQ2fEkphOSVbRVLpIQyWa0NhYO3SAX0XGU1tP14KCRI6rg5di8LGjlRorP7u
         Fv6zFzIDcQfAy0wmSaWmoFXzVM0TTmzlS2Gsu2nyw8cvtfNzBliPOQeMV7qGPJfuFbLC
         Ulc8QldPJBMRfb9bpYCSt+MDLB+PP+cQJ+8W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zbdt+3aJ/puBsqwQA0QSSEIHoZCeyYKLKFOfyKPSpI=;
        b=CsECkUa6HU5nKIakJIcp41BoW9eO2KFsfkBc8xR2aHt8TfXad18kwxYr2KlET0IfeJ
         i5XeBUSyjuY5KEweFy3s+k1uk2C4gtoPLgu92yNbk2KKz7YukYou2T7lqqi8cq+QP/H2
         MuftZoH9Z78nwSgZe6gSOxQVtsl2Bn46cSwDjkjeI8X6k6C2BbvqR1xK8ee1OVFMTLaq
         i3b+InFMwdXteu2NUMJ1CLKvKOnzQzA5a+DvCjayYbYFTpb0PAOmIu/kzM39ZoH+NQaQ
         dk5hIZc3GIDh64EFUiUpxaLoDmhnIW/oq/1WoETPs7I2vf0+QzhEYdPeOib2fD0Cc22w
         9RcA==
X-Gm-Message-State: ANoB5plrm5cBY14aZCAOc3vwSRf20tteVUXlJmSxyPwgGv/w/xFMUY9G
	vL+ZyWCkNA1xRxMfrTJM7ZvEQpWD5cvJW10IW0HSZA==
X-Google-Smtp-Source: AA0mqf6fdqwI0cS8RCosBZkrrlkXrH2sw8vgJawRYCTTkV6ECf84oA86pFY3q/0Ilo9qtsPH7028ypyDVo6RoIoCXC0=
X-Received: by 2002:a05:6402:e04:b0:469:e6ef:9164 with SMTP id
 h4-20020a0564020e0400b00469e6ef9164mr13510155edh.185.1669322045392; Thu, 24
 Nov 2022 12:34:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2505800d-8625-dab0-576a-3a0221954ba3@leemhuis.info> <Y3+jz5CVA9S+h2+b@ZenIV>
In-Reply-To: <Y3+jz5CVA9S+h2+b@ZenIV>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 24 Nov 2022 21:33:54 +0100
Message-ID: <CAJfpeguqCrEbvv4d4jdOnczQ9VOf4u9sSghvnDOWvUb84fv6OQ@mail.gmail.com>
Subject: Re: [regression, bisected] Bug 216738 - Adding O_APPEND to O_RDWR
 with fcntl(fd, F_SETFL) does not work on overlayfs
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	Linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	"Christian Brauner (Microsoft)" <brauner@kernel.org>, Pierre Labastie <pierre.labastie@neuf.fr>, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Nov 2022 at 18:03, Al Viro <viro@zeniv.linux.org.uk> wrote:

> So basically we have this
> static int ovl_change_flags(struct file *file, unsigned int flags)
> {
>         struct inode *inode = file_inode(file);
>         int err;
>
>         flags &= OVL_SETFL_MASK;
>
>         if (((flags ^ file->f_flags) & O_APPEND) && IS_APPEND(inode))
>                 return -EPERM;
>
>         if ((flags & O_DIRECT) && !(file->f_mode & FMODE_CAN_ODIRECT))
>                 return -EINVAL;
>
>         if (file->f_op->check_flags) {
>                 err = file->f_op->check_flags(flags);
>                 if (err)
>                         return err;
>         }
>
>         spin_lock(&file->f_lock);
>         file->f_flags = (file->f_flags & ~OVL_SETFL_MASK) | flags;
>         spin_unlock(&file->f_lock);
>
>         return 0;
> }
> open-coding what setfl() would've done, without updating ->f_iocb_flags...
> Not hard to deal with...
>
> I could pick it in vfs.git #fixes, or Miklos could put it through his tree.
> Miklos, which way would you prefer that to go?

I'll pick this into #overlayfs-next, as a PR for this cycle is needed anyway.

Thanks,
Miklos
