Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B654629CA
	for <regressions@lists.linux.dev>; Wed, 26 Jan 2022 13:43:44 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id y23so19198593oia.13
        for <regressions@lists.linux.dev>; Wed, 26 Jan 2022 05:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rr+l+3YPPwRTSEbBSweFMi0OELn7GiUo4k2tlyEVHMg=;
        b=gOIJcZXaXXQMP5TQQb3+a511e4PtdsQ+mmJSG5HyHtCG4zEeGZY46QtERskNdNO4AG
         amJ6cGABSzyoPLUjtVFjmBmvU5lNmEMjgJPfcRVgSD9MsMzNyqYu2jKO4EKQo3q+IXc4
         Goq+hZuKOFJV1atAg36DjpuXI4TnF12a5XCoqth0GTAq0sqbzrGE8nIKUqxZ/muFOdUy
         gDDvUxPWo70Xu6uuVQluRKNKsNBCnrRaFY4M+6CXlQNRkY3sSu7GnCshRm1+7/zuZgQF
         2qGOiwD6o+gysO7A1Cxz5aEKKEa/WC0y8avnGz6rNA6KPsvyD99/wqxdDAqNDZaqkQ8P
         exLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rr+l+3YPPwRTSEbBSweFMi0OELn7GiUo4k2tlyEVHMg=;
        b=xSq5qiv8oeHNK/bzBiayXmSgtJh2thuInYAHnkJu+KnhHhBc3PnFeSusR5Q+mCweFL
         O9pbZ7sFfARZ0t2dj0oG6fq+qZPJXsVF5hys2UbIRmFwmLbio3P1QhW0sbeQLMS7wETh
         m2RP4cfBN04HcouUltTr0IKZdIYkpbKo1AEvwBeBWEwbsSI1E/Q+d4WonsZl1sNaYEbn
         lh/98gRQCbmI8eVzYE91TUQCnVJxteen/9aenod84DuJ6XKQAmjtbJ6brt7IbeWl1HiU
         3beTJDhcGmoAY3I/+IuSGjOib5LZUwsIq9zlE4SRS88z6WlHq9GvVKHgZVQzhTIrCwaH
         zseQ==
X-Gm-Message-State: AOAM531D1/0iEIwupRfXLRxU/do7lS3mXGbN5qqtpQeVc8mVIcue3826
	ZKcUSupPCmSWRIfIc+tlFid3agrvKRn5vYJVVOo=
X-Google-Smtp-Source: ABdhPJyqDlDcQjoH9Y85kXP9Ca5OzkgfO8On8e3cfSD141Kj/aycPtJRwaTSnTz10JO/eqXryWZxutuP1pfuv6MAdZ8=
X-Received: by 2002:a05:6808:128f:: with SMTP id a15mr3738643oiw.116.1643204623773;
 Wed, 26 Jan 2022 05:43:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211211183650.12183-1-marcelo.jimenez@gmail.com>
 <3bb113cd-fbf6-6898-6ae3-2f8cb8c64992@leemhuis.info> <YfE8nyH1lW/I8NTV@kroah.com>
 <CACjc_5o9eO5YTVt4jE7v1E9nirCwFMc1=Ub-jXSFCg1_8A2M-A@mail.gmail.com>
In-Reply-To: <CACjc_5o9eO5YTVt4jE7v1E9nirCwFMc1=Ub-jXSFCg1_8A2M-A@mail.gmail.com>
From: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
Date: Wed, 26 Jan 2022 10:43:17 -0300
Message-ID: <CACjc_5pmqLAo5X-Yj6Om9vvktR-0FN5SYgDxn=GvCn-yxcee+w@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: atmel: Revert regression in USB Gadget (atmel_usba_udc)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, linux-arm-kernel@lists.infradead.org, 
	Cristian Birsan <cristian.birsan@microchip.com>, linux-usb@vger.kernel.org, 
	Felipe Balbi <balbi@kernel.org>, Jonas Bonn <jonas@norrbonn.se>
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Wed, Jan 26, 2022 at 9:20 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sun, Dec 12, 2021 at 10:48:14AM +0100, Thorsten Leemhuis wrote:
> > [TLDR: adding this regression to regzbot; most of this mail is compiled
> > from a few templates paragraphs some of you might have seen already.]
> >
> > Hi, this is your Linux kernel regression tracker speaking.
> >
> > Top-posting for once, to make this easy accessible to everyone.
> >
> > Thanks for the report. BTW, if anyone like me wonders what the included
> > patch is about: it afaics is the revert of the patch causing the
> > problem. Anyway:
> >
> > To be sure this issue doesn't fall through the cracks unnoticed, I'm
> > adding it to regzbot, my Linux kernel regression tracking bot:
> >
> > #regzbot ^introduced 70a7f8be8598
> > #regzbot title usb: gadget: atmel: ethernet over USB Gadget not
> > recognized anymore after disconnect and reconnect
> > #regzbot ignore-activity
>
> How do I say "this isn't a regression, it's a broken board
> configuration" and get regzbot to stop tracking this?

I sent the logs to Cristian on Jan, 14, but I don't know if they were
helpful. The problem is pretty much reproducible here. I understand
that from the previously quoted specification sentence, the hardware
must perform VBUS sensing, and this is something I can confirm the
hardware is not capable of. But if Cristian cannot reproduce it in a
different SOC configured without a VBUS sensing pin, I can only hope
Microchip/Atmel will look into the issue. On my side, it seems like I
will have to maintain a patched kernel for this hardware.

So, let's move on.

> thanks,
>
> greg k-h

Best regards,
Marcelo.
