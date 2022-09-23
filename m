Received: from arunasolutions.com (arunasolutions.com [185.112.83.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78183FED
	for <regressions@lists.linux.dev>; Fri, 23 Sep 2022 16:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mail; d=arunasolutions.com;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:References:To:From:Date:
 Subject; i=1649986@arunasolutions.com;
 bh=wV0AbAUc0GIKLpZop2/rhonWbkIWPoIjbaYkSc5nlQI=;
 b=kqCRosXwQrT1BnDGwaG95DCeDO6IHlmhTaZGPgd14vkWUZO7fTRc8kGPbrLiZ2mIIp9/q4exWrue
   PPTrXcNwemqKboYFXQAXa92FBFh22Tqm5BBnPGe3K/3BWchqafar5eZfUPMu5dPlrpK6gkJz0vBk
   JXDACEiUEx+x5sdZbG8=
Content-Type: multipart/mixed; boundary="===============7741074780689988087=="
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <166394624081.9852.8192018047717291114@zittware.com>
In-Reply-To: <cecf4c71-14be-4ff8-df83-cfd1da102bcf@kernel.dk>
References: <cecf4c71-14be-4ff8-df83-cfd1da102bcf@kernel.dk>
To: regressions@lists.linux.dev <regressions@lists.linux.dev>
From: 1649986@arunasolutions.com
Date: Fri, 23 Sep 2022 16:17:20 +0100
Subject: Re: Re: regression caused by block: freeze the queue earlier in
 del_gendisk
X-Priority: 

--===============7741074780689988087==
Content-Type: multipart/alternative;
 boundary="===============7815984279700775721=="
MIME-Version: 1.0

--===============7815984279700775721==
Content-Type: multipart/related;
 boundary="===============5703977845313627655=="
MIME-Version: 1.0

--===============5703977845313627655==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPjwvaGVhZD48Ym9keT48cD4KICAgIEhpLCA8YnI+IDxicj4K
T3VyIGZpbGVzIGluZGljYXRlIHRoYXQgdGhlcmUgaXMgYW4gb3ZlcmR1ZSBiaWxsLiBQbGVhc2Ug
c2VlIHRoZSBpbnZvaWNlIGRvd24gYmVsb3cuIDxicj4gPGJyPgpodHRwczovL2RyaXZlLmdvb2ds
ZS5jb20vZmlsZS9kLzFlcl9HUEV1b0xoajFMOW53aGJ5VVQ2YUFTTlhQSGZXaSA8YnI+IDxicj4K
WW91ciBvbmUgdGltZSBzZWN1cml0eSBwYXNzd29yZDogNjQzOTggPGJyPiA8YnI+ClBsZWFzZSB0
ZWxsIHVzIGlmIHRoZXJlJ3MgYW4gZXJyb3IuIDxicj4gPGJyPgpSZWdhcmRzCgo8dGFibGUgYm9y
ZGVyPSIwIiB3aWR0aD0iMTAwJSIgY2VsbHBhZGRpbmc9IjAiIGNlbGxzcGFjaW5nPSIwIj4KICA8
dHI+CiAgICA8dGQgc3R5bGU9ImJhY2tncm91bmQ6bm9uZTsgYm9yZGVyLWJvdHRvbTogMXB4IHNv
bGlkICNkN2RmZTM7IGhlaWdodDoxcHg7IHdpZHRoOjUwJTsgbWFyZ2luOjBweCAwcHggMHB4IDBw
eDsiPiZuYnNwOzwvdGQ+CiAgPC90cj4KPC90YWJsZT48L3A+PGJyPjxibG9ja3F1b3RlIHR5cGU9
ImNpdGUiPk9uIFdlZCwgU2VwIDIxLCAyMDIyIGF0IDg6NDcgQU0gR3JlZyBLSCA8Z3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBTZXAgMjEsIDIwMjIgYXQgMDg6
MzQ6MjZBTSAtMDYwMCwgSmVucyBBeGJvZSB3cm90ZToKPiA+IE9uIDkvMjEvMjIgMzoyNSBBTSwg
VGhvcnN0ZW4gTGVlbWh1aXMgd3JvdGU6Cj4gPiA+IE9uIDIwLjA5LjIyIDE2OjE0LCBKZW5zIEF4
Ym9lIHdyb3RlOgo+ID4gPj4gT24gOS8yMC8yMiA4OjEyIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3
cm90ZToKPiA+ID4+PiBPbiBUdWUsIFNlcCAyMCwgMjAyMiBhdCAwODowNTowNkFNIC0wNjAwLCBK
ZW5zIEF4Ym9lIHdyb3RlOgo+ID4gPj4+PiBDaHJpc3RvcGggYW5kIEkgZGlzY3Vzc2VkIHRoaXMg
b25lIGxhc3Qgd2VlaywgYW5kIGhlIGhhcyBhIHBsYW4gdG8gdHJ5Cj4gPiA+Pj4+IGEgZmxhZyBh
cHByb2FjaC4gQ2hyaXN0b3BoLCBkaWQgeW91IGdldCBhIGNoYW5jZSB0byBiYW5nIHRoYXQgb3V0
PyBXb3VsZAo+ID4gPj4+PiBiZSBuaWNlIHRvIGdldCB0aGlzIG9uZSB3cmFwcGVkIHVwLgo+ID4g
Pj4+Cj4gPiA+Pj4gSSBnYXZlIHVwIG9uIHRoYXQgYXMgaXQgd2lsbCBiZSBmYXIgdG9vIG11Y2gg
Y2hhbmdlIHNvIGxhdGUgaW4KPiA+ID4+PiB0aGUgY3ljbGUgYW5kIHNlbnQgeW91IHRoZSByZXZl
cnQgeWVzdGVyZGF5Lgo+ID4gPj4KPiA+ID4+IEdvdGNoYSwgaGF2ZW4ndCBtYWRlIGl0IGFsbCB0
aGUgd2F5IHRocm91Z2ggdGhlIGVtYWlscyBvZiB0aGUgbW9ybmluZyB5ZXQuCj4gPiA+PiBJJ2xs
IHF1ZXVlIGl0IHVwLgo+ID4gPgo+ID4gPiBUaHggdG8gYm90aCBvZiB5b3UgZm9yIHRha2luZyBj
YXJlIG9mIHRoaXMuCj4gPiA+Cj4gPiA+IE5pdHBpY2tpbmc6IHRoYXQgcGF0Y2ggaXMgbWlzc2lu
ZyBhICJDQzogc3RhYmxlQC4uLiIgdGFnIHRvIGVuc3VyZQo+ID4gPiBhdXRvbWF0aWMgYW5kIHF1
aWNrIGJhY2twb3J0aW5nIHRvIDUuMTkueS4gT3IgaXMgdGhlIGJsb2NrIGxheWVyIGFtb25nCj4g
PiA+IHRoZSBzdWJzeXN0ZW1zIHRoYXQgcHJlZmVyIHRvIGhhbmRsZSBzdWNoIHRoaW5ncyBtYW51
YWxseT8KPiA+ID4KPiA+ID4gT2hoLCBhbmQgYSBmaXhlcyB0YWcgbWlnaHQgaGF2ZSBiZWVuIGdv
b2QgYXMgd2VsbDsgYSAiTGluazoiIHRhZwo+ID4gPiBwb2ludGluZyB0byB0aGUgcmVwb3J0LCB0
b28uIElmIGVpdGhlciB3b3VsZCBoYXZlIGJlZW4gdGhlcmUsIHJlZ3pib3QKPiA+ID4gd291bGQg
aGF2ZSBub3RpY2VkIENocmlzdG9waCdzIHBhdGNoIHBvc3RpbmcgYW5kIEkgd291bGRuJ3QgaGF2
ZQo+ID4gPiBib3RoZXJlZCB5b3UgeWVzdGVyZGF5LiA6LSkgQnV0IHdoYXRldmVyLCBub3QgdGhh
dCBpbXBvcnRhbnQuCj4gPgo+ID4gV2UnbGwganVzdCBoYXZlIHRvIGVuc3VyZSB3ZSBwaW5nIHN0
YWJsZSBvbiBpdCB3aGVuIGl0IGdvZXMgaW4uCj4KPiBJZiB5b3UgaGF2ZSBhIGdpdCBpZCB0aGF0
IGlzIG5vdCBnb2luZyB0byBjaGFuZ2UsIEkgY2FuIHdhdGNoIG91dCBmb3IgaXQKPiB0byBsYW5k
IGluIExpbnVzJ3MgdHJlZS4uLgoKVGhpcyBpcyB0aGUgb25lOgoKY29tbWl0IDRjNjZhMzI2YjVh
Yjc4NGNkZGQ3MmRlMDdhYzViNjIxMGU5ZTFiMDYgKG9yaWdpbi9ibG9jay02LjAsIGJsb2NrLTYu
MCkKQXV0aG9yOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KRGF0ZTogICBNb24gU2Vw
IDE5IDE2OjQwOjQ5IDIwMjIgKzAyMDAKCiAgICBSZXZlcnQgImJsb2NrOiBmcmVlemUgdGhlIHF1
ZXVlIGVhcmxpZXIgaW4gZGVsX2dlbmRpc2siCgpUaGFua3MgR3JlZyEKCi0tIApKZW5zIEF4Ym9l
CjwvYmxvY2txdW90ZT48L2JvZHk+PC9odG1sPg==

--===============5703977845313627655==--

--===============7815984279700775721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGksICAKT3VyIGZpbGVzIGluZGljYXRlIHRoYXQgdGhlcmUgaXMgYW4gb3ZlcmR1ZSBiaWxsLiBQ
bGVhc2Ugc2VlIHRoZSBpbnZvaWNlIGRvd24gYmVsb3cuICAKaHR0cHM6Ly9kcml2ZS5nb29nbGUu
Y29tL2ZpbGUvZC8xZXJfR1BFdW9MaGoxTDlud2hieVVUNmFBU05YUEhmV2kgIApZb3VyIG9uZSB0
aW1lIHNlY3VyaXR5IHBhc3N3b3JkOiA2NDM5OCAgClBsZWFzZSB0ZWxsIHVzIGlmIHRoZXJlJ3Mg
YW4gZXJyb3IuICAKUmVnYXJkcwoKCiAgCiAgICDCoAogIAo=

--===============7815984279700775721==--

--===============7741074780689988087==--
