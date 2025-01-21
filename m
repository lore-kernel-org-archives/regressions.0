Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6729A1DF75E
	for <regressions@lists.linux.dev>; Tue, 21 Jan 2025 09:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737453255; cv=none; b=i54J0j+5MdyCaBlMcqLN1wM2Out0i3dmYAwm5ZrabuQTkqZh0oZKTBna5peCizSweH/LMZ9KUyLOolviD5E06VooUghFqkd1MF7FgQ05rOkfkk1TvRGbf0lKmLZOOUFsq3WJ945njiJZQ4gQ6NwSssFVXAzvyKS/NhTRH6CfYwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737453255; c=relaxed/simple;
	bh=TpJffZQuac9DW2hZt9Juhtwp6++c0H+7a9wV097FLJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bih5vSwgs8HTdEZ6mlJg4IgYTaAv8JicelJFtXRzb78D1uNeM+CLsFlANuQ3hS+8d0CgzjTrR/+cvxAmThEN8EZU3gvTrdEqOMsSajLKvaZWvyDU/DVtPoE+a1F7C3qYPpcn+ieVwh/vResLZob5wSiB5CkiX8V6xnraH6St9wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YpPC37Uy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YpPC37Uy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737453252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r/0k+9z4JN2ODCDMi+Xos9Bp9IQjHEziyZ9zUX/AkWM=;
	b=YpPC37UyOjbtxCfk77a51UiaZrWHlt1C6KZ90rOEmGbGlf63U8yo9UMDo1EWTLvuG4w2yN
	9rvcxCWPYEomcbPnCQSPnn/++XK8UVt1fTHy8tiO0XaUghhvhO7a5jM8DItxyYJOJfrXah
	+O+G4WhPHgeOuX8CoDuzEI+4JbHbAPE=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-fuRvj6_NOH6EGWgsMRiMdw-1; Tue, 21 Jan 2025 04:54:08 -0500
X-MC-Unique: fuRvj6_NOH6EGWgsMRiMdw-1
X-Mimecast-MFC-AGG-ID: fuRvj6_NOH6EGWgsMRiMdw
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e572cd106f7so14109030276.3
        for <regressions@lists.linux.dev>; Tue, 21 Jan 2025 01:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737453248; x=1738058048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/0k+9z4JN2ODCDMi+Xos9Bp9IQjHEziyZ9zUX/AkWM=;
        b=UrSbTZBEszJ88nUofOmNCRvq8SHq90AK7XPU4o/9l79L9Kh9mKtAPMHukJDfq3Ucfm
         H2XnXbi2dG5lzvdRj+YbyzwN7FIkfZOflVstIvtegOFnPvoV+m9Iqv5M0sQrP1kdmF6n
         AE/yuHCwCq+V++oqdx7fNNXQXOHxEnjhmemaoPwyxiDS0PgNuLV/DHGrSah3OJkcf4Ge
         VLjKRn/ZJinUDtl7oGvYkq5NMKVPDWbd9+ZCDlCaHGgtB0jryZmzWe5EbF+vc80XRJ2R
         957sYAE+ZgmqTIm9mS/30m/TUyhFTKfnNv5qW5XSzTRDqnQnPEoPgszCVvSYD9cUpJa8
         ULuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlwcz1bnxiuExICUXcCX4wmzWqxY7Zb7G6nVQHkF2UcGwLVRl00qGBCRJoxCoG3rHSiBQ01zZ1FJ1whg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcYAZn0mDlmq4OVdjEID5lV9RR4y7+qnc2DxtuWAc6QQnfLfM9
	ePset4X9ukoTC1gr0P7pKlv2WpyBpyjEKtX1ZrKV7mZeLqSVu9iQJbUjKEvlzRabgvxj2RrXGwQ
	Q82soFtJbaUDWHYvCwgqs7peyQz/ZMF5Nhf1ud/iDm+H18PH3TQ+rGFslOXudl3lS5qM+LYB0l7
	o3SqCDvi6tvHPOQf8vVJt59i2ejmOj/jYr3kQ=
X-Gm-Gg: ASbGncsamAsMWorlJmOHSp87ilvPQ7p/ZV+89aMb3fWMKncz/HqvbaHG9VTN7C5+k2x
	Cj8vWR4hjbERXBZGqWS4hvU3RQyEJMtxohjiMYGJ1H/hpg3IlMeo=
X-Received: by 2002:a05:690c:7248:b0:6f4:4280:2433 with SMTP id 00721157ae682-6f6eb67072dmr117323407b3.9.1737453248378;
        Tue, 21 Jan 2025 01:54:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9d/EFlpu1M174fWhAr0r5Yc5QQh90el5D1HrGAVT7p2zXcR8P5kxeKd4NAgWJ+uEdZzsvIqu7o/nUtqHwi7Q=
X-Received: by 2002:a05:690c:7248:b0:6f4:4280:2433 with SMTP id
 00721157ae682-6f6eb67072dmr117323187b3.9.1737453247954; Tue, 21 Jan 2025
 01:54:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACW2H-7QEMKA+LUAzFJ+srmRCzSuLk2G7shWt0SGR9SfmxwOjA@mail.gmail.com>
 <CAGxU2F4_59X-Fj7vRCoDqM394699uxqLQZ5yCuH+jXUYcYO81g@mail.gmail.com>
In-Reply-To: <CAGxU2F4_59X-Fj7vRCoDqM394699uxqLQZ5yCuH+jXUYcYO81g@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 21 Jan 2025 10:53:56 +0100
X-Gm-Features: AbW1kvYPrjthcGnUooT6VF8N9ZVJ9kek8dA_ICCkySCZF0sYJrh_CQVaeLavmhI
Message-ID: <CAGxU2F40eWaLxS8tsQaFeQ_ndjwdQXMj7VghH3VidcbkcVPrgw@mail.gmail.com>
Subject: Re: [REGRESSION] vsocket timeout with kata containers agent 3.10.1
 and kernel 6.6.70
To: Simon Kaegi <simon.kaegi@gmail.com>, Eric Dumazet <edumazet@google.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin KaFai Lau <kafai@fb.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N_jPBChc94hYLueDp5iccdsyhjNUBHoER2rbs7xEtFo_1737453248
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Jan 2025 at 10:26, Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> Hi Simon,
>
> On Tue, 21 Jan 2025 at 05:53, Simon Kaegi <simon.kaegi@gmail.com> wrote:
> >
> > #regzbot introduced v6.6.69..v6.6.70
> > #regzbot introduced: ad91a2dacbf8c26a446658cdd55e8324dfeff1e7
> >
> > We hit this regression when updating our guest vm kernel from 6.6.69
> > to 6.6.70 -- bisecting, this problem was introduced in
> > ad91a2dacbf8c26a446658cdd55e8324dfeff1e7 -- net: restrict SO_REUSEPORT
> > to inet sockets
> >
> > We're getting a timeout when trying to connect to the vsocket in the
> > guest VM when launching a kata containers 3.10.1 agent which
> > unsurprisingly ... uses a vsocket to communicate back to the host.
> >
> > We updated this commit and added an additional sk_is_vsock check and
> > recompiled and this works correctly for us.
> > - if (valbool && !sk_is_inet(sk))
> > + if (valbool && !(sk_is_inet(sk) || sk_is_vsock(sk)))
> >
> > My understanding is limited here so I've added Stefano as he is likely
> > to better understand what makes sense here.
>
> Thanks for adding me, do you have a reproducer here?
>
> AFAIK in AF_VSOCK we never supported SO_REUSEPORT, so it seems strange to me.
>
> I understand that the patch you refer to actually changes the behavior
> of setsockopt(..., SO_REUSEPORT, ...) on an AF_VSOCK socket, where it
> used to return successfully before that change, but now returns an
> error, but subsequent binds should have still failed even without this
> patch.
>
> Do you actually use the SO_REUSEPORT feature on AF_VSOCK?
>
> If so, I need to better understand if the core socket does anything,
> but as I recall AF_VSOCK allocates ports internally, so I don't think
> multiple binds on the same port have ever been supported.

I just tried on an old kernel without the patch applied, and I confirm
that SO_REUSEPORT was not supported also if the setsockopt() was
successful.

I run the following snippet on 2 shell, on the first one everything
fine, but on the second the bind() fails in this way:

$ uname -r
6.10.11-200.fc40.x86_64
$ python3
>>> import socket
>>> import os
>>> s = socket.socket(socket.AF_VSOCK, socket.SOCK_STREAM)
>>> s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
>>> s.bind((socket.VMADDR_CID_ANY, 4242))
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
OSError: [Errno 98] Address already in use


With the patch applied, the setsockopt() fails immediately, but the
bind() behavior is the same (fails only on the second):

$ uname -r
6.12.9-200.fc41.x86_64
$ python3
>>> import socket
>>> import os
>>> s = socket.socket(socket.AF_VSOCK, socket.SOCK_STREAM)
>>> s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
Traceback (most recent call last):
  File "<python-input-3>", line 1, in <module>
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
    ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
OSError: [Errno 95] Operation not supported

So, IMHO the patch is correct since AF_VSOCK never really supported
SO_REUSEPORT, so better to fail early.

BTW I'm not sure what is happening on your side.
Could it be a problem in your code that uses SO_REUSEPORT
indiscriminately on AF_VSOCK, even though you then never bind on the
same port again?

Thanks,
Stefano

