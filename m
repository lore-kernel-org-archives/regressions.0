Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD0315B8
	for <regressions@lists.linux.dev>; Wed, 24 May 2023 03:58:24 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-534696e4e0aso331007a12.0
        for <regressions@lists.linux.dev>; Tue, 23 May 2023 20:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684900704; x=1687492704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eoFUq15BfcYMvDYkbbe5qe+ZjxrdZ/BZL1FuqpuGwYI=;
        b=NPPQHhxaY0hpKceunhe5E93G5vLNcXTCZl0myVLNJpzoM5OOYU2rLMn0jk2PhAJJhE
         YePOJZUxLRhZixUMSjoPqLYNt2uSMkAPGnXWbG0EF8hplN9DGzVObkBxrvHOwduGtT2R
         /qqYApyVQKHeCTzI1sMmDKFgOGB80MybLgWMTccZVvJUIA5qpO72g/PfY52YEVn+ANnc
         N+9nWkoPAivd68El2FLGAYA0ZLNKdkcUS5mjtfz2EW6GAQYkMbXa18aZFvJT8N1uobCe
         oFqgvDX6kLnPNwwW1qRBi/Qmi0mWMWZRzc2o/D0xbFFz2w+LTDPvu2QEjh8ly2b5BD/e
         rGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684900704; x=1687492704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoFUq15BfcYMvDYkbbe5qe+ZjxrdZ/BZL1FuqpuGwYI=;
        b=GfrCz/LOJiUU4JLGN9MP/IF/lj4u1eC8rsuY/Pfukbw3v2cfvcI1TTicp/hCddtho0
         PzRnFc024f6O5/JPaBkjX1CWEjw8+Jv7Sf39LKDb7ffdTaKilxl3t943DQKtlaHGTaZK
         zKioNZkYdtKQuVQv1+pv8sIG/oBQ67fgQP6rLr96AxMpFIutr4FiTztohthC6w/WP92O
         I4QjTjXArSa9YmQKj/BYQW7zhoTIYTuBlTfb8R2Ur0bo5Fq88Y9g1KklDDY+4mVSKoaq
         dH/3ysSo1hM6GC8ijy8akMpwvTPmFq6RErtJMI4XOzfcTzAiAdg/JMvcn9G0mcZ/+f6N
         xFnw==
X-Gm-Message-State: AC+VfDzKXVH37sfiIGKEnxHa/gWrwQRaZlR2hicDA1ltgF3te9qfmmNx
	GTA8EfjZ5pV+Fu3GuP49P10=
X-Google-Smtp-Source: ACHHUZ74R9rTWqtJ3JwYDu9EiI/76WjbYN939ePLnJ/gNaNyOyE6aZuV+jiidKERNWRW6RKgOQEi+g==
X-Received: by 2002:a17:902:ea0f:b0:1ad:fa2e:17fc with SMTP id s15-20020a170902ea0f00b001adfa2e17fcmr18549234plg.2.1684900704188;
        Tue, 23 May 2023 20:58:24 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-68.three.co.id. [180.214.232.68])
        by smtp.gmail.com with ESMTPSA id jc1-20020a17090325c100b001a1b66af22fsm7582775plb.62.2023.05.23.20.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 20:58:23 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 2981B1069C0; Wed, 24 May 2023 10:58:21 +0700 (WIB)
Date: Wed, 24 May 2023 10:58:20 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Haochen Tong <linux@hexchain.org>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, linux-input@vger.kernel.org,
	Basavaraj Natikar <basavaraj.natikar@amd.com>
Subject: Re: amd_sfh driver causes kernel oops during boot
Message-ID: <ZG2LXN2+Sa2PWJqz@debian.me>
References: <f40e3897-76f1-2cd0-2d83-e48d87130eab@hexchain.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YBhjpwkXDbp8U+2d"
Content-Disposition: inline
In-Reply-To: <f40e3897-76f1-2cd0-2d83-e48d87130eab@hexchain.org>


--YBhjpwkXDbp8U+2d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 01:27:57AM +0800, Haochen Tong wrote:
> Hi,
>=20
> Since kernel 6.3.0 (and also 6.4rc3), on a ThinkPad Z13 system with Arch
> Linux, I've noticed that the amd_sfh driver spews a lot of stack traces
> during boot. Sometimes it is an oops:

What last kernel version before this regression occurs? Do you mean
v6.2?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--YBhjpwkXDbp8U+2d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZG2LWAAKCRD2uYlJVVFO
o7V9AQC0xTz1VBHy4yB1nKdpCOLGimzuKpfUKeRBzGsZaiiIAAD+MGxV4LLpO9Wb
cbsOdM8WB+gLP+Nu/W/lvhtvcoyJDQo=
=B11Z
-----END PGP SIGNATURE-----

--YBhjpwkXDbp8U+2d--
