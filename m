Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3038F18C21
	for <regressions@lists.linux.dev>; Wed, 21 Jun 2023 15:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687360555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FRgTCG4Y3quFGRPEFw6nH4nOnDuylcRDDOyFLT5gkg=;
	b=GOArT3Ny4Al5NGPnm05cdI6cyoZniaUUYlzkRhtXivX7VHiwIlblN3yBdTvEtCZcMTpVBZ
	abB7gx+xHI/M2NhMUbHOF8f5RWy1C0O92UjKXeaQLuTbZRV/6lxrr/k/G/B43cYm/FHHaM
	JtCXiUJ98R6FjpGgeVHuWwelUSQ1p54=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-3FKztInSPaOT-HYnqJkqUA-1; Wed, 21 Jun 2023 11:15:51 -0400
X-MC-Unique: 3FKztInSPaOT-HYnqJkqUA-1
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-bfe92598ffaso1484229276.0
        for <regressions@lists.linux.dev>; Wed, 21 Jun 2023 08:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687360226; x=1689952226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FRgTCG4Y3quFGRPEFw6nH4nOnDuylcRDDOyFLT5gkg=;
        b=GgSz/sV/dQI4r+GtwS4iI6je+CmMW7MsR/32s98JztR3E1Sy4ybOGjWZKNSd4W7wjR
         1mH+htCKSOZlOF5lUYJqBMvBxD13Iib0KeWpWlI1SVWN8CbKjQksa51e9pkLhhkOO8GA
         H1EBQZBV3MbtaDukoGuzwrzWArMdEv4mLmSmT7pYyXByAxOmJT5BKuga9bxyumD2UD/L
         cxANw8T5RU+9MHCgTTTA6hSQnU+U7ZYWtP5lwv+eM8HsvLHlUfRPQ+ava9oUfwijJpz/
         GFW7qVLdBg9PiyVGOzhSJoFXaMkAF6D+fX7QOgFklQLoXexY6KmP8FtQYoAnZd/uON3v
         KuCw==
X-Gm-Message-State: AC+VfDwViSCY0JNN26CrGmUtDvbeRSllX/+LyZvYi/i8SdaVAQiqc6i/
	sL1TIMxEbpewYGNcTo6S1CJIjepdAqn/v/wZH7wGXvXIco/RxTIRE32hMtSz2trJslqNUUzE5D2
	JgR1syrqfOk0ZcoqoMYpYJqWxPogHbVouPG6ssnlWfwBp16/kxA==
X-Received: by 2002:a25:ad56:0:b0:beb:39a9:2be6 with SMTP id l22-20020a25ad56000000b00beb39a92be6mr11024990ybe.51.1687360226141;
        Wed, 21 Jun 2023 08:10:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ERQQsUqi5FzWoigxI2kl3qagbhHSk5UQ6FecX1jCfga89rhypFQmWtKSMcLTXHfnYobhUxhB0ZS1nDa7S9ek=
X-Received: by 2002:a25:ad56:0:b0:beb:39a9:2be6 with SMTP id
 l22-20020a25ad56000000b00beb39a92be6mr11024969ybe.51.1687360225908; Wed, 21
 Jun 2023 08:10:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230531082428.21763-1-hadess@hadess.net> <nycvar.YFH.7.76.2305311606160.29760@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2306031440380.29760@cbobk.fhfr.pm> <15bb2507-a145-7f1b-8e84-58aeb02484b9@leemhuis.info>
 <nycvar.YFH.7.76.2306061527080.29760@cbobk.fhfr.pm> <42b6e582-f642-7521-135a-449140984211@leemhuis.info>
 <53903462-2552-b707-3831-cad3ef873b0d@leemhuis.info> <aa0e3371-dad1-3296-18fb-1957b92aa4d1@pobox.com>
 <ed27ca39-3609-695c-9f04-65c0bad343c2@leemhuis.info>
In-Reply-To: <ed27ca39-3609-695c-9f04-65c0bad343c2@leemhuis.info>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Wed, 21 Jun 2023 17:10:14 +0200
Message-ID: <CAO-hwJLyA==_Wkyi-gTn-FOAAne2JKDfNMY2EaELoFDo5Qbe-A@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: Handle timeout differently from busy
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Mark Lord <mlord@pobox.com>, Jiri Kosina <jikos@kernel.org>, 
	Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"Peter F . Patel-Schneider" <pfpschneider@gmail.com>, =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
	Nestor Lopez Casado <nlopezcasad@logitech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 4:09=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 15.06.23 13:24, Mark Lord wrote:
> > On 2023-06-15 03:24 AM, Linux regression tracking (Thorsten Leemhuis) w=
rote:
> > ...
> >> https://bugzilla.kernel.org/show_bug.cgi?id=3D217412
> >>
> >> --- Comment #47 from Mark Blakeney ---
> >> @Juha, kernel 6.3.7 adds the 2 patches intended to fix this bug and th=
e
> >> startup delay is now gone. However, I have had 2 cases over the last 5
> >> days in which I have been running 6.3.7 where my mouse fails to be
> >> detected at all after startup. I have to pull the Logitech receiver
> >> out/in to get the mouse working. Never seen this issue before so I
> >> suspect the patches are not right.
> >> ```
> >
> > I too have had that happen with recent kernels,
>
> Ahh, good to know!
>
> > but have not yet put
> > a finger to a specific version or cause.
> >
> > Just toggling the power button on the wireless mouse is enough for
> > it to "re-appear".
> >
> > The 5.4.xx kernels never had this issue.  I went straight from those
> > to the 6.3.xx ones, where it does happen sometimes, both with and witho=
ut
> > the recent "delay" fixes.
>
> From Mark Blakeney it sounded a lot like this is something that started
> with 6.3, but would be good to confirm. Which brings me to the reason
> why I write this mail:
>
> Is anyone still working on this? There was radio silence already for a
> week now. Okay, it's not really urgent, but I guess this should not fall
> through the cracks.

Sorry for the radio silence. I worked on hidpp yesterday and submitted
a new patch for a problem that was overlooked in the previous fixes:
https://lore.kernel.org/linux-input/20230621-logitech-fixes-v1-1-32e70933c0=
b0@redhat.com/

The loop was not properly initializing all its local states, meaning
that when we encountered a "please retry" from the device, we could
never do the actual retry and returned a different error than in the
6.2 series.

Would anyone give it a shot?

Cheers,
Benjamin

>
> Bastian, are you back?
>
> If not: Does anyone know if there is hope that Bastien will be able to
> look into this in the not too far future?
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>

