Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBED8BF4
	for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 14:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWQfxFqY"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3b2ec9a79bdso2494056b6e.3
        for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 06:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699798101; x=1700402901; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zYY9iKgDLqPaktwUQQteh4tZmXuoFTMBRZqWPGDKs2Y=;
        b=mWQfxFqYDVybzi6LwDh+MM0GWHrdx589gsIZVcu00Wp7eJTDlz+flmsvKciyc6isv4
         UucBwN1DgkKV+/O1vExIKx8D/ojBAbR0fX03Nlwwt2rvbhCOVuw4klrHUaUbJ+M5ZBqG
         Lgy3i/suOUcXWM/3WroNJ0BOKQtoVW/yLg07FoF50JcagApbNzYapSylmJ+HLS9gknVv
         4jBmVFGSGLPup1WVQ1dKadyKxEz4BHPiJvpIno9lYx7ZLqQKWMH8y5mAkDIrEy/IzPFr
         XRTFM9MiVRMooPj1NRQOU9cDAnXGsGlF0huz8ixIOtQU12WhcpLxUZJxndZtcW6BqNBs
         M7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699798101; x=1700402901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYY9iKgDLqPaktwUQQteh4tZmXuoFTMBRZqWPGDKs2Y=;
        b=nAFNXUdHowuNEc6gyD4Aax0PmK/IKo1zF0vd1xW8fFx+gYTnr1GyFBNR2Imis41/vh
         5Hi1AJTnAJwmIJPJ/GT8UILKslg51C8yt8suUJ3mwb60ssGGR27cXjIeSjVZAYj39VRz
         jOt2riah0Z6+H9jdyaERtjWwZ5RW0GyGPvDz0zWFr/wF+VpOvXWlCZjBTak5Vc7M8JPV
         QSrtfM9gTTjcX81KRxFws+gy/3kA4qMy0+DmmKui6vITEONUxY0jsDUZUFVYC2fZ1lY8
         GF5lWBBIYCwvEN0GI7V5ZzoZNd4pbdTy4sVf8ng551Ak6Mblb8FkSgR+T2sv3FeA7uTB
         VYvg==
X-Gm-Message-State: AOJu0Ywl27FlxCqlNaj3cUKC2upA4uOpthjNqVdlPWGLnZJyvS8pl2rW
	+M2/kaPea8AFGcYpYYj/EFc=
X-Google-Smtp-Source: AGHT+IEWKgTK0EJVALX+kNokvKuBqPmzQ5WMm0OS6IIvOJXT9DjmLupXoGm4+r9yYrKunU0bml3/uA==
X-Received: by 2002:a05:6808:209b:b0:3b6:cda3:f379 with SMTP id s27-20020a056808209b00b003b6cda3f379mr7449035oiw.13.1699798100806;
        Sun, 12 Nov 2023 06:08:20 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id fb37-20020a056a002da500b006c33ae95898sm2515564pfb.78.2023.11.12.06.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 06:08:20 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 4B2991029D748; Sun, 12 Nov 2023 21:08:17 +0700 (WIB)
Date: Sun, 12 Nov 2023 21:08:16 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	pagadala.yesu.anjaneyulu@intel.com, gregory.greenman@intel.com,
	Linux Regressions <regressions@lists.linux.dev>,
	Johannes Berg <johannes@sipsolutions.net>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Subject: Re: [PATCH v3] wifi: iwlwifi: fix system commands group ordering
Message-ID: <ZVDcUGV1bSo6pnL_@archie.me>
References: <20231112095943.19353-1-emmanuel.grumbach@intel.com>
 <20231112100944.21177-1-emmanuel.grumbach@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gvvw1kz334TUinYX"
Content-Disposition: inline
In-Reply-To: <20231112100944.21177-1-emmanuel.grumbach@intel.com>


--Gvvw1kz334TUinYX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 12, 2023 at 12:09:44PM +0200, Emmanuel Grumbach wrote:
> From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
>=20
> The commands should be sorted inside the group definition.
> Fix the ordering so we won't get following warning:
> WARN_ON(iwl_cmd_groups_verify_sorted(trans_cfg))
>=20
> Fixes: b6e3d1ba4fcf ("wifi: iwlwifi: mvm: implement new firmware API for =
statistics")
> Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
> Signed-off-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>

Hi Emmanuel,

As this fixes a regression tracked by regzbot, let this be known by
regzbot by adding missing tags:

Link: https://lore.kernel.org/regressions/2fa930bb-54dd-4942-a88d-05a47c8e9=
731@gmail.com/
Link: https://lore.kernel.org/linux-wireless/CAHk-=3Dwix6kqQ5vHZXjOPpZBfM7m=
Mm9bBZxi2Jh7XnaKCqVf94w@mail.gmail.com/

> ---
> v3: remove changeId for real...
> ---
>  drivers/net/wireless/intel/iwlwifi/mvm/ops.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/ops.c b/drivers/net/w=
ireless/intel/iwlwifi/mvm/ops.c
> index fef86a8b4163..1627b2f819db 100644
> --- a/drivers/net/wireless/intel/iwlwifi/mvm/ops.c
> +++ b/drivers/net/wireless/intel/iwlwifi/mvm/ops.c
> @@ -550,9 +550,9 @@ static const struct iwl_hcmd_names iwl_mvm_system_nam=
es[] =3D {
>  	HCMD_NAME(RFI_CONFIG_CMD),
>  	HCMD_NAME(RFI_GET_FREQ_TABLE_CMD),
>  	HCMD_NAME(SYSTEM_FEATURES_CONTROL_CMD),
> -	HCMD_NAME(RFI_DEACTIVATE_NOTIF),
>  	HCMD_NAME(SYSTEM_STATISTICS_CMD),
>  	HCMD_NAME(SYSTEM_STATISTICS_END_NOTIF),
> +	HCMD_NAME(RFI_DEACTIVATE_NOTIF),
>  };
> =20
>  /* Please keep this array *SORTED* by hex value.

This fix is confirmed by one of original reporter and another tester, so:

Tested-by: Nikl=C4=81vs Ko=C4=BCes=C5=86ikovs <pinkflames.linux@gmail.com>
Tested-by: Damian Tometzki <damian@riscv-rocks.de>

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Gvvw1kz334TUinYX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVDcTAAKCRD2uYlJVVFO
o4n1AP9lxf8SrlAb6lA/gtDq4eQtZpoov24bFrAu7uaH8ysB+AEAiTJZjYSGqehF
LIlsl01m9bDrtN+Yf91aKJmxrNryMgc=
=A3Ud
-----END PGP SIGNATURE-----

--Gvvw1kz334TUinYX--
