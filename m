Received: from mail.aminvakil.com (mail.aminvakil.com [178.63.189.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18C83769FB
	for <regressions@lists.linux.dev>; Wed, 17 Jun 2026 17:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.189.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781718595; cv=none; b=QvMJlUNcb9MjmRla9022EL/58dslMQ4SxvfdlDf9hg/GI2tqGVk9xL7HCyvEUAJE6LxMueNs+miIhA49ut7nz8lPHMi4ZNOdCj5Vom8X/1hsIT8oMmFAnX+24MnQgJ1oZxR1dpTlVsfBT7sDTRpKZq3PQXWSU+3aV0UoSjaomlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781718595; c=relaxed/simple;
	bh=BUQ5fAcTvWgAZiYPIQYU4r67Wx7j/uI9npS1gIVmOJE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SbOAys99QHQvTfMYpa2SvRnlQIcdr5lH+OexzhP0YIwsvyGcMRyNqZ5gD3Qyj/3xz9xMF+X2N2NDAgYbeWB5bR4SsACj24XzWkw05zQ6tCNPpSONZNZeY/IM9b7UNNBHxG5eEDAbpPwNyvKUuEov+zrfAUJxG2/TpGu8tJbwQt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aminvakil.com; spf=pass smtp.mailfrom=aminvakil.com; dkim=pass (2048-bit key) header.d=aminvakil.com header.i=@aminvakil.com header.b=LH3cr6Ic; arc=none smtp.client-ip=178.63.189.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aminvakil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aminvakil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aminvakil.com header.i=@aminvakil.com header.b="LH3cr6Ic"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E8EE4206C;
	Wed, 17 Jun 2026 21:19:39 +0330 (+0330)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aminvakil.com;
	s=dkim; t=1781718584;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-language:in-reply-to:references:autocrypt;
	bh=BUQ5fAcTvWgAZiYPIQYU4r67Wx7j/uI9npS1gIVmOJE=;
	b=LH3cr6Icq76VJMJ3HNIVm1Ru2d+n/xd9DA4mV5t7FmEjxPjGGRF/s5EQmApqlA/wpZIZ8b
	ewd8I2zt30oHrvP6ohg51cKBbcVB2+9fXmCfpwCPVRqhzhlb4y+3mH4xzXnpyCW69ZkEAP
	e1BwsCVHezhDFASZUSylG75vSFvLPlOHYHp5JXc+EryKmp8bSse0lGz2L0c/hEf83LemG1
	a6U7K1QcuKpiOXeSKj5sjYJAF6H9vppJlCG/DVMbEgpVs1LvZoOLWO/nrT+fETTX9RK8f/
	PpC3gA9QVV2QorTVav9JI/CmzsppIkEfAXEy18uRWUBOnTRsMTm10MopJr68MA==
Message-ID: <4e45e34d-31d4-4117-9277-36799e63e6f8@aminvakil.com>
Date: Wed, 17 Jun 2026 21:19:37 +0330
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Amin Vakil <info@aminvakil.com>
Subject: Re: [REGRESSION] usb: core: interrupt-IN wBytesPerInterval fixup
 (727d045d064b) breaks RTL8153 in Lenovo dock
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, linux-usb@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, Tao Xue <xuetao09@huawei.com>,
 regressions@lists.linux.dev
References: <cbdeb118-58c7-48a7-94a0-15e5cdb5879c@aminvakil.com>
 <35d2b455-382e-470e-acf4-1ab60770da90@leemhuis.info>
 <5036fee2-4d00-4ca0-aeed-400da64d7872@aminvakil.com>
 <573bbb08-0ba7-4f00-8996-819cc1d9cc48@aminvakil.com>
 <20260616183646.4798516b.michal.pecio@gmail.com>
 <8f862eb6-adfb-43a9-b4f5-8f9232333b51@aminvakil.com>
 <20260616232027.10ba0415.michal.pecio@gmail.com>
Content-Language: en-US
Autocrypt: addr=info@aminvakil.com; keydata=
 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
 +78sXChAfE9n44i0gJHzV8BhCsQG4+k=
In-Reply-To: <20260616232027.10ba0415.michal.pecio@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0ahHicsa034BYqVTiQLNPonz"
X-Last-TLS-Session-Version: TLSv1.3

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0ahHicsa034BYqVTiQLNPonz
Content-Type: multipart/mixed; boundary="------------Ip0AH7mFLWWLgJZHdRvFJknP";
 protected-headers="v1"; hp="clear"
Message-ID: <4e45e34d-31d4-4117-9277-36799e63e6f8@aminvakil.com>
Date: Wed, 17 Jun 2026 21:19:37 +0330
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Amin Vakil <info@aminvakil.com>
Subject: Re: [REGRESSION] usb: core: interrupt-IN wBytesPerInterval fixup
 (727d045d064b) breaks RTL8153 in Lenovo dock
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, linux-usb@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, Tao Xue <xuetao09@huawei.com>,
 regressions@lists.linux.dev
References: <cbdeb118-58c7-48a7-94a0-15e5cdb5879c@aminvakil.com>
 <35d2b455-382e-470e-acf4-1ab60770da90@leemhuis.info>
 <5036fee2-4d00-4ca0-aeed-400da64d7872@aminvakil.com>
 <573bbb08-0ba7-4f00-8996-819cc1d9cc48@aminvakil.com>
 <20260616183646.4798516b.michal.pecio@gmail.com>
 <8f862eb6-adfb-43a9-b4f5-8f9232333b51@aminvakil.com>
 <20260616232027.10ba0415.michal.pecio@gmail.com>
Content-Language: en-US
Autocrypt: addr=info@aminvakil.com; keydata=
 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
 +78sXChAfE9n44i0gJHzV8BhCsQG4+k=
In-Reply-To: <20260616232027.10ba0415.michal.pecio@gmail.com>

--------------Ip0AH7mFLWWLgJZHdRvFJknP
Content-Type: multipart/mixed; boundary="------------PNfzgZ1I0ZHLxjargavQvI0e"

--------------PNfzgZ1I0ZHLxjargavQvI0e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNi8xNy8yNiAxMjo1MCBBTSwgTWljaGFsIFBlY2lvIHdyb3RlOg0KPiBPbiBUdWUsIDE2
IEp1biAyMDI2IDIwOjIyOjE5ICswMzMwLCBBbWluIFZha2lsIHdyb3RlOg0KPj4gT24gNi8x
Ni8yNiA4OjA2IFBNLCBNaWNoYWwgUGVjaW8gd3JvdGU6DQo+Pj4gUlRMODE1MyB3YXMgb25l
IG9mIHRoZSBjaGlwcyBzcGVjaWZpY2FsbHkgdGFyZ2V0ZWQgYnkgdGhpcyBmaXgsIGJ1dA0K
Pj4+IGl0IGFmZmVjdHMgdGhlIENEQyBjb25maWd1cmF0aW9uIHdoaWNoIHlvdSBkb24ndCBz
ZWVtIHRvIGJlIHVzaW5nLg0KPj4+DQo+Pj4gSSBoYXZlIHRyaWVkIGxpbnV4LWhhcmRlbmVk
LTcuMC4xMi5oYXJkZW5lZDEtMS14ODZfNjQgZnJvbSBBcmNoIHJlcG8NCj4+PiBhcyB3ZWxs
IGFzIG15IG93biBidWlsZCBvZiA3LjEtcmM2LCBhbmQgbXkgUlRMODE1MyAoMGJkYTo4MTUz
KSBpbiBhDQo+Pj4gZGlmZmVyZW50IGtpbmQgb2YgVVNCLUMgZG9jayBzdGlsbCB3b3JrcyB3
aXRoIGEgZmV3IHhIQ0kgY29udHJvbGxlcnMuDQo+Pj4NCj4+PiBTbyBpdCdzIHNvbWUgd2Vp
cmQgcHJvYmxlbSBuYXJyb3dseSBzcGVjaWZpYyB0byB5b3VyIHN5c3RlbS4gTm93IHRoYXQN
Cj4+PiB5b3UgaGF2ZSBidWlsdCB5b3VyIG93biBrZXJuZWwsIHBsZWFzZSBhbHNvIHJldmVy
dCB0aGUgc3VzcGVjdCBwYXRjaA0KPj4+IHRvIHZlcmlmeSBpZiB0aGF0J3MgcmVhbGx5IGl0
Lg0KPj4NCj4+IEhvbmVzdGx5IEkndmUgdHJpZWQgcGF0Y2hpbmcgaXQgbXlzZWxmIDopDQo+
Pg0KPj4gYnkgY2hhbmdpbmcNCj4+DQo+PiAobGUxNl90b19jcHUoZGVzYy0+d0J5dGVzUGVy
SW50ZXJ2YWwpIDwgdXNiX2VuZHBvaW50X21heHAoJmVwLT5kZXNjKSAmJg0KPj4NCj4+IHRv
DQo+Pg0KPj4gKGxlMTZfdG9fY3B1KGRlc2MtPndCeXRlc1BlckludGVydmFsKSA9PSAwICYm
DQo+Pg0KPj4gaW4gbGluZSAxODcgb2YgZHJpdmVycy91c2IvY29yZS9jb25maWcuYyB0byBz
ZWUgaWYgdGhhdCBmaXhlcyB0aGUgaXNzdWUNCj4+IGFuZCBpdCBkaWQgbm90LCBidXQgSSBk
aWRuJ3Qgc3BlY2lmaWNhbGx5IHJldmVydGVkIHRoZSBjb21taXQgdG8gc2VlIGlmDQo+PiB0
aGF0IGZpeGVzIHRoZSBpc3N1ZS4NCj4gDQo+IFRoaXMgc2hvdWxkIGJlIGVub3VnaCB0byBw
cmV2ZW50IG92ZXJyaWRpbmcgd0J5dGVzUGVySW50ZXJ2YWwgb24NCj4gUlRMODE1MyAoYW5k
IGdldCByaWQgb2YgdGhlIG5ldyBsb2cgbWVzc2FnZSkuDQo+IA0KPiBJZiB0aGUgbWVzc2Fn
ZSBnb2VzIGF3YXkgYnV0IHRoZSBkZXZpY2Ugc3RpbGwgZG9lc24ndCB3b3JrLCB0aGUgcHJv
YmxlbQ0KPiBtdXN0IGJlIHNvbWV3aGVyZSBlbHNlLg0KPiANCj4gSSB3b3VsZCBzdGFydCB3
aXRoIHVzZXJzcGFjZSAtIGlmIHlvdSBoYXZlbid0IGFscmVhZHksIGRvd25ncmFkZSB0bw0K
PiBzb21lIGtlcm5lbCBwYWNrYWdlIHdoaWNoIHdvcmtlZCBpbiB0aGUgcGFzdC4gU2VlIGlm
IGl0IHN0aWxsIHdvcmtzLg0KPiBPciBjaGVjayBpZiA5ZGRiOWMwZGVjYTQ4ZDJjMmEyMmVi
ZjRkMmYzNWM5MjVhNTIwMzI4IGFwcGxpZXMgdG8geW91cg0KPiBkb2NrIGFuZCB0cnkgcmV2
ZXJ0aW5nIGl0IGlmIGl0IGRvZXMuDQo+IA0KPiBPdGhlcndpc2UsIG5vIGlkZWEsIGJlc2lk
ZXMgZ2l0LWJpc2VjdCBJIGd1ZXNzLg0KDQpUaGUgcHJvYmxlbSBpcyBzb21ldGhpbmcgd2l0
aCB1c2JndWFyZCBhbGwgdGhlIHdheSA6KQ0KDQpEaXNhYmxpbmcgdXNiZ3VhcmQgZml4ZWQg
dGhlIGlzc3VlIGFuZCBpdCdzIG5vdyB3b3JraW5nIG9uIDcuMSANCmNvcnJlY3RseS4gU29y
cnkgZm9yIHRoZSBub2lzZS4NCg0KVGhlIHByb2JsZW0gd2FzIGEgc3RhbGUgdXNiZ3VhcmQg
cG9saWN5IGJsb2NraW5nIHRoZSBodWIsIHVwZGF0aW5nIA0KdXNiZ3VhcmQgcG9saWN5IHdp
dGggbmV3IGhhc2ggZml4ZWQgdGhhdCBhcyB3ZWxsLg0KDQpBZ2FpbiBJJ20gc29ycnkgZm9y
IHRoZSBub2lzZSBhbmQgdGhhbmsgeW91IGZvciB0aW1lLg0KDQo+IFJlZ2FyZHMsDQo+IE1p
Y2hhbA0KDQoNCg==
--------------PNfzgZ1I0ZHLxjargavQvI0e
Content-Type: application/pgp-keys; name="OpenPGP_0x1EFC1864E9D9E56B.asc"
Content-Disposition: attachment; filename="OpenPGP_0x1EFC1864E9D9E56B.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
+78sXChAfE9n44i0gJHzV8BhCsQG4+k=3D
=3DGHsk
-----END PGP PUBLIC KEY BLOCK-----

--------------PNfzgZ1I0ZHLxjargavQvI0e--

--------------Ip0AH7mFLWWLgJZHdRvFJknP--

--------------0ahHicsa034BYqVTiQLNPonz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEhGrABIXlXG/0vJ9THvwYZOnZ5WsFAmoy3jEFAwAAAAAACgkQHvwYZOnZ5WuO
wgwAkzMOTn/mtDzBPIoZpt64RvGC8FrIxm4Vzr+S7USqh2surNsCrBqVOddwEtqr6xec5WlL0NfU
sRfUXrdH/Biz7eGhPC7OAouEL8TrHipzk8aGwRzhcl1DKkb2N87m8J6d9gKCNV+GLTLI7a8TuLMM
e9oxj37/tdfRoHLDfjA4wEwEPyPrVQVqpgKqdEDI8W+A1wkP4weF6yfIaDATyBSyak6GNnA+57CO
uYpEEIZ+lB1OrQT9kdPN/gX/MvoUvnDWluYfjsBoihQu1UboeXfEe0nnrIeb+bhe10beqdFh3UJ/
gg1sENVJA1IshC5Ik9m+2BT3zDvHGZWJzF5qRjOiaj3qGQd/1lY+OTiNA/K7gGF0Jt7P9wNw4WjV
Dnwz4+IdCRLoMHfElj0KAmIUKN9p08VgoDmV+xhLe5gg+KEZVI0y0cuwS2vO4aa16XrwYURf6fJ/
X+PmrF9HWzJ41pwJESiVrtRJCaNpklflfNylpnfQAfniuKZnHRpkLydg0peA
=tT4M
-----END PGP SIGNATURE-----

--------------0ahHicsa034BYqVTiQLNPonz--
