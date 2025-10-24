Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EDA1459FA
	for <regressions@lists.linux.dev>; Fri, 24 Oct 2025 05:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761284050; cv=none; b=eeYYYfnJf9g1EAsOrj0eh6psTRwp5Y7Pyv5SGG422Zjz6aGl4WT9EG75dftWhd7DUVs0SInufipa4R8wUoX01PGW1/XwAvzAaPPNWkUiHARSnAyvtZrtCUL9YNed9IpCFaiJeOvbdRuqawTHFNd4vcwToeTjzQLUMRWyjYkeNsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761284050; c=relaxed/simple;
	bh=UdeClZXIUWVGOl1GLOaOrjFt7x8K2F6/WYmVgfCof5o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qLxxGheJBELO2XrDi/r5g9SoOSI+xnVLJcM66xt+XEOCeG9qX76pflnwKzfB4TaFOyFvCQdUgNXNMkkfu1rkQ7Ck5gztNupkli4UzkTO73hQ0rrEe0WFMCJ3DApAzDlhDOpiwTmJYx1zcFIpcm+b/jTb/6ahM1pP/VUOqavslWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=jL5NHsJH; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jL5NHsJH"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42421b1514fso1052648f8f.2
        for <regressions@lists.linux.dev>; Thu, 23 Oct 2025 22:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1761284046; x=1761888846; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:references:cc:to:from:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UdeClZXIUWVGOl1GLOaOrjFt7x8K2F6/WYmVgfCof5o=;
        b=jL5NHsJHDvvraPQKU7VpQkSRJM5dwvw1sTY6yNYnmdFAjT4Z+wKMDvTK7JOAqvRsv8
         s1iKERUU3ghquHvOUPMCIxwHwdHgZx3V1M0kxB1dQidiZfCOvP32Wq3ynZLoqD2o45Nl
         P0ak1O4Z2KlE2u7fNdJ1TesCud/NPjohII2Cih0TWg72+U5h2LTs7t9P1ySZaKMR9DyM
         ZcSZGIhbVs26HX4tJt7RJnh7BMOZPAOycfAKgDsDOxiMpik23pg1dRKQO9jlMzTe03+H
         Z5G+mUOIdVj/dCsjbWJvrMm+tefRUvJQ0hvmqvVtOF2VdELtkqaSc7tnfL7kz6Fz21lI
         ifQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761284046; x=1761888846;
        h=in-reply-to:autocrypt:references:cc:to:from:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UdeClZXIUWVGOl1GLOaOrjFt7x8K2F6/WYmVgfCof5o=;
        b=JnLv7GXVM+4ZoP+tNosr8+B+2klMjur7gXE7tu8DVKR+yJp0SR20M41R3tSTMcB1+/
         EnrXZCubkQvrRJj7CFY/xOgEu7KyWtSoZmRYzvSee2UZskbm86zseAloiqsqsmSzeb//
         5bqzrkk1fxSvFkE117ELzvjeIdTpLvIDs+PM9ksDXvX5TQDrcctmAfwpLb9KGLyOOxeQ
         B7+KmkO97N3eZ+aEqw9UMAVGDnus4IdvpY4v0Zgoae0bv181xoRCC9DVDxvR/jbbI2tN
         PE3bPsTJ3tOMF4SiU5kW8OJ3X3siTwaHfb7zo/qabdUz+Sts8EBkmJIvFYGVfYe2MWwH
         uwPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy/ixHp94sPAlbQc9ztrXTEkUBCLpKkHMPwp7SCvjYTRdLSIQSvwYBrC+s12O7Qh+LJ8qb/MHnn6ZMJw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2lJCu2pAgjXZfnwXCaS9RavPJfUvFRvp2lBgjj0MCbcM0I7cs
	PmZ1/SvpAzOfcBcnfSGBX8ZaSeW0ibrObWtnXUdMal+1qs6me9z2fup1+hqj
X-Gm-Gg: ASbGnctxSQzfo617IaSOq30LXMUu48T3/5eS7bb3gYg1aIuo21QFu+PS4T6S9/Q+qXa
	oZQrICRXsYQOXr3WyUrKqGy5vSG7drI3rnuCy9jX1nrQaXkf1FRP++KjeoZu2a6flt6vFuA6Oi3
	md15Lgcp0b8CMU0Bj1vSRICw3QT+hyjjWKhj0OaMdy4zNnFqOWWo0ZevKK0Zy99K9hyE6YwOR/3
	4iPttImbIWN3wqQsJlAk9HLMz++Cer3SUz+fTs+4GNX/FcFxRvUOku3lq8OeZ03jAHMLS9nIoga
	5s0K62Hffc0H9ZRVPk96sFvEzinOfrGDDyFeq4B9SYDFJOPPcBJOoPnLmDea5Kz8Dtv0H06Cjtv
	XQBpXeQQ24gRFlFEbF3opx4Wd7XrNEwXgrj1HYDZnbVZ+nRX4izyiRn0CjswvFvWVQJfVtLs/IY
	IK2MpNg2OMNsPFN87gikreDfCd7QF3DDiM+izBm4dTzt/jHaSFh9y6Z57fAPEWI6E=
X-Google-Smtp-Source: AGHT+IGTb0BhNtLXZjL89zHnvhnrIYZlTtJyn9gLCubUjapXa+451SyphIYoQs9g+1Ce4F+c0arbCA==
X-Received: by 2002:a05:6000:4011:b0:427:9d7:870f with SMTP id ffacd0b85a97d-4299070199dmr708125f8f.5.1761284045381;
        Thu, 23 Oct 2025 22:34:05 -0700 (PDT)
Received: from [192.168.1.3] (p5b2b41b7.dip0.t-ipconnect.de. [91.43.65.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898acc63sm7417423f8f.27.2025.10.23.22.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 22:34:04 -0700 (PDT)
Message-ID: <045e6362-01db-47f3-9a4f-8a86b2c15d00@googlemail.com>
Date: Fri, 24 Oct 2025 07:34:03 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [REGRESSION][BISECTED] Screen goes blank with ASpeed AST2300 in
 6.18-rc2
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, regressions@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 jfalempe@redhat.com, airlied@redhat.com, dianders@chromium.org,
 nbowler@draconx.ca, Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <20251014084743.18242-1-tzimmermann@suse.de>
 <a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com>
 <43992c88-3a3a-4855-9f46-27a7e5fdec2e@suse.de>
 <798ba37a-41d0-4953-b8f5-8fe6c00f8dd3@googlemail.com>
 <bf827c5c-c4dd-46f1-962d-3a8e2a0a7fdf@suse.de>
 <5f8fba3b-2ee1-4a02-9b41-e6e1de1a507a@googlemail.com>
 <e2462c92-4049-486b-92d7-e78aaec4b05d@suse.de>
 <3ca10b2e-fb9c-4495-9219-5e8537314751@googlemail.com>
 <329a9f97-dd66-49c2-bc42-470566d01539@suse.de>
 <270ce9a3-5067-4ef8-9205-414b5667cf3a@googlemail.com>
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
In-Reply-To: <270ce9a3-5067-4ef8-9205-414b5667cf3a@googlemail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------krXW3u9GCz73FBYeJPBWkLil"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------krXW3u9GCz73FBYeJPBWkLil
Content-Type: multipart/mixed; boundary="------------sW3anxa1r6YezvSATKrGS7PM";
 protected-headers="v1"
From: Peter Schneider <pschneider1968@googlemail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, regressions@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 jfalempe@redhat.com, airlied@redhat.com, dianders@chromium.org,
 nbowler@draconx.ca, Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Message-ID: <045e6362-01db-47f3-9a4f-8a86b2c15d00@googlemail.com>
Subject: Re: [REGRESSION][BISECTED] Screen goes blank with ASpeed AST2300 in
 6.18-rc2
References: <20251014084743.18242-1-tzimmermann@suse.de>
 <a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com>
 <43992c88-3a3a-4855-9f46-27a7e5fdec2e@suse.de>
 <798ba37a-41d0-4953-b8f5-8fe6c00f8dd3@googlemail.com>
 <bf827c5c-c4dd-46f1-962d-3a8e2a0a7fdf@suse.de>
 <5f8fba3b-2ee1-4a02-9b41-e6e1de1a507a@googlemail.com>
 <e2462c92-4049-486b-92d7-e78aaec4b05d@suse.de>
 <3ca10b2e-fb9c-4495-9219-5e8537314751@googlemail.com>
 <329a9f97-dd66-49c2-bc42-470566d01539@suse.de>
 <270ce9a3-5067-4ef8-9205-414b5667cf3a@googlemail.com>
In-Reply-To: <270ce9a3-5067-4ef8-9205-414b5667cf3a@googlemail.com>

--------------sW3anxa1r6YezvSATKrGS7PM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgVGhvbWFzLA0KDQoNCkFtIDIzLjEwLjIwMjUgdW0gMjE6MTEgc2NocmllYiBQZXRlciBT
Y2huZWlkZXI6DQo+IEhpIFRob21hcywNCj4gDQo+IEFtIDIzLjEwLjIwMjUgdW0gMTQ6NDYg
c2NocmllYiBUaG9tYXMgWmltbWVybWFubjoNCj4gWy4uLl0NCj4+IEkndmUgYmVlbiBhYmxl
IHRvIHJlcHJvZHVjZSB0aGUgcHJvYmxlbSB3aXRoIGFuIEFTVDIzMDAgdGVzdCBzeXN0ZW0u
IFRoZSBhdHRhY2hlZCBwYXRjaCBmaXhlcyB0aGUgcHJvYmxlbSBmb3IgbWUuIENhbiANCj4+
IHlvdSBwbGVhc2UgdGVzdCBhbmQgcmVwb3J0IG9uIHRoZSByZXN1bHRzPw0KPiANCj4gR3Jl
YXQhIC0gdGhpcyBwYXRjaCBvbiB0b3Agb2YgNi4xOC1yYzIgZml4ZXMgdGhlIGlzc3VlIGZv
ciBtZSwgdG9vLiBUaGFua3MgdmVyeSBtdWNoIGZvciB5b3VyIGVmZm9ydCENCj4gDQo+IFRl
c3RlZC1ieTogUGV0ZXIgU2NobmVpZGVyIDxwc2NobmVpZGVyMTk2OEBnb29nbGVtYWlsLmNv
bT4NCg0KTWVhbndoaWxlLCBJIGhhdmUgYWxzbyB0ZXN0ZWQgdGhpcyBhZ2FpbnN0IHN0YWJs
ZSA2LjEyLjU1IGFuZCA2LjE3LjUsIHdoZXJlIGluIC1yYzIsIEdyZWcgZHJvcHBlZCB5b3Vy
IG9yaWdpbmFsIHBhdGNoIA0Kd2l0aCB1cHN0cmVhbSBjb21taXQtaWQgNmY3MTkzNzNiOTQz
YTk1NWZlZTZmYzIwMTJhZWQyMDdiNjVlMjg1NCBiZWZvcmUgdGhlIGZpbmFsIHJlbGVhc2Ug
YmVjYXVzZSBvZiBteSByZXBvcnQuDQoNClNvIGZvciBib3RoLCBJIGJ1aWx0IHRoZW0sIG1h
ZGUgc3VyZSBpdCB3b3JrZWQgb2suIFRoZW4gSSBkaWQgImdpdCBjaGVycnktcGljayA2Zjcx
OTM3M2I5NDNhOTU1ZmVlNmZjMjAxMmFlZDIwN2I2NWUyODU0IiANCmFuZCB0ZXN0ZWQgdGhh
dCBpdCBpcyBicm9rZW4gYWdhaW4uIFRoZW4gSSBhcHBsaWVkIHlvdXIgbGFzdCBwYXRjaCBv
biB0b3Agb2YgaXQsIGFuZCBpdCB3b3JrZWQgZmluZSwgc28gd2l0aCB0aGF0IHRoZSANCmlz
c3VlIGlzIGZpeGVkIGluIGJvdGggc3RhYmxlIHZlcnNpb25zLCB0b28uDQoNCklmIHlvdSBz
ZW5kIGEgY29tYmluZWQgcGF0Y2ggdG8gR3JlZyBmb3Igc3RhYmxlLCBwbGVhc2UgZmVlbCBm
cmVlIHRvIGFkZCBteQ0KDQpUZXN0ZWQtYnk6IFBldGVyIFNjaG5laWRlciA8cHNjaG5laWRl
cjE5NjhAZ29vZ2xlbWFpbC5jb20+DQoNCg0KVGhhbmtzIGFnYWluIQ0KDQpCZXN0ZSBHcsO8
w59lLA0KUGV0ZXIgU2NobmVpZGVyDQoNCi0tIA0KQ2xpbWIgdGhlIG1vdW50YWluIG5vdCB0
byBwbGFudCB5b3VyIGZsYWcsIGJ1dCB0byBlbWJyYWNlIHRoZSBjaGFsbGVuZ2UsDQplbmpv
eSB0aGUgYWlyIGFuZCBiZWhvbGQgdGhlIHZpZXcuIENsaW1iIGl0IHNvIHlvdSBjYW4gc2Vl
IHRoZSB3b3JsZCwNCm5vdCBzbyB0aGUgd29ybGQgY2FuIHNlZSB5b3UuICAgICAgICAgICAg
ICAgICAgICAtLSBEYXZpZCBNY0N1bGxvdWdoIEpyLg0KDQpPcGVuUEdQOiAgMHhBMzgyOEJE
Nzk2Q0NFMTFBOENBREU4ODY2RTNBOTJDOTJDM0ZGMjQ0DQpEb3dubG9hZDogaHR0cHM6Ly93
d3cucGV0ZXJzLW5ldHpwbGF0ei5kZS9kb3dubG9hZC9wc2NobmVpZGVyMTk2OF9wdWIuYXNj
DQpodHRwczovL2tleXMubWFpbHZlbG9wZS5jb20vcGtzL2xvb2t1cD9vcD1nZXQmc2VhcmNo
PXBzY2huZWlkZXIxOTY4QGdvb2dsZW1haWwuY29tDQpodHRwczovL2tleXMubWFpbHZlbG9w
ZS5jb20vcGtzL2xvb2t1cD9vcD1nZXQmc2VhcmNoPXBzY2huZWlkZXIxOTY4QGdtYWlsLmNv
bQ0KDQo=

--------------sW3anxa1r6YezvSATKrGS7PM--

--------------krXW3u9GCz73FBYeJPBWkLil
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSjgovXlszhGoyt6IZuOpLJLD/yRAUCaPsPywUDAAAAAAAKCRBuOpLJLD/yRMTK
AQDvnxYz2SoIs89+Y3maGD8FqHLRNa/qNgyLwgJi8LTPgAEAz53/dKzJ2V6mQEzWOU1q434RwUzW
ArPxnqW9ZjujIwc=
=oSt3
-----END PGP SIGNATURE-----

--------------krXW3u9GCz73FBYeJPBWkLil--
