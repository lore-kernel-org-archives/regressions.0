Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8970D6FA3
	for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 08:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6chvqct"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6be0277c05bso3003673b3a.0
        for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 00:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699776300; x=1700381100; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MCPz+LLdNV+OMS0ITTC7ljEwfSKVRnmW3O4azfs6WcA=;
        b=O6chvqctVTIre5zeSRZjP8jX/ca82Hwi0IROpMQgGmxi1aViGr9B4zPKhaeZ8EqSMa
         UyEQrnM+ilWTsmhN5bSWJvd4yCO/4CWRMYMexS/pDbp4lLRvYtI7R+Vw/5pqVSUlVEfq
         eSVDA3+ffAlvp2oKLYxyZ1Cg/tZaM115LMBKcK6Les3M4p4+gVrEWpgSZVXuSWVI+jJN
         lF41qNKb8LMBeSBDwMglLB9IRC9Apg7gM264zzlnA6ysT4zTNa8boO0LOrmG/Vlhml2b
         5YGgaJBqZ4RMsG1LIKNgGGqJz9lLX/8rxkrPq5cuX8s5FXkHShEYXcp+qI5d0IiY0Gi/
         cG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699776300; x=1700381100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCPz+LLdNV+OMS0ITTC7ljEwfSKVRnmW3O4azfs6WcA=;
        b=iVvizrFuzPWUMDeykWhKxezoZq19Lq2sOGBqtR1r9rWZbIRLaaXJgWMCYXqNQkSR/f
         Em0eLxuaI9mcxqYWP3YiglX8wsGYyzeBg+FUXiphcvupnUxQGoBTrT1Mc1PlZNLV3bfM
         1BUaHx5Kjg6Rtm1gYlh40NzXc88UzoXACht+xR2TT1PmNbvzGM4KYzYCHRFMpx34AI0T
         Vt9CyL1WMxLZLH39aE7j4Mv53kXGjagiWGDuE9UEqk2pqX+lnt9tYW/agFhJV+Z+gKeC
         aPkBz8VTjV42xIK27npHD5bsLWPBI3sbgVSD6TZeJR9TpBYRBKC68WLoli4BbG58Evtq
         LD9Q==
X-Gm-Message-State: AOJu0Yy5r1FtUXluFn4ikvYjg/EjlBOwz6jaRL6AkSfKeLrHBROhL6H3
	IdyWwvlmJaf6dU8NH+TZUjM=
X-Google-Smtp-Source: AGHT+IF64oeMjwBto6kBHOKcV1zS4Ipo0hgg8xERT+w4dChYlfINGCvxeIFQCglyzpAXHqx5Orpjaw==
X-Received: by 2002:a17:902:b94a:b0:1cd:fbc7:2737 with SMTP id h10-20020a170902b94a00b001cdfbc72737mr1996657pls.52.1699776299609;
        Sun, 12 Nov 2023 00:04:59 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id l4-20020a170902eb0400b001c61901ed2esm2228034plb.219.2023.11.12.00.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 00:04:58 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id B7385101C1E07; Sun, 12 Nov 2023 15:04:56 +0700 (WIB)
Date: Sun, 12 Nov 2023 15:04:56 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kalle Valo <kvalo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Gregory Greenman <gregory.greenman@intel.com>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Johannes Berg <johannes@sipsolutions.net>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>
Subject: Re: New iwlwifi warning
Message-ID: <ZVCHKCumfnY0AGBP@archie.me>
References: <CAHk-=wix6kqQ5vHZXjOPpZBfM7mMm9bBZxi2Jh7XnaKCqVf94w@mail.gmail.com>
 <87a5rja129.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s2I+/k1Zs5883t/R"
Content-Disposition: inline
In-Reply-To: <87a5rja129.fsf@kernel.org>


--s2I+/k1Zs5883t/R
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 12, 2023 at 09:22:06AM +0200, Kalle Valo wrote:
> Linus Torvalds <torvalds@linux-foundation.org> writes:
>=20
> > I only noticed now, because it doesn't cause any issues, but that may
> > be because this only happens on my desktop, and I don't actually use
> > the wireless there...
> >
> > The WARN_ON in iwl_trans_configure() has started triggering as of this
> > merge window:
> >
> >         WARN_ON(iwl_cmd_groups_verify_sorted(trans_cfg));
> >
> > and causes the appended warning at bootup.
> >
> > Comments? Anything in particular you need from me for debugging?
> >
> >                 Linus
> >
> > ---
> >
> >     WARNING: CPU: 3 PID: 2060 at
> > drivers/net/wireless/intel/iwlwifi/mvm/../iwl-trans.h:1158
> > iwl_op_mode_mvm_start+0x969/0x970 [iwlmvm]
>=20
> I investigated a bit and at least two other people have reported this
> warning but I couldn't find any fix:
>=20
> https://lore.kernel.org/lkml/2fa930bb-54dd-4942-a88d-05a47c8e9731@gmail.c=
om/T/
>=20
> Adding also Johannes and Miri.
>=20

It seems like the culprit authour from the above regression report
(Anjaneyulu) missed the report (AFK?). Cc'ing him anyways. If there's
no response from him, let's revert the culprit.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--s2I+/k1Zs5883t/R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVCHIwAKCRD2uYlJVVFO
o1C6AQDlKGAkcGaVxy0c5H1ovsqFXdHGTT4NVcwTJq2pqYUpSAEAt24YTIMusu1F
WqCYebMxUlaIu8wUMf6V3MoVhArLlAc=
=TbX2
-----END PGP SIGNATURE-----

--s2I+/k1Zs5883t/R--
