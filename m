Received: from b1712.mx.srv.dfn.de (b1712.mx.srv.dfn.de [194.95.234.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390385690
	for <regressions@lists.linux.dev>; Thu,  5 Oct 2023 10:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniklinik-freiburg.de header.i=@uniklinik-freiburg.de header.b="twjA0ieZ"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniklinik-freiburg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniklinik-freiburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	uniklinik-freiburg.de; h=mime-version:content-transfer-encoding
	:content-id:content-type:content-type:content-language
	:accept-language:in-reply-to:references:message-id:date:date
	:subject:subject:from:from:received:received:received; s=s1; t=
	1696499746; x=1698314147; bh=lKcngNkNaJ2ZDxjfFkR58Vb8y7czhkiNh4X
	i9DQEKJ8=; b=twjA0ieZZRcU+pjxu4cDsiGvS3EzhOw1qFkv6C9WMvijQkXeCI9
	d8orpFGn//6R1HCyCQsIWPQ9pnILF2/LwZfDtPCisCgrNnKcg5skyVF7GG9kJSwC
	kzLe3M971aJpvllPWpq/3kmv8GcYDrJkmyZHpIwn5pf+61Zbs8UX+ftU=
Received: from ukl-fm1.ukl.uni-freiburg.de (ukl-fm-ha.ukl.uni-freiburg.de [193.196.199.18])
	by b1712.mx.srv.dfn.de (Postfix) with ESMTPS id EFBD940123
	for <regressions@lists.linux.dev>; Thu,  5 Oct 2023 11:55:45 +0200 (CEST)
Received: from UKL-EX3.ad.uniklinik-freiburg.de (xxx53.ukl.uni-freiburg.de [193.196.253.53])
	by ukl-fm1.ukl.uni-freiburg.de  with ESMTPS id 3959tfPs008803-3959tfPu008803
	(version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
	Thu, 5 Oct 2023 11:55:41 +0200
Received: from UKL-EX4.ad.uniklinik-freiburg.de (193.196.253.54) by
 UKL-EX3.ad.uniklinik-freiburg.de (193.196.253.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 11:55:41 +0200
Received: from UKL-EX4.ad.uniklinik-freiburg.de ([fe80::6c6e:c675:beef:7071])
 by UKL-EX4.ad.uniklinik-freiburg.de ([fe80::6c6e:c675:beef:7071%5]) with mapi
 id 15.01.2507.032; Thu, 5 Oct 2023 11:55:41 +0200
From: "Dr. Bernd Feige" <bernd.feige@uniklinik-freiburg.de>
To: "tom@talpey.com" <tom@talpey.com>, "smfrench@gmail.com"
	<smfrench@gmail.com>, "paul@darkrain42.org" <paul@darkrain42.org>
CC: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"bagasdotme@gmail.com" <bagasdotme@gmail.com>, "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>, "pc@manguebit.com" <pc@manguebit.com>,
	"ronniesahlberg@gmail.com" <ronniesahlberg@gmail.com>,
	"nspmangalore@gmail.com" <nspmangalore@gmail.com>, "brian.pardy@gmail.com"
	<brian.pardy@gmail.com>, "bharathsm@microsoft.com" <bharathsm@microsoft.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: Possible bug report: kernel 6.5.0/6.5.1 high load when CIFS share
 is mounted (cifsd-cfid-laundromat in"D" state)
Thread-Topic: Possible bug report: kernel 6.5.0/6.5.1 high load when CIFS
 share is mounted (cifsd-cfid-laundromat in"D" state)
Thread-Index: AQHZ92+sm0zmujZcU0uXcBrFhineoLA608yA
Date: Thu, 5 Oct 2023 09:55:41 +0000
Message-ID: <85d538fec5a086acf62d5a803056586a6c00e4bd.camel@uniklinik-freiburg.de>
References: <CAO+kfxTwOvaxYV0ZRESxZB-4LHsF9b_VBjAKahhwUm5a1_c4ug@mail.gmail.com>
	 <ZPfPfyIoVxw5L6El@debian.me>
	 <CAO+kfxQgXOsx6u+xLKGJe0KDiFsRAGstSpnrwxjQF6udgz5HFQ@mail.gmail.com>
	 <CAO+kfxTvA6N=i+jGf0XbSyqf85i=q+vR6R9d_42OWfM2sWWXaA@mail.gmail.com>
	 <CAH2r5mtUedfLSv81Z-Yb3_=AbD_QpT3tVbU1PRzMTituaw7bgA@mail.gmail.com>
	 <CAH2r5mt6YzapEKDo=hQ64yvBn7=jwMmY1c85NOABKcMPKPp3KA@mail.gmail.com>
	 <CAO+kfxQtOKoKdb+LtMeFxgu8VXa73nbmTPSfscbdwjUXM7ME_A@mail.gmail.com>
	 <CAH2r5msNf9WDHrBZSi5FhHDSewSNxMAuXTetMJDnoNh3CF_oMA@mail.gmail.com>
	 <a895f860-11fa-e6d9-d042-a32bd08f9e9d@talpey.com>
	 <CAH2r5mszCxPtdURenMVgeVDX5zc8knumH=ASXyUufPa7SxbJBw@mail.gmail.com>
	 <ZRN9MtBqYnT6oX60@vaarsuvius>
In-Reply-To: <ZRN9MtBqYnT6oX60@vaarsuvius>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [193.196.253.71]
Content-Type: text/plain; charset="utf-8"
Content-ID: <68FBD33032B9744A8A19C5C1FDCA7193@ad.uniklinik-freiburg.de>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-FEAS-Client-IP: 193.196.253.53
X-FE-Last-Public-Client-IP: 193.196.253.53
X-FE-Policy-ID: 1:4:1:SYSTEM

QW0gRGllbnN0YWcsIGRlbSAyNi4wOS4yMDIzIHVtIDE3OjU0IC0wNzAwIHNjaHJpZWIgUGF1bCBB
dXJpY2g6DQo+IFBlcmhhcHMgdGhlIGxhdW5kcm9tYXQgdGhyZWFkIHNob3VsZCBiZSB1c2luZyBt
c2xlZXBfaW50ZXJydXB0aWJsZSgpPw0KPiANCj4gVXNpbmcgYW4gaW50ZXJydXB0aWJsZSBzbGVl
cCBhcHBlYXJzIHRvIHByZXZlbnQgdGhlIHRocmVhZCBmcm9tDQo+IGNvbnRyaWJ1dGluZyANCj4g
dG8gdGhlIGxvYWQgYXZlcmFnZSwgYW5kIGhhcyB0aGUgaGFwcHkgc2lkZS1lZmZlY3Qgb2YgcmVt
b3ZpbmcgdGhlDQo+IHVwLXRvLTFzIGRlbGF5IA0KPiB3aGVuIHRlYXJpbmcgZG93biB0aGUgdGNv
biAoc2luY2UgYTdjMDFmYTkzYWUsIGt0aHJlYWRfc3RvcCgpIHdpbGwNCj4gcmV0dXJuIA0KPiBl
YXJseSB0cmlnZ2VyZWQgYnkga3RocmVhZF9zdG9wKS4NCg0KU29ycnkgZm9yIGNoaW1pbmcgaW4g
c28gbGF0ZSAtIEknbSBhbHNvIG9uIGdlbnRvbyAoa2VybmVsIDYuNS41LQ0KZ2VudG9vKSwgYnV0
IGFzIGEgY2xpZW50IG9mIFdpbmRvd3MgQUQuDQoNCkp1c3Qgd2FudCB0byBlbXBoYXNpemUgdGhh
dCB1c2luZyB1bmludGVycnVwdGlibGUgc2xlZXAgaGFzIG5vdCBqdXN0DQp1bmhhcHB5IGJ1dCBk
ZXZhc3RhdGluZyBzaWRlLWVmZmVjdHMuDQoNCkkgaGF2ZSA4IHByb2Nlc3NvcnMgYW5kIDE2IGNp
ZnNkLWNmaWQtbGF1bmRyb21hdCBwcm9jZXNzZXMsIHNvDQovcHJvYy9sb2FkYXZnIHJlcG9ydHMg
YSBsb2FkIGF2ZXJhZ2Ugb2YgMTYgb24gYSB0b3RhbGx5IGlkbGUgc3lzdGVtLg0KDQpUaGlzIG1l
YW5zIHRoYXQgbG9hZC1iYWxhbmNpbmcgc29mdHdhcmUgd2lsbCBuZXZlciBzdGFydCBhZGRpdGlv
bmFsDQp0YXNrcyBvbiB0aGlzIHN5c3RlbSAtICJtYWtlIC1sIiBidXQgYWxzbyBhbnkgb3RoZXIg
bG9hZC1kZXBlbmRlbnQNCnN5c3RlbS4gSnVzdCByZWR1Y2luZyB0aGUgbnVtYmVyIG9mIGNpZnNk
LWNmaWQtbGF1bmRyb21hdCBwcm9jZXNzZXMNCmRvZXMgbm90IGZpeCB0aGlzIC0gZXZlbiBhIHNp
bmdsZSBvbmUgbWFrZXMgbG9hZGF2ZyByZXBvcnQgYSB3cm9uZw0KcmVzdWx0IGZvciBsb2FkIGJh
bGFuY2luZy4NCg0KU28sIGlmIGNpZnNkLWNmaWQtbGF1bmRyb21hdCBtdXN0IHJlYWxseSBiZSB1
bmludGVycnVwdGlibGUsIHRoZSBvbmx5DQpzb2x1dGlvbiB3b3VsZCBiZSB0byBjaGFuZ2UgdGhl
IHdheSBsb2FkYXZnIGlzIGNvbXB1dGVkIGJ5IHRoZSBrZXJuZWwNCnRvIGV4Y2x1ZGUgdW5pbnRl
cnJ1cHRpYmxlIGJ1dCBzbGVlcGluZyBwcm9jZXNzZXMuIEJ1dCBtdXN0IGl0IGJlDQp1bmludGVy
cnVwdGlibGU/DQoNClRoYW5rcyBhbmQgYmVzdCByZWdhcmRzLA0KQmVybmQNCg==
