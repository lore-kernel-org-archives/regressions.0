Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8264A24EF89
	for <regressions@lists.linux.dev>; Wed, 19 Mar 2025 06:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742367272; cv=none; b=AmUjKDOdYPBeJ8bXr2HX1ryUjRrJuRaROkJ1TEeOExIefJaD+Yo05UjTP1TyHhZwpb2/O0sd36fIsc780RXDyCRwccHcqT3gnxPCvr8Ll0Sw5Bn6ggWGgDr1uyPkZmFrP+8qcRMsE7dmDS38gHWFQTKd7x8ZOJUModjSVfVF2Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742367272; c=relaxed/simple;
	bh=EYSpEBI6eqvoOHdX7m6tvlR62VKWzvwZKITq4iF4d3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkImsF1LJQoJ2byN83RrFalzTXOlinJswIdS3RsgmEDJraqcoHffjzMny5xabrJo3FpFdpuxcf93eK+R6wM7or33ew4znALv931FlWLjx31YImGKDPdaSWg2sYfrNo3kkXYGKilch9p4MQeW+TaPia9AcPCLgd52ndWT5xXGbqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AhJHwJDq; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AhJHwJDq"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso996419566b.1
        for <regressions@lists.linux.dev>; Tue, 18 Mar 2025 23:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742367269; x=1742972069; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EYSpEBI6eqvoOHdX7m6tvlR62VKWzvwZKITq4iF4d3Y=;
        b=AhJHwJDqkHZsMt1YRTh2PyJPc4erA4Kb93LkCS346tkf04/uWg/ZIzakFYsgrhWPdS
         HX7LcnAaoZl6sJo9KuU4+I61sQi0ehLq8PsTDvTzVP30a+iERjvzUVL8K+mr+AQtMgsR
         38L7SOzr/XFD42QP3M7DQ9aNB/KyqR+q3n9VHO80Sw0vr7rj/J4IDjD9nOQHhh+QdNIh
         +R71MiNLcZRt/E4YSZrEPuDdL2XNHiVV+pXsSsReG8PoLmzbooMrEgMtnEohB7dRycYo
         yFK9aO9iSAntg5r+30QR95m1MblBviwQ2Nk5kcVdyEVyyNrIO3Qt+PkJ+WRrfAvFxanh
         uoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742367269; x=1742972069;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EYSpEBI6eqvoOHdX7m6tvlR62VKWzvwZKITq4iF4d3Y=;
        b=lUB0PpC2oJtw1ccYlZvtEPB3XtdCtUBEm4Eba54hqTcVwW1tD5n01RX6QnWuabcdMV
         q/HML4qhCC+tl6IHw6DHnHFKHpzTBnEwR/LSIryvGx0mwFim4sCC3WtIkZCiNnkBWgv8
         WJP8fBM54NeV9YlRxNfO0Squ7nUjmHrQZiryakqc9eUmY75TTaJUts5xw4ALq1S2BY1u
         DyRm1ZMllQMxKGo8/RbjeXP0zEMicECFrb9PqXnFY1aimxxqOFmdZ9pln+1TRUQ1LyQL
         aBJSq3sp7r82Xh48eyxCG11H2kHcjxem1UMQmUTUVphuwoUEmD1MMqaypkR9B+Lfrrtv
         5TPQ==
X-Gm-Message-State: AOJu0YxBadv85+QfMYim8Vb1+DAslAR2PySWsPG/2Z/JZq4NoP+2XnPI
	9bpDHbwQW711eCARIOUTUMdWfWvGDCMSX/rBUivmmEzVwJXPttde7XuF0X6CJbA=
X-Gm-Gg: ASbGncthzXnvH/R5KfXN/EC+nCJC9bJOtK4CYBnCeCvLwxXiWlq+6hPaf8Xzap/nbhs
	X6qANcriaOx2oU8Dru2+z0rSLC5lj66LeKP7iG6leDJ5I1vm+kry1xE60s/UyByN74qBNrcUcWP
	1Zw2LkRjDAKUzB8Hey8KNSgJnRbubMQjnwK6WPOzVIKgwGaEaBVaViPjB4UH1aNsDiMDlQbCEuY
	MbgFihPq56YWu4f0iy3niN+hq8qeL4r5yslmqJuHwNPpM7rJOTew0U3Kxdu2bhxg4+rlhJBg3ar
	SjkVZe8UaKtlyGRQZkko7n3jDt2HvPRpmwZtLCuN3HKXJMNZxJU/g8z7J5FPQPv0mcKtOqTvBXM
	eR2ee/OZbdZeQvS5R71cR9mf+Cf6OCpUb16H6lNhapn7RL6OHro9vLtVZOOYS29HVzWxCMA==
X-Google-Smtp-Source: AGHT+IHUkDHDRBSYgPBEy/BDPONmn1Rmz5jUsScGDB2N+ZSeP/8GzTUNH2C/bBb2/5QOKRWqIKnPBg==
X-Received: by 2002:a17:907:3e1d:b0:ac2:aa51:5df2 with SMTP id a640c23a62f3a-ac3b7f91d17mr138642766b.47.1742367268625;
        Tue, 18 Mar 2025 23:54:28 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b? (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de. [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a3e0e4sm968158766b.136.2025.03.18.23.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 23:54:28 -0700 (PDT)
Message-ID: <d6947457-c1e7-476a-9857-f4a6450b9d94@suse.com>
Date: Wed, 19 Mar 2025 07:54:27 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Error building Kernel 5.4.291 due new code in xen/mmu_pv.c,
 running Lubuntu 18.04 i686, gcc 14.2
To: ofbarea <ofbarea@gmail.com>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, maksym@exostellar.io,
 "jbeulich@suse.com" <jbeulich@suse.com>, andrew.cooper3@citrix.com
References: <CAH6+_gDqeSDs0BRo=EB68Uvg+L2gsuNrB3ont3qzEJTARVsPkA@mail.gmail.com>
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
In-Reply-To: <CAH6+_gDqeSDs0BRo=EB68Uvg+L2gsuNrB3ont3qzEJTARVsPkA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ics0VznIs3fSSzfdiLhN0pLD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ics0VznIs3fSSzfdiLhN0pLD
Content-Type: multipart/mixed; boundary="------------JMLZ5tERyxhyvPw2jWkYJ7bd";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: ofbarea <ofbarea@gmail.com>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, maksym@exostellar.io,
 "jbeulich@suse.com" <jbeulich@suse.com>, andrew.cooper3@citrix.com
Message-ID: <d6947457-c1e7-476a-9857-f4a6450b9d94@suse.com>
Subject: Re: Error building Kernel 5.4.291 due new code in xen/mmu_pv.c,
 running Lubuntu 18.04 i686, gcc 14.2
References: <CAH6+_gDqeSDs0BRo=EB68Uvg+L2gsuNrB3ont3qzEJTARVsPkA@mail.gmail.com>
In-Reply-To: <CAH6+_gDqeSDs0BRo=EB68Uvg+L2gsuNrB3ont3qzEJTARVsPkA@mail.gmail.com>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------JMLZ5tERyxhyvPw2jWkYJ7bd
Content-Type: multipart/mixed; boundary="------------G0RtRyh4z6fny555wpPZ7yvw"

--------------G0RtRyh4z6fny555wpPZ7yvw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDMuMjUgMDU6MDYsIG9mYmFyZWEgd3JvdGU6DQo+IFsxLl0gT25lIGxpbmUgc3Vt
bWFyeSBvZiB0aGUgcHJvYmxlbToNCj4gS2VybmVsIDUuNC4yOTEgZmFpbHMgdG8gYnVpbGQg
b24gaTY4NiBsaW51eCB0YXJnZXQgZHVlIHRvIHByb2JsZW1hdGljIG5ldyBjb2RlIA0KPiBp
biB4ODYveGVuL21tdV9wdi5jDQo+IFsyLl0gRnVsbCBkZXNjcmlwdGlvbiBvZiB0aGUgcHJv
YmxlbS9yZXBvcnQ6DQo+IHdoZW4gYnVpbGRpbmcgS2VybmVsIDUuNC4yOTEgdW5kZXIgTHVi
dW50dSAxOC42LjYgTFRTLCB3aXRoIEdDQyAxNC4yLCBpNjg2IA0KPiB0YXJnZXQsIGJ1aWxk
IGZhaWxzIGR1ZSB0byBjaGFuZ2VzIGludHJvZHVjZWQgaW4gImFyY2gveDg2L3hlbi9tbXVf
cHYuYyINCj4gDQo+IE5vdGUgLSBJIGRpZCBub3QgZGV0ZXJtaW5lZCB3aGF0IG9mIHRoZSBm
b2xsb3dpbmcgY2hhbmdlcyBjYXVzZWQgdGhlIGlzc3VlOg0KPiANCj4gSnVlcmdlbiBHcm9z
cyAoMSk6DQo+ICAgICAgICB4ODYveGVuOiBhbGxvdyBsYXJnZXIgY29udGlndW91cyBtZW1v
cnkgcmVnaW9ucyBpbiBQViBndWVzdHMNCg0KVGhpcyBvbmUgaXMgdG8gYmxhbWUuIFRoZSBi
YWNrcG9ydCB0byA1LjQgc3RhYmxlIGRpZG4ndCBhY2NvdW50IGZvciB0aGUNCjMyLWJpdCBQ
ViBzdXBwb3J0IGluIHRoaXMga2VybmVsIHZlcnNpb24gKDMyLWJpdCBQViBzdXBwb3J0IHdh
cyByZW1vdmVkDQppbiA1LjkpLg0KDQoNCkp1ZXJnZW4NCg==
--------------G0RtRyh4z6fny555wpPZ7yvw
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------G0RtRyh4z6fny555wpPZ7yvw--

--------------JMLZ5tERyxhyvPw2jWkYJ7bd--

--------------ics0VznIs3fSSzfdiLhN0pLD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfaaiMFAwAAAAAACgkQsN6d1ii/Ey96
wQf/bJo2/LAH1/LQtohWNMSglmofbA+51hfzAYrub3ktqrwK1Mqt4wkMLQCd9tt/8GwkSLJAkxKO
qRVlNywp2cfYAmqTrRWMkn9gjMH57mJQOsfqFFTvg8+KkACX1ajrIl1Pb9CEdE3FOn2qT3tjU+Rg
T9aFgIz2ZCb07HaJCjqJHP2UBZRA9N7Ixv82fI4y/YAVyLA3poZeCcZNNg6S9hXnewffCEpoMqqx
7t6A5kCOl7sTLDgXnBlG3ooOsqtmyB/lARNSDBJjBLGq1nAjqOqh6x9hBCFdIuLgsaD0Pz92wiCg
gUf9XAB7k97KmiTxdK0FnFq564Bqzw0JeOLBNF406A==
=pqMU
-----END PGP SIGNATURE-----

--------------ics0VznIs3fSSzfdiLhN0pLD--
