Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80D41A83E4
	for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 11:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733918031; cv=none; b=CGoUleVVVMYsnaS/rEd5m4dFEbQZGQYTIMBbvoqLFcj4m2FFdRQz41O8J7+d4yVKhG/OhpJVvNcIExdRco9TJJuIMDC8WEdXt4D6Y16I9fncWoB2t5SjiRf4zPax5L7f3YWyrzdsjjIOkPhKcHdQKLbRqSGy2vmszJDNJYmD25k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733918031; c=relaxed/simple;
	bh=+R0+7C5nvllYcIQQ4mNgtqM96poYNitgNFUx4o4mftA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCVDIufS0SFo6p1fq64MY0LCCf7QlfmFHkErZnr3c8WfApYVh+PM/eDYWVmP+Y4J4mXWDzdv00G3eYk3zbZWpkVUJb1FG70TxU1smEKGcLhCrnKebKWanC+SkSRhWv/E2108j0DG27MhutBH8gjaJNZQwn5fEUZbq+DhmoHLuuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M3kcXCA8; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M3kcXCA8"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so5949375a12.3
        for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 03:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733918028; x=1734522828; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+R0+7C5nvllYcIQQ4mNgtqM96poYNitgNFUx4o4mftA=;
        b=M3kcXCA8WSrD193DkeGjIOA7J7MM11Bso8pzkCrTMj1T4YvJYQj1FoPRQK80K40RFn
         wsicLhcNrUdyUXOFX69BHfNrSvXsnLMkr8vv8+Jeh34wR6BUPu/NKIWB5mIeoVqaE/7f
         +iCaW8dTRpa7Kb6FEtBTB/3x9zvWueNslLqHD2XKn6ZM9Bd6v8w1yaHWU+zMP7HXNE2h
         7/5Hr8iCG6WdtCnG48JLM7LDSYMMrX7iJKT2sq5/EN6Ffuh67yjQaTtF4ortkRaT9Ux5
         5KUS+ukoKa69TW9t9rHoB1bTLO3RGqZoKxjQQR/8JcADPcl+38dQSyXsGK3P29kx5Bc9
         6cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733918028; x=1734522828;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+R0+7C5nvllYcIQQ4mNgtqM96poYNitgNFUx4o4mftA=;
        b=w+xvcHSskmMdS8ssDV3CxvqA/HryS3BX1QTxeZucSkDukcOYlYhXysDdUnV737OMVv
         ZTQ9hrJXLp5c12zeEYdy2obJECPUz7U7qewVRL9zeFD2KB9KTfm7ONQo8ST87tJ0IPYT
         U3uPHdr9UIvtNH3abyvriFxsZzSDp8j3gVEN7YkCaLb6iFoVpcQYbI4E/ogQWPYYB5YN
         0E2logHQB399ZTAgfK/W8A1zZUgvxtdqLUf6u5A1DqiFwhY/lLj+d2NZYjv5QwHLCuXf
         Ye6ljOufJwBB4yKpGXGXnaWgo+kdlemumRT51UW0ah6PpDkvGWwC7jyH2wyFGMl6MiJ7
         iDlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFBDa1TKZ3RO484QydscHw54xtEL7+FAUeuefM1BdvU6sIzlO5er1N4X7DhFxZmujRpBAXhuwqrB0MIg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yynm9ff6U/MpwSfUg3xe7nyb+qz9m/soqKPYCD+Hco8uy/NEhp4
	+PvcFkFczZ3Cn9sTtcdFHzYP6mjkeE3G7kkcG0Od9/vEgzxbWenSQ9zwY3DkzPw=
X-Gm-Gg: ASbGnctlgUwijrgCH5BhEZl7crT4mv0hXXfgf9gaY2eeD5ExqgLDP3Aknp4vRrGE9+z
	q8IgLRPLFZ+8F8QgfhfssRau3owei9annDUESQ8+C3BrMliXuZMnepdLuzLTSW4viDdpXG99Wqs
	xex6/sVldyNMFuDHBCDf7SDarkjE9Y6bbnsu8hmCTHUtoURdgCO+xK70FUd0nW/l9sY9QUwYL1e
	GVuxSeRijqQmpPjx3eLF0yeJplBSMx7sUPPtIEHGViPKbiSYTrDM/FjVjNOPfpwp+WChlO/vKql
	xFACbEjzn83BEl7C+Mae0AycGlTZXTaJswEVZyRQsnHeCUTFdqJ/MyE37pT6BCIeSxvU4rSrtXb
	4
X-Google-Smtp-Source: AGHT+IGO03Vy7/Zpc9Wz/aZOtOyjaC+nhsiaDKnU4Xri1dTiaKaNObvvpV9PhW20SnxQPeC6/DM3Yg==
X-Received: by 2002:a05:6402:3513:b0:5d3:cd5b:64a9 with SMTP id 4fb4d7f45d1cf-5d433170507mr2468066a12.34.1733918027892;
        Wed, 11 Dec 2024 03:53:47 -0800 (PST)
Received: from ?IPV6:2003:e5:8701:7700:f2d:e3aa:8e9e:99bf? (p200300e5870177000f2de3aa8e9e99bf.dip0.t-ipconnect.de. [2003:e5:8701:7700:f2d:e3aa:8e9e:99bf])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3eb109bc9sm5613036a12.42.2024.12.11.03.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 03:53:47 -0800 (PST)
Message-ID: <fe8db5b2-7524-49ea-ab8e-21f831dc009f@suse.com>
Date: Wed, 11 Dec 2024 12:53:46 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Linux 6.6.64 crashes when booting as PVH domU
To: Jason Andryuk <jandryuk@gmail.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 regressions@lists.linux.dev, xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <Z1l6XbHP6BTTZSwr@mail-itl>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <Z1l6XbHP6BTTZSwr@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dnr5QCG4S9m0K4gz5yYaxenH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dnr5QCG4S9m0K4gz5yYaxenH
Content-Type: multipart/mixed; boundary="------------TQhMIvn8ggQ2o6nwyvX7vp6m";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 regressions@lists.linux.dev, xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <fe8db5b2-7524-49ea-ab8e-21f831dc009f@suse.com>
Subject: Re: [REGRESSION] Linux 6.6.64 crashes when booting as PVH domU
References: <Z1l6XbHP6BTTZSwr@mail-itl>
In-Reply-To: <Z1l6XbHP6BTTZSwr@mail-itl>

--------------TQhMIvn8ggQ2o6nwyvX7vp6m
Content-Type: multipart/mixed; boundary="------------60F0NlJqcb3DyRKIqqsR10rj"

--------------60F0NlJqcb3DyRKIqqsR10rj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SmFzb24sIEFyZCwNCg0KSSBndWVzcyB0aGVyZSBhcmUgc29tZSBwcmVyZXEgcGF0Y2hlcyBt
aXNzaW5nIGluIHN0YWJsZSA2LjYueSBicmFuY2g/DQoNCg0KSnVlcmdlbg0KDQpPbiAxMS4x
Mi4yNCAxMjo0MSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOg0KPiBIaSwN
Cj4gDQo+IFdpdGggTGludXggNi42LjY0IEkgZ2V0IHRoZSBmb2xsb3dpbmcgY3Jhc2ggb24g
ZG9tVSBib290Og0KPiANCj4gKFhFTikgZDV2MCBUcmlwbGUgZmF1bHQgLSBpbnZva2luZyBI
Vk0gc2h1dGRvd24gYWN0aW9uIDENCj4gKFhFTikgKioqIER1bXBpbmcgRG9tNSB2Y3B1IzAg
c3RhdGU6ICoqKg0KPiAoWEVOKSAtLS0tWyBYZW4tNC4xOS4wICB4ODZfNjQgIGRlYnVnPW4g
IFRhaW50ZWQ6ICBNICAgICBdLS0tLQ0KPiAoWEVOKSBDUFU6ICAgIDQNCj4gKFhFTikgUklQ
OiAgICAwMDA4Ols8ZmZmZmZmZmY4MmI2NDA1MD5dDQo+IChYRU4pIFJGTEFHUzogMDAwMDAw
MDAwMDAxMDA4NiAgIENPTlRFWFQ6IGh2bSBndWVzdCAoZDV2MCkNCj4gKFhFTikgcmF4OiBm
ZmZmZmZmZjgyYjY0MDUwICAgcmJ4OiBmZmZmZmZmZmZmZTAwMDAwICAgcmN4OiAwMDAwMDAw
MGMwMDAwMTAxDQo+IChYRU4pIHJkeDogMDAwMDAwMDAwMDAwMDAwMCAgIHJzaTogMDAwMDAw
MDAwM2EwMDAzOCAgIHJkaTogMDAwMDAwMDAwMmE5YmM5OA0KPiAoWEVOKSByYnA6IDAwMDAw
MDAwMDAwMDAwMDAgICByc3A6IDAwMDAwMDAwMDJhYTBjZTggICByODogIDAwMDAwMDAwMDAw
MDAwMDANCj4gKFhFTikgcjk6ICAwMDAwMDAwMDAwMDAwMDAwICAgcjEwOiAwMDAwMDAwMDAw
MDAwMDAwICAgcjExOiAwMDAwMDAwMDAwMDAwMDAwDQo+IChYRU4pIHIxMjogMDAwMDAwMDAw
MDAwMDAwMCAgIHIxMzogMDAwMDAwMDAwMDAwMDAwMCAgIHIxNDogMDAwMDAwMDAwMDAwMDAw
MA0KPiAoWEVOKSByMTU6IDAwMDAwMDAwMDAwMDAwMDAgICBjcjA6IDAwMDAwMDAwODAwMDAw
MTEgICBjcjQ6IDAwMDAwMDAwMDAwMDAwMjANCj4gKFhFTikgY3IzOiAwMDAwMDAwMDAyMDIy
MDAwICAgY3IyOiAwMDAwMDAwMDAwMDAwMDAwDQo+IChYRU4pIGZzYjogMDAwMDAwMDAwMDAw
MDAwMCAgIGdzYjogMDAwMDAwMDAwMmE5Y2NjMCAgIGdzczogMDAwMDAwMDAwMDAwMDAwMA0K
PiAoWEVOKSBkczogMDAxMCAgIGVzOiAwMDEwICAgZnM6IDAwMDAgICBnczogMDAwMCAgIHNz
OiAwMDEwICAgY3M6IDAwMDgNCj4gDQo+IExpbnV4IDYuNi42MyB3b3JrcyBmaW5lLg0KPiAN
Cj4gTG9va2luZyBhdCB0aGUgY2hhbmdlcywgSSBzdXNwZWN0IG9uZSBvZiB0aG9zZToNCj4g
DQo+ICAgICAgODNkMTIzZTI3NjIzIHg4Ni9wdmg6IENhbGwgQyBjb2RlIHZpYSB0aGUga2Vy
bmVsIHZpcnR1YWwgbWFwcGluZw0KPiAgICAgIGY2NjJiNGE2OWUxZCB4ODYvcHZoOiBTZXQg
cGh5c19iYXNlIHdoZW4gY2FsbGluZyB4ZW5fcHJlcGFyZV9wdmgoKQ0KPiANCj4gQnV0IEkg
aGF2ZW4ndCB0ZXN0ZWQgdGhpcyBoeXBvdGhlc2lzIHlldC4NCj4gDQoNCg==
--------------60F0NlJqcb3DyRKIqqsR10rj
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------60F0NlJqcb3DyRKIqqsR10rj--

--------------TQhMIvn8ggQ2o6nwyvX7vp6m--

--------------dnr5QCG4S9m0K4gz5yYaxenH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdZfUsFAwAAAAAACgkQsN6d1ii/Ey8c
pQf6AiwcXh+1f9XIHbWJ3nN6sG+5OefKvcmQVyzazmY6dytj2wKZuV1J2hf2x0kn/Xv6BfkPNG/b
2IW5jWLHKDb3JPwGGh8w2HyUSxBJ9LI+jCJSTaZ6r+JKpn+FcV3Lvh4FZbCdC8SdXyEEW48xmaG5
fzD6gfRjxBv/Y0AeN/MB6vF06vvwLnCoVa3WdxI6sENZL2ypFSV4QPvl0wjm3HTkYtyeEczgS03M
/lvQPCBm45D09fi+r2v7QxpQFT7b4q9aUVUOKGD75lgfrII9NxKGlfds6c39dCUbMazFWGsjI3Nj
3itHMU8P5xVFQY+R/GZ3vo/zsp1QgIScQfmqFV6H7A==
=9l5Q
-----END PGP SIGNATURE-----

--------------dnr5QCG4S9m0K4gz5yYaxenH--
