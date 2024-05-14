Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB9D140E5B
	for <regressions@lists.linux.dev>; Tue, 14 May 2024 13:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715693433; cv=none; b=hwrygxLg3jqBSFeSssu8qGOLW3RHtHfJvRDtTNeg9ufIDtBFzoNvXB+aeHE6WRU5KapWLVeLXB21yYpT5VwzrSrcWHPrYlZ+h6lp5ms8kdpNuTysC5xcvBxAb4PrZZmqqkWurc/iSYvhpbwWC064wbu85blMnK4moY/7I6IxHfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715693433; c=relaxed/simple;
	bh=piBqjtptZG2+6353FTd5m351PoFO/HCOJmoR5OMs/Qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AerMGJf9DiX5obSJRdCdFL2xLHZCulGOCwBJ8W3As3xvYUOwMNeLnV4+4kKAG5MQ3g4a1HWP3K43QE0oXUHV7ofnRZ6pPo53ufDSzjjZD3fGeo3i1N+cuf0hzQwru962Y62hQXBOL+pykEqtupQJLhIkWgkVssZ/t1253e4c1DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cV0EHvlG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cV0EHvlG"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51fc01b6fe7so5998300e87.0
        for <regressions@lists.linux.dev>; Tue, 14 May 2024 06:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715693429; x=1716298229; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LL9tKZII3301100NDiVs7FhVn6xmZqw8CDO8u/ijRQ=;
        b=cV0EHvlG4X/LkjD9sGKdZ+PkmUpf9UR8pRlrgDJN/ujYQilazF8li8l2EWrPou3zrv
         /FpaLfKJUzVYIjq6VkEbPeLXLfgGAGMt/FnmZCKHx9GtbPvOhXTCc1xnqCqh9MF95ZyA
         rW0qYWfXWqqvjANSUwQhqw4pC5cHHmF+m9ggnD70GZceYXCkkgr2lWT9dT0lA68u6LoH
         5y8D9WcgFJCF+PakNLuLmo8ndSYRKSAUbADv5XPqg8yiSIvBCA8jyQyakRjFPmx6yntV
         Xi62urSKp0f6WSuoJ91Ux3x3R8m8SE0HwdokUFobMsa0kWmCwRTa4qrsZXOFaMR/DsG2
         61RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715693429; x=1716298229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LL9tKZII3301100NDiVs7FhVn6xmZqw8CDO8u/ijRQ=;
        b=g4gQO1hLRqm6vx8hdvreQuWBBLreMIoq401Lbzp9Qxg0Vg3piBLRr1HeJh4BhvEz8u
         8KxNKJGxfs8KG0y3us4ygUHa02VhKk7shQX8058pmvBLRGZzy0Tmnie2W4jEbZcQM4Ed
         WUzYhQhdAYUXl3OzX1scnHO9VmQv75ATDCy1PzoxpJNftNttDb07hiOu5hU610k4b0h2
         /uh+msNvieSqawd6h6o84KSgeyogvnQ0n6yskCZtxZgT/NO97vM4aJMJcjHZja2ir3vD
         F87UDLnACjfS3yQRWiNarZrVHKbOOdSxMbSzaNveVOby3+EWdNb8OWcf6j6Voa0WxsD7
         KNDg==
X-Forwarded-Encrypted: i=1; AJvYcCUE+mVMpLBJlJb1EIhVupbi5ILPh6/oAvkTuMw82AvjtsUrjfd+5SlMbLSzraRncwtFbL+2LYQXyapnHJSh1UTkWd2KHfjjPq4lPqc=
X-Gm-Message-State: AOJu0YxCDN3clUroGKKw7qAMCadv+Do3MBtQZDX1/5YrihImDWExenQX
	9XrXJ48rfSWz1Goa74+HY3t/9IXSiD9gO8C8o9mFroBYkAYHbur+KOei0rR9EgiOPVj/TIP8e91
	fo16MIhPJIjHMUrA2cXKFh/HDlTE=
X-Google-Smtp-Source: AGHT+IHJsBnracCRDvXoTqylYTPRSeEHgfeoXd4geBcI7/I2MW0Bm8PSb+4hJZMKBHWqVwu6oebI1NAkZW1cfjNirqQ=
X-Received: by 2002:a2e:9687:0:b0:2dc:bd75:41ba with SMTP id
 38308e7fff4ca-2e51ff4eab0mr78555501fa.27.1715693428403; Tue, 14 May 2024
 06:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZkLv3wn62jqMVpSF@archie.me> <CAHp75VcjeJ5oZy2JjbyrKn+GVvixJKmfh3Yj1p-HxcJHrm0Wzg@mail.gmail.com>
 <606328522.1205749.1715678929830@mail.yahoo.com> <CAHp75VefMFJMAHrKmDf1joSkKOcaRMJWse8yM63Nt5v2W7w3Fw@mail.gmail.com>
 <6bfafddc-cf5b-4829-e09b-2622aaf83093@linux.intel.com> <645803059.1237606.1715692880298@mail.yahoo.com>
In-Reply-To: <645803059.1237606.1715692880298@mail.yahoo.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 May 2024 16:29:50 +0300
Message-ID: <CAHp75Vfsw+k6aSZ_PTduuTWPFwurgZTOt0O0QTkdLtYKSzv7zQ@mail.gmail.com>
Subject: Re: [regression] [bisected] commit 6bb6fa6908ebd3cb4e14cd4f0ce272ec885d2eb0
 corrupts data sent via pseudoterminal device
To: Vadym Krevs <vkrevs@yahoo.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Linux Serial <linux-serial@vger.kernel.org>, 
	Gilles Buloz <gilles.buloz@kontron.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 4:21=E2=80=AFPM Vadym Krevs <vkrevs@yahoo.com> wrot=
e:
> On Tuesday, 14 May 2024 at 12:03:25 BST, Ilpo J=C3=A4rvinen <ilpo.jarvine=
n@linux.intel.com> wrote:
> > On Tue, 14 May 2024, Andy Shevchenko wrote:
> > > On Tue, May 14, 2024 at 12:28=E2=80=AFPM Vadym Krevs <vkrevs@yahoo.co=
m> wrote:
> > > > It's a standard setup for an out-of-the box default install of open=
SUSE 15.5 with KDE. All tests done in Konsole with bash as shell.
> > > >
> > > > stty -a -F /dev/pts/1
> > > > speed 38400 baud; rows 57; columns 217; line =3D 0;
> > > > intr =3D ^C; quit =3D ^; erase =3D ^?; kill =3D ^U; eof =3D ^D; eol=
 =3D <undef>; eol2 =3D <undef>; swtch =3D <undef>; start =3D ^Q; stop =3D ^=
S; susp =3D ^Z; rprnt =3D ^R; werase =3D ^W; lnext =3D ^V; discard =3D ^O; =
min =3D 1; time =3D 0;
> > > > -parenb -parodd -cmspar cs8 -hupcl -cstopb cread -clocal -crtscts
> > > > -ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr icrnl =
ixon ixoff -iuclc -ixany -imaxbel iutf8
> > > > opost -olcuc -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0=
 bs0 vt0 ff0
> > > > isig icanon iexten echo echoe echok -echonl -noflsh -xcase -tostop =
-echoprt echoctl echoke -flusho -extproc
> > >
> > > Thank you!
> > >
> > > Yeah. SW flow control is enabled, but I don't see which character is
> > > being used for that. Anyway, let's give Ilpo a chance to look into
> > > this.
> >
> > Thanks a lot for pinpointing the commit with bisect. It turns out this
> > is a quite bad corruption bug and I'm quite surprised I didn't see (or
> > notice) it while testing the patch.
> >
> > Could you please test and confirm the patch below fixes the issue?
> > --
> > [PATCH] tty: n_tty: Fix buffer offsets when looked ahead is used
> >
> > When lookahead has "consumed" some characters (la_count > 0),
> > n_tty_receive_buf_standard() and n_tty_receive_buf_closing() for
> > characters beyond the la_count are given wrong cp/fp offsets which
> > leads to duplicating and losing some characters.
> >
> > If la_count > 0, correct buffer pointers and make count consistency too
> > (the latter is not strictly necessary to fix the issue but seems more
> > logical to adjust all variables immediately to keep state consistent).
> >
> > Reported-by: Vadym Krevs <vkrevs@yahoo.com>
> > Fixes: 6bb6fa6908eb ("tty: Implement lookahead to process XON/XOFF time=
ly")
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D218834
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> > drivers/tty/n_tty.c | 22 ++++++++++++++++------
> > 1 file changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/tty/n_tty.c b/drivers/tty/n_tty.c
> > index f252d0b5a434..5e9ca4376d68 100644
> > --- a/drivers/tty/n_tty.c
> > +++ b/drivers/tty/n_tty.c
> > @@ -1619,15 +1619,25 @@ static void __receive_buf(struct tty_struct *tt=
y, const u8 *cp, const u8 *fp,
> > else if (ldata->raw || (L_EXTPROC(tty) && !preops))
> > n_tty_receive_buf_raw(tty, cp, fp, count);
> > else if (tty->closing && !L_EXTPROC(tty)) {
> > -        if (la_count > 0)
> > +        if (la_count > 0) {
> > n_tty_receive_buf_closing(tty, cp, fp, la_count, true);
> > -        if (count > la_count)
> > -            n_tty_receive_buf_closing(tty, cp, fp, count - la_count, f=
alse);
> > +            cp +=3D la_count;
> > +            if (fp)
> > +                fp +=3D la_count;
> > +            count -=3D la_count;
> > +        }
> > +        if (count > 0)
> > +            n_tty_receive_buf_closing(tty, cp, fp, count, false);
> > } else {
> > -        if (la_count > 0)
> > +        if (la_count > 0) {
> > n_tty_receive_buf_standard(tty, cp, fp, la_count, true);
> > -        if (count > la_count)
> > -            n_tty_receive_buf_standard(tty, cp, fp, count - la_count, =
false);
> > +            cp +=3D la_count;
> > +            if (fp)
> > +                fp +=3D la_count;
> > +            count -=3D la_count;
> > +        }
> > +        if (count > 0)
> > +            n_tty_receive_buf_standard(tty, cp, fp, count, false);
> >
> > flush_echoes(tty);
> > if (tty->ops->flush_chars)
> > --
> > 2.39.2
>
> Yes, I've tested the patch against the 6.9.0-rc7-local-00012-gdccb07f2914=
c kernel (last commit 45db3ab70092637967967bfd8e6144017638563c from May 8th=
) and it works just fine.
>
> Thank you very much for fixing the problem so quicky.

Can you provide a formal Tested-by: tag? (It's documented here
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#usin=
g-reported-by-tested-by-reviewed-by-suggested-by-and-fixes,
basically it's a reply with whatever, but one line should start with
Tested-by: followed by your name and email and nothing more.

> P.S.: Hopefully, Yahoo mail has actually sent this reply as plain text.


--=20
With Best Regards,
Andy Shevchenko
