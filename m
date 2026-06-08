Received: from prod-mta-13.swg-srv.net (prod-mta-13.swg-srv.net [185.255.28.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703A83A2E12
	for <regressions@lists.linux.dev>; Mon,  8 Jun 2026 10:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.255.28.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914913; cv=none; b=mY+WH12vmuH9aEhcKQzB9dXK1/X+lf7TBFgJD078wbYNLhqKZo5J92M9gFucotZUuTNMWFnFJgX4evo9Q+C53hpw5zyF7xYe7iiVlZDLvZY+ojJKeqQ/ly8llEXSwPJOUnpM69SespkLA3qs2CuZAXn6h0+MLX28uj5hJWunuew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914913; c=relaxed/simple;
	bh=KSdZgsdA0CVUjmOdg4lEpKebdC7WFt+gNkCOZ0X8Bdk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=flW0Q88QWmuocc2WZU2X3qBrxcs/dK5m+x3KRD6RyNgxGbMtCAIwcFOmXI1+ShAv6x0oIgefJtWQDmBVcVti9b2UOLj7EWSuqY4QlAt71TXcXmVmZ1QhriebT/pG11ZNrWHK/TsL+LeVdsc7SjIY/2MnUztTz9Sa2UJ7jKs4/HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vates.tech; spf=pass smtp.mailfrom=swg.vates.tech; dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b=IqmC/qQu; arc=none smtp.client-ip=185.255.28.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vates.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swg.vates.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b="IqmC/qQu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=KSdZgsdA0CVUjmOdg4lEpKebdC7WFt+gNkCOZ0X8Bdk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=IqmC/qQuDyy9NJS65m5lW6nkBdUwA0mrwdyL99f1lZScLq5dLczntXbkJcUcCU3818dF+V/zr
 GlxpLt7PSTWDfpKMiBccyN8VQQX999sguH73uvK6HfC4X0TNi9+ZMLm37eEIti9UHVdSHbo4VR0
 TSpoxKOJtNiIOSA95JMlJDP+G5X/IgNpChEcygtQvYQXLHvnGFbHRSXhv6VhQ0swFD8mE3FhnWn
 5lv+KpdBkDhQDozEdvLZ4D2L76XwWXfDoJ/wfTyqFXjRJuP/h42aWqYRIlbch4zXNDB0cUL35nP
 nYTQm1axrObFuI5s0cesO5HBbfM/XaWlGfsc8o2mPVUg==
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender: 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id 19ea6c8227b000701b.001
 for <regressions@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 08 Jun 2026 10:29:54 +0000
X-Zone-Loop: 49b2262438e09c58be2c068170a2f5159539ba1cc23f
x-campaign-type: default
x-transaction-id: 645de423-a0c8-4d61-a3e2-bb190f95e0cc
x-swg-uid: 01-4463f8a4-de7a-4b14-8c7a-7daaf8a4d604
X-Mailer: Sweego
Message-ID:
 <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
x-swg-bid: 1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
	(Authenticated sender: teddy.astie)
	by mail2.vates.fr (Postfix) with ESMTPSA id B54E6870A8;
	Mon,  8 Jun 2026 12:29:53 +0200 (CEST)
Date: Mon, 8 Jun 2026 12:29:53 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
From: Teddy Astie <teddy.astie@vates.tech>
Subject: [REGRESSION][BISECTED] Long boot time with Xen HVM guests during PV
 spinlock initialization
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Olivier Lambert <olivier.lambert@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WKkEUcsBQ7WSRW0erHybh9j2"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1780914593833

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WKkEUcsBQ7WSRW0erHybh9j2
Content-Type: multipart/mixed; boundary="------------hWRCOMaiMnlf1PnELWG0Gg0i";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Olivier Lambert <olivier.lambert@vates.tech>
Message-ID: <fcb0b8c3-fe08-445a-86f9-2691cb77fe90@vates.tech>
Subject: [REGRESSION][BISECTED] Long boot time with Xen HVM guests during PV
 spinlock initialization

--------------hWRCOMaiMnlf1PnELWG0Gg0i
Content-Type: multipart/mixed; boundary="------------LW1wKyaS2NsA5yXw7Q8geKiB"

--------------LW1wKyaS2NsA5yXw7Q8geKiB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkluIDYuMTIuNSsga2VybmVscyBvbiBBTUQgQ1BVcywgd2Ugb2JzZXJ2ZSBh
Ym5vcm1hbGx5IGxvbmcgYm9vdCB0aW1lcyANCndoZXJlIHRoZSBndWVzdCBpcyBzdHJ1Z2ds
aW5nIG9uIFBWIHNwaW5sb2NrIGluaXRpYWxpemF0aW9uLg0KDQpUaGlzIG9jY3VycyBzdGFy
dGluZyB3aXRoIDYuMTIuNSwgYW5kIGFsc28gb24gbW9yZSByZWNlbnQga2VybmVscyBvbiAN
CkludGVsIHBsYXRmb3JtcywgYnV0IHRoYXQgaGFzbid0IGJlZW4gZnVsbHkgaW52ZXN0aWdh
dGVkIGF0IHRoaXMgdGltZSANCihidXQgSSBhc3N1bWUgaXQncyBhIHZhcmlhbnQgb2YgdGhl
IHNhbWUgaXNzdWUpLg0KDQpUaGlzIG9jY3VycyBzaW5jZSBhIGJhY2twb3J0IG9mIDc2MDMx
ZDkgKCJjbG9ja3NvdXJjZTogTWFrZSBuZWdhdGl2ZSANCm1vdGlvbiBkZXRlY3Rpb24gbW9y
ZSByb2J1c3QiKS4NCg0KU29tZSAoY2xhdWRlLWJhc2VkKSBhbmFseXNpcyBtYWRlIGFwcGVh
cnMgdG8gcmVsYXRlIHRoYXQgdG8gdGhlIGxhY2sgb2YgDQpwcm9wZXIgbWF4X3Jhd19kZWx0
YSBpbiB0aGUgamlmZmllcyBjbG9ja3NvdXJjZSB3aGljaCBhcHBlYXJzIHRvIG1ha2UgDQp0
aGUgY2xvY2sgZmFpbCB0byBwcm9ncmVzcyBtZWFuaW5nZnVsbHkuDQoNCkhlcmUgaXMgYSBy
YXcgc3VtbWFyeSBvZiB0aGUgYW5hbHlzaXMNCiA+IFdlIHRyYWNrZWQgaXQgZG93biB0byBh
IHNpbmdsZSBzdGFibGUgYmFja3BvcnQgaW4gNi4xMi41OiBjb21taXQgDQoxYTY3OGY2ODI5
YTggKCJjbG9ja3NvdXJjZTogTWFrZSBuZWdhdGl2ZSBtb3Rpb24gZGV0ZWN0aW9uIG1vcmUg
cm9idXN0IiwgDQp1cHN0cmVhbSA3NjAzMWQ5NTM2YTApLiBJdCBpbnRyb2R1Y2VzIGEgbWF4
X3Jhd19kZWx0YSBmaWVsZCBvbiBzdHJ1Y3QgDQpjbG9ja3NvdXJjZSBidXQgbmV2ZXIgaW5p
dGlhbGl6ZXMgaXQgZm9yIHRoZSBkZWZhdWx0IGJvb3QgdGltZWtlZXBlciANCih0aGUgamlm
ZmllcyBjbG9ja3NvdXJjZSksIHNvIGNsb2Nrc291cmNlX2RlbHRhKCkgY2xhbXBzIGV2ZXJ5
IGRlbHRhIHRvIA0KMCBhbmQgQ0xPQ0tfTU9OT1RPTklDIGZyZWV6ZXMgd2hpbGUgdGhhdCBj
bG9ja3NvdXJjZSBpcyBhY3RpdmUuIE9uIHRoaXMgDQpIVk0gZ3Vlc3QsIFNNUCBicmluZy11
cCBydW5zIHdoaWxlIHRoZSBqaWZmaWVzIGNsb2Nrc291cmNlIGlzIHN0aWxsIHRoZSANCnRp
bWVrZWVwZXIsIGFuZCB0aGUgWGVuIHNpbmdsZSBzaG90IChoaWdoIHJlc29sdXRpb24pIHRp
Y2sgdGhlbiBhZHZhbmNlcyANCmppZmZpZXMgZmFyIHRvbyBzbG93bHksIHNvIHRoZSBzZWNv
bmRhcnkgQ1BVcyBidXJuIHNlY29uZHMgaW4gDQpjYWxpYnJhdGVfZGVsYXkoKS4NCg0KVGVk
ZHkNCg==
--------------LW1wKyaS2NsA5yXw7Q8geKiB
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------LW1wKyaS2NsA5yXw7Q8geKiB--

--------------hWRCOMaiMnlf1PnELWG0Gg0i--

--------------WKkEUcsBQ7WSRW0erHybh9j2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmommaEFAwAAAAAACgkQZg+p0QLLz9Dp
KQwAoMrJWZgNTP6C30II34gUK3f+q1u+It7m5LrXITvEAWiJKvyNOBIyy/RiLrqoVXvA8juoYVL5
k9Qp/A/2IJxDgiIDHOW2/GrnDWbOIpdmc6Ct8mCLH4ZNn5bGnqslFLFwrbCDqVamAv/rEZ5mkdpI
5XBfqxTOQVr7L0jKg/3nKGhqsYZAg9DvorJ+69wNhaGDH2lMpTdtRWIXf5IEP8kv+T1F0HRs5tsR
ZSqNisOIw9JrMGGMoaLVtvAvWDQn/Yl8whrgZ8p/BTwS6VzlySpryepBFGpvGYDG/ej2BjHqCWIa
kGqDAsqIFY7OBNLvoV+Teo2/rjD80ILZjP/GXC1zjPd+Z8M0k5vtMAtNoBPyACWVdviW9tflAwc4
ZE0ay+QvC2vvuBtvhNEk/ngtiSfLf60+E/jJubc/Jrzbm+OkCse/9N109/IgnOK1/coGnubC5GxK
DmdY1eVQRfifngzc5QZL0WR/6d13oO9klxMJRxA+5n+RPDv7RAzhI9ZBV2IP
=cR7M
-----END PGP SIGNATURE-----

--------------WKkEUcsBQ7WSRW0erHybh9j2--
