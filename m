Received: from prod-mta-13.swg-srv.net (prod-mta-13.swg-srv.net [185.255.28.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FC4381AE2
	for <regressions@lists.linux.dev>; Tue,  9 Jun 2026 09:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.255.28.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997270; cv=none; b=SLqFiCnKnYu2eT1fjeTjAUoxfJGMfE9BBJSwcKHrTu9a3Kdnc3c6YonNNPZCB/1xgMHTYx5zzkaE10lpoumNGRFweBE1CiiGX7tb78Rss4LiR1iu1HkEhVV7pUy16lZe3vrNIBqYZUsE90oEk+mldACWbQJkxUS49O8+ViI5NTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997270; c=relaxed/simple;
	bh=iRiAiTqkREsC1AY3pouH8cGqmIKGrMgPQMg+Fn5JY+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7CvSlfdCVXIJfgnqCWNQSwBM4cS++XTY+Zrd4iaXdzh5nASssPsaAwRjlpOs9WgSH8JJwgZR1XCb/QB68P1+uiPxZHXbqcw3XiIXc+WXtR/Qe+c3H18tpEgiDeDv5c7jbBDTPf8OhDWRoNvxsKCeKjgB3QEIHTodhS8LO0akJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vates.tech; spf=pass smtp.mailfrom=swg.vates.tech; dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b=Y72LqLfA; arc=none smtp.client-ip=185.255.28.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vates.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swg.vates.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b="Y72LqLfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=iRiAiTqkREsC1AY3pouH8cGqmIKGrMgPQMg+Fn5JY+g=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Y72LqLfAuhsU262Mmxflm2xy9OrT8aL3+ZBm8uVTfmnY2P54l8LqlvkZGoKmyAFZy8WQXxfi8
 3Gj2qK6JQDBcRUykE2cTDDhizJOoAfbGo2M2ot47wfxmq8wP7zYvORkdURbtpGKgiCmMqnMB2Py
 dNMLUGOEykUs2N5x1pIItlWj+9dO9rhT3wcEimM2/eLcL44RkCuzaopuwMyNSz0vRLxEYiDDmZJ
 swbdX2w6EQdDzovOpUKjDwKOU3GrKnrRp8EHm47+xIMQhi4fxuy4ahSgV69RlZn9s0e1erwBOVa
 F3AW5qUGCkttuWLbuMu+us4j6n6nnmTJjF4woqIxCUhA==
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender: 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id 19eabb58e51000701b.002
 for <regressions@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 09 Jun 2026 09:27:42 +0000
X-Zone-Loop: 26e5bf294308f512b153826bdbe8b0fa5927b2a2bc77
x-campaign-type: default
x-transaction-id: 604253d4-c151-47e0-872c-e391d146727d
x-swg-uid: 01-e5c0662a-2fe3-4876-9239-12a026d4e12e
X-Mailer: Sweego
Message-ID:
 <1780997262.8631fc262581453bbf619ec5b2062170.19eabb58e51000701b@vates.tech>
x-swg-bid: 1780997262.8631fc262581453bbf619ec5b2062170.19eabb58e51000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
	(Authenticated sender: teddy.astie)
	by mail2.vates.fr (Postfix) with ESMTPSA id 68D15870DB;
	Tue,  9 Jun 2026 11:27:42 +0200 (CEST)
Date: Tue, 9 Jun 2026 11:27:41 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] Long boot time with Xen HVM guests during
 PV spinlock initialization
To: Thomas Gleixner <tglx@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Olivier Lambert <olivier.lambert@vates.tech>
References: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
 <87ldcp3w16.ffs@fw13>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <87ldcp3w16.ffs@fw13>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VYW03QMNUWDMkDDqZOCTQ1gA"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1780997262528

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VYW03QMNUWDMkDDqZOCTQ1gA
Content-Type: multipart/mixed; boundary="------------AY2KvVnnsBl0gH2jxcB0Uuq5";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Thomas Gleixner <tglx@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Olivier Lambert <olivier.lambert@vates.tech>
Message-ID: <f8c6e4b4-5265-4290-8821-5c8992c296a7@vates.tech>
Subject: Re: [REGRESSION][BISECTED] Long boot time with Xen HVM guests during
 PV spinlock initialization
References: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
 <87ldcp3w16.ffs@fw13>
In-Reply-To: <87ldcp3w16.ffs@fw13>

--------------AY2KvVnnsBl0gH2jxcB0Uuq5
Content-Type: multipart/mixed; boundary="------------ktWf3vcWFq3W5u6Ega2JGhin"

--------------ktWf3vcWFq3W5u6Ega2JGhin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDgvMDYvMjAyNiDDoCAxNzoxNSwgVGhvbWFzIEdsZWl4bmVyIGEgw6ljcml0wqA6DQo+
IE9uIE1vbiwgSnVuIDA4IDIwMjYgYXQgMTI6MjksIFRlZGR5IEFzdGllIHdyb3RlOg0KPj4g
SW4gNi4xMi41KyBrZXJuZWxzIG9uIEFNRCBDUFVzLCB3ZSBvYnNlcnZlIGFibm9ybWFsbHkg
bG9uZyBib290IHRpbWVzDQo+PiB3aGVyZSB0aGUgZ3Vlc3QgaXMgc3RydWdnbGluZyBvbiBQ
ViBzcGlubG9jayBpbml0aWFsaXphdGlvbi4NCj4+DQo+PiBUaGlzIG9jY3VycyBzdGFydGlu
ZyB3aXRoIDYuMTIuNSwgYW5kIGFsc28gb24gbW9yZSByZWNlbnQga2VybmVscyBvbg0KPj4g
SW50ZWwgcGxhdGZvcm1zLCBidXQgdGhhdCBoYXNuJ3QgYmVlbiBmdWxseSBpbnZlc3RpZ2F0
ZWQgYXQgdGhpcyB0aW1lDQo+PiAoYnV0IEkgYXNzdW1lIGl0J3MgYSB2YXJpYW50IG9mIHRo
ZSBzYW1lIGlzc3VlKS4NCj4+DQo+PiBUaGlzIG9jY3VycyBzaW5jZSBhIGJhY2twb3J0IG9m
IDc2MDMxZDkgKCJjbG9ja3NvdXJjZTogTWFrZSBuZWdhdGl2ZQ0KPj4gbW90aW9uIGRldGVj
dGlvbiBtb3JlIHJvYnVzdCIpLg0KPj4NCj4+IFNvbWUgKGNsYXVkZS1iYXNlZCkgYW5hbHlz
aXMgbWFkZSBhcHBlYXJzIHRvIHJlbGF0ZSB0aGF0IHRvIHRoZSBsYWNrIG9mDQo+PiBwcm9w
ZXIgbWF4X3Jhd19kZWx0YSBpbiB0aGUgamlmZmllcyBjbG9ja3NvdXJjZSB3aGljaCBhcHBl
YXJzIHRvIG1ha2UNCj4+IHRoZSBjbG9jayBmYWlsIHRvIHByb2dyZXNzIG1lYW5pbmdmdWxs
eS4NCj4+DQo+PiBIZXJlIGlzIGEgcmF3IHN1bW1hcnkgb2YgdGhlIGFuYWx5c2lzDQo+PiAg
ID4gV2UgdHJhY2tlZCBpdCBkb3duIHRvIGEgc2luZ2xlIHN0YWJsZSBiYWNrcG9ydCBpbiA2
LjEyLjU6IGNvbW1pdA0KPj4gMWE2NzhmNjgyOWE4ICgiY2xvY2tzb3VyY2U6IE1ha2UgbmVn
YXRpdmUgbW90aW9uIGRldGVjdGlvbiBtb3JlIHJvYnVzdCIsDQo+PiB1cHN0cmVhbSA3NjAz
MWQ5NTM2YTApLiBJdCBpbnRyb2R1Y2VzIGEgbWF4X3Jhd19kZWx0YSBmaWVsZCBvbiBzdHJ1
Y3QNCj4+IGNsb2Nrc291cmNlIGJ1dCBuZXZlciBpbml0aWFsaXplcyBpdCBmb3IgdGhlIGRl
ZmF1bHQgYm9vdCB0aW1la2VlcGVyDQo+PiAodGhlIGppZmZpZXMgY2xvY2tzb3VyY2UpLCBz
byBjbG9ja3NvdXJjZV9kZWx0YSgpIGNsYW1wcyBldmVyeSBkZWx0YSB0bw0KPj4gMCBhbmQg
Q0xPQ0tfTU9OT1RPTklDIGZyZWV6ZXMgd2hpbGUgdGhhdCBjbG9ja3NvdXJjZSBpcyBhY3Rp
dmUuDQo+IA0KPiBCYWguIGppZmZpZXMgY2xvY2tzb3VyY2UgaXMgcmVnaXN0ZXJlZCB3YXkg
X2FmdGVyXyB0aW1la2VlcGluZyBzdGFydGVkIHRvDQo+IHVzZSBpdC4NCj4gDQo+IFRoZSB1
bnRlc3RlZCBiZWxvdyBzaG91bGQgZml4IHRoYXQuDQo+IA0KPiBUaGFua3MsDQo+IA0KPiAg
ICAgICAgICB0Z2x4DQo+IC0tLQ0KPiAtLS0gYS9rZXJuZWwvdGltZS9qaWZmaWVzLmMNCj4g
KysrIGIva2VybmVsL3RpbWUvamlmZmllcy5jDQo+IEBAIC02MCwxNSArNjAsOSBAQCBFWFBP
UlRfU1lNQk9MKGdldF9qaWZmaWVzXzY0KTsNCj4gICANCj4gICBFWFBPUlRfU1lNQk9MKGpp
ZmZpZXMpOw0KPiAgIA0KPiAtc3RhdGljIGludCBfX2luaXQgaW5pdF9qaWZmaWVzX2Nsb2Nr
c291cmNlKHZvaWQpDQo+IC17DQo+IC0JcmV0dXJuIF9fY2xvY2tzb3VyY2VfcmVnaXN0ZXIo
JmNsb2Nrc291cmNlX2ppZmZpZXMpOw0KPiAtfQ0KPiAtDQo+IC1jb3JlX2luaXRjYWxsKGlu
aXRfamlmZmllc19jbG9ja3NvdXJjZSk7DQo+IC0NCj4gICBzdHJ1Y3QgY2xvY2tzb3VyY2Ug
KiBfX2luaXQgX193ZWFrIGNsb2Nrc291cmNlX2RlZmF1bHRfY2xvY2sodm9pZCkNCj4gICB7
DQo+ICsJY2xvY2tzb3VyY2VfcmVnaXN0ZXIoJmNsb2Nrc291cmNlX2ppZmZpZXMpOw0KPiAg
IAlyZXR1cm4gJmNsb2Nrc291cmNlX2ppZmZpZXM7DQo+ICAgfQ0KPiAgIA0KPiANCj4gDQoN
CkhtbSwgdGhlcmUncyBhIGNhc2Ugd2hlcmUgY2xvY2tzb3VyY2VfbXV0ZXggZ2V0cyB0YWtl
biB0d2ljZSAoYm90aCBpbiANCl9fY2xvY2tzb3VyY2VfcmVnaXN0ZXJfc2NhbGUoKSAodGhy
b3VnaCBjbG9ja3NvdXJjZV9yZWdpc3RlcigpKSBhbmQgDQpjbG9ja3NvdXJjZV9kb25lX2Jv
b3RpbmcoKSkuDQoNCldoYXQgYWJvdXQgbWFraW5nIGNsb2Nrc291cmNlX2ppZmZpZXMgZ2Fp
biAtPmVuYWJsZSgpIHRvIHNldHVwIHdoYXQgZXZlciANCm5lZWRzIHRvIGJlIChsaWtlIGNh
bGxpbmcgX19jbG9ja3NvdXJjZV91cGRhdGVfZnJlcV9zY2FsZSgpKSA/DQoNClRlZGR5DQo=

--------------ktWf3vcWFq3W5u6Ega2JGhin
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------ktWf3vcWFq3W5u6Ega2JGhin--

--------------AY2KvVnnsBl0gH2jxcB0Uuq5--

--------------VYW03QMNUWDMkDDqZOCTQ1gA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmon3I4FAwAAAAAACgkQZg+p0QLLz9Cb
Wwv/XYHP+c3tlytJvqEhKCihrMhxETIHOf4RWpNchgJgCp3P6ueK1rCf6Fw8sqDv/j1l8v9knhkL
yCWH2/WmJjUvDoItcpQemEi3b/b63owWOIN0AYQodNISdNTxrE4urVGPKSJYirqa/FIYPaFxCC4o
e6D0NkNQQMmOzURnLf4b2N3BFkJZ3cpqQZi2Zn7n6RxmWnxHUfxySBSAMv3cMSsDkdBUhbcDPn15
J/OvDeRFN1Nvgkks292OSH8QWuaOKfVbSwGqlARpYiedxbFaisxJwAaa6WO5w8oqaZVPvblBcP0e
jQDFbJkoWsuA4dPdJFyMqq7ko6zel9j+z8XTWAaRcOzE/7nUNZ0pJwopCWgqzlFkZrhceC1h9lNS
dkxCJxL7cIWfTRKci/JoQ6XbOe0LAsikRDB6d28XNZcI9v3Epl3tz1H6Cm+wACOOzeyiRWl5uUtY
djyPS0WNwC1D3Gdo9c0H0rF9rjcsg+EQqzFf4TmGq8FhqPlntjmCBaUcZ+Mu
=x6PE
-----END PGP SIGNATURE-----

--------------VYW03QMNUWDMkDDqZOCTQ1gA--
