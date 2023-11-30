Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBC4125C3
	for <regressions@lists.linux.dev>; Thu, 30 Nov 2023 03:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRmpO2LK"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6d7e6df999fso318410a34.1
        for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 19:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701316326; x=1701921126; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aZ7N9YtES1a0DlRuZSgil/lx/WENnW1vYXJvjd/eox4=;
        b=mRmpO2LKtlz0YS58JgmlC/AA63r7gw7+Eqcswo7M6hJneZOmsUGUecMUM0elFH2pFl
         qsR0kqL5XGUcR2M+LxjsOQhzIUrZJ4lQamUzpFpb+9GAyqLTUHndPqTGL1nqPKPGi4Ho
         BNgyuYXjGKSK6xbeeyDMDKBUHTJ/rqsmMF6+adUd6Om815/Q0OepdXvy+VAwCSwJnQzb
         rRuwGaXL7dhCeQBtLQzV+ppCkWz1NMpByUTmYGMkmx5/QhlUk5huKPvQ/JBDI48y0iKP
         eyiTayw5rORgbupLu20oTk9v1oZRJdSfW9i7JPyDNvmVSkDwwnX/qkqzMw2quQh3RCDO
         xicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701316326; x=1701921126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZ7N9YtES1a0DlRuZSgil/lx/WENnW1vYXJvjd/eox4=;
        b=hxxS//zLLKZgqgGIMcrX7N0ixzdFMGRgZCfjNip8XnyqCieOH1g0Z/zuWdySdfDok5
         PV41OHtG+NW0otXWBv5q+1vHEliO0GY05ysaZTt5IvRgvwnhBNmwQC+mlQytfHtVVEYK
         hPKcIlrDDlwZHpExsLznX3GqjUCv6QuoFRMNh6N6L5dLN4VDnMTsDx3FXLCL90ppon+9
         SROiDqUkAUKJX04xOdvy0XSrXdIE8uzibt7c+PDGIBWcq4rgTgIkdlEcrNch8YQoTvSj
         onYJRhC1/ZXLjD03wEq16u1M+VD9MWVUZJLfgnDtolPeX9GHdAdSXYZl1owTmSGuURCC
         iYRA==
X-Gm-Message-State: AOJu0YygNNNEQ1CdY3XWBwZXYk8Av+ii5nSAom9gmL9Nu3NfxJ8m6Dp9
	iEW5aueIU1KnxXEFAyUlhYs=
X-Google-Smtp-Source: AGHT+IHbHvpjIEjrCitzC7tr5ZCNCJ6mcLNgd03Agutg6T8XrYdJeQAzDJL77sXh7LMNpxIKOJEwBw==
X-Received: by 2002:a05:6830:1450:b0:6d8:53a5:7033 with SMTP id w16-20020a056830145000b006d853a57033mr3186774otp.0.1701316326204;
        Wed, 29 Nov 2023 19:52:06 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id c11-20020a65674b000000b005c259cef481sm171441pgu.59.2023.11.29.19.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 19:52:05 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id A2CBD10205C43; Thu, 30 Nov 2023 10:52:03 +0700 (WIB)
Date: Thu, 30 Nov 2023 10:52:03 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Genes Lists <lists@sapience.com>, tglx@linutronix.de,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	gregory.greenman@intel.com, kvalo@kernel.org,
	Linux Wireless <linux-wireless@vger.kernel.org>
Cc: Linux Regressions <regressions@lists.linux.dev>
Subject: Re: crash with 6.7 rc2 and rc3
Message-ID: <ZWgG48xjHEgG3u9w@archie.me>
References: <c46a6462-8263-455c-a6ea-1860020f5fab@sapience.com>
 <ZWV7JworMrjHJHsO@archie.me>
 <cf2dcc97-845d-4860-be4d-5822d2ebbfca@sapience.com>
 <022c67aa-b90a-4756-8725-5f7fba7dc780@sapience.com>
 <2ce6a24f-fc9b-45d2-8a11-73a3e69ffa13@sapience.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KxZoA7PtHbqu5DUy"
Content-Disposition: inline
In-Reply-To: <2ce6a24f-fc9b-45d2-8a11-73a3e69ffa13@sapience.com>


--KxZoA7PtHbqu5DUy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 12:53:28PM -0500, Genes Lists wrote:
> On 11/28/23 14:56, Genes Lists wrote:
> > On 11/28/23 05:39, Genes Lists wrote:
> > > On 11/28/23 00:31, Bagas Sanjaya wrote:
> > > > On Mon, Nov 27, 2023 at 03:55:37PM -0500, Genes Lists wrote:
> > > > >=20
> > > > > lenovo laptop boots fine under 6.7rc1 and older including 6.6.2 s=
table.
> > > > > but not for 6.7 rc2 or rc3.
> > > > >=20
> > > > > ...
> >=20
> >=20
>=20
> This appears to be build related. Starting from scratch with builds and t=
hey
> are now working fine.
>=20
> My sincere apologies - please ignore/close this as (silly) user error.
>=20

Telling regzbot:

#regzbot resolve: fixed by clean build

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--KxZoA7PtHbqu5DUy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZWgG3wAKCRD2uYlJVVFO
o5kHAP4uvok9RabEEM91N9uXtEExho0ks8Br/ecWYC+dAMAingEAurtRwwGCaZI5
/OMmCilhJPR5UnBxrnD6Mkc7OgBfHgY=
=4mkp
-----END PGP SIGNATURE-----

--KxZoA7PtHbqu5DUy--
