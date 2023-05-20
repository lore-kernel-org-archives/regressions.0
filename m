Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2DB624
	for <regressions@lists.linux.dev>; Sat, 20 May 2023 02:16:22 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1a516fb6523so36970625ad.3
        for <regressions@lists.linux.dev>; Fri, 19 May 2023 19:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684548981; x=1687140981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lFgyeYw4uPK6HO8hs9FRdVOfgCGNivxnwmXr9VMJrDo=;
        b=DoD8GwmF2nlWu+yHJ3xHDVInM293//B2zW3ZK73ZkXnOZeVJNv1G91PULPGAOZJLRX
         wzxIwTxaouX37dwag+QW0ieFMFiiVmx0RWrD6jUjOH6fv1xHGzn7k/E2Oj8YPeHXBBkX
         u0fShKanlW6S+FA9ENGR/kpgjexVAXoWjJJ7PJxN81rYNljeE3NmnivGaBtoJlvcfIPv
         Om/06THeksmrbjY7sW4hdtbTvc2xG/zBLKrZ6LFq7WFPYcjv99sTUYaIGkLYnEHHlu9m
         4dW3aYROEM8yzwHPuBdCekQ16zm2Hv1DEDHYbdUlh6CLFVMKklt0c3odVWBDtzgNFOQE
         KwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684548981; x=1687140981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFgyeYw4uPK6HO8hs9FRdVOfgCGNivxnwmXr9VMJrDo=;
        b=AUJKfOBFetVSeYWjluWlmEdqWa4hevArAI8/NxrSoC7fG59o2JvTHNpeHOFETHDbc9
         gVUXvj6Hy7MGBK6LUAN9Xem1Yg+/lFrfaFkoGXDmNGImVzE0OLKv93ZJRWs81T8dejAO
         0dgsTnp9EY7sX0ZwirX4yRJhx+HZyiV3mLSN6eMRYgWcyFlnhZwxlhQdT9GaypD0WHlA
         JOrY+XQljr+yOqNMDIuJla3QfuYta55xEZFntKhLHuSF/qtuzbR18PdadZ2q9PzTPt2F
         8mVoKb4I2jYtVA4ib4h+hHSKK9pP/t4wpXcL3rQhyoIul40ygalLncsMndO4ZAq6qCHd
         Iyiw==
X-Gm-Message-State: AC+VfDw9j3H98dqB0ijXnnE2nUiJnS7VHbt6fwh5AkMVwcrpOttB311+
	d6HFXM1RV1d3nzau+FsuVoM=
X-Google-Smtp-Source: ACHHUZ5uDX9A05fqyl3r2z7ZsQfBkXnB/zDTEtuHhK4CITCJcUviCGg40/57dB4lFG3yVKDfjiQfow==
X-Received: by 2002:a17:902:d382:b0:1ae:3991:e4f9 with SMTP id e2-20020a170902d38200b001ae3991e4f9mr3897402pld.61.1684548981433;
        Fri, 19 May 2023 19:16:21 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-25.three.co.id. [180.214.233.25])
        by smtp.gmail.com with ESMTPSA id jh12-20020a170903328c00b001a19f3a661esm295628plb.138.2023.05.19.19.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 19:16:20 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 988531069E8; Sat, 20 May 2023 09:16:17 +0700 (WIB)
Date: Sat, 20 May 2023 09:16:17 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Input <linux-input@vger.kernel.org>,
	Linux i2c Devices <linux-i2c@vger.kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, kolAflash@kolahilft.de
Subject: Re: Fwd: ThinkPad L540: suspend not working (deep / S3 / standby,
 regression Linux 4.19 -> 6.1)
Message-ID: <ZGgtcaGIECpaXKvp@debian.me>
References: <73883c7d-42db-7ac6-fa43-b9be45cdc795@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wREUupUIgHJ2Wbjf"
Content-Disposition: inline
In-Reply-To: <73883c7d-42db-7ac6-fa43-b9be45cdc795@gmail.com>


--wREUupUIgHJ2Wbjf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 08:19:39PM +0700, Bagas Sanjaya wrote:
> #regzbot introduced: v4.19..v6.1 https://bugzilla.kernel.org/show_bug.cgi=
?id=3D217462
> #regzbot title: psmouse suspend failed on ThinkPad L540
>=20

The reporter had narrowed down possible culprit commit range [1],
thus telling regzbot:

#regzbot introduced: v5.16.18..v5.17-rc3

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D217462#c3

--=20
An old man doll... just what I always wanted! - Clara

--wREUupUIgHJ2Wbjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZGgtZQAKCRD2uYlJVVFO
o9aLAQC6hU7NN4GSTfBKgKeqs8JmCvfJgpTt6DbB6FgDW1030AD/cTZsWR+xE1xU
pw87w0X/mt7M0TWhJbvezzYs/i/cIg8=
=s0ct
-----END PGP SIGNATURE-----

--wREUupUIgHJ2Wbjf--
