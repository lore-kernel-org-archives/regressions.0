Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3217A1FDD
	for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 03:02:06 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ba1e9b1fa9so84532651fa.3
        for <regressions@lists.linux.dev>; Mon, 18 Sep 2023 20:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695092525; x=1695697325; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6jZCjLhiHuYsbpaMoawt7/mepZO3oZhk8mBqHjvEbY=;
        b=Wk1RiWvoxi/GJ9mGVhQWzFG9ScENzAydnDTFU6sjeHHTD5yVdEbuYC9auyO4jiZA3i
         mCe7kBWE9tfwkRdY5z4xYb0j18GQ7YAv6uu0dVlv4YAP5xImZZiKnkcf0jZHdvRvUV9e
         c2WpcLWUeqnTyA4CylvSxsk9L+xwcVOC/VUuHWuF/8n0fIku4zC3vxB5pSals1kLfFiZ
         vzAYT/ZjPD+pDhJce0LZbeFug6zkBXd/8U5U9ggfVUT4Tox/oCDKXG5GSpnnZmtmF2jr
         8xVt7SIlvcPcy3hEfOzXKybzT+aQhoKdhC4bPxDkeI5U96iai54KcE3ROOTb8D8nFYoo
         BGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695092525; x=1695697325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6jZCjLhiHuYsbpaMoawt7/mepZO3oZhk8mBqHjvEbY=;
        b=bRYA+yolxmHF1GIuXegec+oa/7HBuskUuc6RXzx7R9y0upOSZD5DO6WPtOo+NGUfZ7
         RDp8cY31pLcaKmfOgQjBpBlCQ/U5Kdt57Tl6a2hZthm7a3hhTrevHTEKW9jRiees3iH/
         t9Nokp/4pUyNb84kDLXc+JxROH/UTm7joeOFz85EcD4e9BVIIT+EYwOQJ56eR2JErJPy
         bm5sjiRJGhpu7dMDTaQiISUClXzP9v0f1lvRnr5xAzGpWPO2G2TvloHcWfUXsKPRqrMm
         Kz0Y1EXkzFqc7R6B+v+qbb/wm7EyIbVmd2fGH9k/2HyxgNlB1YGLYe5iG3RZ0lrjM24D
         rHQA==
X-Gm-Message-State: AOJu0YwhI30h51z64WhdhfFBjfdugCpvGKNYPA/4QwvkNF4x9MpIEyN5
	Wukj62c+jz6NbR5INd/2UkVcqdp5gm01EJFJeQs=
X-Google-Smtp-Source: AGHT+IF37DAV2Mqz9FnqxAWHK7EGAa/NKq+ccnIaLSbDz84sZOvvBr7ZXjvVMASO7EaGdS08ISvcVwDwTU/vrsJ33AE=
X-Received: by 2002:a2e:bc14:0:b0:2bf:ee57:f18 with SMTP id
 b20-20020a2ebc14000000b002bfee570f18mr8822031ljf.16.1695092524723; Mon, 18
 Sep 2023 20:02:04 -0700 (PDT)
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
Date: Mon, 18 Sep 2023 22:01:53 -0500
Message-ID: <CAH2r5mssa12aGh+xvzKZVVTqsBz2Ku88PY8n+ntRnVz_waTURw@mail.gmail.com>
Subject: Re: Possible bug report: kernel 6.5.0/6.5.1 high load when CIFS share
 is mounted (cifsd-cfid-laundromat in"D" state)
To: Brian Pardy <brian.pardy@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Linux CIFS <linux-cifs@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Steve French <sfrench@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> I'm not clear on the value or necessity of this "laundromat thread"

This thread is used to clean up cached directories when directory
leases are supported (in those cases directory contents, and
information needed for revalidate of directory paths can be cached
safely).

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
