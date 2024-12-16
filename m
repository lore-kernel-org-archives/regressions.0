Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA4714E2C0
	for <regressions@lists.linux.dev>; Mon, 16 Dec 2024 15:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734363775; cv=none; b=U1YaUL2YWxAdq0lzfVE6ogrc7Q6FsCNT0NpfARdc53ih07b5YTgQnA+IXUNboO+rZK4Wwmzbnx7Lbqi4CET1hd5eia5dbh5Sxn5ocUXm1axZXnqnjQjkM5v4/8FUao76No/XaqiHrveDyagfosfI6/iX2ieMMxVCEikL0D5aFHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734363775; c=relaxed/simple;
	bh=eMMn65xwm4dD/xAdLn9gKjV0SsQ8nbUdBJWkRou7Isc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Eml81ZbXhfU29NB4Keg12G+NHuefiYjxGEmJPzUu4FBnvDdHC/kUtsFneipb26SZwQ7DtgJ6BhoMOy0t5P2Bzm/j5x/8bSNB6KXo5XvNDGvrOmq/UxI58pouWWZuZQ/lZ2ayVgoFm56cehNBc+vBtSmKGHfrNztra92kVolbsz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xauZPPd7; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xauZPPd7"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-aa680e17f6dso301517166b.1
        for <regressions@lists.linux.dev>; Mon, 16 Dec 2024 07:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734363772; x=1734968572; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHBbj5S9UT6s3cvDeZW+WmfAzA4JgRXAeW+4cg5L7G8=;
        b=xauZPPd7Vu17XRVWDkttlTE5z4Ut2o1g41Xrr4rj7M2H3W2ZtIWh80H4d0UqsVzfZH
         EyC6ax5r8I4LcoXgiEwTjT040aVQNEnly/WMoNMNTkgrkZVuDJZHXgbAP5VAAle722WA
         xJbPTZUPhPMOZOQZv02uWOo80B/meQm1a3uRIcbHwVBwSuW6kqdQZy1N6oRo9MulXm0x
         MP14yf9iKnWHentwC7/eBhF5LfI/6XxqiOu7BaK1brbqr+V7x9i3ErXtXIKSph3shdQE
         s/dwTEBjhnbqoLnYu6fTOPTByko6iGaIqPS7w7/m657g40s3fWgskelCfAP/4TSYq6zY
         jHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734363772; x=1734968572;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XHBbj5S9UT6s3cvDeZW+WmfAzA4JgRXAeW+4cg5L7G8=;
        b=bcdjkAxbCs86P88YsPDiQtOSTD2qngy3rfVgPudrvy1k/tqO0iCq04JWc/i7P8OwjC
         Mbp7g6pFqrOwboC+JDCwRqs79OX59DdCnDllocZUKjgjZnSHroysyKUsTXXJmUzGzbxY
         UX7i0kKOmf9Hdl3o2MGWXegATi3yjIz9cm1C6gJ1Y8m734rdLASGpSkFV+24tr6h/Nj2
         A5hAraLYSrusZMdoHUT5ZD3X+1BVMyYZlhPl+H0pU7RQyksiVCGbmvQVAnZp3P++mzXI
         lmPx6O1SKt5poih+CCT/kJaQQaXIluDgZvuAR2ISV+82aFZlw7f4LNZFJlVySgT1Nsz/
         +mqg==
X-Forwarded-Encrypted: i=1; AJvYcCUmsK8+L6hlcOjhWmhEwS7jVw8xY+yoUnz95XyJ+c1do0A8ItiOnlfkcR3FmUylLGXBpu4A3FNZ1QeG7g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6a1vhc/Ypa1W++uh1yLNKUm5hSaYVgLH05s5qnuq4/ipM50Ck
	MWfVbF3+boa4g1j7/Hc/pMRENYIBQuFCANVFXcbdOreAAM2jGfF2OcSXIQx4rGEo7W57PXyJDoC
	dMA==
X-Google-Smtp-Source: AGHT+IEvwXRrJ0+fa0U2GbRoAPbJ3JzjYjdBqCukKbZUpFxMjfFCZNl882cgyP5mMr8ZRoTCv2E7CFLm3os=
X-Received: from edrl20.prod.google.com ([2002:aa7:c3d4:0:b0:5d1:58a5:ef17])
 (user=gnoack job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2398:b0:5d6:688d:b683
 with SMTP id 4fb4d7f45d1cf-5d6688db9aamr10240026a12.9.1734363772620; Mon, 16
 Dec 2024 07:42:52 -0800 (PST)
Date: Mon, 16 Dec 2024 16:42:50 +0100
In-Reply-To: <2024121653-unblessed-mummified-c630@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <2024121418-blazer-valiant-c51a@gregkh> <20241216150722.4079213-2-gnoack@google.com>
 <2024121653-unblessed-mummified-c630@gregkh>
Message-ID: <Z2BKetPygDM36X-X@google.com>
Subject: Re: [PATCH] tty: Permit some TIOCL_SETSEL modes without CAP_SYS_ADMIN
From: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jann Horn <jannh@google.com>, "Hanno =?utf-8?B?QsO2Y2s=?=" <hanno@hboeck.de>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-hardening@vger.kernel.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Mon, Dec 16, 2024 at 04:17:15PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Dec 16, 2024 at 03:07:23PM +0000, G=C3=BCnther Noack wrote:
> > With this, processes without CAP_SYS_ADMIN are able to use TIOCLINUX wi=
th
> > subcode TIOCL_SETSEL, in the selection modes TIOCL_SETPOINTER,
> > TIOCL_SELCLEAR and TIOCL_SELMOUSEREPORT.
> >=20
> > TIOCL_SETSEL was previously changed to require CAP_SYS_ADMIN, as this I=
OCTL
> > let callers change the selection buffer and could be used to simulate
> > keypresses.  These three TIOCL_SETSEL selection modes, however, are saf=
e to
> > use, as they do not modify the selection buffer.
> >=20
> > This fixes a mouse support regression that affected Emacs (invisible mo=
use
> > cursor).
> >=20
> > Link: https://lore.kernel.org/r/ee3ec63269b43b34e1c90dd8c9743bf8@finder=
.org
> > Fixes: 8d1b43f6a6df ("tty: Restrict access to TIOCLINUX' copy-and-paste=
 subcommands")
> > Signed-off-by: G=C3=BCnther Noack <gnoack@google.com>
> > ---
> >  drivers/tty/vt/selection.c | 14 ++++++++++++++
> >  drivers/tty/vt/vt.c        |  3 +--
> >  2 files changed, 15 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/tty/vt/selection.c b/drivers/tty/vt/selection.c
> > index 564341f1a74f..0bd6544e30a6 100644
> > --- a/drivers/tty/vt/selection.c
> > +++ b/drivers/tty/vt/selection.c
> > @@ -192,6 +192,20 @@ int set_selection_user(const struct tiocl_selectio=
n __user *sel,
> >  	if (copy_from_user(&v, sel, sizeof(*sel)))
> >  		return -EFAULT;
> > =20
> > +	/*
> > +	 * TIOCL_SELCLEAR, TIOCL_SELPOINTER and TIOCL_SELMOUSEREPORT are OK t=
o
> > +	 * use without CAP_SYS_ADMIN as they do not modify the selection.
> > +	 */
> > +	switch (v.sel_mode) {
> > +	case TIOCL_SELCLEAR:
> > +	case TIOCL_SELPOINTER:
> > +	case TIOCL_SELMOUSEREPORT:
> > +		break;
> > +	default:
> > +		if (!capable(CAP_SYS_ADMIN))
> > +			return -EPERM;
> > +	}
>=20
> Shouldn't you check this _before_ doing the copy_from_user() to emulate
> the previous logic properly?

You are right, I believe this can technically return a different error code=
.

There is a data dependency between the two though - the capability check sh=
ould
only happen for certain values of v.sel_mode, and v is only populated by
copy_from_user().

As far as I can tell, this only makes a difference in scenarios where both
copy_from_user() and the capability check would fail.

Do you think we have to emulate it down to this level of detail?


As background, we have only introduced the CAP_SYS_ADMIN check recently in
8d1b43f6a6df ("tty: Restrict access to TIOCLINUX' copy-and-paste subcommand=
s")
The patch landed in Linux 6.7 and was discussed in
https://lore.kernel.org/all/20230828164117.3608812-1-gnoack@google.com/.

I suspect that existing callers of the TIOCL_SETSEL IOCTL are probably all
written at a time before the capability check existed.  ((a) These IOCTLs a=
re
used for the console mouse support, and (b) these "modes" for the TIOCL_SET=
SEL
subcode for the TIOCLINUX IOCTL are not documented in the man page either.)

>=20
> > +
> >  	return set_selection_kernel(&v, tty);
> >  }
> > =20
> > diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> > index 96842ce817af..ed65b3b80fbd 100644
> > --- a/drivers/tty/vt/vt.c
> > +++ b/drivers/tty/vt/vt.c
> > @@ -3345,8 +3345,7 @@ int tioclinux(struct tty_struct *tty, unsigned lo=
ng arg)
> > =20
> >  	switch (type) {
> >  	case TIOCL_SETSEL:
> > -		if (!capable(CAP_SYS_ADMIN))
> > -			return -EPERM;
> > +		/* CAP_SYS_ADMIN check happens in set_selection_user(). */
>=20
> No need to mention this here, it's obvious in the function itself.

OK, thanks.  I will remove it in the next version.

=E2=80=94G=C3=BCnther
