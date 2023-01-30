Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37C1366
	for <regressions@lists.linux.dev>; Mon, 30 Jan 2023 06:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675060436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GeA8p7IElQZmWDuS7ETU1wAXtU+jk4NtO9TFABoYpQo=;
	b=SJiVvaoaZ1ghCoq6nsL0eVAmUNjCGQ7za5tnj4pAaAcoaimyrbWzufJRgAyNgLqe7llBsC
	A37m7MsRT+aRhZ7C6Dtqc3WyAj2M/mptkDH1jfEtF9yFrAcs9J4ofHI/uicTAPDZAhwIoH
	057fxdl4KGQ0Sgw7Op7oxwZGKt/9PDY=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-343-XJa5QZ11PIuzsNAa3g9V2w-1; Mon, 30 Jan 2023 01:33:55 -0500
X-MC-Unique: XJa5QZ11PIuzsNAa3g9V2w-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-517f8be4b00so6867267b3.3
        for <regressions@lists.linux.dev>; Sun, 29 Jan 2023 22:33:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeA8p7IElQZmWDuS7ETU1wAXtU+jk4NtO9TFABoYpQo=;
        b=2xOMwjKliDa7Y92TuAPua0bQFYLr74E8tzB9eVvZaJxgqdaaYMgaAv6Pio2XmvBSRI
         dHORlwSjdgjpaBCeiyYgzlhBq+4i6f7TtfB+MYDrlxO45MG2eRWiAqA2Oa8rNXuI29qt
         OyCs3/OUGNUhKaLeTK2bd0szg7dkj4ZA05aFIpsukAvCYV1v7pEjnOVxR1YoeoRk9BLe
         Ne9K2teY5QwB4FaQJocK/R6hoPiLe3c4UqvloqiNySHNESKA7kt43yRB+QSaEoDdzc/y
         7LIP4deqMy0HQoWiJPiFzqOO5ZrokfUUZaQShp0M6rXfuoOwbvGg8FFYU4QpxiEQl1QK
         xwQw==
X-Gm-Message-State: AO0yUKUvjocoLvi/EQA0f0FpNFTBCO50+e/Ql4+B7R9B8xBA/KunjDr0
	kBgp02WYaHoOfckqtVOqldIPMgm7wyePBj2dexugfZ7hblmlkHmRR8u3T88INWZcQRvOIr1QXeN
	eUxMGXAASNe/SuyIeipnqOfgcKZIBaRBU6xmbXYA=
X-Received: by 2002:a0d:eb82:0:b0:507:4ba0:f1bc with SMTP id u124-20020a0deb82000000b005074ba0f1bcmr2518438ywe.293.1675060434680;
        Sun, 29 Jan 2023 22:33:54 -0800 (PST)
X-Google-Smtp-Source: AK7set9UpeZ9osWXs+yNLWMCxE6HsbfBShnUYYIAZH3CjZZ3A9MgSScBcIPRH1lp9Xgk6BmkOvRcGwOgiixAGdhbeGM=
X-Received: by 2002:a0d:eb82:0:b0:507:4ba0:f1bc with SMTP id
 u124-20020a0deb82000000b005074ba0f1bcmr2518433ywe.293.1675060434485; Sun, 29
 Jan 2023 22:33:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJD_bPJ1VYTSQvogui4S9xWn9jQzQq8JRXOzXmus+qoRyrybOA@mail.gmail.com>
 <Y9Vg26wjGfkCicYv@kroah.com> <CAJD_bPLkkgbk+GO66Ec9RmiW6MfYrG32WP75oLzXsz2+rpREWg@mail.gmail.com>
In-Reply-To: <CAJD_bPLkkgbk+GO66Ec9RmiW6MfYrG32WP75oLzXsz2+rpREWg@mail.gmail.com>
From: Jason Montleon <jmontleo@redhat.com>
Date: Mon, 30 Jan 2023 01:33:43 -0500
Message-ID: <CAJD_bPK=m0mX8_Qq=6iwD8sL8AkR99PEzBbE3RcSaJmxuJmW6g@mail.gmail.com>
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
To: Greg KH <gregkh@linuxfoundation.org>
Cc: casaxa@gmail.com, cezary.rojewski@intel.com, lma@semihalf.com, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, regressions@lists.linux.dev, 
	stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

I ran a bisect back further while patching in
f2bd1c5ae2cb0cf9525c9bffc0038c12dd7e1338.

When doing this, 3fd63658caed9494cca1d4789a66d3d2def2a0ab appears to
be the commit in 6.1+ that it's interacting badly with. I couldn't
revert this cleanly without reverting a handful of other commits, but
doing so also results in working audio with 6.1.8 while leaving in
f2bd1c5ae2cb.
(e9441675edc1, 1cda83e42bf6, 37882100cd06, 0e213813df02, fb5987844808
were the others removed)

Hopefully that helps narrow it down for someone more familiar,
otherwise I'll keep digging.


On Sat, Jan 28, 2023 at 7:23 PM Jason Montleon <jmontleo@redhat.com> wrote:
>
> I have confirmed 6.2-rc5 is also broken and removing the same commit
> causes it to work again.
>
> Thank you,
> Jason Montleon
>
> On Sat, Jan 28, 2023 at 12:52 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Sat, Jan 28, 2023 at 12:09:54PM -0500, Jason Montleon wrote:
> > > I did a bisect which implicated
> > > f2bd1c5ae2cb0cf9525c9bffc0038c12dd7e1338 as the first bad commit.
> > >
> > > Reverting this commit on 6.1.8 gives me working sound again.
> > >
> > > I'm not clear why this is breaking 6.1.x since it appears to be in
> > > 6.0.18 (7494e2e6c55e), which was the last working package in Fedora
> > > for the 6.0 line. Maybe something else didn't make it into 6.1?
> > >
> > >
> >
> > So this is also broken in Linus's tree (6.2-rc5?)
> >
> > thanks,
> >
> > greg k-h
> >
>
>
> --
> Jason Montleon        | email: jmontleo@redhat.com
> Red Hat, Inc.         | gpg key: 0x069E3022
> Cell: 508-496-0663    | irc: jmontleo / jmontleon



--
Jason Montleon        | email: jmontleo@redhat.com
Red Hat, Inc.         | gpg key: 0x069E3022
Cell: 508-496-0663    | irc: jmontleo / jmontleon

