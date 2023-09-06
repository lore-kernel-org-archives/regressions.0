Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111146ADB
	for <regressions@lists.linux.dev>; Wed,  6 Sep 2023 21:04:02 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-52c9f1bd05dso241060a12.3
        for <regressions@lists.linux.dev>; Wed, 06 Sep 2023 14:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694034241; x=1694639041; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayxzwMlaIa8aBHyrJnwJW2G9gVUNOm3mCQTU2C2XbwE=;
        b=Wn4fvIQiPZP9OeGLrt8mmUGeLHFAO+HVXeJdsbXnK4hj6R8isnbUTCyDcFw9PJkQZQ
         VRB7y32RaCeuE0EPdR6Ks6K9VtWwKL21JqOqHpbKDdMOnrBHpgYgP0CkKe5muzBerCRc
         m9p7G3a2pzlvQB0Fn3KUt7ojtcZwELTZkQ31g2oqcWmIgrnmlj71wb1oJ4ZrFnyJqYTQ
         6suHGv7l5I0+8KtMNv3ZotwsxnzBd81cpRhagMTGRRBFiAHN9PlTzvvpMF8Z+DTBnM9E
         3+5kLAYsVQTxGS488UqcItywVedmQBhy0c5vHbiBZqr07TloRZnnBFyygn29AYvhwmYm
         KVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694034241; x=1694639041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayxzwMlaIa8aBHyrJnwJW2G9gVUNOm3mCQTU2C2XbwE=;
        b=Ed6hfLJ/LS4/JBD8j+uz6PBBBTQzSreaiv60BetvohEQ7doAzsjBojr81wZ9mGJVhQ
         ZZq67qh3grF/mBr0PLq0EpXL8dD7gpmjFpe8jkwFv8TIXpaoaFDtbRWd6+js9aI2sJec
         I+hxCuA+x1eypTSQvYbgPeyBJBjalVLZoI1f2hfAa28i3uM97ZpjkOxG6xiQ/BtJoZ0m
         1EU+JceqCKcRvwM5GRdpVHI0uvBeKQmUtRu2J6o+9wP70CkpFxlKSUfpBSF5iGF8IPEV
         /mlDO+dkNikPBGPpQI84Fz9446mDNgYxvoGRKg06+5cLaWbWOn1C0ydKuojbltYrSTvi
         Wj7Q==
X-Gm-Message-State: AOJu0Yxq9VT4Y6msZgfE20KzTPaGf+eZs60zv6dMAFmBY4t4GvHX5Q84
	AIqfd/t29Ghoxp3onfheTXV4H/CxkpJQ6Nnl3sw=
X-Google-Smtp-Source: AGHT+IHZFaYn2Ozf5KGvXEZ9HNBQtrzOXhDAjhZYSjPt87z8JWO2xSAnqi44xFQC2aNFozkZOHjZj5OOMGgIb/uy278=
X-Received: by 2002:a17:906:297:b0:9a5:c5fe:af85 with SMTP id
 23-20020a170906029700b009a5c5feaf85mr3614951ejf.3.1694034240716; Wed, 06 Sep
 2023 14:04:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO+kfxTwOvaxYV0ZRESxZB-4LHsF9b_VBjAKahhwUm5a1_c4ug@mail.gmail.com>
 <ZPfPfyIoVxw5L6El@debian.me>
In-Reply-To: <ZPfPfyIoVxw5L6El@debian.me>
From: Brian Pardy <brian.pardy@gmail.com>
Date: Wed, 6 Sep 2023 17:03:48 -0400
Message-ID: <CAO+kfxQgXOsx6u+xLKGJe0KDiFsRAGstSpnrwxjQF6udgz5HFQ@mail.gmail.com>
Subject: Re: Possible bug report: kernel 6.5.0/6.5.1 high load when CIFS share
 is mounted (cifsd-cfid-laundromat in"D" state)
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux CIFS <linux-cifs@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Steve French <sfrench@samba.org>, 
	Ronnie Sahlberg <lsahlber@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Added committer Ronnie Sahlberg to CC.

On Tue, Sep 5, 2023 at 9:01=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com>=
 wrote:
> On Tue, Sep 05, 2023 at 01:09:05PM -0400, Brian Pardy wrote:
> > I've noticed an issue with the CIFS client in kernel 6.5.0/6.5.1 that
> > does not exist in 6.4.12 or other previous kernels (I have not tested
> > 6.4.13). Almost immediately after mounting a CIFS share, the reported
> > load average on my system goes up by 2. At the time this occurs I see
> > two [cifsd-cfid-laundromat] kernel threads running the "D" state,
> > where they remain for the entire time the CIFS share is mounted. The
> > load will remain stable at 2 (otherwise idle) until the share is
> > unmounted, at which point the [cifsd-cfid-laundromat] threads
> > disappear and load drops back down to 0. This is easily reproducible
> > on my system, but I am not sure what to do to retrieve more useful
> > debugging information. If I mount two shares from this server, I get
> > four laundromat threads in "D" state and a sustained load average of
> > 4.
> >
> > The client is running Gentoo Linux, the server is a Seagate Personal
> > Cloud NAS running Samba 4.6.5. Mount options used are
> > "noperm,guest,vers=3D3.02". The CPUs do not actually appear to be
> > spinning, the reported load average appears incorrect as far as actual
> > CPU use is concerned.
>
> Thanks for the regression report. But if you want to get it fixed,
> you have to do your part: perform bisection. See Documentation/admin-guid=
e/bug-bisect.rst in the kernel sources for how to do that.
>
> Anyway, I'm adding it to regzbot:
>
> #regzbot ^introduced: v6.4..v6.5
> #regzbot title: incorrect CPU utilization report (multiplied) when mounti=
ng CIFS

Thank you for directing me to the bug-bisect documentation. Results below:

# git bisect bad
d14de8067e3f9653cdef5a094176d00f3260ab20 is the first bad commit
commit d14de8067e3f9653cdef5a094176d00f3260ab20
Author: Ronnie Sahlberg <lsahlber@redhat.com>
Date:   Thu Jul 6 12:32:24 2023 +1000

    cifs: Add a laundromat thread for cached directories

    and drop cached directories after 30 seconds

    Signed-off-by: Ronnie Sahlberg <lsahlber@redhat.com>
    Signed-off-by: Steve French <stfrench@microsoft.com>

 fs/smb/client/cached_dir.c | 67 ++++++++++++++++++++++++++++++++++++++++++=
++++
 fs/smb/client/cached_dir.h |  1 +
 2 files changed, 68 insertions(+)

I do not know what other debug info may be useful, but here is
/proc/[pid]/stack output for one of these threads in D state:

# cat /proc/17314/stack
[<0>] msleep+0x24/0x40
[<0>] cifs_cfids_laundromat_thread+0x5e/0x1c0 [cifs]
[<0>] kthread+0xc4/0xf0
[<0>] ret_from_fork+0x28/0x40
[<0>] ret_from_fork_asm+0x1b/0x30

I will provide any other details requested. Thank you.

#regzbot introduced: d14de8067e3
