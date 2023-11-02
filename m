Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C496710E7
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 00:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMdJFIiM"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1cc2fc281cdso3156505ad.0
        for <regressions@lists.linux.dev>; Wed, 01 Nov 2023 17:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698885868; x=1699490668; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=seBFQ0Xl2FFi4ZCFH7eeqfsh3gca8oZxDWO/3FOsFOE=;
        b=bMdJFIiMk1UTpXBJi+AfhxUbVPmMZKpmHehHmOt+VyMyM10aXCC4sBzkY9o818yD9D
         FTNOQ9e0Nhr2uXjwAsa7Y64ZQzcN7aBJKpB6q6A3IMwO4ZbkRqBk4TeoHJ8/2/P+rju3
         YNSIr1aoGkJ+Rm2/asBmCkGDgLw5klS735LGre9EGsmgUusCMTzlA85+pRKlgI1aD6/3
         VFYyvoJDLQ8PPdxpcoMvfUfZc2mcDrLbtxbzRMj2dFqI2FrICDwhRKv57A+Am8AM4Yw5
         KXMTmb+G22K4pGjf4Abx3OpiND0o4hKHe9ehYjKkI8uzmSCxE3eenKn31j6UYzBIVQkx
         ThdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698885868; x=1699490668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seBFQ0Xl2FFi4ZCFH7eeqfsh3gca8oZxDWO/3FOsFOE=;
        b=lSPgmlfA5VwM27D1/2jb9ITb3YK/38OWXg47vLeJu8gX/acc/xJbgGPYbLi4PUaPL+
         yHy9TvDmkZqzR134/emZ07i+B89xUKjqwg9g3QcjRzV9JhLaA9rVwGsUm8oxZ59CxhO/
         n4DW2bvukxvwZ4asnPCbFxlz56siv7PIlAQIo1upK9iJQInPU5BHr4fSQ4arvm5/M03v
         YqcipkOjCZsXzsWYdbqaqx6HSMi9hkgelX3pKd7kQ47NZjVM356p/OnANQ1GNED9w9PN
         Ly0fANyBUvjr+K4u/HEu5xUaxnsUDOjT8/D3kMS0lXhjANr4X8letIe4bFFdzdQGKDGQ
         p6Vw==
X-Gm-Message-State: AOJu0Yw8qRnUKCDvYEXwGT8YtRtQu8jVPzSWTictZNGn1Q7q6f61tgsW
	N/IoyEahGWMYgWHsfRmjbvo=
X-Google-Smtp-Source: AGHT+IHAQYJfgzPpoY+n5ml6qcBK09ayc4zFRGBOp7MF/Oo0752z6Lk7NUXYU20g7DzP9loSa5PELQ==
X-Received: by 2002:a17:902:e494:b0:1c9:d948:33d5 with SMTP id i20-20020a170902e49400b001c9d94833d5mr10681928ple.64.1698885867926;
        Wed, 01 Nov 2023 17:44:27 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902bd4600b001cc2a6196b3sm1830196plx.197.2023.11.01.17.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 17:44:27 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 56C6C93F72A8; Thu,  2 Nov 2023 07:44:24 +0700 (WIB)
Date: Thu, 2 Nov 2023 07:44:24 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jiri Kosina <jkosina@suse.cz>, David Revoy <davidrevoy@protonmail.com>
Cc: "jason.gerecke@wacom.com" <jason.gerecke@wacom.com>,
	"jose.exposito89@gmail.com" <jose.exposito89@gmail.com>,
	"ilya.ostapyshyn@gmail.com" <ilya.ostapyshyn@gmail.com>,
	Nils Fuhler <nils@nilsfuhler.de>, Ping Cheng <ping.cheng@wacom.com>,
	Peter Hutterer <peter.hutterer@who-t.net>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Devices <linux-input@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: Requesting your attention and expertise regarding a
 Tablet/Kernel issue
Message-ID: <ZULw6AcBaD6z2UZA@debian.me>
References: <kRKTNDYigUSblpNgSuZ2H4dX03Of1yD4j_L9GgbyKXcDqZ67yh5HOQfcd7_83U3jZuQzxpKT3L6FXcRkkZIGdl_-PQF14oIB0QmRSfvpc2k=@protonmail.com>
 <nycvar.YFH.7.76.2311012033290.29220@cbobk.fhfr.pm>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9o0Xepcqt2gKLUfm"
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2311012033290.29220@cbobk.fhfr.pm>


--9o0Xepcqt2gKLUfm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 01, 2023 at 08:37:40PM +0100, Jiri Kosina wrote:
> On Wed, 1 Nov 2023, David Revoy wrote:
>=20
> > Hi Jason Gerecke, Jos=C3=A9 Exp=C3=B3sito, Jiri Kosina and Illia Ostapy=
shyn,
> >=20
> > I am emailing to draw your attention and expertise to a problem I had=
=20
> > earlier this week with my Xp-Pen Artist 24 Pro display tablet under=20
> > Fedora Linux 38 KDE after a kernel update.
> >=20
> > The second button on my stylus changed from a right-click (which I coul=
d=20
> > customise with xsetwacom or any GUI like kcm-tablet) to a button that=
=20
> > feels 'hardcoded' and now switches the whole device to an eraser mode.=
=20
> > This makes my main tool unusable.
> >=20
> > I don't have the skills to write a proper kernel bug report, workaround=
=20
> > or even identify the exact source of the issue. I have written a blog=
=20
> > post about this with more details here:=20
> > https://www.davidrevoy.com/article995/how-a-kernel-update-broke-my-styl=
us-need-help=20
> > , contacting you was something suggested by the comments.
> >=20
> > Thank you very much if you can help me.
>=20
> CCing a couple more people involved both in 276e14e6c3 and 87562fcd1342,=
=20
> and mailinglists.
>=20
> This is almost certainly the behavior introduced by 276e14e6c3, where=20
> previously the button was mapped to BTN_TOUCH, but now it's mapped to=20
> BTN_TOOL_RUBBER, causing user-visible change in behavior.
>=20

Thanks for the report.

David, can you resend the regression report as plain text email (preferably
with 276e14e6c3 people and regressions@lists.linux.dev Cc'ed)? You may need=
 to
see kernel documentation [1] for how to configure your email client to send
plain text emails. Also, include in your report details from your blog post.

Thanks.

[1]: https://docs.kernel.org/process/email-clients.html

--=20
An old man doll... just what I always wanted! - Clara

--9o0Xepcqt2gKLUfm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZULw4gAKCRD2uYlJVVFO
o86rAP0W2BDBLg9e3Lkm88CSq8pcy8WkJ1Y4HS6bDeKTlqYRvwD/U0tzcKJNLcoa
LsAndetDQD2noUF/v9fjupmto76y1AQ=
=MVKr
-----END PGP SIGNATURE-----

--9o0Xepcqt2gKLUfm--
