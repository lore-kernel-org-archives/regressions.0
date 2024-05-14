Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8C61448F3
	for <regressions@lists.linux.dev>; Tue, 14 May 2024 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715693029; cv=none; b=m6cuaZNqXTcVCKu07+PX5odI2np2Y7WKJBHdFlGERWdJoNnVXC2gsTeAgtVAPR3+dkIiFqoIr4fJApLaU+tSXkdyMSQ4wG+wO2vNiMZNPc9MlThqJsF9k67vrnJNCI0ugoTDKEDHUBwqxJKC/gRJWhOwD3Yoer2+XOOo2KhdVe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715693029; c=relaxed/simple;
	bh=i4pIjJe0x16spaf+Nby5Vt3rvwu45Ga15QdtD4TELDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gtGrUmopzCdamW1vxmoTgmstDAdO0YtrEa/RYbE6QTsNnca/g0K7v4mQWBy+i5ExD/3C7VNaAHj3GMSi6KFBlt2J517nlaoULO0rqnnyLXK7gq8s1es5R7IlJ379YN7/OehtF0/DUr9/Itk4rppfYHY4Yo9C2E+SxkSQWsjxZWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=TjyiSPAS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="TjyiSPAS"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41dc9c83e57so37273845e9.0
        for <regressions@lists.linux.dev>; Tue, 14 May 2024 06:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1715693026; x=1716297826; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i4pIjJe0x16spaf+Nby5Vt3rvwu45Ga15QdtD4TELDw=;
        b=TjyiSPASE/KZ6t8LdGgTq+OubKWKklMpgffV4mwaQ+KKw5Hji/qj1QUd6jKsftS34g
         cQXUnkrTmjqZHc50kB7pSdxZXgXP4MBUlD28DJ0KOLL9xvQVXyiL+mz6E73gdSlhdGbY
         nZClTUdKezOb7u7xynq31xVQxqklwuMRhtmXdHyQMjgdd3ksQgd7sMN100b1jJMygOJF
         53FpNWxKmw8D0QNUpEBJhatJjMoPOseGetRq2eLAXD7sKXcxWbhjbU5NLoly8b97gh8L
         /BEnKfsTp7OMUzTG0EdUIlOvFOXXsIEhYPPuaX6+HrhTqS81F9GQOAsPHsIDuMdI9i6H
         ZgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715693026; x=1716297826;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i4pIjJe0x16spaf+Nby5Vt3rvwu45Ga15QdtD4TELDw=;
        b=OalTeHpPX4CamOq6DiWTvNk9hthmhXoJ1PX/CTcuchvNTD2SaU8xLAkC3IZcSadpZ0
         xShljbnzJXFbEeGTlPcFpM/T+DwM99QcKFOcNbVeGymoOBMeky61wvPF71LGegKoosNn
         SG2zSHDxsMDJEzRd4L8c1OzHEa1jEGLO28bFortG1Crvyc2PNuC+Lf09ctceP4ZjOW12
         K4+r/i9i9KmoCdlObH/VIE0zX4OldAKL0cwrm6Kx+HArSoo/Pl2XGFr8I+zkU544p+jP
         f602W9K4i3EoKEh5L0wg0Ed2EU2WSRegh1IFzqk5CGkukckQtk1KvpkhCzZHNY0mUE/P
         iRYw==
X-Forwarded-Encrypted: i=1; AJvYcCVd65OZfb6v912jGkOAbcJ4az0LquIHwPfQKpqlbf3HQPZL+NH0UwrKWdaoieJnjmknRQD+0uzEj0KCQVti1qL2XbT1lGUQ02XfvG4=
X-Gm-Message-State: AOJu0YwW9zNGwjU1plCzU+bO82vD6FkbjAdbEbyg7ibYJqziOYyPkER9
	aUBjxR0yOrzW1r+Laaw71ezOM6cj0z0XCup0LTOCr24U+BYrxM4=
X-Google-Smtp-Source: AGHT+IGBidFu3u5LcN0dwJ1l7jTnwnSr7ddHSRHFj1Wk5Lf/7XWy1WnDvx4EYx1pSVYG/e2K7Idp9w==
X-Received: by 2002:a05:600c:511f:b0:418:5ef3:4a04 with SMTP id 5b1f17b1804b1-41fead59f07mr119358965e9.18.1715693026173;
        Tue, 14 May 2024 06:23:46 -0700 (PDT)
Received: from [192.168.1.3] (p5b2b40c2.dip0.t-ipconnect.de. [91.43.64.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42013c5fa61sm88956135e9.40.2024.05.14.06.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 06:23:45 -0700 (PDT)
Message-ID: <f08ad152-eefa-4748-8a71-6b84117e19b3@googlemail.com>
Date: Tue, 14 May 2024 15:23:44 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: Kernel 6.8.4 regression: aacraid controller not initialized any
 more, system boot hangs
Content-Language: de-DE
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@leemhuis.info,
 regressions@lists.linux.dev
References: <eec6ebbf-061b-4a7b-96dc-ea748aa4d035@googlemail.com>
 <yq1cypvwz5o.fsf@ca-mkp.ca.oracle.com>
 <c4e8e0b5-fc32-4e26-8c0e-27a996769903@googlemail.com>
 <yq14jb0twk6.fsf@ca-mkp.ca.oracle.com>
From: Peter Schneider <pschneider1968@googlemail.com>
Autocrypt: addr=pschneider1968@googlemail.com; keydata=
 xjMEY58biBYJKwYBBAHaRw8BAQdADPnoGTrfCUCyH7SZVkFtnlzsFpeKANckofR4WVLMtMzN
 L1BldGVyIFNjaG5laWRlciA8cHNjaG5laWRlcjE5NjhAZ29vZ2xlbWFpbC5jb20+wpwEExYK
 AEQCGyMFCQW15qgFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQSjgovXlszhGoyt6IZu
 OpLJLD/yRAUCY58b8AIZAQAKCRBuOpLJLD/yRIeIAQD0+/LMdKHM6AJdPCt+e9Z92BMybfnN
 RtGqkdZWtvdhDQD9FJkGh/3PFtDinimB8UOB7Gi6AGxt9Nu9ne7PvHa0KQXOOARjnxuIEgor
 BgEEAZdVAQUBAQdAw2GRwTf5HJlO6CCigzqH6GUKOjqR1xJ+3nR5EbBze0sDAQgHwn4EGBYK
 ACYWIQSjgovXlszhGoyt6IZuOpLJLD/yRAUCY58biAIbDAUJBbXmqAAKCRBuOpLJLD/yRONS
 AQCwB9qiEQoSnxHodu8kRuvUxXKIqN7701W+INXtFGtJygEAyPZH3/vSBJ4A7GUG7BZyQRcr
 ryS0CUq77B7ZkcI1Nwo=
In-Reply-To: <yq14jb0twk6.fsf@ca-mkp.ca.oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PnG437ECAAr56hnFUTpvgz20"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PnG437ECAAr56hnFUTpvgz20
Content-Type: multipart/mixed; boundary="------------cdi051ZZSIdFXMDMKWhP8wq0";
 protected-headers="v1"
From: Peter Schneider <pschneider1968@googlemail.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@leemhuis.info,
 regressions@lists.linux.dev
Message-ID: <f08ad152-eefa-4748-8a71-6b84117e19b3@googlemail.com>
Subject: Re: Kernel 6.8.4 regression: aacraid controller not initialized any
 more, system boot hangs
References: <eec6ebbf-061b-4a7b-96dc-ea748aa4d035@googlemail.com>
 <yq1cypvwz5o.fsf@ca-mkp.ca.oracle.com>
 <c4e8e0b5-fc32-4e26-8c0e-27a996769903@googlemail.com>
 <yq14jb0twk6.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq14jb0twk6.fsf@ca-mkp.ca.oracle.com>

--------------cdi051ZZSIdFXMDMKWhP8wq0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWFydGluLA0KDQpBbSAxNC4wNS4yMDI0IHVtIDE0OjU0IHNjaHJpZWIgTWFydGluIEsu
IFBldGVyc2VuOg0KPiANCj4gUGV0ZXIsDQo+IA0KPj4gRGlkIHlvdSBoYXZlIGFueSBjaGFu
Y2UgdG8gbG9vayBpbnRvIHRoaXMgaW4gbW9yZSBkZXB0aD8gRG8geW91IG5lZWQNCj4+IG1v
cmUgaW5mb3JtYXRpb24gZnJvbSBtZSB0byB0YWNrbGUgdGhpcyBpc3N1ZT8gSSdtIG5vdCBh
IGtlcm5lbA0KPj4gZGV2ZWxvcGVyLCBqdXN0IGEgdXNlciwgYnV0IEkgZ3Vlc3Mgd2l0aCBw
cm9wZXIgaW5zdHJ1Y3Rpb24gSSB3b3VsZCBiZQ0KPj4gYWJsZSB0byBjb21waWxlIGFuZCB0
ZXN0IHBhdGNoZXMuDQo+IA0KPiBJIGFtIGFmcmFpZCBJIGhhdmVuJ3QgaGFkIGEgdGltZSB0
byBsb29rIGZ1cnRoZXIgaW50byB0aGlzIHlldCBkdWUgdG8NCj4gdHJhdmVsLiBUaGUgYW5u
dWFsIExTRi9NTS9CUEYgY29uZmVyZW5jZSBpcyB0YWtpbmcgcGxhY2UgdGhpcyB3ZWVrLiBJ
DQo+IHdpbGwgZ2V0IGJhY2sgdG8geW91IGFzIHNvb24gYXMgcG9zc2libGUuDQoNCk9rLCBn
cmVhdCwgc28gaGF2ZSBhIGdvb2QgdGltZSB3aGVyZWV2ZXIgdGhpcyBjb25mZXJlbmNlIGlz
IGdvaW5nIHRvIHRha2UgcGxhY2UhIEl0IGlzbid0IA0KdmVyeSB1cmdlbnQsIGJlY2F1c2Ug
aW4gdGhlIG1lYW50aW1lIEkgY2FuIGp1c3QgY29udGludWUgdG8gdXNlIHRoZSA2LjUuMTMg
a2VybmVsIG9uIG15IA0KUHJveG1veCBtYWNoaW5lLiBJIGp1c3Qgd2FudGVkIHRvIHBpbmcg
eW91IGFnYWluIHNvIHRoaXMgd291bGRuJ3QgZmFsbCB0aHJvdWdoIHRoZSBjcmFja3MuDQoN
Cj4gQmVmb3JlIEkgbWFrZSBhbnkgcmVjb21tZW5kYXRpb25zIHdydC4gZmlybXdhcmUgdXBk
YXRlcyBJIHdvdWxkIGxpa2UgdG8NCj4gdW5kZXJzdGFuZCB3aHkgYSBjaGFuZ2UgaW50ZW5k
ZWQgdG8gbWFrZSBzY2FubmluZyBtb3JlIHJlc2lsaWVudCBhZ2FpbnN0DQo+IGRldmljZSBp
bXBsZW1lbnRhdGlvbiBlcnJvcnMgaGFzIGhhZCB0aGUgb3Bwb3NpdGUgZWZmZWN0LiBFc3Bl
Y2lhbGx5DQo+IHNpbmNlIHRoZSBjaGFuZ2UgaW4gcXVlc3Rpb24gcmV2ZXJ0cyB0byBob3cg
TGludXggaGFzIHNjYW5uZWQgZm9yDQo+IGRldmljZXMgZm9yIGRlY2FkZXMuDQoNCkknbGwg
bGVhdmUgZXZlcnl0aGluZyBhcyBpdCBpcyBub3csIGFuZCB3b24ndCBjaGFuZ2UgdGhlIGNy
aW1lIHNjZW5lIHVudGlsIHlvdSB0ZWxsIG1lIA0Kd2hhdCB0byBkbyBuZXh0Lg0KDQoNCkJl
c3RlIEdyw7zDn2UsDQpQZXRlciBTY2huZWlkZXINCg0KLS0gDQpDbGltYiB0aGUgbW91bnRh
aW4gbm90IHRvIHBsYW50IHlvdXIgZmxhZywgYnV0IHRvIGVtYnJhY2UgdGhlIGNoYWxsZW5n
ZSwNCmVuam95IHRoZSBhaXIgYW5kIGJlaG9sZCB0aGUgdmlldy4gQ2xpbWIgaXQgc28geW91
IGNhbiBzZWUgdGhlIHdvcmxkLA0Kbm90IHNvIHRoZSB3b3JsZCBjYW4gc2VlIHlvdS4gICAg
ICAgICAgICAgICAgICAgIC0tIERhdmlkIE1jQ3VsbG91Z2ggSnIuDQoNCk9wZW5QR1A6ICAw
eEEzODI4QkQ3OTZDQ0UxMUE4Q0FERTg4NjZFM0E5MkM5MkMzRkYyNDQNCkRvd25sb2FkOiBo
dHRwczovL3d3dy5wZXRlcnMtbmV0enBsYXR6LmRlL2Rvd25sb2FkL3BzY2huZWlkZXIxOTY4
X3B1Yi5hc2MNCmh0dHBzOi8va2V5cy5tYWlsdmVsb3BlLmNvbS9wa3MvbG9va3VwP29wPWdl
dCZzZWFyY2g9cHNjaG5laWRlcjE5NjhAZ29vZ2xlbWFpbC5jb20NCmh0dHBzOi8va2V5cy5t
YWlsdmVsb3BlLmNvbS9wa3MvbG9va3VwP29wPWdldCZzZWFyY2g9cHNjaG5laWRlcjE5NjhA
Z21haWwuY29tDQo=

--------------cdi051ZZSIdFXMDMKWhP8wq0--

--------------PnG437ECAAr56hnFUTpvgz20
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSjgovXlszhGoyt6IZuOpLJLD/yRAUCZkNl4AUDAAAAAAAKCRBuOpLJLD/yRLgl
APoD1O8x6JDCdgoVHfWedEebUCEpHyuaySPGluRk+qzg3wEAxs6J01Ge68f9KIYi176XiURPg0z8
NZq5v8L4RHPSwwY=
=r9NY
-----END PGP SIGNATURE-----

--------------PnG437ECAAr56hnFUTpvgz20--
