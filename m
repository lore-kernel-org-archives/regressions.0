Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBF663C5
	for <regressions@lists.linux.dev>; Sun, 25 Jun 2023 15:36:39 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-207-G6fb6HvCMiuHnGnGBWezVQ-1; Sun, 25 Jun 2023 16:36:35 +0100
X-MC-Unique: G6fb6HvCMiuHnGnGBWezVQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 25 Jun
 2023 16:36:34 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 25 Jun 2023 16:36:34 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Linus Torvalds' <torvalds@linux-foundation.org>, Ard Biesheuvel
	<ardb@kernel.org>
CC: "Jason A. Donenfeld" <Jason@zx2c4.com>, "regressions@leemhuis.info"
	<regressions@leemhuis.info>, Andrew Lunn <andrew@lunn.ch>, Linux Stable
	<stable@vger.kernel.org>, Linux Regressions <regressions@lists.linux.dev>,
	Bagas Sanjaya <bagasdotme@gmail.com>, Sami Korkalainen
	<sami.korkalainen@proton.me>
Subject: RE: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
Thread-Topic: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
Thread-Index: AQHZpib0NlwG7Q145EancEpql/aG6a+bqCJQ
Date: Sun, 25 Jun 2023 15:36:34 +0000
Message-ID: <be98e9a82acc4a099026eca1e22f5a80@AcuMS.aculab.com>
References: <GQUnKz2al3yke5mB2i1kp3SzNHjK8vi6KJEh7rnLrOQ24OrlljeCyeWveLW9pICEmB9Qc8PKdNt3w1t_g3-Uvxq1l8Wj67PpoMeWDoH8PKk=@proton.me>
 <ZHFaFosKY24-L7tQ@debian.me>
 <NVN-hJsvHwaHe6R-y6XIYJp0FV7sCavgMjobFnseULT1wjgkOFNXbGBGT5iVjCfbtU7dW5xy2hIDoq0ASeNaXhvSY-g2Df4aHWVIMQ2c3TQ=@proton.me>
 <ZIcmpcEsTLXFaO0f@debian.me>
 <oEbkgJ-ImLxBDZDUTnIAGFWrRVnwBss3FOlalTpwrz83xWgESC9pcvNKiAVp9BzFgqZ0V-NIwzBZ7icKD8ynuIi_ZMtGt7URu3ftcSt16u4=@proton.me>
 <e2ca75ef-d779-4bad-84a5-a9f262dbe213@lunn.ch>
 <FNzHwp9-AyweVwIMndmih6VuBD0nsyRp3OM72bmOxpeYszF680jFPJjENIknT32FeaqfVBtVSQFw-5mgE3ZXeksVD8VCFbxwojxP3mSZ9DQ=@proton.me>
 <9517bb70-426c-0296-b426-f5b4f075f7c8@leemhuis.info>
 <CAHmME9p2ZLJUMq96vhkiSgvJkxP5BxE778MhY5Ou2WdxLVEJyg@mail.gmail.com>
 <CAMj1kXHGkJsgArabs_mbzR3Y83s48qmf_aqb50k1LV1Hi5iNgA@mail.gmail.com>
 <CAHk-=wiiFHLSDe3JSSMm5EezpXXMFxYH=RwFLEbgsCKLjg4qqQ@mail.gmail.com>
 <CAHmME9oC6Kq5qeoSmY5CdDrbGnkcp9sy-9ESXdpRtM8x1_6Hwg@mail.gmail.com>
 <CAHk-=wjKtHwJBeUiJL_1HFJKWja120w-6qaLx1FS5p9QE0PfSw@mail.gmail.com>
 <CAMj1kXF7aO1FPXeBFeLBe1-7j5hUjiTAXu-xV6oKFN8dRY3qDQ@mail.gmail.com>
 <CAHk-=whKF0S33EgXts++dpspdFAtkf_otRbV45x1Yt2+bDz0sQ@mail.gmail.com>
In-Reply-To: <CAHk-=whKF0S33EgXts++dpspdFAtkf_otRbV45x1Yt2+bDz0sQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbTogTGludXMgVG9ydmFsZHMNCj4gU2VudDogMjQgSnVuZSAyMDIzIDAwOjAzDQo+IA0KPiBP
biBGcmksIDIzIEp1biAyMDIzIGF0IDE1OjU1LCBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwu
b3JnPiB3cm90ZToNCj4gPg0KPiA+IFdpdGggdGhlIHJldmVydCBhcHBsaWVkLCB0aGUga2VybmVs
L0VGSSBzdHViIG9ubHkgY29uc3VtZXMgdGhlDQo+ID4gdmFyaWFibGUgYW5kIGRlbGV0ZXMgaXQs
IGJ1dCBuZXZlciBjcmVhdGVzIGl0IGJ5IGl0c2VsZiwgYW5kIHNvIHRoZQ0KPiA+IGNvZGUgZG9l
cyBub3RoaW5nIGlmIHRoZSB2YXJpYWJsZSBpcyBuZXZlciBjcmVhdGVkIGluIHRoZSBmaXJzdCBw
bGFjZS4NCj4gDQo+IFJpZ2h0Lg0KPiANCj4gQnV0IG15ICpwb2ludCogd2FzIHRoYXQgaWYgd2Ug
d2FudCB0byBjcmVhdGUgaXQsIHdlIERBTU4gV0VMTCBETyBOT1QNCj4gV0FOVCBUTyBETyBTTyBB
VCBCT09UIFRJTUUuDQo+IA0KPiBCb290IHRpbWUgaXMgYWJzb2x1dGVseSB0aGUgd29yc3QgcG9z
c2libGUgdGltZSB0byBkbyBpdC4NCj4gDQo+IFdlJ2QgYmUgbXVjaCBiZXR0ZXIgb2ZmIGRvaW5n
IHNvIGF0IHNodXRkb3duIHRpbWUsIHdoZW4gd2UgYXQgbGVhc3QNCj4gaGF2ZSAoYSkgbWF4aW1h
bCBlbnRyb3B5IGFuZCAoYikgZmFpbHVyZXMgYXJlIGxlc3MgY3JpdGljYWwuDQoNCk9yIG1heWJl
IGJldHRlciAtIGVzcGVjaWFsbHkgZm9yIGVtYmVkZGVkIHN5c3RlbXMgd2hpY2ggZG9uJ3QNCm9m
dGVuIGdldCBzaHV0IGRvd24gcHJvcGVybHkgKG9yIGFueSB3aGVyZSBzb21lb25lIGNhbiBmb3Jj
ZQ0KYSBzeXN0ZW0gY3Jhc2ggYW5kIHRoZW4gZ2V0IG5vIHNhdmVkIGVudHJvcHkpIC0gYWZ0ZXIg
dGhlIHN5c3RlbQ0KaGFzIGJlZW4gcnVubmluZyBsb25nIGVub3VnaCB0byBnZXQgYSByZWFzb25h
YmxlIGFtb3VudCBvZg0KZW50cm9weS4NCg0KQWxzbywgd2h5IGRlbGV0ZSB0aGUgZW50cm9weSBk
dXJpbmcgYm9vdD8NCkNsZWFybHkgaXQgaXMgc3ViLW9wdGltYWwgdG8gdXNlIGl0IHR3aWNlLCBi
dXQgdGhhdCBoYXMgdG8NCmJlIGJldHRlciB0aGF0IG5vdCB1c2luZyBhbnkgYXQgYWxsPw0KDQoJ
RGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1v
dW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEz
OTczODYgKFdhbGVzKQ0K

