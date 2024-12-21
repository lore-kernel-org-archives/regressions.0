Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE14F1F0E44
	for <regressions@lists.linux.dev>; Sat, 21 Dec 2024 11:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734779201; cv=none; b=ScDptM//9ukTfwLY33duv9BCEY7VIlh09AXv9b4Ncke5lgIjU7+PJmIWtEmSJJdwLa9XwFCHBsMZCizEFghmLRORBRMe6y7WLFAWzNVsV6zW0UEfUq5x6m7XaoAyA8XbkfflMbEm1P0qVtrvcOP66bQ8uzZ77oZfK7sjUiTFalQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734779201; c=relaxed/simple;
	bh=HKrvtGIaAK3Jab0O+wQO5OrK+dBoeEExyYJNxAwz//M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VoZABq+twzi/4WJmuhPecYb/GRyLtk3dtETJ6rc16DuNZ+uwbb1YpY6xpMPvAAFJu0OhUA2nP/1yJmrLlkqolwe4xYFLx72oIX5nUowq+0gBbpz9avqmjVtrGueAcBDJE7+a5XJjfSdGmiy+/QCcBoFd7vfGL/YK/pmgQExSS9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yCNhE0Qc; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yCNhE0Qc"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-aabf8e856e2so331315866b.0
        for <regressions@lists.linux.dev>; Sat, 21 Dec 2024 03:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734779197; x=1735383997; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9c9a3iVDE+5v7pmjMQqm1QHn7yy3OkjMxC3jrRl0psE=;
        b=yCNhE0QcgCpabfiCSheZ2Ad/AZ2/lUX3xshj4YdZ8QRYGu7SiSX29MWlQIaMzEjJpB
         6Edr1VuoIpVvJeOO+Kua2/k6ElWMpUgApKPT4vUiZOJQXSie/BEw9t9bzXDSnd93sJVI
         1BOoEQf40wtav4nhp6ZYuHd70k9ebYgaR+5coISKLpR1yoIkli0UXd9NNAqGtXlTlp+x
         gkTrK1ywbACGW9gsCt5/f0DJU8EPdmn6p3Y8U6SW/pkYlan5ggT+Wn8G8yGbgWZk7oM2
         fxRUEaIvYFSqSG8hGHuYO10fpAQVn5JkvMFed9JpnZqEN3gigEvChcvBWtSiJlrul0WI
         mVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734779197; x=1735383997;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9c9a3iVDE+5v7pmjMQqm1QHn7yy3OkjMxC3jrRl0psE=;
        b=vX7JvrZmVI4DC0ISwDGQ+ylsvK5psUcEKT3FKNSo0qkfbIPJhUuAMFYAsk6KL620pH
         vk6/LkHnjBgzZalInRVdjP73beY0ia1zr4Ub1TUbO4RAD4Owe+r2Is5ddkM3tkT83gYw
         CGUuV0uG2eNlqlUEci1ObnZvQbDlfEo6r9WlErav1iC2yG8aPyrVwlz+ALnX1SGBc5Pv
         kUpQ5xPcM8rOfPWf3Hx4bCGWt1aozfRKy221mBcvsn+n1hblS8a2wdu67PfjtqALv4P4
         JVUp68Eb0t1c607l2H2fw75jYMkAJDR64rEA8TszYqKTVIQUVx7gTEoWIM6HqM4tSqpg
         UReg==
X-Forwarded-Encrypted: i=1; AJvYcCUth71v5uVuPa5ucHNYxdAWcM0W58Rd/j34/nLUH6zmbu6kCuq8S0QbdDpvaQoU9wXqZcx4GohJDU0oOg==@lists.linux.dev
X-Gm-Message-State: AOJu0YznnI3yfEBYvd7N2NZkMJeB7scj3iD9pbvgP2BCDWD06wa1ZmB5
	79EBJsoFRiurvZnn7nM8XVJfGf/LEIM0QUGV6OyQO9li9nD1I+0EwQ/0bUzr+oUHJp4nE+3abwK
	70A==
X-Google-Smtp-Source: AGHT+IEToD+6DqkOSrJAGdf3lwcpFc2nJisfO7vLafkdBubYriBDAdyrh0akWL0n3H+qY6NTTVgq7uQb4Ik=
X-Received: from ejcvw10.prod.google.com ([2002:a17:907:a70a:b0:aa6:9dde:9b22])
 (user=gnoack job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:2dab:b0:aa6:aa8e:c89c
 with SMTP id a640c23a62f3a-aac335626acmr489665766b.39.1734779197235; Sat, 21
 Dec 2024 03:06:37 -0800 (PST)
Date: Sat, 21 Dec 2024 12:06:35 +0100
In-Reply-To: <Z2BKetPygDM36X-X@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <2024121418-blazer-valiant-c51a@gregkh> <20241216150722.4079213-2-gnoack@google.com>
 <2024121653-unblessed-mummified-c630@gregkh> <Z2BKetPygDM36X-X@google.com>
Message-ID: <Z2ahOy7XaflrfCMw@google.com>
Subject: Re: [PATCH] tty: Permit some TIOCL_SETSEL modes without CAP_SYS_ADMIN
From: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jann Horn <jannh@google.com>, "Hanno =?utf-8?B?QsO2Y2s=?=" <hanno@hboeck.de>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-hardening@vger.kernel.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Greg, Hanno and everyone else!

On Mon, Dec 16, 2024 at 04:42:50PM +0100, G=C3=BCnther Noack wrote:
> On Mon, Dec 16, 2024 at 04:17:15PM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Dec 16, 2024 at 03:07:23PM +0000, G=C3=BCnther Noack wrote:
> > > With this, processes without CAP_SYS_ADMIN are able to use TIOCLINUX =
with
> > > subcode TIOCL_SETSEL, in the selection modes TIOCL_SETPOINTER,
> > > TIOCL_SELCLEAR and TIOCL_SELMOUSEREPORT.
> > >=20
> > > TIOCL_SETSEL was previously changed to require CAP_SYS_ADMIN, as this=
 IOCTL
> > > let callers change the selection buffer and could be used to simulate
> > > keypresses.  These three TIOCL_SETSEL selection modes, however, are s=
afe to
> > > use, as they do not modify the selection buffer.
> > >=20
> > > This fixes a mouse support regression that affected Emacs (invisible =
mouse
> > > cursor).
> > >=20
> > > Link: https://lore.kernel.org/r/ee3ec63269b43b34e1c90dd8c9743bf8@find=
er.org
> > > Fixes: 8d1b43f6a6df ("tty: Restrict access to TIOCLINUX' copy-and-pas=
te subcommands")
> > > Signed-off-by: G=C3=BCnther Noack <gnoack@google.com>
> > > ---
> > >  drivers/tty/vt/selection.c | 14 ++++++++++++++
> > >  drivers/tty/vt/vt.c        |  3 +--
> > >  2 files changed, 15 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/tty/vt/selection.c b/drivers/tty/vt/selection.c
> > > index 564341f1a74f..0bd6544e30a6 100644
> > > --- a/drivers/tty/vt/selection.c
> > > +++ b/drivers/tty/vt/selection.c
> > > @@ -192,6 +192,20 @@ int set_selection_user(const struct tiocl_select=
ion __user *sel,
> > >  	if (copy_from_user(&v, sel, sizeof(*sel)))
> > >  		return -EFAULT;
> > > =20
> > > +	/*
> > > +	 * TIOCL_SELCLEAR, TIOCL_SELPOINTER and TIOCL_SELMOUSEREPORT are OK=
 to
> > > +	 * use without CAP_SYS_ADMIN as they do not modify the selection.
> > > +	 */
> > > +	switch (v.sel_mode) {
> > > +	case TIOCL_SELCLEAR:
> > > +	case TIOCL_SELPOINTER:
> > > +	case TIOCL_SELMOUSEREPORT:
> > > +		break;
> > > +	default:
> > > +		if (!capable(CAP_SYS_ADMIN))
> > > +			return -EPERM;
> > > +	}
> >=20
> > Shouldn't you check this _before_ doing the copy_from_user() to emulate
> > the previous logic properly?
>=20
> You are right, I believe this can technically return a different error co=
de.
>=20
> There is a data dependency between the two though - the capability check =
should
> only happen for certain values of v.sel_mode, and v is only populated by
> copy_from_user().
>=20
> As far as I can tell, this only makes a difference in scenarios where bot=
h
> copy_from_user() and the capability check would fail.
>=20
> Do you think we have to emulate it down to this level of detail?

Another observation which makes it clearer that copy_from_user() failing he=
re
should really not happen in practice:

The 'argp' pointer that gets passed to ioctl(2) here is a pointer to a regi=
on in
memory whose first byte is a TIOCLINUX subcommand, and at the time we do th=
e
copy_from_user(), this subcommand byte has already been successfully copied=
 over
from user space.  The region that we are now copying with copy_from_user() =
here
is directly after this byte, and should under normal circumstances work as =
well
-- I believe that callers would have to construct a specifically crafted io=
ctl()
so that the first copy-from-userspace works and the second one fails (refer=
ring
to a byte just before a page boundary, or something like that...?)

I'll send a V2 of this patch with the comment removed, the 'Cc: stable' add=
ed,
but where the CAP_SYS_ADMIN check is still done after copy_from_user(), wit=
h the
reasoning that:

 1. A previous get_user() from an adjacent memory region already worked
    (making this a very unlikely failure)
 2. I do not see a good alternative to reorder the code here, because we ne=
ed
    the data from copy_from_user() in order to know whether the CAP_SYS_ADM=
IN
    check even needs to be performed.

Hanno: If you are OK with this patch, I'd still appreciate a more formal
"Reviewed-By" or "Tested-By" from you. :)

Thanks, and Happy Holidays!
=E2=80=94G=C3=BCnther
