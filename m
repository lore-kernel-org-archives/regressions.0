Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FA51365
	for <regressions@lists.linux.dev>; Sun,  7 May 2023 02:34:11 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-643990c5319so2130405b3a.2
        for <regressions@lists.linux.dev>; Sat, 06 May 2023 19:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683426851; x=1686018851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6m2i8964ey9FKIQVYoul4zNGiU1tR8noRvHejWkEJ4U=;
        b=fbNOOrGXXgaOaj3QPUvXonFQi2tDbKt0CqVt4X+Hlqmg7a3ceS6LXRbjnKbVljFoab
         tLYLFmYp0XeF9R49438ynw9RLL2pzJFOgHmQIVFPoRHiEHJHa5FNkwUZJgFnLb9WB1hH
         EB7cKRkSqTQ3ZT2TJrEqbZsG98VWKjG65GbXFNPD0mMsDBaiXmvbOi5NUbzRAkKjzMH4
         WZFvk90M4V/cCQrOypS+YQF9KUc1Vpd86o/lb6OLhKx2yytluvpgjNbyrV1BqUqKYuIW
         ZGEjO6WCQYkaO3+apd42b3lwgkX42mE9siQ6iwzLKJFn3c7syaFpuTdf/GMzG8FW9z5Y
         itkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683426851; x=1686018851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6m2i8964ey9FKIQVYoul4zNGiU1tR8noRvHejWkEJ4U=;
        b=dpM4aboV2UxZvWer56GyM4j7YkS3fjeMzcqrkyxHJAqSaxKpd1DZWm7raMQ7xkLEIh
         yifXCOxXNjf99Um4YNSStJ12kmdLLSgboJWM5lBGYimmYS5vQJFjlFp42U9cuJtt8i+Q
         zNPIx/Y76XDbjtVQjVdZF7Vat8C2UTRhHlC6zOPGvR59lBsKe3lb3wdqGPVEI9bdAPgs
         re0sa0rPIG6Cyba/7h8HBUgWcNW253bV0dI2VrIRTwVbZYtkPQMsbT+ZL1ZsXQUo2b3D
         4ehpN9odlgS+2w95oIwNppFa0VuNO2UTZo2XuUjtCfb02l1eiZ/hLGz757rNxWGk7L+c
         1aFg==
X-Gm-Message-State: AC+VfDx3PfBRRcCrIKIRmVbLUyAswuozZAR9F5fVe47HkNq4K3rE0Qlj
	u3wQxz657KwdZnpuCvFwVnI=
X-Google-Smtp-Source: ACHHUZ6t6+esLF0hTaUE8GkdhdpwOOQtP+mQuy2cIC4+az7TXUhgl0cD/GlkNfQaYUIz+sGKijgUEw==
X-Received: by 2002:a05:6a21:7898:b0:f0:5a5b:7bea with SMTP id bf24-20020a056a21789800b000f05a5b7beamr8357667pzc.61.1683426851152;
        Sat, 06 May 2023 19:34:11 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-35.three.co.id. [116.206.28.35])
        by smtp.gmail.com with ESMTPSA id v12-20020aa7850c000000b00627e87f51a5sm3723168pfn.161.2023.05.06.19.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 19:34:10 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id F12B1106873; Sun,  7 May 2023 09:34:06 +0700 (WIB)
Date: Sun, 7 May 2023 09:34:06 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: evgeny nikiforov <evgeny.niki4off@gmail.com>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, linux-wireless@vger.kernel.org,
	Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Subject: Re: [iwlwifi] 6.3 regression, AX201 crash on traffic activity with
 Pixel 7, bisected
Message-ID: <ZFcOHkwI8erdlKdC@debian.me>
References: <CAPrf5XXD8COh6DK9s41uvgJ5V57nenUQVeb1f=cFVqaWDN++dA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F/57nm9pIGEA54YJ"
Content-Disposition: inline
In-Reply-To: <CAPrf5XXD8COh6DK9s41uvgJ5V57nenUQVeb1f=cFVqaWDN++dA@mail.gmail.com>


--F/57nm9pIGEA54YJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2023 at 02:29:14AM +0500, evgeny nikiforov wrote:
> Hello
> I have a laptop with Intel Wi-Fi 6 AX201.
> After updating from 6.2 to 6.3, I'm experiencing wifi crashes, wifi
> restart when traffic is flowing with Pixel 7 Pro (wifi 6E/802.11ax).
> Other older wifi devices probably not affected (tried Xiaomi pad with
> wifi 5/802.11ac).
> Tested with iperf3 in both directions, rsyncing Pixel photos to
> laptop, via router (wifi 5) or via Pixel wifi hotspot.
> The whole system freezes for seconds, no cursor movements possible at
> these moments (libinput "Touch jump detected and discarded" in logs
> indicating this).
> No problem with the 6.2 kernel.
>=20
> Bisecting leads to this commit of bumping FW API to 74
> 9ad1e7e5b0c488e4518edd698238a87ac6a73caa,
> looking strange to me, but reverting from 74 to 72 in 6.3 indeed
> successful with no crash.

Thanks for the report. However, it is better to also attach your .config
so that people here can know which config options are enabled (and your
hardware setup).

Interestingly, when I see the culprit commit, it looks trivial to me:
it just bumps maximum firmware API version, so theoretically drivers
using lower API version should continue to work. Maybe you got
one of your bisection steps wrong.

Anyway, I'm adding this to regzbot:

#regzbot ^introduced: 9ad1e7e5b0c488
#regzbot title: AX201 crash on traffic activity due to firmware API bump

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--F/57nm9pIGEA54YJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZFcOGAAKCRD2uYlJVVFO
ox7CAQDz7X4BIZetFYf5xDlesSK4n/xhGALqkQA/jbiy76HqXwD/VdhazGC5IYYE
0QcUnhKVoWyq18YVsBCPK4gMmS1s5wQ=
=7XJc
-----END PGP SIGNATURE-----

--F/57nm9pIGEA54YJ--
