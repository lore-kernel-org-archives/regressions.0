Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C84168BE;
	Fri, 10 May 2024 14:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715351607; cv=none; b=G5GkvxFLtmCCo0/0GDkVcWMgUNo9NBADMKzX5N4G965V7qHoiNc3R2MyGqojuqbNeWvxEwEkhW1A+7OYx3mQFqcjz4FStFrT23VpwK8uAgHbGDe4jF51F2jrYeAdXlRIw3nueo3YKpcz4cCl7rOgnZZtX4SHkKzC2cAUQyv0BVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715351607; c=relaxed/simple;
	bh=F5Swy5DGjw9Hfrkgms8O9kLNrYJ2J8+nIIgp8iS1aWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eg8BdMZxYB19ZZeyMlzTINJ6ZXWV2Q4QdSV3wkd+14gO33GBbI+yOF68kacgoQgZSG8wb81UNDfXj2ZQxwnQX75c98pL/vNeEzcUPf4mnwljlATfVuFBYY0ilLdm1S96LGu5kLwjcN1G1g2vifW4Igv472jrNcwzTXZ12tLT+8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K92qjJLW; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K92qjJLW"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e0b2ddc5d1so28142171fa.3;
        Fri, 10 May 2024 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715351604; x=1715956404; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5Swy5DGjw9Hfrkgms8O9kLNrYJ2J8+nIIgp8iS1aWs=;
        b=K92qjJLW1r+r+d50LTvs+xNSWKcAUhehUXB8EINE1rc05pSn7wVCPxEIqLYELBXe5H
         IAREy8IiC3tV8cd6ILb2OlilEitJLEvhleuc+DyRGLh3HYPLZvzYXaPHn/MX2b1dKqFr
         P7Ftb4ulwlsRw5ki7zqOQgiYY529XpCM1FkQsRaIm1Ki6N6f6eFBttS47Bo0zsGTqvDn
         n8OK9e1QzF/gq+LFnYQp7MHGqM3zWxU2ocmYYszVFVT6gCLC6PoHQ0zsCqTIe7BUxrv4
         VPJf0HE4BSoKJAg43U64y3DPdrYrQyXSjvG4IURoGjf3HBG+1rly4U7y0KK2qfhhExay
         B+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715351604; x=1715956404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5Swy5DGjw9Hfrkgms8O9kLNrYJ2J8+nIIgp8iS1aWs=;
        b=Uaa3T4qPI0Lht/2Chjqhm8ZZO/y2VIXz2/2Mwt80k1a7jwLkcuYzUDQTZnkmCqe1O4
         7tNnhOl/H7NSStCimuxoNxYNKcenWxuklsOJEcjAXnUlr1XeFzr6kWiRaKD4xOAUg9VX
         KVMUXtGe/4ly/XbbEej/hR1YqrmCC8A0JGwE19fsCVyp3zVybu8rL7SMzJK4G2shV/VR
         GuZ/6P4184VKlPw05FgG3RXLQKJbi8Ueertlb0ocTBGzgemvRi1ZEmuxFtecVTSrudoo
         VB3TIrcwMJCBNMPHVi6S2RDgNZ59R2SWxMLIcWhk/P1/NFLSC5JsIqHUDsJSGOeAOnSs
         GnPg==
X-Forwarded-Encrypted: i=1; AJvYcCW61RO2SDViue6eJ4ubS3xmVSK1m5yalP1fjg8QG4lxb7yDwArO2s4YRvXJeMSRSuR4ULTuoQBobvg5flkCBbqLanT2afMCIm5lq0ncVQ6pMxdN6GNaa4387ZawyAkqD5UCsQ==
X-Gm-Message-State: AOJu0YznQZkel8JO/JlVgEgyUpgIfzs6AJgXc5FQ5iqP6DvVjBqi36lm
	RBOyTpulB/ksQXXU64SHY5xfqb9eOvQEkgjg4khnplAiFLtFmGpi66Xt+2QEFJ/iFkP11umyEsL
	WSeguib3ctNSBvG8H74ffGxjVy+s=
X-Google-Smtp-Source: AGHT+IHpk/kaNy2nDGnZN8oek5QC7kWesfxK+r4ESm9X/Y7+mgu9HWhNWZaXTgUv+5Vl6r3pDAnHO7oWXq4zKj3oPEs=
X-Received: by 2002:a2e:4a02:0:b0:2e1:fae0:8ba3 with SMTP id
 38308e7fff4ca-2e51f263abfmr16799501fa.0.1715351603667; Fri, 10 May 2024
 07:33:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240405204037.3451091-1-luiz.dentz@gmail.com>
 <Zjz0atzRhFykROM9@robin> <CABBYNZLMODHp+jBu2oVDC5Pg6fyAKJugQF0N-XgarjWQJJPObg@mail.gmail.com>
 <Zj0tcmseJCjR4hK2@robin> <CABBYNZLnYz-vPrMbtsJTsLPsyo62j+cxctSkLjRom3bWEU9N3A@mail.gmail.com>
 <CABBYNZJ-6oyLnBov9H_jym9m-9qiUt1ELxYGuBOdZT29aj9MCA@mail.gmail.com>
 <70078624-d766-4db6-8ddb-511251baf0f2@marcan.st> <4e194251-d175-49d0-af03-b2cdd8a30fe0@app.fastmail.com>
In-Reply-To: <4e194251-d175-49d0-af03-b2cdd8a30fe0@app.fastmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 10 May 2024 10:33:11 -0400
Message-ID: <CABBYNZKkkAA0KXDR-R0M5jCHNhnLrpH38Ympfm5-JgC0yiD7Bw@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: hci_sync: Use advertised PHYs on hci_le_ext_create_conn_sync
To: Sven Peter <sven@svenpeter.dev>
Cc: Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, linux-bluetooth@vger.kernel.org, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sven, Hector,

On Fri, May 10, 2024 at 5:55=E2=80=AFAM Sven Peter <sven@svenpeter.dev> wro=
te:
>
> Hi,
>
>
> On Fri, May 10, 2024, at 05:13, Hector Martin wrote:
> > Hi,
> >
> > On 2024/05/10 7:41, Luiz Augusto von Dentz wrote:
> > <snip>
> >
> >> If I print the actual value then we got:
> >>
> >> Primary PHY: Reserved (0x81)
> >>
> >> I guess one needs to disregard the reserved range, well until they are
> >> no longer reserved then it will no longer work. Perhaps we should talk
> >> to broadcom to know what is up with using reserved values and if that
> >> is an apple thing then perhaps we could ask them to provide firmware
> >> that acts according to the spec.
> >
> > Apple and Broadcom do not support Linux on this platform. The kernel ha=
s
> > to work with the existing firmware (which is the firmware macOS uses),
> > we don't get to request changes. If the firmware has quirks the kernel
> > has to deal with it, that's how it goes. It would be great if we had
> > vendor support, but that is not something we can control. This is commo=
n
> > (Linux is full of quirks to support noncompliant hardware/firmware).

While this may work for a dedicated driver I don't think it is that
easy when we are talking about a standard interface, except if you are
going to maintain a separate HCI layer at the driver to intercept the
traffic this will cause a lot of regression to users unaware to the
fact, and it is not like you can't get rid of it, just plug an
external Bluetooth dongle that behaves properly.

> While I agree with Hector here that they won't even talk to us it's
> sometimes possible to figure out what exactly they were thinking with
> their reserved values. Apple provides "Additional Tools for XCode" which
> include their "PacketLogger" which contains most of their vendor
> specific hacks with a human readable explanation. I wasn't able to genera=
te
> this specific event with my hardware here but I was able to inject a cust=
om
> event into their trace format and then load it and see how it's decoded.
>
> From a very brief look it appears that they AND Primary_PHY/Secondary_PHY=
 with
> 0x1f to decode it and then support all values defined in the bluetooth
> spec, i.e. "no packets", "LE 1M", "LE 2M" and "LE coded". No idea what th=
e
> higher bits mean though since they are ignored and don't seem to be decod=
ed.

Yeah, I think I saw something like that not long ago, we might need
yet another quirk to deal with that though.

--=20
Luiz Augusto von Dentz
