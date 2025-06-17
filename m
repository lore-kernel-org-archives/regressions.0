Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C779928FFD0
	for <regressions@lists.linux.dev>; Tue, 17 Jun 2025 10:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155655; cv=none; b=RzFtYjr0ZLBI2PEIMs4YMmcvMAk9d/xjKER/D2AixbeFd/dcTdi8qO2dTy0/x1mCbO2m1F+uWl0pqCdcV6PBA7rqeVH/C+wqVjQeuRaz/1r+Ex93skJUuyZiVL7L5HqNGG71LuK+/g4rLR6ofemgrytQWyIQycNcY3BFEhS3fNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155655; c=relaxed/simple;
	bh=l7pANxE6LlWJZaBuB+f/YFijKcmcnXNlJid6eycwsdw=;
	h=Message-ID:Date:MIME-Version:Cc:From:Subject:To:Content-Type; b=rk+/Mu62HUjUljYbLFDzV2y0WejUtZGIlTppfzOfpVw2W5HFfWCjTaGOdzDrAbjqzwXLm9RCV0vaSmWmR+3/0Lf0kauPNofj2jg6vT3oDAFHpn10z/K33f2Fo3nzoKmwA+71vAASqz1tzmAYOUSyG+YOM2LrQpK6QrpBBEtvPBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2k9Nr2D; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2k9Nr2D"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so8393284a12.2
        for <regressions@lists.linux.dev>; Tue, 17 Jun 2025 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750155651; x=1750760451; darn=lists.linux.dev;
        h=to:autocrypt:subject:from:cc:content-language:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7pANxE6LlWJZaBuB+f/YFijKcmcnXNlJid6eycwsdw=;
        b=Z2k9Nr2DK7ZECtMvZYP3REU8v0/su60wTof4aBpFzirba/tMVn3vaucb9JlQPsoPcB
         IPIadkpTkP1hZFq0zvud6wttQfi/IAQ8VkdFtvyiVIWdemuzmsxPGXgjPBDPLy4o/gQD
         QjfW2an+YBzGCrqq/k1+xGAvlhJeIHHJFiY1sRrtXfKxIxxuwk83kHLFPlTMSgbntCzF
         03A5G6ixpCHlnz+3uDirD+KD012ozqKw1UGE6McHP9OBzTJVKsv4+RR63RlqMlKxpJBZ
         RJ05IidKSpfCOP7lb8TN3jhJb4HIj8O61Zd6+6XYt3DlDR+1cve6xLCow3dpLUePoYQt
         2tIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750155651; x=1750760451;
        h=to:autocrypt:subject:from:cc:content-language:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l7pANxE6LlWJZaBuB+f/YFijKcmcnXNlJid6eycwsdw=;
        b=ilyfCByZUJMddpIAanpEe8nEZj22dpVZnzQRJYlox0QyUL2sfgiIPYBmZ1Nt4cA/Jn
         7G1ExBrIgHRJenRdq5UPL5GXKpsO7XwgXmlBHZpybp570mYTd7TazLtPAD4CkBJbfTR5
         NWyGj3Dm0xMi2ts54KqW8KBjGyjhd7ZW1r3nf6o6omE+3h5HyFBCnmB7G8XlUqYo3A7a
         GOTgr+iy8l8OGe0Bnc66L6lfV001l/klQZz2ZiP7pp5R3OUlV7L/u90hUB0R/5Bncjae
         5KTdrFcGYuzt7JBnuvmjfYO5H3BWAQgxhmSoqRw38q4m8TB39bym/VUJuTF4amR+tZW/
         YszQ==
X-Gm-Message-State: AOJu0YxS3ZzwJpQcQzmjfAPbFSL1rnNftkj+DRRSae+7sDejoOZGDM0A
	VZ5PI+/7Ge/mr7s8Tlx6wQA5FTuFCITLtmb8QHdzs7hKI1URJvirJv2o
X-Gm-Gg: ASbGncufxa5jHoDlx72YuBI3lfVzCAFiT2XesVdpkMMzgu/KHO3nFc96RgeQwFzK0oZ
	3vr5p49uG0pBKqJHKTHT8PGJJVcKZ2hzoe5S1vlSvBtNr9DkLvGqQ4UZpQIupCOwQUE7gml4R30
	mDZVNY3/MjvmeQ43QKy2KAiwYEBT2xSce7fbiU2EvF9FtQkpX5HRDlzYIb9wjqyrgqVpwSSYHdK
	Hu+e20/5gLEP4PZlRfJr6dVzAmx/3ppzhCVqH/1AApvebshEB6CVZSsOWSefeuxihtKQk0t7Bnr
	mp9iUhcGGbf5jdcCLeOicxmRRMR6rTnz/xd88Wf+EFanX1KzwfSk0aONErZomOtKV33xhBZN9nR
	b7PGMTVL61KjOmpsLn6fTmG9/jJcsE5ww38NV60QbUgKz
X-Google-Smtp-Source: AGHT+IF5Div275DdVcYXw4eL4u8BbQ2uaKPyNT/RQD6hY71nr028vCI7aTDPq7CiVCKtgtNgWIv7mg==
X-Received: by 2002:a17:907:d78a:b0:adb:3509:b459 with SMTP id a640c23a62f3a-adfad329678mr1393821066b.19.1750155650517;
        Tue, 17 Jun 2025 03:20:50 -0700 (PDT)
Received: from [192.168.75.93] (217-122-252-220.cable.dynamic.v4.ziggo.nl. [217.122.252.220])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-adec8929371sm844397166b.117.2025.06.17.03.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 03:20:49 -0700 (PDT)
Message-ID: <8d7c7958-9558-4c8a-a81a-e9310f2d8852@gmail.com>
Date: Tue, 17 Jun 2025 12:20:49 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: nl-NL, en-US
Cc: regressions@lists.linux.dev, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>, Jani Nikula
 <jani.nikula@intel.com>, Khaled Almahallawy <khaled.almahallawy@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
From: Vas Novikov <vasya.novikov@gmail.com>
Subject: [REGRESSION][BISECTED] intel iGPU with HDMI PLL stopped working at
 1080p@120Hz 1efd5384
Autocrypt: addr=vasya.novikov@gmail.com; keydata=
 xjMEYrX2ChYJKwYBBAHaRw8BAQdAf/bzdTDerOW5j+qrayMzPOCKthCx8KYKZo20cty68aPN
 KFZhc2lsaSBOb3Zpa292IDx2YXN5YS5ub3Zpa292QGdtYWlsLmNvbT7CjwQTFggANxYhBLKE
 QxE9sGxECbI4ubmfrsbg1d9tBQJitfYKBQkJZgGAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQ
 uZ+uxuDV321klwEAm5+HyBecp+ofMZ6Ors+OvrETLFQU2B9wCd/d/i2NjJABAIssTvgdxlqF
 I6GjehRMPURi6W1uFMPzzp9gM1yeYXEGzjgEYrX2ChIKKwYBBAGXVQEFAQEHQODm5qV0UQrP
 hcJkaZVbhtVmb90gN6rIuN0Q/xTmhqJ4AwEIB8J+BBgWCAAmFiEEsoRDET2wbEQJsji5uZ+u
 xuDV320FAmK19goFCQlmAYACGwwACgkQuZ+uxuDV322trQEA1Yj4GvOlEPfyuhMfX8P0Ah/8
 QXCqgdMQH7PaNgIFFokA/1DgWcc1XGFNRHpOGrJNnF4Ese1hWjYoqo2iBlURPQwP
To: stable@vger.kernel.org
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dtb1s0ai873eTd9PpSOnx5UG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dtb1s0ai873eTd9PpSOnx5UG
Content-Type: multipart/mixed; boundary="------------Uc0vBnG4YG2ZGkz04pGupL9t";
 protected-headers="v1"
From: Vas Novikov <vasya.novikov@gmail.com>
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>, Jani Nikula
 <jani.nikula@intel.com>, Khaled Almahallawy <khaled.almahallawy@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Message-ID: <8d7c7958-9558-4c8a-a81a-e9310f2d8852@gmail.com>
Subject: [REGRESSION][BISECTED] intel iGPU with HDMI PLL stopped working at
 1080p@120Hz 1efd5384

--------------Uc0vBnG4YG2ZGkz04pGupL9t
Content-Type: multipart/mixed; boundary="------------RS0LcFpFyMC1IIVh4SODTdRL"

--------------RS0LcFpFyMC1IIVh4SODTdRL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgZGVhciBMS01MIGFuZCBjb21tdW5pdHksIHRoaXMgaXMgbXkgZmlyc3QgcG9zdCBoZXJl
LCBzbyBJJ2QgDQphcHByZWNpYXRlIGFueSBndWlkYW5jZSBvciByZWRpcmVjdGlvbiBpZiBp
dCdzIGR1ZS4NCg0KU3RhcnRpbmcgZnJvbSBjb21taXQgDQpodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0
Lz9pZD0xZWZkNTM4NDI3N2ViNzFmY2UyMDkyMjU3OTA2MWNkM2FjZGIwN2NmLA0KSERNSSBo
YW5kbGluZyBmb3IgY2VydGFpbiByZWZyZXNoIHJhdGVzIG9uIG15IGludGVsIGlHUFUgaXMg
YnJva2VuLg0KDQpUaGUgZXJyb3IgaXMgc3RpbGwgcHJlc2VudCBpbiA2LjE2cmMxLg0KDQpT
cGVjaWZpY2FsbHksIHRoaXMgaXMgdGhlIGNvbW1hbmQgdGhhdCBkaXNhbWJpZ3VhdGVzIHRo
ZSBuZXdlciBicm9rZW4gDQprZXJuZWxzOg0KDQogICAgICAgICB4cmFuZHIgLS1vdXRwdXQg
SERNSS0xIC0tYXV0byAtLXNjYWxlIDF4MSAtLW1vZGUgMTkyMHgxMDgwIA0KLS1yYXRlIDEy
MCAtLXBvcyAweDAgLS1vdXRwdXQgZURQLTEgLS1vZmYNCg0KVGhlIGltcG9ydGFudCBwYXJ0
cyBhcmUgMTkyMHgxMDgwIGFuZCAxMjBIei4gV2hlbiBydW4gb24gY29tbWl0cyBwcmlvciAN
CnRvIHRoZSBiaXNlY3RlZCBhYm92ZSwgaXQgYmVoYXZlcyBhcyBleHBlY3RlZCwgZGVsaXZl
cmluZyAxOTIweDEwODAgQCANCjEyMEh6LiBXaGVuIHJ1biBvbiBrZXJuZWwgYnVpbGRzIHdp
dGggdGhlIGFib3ZlIGNvbW1pdCBpbmNsdWRlZCAodGhhdCANCmNvbW1pdCBvciBsYXRlciks
IHRoZSBtb25pdG9yIGdvZXMgY29tcGxldGVseSBibGFuay4gQWZ0ZXIgYWJvdXQgMzAgDQpz
ZWNvbmRzLCBpdCBzaHV0cyBkb3duIGVudGlyZWx5ICh3aGljaCBJIGFzc3VtZSBtZWFucyB0
aGF0IGZyb20gdGhlIA0KbW9uaXRvcidzIHBlcnNwZWN0aXZlLCBIRE1JIGdvdCAiZGlzY29u
bmVjdGVkIikuDQoNCk9uIHRoaXMgbGluayB5b3UgY2FuIHNlZSBteSBvcmlnaW5hbCByZXBv
cnQgaW4gdGhlIEFyY2hMaW51eCBjb21tdW5pdHksIA0Kd2hlcmUgQ2hyaXN0aWFuIEhldXNl
bCAoQGdyb21pdCkga2luZGx5IGd1aWRlZCBtZSB0aHJvdWdoIHRoZSBiaXNlY3Rpb24gDQpw
cm9jZXNzIGFuZCBidWlsdCB0aGUgYmlzZWN0aW9uIGltYWdlcyBmb3IgbWUgdG8gdHJ5OiAN
Cmh0dHBzOi8vZ2l0bGFiLmFyY2hsaW51eC5vcmcvYXJjaGxpbnV4L3BhY2thZ2luZy9wYWNr
YWdlcy9saW51eC8tL2lzc3Vlcy8xNDUjbm90ZV8yNzc0ODIgDQogIFRoaXMgbGluayBhbHNv
IGNvbnRhaW5zIHRoZSBiaXNlY3Rpb24gaGlzdG9yeS4NCg0KQWRkaXRpb25hbCBpbmZvOg0K
DQoqIFRoZSBtb25pdG9yIGFuZCB0aGUgbm90ZWJvb2sgYXJlIGNvbm5lY3RlZCB2aWEgYW4g
SERNSSBjYWJsZSwgdGhlIA0KbW9uaXRvciBpdHNlbGYgaXMgYSA0a0AxMjBIeiBtb25pdG9y
Lg0KDQoqIEFjY29yZGluZyB0byBgbHNtb2QgfCBncmVwIC1FICIoaTkxNXxYZSkiYCwgSSdt
IHVzaW5nIHRoZSBpOTE1IGtlcm5lbCANCmRyaXZlciBmb3IgdGhlIEdQVS4NCg0KKiBUaGUg
R1BVIGlzIGFuIGlHUFUgZnJvbSBpbnRlbCwgc3BlY2lmaWNhbGx5IGBJbnRlbCBDb3JlIFVs
dHJhIDcgMTU1SGAuDQoNCiogT25lIHN5bXB0b20gdGhhdCBkaXNhbWJpZ3VhdGVzIHRoZSB3
b3JraW5nIGFuZCBub24td29ya2luZyBrZXJuZWxzLCANCmJlc2lkZXMgd2hldGhlciB0aGV5
IGFjdHVhbGx5IGhhdmUgdGhlIGJ1ZywgaXMgdGhhdCB0aGUgYnJva2VuIGtlcm5lbHMgDQpj
YXVzZSB4cmFuZHIgdG8gYWRkaXRpb25hbGx5IHJlcG9ydCB0aGUgMTQ0LjA1IHJlZnJlc2gg
cmF0ZSBhcyBwb3NzaWJsZSANCmZvciB0aGUgbW9uaXRvciwgd2hlcmVhcyB0aGUgbm9uLWJy
b2tlbiBrZXJuZWxzIGNvbnNpc3RlbnRseSBjYXVzZSANCnhyYW5kciB0byBvbmx5IGxpc3Qg
cmVmcmVzaCByYXRlIDEyMCBhbmQgYmVsb3cgYXMgcG9zc2libGUuIEknbSBvbmx5IA0KZXZl
ciB0ZXN0aW5nIHRoZSByZWZyZXNoIHJhdGUgb2YgMTIwLCBidXQgdGhlIHByZXNlbmNlIG9m
IHRoZSAxNDQuMDUgDQpyYXRlIGlzIGNvcnJlbGF0ZWQuDQoNCklmIGFueSBvdGhlciBpbmZv
cm1hdGlvbiBvciBhbnl0aGluZyBpcyBuZWVkZWQsIHBsZWFzZSB3cml0ZS4NCg0KDQpUaGFu
ayB5b3UsDQpWYXMNCg0KLS0tLQ0KDQojcmVnemJvdCBpbnRyb2R1Y2VkOiAxZWZkNTM4NDI3
N2ViNzFmY2UyMDkyMjU3OTA2MWNkM2FjZGIwN2NmDQojcmVnemJvdCB0aXRsZTogaW50ZWwg
aUdQVSB3aXRoIEhETUkgUExMIHN0b3BwZWQgd29ya2luZyBhdCAxMDgwcEAxMjBIeiANCjFl
ZmQ1Mzg0DQojcmVnemJvdCBsaW5rOiANCmh0dHBzOi8vZ2l0bGFiLmFyY2hsaW51eC5vcmcv
YXJjaGxpbnV4L3BhY2thZ2luZy9wYWNrYWdlcy9saW51eC8tL2lzc3Vlcy8xNDUNCg0K
--------------RS0LcFpFyMC1IIVh4SODTdRL
Content-Type: application/pgp-keys; name="OpenPGP_0xB99FAEC6E0D5DF6D.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB99FAEC6E0D5DF6D.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEYrX2ChYJKwYBBAHaRw8BAQdAf/bzdTDerOW5j+qrayMzPOCKthCx8KYKZo20
cty68aPNKFZhc2lsaSBOb3Zpa292IDx2YXN5YS5ub3Zpa292QGdtYWlsLmNvbT7C
jwQTFggANxYhBLKEQxE9sGxECbI4ubmfrsbg1d9tBQJitfYKBQkJZgGAAhsDBAsJ
CAcFFQgJCgsFFgIDAQAACgkQuZ+uxuDV321klwEAm5+HyBecp+ofMZ6Ors+OvrET
LFQU2B9wCd/d/i2NjJABAIssTvgdxlqFI6GjehRMPURi6W1uFMPzzp9gM1yeYXEG
zjgEYrX2ChIKKwYBBAGXVQEFAQEHQODm5qV0UQrPhcJkaZVbhtVmb90gN6rIuN0Q
/xTmhqJ4AwEIB8J+BBgWCAAmFiEEsoRDET2wbEQJsji5uZ+uxuDV320FAmK19goF
CQlmAYACGwwACgkQuZ+uxuDV322trQEA1Yj4GvOlEPfyuhMfX8P0Ah/8QXCqgdMQ
H7PaNgIFFokA/1DgWcc1XGFNRHpOGrJNnF4Ese1hWjYoqo2iBlURPQwP
=3DhvG9
-----END PGP PUBLIC KEY BLOCK-----

--------------RS0LcFpFyMC1IIVh4SODTdRL--

--------------Uc0vBnG4YG2ZGkz04pGupL9t--

--------------dtb1s0ai873eTd9PpSOnx5UG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSyhEMRPbBsRAmyOLm5n67G4NXfbQUCaFFBgQUDAAAAAAAKCRC5n67G4NXfbf5D
AP9371ShOE4XL3p8s7b7jy/gYQYItA57SbyUgoMIVtSSwAD/Rln07IIIAVHqnUX6DS0uZ8+X9UUq
YSDiN3aEMCuTpw8=
=FiZd
-----END PGP SIGNATURE-----

--------------dtb1s0ai873eTd9PpSOnx5UG--
