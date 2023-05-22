Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A2B10F4
	for <regressions@lists.linux.dev>; Mon, 22 May 2023 06:45:32 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-25332422531so2253224a91.0
        for <regressions@lists.linux.dev>; Sun, 21 May 2023 23:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684737932; x=1687329932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LjDrbtvTn67xGfPbBeqbRLDQjDn4H8fCj2S01FROHyU=;
        b=g/EFfzC9Z7HcAGAWKjt+aUgy6W0DPQMT+1xjQg5SPiT/Msoht7eDsHNHRYEAj4/crL
         XOCzG8Y/DbjXMeSeLDfOmZAoC4q6cfQV3/rZzFwBLCLcYSnu0hUosCqhrqeoJs5wO+b7
         7OKpQi66Td6/2/GnVUs7ljyJqUUBLkytW796W93fcp0+dSMfpLAGOkoH46dCevRr+Ey2
         LOr59k8DA5SigJdzK+7SDr3e7mg6kSSJ96WmLSOsh1rVoS59N/X0EPRwWM2BGQQYzjaf
         P488HrDSntk5LQxa4fmanQZYwyT6xuauZHWPn9MW8mitawxUt0LBYzQvaOpEFZwmtl/T
         JtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684737932; x=1687329932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjDrbtvTn67xGfPbBeqbRLDQjDn4H8fCj2S01FROHyU=;
        b=WL+DZwxfCgh8LZUpMfJvJScGOGvQYO56rUjQ+A7phYiXMY2dfw8L6HaTS3rK8UDNws
         RceoOf7JSEN9Cz+OWsX+/2+Mm5LYEA2uD2fjWAvVQodKyDQ6Uod6DwZcMJukbmMpZFr8
         iRPvCa658eQtr5R5c06aPLvDWVXlmIikc9xh0AuZCjv9m1zLCJfs7Mv+OVohr8lwjJgd
         PBrk0PjZUoOjXzC8M4ZvMIwuy9Hxj8kGvh3mB/KO/SSc8GbNrZmW8wfRsX2iqGCeYFEC
         91vt2eo2aDhoeIgpWObE8VXm4Ye46aCZFkqS2B6Q6/5HDWdKwdQI3ngnrrHAHA5itpYw
         XP2A==
X-Gm-Message-State: AC+VfDylVM8FesZS7vXSoYFrO+su6VkjX4Xg//mvqUQRaQcnrmKlzVBA
	2YUhvLXDy0D3wfFO9kpd4cI=
X-Google-Smtp-Source: ACHHUZ6hVR2GnXu1H1lD10qc8nxDW2RagqhHiOIeBdBCoqAFkjve7R17MHzRR8hknZmiBFsNFsXi4w==
X-Received: by 2002:a17:90a:db16:b0:250:1b4c:d861 with SMTP id g22-20020a17090adb1600b002501b4cd861mr10934788pjv.13.1684737932055;
        Sun, 21 May 2023 23:45:32 -0700 (PDT)
Received: from debian.me (subs09a-223-255-225-68.three.co.id. [223.255.225.68])
        by smtp.gmail.com with ESMTPSA id ha11-20020a17090af3cb00b0025368c90773sm5207523pjb.34.2023.05.21.23.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 23:45:31 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id D225F106ABB; Mon, 22 May 2023 13:45:28 +0700 (WIB)
Date: Mon, 22 May 2023 13:45:28 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>,
	Pedro Falcato <pedro.falcato@gmail.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux EFI <linux-efi@vger.kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Alan Bartlett <ajb@elrepo.org>
Subject: Re: Regression. -6.3.X Good. -6.4-rcY Bad.
Message-ID: <ZGsPiEq/yE1taACL@debian.me>
References: <8a79151b-ef75-08ad-ae3d-f6cdabfeaa47@gmail.com>
 <CAKbZUD3FBiaLGWq=TipfevqXP0SBz8F+=L6JSO+FMZOv0QQ9AQ@mail.gmail.com>
 <CAMj1kXEJj4+CFX3YfCZZu7RwxoVf=5PHZcZ8tG7x8xO3x4KPAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U1fv8V3wsTFbNp5O"
Content-Disposition: inline
In-Reply-To: <CAMj1kXEJj4+CFX3YfCZZu7RwxoVf=5PHZcZ8tG7x8xO3x4KPAw@mail.gmail.com>


--U1fv8V3wsTFbNp5O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2023 at 08:33:47AM +0200, Ard Biesheuvel wrote:
> I've sent this out as a patch and queued it up as a EFI fix. Thanks!

Telling regzbot about the fix since Ard forgot to add required tags:

#regzbot fix: 3610dc36f4fd76

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--U1fv8V3wsTFbNp5O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZGsPiAAKCRD2uYlJVVFO
o7IkAQCfW5qyntrvODsBdWvQiLtt3bRqaM3rk/LVflVoxmAF9QEAjEkECq63YpYO
cKqqQjSu7Gqa7Naz0QTnCTXte8DzDwA=
=KFm8
-----END PGP SIGNATURE-----

--U1fv8V3wsTFbNp5O--
