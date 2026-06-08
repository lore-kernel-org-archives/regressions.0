Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB434257452
	for <regressions@lists.linux.dev>; Mon,  8 Jun 2026 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780916270; cv=none; b=SrdgIZXuJZz62619CjGotkub1gtzsEMgVdlRloc1OnnabH1wwTy3EEKbbu2d+AOHohoXw3jcBC5OZXHiiwjZURMw7j46QzTmuNYbbHWtZd+nGyjMiQsB5l8ykU63yR5pPzkUL8PtyNk8oajJGqO046zQqxjM/qpaG3VYSPpcFCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780916270; c=relaxed/simple;
	bh=H9DOL/o9aLea2pHg1OX70F3vZ4vsfjUSxkft6MXXC5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O8qy0Pun516IoxR3ol4zZKU+QKjzO5VxWZv+YOBvdhKO1vXU+l87lK1ZprqBXkqeRO61F48qLve7QcTE7jrtIy0BhPd901fA4Uo7FfAokv3xfpqS6epA52Cl3+Gut6r+ZbOdTrrFzp5XhzAt8wdSQRshToIWnjubdPN/lhFT+Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cWqaWtKI; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cWqaWtKI"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bed19623d6eso500644666b.1
        for <regressions@lists.linux.dev>; Mon, 08 Jun 2026 03:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780916267; x=1781521067; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H9DOL/o9aLea2pHg1OX70F3vZ4vsfjUSxkft6MXXC5U=;
        b=cWqaWtKIcZIsOG04lMXMTcyjBZEAX8rJykQWEGqBykTAzbKc02WSGCzn0p4f8Zf2n2
         p8spERsH8iyXVFZgMr/O2PE7qPDOrdlRPzuu2LglqPQXwyOyPBhXQeXwBeu5zt9WvayZ
         iV14EFiI2FGSLRCEEqrxZzBo5F+J12S20h5CI+nPZf3gptT1p9Y103eUum8OKu4qAXzX
         PlKUd4Z1lEqAKHO/1OYEPzGUEe6+qK/hRJUYvMHLwmfKwwLER/CT/SBS2L4d4BqPNtgP
         C0tZxQ6n5BOIdwvHlkwcdZm2AGVC9ueFPSmOfF4dO86ItM6yijmEJv9hJNX6aVmdaGqm
         iPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780916267; x=1781521067;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H9DOL/o9aLea2pHg1OX70F3vZ4vsfjUSxkft6MXXC5U=;
        b=lW5bPRKIncUTu3PPFguCKhk1egqU/sAd/B8z2fvE26MsbN0aBY2M9bmXOlCZOuEaGp
         kGfifKkve1jR5c1dfmbHv84WsQkKQDhiUTFMpKf7r9msQ80TtFnoTK1QB9GwKP/AUoUA
         Ni4QYJdtqGozTkU2JJ9tboRpXMqmGYGso3ZSgEw3HOmNN03+l3cnAKX1pRoS6v8SdngZ
         jmgTnn8lgq8u4sdvSExvpBr5ALv3TvErFt1h3yFWxCiL/0FBC6wcG4H3dthM6wugqu/q
         2TSSmxZugu2sBUwr/wwJPt+R9yFl1hO8DSVjA8RYsb8goWg4Id5yiiQ3YylV6yW44BVV
         CEdw==
X-Forwarded-Encrypted: i=1; AFNElJ9GoTK5Nu5CdFnwtu60XhnqO3Kp4ZyWcDoudFJpAfqd2wlOa1KOAuMkbG6puLRF97iwznfRnZriFfI+Ig==@lists.linux.dev
X-Gm-Message-State: AOJu0YxklgnHtxmwNzpaaWEAlk3jZqJjvikTHlB6r7lrERyb2Y44Yvr5
	ZB7IPv67pShca9wPa7xKPfuRwai/cavUcaEAWjng+rXr8bhhuu1H66QbXtIG0O3CeGA=
X-Gm-Gg: Acq92OG5e9x1/H8wiZAEpDFEcqaScjacomy9PRKlxrdMJFgpi7E2F321NZeDsPdrGyG
	NuMiWy2uOccXb3EShHPRi1V9naXPqhCBRXERPP5rE7WS+PVEQfM8mYiAyf59qPPwZJ+2QYGub3v
	u3KRbJpqI7vMTn4wC9v86o8eJB/enLdr6gD1s69vHHr3RMI5CcUnqToW+w835KR9X5Vtq55mR1t
	BZgEITMFD0c33+MMPFHyXtWzB8QXPIR9+Cvq7xHl82M67EVQQq/cNEI9MXTI1lco2HLjR3tdFCL
	O23uPuopcy8Vylh53lJJNCnu3XGeKtpWPeQdWIbUi8RsNWCWJkTa3rimHNm/ICa31iBwQi4KgfP
	5V8SfBSQ0SDbz+04alJ4n3dHoVpMVURgn/R0g3b6JLeehGrDNHT/W2JpE3C6iVSS584goSluflZ
	Us/BecIm7muMTc+E8+RDlv0RQJQMngwwcxp9rMVrqOtOZuNyOjT0t0mSf1cCQYZVThzKel/eybi
	RcHKO7qGUw8Ow25LjPvUfHFMAIbM73zHvu+gkDqWrvrXCNYfMtHGFuiYLFbKzuQ
X-Received: by 2002:a17:907:7f89:b0:bb8:fd88:f400 with SMTP id a640c23a62f3a-bf370f6b0b1mr732997666b.21.1780916267018;
        Mon, 08 Jun 2026 03:57:47 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055308063sm854822966b.48.2026.06.08.03.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:57:46 -0700 (PDT)
Message-ID: <8d17788d-c7cf-47ff-9216-41f920eea621@suse.com>
Date: Mon, 8 Jun 2026 12:57:46 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] Long boot time with Xen HVM guests during
 PV spinlock initialization
To: Teddy Astie <teddy.astie@vates.tech>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Olivier Lambert <olivier.lambert@vates.tech>
References: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EJhgzHWGeNJ9mz6vTP1C080x"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EJhgzHWGeNJ9mz6vTP1C080x
Content-Type: multipart/mixed; boundary="------------tsXtAwWUSZsZg0hsalyZJhEB";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Teddy Astie <teddy.astie@vates.tech>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Olivier Lambert <olivier.lambert@vates.tech>
Message-ID: <8d17788d-c7cf-47ff-9216-41f920eea621@suse.com>
Subject: Re: [REGRESSION][BISECTED] Long boot time with Xen HVM guests during
 PV spinlock initialization
References: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
In-Reply-To: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>

--------------tsXtAwWUSZsZg0hsalyZJhEB
Content-Type: multipart/mixed; boundary="------------L6wly7QKGkrOWKkKyWHkEh4X"

--------------L6wly7QKGkrOWKkKyWHkEh4X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QWRkIFRob21hcyBHbGVpeG5lciAoYXV0aG9yIG9mIHRoZSBwYXRjaCBpbnRyb2R1Y2luZyB0
aGUgcmVncmVzc2lvbikuDQoNCg0KSnVlcmdlbg0KDQpPbiAwOC4wNi4yNiAxMjoyOSwgVGVk
ZHkgQXN0aWUgd3JvdGU6DQo+IEhlbGxvLA0KPiANCj4gSW4gNi4xMi41KyBrZXJuZWxzIG9u
IEFNRCBDUFVzLCB3ZSBvYnNlcnZlIGFibm9ybWFsbHkgbG9uZyBib290IHRpbWVzIHdoZXJl
IHRoZSANCj4gZ3Vlc3QgaXMgc3RydWdnbGluZyBvbiBQViBzcGlubG9jayBpbml0aWFsaXph
dGlvbi4NCj4gDQo+IFRoaXMgb2NjdXJzIHN0YXJ0aW5nIHdpdGggNi4xMi41LCBhbmQgYWxz
byBvbiBtb3JlIHJlY2VudCBrZXJuZWxzIG9uIEludGVsIA0KPiBwbGF0Zm9ybXMsIGJ1dCB0
aGF0IGhhc24ndCBiZWVuIGZ1bGx5IGludmVzdGlnYXRlZCBhdCB0aGlzIHRpbWUgKGJ1dCBJ
IGFzc3VtZSANCj4gaXQncyBhIHZhcmlhbnQgb2YgdGhlIHNhbWUgaXNzdWUpLg0KPiANCj4g
VGhpcyBvY2N1cnMgc2luY2UgYSBiYWNrcG9ydCBvZiA3NjAzMWQ5ICgiY2xvY2tzb3VyY2U6
IE1ha2UgbmVnYXRpdmUgbW90aW9uIA0KPiBkZXRlY3Rpb24gbW9yZSByb2J1c3QiKS4NCj4g
DQo+IFNvbWUgKGNsYXVkZS1iYXNlZCkgYW5hbHlzaXMgbWFkZSBhcHBlYXJzIHRvIHJlbGF0
ZSB0aGF0IHRvIHRoZSBsYWNrIG9mIHByb3BlciANCj4gbWF4X3Jhd19kZWx0YSBpbiB0aGUg
amlmZmllcyBjbG9ja3NvdXJjZSB3aGljaCBhcHBlYXJzIHRvIG1ha2UgdGhlIGNsb2NrIGZh
aWwgdG8gDQo+IHByb2dyZXNzIG1lYW5pbmdmdWxseS4NCj4gDQo+IEhlcmUgaXMgYSByYXcg
c3VtbWFyeSBvZiB0aGUgYW5hbHlzaXMNCj4gID4gV2UgdHJhY2tlZCBpdCBkb3duIHRvIGEg
c2luZ2xlIHN0YWJsZSBiYWNrcG9ydCBpbiA2LjEyLjU6IGNvbW1pdCAxYTY3OGY2ODI5YTgg
DQo+ICgiY2xvY2tzb3VyY2U6IE1ha2UgbmVnYXRpdmUgbW90aW9uIGRldGVjdGlvbiBtb3Jl
IHJvYnVzdCIsIHVwc3RyZWFtIA0KPiA3NjAzMWQ5NTM2YTApLiBJdCBpbnRyb2R1Y2VzIGEg
bWF4X3Jhd19kZWx0YSBmaWVsZCBvbiBzdHJ1Y3QgY2xvY2tzb3VyY2UgYnV0IA0KPiBuZXZl
ciBpbml0aWFsaXplcyBpdCBmb3IgdGhlIGRlZmF1bHQgYm9vdCB0aW1la2VlcGVyICh0aGUg
amlmZmllcyBjbG9ja3NvdXJjZSksIA0KPiBzbyBjbG9ja3NvdXJjZV9kZWx0YSgpIGNsYW1w
cyBldmVyeSBkZWx0YSB0byAwIGFuZCBDTE9DS19NT05PVE9OSUMgZnJlZXplcyB3aGlsZSAN
Cj4gdGhhdCBjbG9ja3NvdXJjZSBpcyBhY3RpdmUuIE9uIHRoaXMgSFZNIGd1ZXN0LCBTTVAg
YnJpbmctdXAgcnVucyB3aGlsZSB0aGUgDQo+IGppZmZpZXMgY2xvY2tzb3VyY2UgaXMgc3Rp
bGwgdGhlIHRpbWVrZWVwZXIsIGFuZCB0aGUgWGVuIHNpbmdsZSBzaG90IChoaWdoIA0KPiBy
ZXNvbHV0aW9uKSB0aWNrIHRoZW4gYWR2YW5jZXMgamlmZmllcyBmYXIgdG9vIHNsb3dseSwg
c28gdGhlIHNlY29uZGFyeSBDUFVzIA0KPiBidXJuIHNlY29uZHMgaW4gY2FsaWJyYXRlX2Rl
bGF5KCkuDQo+IA0KPiBUZWRkeQ0KDQo=
--------------L6wly7QKGkrOWKkKyWHkEh4X
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------L6wly7QKGkrOWKkKyWHkEh4X--

--------------tsXtAwWUSZsZg0hsalyZJhEB--

--------------EJhgzHWGeNJ9mz6vTP1C080x
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmomoCoFAwAAAAAACgkQsN6d1ii/Ey8y
6wf+OG96gAV1ZcRnq8/dlt9Jje0fZQEXvS3qKFdnHSXZuE7J2l/hCL8Mmsu/0zrLOofq+OqzH/5P
eVcZU7/To0S7vr/W21V7u2DooWhAX7jdKtZzcaTY8KMFhnay6ySi7CakSgD8IOEaqbgAfjD2rRfs
cIe5jvQ5IarH+wtyEM0tb47YaOB8YI1KaAFbcvHlAaDxMVp2NyeN7NbwC1/y+4TJmLrKX4MqoSiB
Mj47/Em8mkKhPI5bCvVoxR1qy0lzcRWx/9oUNtVMYdOdiBDzh9ZMOBgSb+lvSuHlleVSWhUZJu4J
It+jwYi9R1vftcBufTT8sPGJhzYgyuvp7IFS+pHBhQ==
=h4Ky
-----END PGP SIGNATURE-----

--------------EJhgzHWGeNJ9mz6vTP1C080x--
