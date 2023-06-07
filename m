Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567FB7488
	for <regressions@lists.linux.dev>; Wed,  7 Jun 2023 10:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686132456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EvYvWP/dmRw7dcP93qz9byoXzFOKtvhvKrmHdFETiw8=;
	b=hFQt+zzV9g18wi7vRgxAXej8rHQgDFhUzY77vbvOPRLEz56WOrlDPRVfeo+UvIURXic66D
	+taC+Cvz4IdSQM2kFmUcteJFtFSmAPi5jPL4h3O90OgPtwwAGp1KQbUabB4tRgtKgMrLQN
	dsHFISDKaa7yJP5Kl5grHfQnTvJ3el0=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-BxImQf8cN-SQMQIIDcVrpQ-1; Wed, 07 Jun 2023 06:07:33 -0400
X-MC-Unique: BxImQf8cN-SQMQIIDcVrpQ-1
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-ba82ed6e450so10364578276.2
        for <regressions@lists.linux.dev>; Wed, 07 Jun 2023 03:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686132452; x=1688724452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvYvWP/dmRw7dcP93qz9byoXzFOKtvhvKrmHdFETiw8=;
        b=RwlvV1/zIeRsqa0HUd7PsJ+lIrStkc+HQddwnfkzRpZO2qkg3ehx+aNyp+QpLs5rUa
         OyoaS0vrD1ufZXFztJc2kPlYHLyk3ig94Qf75LelmOPROgzXbLPSjytETtHxCRhWUTOA
         jo+ef/j594umkTNJTjlsWy/DOtPVQMoGR1M06RXGjyVB57ASmAPLpCt8bPEVJ276GJaY
         hI0vb2+SKn30qUpL7PosGlQ2onfhnI3sA9lk+z8Kw7yPljgaYv0tkY0kRc8uO4bUNGVJ
         U3nTyUj/rIPJCEV0vBBYtrT57K/Ju1nidi9HbSpCLXLG70J+AnKca7SfA27+zl9kOBNT
         SRzQ==
X-Gm-Message-State: AC+VfDwKDx2uvK4PWa81LBhsJ+Ojd2zYabOuz9xNFCopYc8yncdUNbZ9
	OT1Z0Wglmstp3g5Yauxk2juI1a+qpXdfpAVO140F97gwvwwkJniFqjhjpTSEHGvBESg7ZtWzyq0
	bY9qxRSOLDM7cDgNAWwGnl6V/jNzv4ABbzWjJ79Y=
X-Received: by 2002:a25:b90e:0:b0:b9e:5055:ce7e with SMTP id x14-20020a25b90e000000b00b9e5055ce7emr5436819ybj.55.1686132452439;
        Wed, 07 Jun 2023 03:07:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qr+y7gbTb42/JGVX0Drco0Mo+DgGu0Fu1MKsKD0cM9YVxkXtnAWRmjd4kaGRA2Sy+E6o6RFSwWPGuilreMio=
X-Received: by 2002:a25:b90e:0:b0:b9e:5055:ce7e with SMTP id
 x14-20020a25b90e000000b00b9e5055ce7emr5436799ybj.55.1686132452198; Wed, 07
 Jun 2023 03:07:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230531082428.21763-1-hadess@hadess.net> <nycvar.YFH.7.76.2305311606160.29760@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2306031440380.29760@cbobk.fhfr.pm> <15bb2507-a145-7f1b-8e84-58aeb02484b9@leemhuis.info>
 <nycvar.YFH.7.76.2306061527080.29760@cbobk.fhfr.pm> <42b6e582-f642-7521-135a-449140984211@leemhuis.info>
 <CAO-hwJL3RcfOxQvhqDFTwgfY=oAJqR5rsHmO5qDVwNUEh3K58Q@mail.gmail.com> <2023060703-colony-shakily-3514@gregkh>
In-Reply-To: <2023060703-colony-shakily-3514@gregkh>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Wed, 7 Jun 2023 12:07:21 +0200
Message-ID: <CAO-hwJJxZuXP=kgTxEc-F+OtcFsR59iGE3Vw3ptZs48+MotNtA@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: Handle timeout differently from busy
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Jiri Kosina <jikos@kernel.org>, 
	Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"Peter F . Patel-Schneider" <pfpschneider@gmail.com>, =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
	Nestor Lopez Casado <nlopezcasad@logitech.com>, Mark Lord <mlord@pobox.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 7, 2023 at 11:46=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jun 06, 2023 at 08:37:26PM +0200, Benjamin Tissoires wrote:
> > On Tue, Jun 6, 2023 at 8:18=E2=80=AFPM Linux regression tracking (Thors=
ten
> > Leemhuis) <regressions@leemhuis.info> wrote:
> > >
> > >
> > >
> > > On 06.06.23 15:27, Jiri Kosina wrote:
> > > > On Mon, 5 Jun 2023, Linux regression tracking (Thorsten Leemhuis) w=
rote:
> > > >
> > > >>>>> If an attempt at contacting a receiver or a device fails becaus=
e the
> > > >>>>> receiver or device never responds, don't restart the communicat=
ion, only
> > > >>>>> restart it if the receiver or device answers that it's busy, as=
 originally
> > > >>>>> intended.
> > > >>>>>
> > > >>>>> This was the behaviour on communication timeout before commit 5=
86e8fede795
> > > >>>>> ("HID: logitech-hidpp: Retry commands when device is busy").
> > > >>>>>
> > > >>>>> This fixes some overly long waits in a critical path on boot, w=
hen
> > > >>>>> checking whether the device is connected by getting its HID++ v=
ersion.
> > > >>>>>
> > > >>>>> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > > >>>>> Suggested-by: Mark Lord <mlord@pobox.com>
> > > >>>>> Fixes: 586e8fede795 ("HID: logitech-hidpp: Retry commands when =
device is busy")
> > > >>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217412
> > > >>> [...]
> > > >>>>
> > > >>>> I have applied this even before getting confirmation from the re=
porters in
> > > >>>> bugzilla, as it's the right thing to do anyway.
> > > >>>
> > > >>> Unfortunately it doesn't seem to cure the reported issue (while r=
everting
> > > >>> 586e8fede79 does):
> > > >>
> > > >> BTW, remind me again: was fixing this by reverting 586e8fede79 for=
 now a
> > > >> option? I guess it's not, but if I'm wrong I wonder if that might =
at
> > > >> this point be the best way forward.
> > > >
> > > > This should now all be fixed by
> > > >
> > > >     https://git.kernel.org/linus/7c28afd5512e371773dbb2bf95a31ed562=
5651d9
> > >
> > > Jiri, Benjamin, many many thx for working on this.
> > >
> > > Hmmm. No CC: <stable... tag.
> > >
> > > Should we ask Greg to pick this up for 6.3 now, or better wait a few
> > > days? He currently already has 6199d23c91ce ("HID: logitech-hidpp:
> > > Handle timeout differently from busy") in his queue for the next 6.3.=
y
> > > release.
> >
> > Well, the Fixes: tag supposedly is enough to let the stable folks to
> > pick it up.
>
> No, not at all, please see:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.ht=
ml
> for how to do this properly.
>
> (hint, we need a cc: stable@ in the signed-off-by area.)
>
> We only pick up stuff with "Fixes:" semi-often, sometimes never,
> depending on our workload.  Never rely on that.

Oh right. Given that those patches eventually end up in stable sooner
or later I made the shortcut in my head. Thanks for correcting that :)

>
> It's been this way for 18+ years now, nothing new :)
>
> > But you are right, let's Cc Greg for a quicker inclusion
> > in the 6.3 tree.
> >
> > Greg, would you mind adding the commit above (7c28afd5512e37) onto the
> > 6.3 stable queue? Thanks!
>
> Now queued up, thanks.

Great thanks!

Cheers,
Benjamin

