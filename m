Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.187.6.220])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 2FAC5362
	for <regressions@lists.linux.dev>; Tue,  7 Mar 2023 10:44:45 +0000 (UTC)
Received: by ajax-webmail-mail-app3 (Coremail) ; Tue, 7 Mar 2023 18:36:13
 +0800 (GMT+08:00)
X-Originating-IP: [36.28.190.156]
Date: Tue, 7 Mar 2023 18:36:13 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Lin Ma" <linma@zju.edu.cn>
To: "Paul Menzel" <pmenzel@molgen.mpg.de>
Cc: "Corinna Vinschen" <vinschen@redhat.com>, 
	intel-wired-lan <intel-wired-lan@lists.osuosl.org>, 
	regressions <regressions@lists.linux.dev>
Subject: Re: [Intel-wired-lan] [REGRESSION] Deadlock since commit
 6faee3d4ee8b ("igb: Add lock to avoid data race")
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2023 www.mailtech.cn zju.edu.cn
In-Reply-To: <882d6a36-d3ac-c231-ba02-bc2235984cfd@molgen.mpg.de>
References: <ZAcJvkEPqWeJHO2r@calimero.vinschen.de>
 <3ef31c0b-ce40-20d0-7740-5dc0cca278ca@molgen.mpg.de>
 <882d6a36-d3ac-c231-ba02-bc2235984cfd@molgen.mpg.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <43532635.82161.186bba49ec2.Coremail.linma@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cC_KCgCXnQydEwdkOWnqDQ--.27890W
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwUFElNG3KE1WAAGsS
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

SGVsbG8gdGhlcmUKClllYWggSSBhbSBsb29raW5nIGF0IGl0LiBDb3VsZCB5b3UgcGxlYXNlIG9m
ZmVyIHRoZSBjcmFzaCBsb2cgb3IgbG9ja2luZyBkZWJ1ZyBtZXNzYWdlIGlmIGFjY2Vzc2libGU/
IFRoYW5rcyBpbiBhZHZhbmNlLgoKUmVnYXJkcwpMaW4KCj5bQWRkIENvcmlubmEgYmFjayB0byBD
YzosIHdobyB3YXMgcmVtb3ZlZCBieSBNb3ppbGxhIFRodW5kZXJiaXJkIGJlY2F1c2UgCj5SZXBs
eS1UbyBoZWFkZXIgd2FzIHNldCBmb3Igc29tZSByZWFzb24gaW4gdGhlIG9yaWdpbmFsIHJlcG9y
dC5dCj4KPkFtIDA3LjAzLjIzIHVtIDExOjEyIHNjaHJpZWIgUGF1bCBNZW56ZWw6Cj4+IFtBZGRp
bmcgcmVncmVzc2lvbnNAbGlzdHMubGludXguZGV2XQo+PiAKPj4gI3JlZ3pib3QgXmludHJvZHVj
ZWQ6IDZmYWVlM2Q0ZWU4Ygo+PiAKPj4gQW0gMDcuMDMuMjMgdW0gMTA6NTQgc2NocmllYiBDb3Jp
bm5hIFZpbnNjaGVuOgo+Pj4gSGksCj4+Pgo+Pj4KPj4+IEFmdGVyIHBhdGNoIDZmYWVlM2Q0ZWU4
YiAoImlnYjogQWRkIGxvY2sgdG8gYXZvaWQgZGF0YSByYWNlIiksIHdlIHNlZQo+Pj4gYSBkZWFk
bG9jayBzY2VuYXJpbyB3aGVuIHRyeWluZyB0byB1bmxvYWQgdGhlIGlnYiBtb2R1bGUuCj4+Pgo+
Pj4gVGhlIHJlcHJvZHVjZXIgaXMgcHJldHR5IHNpbXBsZToKPj4+Cj4+PiDCoMKgICMgZWNobyAy
ID4gL3N5cy9jbGFzcy9uZXQvZW5zNWYyL2RldmljZS9zcmlvdl9udW12ZnMKPj4+IMKgwqAgIyBt
b2Rwcm9iZSAtciBpZ2IKPj4+Cj4+PiBUaGUgaGFuZyBpcyBxdWl0ZSB0aG9yb3VnaCwgSSBhc3N1
bWUgaXQncyBzdWZmZXJpbmcgYSBkZWFkbG9jayBiZXR3ZWVuCj4+PiB0aGUgcnRubF9sb2NrIGFu
ZCB0aGUgc3BpbmxvY2sgaW50cm9kdWNlZCBieSA2ZmFlZTNkNGVlOGIuCj4+Pgo+Pj4gQW55IGNo
YW5jZSB5b3UgY291bGQgaGF2ZSBhIGxvb2s/Cj4+Pgo+Pj4KPj4+IFRoYW5rcywKPj4+IENvcmlu
bmEK
