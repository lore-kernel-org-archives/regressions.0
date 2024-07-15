Received: from postout2.mail.lrz.de (postout2.mail.lrz.de [129.187.255.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DC349659
	for <regressions@lists.linux.dev>; Mon, 15 Jul 2024 05:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.187.255.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721022080; cv=none; b=CmIOyt/zTjcDr+sCLo8bPei3mBMw4F4MbYgzDiFV/TKn0OkwxZUSdye/ULICvUJ23ivLocGUp6KWwLOze6iFwG2+o5vLOS/ha1L6/vzE4/5q36nmpNmG0xuR7loCikB+3VNKIvV1UKEQuKPpUKA7qH5OAS1i0A5hGEsGAdphjRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721022080; c=relaxed/simple;
	bh=dnUttLrq50jps30QZhhvknEs2hYXlLfYSRS0bOi7Ksg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RaKteo2DbPqJyHS/rvz9zP0uuiI7wOt8mN/J0mC/bsID3hTjy/DWLkug3lQY8zpnxDZ2JSnCsn2Z+KKqWOsh9j0a8iS2cf1x0/ohbwgpQCvgIe9q9/XoSCqnZjx5C30c1kYBsI8HpGvxVQqjTvB89twQx1DNbxAaoP/zr7SV1VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lrz.de; spf=pass smtp.mailfrom=lrz.de; dkim=pass (2048-bit key) header.d=lrz.de header.i=@lrz.de header.b=Cn+aC7JL; arc=none smtp.client-ip=129.187.255.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lrz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lrz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lrz.de header.i=@lrz.de header.b="Cn+aC7JL"
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4WMrf86wpXzyVQ;
	Mon, 15 Jul 2024 07:41:04 +0200 (CEST)
Authentication-Results: postout.lrz.de (amavisd-new); dkim=pass (2048-bit key)
	reason="pass (just generated, assumed good)" header.d=lrz.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lrz.de; h=
	mime-version:content-type:content-type:content-language
	:accept-language:in-reply-to:references:message-id:date:date
	:subject:subject:from:from:received:received:received:received;
	 s=postout; t=1721022064; bh=dnUttLrq50jps30QZhhvknEs2hYXlLfYSRS
	0bOi7Ksg=; b=Cn+aC7JLTm99Jcg86ldpM4a5/xzyII7GKiYCoBomBwNT8H2NAgb
	GRGY7a1MzFa1NmUGoIVdv5L6B6uQeFkzlitIpBI+FEF7qU1xYWKpDemG/laK/54u
	SLKlnyqLY7wK3oEDt0B7EJ1OJjYdoB0/GvmYCGarvRTizSE5Y8pI2inwmNnhT2tx
	wbI89IuPNQ7Fkg2bcFOkYwRPRijN2JZW5VTBUzzmp8GSv0SCtaDIQzbF4WYs+HrC
	lGpA7rZK8sgQGODbSs0i71z+FJCagg+80m2/HZAaM7dCyXSpjf7gDqcspeqYP99u
	05ULK4hTfy+/9MzX0EVcwGRflz2J9FOBT0w==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.862
X-Spam-Level:
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id jLbOQ5ObcP3L; Mon, 15 Jul 2024 07:41:04 +0200 (CEST)
Received: from BADWLRZ-SWEX03A.ads.mwn.de (BADWLRZ-SWEX03A.ads.mwn.de [IPv6:2001:4ca0:0:108::195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "BADWLRZ-SWEX03A", Issuer "BADWLRZ-SWEX03A" (not verified))
	by postout2.mail.lrz.de (Postfix) with ESMTPS id 4WMrf80Yc5zyVD;
	Mon, 15 Jul 2024 07:41:04 +0200 (CEST)
Received: from BADWLRZ-SWEX03A.ads.mwn.de (2001:4ca0:0:108::195) by
 BADWLRZ-SWEX03A.ads.mwn.de (2001:4ca0:0:108::195) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 15 Jul 2024 07:41:03 +0200
Received: from BADWLRZ-SWEX03A.ads.mwn.de ([fe80::135:d2e8:a257:4168]) by
 BADWLRZ-SWEX03A.ads.mwn.de ([fe80::135:d2e8:a257:4168%15]) with mapi id
 15.02.1544.011; Mon, 15 Jul 2024 07:41:03 +0200
From: =?utf-8?B?U3RlaW5iZWnDn2VyLCBTZWJhc3RpYW4=?=
	<Sebastian.Steinbeisser@lrz.de>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"pc@manguebit.com" <pc@manguebit.com>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
Thread-Topic: Potential smb/dfs regression introduced in kernel 6.6
Thread-Index: AQHayJXmtmc2qLL700qAmNg0Q6RQvrHbwjy5gADy1QCAFEz7gIAFjrOAgACvtoA=
Date: Mon, 15 Jul 2024 05:41:03 +0000
Message-ID: <00654293b73f861514a9fb61723a8a424be92bc2.camel@lrz.de>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
	 <f3a02647b6fcb27a70da4c334930ad3c@manguebit.com>
	 <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
	 <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
	 <0ff960c2bde0f213cc9b7ef98b993bfb@manguebit.com>
In-Reply-To: <0ff960c2bde0f213cc9b7ef98b993bfb@manguebit.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
Content-Type: multipart/signed; micalg=sha-384;
	protocol="application/pkcs7-signature"; boundary="=-lmZyRAPf6QHrYuuzEeAU"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

--=-lmZyRAPf6QHrYuuzEeAU
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Yk6agCSZAmayRnokTGfL"


--=-Yk6agCSZAmayRnokTGfL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Paulo,

I'll try and get that done. I'm currently in the process of bisecting
the issue on the side.
I'll be back with news hopefully soon.

Thanks!

Best
Sebastian
+-------------------------------------------------------------+
 Sebastian Steinbei=C3=9Fer
 Leibniz-Rechenzentrum   Tel.:+49-89-35831-8779
 Boltzmannstra=C3=9Fe 1       E-Mail: Sebastian.Steinbeisser@lrz.de
 D-85748 Garching
+-------------------------------------------------------------+


-----Original Message-----
From: Paulo Alcantara <pc@manguebit.com>
To: "Steinbei=C3=9Fer, Sebastian" <Sebastian.Steinbeisser@lrz.de>,
gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>
Cc: regressions@lists.linux.dev <regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
Date: 14.07.2024 21:12:09

Steinbei=C3=9Fer, Sebastian=C2=A0=C2=A0<Sebastian.Steinbeisser@lrz.de> writ=
es:

> Is there any additional information I can provide?

Yes.=C2=A0 Please provide again the network traces of both working and
non-working kernels along with the session keys in order to decrypt the
packets.

You can retrieve the session keys by running `smbinfo keys
/mounted/share/some/file` [1].

Make sure you can decrypt the packets with dumped keys before sending
those out.

Besides running ls, try to stat those files as well.=C2=A0 If you can
provide
network traces with smbclient(2) [2], it would be great, too.

Thanks.

[1]
https://wiki.samba.org/index.php/Wireshark_Decryption#Obtaining_the_keys
[2]
https://wiki.samba.org/index.php/Wireshark_Decryption#Samba_client_and_serv=
er

--=-Yk6agCSZAmayRnokTGfL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEyYbfXNcMyuhbpCh3C0OiiRZtSGkFAmaUtm8ACgkQC0OiiRZt
SGlDEAgApUNLA0TWyVsxQIGXETOhZUoSjCAafFvvLubUTOtaiFs94uv5xLfMpUe4
zWLU7QOtXM5jKcw/zDoK2i5cd3UGXPgPnx6kbmKJXKDhdctO1riL64jS6jmLsXAX
64vO2uSzM5x/TiGNiU5cftWpPoioMtWqcvNk3tVWZk7oOuvm3U1AoHawjhI7osMq
RYxKI7wX6PkaH4qQ9POAfL1ms4+WBbyQIseDHrgiGrnCscfSINjDcJu0NKhlOiCe
zaeEifis1XPR0llvlpZJyQ9sE4xaRiy5vMVOInPpywPU/odj8YGBIP/NMjPWvQ8/
/raEHVasfsfvLpQ+ACRxV1sUZOl71g==
=Uovf
-----END PGP SIGNATURE-----

--=-Yk6agCSZAmayRnokTGfL--

--=-lmZyRAPf6QHrYuuzEeAU
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
MDcxNTA1NDEwM1owPwYJKoZIhvcNAQkEMTIEMD1OusLLfvjriyKaD/JEsV460BAlJrBySNZIyfDp
ZB7bJpmv/2hQXpdgtdSSNm0LmzBpBgkrBgEEAYI3EAQxXDBaMEYxCzAJBgNVBAYTAk5MMRkwFwYD
VQQKExBHRUFOVCBWZXJlbmlnaW5nMRwwGgYDVQQDExNHRUFOVCBQZXJzb25hbCBDQSA0AhB4WSw8
yggu2tjprafqDVB3MGsGCyqGSIb3DQEJEAILMVygWjBGMQswCQYDVQQGEwJOTDEZMBcGA1UEChMQ
R0VBTlQgVmVyZW5pZ2luZzEcMBoGA1UEAxMTR0VBTlQgUGVyc29uYWwgQ0EgNAIQeFksPMoILtrY
6a2n6g1QdzANBgkqhkiG9w0BAQEFAASCAQBmEwlmiSblsRezuAjfLwQpm7hoJ1OXBVcz+kXcOZdS
KhT6D6xaEvB4CSACSicJNsZEbjVMpcOwlB3Vt6c/2CTRssJ5cUrTrxi+oJiCTf5VRH2J/vVEZFdN
GFntO2yLOGxonKNYkBzvZ+DKq89A94HDg47EEqQCwQJm1ZloBX1WimLoO7MC+r0DA4X/NzHG2EmA
olXxOtPuS64I56mVxGr1Og/lbsmXa0jmuBXJTv+LhQj3Nywq80Uq9f+XcPYHQsx1ahLDNVlGlAps
pwplCcmQ97CV/kGe01lP+DBOE0Ciq6By0f5AVa64YgvSwdWPBSfXt8fDcfBahH9/xEqvLIofAAAA
AAAA


--=-lmZyRAPf6QHrYuuzEeAU--
