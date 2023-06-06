Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52411125CC
	for <regressions@lists.linux.dev>; Tue,  6 Jun 2023 18:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686076662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BagLP1pdl2jLuypkWVwHAzF6SlgrIs6dDABtbPpb9hk=;
	b=QOntfnwsCkVpExwy9PSfEQSmy9F+Obhx3tTmy5yZDNpckQEho0ZBGCY4FF9RZh//GQHK9Q
	t1FPHH21pOYqOEFb8zIIBmLcUD+TGY28z7k/cuLoA+KcB+wwrITHE7NlUNCyUtVkdEyV4J
	YbFWNDvCDD0Vbw1+fyXUDRFaCpwCDJ4=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-TMvuACxsMWWd_3aAqNWPaA-1; Tue, 06 Jun 2023 14:37:38 -0400
X-MC-Unique: TMvuACxsMWWd_3aAqNWPaA-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-565d1b86a63so106279417b3.0
        for <regressions@lists.linux.dev>; Tue, 06 Jun 2023 11:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686076658; x=1688668658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BagLP1pdl2jLuypkWVwHAzF6SlgrIs6dDABtbPpb9hk=;
        b=fstB+TuVI+lItmNQqxZsBkShGeGl9tqRNLxrU3GOekvDTwA4pNhrjY8IwTPqaPEITo
         ld6brBnvsLMzU3CwI2DZucNJKNwNFs91vhR2ETEHWPtum3Gz9SgenMIknToPVZoQboyn
         2xBn3mJXBinq//goZLX/w43T87pF98oJYyOYY2UJdUSV17JyOQ6AzM3gXqs0t3A5EgfB
         Pc4SBfwi7ScNlwnGKkdboUDZf72SAYCHRSjP6wq5Av0qmZjfgiZSr/3UdV1anw4tC5kQ
         xjFSbq/kYkJQ4dQ9HdC6oTVC1wvmZJTnOMihxvfbF9S9QZyRnlzYwk6NhZMsH+UgqpHg
         lmUA==
X-Gm-Message-State: AC+VfDz5dYn0v69HPKva3hb/GHzUB57ud+5lCO+xsJHup7JfojpVNHz5
	q0vk7e0lmpAGcIjqyG9WEMEnDyxM/UUnRnKdsgRnqDqtgLLEAMgNBEfWFqKYZ/hmJ5+WPs4OZYw
	Hmo58zrhDM1D69EdokOLhwr+i1QGUOZpBwyMO5w5Zy35PxgjNAw==
X-Received: by 2002:a81:7382:0:b0:568:f981:637d with SMTP id o124-20020a817382000000b00568f981637dmr3775415ywc.37.1686076658076;
        Tue, 06 Jun 2023 11:37:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7re4FVFZTSXw0hMl7FSwnSL12EtIwUHuIPlxIP2pUQnRK71jUCqnCDz3KKQ+Huu9Ly1XlLpLXQJfYDMdJbE1Y=
X-Received: by 2002:a81:7382:0:b0:568:f981:637d with SMTP id
 o124-20020a817382000000b00568f981637dmr3775388ywc.37.1686076657821; Tue, 06
 Jun 2023 11:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230531082428.21763-1-hadess@hadess.net> <nycvar.YFH.7.76.2305311606160.29760@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2306031440380.29760@cbobk.fhfr.pm> <15bb2507-a145-7f1b-8e84-58aeb02484b9@leemhuis.info>
 <nycvar.YFH.7.76.2306061527080.29760@cbobk.fhfr.pm> <42b6e582-f642-7521-135a-449140984211@leemhuis.info>
In-Reply-To: <42b6e582-f642-7521-135a-449140984211@leemhuis.info>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Tue, 6 Jun 2023 20:37:26 +0200
Message-ID: <CAO-hwJL3RcfOxQvhqDFTwgfY=oAJqR5rsHmO5qDVwNUEh3K58Q@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: Handle timeout differently from busy
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Jiri Kosina <jikos@kernel.org>, Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"Peter F . Patel-Schneider" <pfpschneider@gmail.com>, =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
	Nestor Lopez Casado <nlopezcasad@logitech.com>, Mark Lord <mlord@pobox.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 6, 2023 at 8:18=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
>
>
> On 06.06.23 15:27, Jiri Kosina wrote:
> > On Mon, 5 Jun 2023, Linux regression tracking (Thorsten Leemhuis) wrote=
:
> >
> >>>>> If an attempt at contacting a receiver or a device fails because th=
e
> >>>>> receiver or device never responds, don't restart the communication,=
 only
> >>>>> restart it if the receiver or device answers that it's busy, as ori=
ginally
> >>>>> intended.
> >>>>>
> >>>>> This was the behaviour on communication timeout before commit 586e8=
fede795
> >>>>> ("HID: logitech-hidpp: Retry commands when device is busy").
> >>>>>
> >>>>> This fixes some overly long waits in a critical path on boot, when
> >>>>> checking whether the device is connected by getting its HID++ versi=
on.
> >>>>>
> >>>>> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> >>>>> Suggested-by: Mark Lord <mlord@pobox.com>
> >>>>> Fixes: 586e8fede795 ("HID: logitech-hidpp: Retry commands when devi=
ce is busy")
> >>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217412
> >>> [...]
> >>>>
> >>>> I have applied this even before getting confirmation from the report=
ers in
> >>>> bugzilla, as it's the right thing to do anyway.
> >>>
> >>> Unfortunately it doesn't seem to cure the reported issue (while rever=
ting
> >>> 586e8fede79 does):
> >>
> >> BTW, remind me again: was fixing this by reverting 586e8fede79 for now=
 a
> >> option? I guess it's not, but if I'm wrong I wonder if that might at
> >> this point be the best way forward.
> >
> > This should now all be fixed by
> >
> >     https://git.kernel.org/linus/7c28afd5512e371773dbb2bf95a31ed5625651=
d9
>
> Jiri, Benjamin, many many thx for working on this.
>
> Hmmm. No CC: <stable... tag.
>
> Should we ask Greg to pick this up for 6.3 now, or better wait a few
> days? He currently already has 6199d23c91ce ("HID: logitech-hidpp:
> Handle timeout differently from busy") in his queue for the next 6.3.y
> release.

Well, the Fixes: tag supposedly is enough to let the stable folks to
pick it up. But you are right, let's Cc Greg for a quicker inclusion
in the 6.3 tree.

Greg, would you mind adding the commit above (7c28afd5512e37) onto the
6.3 stable queue? Thanks!

Cheers,
Benjamin

>
> Ciao, Thorsten
>
> P.S.: If the answer is along the lines of "let's backport this quickly",
> please consider directly CCing Greg.
>

