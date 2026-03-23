Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10033AB278
	for <regressions@lists.linux.dev>; Mon, 23 Mar 2026 13:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271060; cv=pass; b=s9+BqRPSW96XR77MJFDlezMIaJxKy9D0lXdNAxKhfcuszV/GG/zBJqLCtY+xXF/DRGNZERIxy9nMzBI8xqGK77VWwCdTsQtjH9xtFUH0ie9YBSt6KYVkpByuJaTcGmEXWsabpDXycq6IajomiXVyGvZzkKj6wbH0A8iOo8BAnHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271060; c=relaxed/simple;
	bh=Wh+2/Y6YUMQzF4fgYYKLS0YmAgdUeif4NZ7LqrU8mCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrSUEXpjO40T+o7PCePjbvxdIECA/BZrwsdneTO2D8lIfZcBLTEL+M7siBRdNaRmBvj/gSCpvb6DnQ7XkFZGKDpRz3E3Ku9wKadFyr77W6cKefVBWhOYCwTxN0s1cHkyKdHD5uOUTQ/xu2hESWk3a46RkZ7Tt0IA03YsjxhZtDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOD/l7rA; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOD/l7rA"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439af7d77f0so3078522f8f.0
        for <regressions@lists.linux.dev>; Mon, 23 Mar 2026 06:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774271057; cv=none;
        d=google.com; s=arc-20240605;
        b=VRAYXT3Q7wSeD9ThvqHzz8nn4uiKVSVL6obEU4cBq9LFxWyEFdm/KVEDVHW/WZE6xG
         rq/nvED/EnToZEefJbFpd3RYT6NF5v+5tYo7fb/J47Y7xoGkNyI3KLKON3QbN2B/ihdl
         vsudZORcKY3MIlRkDg9JgJyYuntM5MGiT5aEuV8KgSogZ5Kf7j65H4RVUJsBE6PuZOOO
         ZhE84SYNBjtMblAfpCMJAdEJU7SGFTqHVmp3BXnJb9+AsliFSKnP7Iy4iIIPrOqpq2XS
         xkrCJAPPA31Nn8A44fOCDCUlgSUuDK5nTji6E+V73wD0aVWXEOOzBeDMpSuIkr1bbzXQ
         lMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fOlYmEZcAKW1BbsO7s+IxHqQiUBs0vdYc2qidXHICBo=;
        fh=jRuXxWY1+a87OpoDrVHq/YZvvm8Vvl5q2xtzy0yWHu0=;
        b=XefAAbd0V/Rb9tUkNEPId9usM6UcAG3sRYuQiuS1xCa0FHiifwLFiDu4LjjVZ576N/
         RCxAFYNsCn5PWiVSjgR/5TeXZ6iFm/tRmT+oNY9uK2P3yrcRryubtUOxRYA393LK3DCQ
         XMrTLuhZiqxgDhUGbeuw7gwcMFxnYi1eE8aVwj9qm7mRHgbwmfWU58WXAWYWDGJI87Dx
         5QJp533Sd0SMsWLO9OE+6NaNy7Gnky0qFfO0wF3MIHe62VLflMoHGizjGCORyFfGRqkS
         Un0XnaLMEn+nhV68qVvPdFQfmzykDE7fIWSbTiTgZVM8fAnwgLh20f1TbA1ocDUIH0yZ
         au8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774271057; x=1774875857; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOlYmEZcAKW1BbsO7s+IxHqQiUBs0vdYc2qidXHICBo=;
        b=VOD/l7rAT/CF2ttSFLRjXGIfhWS/mDy/DEdO489zXVlY3ce7RXaH4c+x2SWVy+m6TZ
         9LnIPn2+AcsNSz6u/BNNLYoZYbvqG0ynMUwKwzNF4uJah+d/5nPok2inlNt8DuKwwa1Z
         nINiO64X6gaFmAgNw2D8Bnq/+xFsjY/y1M10gSle8YrYhFdm2KZLNW1MSNrZueqxQ8hx
         GVVrr9iNkLD/Ey6ZGlhfFtbtIMLlrjBQ9zSH6MnVczOIkuNgefHrTQl1no4MoyXqwxn/
         b6w4vgZ1QyJgoUmdmoUaBWWZMtJIG92UWEOQIbd+3x3Kvwm/FZ2xOB/z/jq6p2Qf5ss+
         M0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271057; x=1774875857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fOlYmEZcAKW1BbsO7s+IxHqQiUBs0vdYc2qidXHICBo=;
        b=sva80S2Pw9iBgyNOh7QRtkFoTPWkNDo+DECcvjsLvyXYMlUNqoCS2PXFAeEXqlLlul
         E/F0+sgSj6KibhSTj3HGAVHSo7HjSKHjIkCEW9zjGiNBGNDGM8Eu+CZ8UGmNF8HJUp+H
         SK/n2WIP7m6QFEeYIfhD5YU6qIlM1vDQ/7VEXet88ClK+6zBcJg/USV4aXs07WT0R3Di
         x6KsK0/KBH0UK0HNopoRKE1CvBgzoDDp1OK8Cc1MMtnMfyPJBTEvulosLeKjKtMO4Fn8
         bnkCA6raD1Z8fVdTTpHAz4It6RN3qlVPErVVM3H45UNyABinF8LOL4oefg606GDylpTH
         Lumg==
X-Forwarded-Encrypted: i=1; AJvYcCXck5ssFidlXTt4pWLkf987wd0ydQe3cTO8j9TjP+9XGs9GEbhL3GmU8aoiMjKPW1hU/i6krbJvYP/UsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YznAnX5tvfVlcJ9GOPwvvGz6850xwWQGP5DTk/ZaniHb6vj7vnH
	E76s3EiixNY8iKEfareQiLHfqL2eqpJHt6Na+w8lTGxpP2yRfMUfeufJhXgf0Y3hfzGxSAss89E
	NL45HPIonyOtFZ7l9WA0nEScq0estJt0JijzX2m47PABA
X-Gm-Gg: ATEYQzxzjRzaCmE132vVUncH0QdZjKYCXtQ1mcVhnwEv9pYUqA8wxy9B9vMEbNCsgyA
	A1Jm0Ci7gfaYe61b++rPG8i0lgIXcJZiXI5oKK9Au8DYKe90Kbrj8434FmDMn9HyvJUDEiSakqI
	b/msGyvemDSoFmYgYbcWbDHefaAmpTJCDLgGcg/rNckh9gDeB6bbmLCtnCo6cxQ+TH3t4Nx6Vs6
	dN5LknTbXH82ejF6ASuhGbgWIsc+0FM1JuUTbx1+sdaROFz6+OKionZY5zPKCxQnvMDf6OAG/L2
	7t+dXxgIcCWOoeFe7DWqR5R1f4sx86Wkq8s0//Rr
X-Received: by 2002:a5d:64c6:0:b0:439:bd26:3c63 with SMTP id
 ffacd0b85a97d-43b64262da5mr18158075f8f.28.1774271056717; Mon, 23 Mar 2026
 06:04:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com>
 <87ldgakvsc.wl-tiwai@suse.de> <CAOKSTBvbopXOuOfstmasijZgUnT9_qW_dsaeMcHUXhyjj3iRmw@mail.gmail.com>
 <CAOKSTBsWiwwwrmBt3dshrYYo3fQN9eF-gi2Z7BoX6c-Nb3ZoHg@mail.gmail.com>
 <CAOKSTBvND=d4Fq7mt=36p2Y+hKr6aDUbJ6zA4wDOWASwcWjmNQ@mail.gmail.com>
 <87h5qxl8tj.wl-tiwai@suse.de> <CAOKSTBtQi6ZmLmy6u5mP9_gLKZTZHmbb9S36hO99xSsk_EEbcA@mail.gmail.com>
 <87ecm1jii6.wl-tiwai@suse.de> <CAOKSTBtdt=enKSv4ZF7VxDD4QF8+ntyFM5CPJ1Y1QQ7M6TsiKg@mail.gmail.com>
 <CAOKSTBuOV0=1Y62sqf3QALgR+_He=tKLPQ7LZN+xFC6oGWEKVw@mail.gmail.com>
 <87y0k6whm8.wl-tiwai@suse.de> <CAOKSTBuUnS=stepHySGVYH4GbQytEQL45cLj4eV8u0KAsquF5w@mail.gmail.com>
 <87jyvlm6w0.wl-tiwai@suse.de> <CAOKSTBv102MCFnnm9JPp9Zaz_MQNBxu5OnWOCGw29MN7xLbXHA@mail.gmail.com>
 <87h5qpm67n.wl-tiwai@suse.de> <CAOKSTBv3meaMDrJ2tn-dX6agFbTwiEmUeDYu2NTVzc559zd2OQ@mail.gmail.com>
 <CAOKSTBv4GHxQGOhK2NR6QsJERsWSoh6RMp+yv-cV7QBsSgx9iw@mail.gmail.com>
 <f701e9c6-51d2-4388-9162-f02393d6e8b2@leemhuis.info> <CAOKSTBtF9LPtFktAF-357RT_w2bWW9Xg7NimQsizn0VwmR1DJw@mail.gmail.com>
In-Reply-To: <CAOKSTBtF9LPtFktAF-357RT_w2bWW9Xg7NimQsizn0VwmR1DJw@mail.gmail.com>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Mon, 23 Mar 2026 10:03:39 -0300
X-Gm-Features: AQROBzAicXglsUZT_sZ7BewYrI5CzKQ1gLep8oltTQ16pivfxdE_DJOTqwVmnnk
Message-ID: <CAOKSTBt+nKabJXav3diFoYAP0yFjD=Ld5HDO7J=z43bb0CA3pA@mail.gmail.com>
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi there...

Some good soul with more skill than myself - obviously - did some
bisec in the kernel 7, and discovered the culprit why some HDMI cards
do not produce any sound.
Here we go:
https://gitlab.freedesktop.org/drm/amd/-/issues/5052

So, this morning I applied this patch to the kernel 7rc5, and it works
without any issues.


Just want you, guys, to know about that.

Thanks


---


Gilberto Nunes Ferreira




---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram






Em qui., 12 de mar. de 2026 =C3=A0s 10:35, Gilberto Ferreira
<gilberto.nunes32@gmail.com> escreveu:
>
> Hi Thorsten
>
> I think this is exactly the same issue.
>
> Thank you...
>
> ---
>
>
> Gilberto Nunes Ferreira
>
>
>
> ---
>
>
> Gilberto Nunes Ferreira
> +55 (47) 99676-7530 - Whatsapp / Telegram
>
>
>
>
>
>
> Em qui., 12 de mar. de 2026 =C3=A0s 10:24, Thorsten Leemhuis
> <regressions@leemhuis.info> escreveu:
> >
> > On 3/10/26 13:32, Gilberto Ferreira wrote:
> > > I am sorry to reach you again, guys, but now I noticed that dmesg sho=
ws me this:
> > >
> > > amdgpu 0000:04:00.0: [drm] Failed to setup vendor infoframe on
> > > connector HDMI-A-1: -22
> > >
> > > This never appears in the 6.19 kernel series.
> >
> > FWIW, there is another report about broken HDMI auto with amdgpu here:
> > https://gitlab.freedesktop.org/drm/amd/-/issues/5052
> >
> > Might or might not be the same issue.
> >
> > In the end the problem remains the same afaics: you likely need to
> > bisect this (or hope that someone else that has the same problem does).
> >
> > Ciao, Thorsten
> >
> > > Em seg., 9 de mar. de 2026 =C3=A0s 11:25, Gilberto Ferreira
> > > <gilberto.nunes32@gmail.com> escreveu:
> > >>
> > >> Oh! I see. Sorry about that.
> > >>
> > >> ---
> > >>
> > >> Gilberto Nunes Ferreira
> > >>
> > >>
> > >>
> > >>
> > >>
> > >> Em seg., 9 de mar. de 2026 =C3=A0s 11:24, Takashi Iwai <tiwai@suse.d=
e> escreveu:
> > >>>
> > >>> On Mon, 09 Mar 2026 15:14:47 +0100,
> > >>> Gilberto Ferreira wrote:
> > >>>>
> > >>>>>> At best, please try git bisect.
> > >>>> Sorry! I am complete without any acknowledgment on how to proceed =
in this.
> > >>>>
> > >>>>>> Or if it can't work for you, ask your distro people who can help=
.
> > >>>> I have tried 3 different distros! I don't think this is some distr=
o
> > >>>> related problem.
> > >>>
> > >>> No, no, I meant you can ask distro people to build a test kernel, e=
tc,
> > >>> instead of you.  And, it'd better to ask distros whether you are th=
e
> > >>> only one in the world who hits the problem.  If it can be reproduce=
d
> > >>> by others, they can help debugging or bisection, too.  Pinging
> > >>> repeatedly here on the list doesn't help much, as you can't build a=
nd
> > >>> test a patch, unfortunately.
> > >>>
> > >>>
> > >>> Takashi
> > >
> >
