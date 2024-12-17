Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24E91DB520
	for <regressions@lists.linux.dev>; Tue, 17 Dec 2024 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734426571; cv=none; b=RVael68+N3qB2giPGw5WAZV6aSUNFzIzvfRC5U4JNfWkWYio1J3644hdkx3Ss0ImSOW7NhA9kvWlLAkCxapN1Y+6KnHjXNJD0rK4d2CvbaNTnNEqJEmRwQVRRHTBgif/tyoE/9lgllFzQs25IQ2mYKyEkIoqi7D+++VLk8gYjx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734426571; c=relaxed/simple;
	bh=ApEhb33uCE8yBRHsse69NJsbjohMokRhjRb2vxI8iFA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JcB6Koiipbn9nLIomTzdwOI2N+Az3UISrBWhlshRFEpr3567kQFizw/wMxOjZRs8lrxuLOyxFcIbXmzjp/DkUjTpXq5FJJETA9816eQ0eNk6OzSmjqFPUXe09VD7/P+CrhNOg2XV8U09cZGeK945eoHbBBbOdFaSQQHaRKtCfm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uzb8Sp/Q; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uzb8Sp/Q"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5d3cff6aedbso5006696a12.0
        for <regressions@lists.linux.dev>; Tue, 17 Dec 2024 01:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734426568; x=1735031368; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GdTUhvict8QP95ODVq3VBD/97IqwhvwNQQSLRxy9C2k=;
        b=Uzb8Sp/QiNuW03pGlpdmxutZC2Id7ycGE2lxqpG0obevW628iae1horBlMbENQJiry
         9HdVDjhMknjwV0yZ68HM5rqAavzhAZEtYctg7rm+QqGkRYqTNWgvlxZ6uNrdyUufTHyO
         7jyMgtF6nFPeof4KI9x1cwDzXhvBO+6GkURZ+7Gw8QGC/Flm4t3qRpwMUAzgudDvj54i
         d7JAgerLnHTydi+Ufl5c7cdvJBXMpZ6tqwREsIqHVaRyqtZhBlj7tIMJVoNC5/lEP9ec
         bKrsl8q3LCnVZKajXM1nCve4GSLULxriKnLZfUgIVekqYcfNIdCX+cDJeO/prxlgoiNa
         tWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734426568; x=1735031368;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GdTUhvict8QP95ODVq3VBD/97IqwhvwNQQSLRxy9C2k=;
        b=VgaS3tq2xrTrfKYks/aRlk7xHXE4fosIguAiWsPKnRt3oA6DXJMue8MENIqjbHTBPl
         axuitDIIz4WORChSKG/P30s3iq3vsW/yFEqxccmEb/G7yKZ2Q7vN6n+dq0343o5jvIef
         VIPhCIxVoflchK/U6VvZ6S9t6QWd8wTMCPUoguOxbl3GFH5UvPTfKxYyg2qfX2jPz63b
         FQBCMhnU6TfEFQNTUZgVAWNmAhmLuLBm0XsS9pX+CcnFr20FkObc4m3Is1Za9iOqAglX
         VRPRleb5jmPtxkSJA7ZiN/04LH/vmeJpn02I/iriQAcO1hlM/xqFzsgi7bRo+RBLqufC
         MHyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM8xS5y52dZ7f7QcU1MB43w3MzTI86mK8YzcL2Q8Uk8s8Jm2bFS6AwMz/6EChSMiGQoF0JbgTS3OPYLw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCLz7tR3CR8yJeWxSbmtfHlXwv8japSLiYUBVROtV/szh7Bdeu
	F4/a153b5JCgIdGWWqcsSV3VF5ujbb1g4lrXw/EfZuQRTekC22HQm1sDei4BfRfGHilvrniJN2Q
	gjw==
X-Google-Smtp-Source: AGHT+IGU20kqjTEH0qg2wrBjRVFipLJ0Ib95VwwIZLvzOerjf4VO//KSgFZw06uw+rufZ3TdiJ2B2NpM5Qs=
X-Received: from edyd21.prod.google.com ([2002:a05:6402:795:b0:5d0:821b:cd59])
 (user=gnoack job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2755:b0:5d0:7a0b:b45f
 with SMTP id 4fb4d7f45d1cf-5d7d559404emr2416074a12.10.1734426568415; Tue, 17
 Dec 2024 01:09:28 -0800 (PST)
Date: Tue, 17 Dec 2024 10:09:26 +0100
In-Reply-To: <20241216150722.4079213-2-gnoack@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <2024121418-blazer-valiant-c51a@gregkh> <20241216150722.4079213-2-gnoack@google.com>
Message-ID: <Z2E_tqgqXIwi5j4C@google.com>
Subject: Re: [PATCH] tty: Permit some TIOCL_SETSEL modes without CAP_SYS_ADMIN
From: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jann Horn <jannh@google.com>, "Hanno =?utf-8?B?QsO2Y2s=?=" <hanno@hboeck.de>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-hardening@vger.kernel.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

FYI, I have tested this locally - it makes the mouse curser show up again i=
n
Emacs.  (I do also believe that is it fine security-wise, but will also ver=
y
happily add a Reviewed-By or Tested-By from Hanno or others in the next
iteration :))

=E2=80=94G=C3=BCnther

On Mon, Dec 16, 2024 at 03:07:23PM +0000, G=C3=BCnther Noack wrote:
> With this, processes without CAP_SYS_ADMIN are able to use TIOCLINUX with
> subcode TIOCL_SETSEL, in the selection modes TIOCL_SETPOINTER,
> TIOCL_SELCLEAR and TIOCL_SELMOUSEREPORT.
>=20
> TIOCL_SETSEL was previously changed to require CAP_SYS_ADMIN, as this IOC=
TL
> let callers change the selection buffer and could be used to simulate
> keypresses.  These three TIOCL_SETSEL selection modes, however, are safe =
to
> use, as they do not modify the selection buffer.
>=20
> This fixes a mouse support regression that affected Emacs (invisible mous=
e
> cursor).
>=20
> Link: https://lore.kernel.org/r/ee3ec63269b43b34e1c90dd8c9743bf8@finder.o=
rg
> Fixes: 8d1b43f6a6df ("tty: Restrict access to TIOCLINUX' copy-and-paste s=
ubcommands")
> Signed-off-by: G=C3=BCnther Noack <gnoack@google.com>
> ---
>  drivers/tty/vt/selection.c | 14 ++++++++++++++
>  drivers/tty/vt/vt.c        |  3 +--
>  2 files changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/tty/vt/selection.c b/drivers/tty/vt/selection.c
> index 564341f1a74f..0bd6544e30a6 100644
> --- a/drivers/tty/vt/selection.c
> +++ b/drivers/tty/vt/selection.c
> @@ -192,6 +192,20 @@ int set_selection_user(const struct tiocl_selection =
__user *sel,
>  	if (copy_from_user(&v, sel, sizeof(*sel)))
>  		return -EFAULT;
> =20
> +	/*
> +	 * TIOCL_SELCLEAR, TIOCL_SELPOINTER and TIOCL_SELMOUSEREPORT are OK to
> +	 * use without CAP_SYS_ADMIN as they do not modify the selection.
> +	 */
> +	switch (v.sel_mode) {
> +	case TIOCL_SELCLEAR:
> +	case TIOCL_SELPOINTER:
> +	case TIOCL_SELMOUSEREPORT:
> +		break;
> +	default:
> +		if (!capable(CAP_SYS_ADMIN))
> +			return -EPERM;
> +	}
> +
>  	return set_selection_kernel(&v, tty);
>  }
> =20
> diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> index 96842ce817af..ed65b3b80fbd 100644
> --- a/drivers/tty/vt/vt.c
> +++ b/drivers/tty/vt/vt.c
> @@ -3345,8 +3345,7 @@ int tioclinux(struct tty_struct *tty, unsigned long=
 arg)
> =20
>  	switch (type) {
>  	case TIOCL_SETSEL:
> -		if (!capable(CAP_SYS_ADMIN))
> -			return -EPERM;
> +		/* CAP_SYS_ADMIN check happens in set_selection_user(). */
>  		return set_selection_user(param, tty);
>  	case TIOCL_PASTESEL:
>  		if (!capable(CAP_SYS_ADMIN))
> --=20
> 2.47.1.613.gc27f4b7a9f-goog
>=20
