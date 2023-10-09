Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1535800
	for <regressions@lists.linux.dev>; Mon,  9 Oct 2023 08:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNHgTkuW"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c8a1541232so12096675ad.0
        for <regressions@lists.linux.dev>; Mon, 09 Oct 2023 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696841150; x=1697445950; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+UYiBL6SRbLOPgrNzGh3TGoyVQnJviY/7sooyahS/D8=;
        b=gNHgTkuWPnsvNHI21Y7rvynzgy3oMOehJ+6Nol3Sp0T/33xTKAAMFl4/FpHhDsv7sB
         LOPNsjL2y5hlGrqpYK/RnxQh8AsLWCK5d/l7J5AdPQyipTrimnqun/cvvbaOf8v6CrJH
         IGT+3soJAWPrz9hq/Slb0W2ag05+kZOic78ulCXd+/4Fo4V72dOoIsrHyknJquISB0PP
         k3pYcH2huSsvbrUvES38zRDEV11Y4/ak6UvsuMJ3G3LJ8vOF93kmAR4aEpNZQJ0OTOpv
         CaCnIdoKFoA32NV93uOyxJVx1hFEW8eZGLM0DV910QSQXtTtbOx8RIcP3W9xN1JRUwqD
         cSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696841150; x=1697445950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UYiBL6SRbLOPgrNzGh3TGoyVQnJviY/7sooyahS/D8=;
        b=hdf+iKVhQII9k2tsfflvgzEkwkYgMlUjdYI+Aapga0RSPELf3GnMYOtKrwLlzzUK20
         UNCcf9zGuDJXFKYO+/DyHwP/1kMFwZ18iKJmISb1reMrDqhATJy/ge7Am1ACXSHsWId3
         0LNcj5iq2EKcMExslhahNArCnsPl4W097ER5VD2lmQgnfzyotedAd/EBosMcPMRJLcIP
         4ntHrzUHzux8O72+Jc8O50aY5Q6+hMnPBnaodQFmQMy2jOlVFOQt7dx/EGKaY3mWnUUK
         /ysi53OnrUYLKw2TfJDTwAiVOJkNL9O95Oz013CsyZQ9AqvGJjSyszPmq0D4McU2Km3b
         zgjQ==
X-Gm-Message-State: AOJu0YwBJrxZSJf+dmIwbKne6sxraLCzCF77HqfqbvtcJUoxbl0wQFEh
	BgScL3rtDutGl5Vo8Ai6uoM=
X-Google-Smtp-Source: AGHT+IF05H4q63Cso7kjB1N3kLjdHmG3CmMzZbm0KtDP2GgiRIwTZqg0Tsw0un0gXDUMCRkfRhFrHw==
X-Received: by 2002:a17:902:d349:b0:1c5:e527:68b0 with SMTP id l9-20020a170902d34900b001c5e52768b0mr15337660plk.62.1696841149660;
        Mon, 09 Oct 2023 01:45:49 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id a12-20020a170902ee8c00b001bde65894c8sm8936969pld.268.2023.10.09.01.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 01:45:48 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id D98058FE13DF; Mon,  9 Oct 2023 15:45:44 +0700 (WIB)
Date: Mon, 9 Oct 2023 15:45:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Jaak Ristioja <jaak@ristioja.ee>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad
 L570
Message-ID: <ZSO9uArAtsPMPeTP@debian.me>
References: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>
 <31bdf7b1-0ed9-4217-b459-1d857e53120b@leemhuis.info>
 <CAAhV-H7fRpykesVUEyaTpVnFiGwpP+fPbtdrp6JwfgD=bDp06Q@mail.gmail.com>
 <CAAhV-H7XCmbgS=N4-SE8FnASAws8hnDRZsQJgXE+dwyARaqzNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e+saoYv3HPZRi7+a"
Content-Disposition: inline
In-Reply-To: <CAAhV-H7XCmbgS=N4-SE8FnASAws8hnDRZsQJgXE+dwyARaqzNw@mail.gmail.com>


--e+saoYv3HPZRi7+a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 09:27:02AM +0800, Huacai Chen wrote:
> Hi, all,
>=20
> On Tue, Sep 26, 2023 at 10:31=E2=80=AFPM Huacai Chen <chenhuacai@kernel.o=
rg> wrote:
> >
> > Hi, all,
> >
> > On Tue, Sep 26, 2023 at 7:15=E2=80=AFPM Linux regression tracking (Thor=
sten
> > Leemhuis) <regressions@leemhuis.info> wrote:
> > >
> > > [CCing the regression list, as it should be in the loop for regressio=
ns:
> > > https://docs.kernel.org/admin-guide/reporting-regressions.html]
> > >
> > > Hi, Thorsten here, the Linux kernel's regression tracker.
> > >
> > > On 13.09.23 14:02, Jaak Ristioja wrote:
> > > >
> > > > Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integrated Intel =
HD
> > > > Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) results in a bla=
nk
> > > > screen after boot until the display manager starts... if it does st=
art
> > > > at all. Using the nomodeset kernel parameter seems to be a workarou=
nd.
> > > >
> > > > I've bisected this to commit 60aebc9559492cea6a9625f514a8041717e3a2=
e4
> > > > ("drivers/firmware: Move sysfb_init() from device_initcall to
> > > > subsys_initcall_sync").
> > >
> > > Hmmm, no reaction since it was posted a while ago, unless I'm missing
> > > something.
> > >
> > > Huacai Chen, did you maybe miss this report? The problem is apparently
> > > caused by a commit of yours (that Javier applied), you hence should l=
ook
> > > into this.
> > I'm sorry but it looks very strange, could you please share your config=
 file?
> As confirmed by Jaak, disabling DRM_SIMPLEDRM makes things work fine
> again. So I guess the reason:

Did Jaak reply privately? It should have been disclosed in public
ML here instead.

>=20
> When SIMPLEDRM takes over the framebuffer, the screen is blank (don't
> know why). And before 60aebc9559492cea6a9625f ("drivers/firmware: Move
> sysfb_init() from device_initcall to subsys_initcall_sync") there is
> no platform device created for SIMPLEDRM at early stage, so it seems
> also "no problem".

I don't understand above. You mean that after that commit the platform
device is also none, right?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--e+saoYv3HPZRi7+a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZSO9swAKCRD2uYlJVVFO
oydtAQCjpra6tsxV4/98CtIBJeEv9SPFN/GBEOiRr+a0amnAaAD9HnpgYUQGuUI3
Li7bRmsGwGPIno+QwWiW2fiZl9ZcOwM=
=bSd7
-----END PGP SIGNATURE-----

--e+saoYv3HPZRi7+a--
