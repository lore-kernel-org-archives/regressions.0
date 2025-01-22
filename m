Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4711B15533F
	for <regressions@lists.linux.dev>; Wed, 22 Jan 2025 03:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737517726; cv=none; b=EqbOunv5S8P35CCUCT1cxatyiXYEg9t0keiQYZLQkRYPvoaK42lWCDrBuY0f3BsQo6uXEGN4dPTsQOzxYqyI7y6DCHAxjsegIPIZhn9P9FHdz/+FPfTbsQw1SmVg+B+kdTHBu4NRyPkq5WaSAhxZFDgyTgpcwTXoLuLUnYtUWds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737517726; c=relaxed/simple;
	bh=zBlDKQmX0Qqeer03/Vo0fodxzovGRuSHfnyFQnuBHrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZHMokp2OjMgrq6w6TT+/K9wFoMsClys8PA4aklHt0DVv4GoEpQ4gck3kFVCvSveBh+gCU5C5eXLCZUaVgo1TuXZhiAsj755ctxJbc51R7BOjd/ZMWVVTARcNblYF4cr8twsfKqr+gnueUQ+1XysYtHeUPi+i3sJFv/q2mWhPhV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/2ED0Na; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/2ED0Na"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-85c662ebbc3so1081346241.0
        for <regressions@lists.linux.dev>; Tue, 21 Jan 2025 19:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737517724; x=1738122524; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14MS92ZvffGDFTNo8z/cslD9N49dzn7Pr625BrgfqX0=;
        b=J/2ED0NaPe958Rxn54KPxWnKCfG5Ogpef6ukCjYCPIUoAOGOFWMiomQQVKkHZPXFg6
         N1hzq6jIIQvNklQbK7XQAHtMaRwG56sjo29umLrpSXe6lCbtn7NmAfeoI8298nNEntlr
         lGpHYZukOFya8QdsmHC3kTGhb6FREX7++3REAYCnQsVxtbZ5jwlsbc3md6w05X5TiEHP
         udMVmjMWstsq8APJBCXVKJ4EV+6Ahu9WTvNmYlBRBFlvYhcmlXbl0/k0BkGbzkJKFX78
         wiKNQoOcg4nOn5ZzAQrRMmWvl5hSVnNMq8QiH6+Bhu+TEWIjjLFmNwc62YfIJlj8DtCD
         jkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737517724; x=1738122524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14MS92ZvffGDFTNo8z/cslD9N49dzn7Pr625BrgfqX0=;
        b=jS5d8yxNvbpN0HqKiVPWQ2mYGO1zixt9zfKycyr/0eBiNOWa16RzxspY0z6hDYNbAQ
         qcDd7dKVUkrzD3V46uIXQvPvM3qm2Ngm/xbQxYjQL/KfTUaXCzl7STqRjvVy42VNrdTX
         rvtYt/ycSnKgim/NO8x45QR6mVdITVlkZN15MeBysH7AqsrbUh0+rq3cGq+rAwp+CvfW
         jm2XAe/Z0G6UFZ69tqtuAQLDN1q64VIkoIDsCyM4E6zhdeCyK6uRK5TZMWTBz4BezOMV
         WMBs965c0wjrKO86M89uzt5ML/4ViFQ1vsGVM5HkmbS3a85djJRX/+9JINgU4nSDE0lj
         C1HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw547mFvYAhigGAhitomxiiULE8YGhQQv8gG/neofSoHoVjK1UbQ+y8M5w6yUmYdyOKmIJxaWKajRyiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywprfi+8DisERhDfSKqXRXoQiWLqmPLh3UUgprcdZEv4A0vJDBC
	qiJqDEgPNrAIYK56Lbq2YjhESh1dGXp4ic83B3rheSQxbp1XccmqHEdSfbMrAoM98Ot3ubWaE+w
	wi6lydGL/2ykdyf9qgsbYr61OP3E=
X-Gm-Gg: ASbGncvUO6kKv2ZWVppEwZCBEg5kbPtTdcIQ2zhiuNEqMnK2zaz1IDD9aAPe5+fNh6l
	whuAKt/2WKEOJxn4y/use/Npg6j0Nh4e6RKH3WbSeaFZGv9dmTg==
X-Google-Smtp-Source: AGHT+IF/ClFmwPqJUG3Gy9/V81kyICJLbAED+TCOcRupzetKKFpv35palgQ6jAvoD3sKwytU5zALWrtFOHEZGNLehNI=
X-Received: by 2002:a05:6102:c52:b0:4af:bb06:62d with SMTP id
 ada2fe7eead31-4b690bdcbabmr16391013137.11.1737517724021; Tue, 21 Jan 2025
 19:48:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACW2H-7QEMKA+LUAzFJ+srmRCzSuLk2G7shWt0SGR9SfmxwOjA@mail.gmail.com>
 <CAGxU2F4_59X-Fj7vRCoDqM394699uxqLQZ5yCuH+jXUYcYO81g@mail.gmail.com> <CAGxU2F40eWaLxS8tsQaFeQ_ndjwdQXMj7VghH3VidcbkcVPrgw@mail.gmail.com>
In-Reply-To: <CAGxU2F40eWaLxS8tsQaFeQ_ndjwdQXMj7VghH3VidcbkcVPrgw@mail.gmail.com>
From: Simon Kaegi <simon.kaegi@gmail.com>
Date: Tue, 21 Jan 2025 22:48:33 -0500
X-Gm-Features: AbW1kvYNOGgLXpFTEODaZY7TtEl23oKnWqoCq4jc4_K3TPO0PpBI7U3IM9pkwEk
Message-ID: <CACW2H-4UivUO+aVt-Bb7GGwxLWite7hKSBzJ5WhSXyvWCkh8bg@mail.gmail.com>
Subject: Re: [REGRESSION] vsocket timeout with kata containers agent 3.10.1
 and kernel 6.6.70
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Eric Dumazet <edumazet@google.com>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Martin KaFai Lau <kafai@fb.com>, Kuniyuki Iwashima <kuniyu@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Stefano,

The feedback about vsock expectations was exactly what I was hoping
you could provide.

In the Kata agent we're not directly setting SO_REUSEPORT as a socket
option so I think what you suggest where SO_REUSEORT is being set
indiscriminately is happening a layer down perhaps in the tokio or nix
crates we use. I unfortunately do not have an easy way to reproduce
the problem without setting up kata containers and what's more you
need to then rebuild a recent kata flavoured minimal kernel to see the
issue.

I spent the day updating our build to use the latest kata container
release and dependencies to see if that would correct the issue.
Unfortunately that did not and so will work tomorrow to get stack
traces etc. to more directly figure things out. For the others on the
thread ... based on what Stefano said although throwing an error for
vsocks is a change in behaviour I suspect this is a problem we can fix
in a crate corrected to be more aware of vsock capabilities. I'll know
better what's possible and update tomorrow.

Thanks
-Simon

On Tue, Jan 21, 2025 at 4:54=E2=80=AFAM Stefano Garzarella <sgarzare@redhat=
.com> wrote:
>
> On Tue, 21 Jan 2025 at 10:26, Stefano Garzarella <sgarzare@redhat.com> wr=
ote:
> >
> > Hi Simon,
> >
> > On Tue, 21 Jan 2025 at 05:53, Simon Kaegi <simon.kaegi@gmail.com> wrote=
:
> > >
> > > #regzbot introduced v6.6.69..v6.6.70
> > > #regzbot introduced: ad91a2dacbf8c26a446658cdd55e8324dfeff1e7
> > >
> > > We hit this regression when updating our guest vm kernel from 6.6.69
> > > to 6.6.70 -- bisecting, this problem was introduced in
> > > ad91a2dacbf8c26a446658cdd55e8324dfeff1e7 -- net: restrict SO_REUSEPOR=
T
> > > to inet sockets
> > >
> > > We're getting a timeout when trying to connect to the vsocket in the
> > > guest VM when launching a kata containers 3.10.1 agent which
> > > unsurprisingly ... uses a vsocket to communicate back to the host.
> > >
> > > We updated this commit and added an additional sk_is_vsock check and
> > > recompiled and this works correctly for us.
> > > - if (valbool && !sk_is_inet(sk))
> > > + if (valbool && !(sk_is_inet(sk) || sk_is_vsock(sk)))
> > >
> > > My understanding is limited here so I've added Stefano as he is likel=
y
> > > to better understand what makes sense here.
> >
> > Thanks for adding me, do you have a reproducer here?
> >
> > AFAIK in AF_VSOCK we never supported SO_REUSEPORT, so it seems strange =
to me.
> >
> > I understand that the patch you refer to actually changes the behavior
> > of setsockopt(..., SO_REUSEPORT, ...) on an AF_VSOCK socket, where it
> > used to return successfully before that change, but now returns an
> > error, but subsequent binds should have still failed even without this
> > patch.
> >
> > Do you actually use the SO_REUSEPORT feature on AF_VSOCK?
> >
> > If so, I need to better understand if the core socket does anything,
> > but as I recall AF_VSOCK allocates ports internally, so I don't think
> > multiple binds on the same port have ever been supported.
>
> I just tried on an old kernel without the patch applied, and I confirm
> that SO_REUSEPORT was not supported also if the setsockopt() was
> successful.
>
> I run the following snippet on 2 shell, on the first one everything
> fine, but on the second the bind() fails in this way:
>
> $ uname -r
> 6.10.11-200.fc40.x86_64
> $ python3
> >>> import socket
> >>> import os
> >>> s =3D socket.socket(socket.AF_VSOCK, socket.SOCK_STREAM)
> >>> s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
> >>> s.bind((socket.VMADDR_CID_ANY, 4242))
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
> OSError: [Errno 98] Address already in use
>
>
> With the patch applied, the setsockopt() fails immediately, but the
> bind() behavior is the same (fails only on the second):
>
> $ uname -r
> 6.12.9-200.fc41.x86_64
> $ python3
> >>> import socket
> >>> import os
> >>> s =3D socket.socket(socket.AF_VSOCK, socket.SOCK_STREAM)
> >>> s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
> Traceback (most recent call last):
>   File "<python-input-3>", line 1, in <module>
>     s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
>     ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> OSError: [Errno 95] Operation not supported
>
> So, IMHO the patch is correct since AF_VSOCK never really supported
> SO_REUSEPORT, so better to fail early.
>
> BTW I'm not sure what is happening on your side.
> Could it be a problem in your code that uses SO_REUSEPORT
> indiscriminately on AF_VSOCK, even though you then never bind on the
> same port again?
>
> Thanks,
> Stefano
>
