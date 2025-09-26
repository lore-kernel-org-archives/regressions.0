Received: from h8.fbrelay.privateemail.com (h8.fbrelay.privateemail.com [162.0.218.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D242433AD
	for <regressions@lists.linux.dev>; Fri, 26 Sep 2025 23:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.0.218.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758927916; cv=none; b=Mi1Q2P/h0AdxNW1yJBlzWPLKgZ9KpW4C4ds0TcJhTBn84nCzI+cayB5hciPwJdwP9CRL1286oupuQGyIpIpFKpjFEqQOm6I4JceNrDq7YDgR4lqXiM11AwHEK36KgYoOaJDmLXFXBj6Si5d0PFxp4w35AFfCXaXQNFUJjW5ztK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758927916; c=relaxed/simple;
	bh=9fbFrDq9Q608yE5Sbyzp6hLo4hkVOoXPQ/HT2QVjj58=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Bd7fUXCscarjVcVk/V+WWIcg+J3B4GtrTgpYus49J8Cyx+Gp8UkKQ8p9LzBCDXQuHI7zq3XRn6p/VnLRoRERXGjb9rRyc9nMISuwnA+DsN1JDpz3SzV6oxw5Okcf9VVqStU3WG3anff0cQN5Al+UasGufncoHJO2yXKsufpQ0fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iyanmv.com; spf=pass smtp.mailfrom=iyanmv.com; dkim=pass (2048-bit key) header.d=iyanmv.com header.i=@iyanmv.com header.b=vPb2fNok; arc=none smtp.client-ip=162.0.218.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iyanmv.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iyanmv.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iyanmv.com header.i=@iyanmv.com header.b="vPb2fNok"
Received: from MTA-07-4.privateemail.com (mta-07.privateemail.com [198.54.127.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4cYQx05c42z2xBK
	for <regressions@lists.linux.dev>; Fri, 26 Sep 2025 18:58:28 -0400 (EDT)
Received: from mta-07.privateemail.com (localhost [127.0.0.1])
	by mta-07.privateemail.com (Postfix) with ESMTP id 4cYQwr32JCz3hhVC;
	Fri, 26 Sep 2025 18:58:20 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=iyanmv.com; s=default;
	t=1758927500; bh=9fbFrDq9Q608yE5Sbyzp6hLo4hkVOoXPQ/HT2QVjj58=;
	h=Date:To:Cc:From:Subject:From;
	b=vPb2fNokeh6suvaZgdgelv4ttuk1ggGvRblYhdtX8fpLtmg4GOVpf0eci62aRPk+A
	 rGpqFgDm0UETEk4sNrm74e9FBnloA5qbDXysBbsbBuf2wKyZ/y1xWHWWa3Gibz/86E
	 jlZoCwe4GSq7OlQAruKh6X/y6nknKLpuG7knmrfaY3mXXMdUNI6MDMM4nmU+qss8tC
	 vMnYwYHWyiWaG6rtjTmS+8AOs/yLTDAmPOhOfpbSF4rg/Kr2d+N8Zw1EdlCnsIMP06
	 9AB18fWnaSzRM506z2tCrfI/GiiYADKFv5+65n1HE7Mp28qD4pi67QZR40IGqJ+p2s
	 IlUkrd5KWlWHg==
Received: from [192.168.69.204] (adsl-89-217-41-119.adslplus.ch [89.217.41.119])
	by mta-07.privateemail.com (Postfix) with ESMTPA;
	Fri, 26 Sep 2025 18:58:16 -0400 (EDT)
Message-ID: <616f634e-63d2-45cb-a4f9-b34973cc5dfd@iyanmv.com>
Date: Sat, 27 Sep 2025 00:58:10 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: stable@vger.kernel.org
Content-Language: en-US, es-ES
Cc: regressions@lists.linux.dev, daniele.ceraolospurio@intel.com,
 sashal@kernel.org
From: =?UTF-8?Q?Iy=C3=A1n_M=C3=A9ndez_Veiga?= <me@iyanmv.com>
Subject: [REGRESSION] drm/xe/guc: Lenovo Thinkpad X1 Carbon Gen 12 can't boot
 with 6.16.9 and Xe driver
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dnSgrBGw2pAPx7gtbe9QyB3f"
X-Virus-Scanned: ClamAV using ClamSMTP

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dnSgrBGw2pAPx7gtbe9QyB3f
Content-Type: multipart/mixed; boundary="------------Bv8zz6f9B88KdLNUc0pUQvE0";
 protected-headers="v1"
From: =?UTF-8?Q?Iy=C3=A1n_M=C3=A9ndez_Veiga?= <me@iyanmv.com>
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, daniele.ceraolospurio@intel.com,
 sashal@kernel.org
Message-ID: <616f634e-63d2-45cb-a4f9-b34973cc5dfd@iyanmv.com>
Subject: [REGRESSION] drm/xe/guc: Lenovo Thinkpad X1 Carbon Gen 12 can't boot
 with 6.16.9 and Xe driver

--------------Bv8zz6f9B88KdLNUc0pUQvE0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkFmdGVyIHVwZ3JhZGluZyB0byA2LjE2LjkgdGhpcyBtb3JuaW5nLCBteSBs
YXB0b3AgY2FuJ3QgYm9vdC4gSSBjYW5ub3QgDQpnZXQgYW55IGxvZ3MgYmVjYXVzZSB0aGUg
a2VybmVsIHNlZW1zIHRvIGZyZWV6ZSB2ZXJ5IGVhcmx5LCBldmVuIGJlZm9yZSANCkknbSBh
c2tlZCBmb3IgdGhlIGZ1bGwgZGlzayBlbmNyeXB0aW9uIHBhc3NwaHJhc2UuDQoNClRoaXMg
aXMgYSByZWdyZXNzaW9uIGZyb20gNi4xNi44IHRvIDYuMTYuOS4NCg0KSSBkaWQgYSBnaXQg
YmlzZWN0IGluIHRoZSBzdGFibGUvbGludXggYW5kIHRoaXMgaXMgdGhlIGNvbW1pdCBjYXVz
aW5nIA0KdGhlIGlzc3VlIGZvciBtZToNCg0KOTcyMDdhNGZlZDUzNDhmZjVjNWU3MWE3MzAw
ZGI5YjYzODY0MDg3OSBpcyB0aGUgZmlyc3QgYmFkIGNvbW1pdA0KY29tbWl0IDk3MjA3YTRm
ZWQ1MzQ4ZmY1YzVlNzFhNzMwMGRiOWI2Mzg2NDA4NzkgKEhFQUQpDQpBdXRob3I6IERhbmll
bGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQpE
YXRlOiAgIFdlZCBKdW4gMjUgMTM6NTQ6MDYgMjAyNSAtMDcwMA0KDQogICAgIGRybS94ZS9n
dWM6IEVuYWJsZSBleHRlbmRlZCBDQVQgZXJyb3IgcmVwb3J0aW5nDQoNCiAgICAgWyBVcHN0
cmVhbSBjb21taXQgYTdmZmNlYTg2MzFhZjkxNDc5Y2FiMTBhYTdmYmZkMDcyMmYwMWQ5YSBd
DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDYyNTIwNTQwNS4xNjUzMjEy
LTMtZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbS8NCg0KSG93IHRvIHJlcHJvZHVj
ZToNCg0KMS4gVXBncmFkZSB0byA2LjE2LjkNCjIuIEVuYWJsZSB0aGUgWGUgZHJpdmVyIGJ5
IHBhc3NpbmcgaTkxNS5mb3JjZV9wcm9iZT0hN2Q1NSANCnhlLmZvcmNlX3Byb2JlPTdkNTUN
CjMuIFJlYm9vdA0KDQpCZXN0IHJlZ2FyZHMsDQpJecOhbg0KDQotLSANCkl5w6FuIE3DqW5k
ZXogVmVpZ2ENCkdQRyBLZXk6IDIwNEMgNDYxRiBCQThDIDgxRDEgMDMyNyAgRTY0NyA0MjJF
IDM2OTQgMzExRSA1QUMxDQoNCg==

--------------Bv8zz6f9B88KdLNUc0pUQvE0--

--------------dnSgrBGw2pAPx7gtbe9QyB3f
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEIExGH7qMgdEDJ+ZHQi42lDEeWsEFAmjXGoIACgkQQi42lDEe
WsGeMg//V1/IlZOJicsTn3ReQWxr14M4xZRFdnaNPQYbEtmxv5Omrubu3PWpepfo
m/JtM3W6vup+Q8cTGWSW+OdgiRu2r162oSDu5wG29u8smzL8xr1r9MrGDI7YQ2HV
WwXBBNNSfY9fFNLKuYBIJsq5cV1Wl4YQGKwIx/mDV1QedSHetW7O3BIIQqgXNmEZ
AB3ZlWaJrejruY39YoJfJ2BFlYI7DmaySxZEzMYDNxiEg41AkJd6Jklm9HD28Vga
5uLeqfQO0aQv4rM0f8PKed/ykMIbNeEO1YyT9g5niP0IXKX+fArvB7GtWUhh8OwY
zy3paJE0UGGbgEFopnyDr1i9DjTcK5ceAYq/B0Vgpo7ahhknmmpOrsZb1RCtn1/h
rjVi3D4RE5YyjGcJ8WpSZIUm3X77Hn0q/m4AY9Z/Ly+iAeUTQERFrG3X3VNkScSX
RJ7KOkXo1IrHBLfaMEyKOX0yWFwvGgBkC4c0u1w42MAXe6TFkAGxDRKL6j1VENCc
wqaJGaR1FdZnc9HzUhE2rHTOr+h8WBtwK6zV13nYxe9IRvXVC0kU6SQsVy0mTWj1
e1wKSuKp2cp3pKrWzPKXR3ugZH006ssmiRh845wRMSKUk/XH6wNC7CcAj9xf06jp
T8mZcdxwWUAhBFnxRg1v162+7HLQG9qWRMsX0v3tOTBs9zSDYs0=
=kxv8
-----END PGP SIGNATURE-----

--------------dnSgrBGw2pAPx7gtbe9QyB3f--
