Received: from mxb.seznam.cz (mxb.seznam.cz [77.75.78.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74817664A4
	for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711709045; cv=none; b=htx5fKmWekgdqJDVE0YODcJ65EuY8579ofiWmgrPn3mnjRFL+asazj5yxcuZZpBzAPhD7tvZR0hh6MPC+wkpo+rm74/kxiCX42iGtqrxyzKmbmrfsCGZc3AWj8LbSjvnpxA1X6PBLgYc1Wa6KIEmTdnQLqcC4IE32bZgOkd4bdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711709045; c=relaxed/simple;
	bh=3XIBlqfgFckxQUtMS3Xlm2eN06XyvYJ99urWlnG/uUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZPdDK0/3+Gj2i+4cg+WYKaNBBRvnKiC+Rf/ev0uFHP1ipICLqUXPcStCsLCj92THukFHTEMpqDuM+6YoX66Pykag7H8KX0kUGKGO9cdQwI+LsoLAu6Vb/qc0rWYVdj7qE/DPVD9IbT3CqcMo4V2MAexvbVIivshf35ryKW//jNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=podgorny.cz; spf=pass smtp.mailfrom=podgorny.cz; dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b=bNxPb++6; arc=none smtp.client-ip=77.75.78.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=podgorny.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=podgorny.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b="bNxPb++6"
Received: from email.seznam.cz
	by smtpc-mxb-f558fd76-wxzsv
	(smtpc-mxb-f558fd76-wxzsv [2a02:598:128:8a00::1000:3d9])
	id 75c5c09bc3ff6d82704adad3;
	Fri, 29 Mar 2024 11:43:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn20221014; t=1711709016;
	bh=3XIBlqfgFckxQUtMS3Xlm2eN06XyvYJ99urWlnG/uUM=;
	h=Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type;
	b=bNxPb++6rP3B8Olm5cD5n6PuHmx+nDt4gztBEEak8CTOD3oW9o8MMlaM2s8itKEf9
	 QOo8QGhYiMa2UhgdjLsXloXc9TykcK8tAteEeXt6CecsNqGv3LEIe1+81WvLt7IBQU
	 t0MTOQvAcFVm/pNhfAjRD7JwhIGXJV2Rg0F2oVgYbXX/eU/MeCfk3Kl3vXyLtdaMCF
	 ls/sOvXSY2Lujb3Ahw4pJJ6gyl/93dsHms8s81Pgawgxv0pDFoLb+tw6dDxlb4oPXy
	 +6EC7qkW7GhUYBvkXIsqZKPsXXsOrESzJaKmQioztDwy0U8wm97e0+YWcRxNCv3mKy
	 HQ7AZgd8hVlFQ==
Received: from [IPV6:2a01:9422:904:1ee:e65e:37ff:feee:e29c]
	([2a01:9422:904:1ee:e65e:37ff:feee:e29c])
	by smtpd-relay-64f647f4d6-wjnl2 (szn-email-smtpd/2.0.18) with ESMTPA
	id c0ef0190-406a-4d6c-b087-38c2630c8fdd;
	Fri, 29 Mar 2024 11:43:30 +0100
Message-ID: <240d9025-243f-49d7-bc81-88deceefe12e@podgorny.cz>
Date: Fri, 29 Mar 2024 11:43:28 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] linux 6.6.18 and later fails to boot with "initramfs
 unpacking failed: invalid magic at start of compressed archive"
Content-Language: en-US-large
To: Ard Biesheuvel <ardb@kernel.org>
Cc: regressions@lists.linux.dev, regressions@leemhuis.info
References: <a99a831a-8ad5-4cb0-bff9-be637311f771@podgorny.cz>
 <CAMj1kXG1Vgpp+ckwDww_4q2SF+kajUaoE3+qe5FzMkGyq-Lbag@mail.gmail.com>
 <CAMj1kXGZLs3MdFiK9jrkmWR+YPt50L5tuCJ+rLLTjVa3Grm6tw@mail.gmail.com>
 <61148405-2036-4994-9eef-45cbe6aa9adb@podgorny.cz>
 <CAMj1kXHn0qp2Qq1WfoT015ezjnzHLoy7=XVE_RY+6jsHzQ+gkA@mail.gmail.com>
 <35ae3208-a0ba-43a7-ac4c-6f770b3df405@podgorny.cz>
 <CAMj1kXHO_R4XpQ=To1ZW_yac_sjWFPnw7pjunn0UmraFDA2wCg@mail.gmail.com>
 <92898285-e85c-4e72-a179-70fb65349978@podgorny.cz>
 <CAMj1kXEfeC=O2_NFteJM+L1PqgR2MiXQEcFzmeemsgdKC8s7xQ@mail.gmail.com>
 <dd6e61ac-2356-4b97-85b4-b963a045361b@podgorny.cz>
 <CAMj1kXGcsEhf24QO1_4Wf99z=PR1cqdxim0Ttj-TqQijZOW=+Q@mail.gmail.com>
 <5e9b5508-cbec-4b81-a2e4-4a02e7c201dc@podgorny.cz>
 <CAMj1kXF5TUNXVxcaY550_3JYvkGUZDRYtmPAKpbk64Ci8gpbqw@mail.gmail.com>
 <ae488ff7-97f8-4210-a1a7-98f7a5c3ffa7@podgorny.cz>
 <CAMj1kXEarH+vdk3SqJ8_Vcf-uF4FjTfmjepVbXQ6KciBuCK-wg@mail.gmail.com>
 <CAMj1kXESfih-V4ObfoyROyABoYNp6e9gwGH236=PfJA_AWhQsQ@mail.gmail.com>
From: Radek Podgorny <radek@podgorny.cz>
In-Reply-To: <CAMj1kXESfih-V4ObfoyROyABoYNp6e9gwGH236=PfJA_AWhQsQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SkxbnkDwj7ijjYaSsIlNF69p"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SkxbnkDwj7ijjYaSsIlNF69p
Content-Type: multipart/mixed; boundary="------------L7yfj7tt0XpjFwzh0ODH7taz";
 protected-headers="v1"
From: Radek Podgorny <radek@podgorny.cz>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: regressions@lists.linux.dev, regressions@leemhuis.info
Message-ID: <240d9025-243f-49d7-bc81-88deceefe12e@podgorny.cz>
Subject: Re: [REGRESSION] linux 6.6.18 and later fails to boot with "initramfs
 unpacking failed: invalid magic at start of compressed archive"
References: <a99a831a-8ad5-4cb0-bff9-be637311f771@podgorny.cz>
 <CAMj1kXEo-y1DfY_kBhwGU0xMkGp1PhdqGFmw6ToLePiZy4YgZQ@mail.gmail.com>
 <CAMj1kXFmgba8HyZ-yO7MsQBgOGjM10hZKWESBbfrUcjdhq0XsQ@mail.gmail.com>
 <225e9c2a-9889-4c9e-865c-9ef96bb266f3@podgorny.cz>
 <CAMj1kXG1Vgpp+ckwDww_4q2SF+kajUaoE3+qe5FzMkGyq-Lbag@mail.gmail.com>
 <CAMj1kXGZLs3MdFiK9jrkmWR+YPt50L5tuCJ+rLLTjVa3Grm6tw@mail.gmail.com>
 <61148405-2036-4994-9eef-45cbe6aa9adb@podgorny.cz>
 <CAMj1kXHn0qp2Qq1WfoT015ezjnzHLoy7=XVE_RY+6jsHzQ+gkA@mail.gmail.com>
 <35ae3208-a0ba-43a7-ac4c-6f770b3df405@podgorny.cz>
 <CAMj1kXHO_R4XpQ=To1ZW_yac_sjWFPnw7pjunn0UmraFDA2wCg@mail.gmail.com>
 <92898285-e85c-4e72-a179-70fb65349978@podgorny.cz>
 <CAMj1kXEfeC=O2_NFteJM+L1PqgR2MiXQEcFzmeemsgdKC8s7xQ@mail.gmail.com>
 <dd6e61ac-2356-4b97-85b4-b963a045361b@podgorny.cz>
 <CAMj1kXGcsEhf24QO1_4Wf99z=PR1cqdxim0Ttj-TqQijZOW=+Q@mail.gmail.com>
 <5e9b5508-cbec-4b81-a2e4-4a02e7c201dc@podgorny.cz>
 <CAMj1kXF5TUNXVxcaY550_3JYvkGUZDRYtmPAKpbk64Ci8gpbqw@mail.gmail.com>
 <ae488ff7-97f8-4210-a1a7-98f7a5c3ffa7@podgorny.cz>
 <CAMj1kXEarH+vdk3SqJ8_Vcf-uF4FjTfmjepVbXQ6KciBuCK-wg@mail.gmail.com>
 <CAMj1kXESfih-V4ObfoyROyABoYNp6e9gwGH236=PfJA_AWhQsQ@mail.gmail.com>
In-Reply-To: <CAMj1kXESfih-V4ObfoyROyABoYNp6e9gwGH236=PfJA_AWhQsQ@mail.gmail.com>

--------------L7yfj7tt0XpjFwzh0ODH7taz
Content-Type: multipart/mixed; boundary="------------2GYWyfExD2vgM5ObpcfDlHUh"

--------------2GYWyfExD2vgM5ObpcfDlHUh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

aGVsbG8sDQoNCnRoaXMgcGF0Y2ggKGkgbmFtZWQgaXQgMTEyKSBXT1JLUy4gbm8gaW5pdHJh
bWZzIGVycm9yLCBub3JtYWwgYm9vdCBzZXF1ZW5jZS4NCg0Kci4NCg0KcC5zLjogaSdtIHN0
aWxsIHdvcmtpbmcgb24gcHJldmlvdXMgKGR1bXApIHBhdGNoZXMgLSBzaG91bGQgaSBub3Qg
Y29udGludWU/DQoNCg0KT24gMy8yOC8yNCAzOjQ5IFBNLCBBcmQgQmllc2hldXZlbCB3cm90
ZToNCj4gT24gVGh1LCAyOCBNYXIgMjAyNCBhdCAxMTo0MSwgQXJkIEJpZXNoZXV2ZWwgPGFy
ZGJAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pg0KPj4gT24gVGh1LCAyOCBNYXIgMjAyNCBhdCAx
MToxOCwgUmFkZWsgUG9kZ29ybnkgPHJhZGVrQHBvZGdvcm55LmN6PiB3cm90ZToNCj4+Pg0K
Pj4+IGhpIQ0KPj4+DQo+Pj4gcmVzdWx0czoNCj4+Pg0KPj4+IDEwOCAtIGp1c3QgcGF0Y2gg
MDAwMSAtIFdPUktTDQo+Pj4gMTA5IC0gcGF0Y2ggMDAwMSswMDAyIC0gV09SS1MNCj4+Pg0K
Pj4+IHZpc3VhbGx5LCBpIHNlZSBubyBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG91dHB1dCBv
ZiAxMDggYW5kIDEwOS4gOi0oDQo+Pj4NCj4+PiBib3RoIHN0YXJ0IHdpdGggYSBoZXggZHVt
cCBiZWZvcmUgdGhlICJub3JtYWwiIGJvb3Rpbmcgc2VxdWVuY2UuDQo+Pj4gdW5mb3J0dW5h
dGVseSwgaSBkb2Vzbid0IHNlZW0gdG8gZml0IHRvIHNjcmVlbiBzbyB0aGUgdG9wIG9mIHRo
ZSBkdW1wDQo+Pj4gc2Nyb2xscyBvZiBhbG1vc3QgaW1tZWRpYXRlbHkuIGkgd2FzIGFibGUg
dG8gb25seSBzaG9vdCB0aGUgImJvdHRvbSIgb2YNCj4+PiB0aGUgZHVtcC4gaSBjYW4gbWFr
ZSBhIHZpZGVvIGFuZCB0cnkgdG8gZXh0cmFjdCBmcmFtZXMgaWYgeW91IGFsc28gbmVlZA0K
Pj4+IHRoZSBiZWdpbm5pbmcgb2YgdGhlIGR1bXAuDQo+Pj4NCj4+DQo+PiBDYW4geW91IGRy
b3AgdGhlIGxhc3QgdHdvICdkdW1wX2J1ZigpJyBjYWxscyBhbmQgdHJ5IGFnYWluPyBCdXQg
a2VlcCB0aGUgY2FsbCB0bw0KPj4NCj4+IGVmaV9ic19jYWxsKHN0YWxsLCAxMCAqIEVGSV9V
U0VDX1BFUl9TRUMpOw0KPj4NCj4+IHdoaWNoIGlzIHdoYXQgZ2VuZXJhdGVzIHRoZSAxMHMg
ZGVsYXkuDQo+Pg0KPj4gVGhlIGZpcnN0IGR1bXAgaXMgaW50ZXJlc3RpbmcgYmVjYXVzZSB0
aGUgbWVtY3B5KCkgdGhhdCBpcyBiZWluZw0KPj4gYnJvdWdodCBiYWNrIG92ZXJ3cml0ZXMg
dGhvc2UgY29udGVudHMsIGFuZCBJJ2QgbGlrZSB0byBzZWUgd2hhdCBpcw0KPj4gdGhlcmUg
YmVmb3JlIGluIHlvdXIgY2FzZS4NCj4+DQo+PiBBbHNvIGZpbmUganVzdCB0byBjYXB0dXJl
IGl0IG9uIHZpZGVvIC0gSSBzdXNwZWN0IGl0J3MgYWxsIDB4MCBhbnl3YXkNCj4+ICguLiBp
biB0aGUgZHVtcCkNCj4+DQo+IA0KPiBBZnRlciBzb21lIG1vcmUgaGVhZCBzY3JhdGNoaW5n
LCBJIGlkZW50aWZpZWQgYW4gaXNzdWUgaW4gdGhlIG9yaWdpbmFsDQo+IHBhdGNoIHRoYXQg
bWlnaHQgZXhwbGFpbiB0aGUgYmVoYXZpb3IgeW91IGFyZSBzZWVpbmcuIENvdWxkIHlvdSB0
cnkNCj4gdGhlIGJlbG93IHBsZWFzZT8gKGFuZCBkcm9wIGFsbCB0aGUgb3RoZXIgcmV2ZXJ0
cykNCj4gDQo+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIveDg2LXN0dWIu
Yw0KPiArKysgYi9kcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL3g4Ni1zdHViLmMNCj4g
QEAgLTQ5Niw2ICs0OTYsNyBAQA0KPiAgICAgICAgICBoZHItPnZpZF9tb2RlICAgPSAweGZm
ZmY7DQo+IA0KPiAgICAgICAgICBoZHItPnR5cGVfb2ZfbG9hZGVyID0gMHgyMTsNCj4gKyAg
ICAgICBoZHItPmluaXRyZF9hZGRyX21heCA9IElOVF9NQVg7DQo+IA0KPiAgICAgICAgICAv
KiBDb252ZXJ0IHVuaWNvZGUgY21kbGluZSB0byBhc2NpaSAqLw0KPiAgICAgICAgICBjbWRs
aW5lX3B0ciA9IGVmaV9jb252ZXJ0X2NtZGxpbmUoaW1hZ2UsICZvcHRpb25zX3NpemUpOw0K

--------------2GYWyfExD2vgM5ObpcfDlHUh
Content-Type: text/x-patch; charset=UTF-8; name="patch112.patch"
Content-Disposition: attachment; filename="patch112.patch"
Content-Transfer-Encoding: base64

LS0tIGEvZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi94ODYtc3R1Yi5jCisrKyBiL2Ry
aXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIveDg2LXN0dWIuYwpAQCAtNDk2LDYgKzQ5Niw3
IEBACiAJaGRyLT52aWRfbW9kZSAgID0gMHhmZmZmOwogCiAJaGRyLT50eXBlX29mX2xvYWRl
ciA9IDB4MjE7CisJaGRyLT5pbml0cmRfYWRkcl9tYXggPSBJTlRfTUFYOwogCiAJLyogQ29u
dmVydCB1bmljb2RlIGNtZGxpbmUgdG8gYXNjaWkgKi8KIAljbWRsaW5lX3B0ciA9IGVmaV9j
b252ZXJ0X2NtZGxpbmUoaW1hZ2UsICZvcHRpb25zX3NpemUpOwo=

--------------2GYWyfExD2vgM5ObpcfDlHUh--

--------------L7yfj7tt0XpjFwzh0ODH7taz--

--------------SkxbnkDwj7ijjYaSsIlNF69p
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEydMGi3nQKasCS8bLahNm1VQL0ZwFAmYGm1EFAwAAAAAACgkQahNm1VQL0Zw4
TQ//Y6tHzclu0s/4WBtau8ZPOuNr6AEnbD1p0/sJ+GsiRj4E6br5nxtN3CrVI2g62FrHrHr1eKfN
HumgiZkqTy+7ua2wNE1ZXzn6L8cy/BBDEKW33MeqOy0mzMeOrYFRmFZvS7qB7pcxGmW/wHV56R67
3E/bW1shibGCNGRiMGeskt0SvY+2wO8RNrrQUNH7wdL2+9KN16Yp8grHRl5+hWfcQjfBVUTHu3Dn
VcQ0D4JGwBAQ5YHFJMN04ElnmCINhtHmg1PaIllqPD1GfgXuDOjLZgWM1A5rQMS2uh2j8Of7b5NU
R4BRz5NSXmXc0glEj6eG3NK/izzxJPDryIwym2sQtsxjLFf2rQ4TXjmD8OqfedqGG3rrSBKkNSpC
46CR1LE7x5MMYT04IMsUMXZxtlcGx6Isg8Yf9dudulESNlz7v541NIBHc5ec8NctmSmdXP+FHYMK
wNuwORMT+o0txFnVMgZTbBRzag+uwAue4iOnFxCwZRwtQQ3ol1WDPOty1xm0vxWuMXa/JjOB7Qoo
nAJfX+qxUk6JyO02XAmJ3rNJGOoKbWhBgOQi0t4UnZr1UuV9N0gBS6jTp0rGqKJxBXCAyNCmCi8J
G1ZL60qyoOJ8Hr0BRm4JqRkFNGwpzZBmllHtJ27Q5ROPiO3pqYivYr4jZvb+4pH034PQHpk8dzra
tUI=
=eCEa
-----END PGP SIGNATURE-----

--------------SkxbnkDwj7ijjYaSsIlNF69p--
