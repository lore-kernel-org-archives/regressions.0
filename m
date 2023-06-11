Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1484F2900
	for <regressions@lists.linux.dev>; Sun, 11 Jun 2023 11:31:51 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b039168ba0so22156395ad.3
        for <regressions@lists.linux.dev>; Sun, 11 Jun 2023 04:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686483111; x=1689075111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ET+8jv1Sr4c8KNb9UT3DWTBXEn+DrM0MENG4Vij4uyQ=;
        b=ByLAexixDGYoAAbP+TdnYMa5G8F/VvOmM2T7/k+wQ3cghFSNw4Kj2IASok17J7GtyC
         pCfzHh4wSayC2NXfPUYE5UTGZGAvsxY0hoesHUUjSvY+EXJAg9ApMd/ncGMQ8Zpt2zo5
         2dWmy69/WS7xsoZGYIbNEeHU1wTzK9gHgmOHmK5TVmSO//bspmX9a+Q4oiBHTTJIybS5
         oLsqXrllscjmhjrL7peXQSqiWz/CugCFIORxjrW1urVFQzRXSdzR2nNPxSfGRevYccb6
         jvg/uAW9JNITn/Y2P/ySuDZpDuzJQnuAIaagbCQMyiIaIeG1iJzNxF5hkMtCzUQG2zy5
         Yiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686483111; x=1689075111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ET+8jv1Sr4c8KNb9UT3DWTBXEn+DrM0MENG4Vij4uyQ=;
        b=YKan96JKprKi72t8T3PSHvvErq4v7ih1pgbXBusMenckPZcAGnQsDbyBRQ0HRSKzS6
         b7DH7a5NP6DiJ9vjgsZBoc5DJMPy46LR+Jprs0/WXBkJl3rw8u+69f/Ej/D3eDyg145i
         OXfrPbtXEHTI792h+ojLkKzEyQQOhNoI4kA273I5wNA7f+2JNvf8f/x8kPlxQDUCQSfi
         /hzE7cwDQ2pt/QHC16MhzplJkYCscKDBJfrZPD8dl0CzRxtoL8irDR7rIRjS6QxEd3VQ
         jSdr5bpEdPDrQh+ugX8SXi4I38ieVstIQ+mSWVGth9KVQ0J/31/nOkrwePp0McGjt+jJ
         B6xg==
X-Gm-Message-State: AC+VfDzWI53Q9SkmahqGSntX00jFaCypGmQKj3ehZbBmqEUbkBHr/7IK
	XMcNG7lK9wANwJoXxK5ZwRg=
X-Google-Smtp-Source: ACHHUZ7cRXXUiwx/VGfZs4Qirpj+wNLdNsY/9ynhNKhbPawe6sObhyNHGvcYnjCovYAKTibn3tXS+Q==
X-Received: by 2002:a17:902:8642:b0:1b0:348:2498 with SMTP id y2-20020a170902864200b001b003482498mr3561999plt.2.1686483111258;
        Sun, 11 Jun 2023 04:31:51 -0700 (PDT)
Received: from debian.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id jd4-20020a170903260400b001b3b83b7d4esm1417503plb.211.2023.06.11.04.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 04:31:50 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 18522106A3A; Sun, 11 Jun 2023 18:31:34 +0700 (WIB)
Date: Sun, 11 Jun 2023 18:31:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Joe Breuer <linux-kernel@jmbreuer.net>,
	Bart Van Assche <bvanassche@acm.org>, Pavel Machek <pavel@ucw.cz>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <len.brown@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Phillip Potter <phil@philpotter.co.uk>,
	Linux Power Management <linux-pm@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Hardening <linux-hardening@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux SCSI <linux-scsi@vger.kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Dan Williams <dan.j.williams@intel.com>,
	Hannes Reinecke <hare@suse.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: Fwd: Waking up from resume locks up on sr device
Message-ID: <ZIWwlptfVphjGz9u@debian.me>
References: <2d1fdf6d-682c-a18d-2260-5c5ee7097f7d@gmail.com>
 <5513e29d-955a-f795-21d6-ec02a2e2e128@gmail.com>
 <ZIQ6bkau3j6qGef8@duo.ucw.cz>
 <07d6e2e7-a50a-8cf4-5c5d-200551bd6687@gmail.com>
 <02e4f87a-80e8-dc5d-0d6e-46939f2c74ac@acm.org>
 <b2cf6d96-a55a-d444-d22e-e9b3945ba43f@jmbreuer.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pJUn/uCZg2bV7nGQ"
Content-Disposition: inline
In-Reply-To: <b2cf6d96-a55a-d444-d22e-e9b3945ba43f@jmbreuer.net>


--pJUn/uCZg2bV7nGQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 11, 2023 at 11:05:27AM +0200, Joe Breuer wrote:
> I'm the reporter of this issue.
>=20
> I just tried this patch against 6.3.4, and it completely fixes my
> suspend/resume issue.
>=20
> The optical drive stays usable after resume, even suspending/resuming dur=
ing
> playback of CDDA content works flawlessly and playback resumes seamlessly
> after system resume.
>=20
> So, from my perspective: Good one!
>=20

Thanks for trying the fix and telling the result. But tl;dr:

> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>=20
> A: No.
> Q: Should I include quotations after my reply?
>=20
> http://daringfireball.net/2007/07/on_top

(while I'm removing the quoted context below your reply after the fact).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--pJUn/uCZg2bV7nGQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZIWwkAAKCRD2uYlJVVFO
o0dcAQDBLvOwhF7MNiLJ3qtN+3ezvWqHj9xZ1JeN01prxbawGgD+NSKtGG1O0leF
rjwIYm0dINVegT1HRoIZQ0flawMzpAg=
=j2UP
-----END PGP SIGNATURE-----

--pJUn/uCZg2bV7nGQ--
