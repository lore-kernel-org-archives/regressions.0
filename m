Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5502A3370EA
	for <regressions@lists.linux.dev>; Wed, 12 Aug 2026 06:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514794; cv=none; b=CXGFgNEYmEUnSV7/zsKWXXiyO6utdDWhFqb3lCFwjkY+tgOBiv+BHdSEFofSXPwpW+vHZ8W6/7VtbLrMa4vcqmbaqAtoVzzG2oa0gMnY3XA2ejuRtK9c3JWxbEEos299bzO/jVtB0Xgnn5VkXRq/Nq0CeZffGBoHW/dsrTsqh7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514794; c=relaxed/simple;
	bh=ZAJzop4AjvsiA4GTl3m1C8MJVDuXUxmiqm9F/Nw8O1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3dzKS0vrGvJBpv86+ZKA+SOXmjF2nh7c2Yy8iovl4zuNxgW3ZWxjB80iUpLhPKXqAgbUT9gUDWyF6jMPE3II3TI0EgHnIzts5bR/2LrbclWAPE8NOTk9TF3CWsG4/mEEGqwlEL2aclXDJrweZOVy9TJCi67PeG7rvPjheidFyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=g/KJdL7Z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="g/KJdL7Z"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495437bb891so4778545e9.1
        for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 23:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786514790; x=1787119590; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HorQEIgr4JhNec9eanHk78I2SPpuUlT0tC++CtCiMaE=;
        b=g/KJdL7ZTQ4vqnDDroXHQsK1ZzAO1Jf4Xrynk5ZS1QtOXsSfUyD/f/9L+Fu35Hq3Dr
         pt74xwrKvZ9bngkyAZV5J8dw8yOyPbUiQw7yiM59WX1fWQb0DxJBbKAPs+bqTbiUegaX
         dY95bMPWRZEuSXJh0W14RxEQ2ZfWdeRBizgK6EqiG/IbHlvDU8OoEpv71u1nH37Dj0p2
         rkKlugUEg6PCxjBVFSZbvt1S9h//jkpIYTjM0QpHNUHae+e1HzbzoiCgvEqM3MZt70Ob
         3mGV7sRB4IW1KiHZlyYdS2dy+2PxAWQnadqxtMivkv/M0rjAM9Vs9+/IqHuZ1o1ACvG8
         S8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786514790; x=1787119590;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HorQEIgr4JhNec9eanHk78I2SPpuUlT0tC++CtCiMaE=;
        b=HZN7G3Up6f/Yv9hrCI2S+CMqYJpu9Lsrb2eO8AHFqUHSsIYIT84972Fs3SBByKF3CV
         DxINTlkc27E7TeDtQESU2E5BoQc/5Pe/FCZka+VT4/MPht1sGG8S2sMYn2eqq4Lz8+Gb
         PypctIAp1aKeaUy7ssxfGkdWtZCJHKjrlB1Llb1NELhh/n7aq9CVEdh6ZZYC0xpHBuVN
         kLJaVVqp+0sUWXMDMFOT1jWByyBk9xxv9ZoR/a97K+YRFMGYXj0o8KWgbTK/zR8xxahC
         9k62tZ0c2919wqguVsFFANSUBQI7ib8jpC/7OlwdNKv7z4EjmWWb5E3kAiOCmBnrPqPA
         3SAg==
X-Forwarded-Encrypted: i=1; AHgh+RqOq5/TuQSx1+X4hiwiuHbJe1B0rbWkqeBkEkXj0mquh6763mHi2uuqmSln8hzhOtuZTHZEKh3Ju9FKuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuBSSvZGKTPFP5ihNqbPUKtzdZ4OsrH4nm+vgTNi0X8tZkwjJY
	kZEGo/pXhQQZYPmVS8VoGP8X2s/Lf93j7KxJBOsNjQ5fD86exbFvPCcWhY0EdPxfP44=
X-Gm-Gg: AR+sD11sP8YclfbJQw30VZGTph/dSzuxC4jt2ky1QLD44f8vkNu+P8b36sOvF/714Ca
	Q4M6wGLX9yH6lq8lAsiYD6dZvUh+/58qgS6fFeOVpIhV2QeHbGE7Hpdu4OWSGmqStiNZHkg3SFP
	B0w7iTDwuGsMRvLjEEPft1WaXpSLak6AL7RZAv0ldDoFmVSYvClE4mUcXvAOavuzQrs294Va7rr
	jLsSY/gMSo6C3Evvu6pnkU3TktrSpCh2pJW/HdrxlmXnJ2gAd9a5wPHzHWz+oo3wi/jDGODJwiY
	YajhiG70GpOP5u/tuf4dc4oDYnXe5DMOGCESzvPTaJcX+JDXF0eq5tI6TKOX1kwu1VcM9IWQGqN
	shKe64ClfmJhnq6sj5QIb79YBI8w+bhwBKiUT6COWaU6lRQFWxrjAIzv5/32z+hSm6ObvGF07u1
	YfNEjVDZw89GiZvNOEjsvKi1iExpAtHJegVggZbof2DaKWBVEx00TKazgP+l5MWQ7Ikw==
X-Received: by 2002:a05:600c:c87:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-4997c4fb76dmr22206145e9.6.1786514790233;
        Tue, 11 Aug 2026 23:06:30 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4997c948512sm19224575e9.6.2026.08.11.23.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 23:06:29 -0700 (PDT)
Date: Wed, 12 Aug 2026 08:06:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: John Garry <john.g.garry@oracle.com>, 
	Nilesh Javali <njavali@marvell.com>, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, 
	GR-FC-Storage-Upstream@marvell.com, agurumurthy@marvell.com, emilne@redhat.com, jmeneghi@redhat.com, 
	hare@suse.com, regressions@lists.linux.dev
Subject: [REGRESSION] Re: [PATCH v6 05/56] scsi: qla2xxx: Add FC operational
 firmware load for 29xx
Message-ID: <anwLLKJRVgL6a-aQ@monoceros>
References: <20260723050413.3897522-1-njavali@marvell.com>
 <20260723050413.3897522-6-njavali@marvell.com>
 <c324172a-a754-4194-a841-ec1d813dfde5@oracle.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wlq7zktslbm7aakd"
Content-Disposition: inline
In-Reply-To: <c324172a-a754-4194-a841-ec1d813dfde5@oracle.com>


--wlq7zktslbm7aakd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [REGRESSION] Re: [PATCH v6 05/56] scsi: qla2xxx: Add FC operational
 firmware load for 29xx
MIME-Version: 1.0

On Mon, Aug 10, 2026 at 03:27:01PM +0100, John Garry wrote:
> On 23/07/2026 06:03, Nilesh Javali wrote:
> > +
> > +	if (section =3D=3D TIM) {
> > +		if (section_size > req->length * qla_req_entry_size(ha)) {
> > +			ql_log(ql_log_fatal, vha, 0x0098,
> > +			    "TIM section too large (0x%x bytes, ring 0x%lx bytes).\n",
> > +			    section_size,
> > +			    req->length * qla_req_entry_size(ha));
> > +			return QLA_FUNCTION_FAILED;
> > +		}
>=20
> Not that this is generating a warning for i386 builds on the mkp-scsi 7.3
> staging branch:
>=20
> drivers/scsi/qla2xxx/qla_init.c: In function =E2=80=98qla29xx_process_rd_=
image=E2=80=99:
> drivers/scsi/qla2xxx/qla_init.c:9272:53: error: format =E2=80=98%lx=E2=80=
=99 expects
> argument of type =E2=80=98long unsigned int=E2=80=99, but argument 6 has =
type =E2=80=98size_t=E2=80=99 {aka
> =E2=80=98unsigned int=E2=80=99} [-Werror=3Dformat=3D]
>  9272 |        "TIM section too large (0x%x bytes, ring 0x%lx bytes).\n",
>       |                                                   ~~^
>       |                                                     |
>       |                                                     long unsigned
> int
>       |                                                   %x
>  9273 |        section_size,
>  9274 |        req->length * qla_req_entry_size(ha));
>       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                    |
>       |                    size_t {aka unsigned int}
> cc1: all warnings being treated as errors

This patch became commit c3930ec119cb ("scsi: qla2xxx: Add FC
operational firmware load for 29xx") now and is included in
next-20260810 and later.

#regzbot introduced: c3930ec119cb916be879c017ea1e389e05dbe1aa ^

Best regards
Uwe

--wlq7zktslbm7aakd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp8DWAACgkQj4D7WH0S
/k6BvggAsG7SGFLcknG+/aqI/u1jGCPHEq5z8Jk49ehBP0rOAmmU27VdhIxUL7HJ
rK6HFRcjx4KfzjAO/NHRP+aOB9Rxluaf/enIVaGJBVQxx5RXmyAFxEM6XZKc9Emf
UykEio89rzrgOvDUWRxq8PRdAfDCL7frOZEyC2BPanyo6oe/lPrF44qC0CyBE6nl
+lQ6uKMqMnmvqsyXBQ9SKSRsaX8fKfNT1RYmRk9DyMvSVG6BZNpP2OXlwkmOrEPL
SIpi4P36GRqOwkrCHq9N1OJ4kZkuAE0r5KxKWbQSteKL00mehRgui0bN+pxvZqeg
HcpQfUtsre4sbXVojxGWaKtgnvhXxQ==
=0nEt
-----END PGP SIGNATURE-----

--wlq7zktslbm7aakd--
