Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D97F746A
	for <regressions@lists.linux.dev>; Thu, 12 Jan 2023 13:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673530039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5SwCX7Huvx8oV/VYW9LER1EPQspAcx1PfzypYxIzJto=;
	b=T4czuQ6gvQLZ+C5fy+SDvTWIoi9+NBVqrbnAKKUgDszZIcA6zbvesHiYz3KIxcH5XRtG8d
	HvMBdpk7o4xqeDIDqwZdoM+Tvh99GdxVi7Bh6VBn7rsCqAvU0EXm6EdPUK1UDBPljNLZhI
	GsfmTe3lucumkIdKagD63rEt/aAuxh0=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-189-9nepBmj4MQ-IbtI_D570_g-1; Thu, 12 Jan 2023 08:27:18 -0500
X-MC-Unique: 9nepBmj4MQ-IbtI_D570_g-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-4d952e13250so24170767b3.5
        for <regressions@lists.linux.dev>; Thu, 12 Jan 2023 05:27:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5SwCX7Huvx8oV/VYW9LER1EPQspAcx1PfzypYxIzJto=;
        b=2jIX2i/5O4K5Z3ehmM1AnhjNlxDL1YUgGp7YYPKOYeo43ENClxkM7t2/eodG+ymj21
         F14m1bSIEUCUTQKOmRSczyyxUey4+pH6TggvOt/fCqQHglzxr/+7LVLGAgfpZX5Le3H2
         hcSbVMpNp2sfXMpYtHct2JHsnUpX69fwtH35Oiy+/gT9v6qQ+c3bWQR6/qTrzU6wFifw
         XmwCP/fCx4wh4vOry4PQDpoqRLwUP8yqC2wAMKlkLYhBjby7ojrxXI5KAZtqShSrTCDv
         KdtVAPWz/Bz6GM1sahxBVdBo3SCrfmZ6iIagRpvt7qd+OFpchTGRUcZRrP/UQDYzalzu
         Di+A==
X-Gm-Message-State: AFqh2koeROY2w0h8H0WlHgh9CwGqT9GnXnsVJNDpQZP9suAFQCMsoGa9
	C5saGHqmEQIvYKFZelrqBXh32OiwHDN8OJMsNc2qDAkHx/wohhv13NskP77oBoz1+9pA1ou8MYN
	yIHCAnZ9awkcl6xfN2WUnSjs6jMYKMrMzIh02A6Y=
X-Received: by 2002:a5b:786:0:b0:6ea:e952:4d4a with SMTP id b6-20020a5b0786000000b006eae9524d4amr6296896ybq.120.1673530037566;
        Thu, 12 Jan 2023 05:27:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtyOluOky0VeYg6LB6YQwZwMb0OVdTOzhBlpfKzH0UseRfHNA97+68mSuoqnzkDPCWFly5dk2mXj+jGqmluQZU=
X-Received: by 2002:a5b:786:0:b0:6ea:e952:4d4a with SMTP id
 b6-20020a5b0786000000b006eae9524d4amr6296892ybq.120.1673530037385; Thu, 12
 Jan 2023 05:27:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFsF8vL4CGFzWMb38_XviiEgxoKX0GYup=JiUFXUOmagdk9CRg@mail.gmail.com>
 <Y7/xwk9lmaNwrDwo@kroah.com>
In-Reply-To: <Y7/xwk9lmaNwrDwo@kroah.com>
From: Paul Holzinger <pholzing@redhat.com>
Date: Thu, 12 Jan 2023 14:27:06 +0100
Message-ID: <CAFsF8vJ3wS-Yoy9tNZD2ZESevGenvYKqieD4F8+UztRsrJ=png@mail.gmail.com>
Subject: Re: [Regression] 6.0.16-6.0.18 kernel no longer return EADDRINUSE
 from bind
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	netdev@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Nothing particular is keeping me on this kernel, it is currently
shipped in fedora.
I assume fedora will update to 6.1 as usual so updating is not a problem for me.

I wasn't sure how long the 6.0 series gets updates so I decided to
report it here. If it is EOL that is fine for me.

Thanks,
Paul


On Thu, Jan 12, 2023 at 12:50 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jan 11, 2023 at 04:52:21PM +0100, Paul Holzinger wrote:
> > Hi all,
> >
> > Since updating to 6.0.16 the bind() system call no longer fails with
> > EADDRINUSE when the address is already in use.
> > Instead bind() returns 1 in such a case, which is not a valid return
> > value for this system call.
> >
> > It works with the 6.0.15 kernel and earlier, 6.1.4 and 6.2-rc3 also
> > seem to work.
> >
> > Fedora bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2159066
> >
> > To reproduce you can just run `ncat -l 5000` two times, the second one
> > should fail. However it just uses a random port instead.
> >
> > As far as I can tell this problem is caused by
> > https://lore.kernel.org/stable/20221228144337.512799851@linuxfoundation.org/
> > which did not backport commit 7a7160edf1bf properly.
> > The line `int ret = -EADDRINUSE, port = snum, l3mdev;` is missing in
> > net/ipv4/inet_connection_sock.c.
> > This is the working 6.1 patch:
> > https://lore.kernel.org/all/20221228144339.969733443@linuxfoundation.org/
>
> As 6.0.y is now end-of-life, is there anything keeping you on that
> kernel tree?  If you send a fix-up patch for this, I'll gladly apply it
> and push out one more 6.0 release with it.
>
> thanks,
> g
> reg k-h
>

