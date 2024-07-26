Received: from postout1.mail.lrz.de (postout1.mail.lrz.de [129.187.255.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7EE176ABA
	for <regressions@lists.linux.dev>; Fri, 26 Jul 2024 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.187.255.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721982321; cv=none; b=neMggdTts8WiBojAzZ4wxdca46xVOfSe1+c1t2Q1yCxNFFA3nKEyWAJi3tyqKoKVo7HOQx9QJ4BkuYnv9FKpc84w2R4EV8DqjYCkLPPGRd/rv7GTzn9bVq+diK3FR2DkKktDOQPxWFKDX2V88zqMJtgPeqpanfWoaNrG18dKiYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721982321; c=relaxed/simple;
	bh=5X0ARH30JoIzULmHR+IpQ7roRDIunnBK79TvB5ICM+c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eSNUSTQH0rTnjuw5rEJPR3Fc7w333/lx65oznH96lMT2q2DHRvPHvOuE5K13JfFnJ/zFxfbbBts844A/5/NbfRsyaIIdyye14iJKBLyWzHkOIre7fGJQtH1BK1vW15nwHqitocY+cRq4xhmPp2/j72ePPrDkiVK9+Y6beJGJQG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lrz.de; spf=pass smtp.mailfrom=lrz.de; dkim=pass (2048-bit key) header.d=lrz.de header.i=@lrz.de header.b=zSZo4Vti; arc=none smtp.client-ip=129.187.255.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lrz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lrz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lrz.de header.i=@lrz.de header.b="zSZo4Vti"
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4WVgdL0mTqzyZB;
	Fri, 26 Jul 2024 10:19:02 +0200 (CEST)
Authentication-Results: postout.lrz.de (amavisd-new); dkim=pass (2048-bit key)
	reason="pass (just generated, assumed good)" header.d=lrz.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lrz.de; h=
	mime-version:content-type:content-type:content-language
	:accept-language:in-reply-to:references:message-id:date:date
	:subject:subject:from:from:received:received:received:received;
	 s=postout; t=1721981941; bh=5X0ARH30JoIzULmHR+IpQ7roRDIunnBK79T
	vB5ICM+c=; b=zSZo4Vti7EjJVm2M9k9ihFd7Xn5PgRIvrVxNRUwbpp9AgyPQhUT
	MSlkQf4Z6rCRzwbnvtYKK9ZwXanaz0VQpvZTa4uOiZktxx9I2SkKAnBwjHK4wuCW
	qh/FH4nckPmqDZwfQirGnWTxS7Da/XTYd1oCquR3xe46djTIuN7aa9w1CkGXiW3C
	Yv+8Cemz7FQhNmGbWs3si3Sjm7agkSSjPUsNzYWEwgavwbBjA8+Cx+i/ZObJhiNM
	ymfJ/LzU8Yt+ytXkoBQiDuOp1kP8YaZgwP/RQu2x9XtyfYmZy6+vaRK2FXj41+Wy
	LVIYHe2OS1Jy7FHw2r14haDSDdWq+couc7g==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.865
X-Spam-Level:
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id DN1YkRZwIoba; Fri, 26 Jul 2024 10:19:01 +0200 (CEST)
Received: from BADWLRZ-SWEX01B.ads.mwn.de (BADWLRZ-SWEX01B.ads.mwn.de [IPv6:2001:4ca0:0:108::192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "BADWLRZ-SWEX01B", Issuer "BADWLRZ-SWEX01B" (not verified))
	by postout1.mail.lrz.de (Postfix) with ESMTPS id 4WVgdK3C94zyYr;
	Fri, 26 Jul 2024 10:19:01 +0200 (CEST)
Received: from BADWLRZ-SWEX03A.ads.mwn.de (2001:4ca0:0:108::195) by
 BADWLRZ-SWEX01B.ads.mwn.de (2001:4ca0:0:108::192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 26 Jul 2024 10:19:01 +0200
Received: from BADWLRZ-SWEX03A.ads.mwn.de ([fe80::135:d2e8:a257:4168]) by
 BADWLRZ-SWEX03A.ads.mwn.de ([fe80::135:d2e8:a257:4168%15]) with mapi id
 15.02.1544.011; Fri, 26 Jul 2024 10:19:01 +0200
From: =?utf-8?B?U3RlaW5iZWnDn2VyLCBTZWJhc3RpYW4=?=
	<Sebastian.Steinbeisser@lrz.de>
To: "tom@talpey.com" <tom@talpey.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "pc@manguebit.com" <pc@manguebit.com>
CC: "smfrench@gmail.com" <smfrench@gmail.com>, "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
Thread-Topic: Potential smb/dfs regression introduced in kernel 6.6
Thread-Index: AQHayJXmtmc2qLL700qAmNg0Q6RQvrHbwjy5gADy1QCAFEz7gIAFjrOAgAJLRwCAAl6KgIAAG4OAgACiDYCACrkegIACBO6A
Date: Fri, 26 Jul 2024 08:19:01 +0000
Message-ID: <c101642079d4f0c54edd681c70b8ccf37f4f1982.camel@lrz.de>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
	 <f3a02647b6fcb27a70da4c334930ad3c@manguebit.com>
	 <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
	 <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
	 <0ff960c2bde0f213cc9b7ef98b993bfb@manguebit.com>
	 <dd0259752e3557fa1b60dda4db3bf790d9ff877c.camel@lrz.de>
	 <4b718a0b9a967d4bc0428a3f706e3b15@manguebit.com>
	 <98d458ba-4258-4598-b8fc-0fe6cfeb2f87@talpey.com>
	 <2849de0676a015619b922708005a243595f9f56b.camel@lrz.de>
	 <6db3dbb8a7a6f4f5ed0f63d0e0c784c7@manguebit.com>
In-Reply-To: <6db3dbb8a7a6f4f5ed0f63d0e0c784c7@manguebit.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
Content-Type: multipart/signed; micalg=sha-384;
	protocol="application/pkcs7-signature"; boundary="=-U1g/A/HubSoWKe0c4DoR"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

--=-U1g/A/HubSoWKe0c4DoR
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-6od6cquh0h/0tebH9wqf"


--=-6od6cquh0h/0tebH9wqf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Paulo,

Our technical rep. has opened a case in our name and promised to
directly escalate it to the US engineering (we're based off Germany)
and to keep us in the loop. I've made them aware of the discussion as
well and suggested they should directly reply to the list.
I haven't heard back jet.

Due to being on a trip this week I'll only be able to test your patch
next week.
As far as I understand a simple git apply patch on top of the 6.10 tag
should suffice, right?

Thanks!

Best
Sebastian
+-------------------------------------------------------------+
 Sebastian Steinbei=C3=9Fer
 Leibniz-Rechenzentrum   Tel.:+49-89-35831-8779
 Boltzmannstra=C3=9Fe 1       E-Mail: Sebastian.Steinbeisser@lrz.de
 D-85748 Garching
+-------------------------------------------------------------+


--=-6od6cquh0h/0tebH9wqf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEyYbfXNcMyuhbpCh3C0OiiRZtSGkFAmajW+cACgkQC0OiiRZt
SGluRAf/dXZph3OgYRN7sKMVcQGDkF+8RDKRLwTgPVQTzAc+NTO19jT6OrqDIupz
3+det9u8VDZsNdRvuoa7sBwNqCXpUAJw8HRSp5tl7QBK+/aRQyGaOFi2oTdPSXFw
CB+ut3gtC1dVx8Vk8eUBZvBv8q7iNp5PdOGJifT7honblv4xadq0L2dfawtUySPf
q1yG4WRPd2p8euvBHEZZxea3G/SbV/MFsiCig5dbUev2rD5pzFzHnadfbtZs9kr3
w2wkBpRWI6yBQadJii+tZNzWBozx3mjWHFJ42Ge+osYY6uynDsqDXjJNNaHugUrY
qI157OzYehXcZGo58topBT2wlb8o/A==
=Ed1c
-----END PGP SIGNATURE-----

--=-6od6cquh0h/0tebH9wqf--

--=-U1g/A/HubSoWKe0c4DoR
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgIFADCABgkqhkiG9w0BBwEAAKCCE9Yw
ggZyMIIEWqADAgECAhB4WSw8yggu2tjprafqDVB3MA0GCSqGSIb3DQEBDAUAMEYxCzAJBgNVBAYT
Ak5MMRkwFwYDVQQKExBHRUFOVCBWZXJlbmlnaW5nMRwwGgYDVQQDExNHRUFOVCBQZXJzb25hbCBD
QSA0MB4XDTIzMDQwNTAwMDAwMFoXDTI2MDQwNDIzNTk1OVowgdYxSTBHBgNVBAoTQExlaWJuaXot
UmVjaGVuemVudHJ1bSBkZXIgQmF5ZXJpc2NoZW4gQWthZGVtaWUgZC4gV2lzc2Vuc2NoYWZ0ZW4x
GzAZBgNVBAkMEkJvbHR6bWFubnN0cmHDn2UgMTEPMA0GA1UECBMGQmF5ZXJuMQswCQYDVQQGEwJE
RTEgMB4GA1UEAwwXU3RlaW5iZWnDn2VyLCBTZWJhc3RpYW4xLDAqBgkqhkiG9w0BCQEWHXNlYmFz
dGlhbi5zdGVpbmJlaXNzZXJAbHJ6LmRlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
1tOueshjEujWZwBYyHyoO+kmDqVsdk7ahy3ey10S/PULIgHs2LcorCvy06ayLeMMkQVJqCJ7l/XW
dSgKdjvkklBYay6U6bB3sSDkHUSMNDscJYctXgxQd9/6o7WCdxXhTekd/L+YDueL/sG6ozfynduZ
j4ivj64T38neSm0hOKhd1+vK3yNbQLebuQ6CZRpb7ZjGcmIh+ro252MAedmhyyrCljtOsr2LdWMX
GvXhwcEvf2XqRj2HXOdEpbKoKooENN8ah5WQTUtB94BtBCQMbGzg8nmcwR3B38Ice97Wjv1+Kf4t
ueH+TlVWOiLpY5JqwOl/GFpIAU6lp0HgSO83IQIDAQABo4IByTCCAcUwHwYDVR0jBBgwFoAUaQCh
xyFY+ODFGyCwCt2nUb8T2eQwHQYDVR0OBBYEFH+HEyIOkKU+emsScF+IW9dWTcMHMA4GA1UdDwEB
/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUFBwMEBggrBgEFBQcDAjA/BgNV
HSAEODA2MDQGCysGAQQBsjEBAgJPMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20v
Q1BTMEIGA1UdHwQ7MDkwN6A1oDOGMWh0dHA6Ly9HRUFOVC5jcmwuc2VjdGlnby5jb20vR0VBTlRQ
ZXJzb25hbENBNC5jcmwweAYIKwYBBQUHAQEEbDBqMD0GCCsGAQUFBzAChjFodHRwOi8vR0VBTlQu
Y3J0LnNlY3RpZ28uY29tL0dFQU5UUGVyc29uYWxDQTQuY3J0MCkGCCsGAQUFBzABhh1odHRwOi8v
R0VBTlQub2NzcC5zZWN0aWdvLmNvbTBHBgNVHREEQDA+gR1TZWJhc3RpYW4uU3RlaW5iZWlzc2Vy
QGxyei5kZYEdc2ViYXN0aWFuLnN0ZWluYmVpc3NlckBscnouZGUwDQYJKoZIhvcNAQEMBQADggIB
ABGFqf3GfUcKjIValp5G72ihJu6fz9GT/2WTgs6MUyDjHZdm425XgXd0xTqqBCnQKma8GPJd61AY
3a6fUGlsrW96ZwlUWNJ1q/6qy0JC6c/Z+K7QP/2sBc07rea59p0RI500ADdWJjLv2aL71d0nammo
eiRPe5Ax5ho6lufR+wFiIABZri87n6e1N2ukQt9Hyk/TdsdyU6WYBD/0fP/p/73lr5Pc6npXxOfm
lryNcW3fBt+rGksfyH3qnCbISbUFUvqlglJ1viOEmACP7x1550Txcf96MPD2SNxT9rVUXhAYODHw
KA2H+Hx5s9ILt/7oTf6HqM959zQIdu9ATU7RMlUFpxN0chYYTgp4HBU5Gtm4hvLshS/WA1YVLNHa
Z/nTCyoFwYRw1IDwvHmbj9kOyhkvDkTpUQHgw38HU2qFiIzXnUEgQfOZkjYjgiRMIDL2tOaPrvgj
FaFqc4hWQ0/E1GYSsDDQrXmmz790lA7HAulMNOCiWN38eMSHH0rSUIogHudq0kswlX9mFDYfsWSi
/QR6ZuNMxo32asPGk7twzRcRAeSYk5GrGl5sqt4LD8GsWXz8rmvwYjZN/l5Jd/Dt8OvqyDC/Chwy
SfPsY027BfZyvDAjHD2luySuUB2dLHP90w8vRsNvKbhIF5Dh4t73nUGB79kaGi2BrQVXdCxzhp/z
MIIGcjCCBFqgAwIBAgIQeFksPMoILtrY6a2n6g1QdzANBgkqhkiG9w0BAQwFADBGMQswCQYDVQQG
EwJOTDEZMBcGA1UEChMQR0VBTlQgVmVyZW5pZ2luZzEcMBoGA1UEAxMTR0VBTlQgUGVyc29uYWwg
Q0EgNDAeFw0yMzA0MDUwMDAwMDBaFw0yNjA0MDQyMzU5NTlaMIHWMUkwRwYDVQQKE0BMZWlibml6
LVJlY2hlbnplbnRydW0gZGVyIEJheWVyaXNjaGVuIEFrYWRlbWllIGQuIFdpc3NlbnNjaGFmdGVu
MRswGQYDVQQJDBJCb2x0em1hbm5zdHJhw59lIDExDzANBgNVBAgTBkJheWVybjELMAkGA1UEBhMC
REUxIDAeBgNVBAMMF1N0ZWluYmVpw59lciwgU2ViYXN0aWFuMSwwKgYJKoZIhvcNAQkBFh1zZWJh
c3RpYW4uc3RlaW5iZWlzc2VyQGxyei5kZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
ANbTrnrIYxLo1mcAWMh8qDvpJg6lbHZO2oct3stdEvz1CyIB7Ni3KKwr8tOmsi3jDJEFSagie5f1
1nUoCnY75JJQWGsulOmwd7Eg5B1EjDQ7HCWHLV4MUHff+qO1gncV4U3pHfy/mA7ni/7BuqM38p3b
mY+Ir4+uE9/J3kptITioXdfryt8jW0C3m7kOgmUaW+2YxnJiIfq6NudjAHnZocsqwpY7TrK9i3Vj
Fxr14cHBL39l6kY9h1znRKWyqCqKBDTfGoeVkE1LQfeAbQQkDGxs4PJ5nMEdwd/CHHve1o79fin+
Lbnh/k5VVjoi6WOSasDpfxhaSAFOpadB4EjvNyECAwEAAaOCAckwggHFMB8GA1UdIwQYMBaAFGkA
occhWPjgxRsgsArdp1G/E9nkMB0GA1UdDgQWBBR/hxMiDpClPnprEnBfiFvXVk3DBzAOBgNVHQ8B
Af8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwPwYD
VR0gBDgwNjA0BgsrBgEEAbIxAQICTzAlMCMGCCsGAQUFBwIBFhdodHRwczovL3NlY3RpZ28uY29t
L0NQUzBCBgNVHR8EOzA5MDegNaAzhjFodHRwOi8vR0VBTlQuY3JsLnNlY3RpZ28uY29tL0dFQU5U
UGVyc29uYWxDQTQuY3JsMHgGCCsGAQUFBwEBBGwwajA9BggrBgEFBQcwAoYxaHR0cDovL0dFQU5U
LmNydC5zZWN0aWdvLmNvbS9HRUFOVFBlcnNvbmFsQ0E0LmNydDApBggrBgEFBQcwAYYdaHR0cDov
L0dFQU5ULm9jc3Auc2VjdGlnby5jb20wRwYDVR0RBEAwPoEdU2ViYXN0aWFuLlN0ZWluYmVpc3Nl
ckBscnouZGWBHXNlYmFzdGlhbi5zdGVpbmJlaXNzZXJAbHJ6LmRlMA0GCSqGSIb3DQEBDAUAA4IC
AQARhan9xn1HCoyFWpaeRu9ooSbun8/Rk/9lk4LOjFMg4x2XZuNuV4F3dMU6qgQp0CpmvBjyXetQ
GN2un1BpbK1vemcJVFjSdav+qstCQunP2fiu0D/9rAXNO63mufadESOdNAA3ViYy79mi+9XdJ2pp
qHokT3uQMeYaOpbn0fsBYiAAWa4vO5+ntTdrpELfR8pP03bHclOlmAQ/9Hz/6f+95a+T3Op6V8Tn
5pa8jXFt3wbfqxpLH8h96pwmyEm1BVL6pYJSdb4jhJgAj+8deedE8XH/ejDw9kjcU/a1VF4QGDgx
8CgNh/h8ebPSC7f+6E3+h6jPefc0CHbvQE1O0TJVBacTdHIWGE4KeBwVORrZuIby7IUv1gNWFSzR
2mf50wsqBcGEcNSA8Lx5m4/ZDsoZLw5E6VEB4MN/B1NqhYiM151BIEHzmZI2I4IkTCAy9rTmj674
IxWhanOIVkNPxNRmErAw0K15ps+/dJQOxwLpTDTgoljd/HjEhx9K0lCKIB7natJLMJV/ZhQ2H7Fk
ov0EembjTMaN9mrDxpO7cM0XEQHkmJORqxpebKreCw/BrFl8/K5r8GI2Tf5eSXfw7fDr6sgwvwoc
Mknz7GNNuwX2crwwIxw9pbskrlAdnSxz/dMPL0bDbym4SBeQ4eLe951Bge/ZGhotga0FV3Qsc4af
8zCCBuYwggTOoAMCAQICEDECcNQ1vpskmvhW0OHihUkwDQYJKoZIhvcNAQEMBQAwgYgxCzAJBgNV
BAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEeMBwGA1UE
ChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNBIENlcnRpZmlj
YXRpb24gQXV0aG9yaXR5MB4XDTIwMDIxODAwMDAwMFoXDTMzMDUwMTIzNTk1OVowRjELMAkGA1UE
BhMCTkwxGTAXBgNVBAoTEEdFQU5UIFZlcmVuaWdpbmcxHDAaBgNVBAMTE0dFQU5UIFBlcnNvbmFs
IENBIDQwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCzSuIiXidb6QRbFAQ1MiAUrrTS
MUDGzVDAHqFEyq+eSmF/LZDeYpszai2kQsqWATz/cBA9gGjunvJ45G48ycC4D6gwZFvbBt5Jotxl
unBeB8K+crGar3v+RCQ4VfvToX07v+HTJ6EeEONR3IzJPTMyzgAwENGsAWf9va9HePQFJiChCzXq
hKpp0zen53S+8f9itEy06GS8aku7Mvyb4tMBBa9An3Y3ALIqIeymg/iYs8m9WkSkMyekNtFRB1+1
KlnNUpM05G8+sY9EucnQQRUIdHzYsvqjP3XlaSuB4Jj0ia66UGfi5Wx31mm5sKAz8Re9UGVWIqq6
wKFKxkSfuO4iwYiIPJoiGEux3dqabwFLduAroDF1IxE40PqGIdPXzYuZ/wL6BEfFAb0xy8bfm5S9
G7y/ts9mIlFpPtkLZ/nQ/iVOWdsu9ale/nK/uGF47xsxeW2LIvB4sH5U2+D4ad8vpNbcCrXIXXKt
kBnNHgxumNNZ0R1Isq/Pz7TALCxxDzWdsM7AO32/Jn7R4ldtGRZmKpJyfACDn8HU1QPhOtiWsjif
rMWnanJhQ6K7M/5qz8BmfPrca+MUrr1Y4NHZb9MrgPtWKQQyGDXy+G5F/iHGdZk7LS+F8NH+Ddol
t2wZpz52JqGMTDPIH5Qok4LLO95wbxtn+79Tw+wQxmDTuIg+LwIDAQABo4IBizCCAYcwHwYDVR0j
BBgwFoAUU3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFGkAocchWPjgxRsgsArdp1G/E9nk
MA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMC
BggrBgEFBQcDBDA4BgNVHSAEMTAvMC0GBFUdIAAwJTAjBggrBgEFBQcCARYXaHR0cHM6Ly9zZWN0
aWdvLmNvbS9DUFMwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2VydHJ1c3QuY29tL1VT
RVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUFBwEBBGowaDA/Bggr
BgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJTQUFkZFRydXN0Q0Eu
Y3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0GCSqGSIb3DQEBDAUA
A4ICAQAKBU57DY8fEzkA/W/sYsbD7e0XquMBzHjcP0eXXXRD4EAEAGCWSs+QRL9XIxmx+52zx9wM
a8YTejlR+NKejiyKPTF0q63zMxrO/z/hUwo8IDcRRLS0NSgvTW6AN2rCXJe5iLN5fIfYgIBB9cy1
L6trPuZ/vjUJm87nQ7ExQzGqWN5F9U8MlAk0c5iLanG7GCMoNjHiF1n0baj6guUeG7n5qcwOQTyD
S19+NEqfwjUPUGasN1ZH8h1sE6PrzvRpti+rKzWpiU+i2/k3l2b5fFDy+Wu9jv6R9BoBh47es/UM
zwEZ2kSrIVVr4jSukk+FpmR5ZbtwiYNAV6sdb1srMGsILzXlrdasSE2nGHvZklk2zUdgn7b01MHq
67g0mNozGmT6Dam41Kbhv25WMFs871XqwVIb4gGoT1yRf/VePMm1jwauqijhKJFvrNweGnebGPei
paLxIo2iEA4qdRztEg/qyzWGogXK/TFdmivg322fMPQWjQkMhRGMM8SCjlZN22L8x0ZOYoVA2rHJ
m5P25IjZe+HPyn7ikJiSJmqlqFmUeowXF3D1dFlCCs/5yC06RYRqI2REFu+28t2nswIvY6xCFAR0
RtS8Mz2yXNld0js2MmiRUGrc7imWzdUPbPcv9sdUF7SsERGPIzYL8dIiHzit+YCoGCSXMg6peF37
hHNp1TGCAtowggLWAgEBMFowRjELMAkGA1UEBhMCTkwxGTAXBgNVBAoTEEdFQU5UIFZlcmVuaWdp
bmcxHDAaBgNVBAMTE0dFQU5UIFBlcnNvbmFsIENBIDQCEHhZLDzKCC7a2Omtp+oNUHcwDQYJYIZI
AWUDBAICBQCgggFRMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0
MDcyNjA4MTg0N1owPwYJKoZIhvcNAQkEMTIEMMUMRmIOkS/dwngvfjyM3fjNsX6oulQVPH2r8wsg
aidq/0dCzWiRsIY8dCdGK6XoLzBpBgkrBgEEAYI3EAQxXDBaMEYxCzAJBgNVBAYTAk5MMRkwFwYD
VQQKExBHRUFOVCBWZXJlbmlnaW5nMRwwGgYDVQQDExNHRUFOVCBQZXJzb25hbCBDQSA0AhB4WSw8
yggu2tjprafqDVB3MGsGCyqGSIb3DQEJEAILMVygWjBGMQswCQYDVQQGEwJOTDEZMBcGA1UEChMQ
R0VBTlQgVmVyZW5pZ2luZzEcMBoGA1UEAxMTR0VBTlQgUGVyc29uYWwgQ0EgNAIQeFksPMoILtrY
6a2n6g1QdzANBgkqhkiG9w0BAQEFAASCAQBASgpfxqVfvwv0dBui8m0+CMwHztxjyArLWY8QGkLb
q9WEtzmjLHOe59t/qoRG6b3zGYJjRLbOZSmuBpowmw9wLqS+I4wM+Bsos9ALa9XI5uAGhQhSCD/p
215sSjS/1I/GyFH9wAS9M+eW+zNHzhAYtk1NgFtVmY+EHoyTHgjaM1zTgbyZ9UzNEvYmTLBEsXQH
eP25WHEecHc+R8YeTg3aFWJJi1AsW0L6pJZlON1XF/VQ7Vh6EK9lr0qKBY99GZ/cX5EaOWmCzl1p
uEnfzjjmdLlparQtiWmRTa/ba+/bbdLTEDekjnjo9RoCiwY4JLa4zKNULOVU9hJPi5NFOeagAAAA
AAAA


--=-U1g/A/HubSoWKe0c4DoR--
