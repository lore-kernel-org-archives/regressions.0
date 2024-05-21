Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E3E18054
	for <regressions@lists.linux.dev>; Tue, 21 May 2024 16:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716307351; cv=none; b=K70asULfAVne0mvrhl58wW5wv6RHfQmRnDFYY55uyYQlv3pXX+6xAnDamqmaYa4jypQe5OIbQZtAtwTrLb/HCjzsnV7BwCc8dueUXFntpbsv0QeEggGQPm1fjudNuZ6nI7VIR9D+aaFFpIAqX3rdTquRcHMSw3FhZua4fFbkOmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716307351; c=relaxed/simple;
	bh=USFH02LdogHwlFaWdJnvdq4tX7l/sqkZXQ30J/Gv/sQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=IJYE3fA8Lkf5dIjVoP/2FvgMbBtyCqQ+/Dt34qhxfFvne8DyVnzOOMHk1H0vxxhP4Znqhz+S2w57u+zk2G6r7Y8c5BjHrdhCfOXPgPporT8QCvHeKLEJb/QVmNQqBHD0fqyXjdFAT9Pal2lU5FLlBVIKmeTjyrZJbjnGDpP0VJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K81OqJ3d; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K81OqJ3d"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-47f2f9f2ac8so1093586137.2
        for <regressions@lists.linux.dev>; Tue, 21 May 2024 09:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716307348; x=1716912148; darn=lists.linux.dev;
        h=cc:autocrypt:content-language:to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USFH02LdogHwlFaWdJnvdq4tX7l/sqkZXQ30J/Gv/sQ=;
        b=K81OqJ3dnJsaMIYuD3xGOcWBDvl8KcZoQJZZwOg4pQMw4C4j5CN/LFEz6xwshPlXc8
         U2CxKcZ+WQGEZhNpNyS6ShHVSVxgya4pCdnr5T1d8Pmt/Jc81AcaxaSlrcVDISNXIksz
         yK3VTyfmwVcVxFK0RhBhZe34qVHf0trvpFjLoNrCXM5gVrFD1kdCcBp0EHDMFQBYt+Hp
         Sud5Z5Cp35nSxbOK16OIA8MPRJoVj8N27QtPd1LrY9maEnVhe5uBuywRpfYW+zri8KKx
         EP+WQlbfPM6SXxMBQWhibrf2T9Afmu3m7q+03oGoa0JGIW53Jc7JVqIDCdr2up5Bwjj2
         I2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716307348; x=1716912148;
        h=cc:autocrypt:content-language:to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=USFH02LdogHwlFaWdJnvdq4tX7l/sqkZXQ30J/Gv/sQ=;
        b=V3tcIbDuOfz7SrFYu08tkHpeWu4di/Qai60EJGkKuKEI1INiu+azEo8FOpxBQfJdfT
         2kBbccgYfpN8gk1nbxg+bXLF1tQrMLBFHElnz0+mDz5lUPQQUeMppn25IfFXVyLJ1udo
         fSkW9sAvVvgTYfn895wImuZN8BCM0YRrIzlhHkaDiF1mO96KCoTRP1enXmb8oJoSvw6i
         RU+hs21vpwLjOJ3UR9mL+HCKE+rGmovLFtNJjmcnpTWMAp1DDU8FSLs040T4rWKbuAGX
         QS2ss2NQgIWfcUxD4E1NMur7Chd0R9ARVeVZsXFLRXkF3dbnAWVGbGQQ4xGK0WK+edvv
         +lhQ==
X-Gm-Message-State: AOJu0YztjKH3aUbKmNB/sN2wDJcySTejZxkSabxOJJiNSKGdvLj82XTa
	Zp9J0XpkdkZWaDMcz38V1AxXjva/Lu4giXL4Li1LL3Dy20RF1ixdAGO0Api/
X-Google-Smtp-Source: AGHT+IHPsKkBLQIhUi0AbjRALzFUp5Rw1YHqU3reXONPRrborMHknrwYE3p/tFbV/OOW2xKTDpDhog==
X-Received: by 2002:a05:6122:17a0:b0:4d4:eff:454 with SMTP id 71dfb90a1353d-4df8829ce08mr31341376e0c.1.1716307346753;
        Tue, 21 May 2024 09:02:26 -0700 (PDT)
Received: from [192.168.1.213] (syn-142-197-127-150.res.spectrum.com. [142.197.127.150])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-4df7c050c57sm3391139e0c.36.2024.05.21.09.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 09:02:25 -0700 (PDT)
Message-ID: <313824bc-799d-414f-96b7-e6de57c7e21d@gmail.com>
Date: Tue, 21 May 2024 12:02:25 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Udvare <audvare@gmail.com>
Subject: [REGRESSION] ETXTBSY when running Yarn (Node) since af5d68f
To: regressions@lists.linux.dev
Content-Language: en-GB
Autocrypt: addr=audvare@gmail.com; keydata=
 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
Cc: stable@vger.kernel.org, axboe@kernel.dk
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lzTjzw3fjyxCla2u8cwxx07T"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lzTjzw3fjyxCla2u8cwxx07T
Content-Type: multipart/mixed; boundary="------------3abi3fBPQRMsFYpysPAZhB5h";
 protected-headers="v1"
From: Andrew Udvare <audvare@gmail.com>
To: regressions@lists.linux.dev
Cc: stable@vger.kernel.org, axboe@kernel.dk
Message-ID: <313824bc-799d-414f-96b7-e6de57c7e21d@gmail.com>
Subject: [REGRESSION] ETXTBSY when running Yarn (Node) since af5d68f

--------------3abi3fBPQRMsFYpysPAZhB5h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

I3JlZ3pib3QgaW50cm9kdWNlZDogdjYuOC4udjYuOS1yYzENCg0KaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21t
aXQvP2lkPWFmNWQ2OGY4ODkyZjhlZThmMTM3NjQ4Yjc5Y2ViMmFiYzE1M2ExOWINCg0KU2lu
Y2UgdGhlIGFib3ZlIGNvbW1pdCBwcmVzZW50IGluIDYuOSssIE5vZGUgcnVubmluZyBhIFlh
cm4gaW5zdGFsbGF0aW9uIA0KdGhhdCBleGVjdXRlcyBhIHN1YnByb2Nlc3MgYWx3YXlzIHNo
b3dzIHRoZSBmb2xsb3dpbmc6DQoNCi90ZXN0ICMgeWFybiAtLW9mZmxpbmUgaW5zdGFsbA0K
eWFybiBpbnN0YWxsIHYxLjIyLjIyDQp3YXJuaW5nIHBhY2thZ2UuanNvbjogInRlc3QiIGlz
IGFsc28gdGhlIG5hbWUgb2YgYSBub2RlIGNvcmUgbW9kdWxlDQp3YXJuaW5nIHRlc3RAMS4w
LjA6ICJ0ZXN0IiBpcyBhbHNvIHRoZSBuYW1lIG9mIGEgbm9kZSBjb3JlIG1vZHVsZQ0KWzEv
NF0gUmVzb2x2aW5nIHBhY2thZ2VzLi4uDQpbMi80XSBGZXRjaGluZyBwYWNrYWdlcy4uLg0K
WzMvNF0gTGlua2luZyBkZXBlbmRlbmNpZXMuLi4NCls0LzRdIEJ1aWxkaW5nIGZyZXNoIHBh
Y2thZ2VzLi4uDQplcnJvciAvdGVzdC9ub2RlX21vZHVsZXMvc255azogQ29tbWFuZCBmYWls
ZWQuDQpFeGl0IGNvZGU6IDEyNg0KQ29tbWFuZDogbm9kZSB3cmFwcGVyX2Rpc3QvYm9vdHN0
cmFwLmpzIGV4ZWMNCkFyZ3VtZW50czoNCkRpcmVjdG9yeTogL3Rlc3Qvbm9kZV9tb2R1bGVz
L3NueWsNCk91dHB1dDoNCi9iaW4vc2g6IG5vZGU6IFRleHQgZmlsZSBidXN5DQoNClRoZSBj
b21taXQgd2FzIGZvdW5kIGJ5IGJpc2VjdGlvbiB3aXRoIGEgc2ltcGxlIGluaXRyYW1mcyB0
aGF0IGp1c3QgcnVucyANCid5YXJuIC0tb2ZmbGluZSBpbnN0YWxsJyB3aXRoIGEgdGVzdCBw
cm9qZWN0IGFuZCBjYWNoZWQgWWFybiBwYWNrYWdlcy4NCg0KVG8gcmVwcm9kdWNlOg0KDQpu
cG0gaW5zdGFsbCAtZyB5YXJuDQpta2RpciB0ZXN0DQpjZCB0ZXN0DQpjYXQgPiBwYWNrYWdl
Lmpzb24gPDxFT0YNCnsNCiAgICAibmFtZSI6ICJ0ZXN0IiwNCiAgICAidmVyc2lvbiI6ICIx
LjAuMCIsDQogICAgIm1haW4iOiAiaW5kZXguanMiLA0KICAgICJsaWNlbnNlIjogIk1JVCIs
DQogICAgImRlcGVuZGVuY2llcyI6IHsNCiAgICAgICJzbnlrIjogIl4xLjEyOTEuMCINCiAg
ICB9DQp9DQpFT0YNCnlhcm4gaW5zdGFsbA0KDQpNb2Rlcm4gWWFybiB3aWxsIGdpdmUgdGhl
IHNhbWUgcmVzdWx0IGJ1dCB3aXRoIHNsaWdodGx5IGRpZmZlcmVudCBvdXRwdXQuDQoNClRo
aXMgYWxzbyBhcHBlYXJzIHRvIGFmZmVjdCBub2RlLWd5cDogDQpodHRwczovL2dpdGh1Yi5j
b20vbm9kZWpzL25vZGUvaXNzdWVzLzUzMDUxDQoNClNlZSBhbHNvOiBodHRwczovL2J1Z3Mu
Z2VudG9vLm9yZy85MzE5NDINCg0KLS0NCkFuZHJldw0K

--------------3abi3fBPQRMsFYpysPAZhB5h--

--------------lzTjzw3fjyxCla2u8cwxx07T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEYK9084jvT0kxwI44Gv2a/BIMJt0FAmZMxZEFAwAAAAAACgkQGv2a/BIMJt0z
mw/+NVqRDtQz+Fqh3nmkdGJEU5EQGVzZ7TAj/XiL3wgs2x3KOJQoBA+czZXX/STIlzvvcPP9Nx7c
z1paJFazfKhrAdNBfS9dpQqslCigohHslZHEYOEZk+7pBc71R5fk8kf3EamIgoz+qq45lpi+nIIQ
+1+xxYrTv2I1a21MeypgxHZwHypsSJdq8k8vb12cb4Nb6I65m8z1+iQdEQGklCI+rPYJqyj9Ad6c
hhtgS9EJmvADStSFPsMoXpEv+0hYOPWFLo3dBRNo36bkVF4XykpaiUuVaitKjQgY37JOk/RuNNsE
NB2Y6kbZ5y4zYhKBQMRo542u3IRUP8CxPzlO6sEHcWiRkRfSC6fq2QHVcACDzkYJdHrhOV0zMbWE
8N/RNyXzBRSWJlb1nL3dZqRS37YGoQZVvtR9mzCr5W9dz+2anPGJthoRjidLYOE5n4XXRnSmHmvK
eB6RMzFqfMaES/pwkZ/L4ODafakQ+LTibpfggrw3U1z3HCga3slsG17/Nm6oFgXJIa89eD2XeEmK
Da1JQvv13dQLGWydKKVgfbaKfsWviUslRNgC6gXptlm6IqTbcbfKSR7CB4r3VQkRN7vf61wrHuGT
m+JfRkinUe1UuqIiZiqUIogDlbg+H5H2etHUaXJTN/AT4RKxuRQv3Vc2UcpUdVbpsPEnkqIhszMt
EhI=
=ipZq
-----END PGP SIGNATURE-----

--------------lzTjzw3fjyxCla2u8cwxx07T--
