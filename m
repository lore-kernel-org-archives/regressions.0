Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6511FDD
	for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 03:00:45 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-502b0d23f28so8404736e87.2
        for <regressions@lists.linux.dev>; Mon, 18 Sep 2023 20:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695092443; x=1695697243; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQPsynM6R2ixtC19ozrB1TNJHFIvPl8x0SLoxOWlNjY=;
        b=NS09y3RRKCjIWRlrEvpl8m9d/J5ieGc9ToXcpIUBfPQQy8ja9CmrTHskOUkubKTbQD
         sAEE20SXXER7vR4RPKwT9pUaZkurm+7B4vlMlySsG2v9mYUF2YLKWySXSXfAap241E/h
         svJoSKxt9IQEA7VApVV1woRzXXGWjxnM2SMV1TEo6fse8jM4VM963rxG/9HIenFMS4Ht
         olQppOhgM6X9n7RH/pL7PTyZI0hWoPIngMdyp//fW1a0WNJzhVNIqfisMGeKoMeJk/uu
         vuxIqJmXteoBavpchqhsGQk42Ck5f3B81osBOIAN8iYDybhBRF481dhZ7eA5kXl2TtUj
         dttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695092443; x=1695697243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQPsynM6R2ixtC19ozrB1TNJHFIvPl8x0SLoxOWlNjY=;
        b=w8fSMKMA0GzbIrVyuE9ZfrqvHsYIruyx5wLgJ2hYgTb25BSpUgX53U+e/zWogQWAk3
         32+El1TRlejVEkQSuEss5loT7/E9chJ9qKFInntD/XfZ2GatZe6KmeBln2zLHoy+pNhy
         B3uj/qjQZC6Fuhl37bR51NkS4SqxKUFUImRwb/jMHYf4rI+kxq/HfHtA9a99/mJ+ERrm
         5gnDHePoTcX1A/htEQYb2U9Mq1CU0o19+5HccWBKVOUTigrqsi4EyNy74x31UbxsdYHw
         VIQXWSzo0lqdw6kl856BGGUWU0u723oFI7Lvpl6h9oin1tt58yewPBrdCfoYIdk3as4m
         zGDQ==
X-Gm-Message-State: AOJu0YyVYH7aHpiv0fP/nP7wGcXEcnHzlKw4eTuO4WTCf9BdaNQPIZ2g
	aKxQ7ryQvM/IUxPsC1gPo9B9SbPPZLo+3o1QjV4=
X-Google-Smtp-Source: AGHT+IGlAOnCxGpp/hLOpHuYyGGKpGYpW05H5HJl9jbhGYgiEZGsLdOS8IPxbCkhQnT0SnZMoNPuLqYa7J3ux6BvvJE=
X-Received: by 2002:a05:6512:3055:b0:503:1722:9c5a with SMTP id
 b21-20020a056512305500b0050317229c5amr4187770lfb.3.1695092443021; Mon, 18 Sep
 2023 20:00:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO+kfxTwOvaxYV0ZRESxZB-4LHsF9b_VBjAKahhwUm5a1_c4ug@mail.gmail.com>
 <ZPfPfyIoVxw5L6El@debian.me> <CAO+kfxQgXOsx6u+xLKGJe0KDiFsRAGstSpnrwxjQF6udgz5HFQ@mail.gmail.com>
 <CAO+kfxTvA6N=i+jGf0XbSyqf85i=q+vR6R9d_42OWfM2sWWXaA@mail.gmail.com>
In-Reply-To: <CAO+kfxTvA6N=i+jGf0XbSyqf85i=q+vR6R9d_42OWfM2sWWXaA@mail.gmail.com>
From: Steve French <smfrench@gmail.com>
Date: Mon, 18 Sep 2023 22:00:31 -0500
Message-ID: <CAH2r5mtUedfLSv81Z-Yb3_=AbD_QpT3tVbU1PRzMTituaw7bgA@mail.gmail.com>
Subject: Re: Possible bug report: kernel 6.5.0/6.5.1 high load when CIFS share
 is mounted (cifsd-cfid-laundromat in"D" state)
To: Brian Pardy <brian.pardy@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Linux CIFS <linux-cifs@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Paulo Alcantara <pc@manguebit.com>, 
	ronnie sahlberg <ronniesahlberg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Paulo and I were discussing the laundromat thread at the SMB3.1.1 test
event (at SDC this week) which is now going on - will let you know
what we find.

One obvious thing is that it probably isn't necessary for cases when
the server does not support directory leases, but we noticed another
problem as well.


On Mon, Sep 18, 2023 at 9:20=E2=80=AFPM Brian Pardy <brian.pardy@gmail.com>=
 wrote:
>
> [RS removed from CC due to bounce message]
>
> On Wed, Sep 6, 2023 at 5:03=E2=80=AFPM Brian Pardy <brian.pardy@gmail.com=
> wrote:
> > On Tue, Sep 5, 2023 at 9:01=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.=
com> wrote:
> > > Thanks for the regression report. But if you want to get it fixed,
> > > you have to do your part: perform bisection. See Documentation/admin-=
guide/bug-bisect.rst in the kernel sources for how to do that.
> > >
> > > Anyway, I'm adding it to regzbot:
> > >
> > > #regzbot ^introduced: v6.4..v6.5
> > > #regzbot title: incorrect CPU utilization report (multiplied) when mo=
unting CIFS
> >
> > Thank you for directing me to the bug-bisect documentation. Results bel=
ow:
> >
> > # git bisect bad
> > d14de8067e3f9653cdef5a094176d00f3260ab20 is the first bad commit
> > commit d14de8067e3f9653cdef5a094176d00f3260ab20
> > Author: Ronnie Sahlberg <lsahlber@redhat.com>
> > Date:   Thu Jul 6 12:32:24 2023 +1000
> >
> >     cifs: Add a laundromat thread for cached directories
> >
> >     and drop cached directories after 30 seconds
> >
> >     Signed-off-by: Ronnie Sahlberg <lsahlber@redhat.com>
> >     Signed-off-by: Steve French <stfrench@microsoft.com>
> >
> >  fs/smb/client/cached_dir.c | 67 ++++++++++++++++++++++++++++++++++++++=
++++++++
> >  fs/smb/client/cached_dir.h |  1 +
> >  2 files changed, 68 insertions(+)
>
> Is there any further information I can provide to aid in debugging
> this issue? Should I just expect incorrect load average reporting when
> a CIFS share is mounted on any kernel >6.5.0?
>
> I'm not clear on the value or necessity of this "laundromat thread" -
> everything worked as expected before it was added - shall I just patch
> it out of my kernel builds going forward if there is no interest in
> fixing it? Is a .config option to disable it possible?



--=20
Thanks,

Steve
