Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FEB23CEF9
	for <regressions@lists.linux.dev>; Tue, 30 Sep 2025 17:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759252863; cv=none; b=JFVXOA2k33h4WWkPP9wAztvXos0K2q7CLbVzsIgfTZQ6CS0he+5Spn1ddJvYtBbr4OXySoZWbIFLMk3ZIdlqYAw/DFEpn2dSKt0Ll+xTcTsxowY1gzDveDTjElyo2czIrj3zXWOwifQqFNGP1H7RwMDM5Kc5KW12HZa3x2wEHVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759252863; c=relaxed/simple;
	bh=AJLtM91/33fmVR/qlQdypVuIczViZNMesjHgSFxWODs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SR4oNBgCVfVbpyOvwrTIx/z5GWwb6tB6KmHPMY4MUMhxgi5Basyn2F8CocnQ0pi5YGTN2d1yx2/Px3kJ1+z3kAqNHxvE7lj1d/NURlAvejJmuDRL8TJMR41cHyZqqDDHE5cQjjyaWP2hCr5dkyzQX581+4wD5dnbf1c1dxcvFhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iwell.eu; spf=pass smtp.mailfrom=iwell.eu; dkim=pass (2048-bit key) header.d=iwell-eu.20230601.gappssmtp.com header.i=@iwell-eu.20230601.gappssmtp.com header.b=dwEisfQ+; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iwell.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwell.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iwell-eu.20230601.gappssmtp.com header.i=@iwell-eu.20230601.gappssmtp.com header.b="dwEisfQ+"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6366b7fd337so1433489a12.0
        for <regressions@lists.linux.dev>; Tue, 30 Sep 2025 10:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwell-eu.20230601.gappssmtp.com; s=20230601; t=1759252859; x=1759857659; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBeBiFZ8CYYNIOcno906wggBnrfnmw8kk5vZNSaIIco=;
        b=dwEisfQ+lOqwdCcTfKOwGliSLNoL7fKnpVT1/qkKvYKTr0BC7oUCscPG5QPVlUonTw
         oRnX1SNFmzGGii6uIJjeMmXs8Zd97QF2OuQdprgoHv6NKe8iQScGzedqgRvQ9fjMSFJN
         vq8ZnlbzOJSq0XYZkX1gsNs1BgqaxS5EzEpomWc9S+ImluNN5YY44BA0gvCH93kv/ZyX
         LJkUQkAwlW68PPxtJzCovNi/p6CxrgUbIVRGg0GW66kYF7k4XSWFbejPaw07a0vJTlkT
         3rsRM6cXfq4H67KXDwbS/rjcQ0gClajruCuVWqDNNxkq3GxjKesaKLI++RXXyCijWOJe
         fHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759252859; x=1759857659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBeBiFZ8CYYNIOcno906wggBnrfnmw8kk5vZNSaIIco=;
        b=EJ2K1hheyuwKAmKAQ6afqbUOXjhdnQjxulGEtdApasUcxTfHibMIDV9LV3JwO0HbjS
         LskGbPlhI19tOdBa3uoP/Y4WBe0LW9PwTSZeaNH8Bt22Q9Fo+7Aku5Ud16XtznhVtC3t
         sGf9zqH8l2rUUXW9D82RWcuJHLrRPJX6QyPXW8Oc8x0/DJLhfkBzW8/clU2bxIHxnTLg
         fpMPNhwHb4NhKfKQAcvXtB1AaTndgQVUjrArcHdENRa6Vr8C3DMvsU2DU9mJSU0DTu7A
         mGm19QnQaLaLh679tTcnmB2WT2IFBJcqaH5LQNcpJNkGXyNv3WfBbafZnz3V6aCAr6Ps
         rO+g==
X-Forwarded-Encrypted: i=1; AJvYcCWROylzHuozCsC/tdqLF4A5Wl8CNI8Bda3fXB7APuSCQaCP0z2hse8B21IwqJ+X8BXgNpoh3onxa/8xBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAkQpnb8eUo+4JoT3ykUs7+R+/m9UWXJ+9nWq/7sb1UKVwhKCh
	Sr3L1BIFXWIRfCiwdr/Yno7ZCpvbBrSEnFbGRBNP8mr6bptu6KJphOQ3Aj34Nc8ujeaR2xrq6/Q
	tdHKAyn13Kq18lyadAxg0iYyIUmAP2+GFBMGv3TkxvRKSQ19xgzPE6YM=
X-Gm-Gg: ASbGncvqcB5wQ1BIt6fJu1/97RgRur3Gth/XHJGBTAjzuEU7gp1lqAwDFg7Ac+uEHjN
	W5YZ6PViqx8p8kvaU3bWk+iNT7tzcrt7+HYgSNvWpmJjoLHXskWIJLBzTcfUfp1YIYbPCCnsLoD
	FC3YIneZQRzJ6346jpVTIFaQOyHjj/gOlv8cpggqTMbgoDd7zobovB+H9gJAJ2bnnwoGAmLl18A
	0PuAOcGh0g/+fPFBn8wXAkKSO5I7crC
X-Google-Smtp-Source: AGHT+IF6gmWMMmnvd8SXAqteiQRvavbIiqTU4ziQkpjq2GxFYPnxTuZRkuqmxUhWfFskN7jiuo/ToSuXYLZtYEdbzhQ=
X-Received: by 2002:a05:6402:4305:b0:634:a584:6e44 with SMTP id
 4fb4d7f45d1cf-63678ca5df9mr759820a12.18.1759252859032; Tue, 30 Sep 2025
 10:20:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250923221756.26770-1-marnix.rijnart@iwell.eu> <0ab2436f-5c0d-966f-7095-d281292c494c@linux.intel.com>
In-Reply-To: <0ab2436f-5c0d-966f-7095-d281292c494c@linux.intel.com>
From: Marnix Rijnart <marnix.rijnart@iwell.eu>
Date: Tue, 30 Sep 2025 19:20:48 +0200
X-Gm-Features: AS18NWBUxk6JDFUrYMRmquwKP7cxr7696-nl8HLRBqtqZNVEfYHLfT27GfYxE-I
Message-ID: <CAAn10+fRb8VXnDEsSuCj782rp43ZEeov2yXnB2pYxXGNc-2niQ@mail.gmail.com>
Subject: Re: [REGRESSION][PATCH] serial: 8250_pci: Fix broken RS485 for F81504/508/512
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-serial <linux-serial@vger.kernel.org>, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is my first interaction with the kernel community, so I did my
best to read up on the expected practices but maybe I missed
something.

I didn't add a Fixes tag for commit 4afeced because it doesn't cause
the bug by itself, it's the interaction between it and an older commit
(456d523) that create the issue together. What's the right way to tag
this?

I didn't Cc stable because I understood this to be only required for
point release regressions within a stable series
(https://docs.kernel.org/admin-guide/reporting-regressions.html).
Release 6.8 introduced this regression. Should I still Cc them?

If these tags need to added, what's the best way to do so? Resubmit
the patch (as a v2)?

Thanks,
Marnix

Op di 30 sep 2025 om 13:32 schreef Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com>:
>
> On Wed, 24 Sep 2025, Marnix Rijnart wrote:
>
> > Commit 4afeced ("serial: core: fix sanitizing check for RTS settings")
> > introduced a regression making it impossible to unset
> > SER_RS485_RTS_ON_SEND from userspace if SER_RS485_RTS_AFTER_SEND is
> > unsupported. Because these devices need RTS to be low on TX (fecf27a)
> > they are effectively broken.
> >
> > The hardware supports both RTS_ON_SEND and RTS_AFTER_SEND,
> > so fix this by announcing support for SER_RS485_RTS_AFTER_SEND,
> > similar to commit 068d35a.
> >
> > Signed-off-by: Marnix Rijnart <marnix.rijnart@iwell.eu>
>
> The Fixes tag is missing?
>
> (And Cc stable tag will be necessary as well).
>
> > ---
> >  drivers/tty/serial/8250/8250_pci.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/serial/8250/8250_pci.c b/drivers/tty/serial/82=
50/8250_pci.c
> > index 152f914c599d..a9da222bd174 100644
> > --- a/drivers/tty/serial/8250/8250_pci.c
> > +++ b/drivers/tty/serial/8250/8250_pci.c
> > @@ -1645,7 +1645,7 @@ static int pci_fintek_rs485_config(struct uart_po=
rt *port, struct ktermios *term
> >  }
> >
> >  static const struct serial_rs485 pci_fintek_rs485_supported =3D {
> > -     .flags =3D SER_RS485_ENABLED | SER_RS485_RTS_ON_SEND,
> > +     .flags =3D SER_RS485_ENABLED | SER_RS485_RTS_ON_SEND | SER_RS485_=
RTS_AFTER_SEND,
> >       /* F81504/508/512 does not support RTS delay before or after send=
 */
> >  };
> >
> >
>
> --
>  i.
>
