Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A974CC153
	for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 13:25:10 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1bf5c314a57so30083355ad.1
        for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 06:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694438710; x=1695043510; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QYHU7Pr5BT6VuKyWwYsKCnfhHtSEOeezKltwZKlqIuc=;
        b=nVIrGKihXiHAYa1CH14quI0fHs/sXIUFirM1jf6axhtED8qrXvVAGLrXv1S4Ii2U8J
         APMRe4iY9oAKDlg91k5VZWgeeaeOUEutUgwZn2rXPGFCGNtfX5Y8i44R0swA8icrMLBn
         r0vQOE7k1eT3pxTcYVBHzhz95ALHFBj9iguItavr3bAPMUeHLEA0PkRHrjAP05t30i/F
         gN95nzRUwOCBNVI0s2iRM6mbs8j6GC8t1zO7NP1h/inuVN23CNmy/8UbEuebL3GWEDyR
         kSpFPYcFfZb+/+iUQqhX/exvo/jEOacY60XFiq7W15RrfQvavv9MLCuoH1xjDu1hpUD7
         k/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694438710; x=1695043510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYHU7Pr5BT6VuKyWwYsKCnfhHtSEOeezKltwZKlqIuc=;
        b=u+wXzjGlrXLbTSK7/8ZofOdzZhrvoHYwDGWmO93RlQiY9gkOuUFjGSM4dFV2W2gz/Q
         ys/07zWnvHcO2KuyMci0xYUVudyDYqsw7+JuHXkQDDq9PD4qQygbWqRXfAE1Ubq1RFic
         rPZ7DuK2n+nnFoYoMt/l0kajJ0zc+w5kK7UBGKYJp3mhcG6RdMlOVdkDSoEJxuClg5MQ
         viGXm80i6ZWDIiJO84xkIPy5HCQe34qvZuwBIcRKaY91gWm0kgOEjVlayffDCgelWBba
         8PHAL8aWUUohuUq6cGvOZuye4L/lV2o5+2HWqPU7+fUmwTu+GRRqr+c7v6LtswJoWm1q
         yWIw==
X-Gm-Message-State: AOJu0YxKAZx/k3fTIf24zdMogQwAc5ge9SGWVFBIh+Zz0wSo3i0djvU9
	fRgg7wOSDWRhQt8CKz+uc0s=
X-Google-Smtp-Source: AGHT+IEJEL7EHKSeeQ7nq+bwwXxX1Oa8Pfic+9143Y1UPQHFbmXr9cdymEVXn43t1L8MasQzFBMDhg==
X-Received: by 2002:a17:902:b18c:b0:1b2:1b22:196 with SMTP id s12-20020a170902b18c00b001b21b220196mr7887196plr.48.1694438709821;
        Mon, 11 Sep 2023 06:25:09 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id b12-20020a170903228c00b001c3c68747a3sm885152plh.260.2023.09.11.06.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 06:25:09 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 9B2CF83061A0; Mon, 11 Sep 2023 20:25:03 +0700 (WIB)
Date: Mon, 11 Sep 2023 20:25:03 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Ziwei Dai <ziwei.dai@unisoc.com>, Hugh Dickins <hughd@google.com>,
	Marcus Seyfarth <m.seyfarth@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux RCU <rcu@vger.kernel.org>
Subject: Re: Fwd: [6.5.1] Slow boot and opening files (RIP: kvfree_rcu_bulk)
Message-ID: <ZP8VL77rs0Pejgo6@debian.me>
References: <0e6fc43f-3078-911a-e63d-290c3e6d7b91@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/mcgnXAVZFgB+P+T"
Content-Disposition: inline
In-Reply-To: <0e6fc43f-3078-911a-e63d-290c3e6d7b91@gmail.com>


--/mcgnXAVZFgB+P+T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 03, 2023 at 08:34:44AM +0700, Bagas Sanjaya wrote:
> #regzbot introduced: v6.4..v6.5 https://bugzilla.kernel.org/show_bug.cgi?=
id=3D217864
>=20

As requested by the reporter,

#regzbot dup-of: https://lore.kernel.org/lkml/5011708f-b0ae-2853-0f87-a3b59=
845a2cc@gmail.com/

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--/mcgnXAVZFgB+P+T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZP8VKQAKCRD2uYlJVVFO
o+5dAQD3M3npMQfvuZUrqvb2a+tpF6PCUeIXRjjKL6786yTJcwEAuQQTsAsPnR4z
ZgRXKw8JbrZf6fHwI6+q1dMyw6TSlwk=
=Y/X5
-----END PGP SIGNATURE-----

--/mcgnXAVZFgB+P+T--
