Received: from h8.fbrelay.privateemail.com (h8.fbrelay.privateemail.com [162.0.218.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18212E0B42
	for <regressions@lists.linux.dev>; Sat, 27 Sep 2025 14:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.0.218.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758982816; cv=none; b=lWjK9ArkrXQAK42bHzWLq0dx8jz4JHz2s29HwjOez1r4FUnRvaCksAZwa20PiRA/2Qu/+QDdZpFj6XoYa0v0hjIyADLeeLwHFOrh79vvwuX8HbHQ2PI9vO5YdwgJY3XJY6BmgB9YKCDERMPf1BbkoYFxJQwq/w/BJx5vJfLd1Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758982816; c=relaxed/simple;
	bh=u/aFZEeB1E+Rq+glcc1onQp64X8cmqYISYhciilIgdY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hZAd3h5amQvwBqZ9YzCcoOudR6GPWdfQRCdB27vNe76CqyaCxVAq1Cihsk8iI/A71Bz7W7E/4x7Lx7xNdwDUHaO4NKL/f9p+bj8tuaCRNRVT9xgYULAfLhKIWKwqHgfdNPXHSwwM/uhutF7UjjNs7qU3rlyyKyYUe+5OuxIUTx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iyanmv.com; spf=pass smtp.mailfrom=iyanmv.com; dkim=pass (2048-bit key) header.d=iyanmv.com header.i=@iyanmv.com header.b=tHLUJ8zU; arc=none smtp.client-ip=162.0.218.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iyanmv.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iyanmv.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iyanmv.com header.i=@iyanmv.com header.b="tHLUJ8zU"
Received: from MTA-12-4.privateemail.com (mta-12-1.privateemail.com [198.54.122.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4cYqNW5dYRz2xB3
	for <regressions@lists.linux.dev>; Sat, 27 Sep 2025 10:20:11 -0400 (EDT)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
	by mta-12.privateemail.com (Postfix) with ESMTP id 4cYqNN2fdpz3hhVv;
	Sat, 27 Sep 2025 10:20:04 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=iyanmv.com; s=default;
	t=1758982804; bh=u/aFZEeB1E+Rq+glcc1onQp64X8cmqYISYhciilIgdY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=tHLUJ8zU1oC59Ace4FGwF6ihTSKHBRAZuKCTamZ0W9eVEev6yZki9QdC92jFuWyiI
	 kLN0uX6RaPLgUme1KhoQrHtiqRxYIDI3RS2gJGFDGRIDYGqmXzUPtYBkQJUx0P4PsC
	 lnR7GVU9dZEf4Okd53lmZLATravcBhgZIahwBCb/nO/RJsXxzysO0oZNGKV4HoeQ5M
	 t2O1Pdx9rjhU6jsqR8+IJxATzJl6ZJvf3xgbicIXYHgqq9uA0mAYelPzBa2MOmtD84
	 jO+5TzTfY8ncgau5W/diGQGX6ejHubO6d0JpVqc99lx5KwJhOh9SOHb8Ao+g5l0Zai
	 XeVFNPGID8A0A==
Received: from [10.59.223.244] (mob-194-230-148-174.cgn.sunrise.net [194.230.148.174])
	by mta-12.privateemail.com (Postfix) with ESMTPA;
	Sat, 27 Sep 2025 10:19:58 -0400 (EDT)
Message-ID: <92577e77-3f40-45a3-8e67-d9c6f5ffeb86@iyanmv.com>
Date: Sat, 27 Sep 2025 16:19:54 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Iy=C3=A1n_M=C3=A9ndez_Veiga?= <me@iyanmv.com>
Subject: Re: [REGRESSION] drm/xe/guc: Lenovo Thinkpad X1 Carbon Gen 12 can't
 boot with 6.16.9 and Xe driver
To: Thorsten Leemhuis <regressions@leemhuis.info>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, daniele.ceraolospurio@intel.com,
 sashal@kernel.org
References: <616f634e-63d2-45cb-a4f9-b34973cc5dfd@iyanmv.com>
 <88ffbb16-bd1a-4d96-a10d-69516f98036e@leemhuis.info>
Content-Language: en-US
In-Reply-To: <88ffbb16-bd1a-4d96-a10d-69516f98036e@leemhuis.info>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FtzT8p0XJFBd0rm32PLPoACu"
X-Virus-Scanned: ClamAV using ClamSMTP

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FtzT8p0XJFBd0rm32PLPoACu
Content-Type: multipart/mixed; boundary="------------xyw6Hd0QOJr01ek7spqCaNTr";
 protected-headers="v1"
From: =?UTF-8?Q?Iy=C3=A1n_M=C3=A9ndez_Veiga?= <me@iyanmv.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, daniele.ceraolospurio@intel.com,
 sashal@kernel.org
Message-ID: <92577e77-3f40-45a3-8e67-d9c6f5ffeb86@iyanmv.com>
Subject: Re: [REGRESSION] drm/xe/guc: Lenovo Thinkpad X1 Carbon Gen 12 can't
 boot with 6.16.9 and Xe driver
References: <616f634e-63d2-45cb-a4f9-b34973cc5dfd@iyanmv.com>
 <88ffbb16-bd1a-4d96-a10d-69516f98036e@leemhuis.info>
In-Reply-To: <88ffbb16-bd1a-4d96-a10d-69516f98036e@leemhuis.info>

--------------xyw6Hd0QOJr01ek7spqCaNTr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCk9uIDI3LzA5LzIwMjUgMTQ6NTIsIFRob3JzdGVuIExlZW1odWlzIHdyb3Rl
Og0KPiBEb2VzIDYuMTctcmM3IHdvcmsgZm9yIHlvdT8gV2UgbmVlZCB0byBrbm93IGlmIHRo
aXMgbmVlZHMgdG8gYmUgZml4ZWQgaW4NCj4ganVzdCB0aGUgc3RhYmxlIHRyZWUgb3IgaWYg
aXQgaXMgc29tZXRoaW5nIHRoYXQgbmVlZHMgdG8gYmUgYWRkcmVzc2VkIGluDQo+IG1haW5s
aW5lIGFzIHdlbGwuDQoNCjYuMTctcmM3IGJvb3RzIGZpbmUsIHNvIHRoZSBpc3N1ZSBpcyBq
dXN0IGluIHRoZSBzdGFibGUgdHJlZS4NCj4gSnVzdCB3b25kZXJpbmc6IHdoeSBhcmUgdGhv
c2UgcGFyYW1ldGVycyBuZWVkZWQ/IElzIHRoZSBoYXJkd2FyZSBub3QNCj4gZnVsbHkgc3Vw
cG9ydGVkIGJlIHRoZSB4ZSBkcml2ZXIgeWV0Pw0KDQppOTE1IGlzIHN0aWxsIHRoZSBkZWZh
dWx0IGRyaXZlciBmb3IgTWV0ZW9yIExha2UgaW50ZWdyYXRlZCBHUFVzLCBzbyANCnRoYXQn
cyB3aHkgSSBuZWVkIHRvIHBhc3MgdGhvc2UgcGFyYW1ldGVycy4gTHVuYXIgTGFrZSBhbHJl
YWR5IHVzZXMgWGUgDQpieSBkZWZhdWx0LCB0aG91Z2guIEluIG15IGV4cGVyaWVuY2UsIGZv
ciBhdCBsZWFzdCB0aGUgbGFzdCB0d28ga2VybmVsIA0KcmVsZWFzZSBjeWNsZXMsIEkndmUg
b2JzZXJ2ZWQgYmV0dGVyIGJhdHRlcnkgbGlmZSBhbmQgcGVyZm9ybWFuY2UgdXNpbmcgDQp0
aGUgWGUgZHJpdmVyLg0KDQpJIGRvIG5vdCBoYXZlIGNvbmNyZXRlIG51bWJlcnMgYWJvdXQg
cG93ZXIgdXNhZ2UgYW5kIGJhdHRlcnkgbGlmZSwganVzdCANCm15IChzdWJqZWN0aXZlKSBm
ZWVsaW5nIGFmdGVyIHVzaW5nIHRoZSBsYXB0b3AgZm9yIGEgd2VlayB3aXRoIGk5MTUgYW5k
IA0KYW5vdGhlciB3ZWVrIHdpdGggWGUuIEFib3V0IHBlcmZvcm1hbmNlLCBNaWNoYWVsIGZy
b20gUGhvcm9uaXggcmVjZW50bHkgDQpzaGFyZWQgc29tZSBiZW5jaG1hcmtzIHdpdGggYSBD
b3JlIFVsdHJhIDcgMTU1SCAoc2FtZSBDUFUgYXMgdGhlIA0KVGhpbmtwYWQgWDEgQ2FyYm9u
IEdlbiAxMik6DQoNCmh0dHBzOi8vd3d3LnBob3Jvbml4LmNvbS9yZXZpZXcvaW50ZWwtbXRs
LWk5MTUteGUtbGludXgNCj4gQ2lhbywgVGhvcnN0ZW4NCg0KQmVzdCwNCkl5w6FuDQoNCi0t
IA0KSXnDoW4gTcOpbmRleiBWZWlnYQ0KR1BHIEtleTogMjA0QyA0NjFGIEJBOEMgODFEMSAw
MzI3ICBFNjQ3IDQyMkUgMzY5NCAzMTFFIDVBQzENCg0K

--------------xyw6Hd0QOJr01ek7spqCaNTr--

--------------FtzT8p0XJFBd0rm32PLPoACu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEIExGH7qMgdEDJ+ZHQi42lDEeWsEFAmjX8ooACgkQQi42lDEe
WsGdmg/9EnWxWzUnOPi8IFufL6gPeZO0ZVJrzrTzg05UhD30liYZB9vwcskmrrxs
3jmBe4yqouhd6E2CI4ZaieAVf2L0U0WOZ85I7eRsxQY8SZ7KFknfv4cFpRXp0YdX
XP6WWCQtaFwcIrXkZgyY3ULQ9kx4E0phUMKHSKruv+kfYGoLCaZvj5NqKTEef1ua
ayJOZyAkbi4kMrDQA4G69jnaY299jfbBq7KPFpInIVP5/z4M8aKfkD/YXoh18+4L
b4WHrMeRB7/hd+GHgmoNmeTl2n0j7wKy/JVxfIB1IzFaUENYcTqcqNLCl4oEBvyp
PJc+F7rYYXtsZ+8MW4bPRPChATDmTER7ms9ReBG97/0X772NRKZVEaXEHLb8h9vI
A9TurH5AIvbleaKUvb/oapKq9bBUOmP3YE+fX+DINM2MXiZ4sYwW2dIUKP8s9R1p
l/XUaf4U7P+WAAfCUzhZf25cmor5JwiE79WI0kJ6HrCE9EyYthtA+B7NWvcaAaiM
rsrZiJtc69I0qtE/a1Bf3U7uFMwQ0NB0y59w2cpbi0vasCBOLGfxC5y4vPWGvKdW
VPpnnMcqdmeK5SwbD7CxTgkXDANOExiCOq4gn4LhoLQ54ifwwgmX5M9YJkqaUwJb
KamTQcks7WUQqqCa/kp0lOHyToI+s2t+wcyCJhdnTol8jcmiWEU=
=hFwr
-----END PGP SIGNATURE-----

--------------FtzT8p0XJFBd0rm32PLPoACu--
