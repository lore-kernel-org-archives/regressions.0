Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764D418B0D
	for <regressions@lists.linux.dev>; Wed, 17 May 2023 13:17:07 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-64ab2a37812so12993489b3a.1
        for <regressions@lists.linux.dev>; Wed, 17 May 2023 06:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684329427; x=1686921427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yHXuyHwVCeuY27Dn1Z0at52ryyIy4L1nPjIskZAszmI=;
        b=dUOMQp99ITY+BLsYtUfBUox35t4cHq8L99aLU4kEb/muIhogRXPxriKIy3bGhM2cIk
         Qm5vHpgfi8JzuSS7TXFXzvIqNHoiDNg8ykl4RxdhyNw2/95P5OOZ3XaaaYRmaXr+9qhP
         eyQaDeiUK+M30Y/rP999YAu1c8iQZ5pjqwpQ9JE7ugH7Nbg1YITtikepM3Qp1WTRdCnU
         1253YWL3lLBG1gZt2okIuiR8zJZWO/lEQu4rvuuCv+tzNM2FDnmT12ftVQ4uGF9aNNuf
         Zg2/0sxkU0fIXqL80dbr/59DUAxpaUJKK8K5iNjoNMj7t2IuJkYzHLjjjQr7KYO84X96
         XeKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684329427; x=1686921427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHXuyHwVCeuY27Dn1Z0at52ryyIy4L1nPjIskZAszmI=;
        b=O7h64MhsBcg8IXaYxAaLl6LYW3eOjdwnblrzYsxWgeNPiXP463rB9x1pJNT7RyYFX8
         hr7cVTNnlbdRBFQ2E2dRg5rGrHiLfKpTPbi65HxVhACX01vduDzm1Orza2va07bCFBma
         pJyE5wuveoJ1qBBAjdz5kfvHaoDtoNPM+SRrbxPzOhHvQk8DNsumb1ihyVxVD/IMPAnd
         rzzvRwyHU7CE0rUmlZc/zFsGCx887ckcaquhFM7EKicuRC8AW5bpM3duWBqWL+T6rzgx
         KJhVxPNcwKfHvPnkPepIRJisiNfQXU5ATRCHCf+W13HWyeTkzFORGYF7pDif/ty5xrq9
         cndw==
X-Gm-Message-State: AC+VfDwhbJLs/oy6zL0SUo8OJHmEuRzjrFShec9dVhrg77S3TMjIhFXS
	p42zGGdIgDcnllkOpidzdII=
X-Google-Smtp-Source: ACHHUZ53Bt8k3To/ZCJUCFRY1gJ/yj1dblrLK/SwggOMj6JCejIVpvqNUPmQiL1F96xkVOy3qaQmXw==
X-Received: by 2002:a17:903:11c6:b0:1aa:d235:6dd4 with SMTP id q6-20020a17090311c600b001aad2356dd4mr2718253plh.19.1684329426721;
        Wed, 17 May 2023 06:17:06 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-43.three.co.id. [116.206.12.43])
        by smtp.gmail.com with ESMTPSA id o18-20020a17090aeb9200b0024decfb1ec2sm1527675pjy.30.2023.05.17.06.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 06:17:06 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 37E13104714; Wed, 17 May 2023 20:17:03 +0700 (WIB)
Date: Wed, 17 May 2023 20:17:02 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>,
	Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Linux Input Devices <linux-input@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, guy.b@bluewin.ch,
	poncho@spahan.ch, Bastien Nocera <hadess@hadess.net>
Subject: Re: [regression] Since kernel 6.3.1 logitech unify receiver not
 working properly
Message-ID: <ZGTTznb+zal7XRkv@debian.me>
References: <9b987585-0834-bb8c-3414-283c29f3f2ab@leemhuis.info>
 <bec024d5-4088-00ae-f7b5-7188868b1707@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MBlPoFm2IDF6Uk9n"
Content-Disposition: inline
In-Reply-To: <bec024d5-4088-00ae-f7b5-7188868b1707@leemhuis.info>


--MBlPoFm2IDF6Uk9n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 01:58:43PM +0200, Thorsten Leemhuis wrote:
> Hi, Thorsten here, the Linux kernel's regression tracker.
>=20
> On 08.05.23 11:55, Linux regression tracking (Thorsten Leemhuis) wrote:
> > Hi, Thorsten here, the Linux kernel's regression tracker.
> >=20
> > I noticed a regression report in bugzilla.kernel.org. As many (most?)
> > kernel developers don't keep an eye on it, I decided to forward it by m=
ail.
> >=20
> > Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=3D217412 :
>=20
> TWIMC: a few other users (three or four iirc) showed up in that ticket
> and reported problems with the receiver, albeit the symptoms are not
> exactly the same for all of them, so there might be more than one problem.
>=20
> I'll try to motivate the affected users to perform a bisection. But
> would be great if those with more knowledge about this code could
> briefly look into the ticket, maybe the details the users shared allows
> one of you to guess what causes this.

Hi Thorsten,

Another reporter in the same bug ticket has already pinned down the
culprit to 586e8fede7953b ("HID: logitech-hidpp: Retry commands when device
is busy"). I'm now updating regzbot entry (and Cc'ing the culprit author):

#regzbot introduced: 586e8fede7953b

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--MBlPoFm2IDF6Uk9n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZGTTzgAKCRD2uYlJVVFO
o8v/AQDMzxXPL0aJTjJvzDxxNi7DhL90709+agUP7k6Ys1BHdwEA8KY+RvcY9h4G
b9R7HSqlbCmnbX1nhs9j/8Zq4ghLzA0=
=uvie
-----END PGP SIGNATURE-----

--MBlPoFm2IDF6Uk9n--
