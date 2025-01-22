Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EABB17C220
	for <regressions@lists.linux.dev>; Wed, 22 Jan 2025 09:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737537820; cv=none; b=eltXDgh7fgjWPHOWSLNBA+2HlYAi/miSALT74ZCV22OS7sFLCmq1f4WJPQJaXPOx2VsU741b1Ovtn879kaduEL9UVBNu6bkY8o1AqX7PER2QCBlapxoztDL+lhJ+Y05erw8noTHZ74JkqQX2aRFXdqM0jbefv6u9L9oXGw9V2rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737537820; c=relaxed/simple;
	bh=F8ProAIP5DrHfafrvfIT+leeIwHBtlB0ZVrL/kl9f7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7PdgwvYLHZpBlWDzO03mv5/jbHRQr0mASzubXMnwI5dLkR2w/AFharfL2apRtAhmzbKPzFU/pk176O2TGmQ6XdIKeD1Owx76EDZbPf628l+sD0AxWoLWngDF8HjVMnWkiKAU9gWXILBmU8K8vA7qASG+r9i61xBtNFynnmQHpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cU3BGR9S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cU3BGR9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737537816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gdQAum+Pps4YSJoN2WCcOp2bDoISDakEwjRMf1GcTLM=;
	b=cU3BGR9SdV+8+Zw656danrpdbRzky/81x5rf6WLAnmfPUICJ2z1VXwrWWx0e6m3Oi2U4Wd
	5GXQdJyjbafJozPckduVkYruKRKyJ8TvkE8nJ8pTTXEDAQDwhYrrcD8/dykXcDQklLW814
	CBfCcz9az100CES+HI7ADrYlj/qRgzQ=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-NHCLAZBnPDa4_IGZ6f0ADA-1; Wed, 22 Jan 2025 04:23:35 -0500
X-MC-Unique: NHCLAZBnPDa4_IGZ6f0ADA-1
X-Mimecast-MFC-AGG-ID: NHCLAZBnPDa4_IGZ6f0ADA
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-e579836ee17so12902725276.2
        for <regressions@lists.linux.dev>; Wed, 22 Jan 2025 01:23:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737537814; x=1738142614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdQAum+Pps4YSJoN2WCcOp2bDoISDakEwjRMf1GcTLM=;
        b=XV5P3otuhldbYMGp9TgWeIwavmYoc7EVuuAQgYcec6SbOQ4wWR07Y7ylPUxeku0iK/
         7PK9CMl8R6gvVsQ+iOQ1EcQ4hYttjJlQqTQk2I2+HBNqSXhhyApwC6NWHa5ntP1vWI8N
         tvWT0CaC4F5RMjDQtuhWk5mi5anyprYSD1qG6mj2CnDv1nIJZAs7DECrOAA0fh29RQfD
         VGT+8bTzHvF3P2yzJUf7DGe19bZkxc1CVb7sF40RLVXMmZiIUXr8HKXpS5YnMjDiyMxZ
         OK+70gUzqk5I94bv9jPpmo285SbRyWtcr3eXot6J40s4eVtTNmeIv4+OPEtlV1RfEyPr
         KBgA==
X-Forwarded-Encrypted: i=1; AJvYcCWzR8bqNRkxPNrqXcxr+0cxB8OjLm43RyW8BTWzzyEPdjf+yaRggQtfHPCRY3IlTxzqRIm+/JlB+B09jw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOCBGsar/oPSMUJ4ktULfEckHbATdN+RkH49Om/j4ZegJaGuhA
	VVnaQYz+PQa9AWnVecxhvzAU/5URiKC3NVDKD3bxcQ/8giMf/4XsCNz4VvSQ/PpSlqUHotom9Js
	+V1wpB0HzQGpw/pBUp2mxguX+hqpX+1zr6w8DMwBoLofb0exs0bOlAL5WggM1Sx89CoRScDB78s
	xTagRe1cVLjBuDqpslaAxmpcT+P18BS1SbZt4=
X-Gm-Gg: ASbGnctn5RMk6fmi4wFow6CcrGHGhV/ZN4uYb9XOL8/2Qd6kqeXWSQwMt7k64AEuLrT
	LBJ22Vt3VR1CrEy7P5g1wW3tGAsdKXwnqJ0dB+1mJICb7z55IBwg=
X-Received: by 2002:a05:690c:368c:b0:6f2:8db8:d546 with SMTP id 00721157ae682-6f6eb67b0eemr193955547b3.11.1737537814640;
        Wed, 22 Jan 2025 01:23:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1r616B4vvOfTL9uKOtKVSTdJ/UW0JKLGBYucIkGqciZDywpD1F1/z8QgQVRuy2TdxBm2mU01jhikZ5Dfb4AQ=
X-Received: by 2002:a05:690c:368c:b0:6f2:8db8:d546 with SMTP id
 00721157ae682-6f6eb67b0eemr193955427b3.11.1737537814305; Wed, 22 Jan 2025
 01:23:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACW2H-7QEMKA+LUAzFJ+srmRCzSuLk2G7shWt0SGR9SfmxwOjA@mail.gmail.com>
 <CAGxU2F4_59X-Fj7vRCoDqM394699uxqLQZ5yCuH+jXUYcYO81g@mail.gmail.com>
 <CAGxU2F40eWaLxS8tsQaFeQ_ndjwdQXMj7VghH3VidcbkcVPrgw@mail.gmail.com> <CACW2H-4UivUO+aVt-Bb7GGwxLWite7hKSBzJ5WhSXyvWCkh8bg@mail.gmail.com>
In-Reply-To: <CACW2H-4UivUO+aVt-Bb7GGwxLWite7hKSBzJ5WhSXyvWCkh8bg@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 22 Jan 2025 10:23:23 +0100
X-Gm-Features: AWEUYZm8D4aF0TNsBmhfZ3zYppMzcmihA-0q0V_2IORmawiSBDmEf-kgYrCb7Xg
Message-ID: <CAGxU2F57EgVGbPifRuCvrUVjx06mrOXNdLcPdqhV9bdM0VqGvg@mail.gmail.com>
Subject: Re: [REGRESSION] vsocket timeout with kata containers agent 3.10.1
 and kernel 6.6.70
To: Simon Kaegi <simon.kaegi@gmail.com>, heruoqing@iscas.ac.cn
Cc: Eric Dumazet <edumazet@google.com>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Martin KaFai Lau <kafai@fb.com>, Kuniyuki Iwashima <kuniyu@amazon.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gVnS7LnRF9dB-UZSftBNbzXNC5u7xYGiP_tls9TIN3k_1737537814
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CCing Ruoqing He

On Wed, 22 Jan 2025 at 04:48, Simon Kaegi <simon.kaegi@gmail.com> wrote:
>
> Thanks Stefano,
>
> The feedback about vsock expectations was exactly what I was hoping
> you could provide.

You're welcome ;-)

>
> In the Kata agent we're not directly setting SO_REUSEPORT as a socket
> option so I think what you suggest where SO_REUSEORT is being set
> indiscriminately is happening a layer down perhaps in the tokio or nix
> crates we use. I unfortunately do not have an easy way to reproduce
> the problem without setting up kata containers and what's more you
> need to then rebuild a recent kata flavoured minimal kernel to see the
> issue.

I talked with Ruoqing He yesterday about this issue since he knows
Kata better than me :-)

He pointed out that Kata is using ttrpc-rust and he shared with me this cod=
e:
https://github.com/containerd/ttrpc-rust/blob/0610015a92c340c6d88f81c0d6f9f=
449dfd0ecba/src/common.rs#L175

The change (setting SO_REUSEPORT) was introduced more than 4 years
ago, but I honestly don't think it solved the problem mentioned in the
commit:
https://github.com/containerd/ttrpc-rust/commit/9ac87828ee870ecf5fb5feaa45c=
c0c9e3d34e236
So far it didn't give any problems because it was allowed on every
socket, but effectively it was a NOP for AF_VSOCK.

IIUC that code, it supports 2 address families: AF_VSOCK and AF_UNIX.
For AF_VSOCK we've made it clear that SO_REUSEPORT is useless, but for
AF_UNIX it's even more useless since there's no concept of a port, so
in my opinion `setsockopt(fd, sockopt::ReusePort, &true)?;` can be
removed completely.
Or at least not fail the entire function if it's unsupported, whereas
now it fails and the next bind is not done.

I don't know where this code is called, but removing that line is
likely to make everything work correctly.

Cheers,
Stefano

>
> I spent the day updating our build to use the latest kata container
> release and dependencies to see if that would correct the issue.
> Unfortunately that did not and so will work tomorrow to get stack
> traces etc. to more directly figure things out. For the others on the
> thread ... based on what Stefano said although throwing an error for
> vsocks is a change in behaviour I suspect this is a problem we can fix
> in a crate corrected to be more aware of vsock capabilities. I'll know
> better what's possible and update tomorrow.
>
> Thanks
> -Simon
>
> On Tue, Jan 21, 2025 at 4:54=E2=80=AFAM Stefano Garzarella <sgarzare@redh=
at.com> wrote:
> >
> > On Tue, 21 Jan 2025 at 10:26, Stefano Garzarella <sgarzare@redhat.com> =
wrote:
> > >
> > > Hi Simon,
> > >
> > > On Tue, 21 Jan 2025 at 05:53, Simon Kaegi <simon.kaegi@gmail.com> wro=
te:
> > > >
> > > > #regzbot introduced v6.6.69..v6.6.70
> > > > #regzbot introduced: ad91a2dacbf8c26a446658cdd55e8324dfeff1e7
> > > >
> > > > We hit this regression when updating our guest vm kernel from 6.6.6=
9
> > > > to 6.6.70 -- bisecting, this problem was introduced in
> > > > ad91a2dacbf8c26a446658cdd55e8324dfeff1e7 -- net: restrict SO_REUSEP=
ORT
> > > > to inet sockets
> > > >
> > > > We're getting a timeout when trying to connect to the vsocket in th=
e
> > > > guest VM when launching a kata containers 3.10.1 agent which
> > > > unsurprisingly ... uses a vsocket to communicate back to the host.
> > > >
> > > > We updated this commit and added an additional sk_is_vsock check an=
d
> > > > recompiled and this works correctly for us.
> > > > - if (valbool && !sk_is_inet(sk))
> > > > + if (valbool && !(sk_is_inet(sk) || sk_is_vsock(sk)))
> > > >
> > > > My understanding is limited here so I've added Stefano as he is lik=
ely
> > > > to better understand what makes sense here.
> > >
> > > Thanks for adding me, do you have a reproducer here?
> > >
> > > AFAIK in AF_VSOCK we never supported SO_REUSEPORT, so it seems strang=
e to me.
> > >
> > > I understand that the patch you refer to actually changes the behavio=
r
> > > of setsockopt(..., SO_REUSEPORT, ...) on an AF_VSOCK socket, where it
> > > used to return successfully before that change, but now returns an
> > > error, but subsequent binds should have still failed even without thi=
s
> > > patch.
> > >
> > > Do you actually use the SO_REUSEPORT feature on AF_VSOCK?
> > >
> > > If so, I need to better understand if the core socket does anything,
> > > but as I recall AF_VSOCK allocates ports internally, so I don't think
> > > multiple binds on the same port have ever been supported.
> >
> > I just tried on an old kernel without the patch applied, and I confirm
> > that SO_REUSEPORT was not supported also if the setsockopt() was
> > successful.
> >
> > I run the following snippet on 2 shell, on the first one everything
> > fine, but on the second the bind() fails in this way:
> >
> > $ uname -r
> > 6.10.11-200.fc40.x86_64
> > $ python3
> > >>> import socket
> > >>> import os
> > >>> s =3D socket.socket(socket.AF_VSOCK, socket.SOCK_STREAM)
> > >>> s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
> > >>> s.bind((socket.VMADDR_CID_ANY, 4242))
> > Traceback (most recent call last):
> >   File "<stdin>", line 1, in <module>
> > OSError: [Errno 98] Address already in use
> >
> >
> > With the patch applied, the setsockopt() fails immediately, but the
> > bind() behavior is the same (fails only on the second):
> >
> > $ uname -r
> > 6.12.9-200.fc41.x86_64
> > $ python3
> > >>> import socket
> > >>> import os
> > >>> s =3D socket.socket(socket.AF_VSOCK, socket.SOCK_STREAM)
> > >>> s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
> > Traceback (most recent call last):
> >   File "<python-input-3>", line 1, in <module>
> >     s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
> >     ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > OSError: [Errno 95] Operation not supported
> >
> > So, IMHO the patch is correct since AF_VSOCK never really supported
> > SO_REUSEPORT, so better to fail early.
> >
> > BTW I'm not sure what is happening on your side.
> > Could it be a problem in your code that uses SO_REUSEPORT
> > indiscriminately on AF_VSOCK, even though you then never bind on the
> > same port again?
> >
> > Thanks,
> > Stefano
> >
>

