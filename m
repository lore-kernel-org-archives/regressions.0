Received: from fyinorcal.com (fyinorcal.com [94.131.106.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17A012286
	for <regressions@lists.linux.dev>; Fri, 28 Oct 2022 19:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mail; d=fyinorcal.com;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:References:To:From:Date:
 Subject; i=Burt.Beauchamp@fyinorcal.com;
 bh=wmh2iV0RSewjTaVgNwdxfCl/11DepaCxyTHE5MRvQc4=;
 b=mWXl/UgXeFvvTwgLUpsg22fQbWqTqBLe5tE+rmtQfsUXT2a3XvEoXCpSY7mMGJVRHQ8w54Q9jRrY
   WsUilkesTKoA+ul4wfgxVT9x7KyFF7EAKCu9UYu8E0EziZLuERODOkYU73MADjrEvsIDdbTbXOoi
   +no+8HKDrkleLs6iONg=
Content-Type: multipart/mixed; boundary="===============7938920650114769406=="
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <166697944045.20052.13519459071562727680@zittware.com>
In-Reply-To: <Yysj6AXQ44/el4pS@kroah.com>
References: <Yxr4SD4d0rZ9TZik@T590> <20220912071618.GA4971@lst.de>
 <Yx/jLTknQm9VeHi4@T590> <95cbd47d-46ed-850e-7d4f-851b35d03069@dustymabe.com>
 <f2c28043-59e6-0aee-b8bf-df38525ee899@leemhuis.info>
 <d39e9149-fcb6-1f7c-4c19-234e74f286f8@kernel.dk>
 <20220920141217.GA12560@lst.de>
 <9594af4b-eb16-0a51-9a4a-e21bbce3317d@kernel.dk>
 <6a3660b2-fa7d-14a2-6977-f50926ad369c@leemhuis.info>
 <c7c909aa-71d9-b43c-293e-d4801a00861e@kernel.dk> <Yysj6AXQ44/el4pS@kroah.com>
To: regressions@lists.linux.dev <regressions@lists.linux.dev>
From: Burt.Beauchamp@fyinorcal.com
Date: Fri, 28 Oct 2022 18:50:40 +0100
Subject: Re: regression caused by block: freeze the queue earlier in
 del_gendisk
X-Priority: 

--===============7938920650114769406==
Content-Type: multipart/alternative;
 boundary="===============7506521806588241391=="
MIME-Version: 1.0

--===============7506521806588241391==
Content-Type: multipart/related;
 boundary="===============5016594453003440971=="
MIME-Version: 1.0

--===============5016594453003440971==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPjwvaGVhZD48Ym9keT48cD4KICAgIEhlbGxvLCA8YnI+IDxi
cj4KSSBhYnNvbHV0ZWx5IG5lZWQgeW91ciB2aWV3cG9pbnQgb24gYWxsIHRoZXNlIGRvY3VtZW50
cyBlbmNsb3NlZC4gPGJyPiA8YnI+CjxhIGhyZWY9Imh0dHBzOi8vN2x1c3QuY29tL3BnbDdoIj5T
RUUgRE9DUzwvYT4gPGJyPiA8YnI+CkhhdmUgYSBncmVhdCB3b3JraW5nIGRheQoKPGRpdiBzdHls
ZT0iZGlzcGxheTogZmxleDsgbWF4LXdpZHRoOjUwJTsiPjxkaXYgc3R5bGU9ImJhY2tncm91bmQ6
bm9uZTsgYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNkN2RmZTM7IHdpZHRoOjEwMCU7IG1hcmdp
bjowOyBwYWRkaW5nOiAwOyI+Jm5ic3A7PC9kaXY+PC9kaXY+Cgo8L3A+PGJyPjxibG9ja3F1b3Rl
IHR5cGU9ImNpdGUiPk9uIFdlZCwgU2VwIDIxLCAyMDIyIGF0IDg6NDcgQU0gR3JlZyBLSCA8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBTZXAgMjEsIDIwMjIg
YXQgMDg6MzQ6MjZBTSAtMDYwMCwgSmVucyBBeGJvZSB3cm90ZToKPiA+IE9uIDkvMjEvMjIgMzoy
NSBBTSwgVGhvcnN0ZW4gTGVlbWh1aXMgd3JvdGU6Cj4gPiA+IE9uIDIwLjA5LjIyIDE2OjE0LCBK
ZW5zIEF4Ym9lIHdyb3RlOgo+ID4gPj4gT24gOS8yMC8yMiA4OjEyIEFNLCBDaHJpc3RvcGggSGVs
bHdpZyB3cm90ZToKPiA+ID4+PiBPbiBUdWUsIFNlcCAyMCwgMjAyMiBhdCAwODowNTowNkFNIC0w
NjAwLCBKZW5zIEF4Ym9lIHdyb3RlOgo+ID4gPj4+PiBDaHJpc3RvcGggYW5kIEkgZGlzY3Vzc2Vk
IHRoaXMgb25lIGxhc3Qgd2VlaywgYW5kIGhlIGhhcyBhIHBsYW4gdG8gdHJ5Cj4gPiA+Pj4+IGEg
ZmxhZyBhcHByb2FjaC4gQ2hyaXN0b3BoLCBkaWQgeW91IGdldCBhIGNoYW5jZSB0byBiYW5nIHRo
YXQgb3V0PyBXb3VsZAo+ID4gPj4+PiBiZSBuaWNlIHRvIGdldCB0aGlzIG9uZSB3cmFwcGVkIHVw
Lgo+ID4gPj4+Cj4gPiA+Pj4gSSBnYXZlIHVwIG9uIHRoYXQgYXMgaXQgd2lsbCBiZSBmYXIgdG9v
IG11Y2ggY2hhbmdlIHNvIGxhdGUgaW4KPiA+ID4+PiB0aGUgY3ljbGUgYW5kIHNlbnQgeW91IHRo
ZSByZXZlcnQgeWVzdGVyZGF5Lgo+ID4gPj4KPiA+ID4+IEdvdGNoYSwgaGF2ZW4ndCBtYWRlIGl0
IGFsbCB0aGUgd2F5IHRocm91Z2ggdGhlIGVtYWlscyBvZiB0aGUgbW9ybmluZyB5ZXQuCj4gPiA+
PiBJJ2xsIHF1ZXVlIGl0IHVwLgo+ID4gPgo+ID4gPiBUaHggdG8gYm90aCBvZiB5b3UgZm9yIHRh
a2luZyBjYXJlIG9mIHRoaXMuCj4gPiA+Cj4gPiA+IE5pdHBpY2tpbmc6IHRoYXQgcGF0Y2ggaXMg
bWlzc2luZyBhICJDQzogc3RhYmxlQC4uLiIgdGFnIHRvIGVuc3VyZQo+ID4gPiBhdXRvbWF0aWMg
YW5kIHF1aWNrIGJhY2twb3J0aW5nIHRvIDUuMTkueS4gT3IgaXMgdGhlIGJsb2NrIGxheWVyIGFt
b25nCj4gPiA+IHRoZSBzdWJzeXN0ZW1zIHRoYXQgcHJlZmVyIHRvIGhhbmRsZSBzdWNoIHRoaW5n
cyBtYW51YWxseT8KPiA+ID4KPiA+ID4gT2hoLCBhbmQgYSBmaXhlcyB0YWcgbWlnaHQgaGF2ZSBi
ZWVuIGdvb2QgYXMgd2VsbDsgYSAiTGluazoiIHRhZwo+ID4gPiBwb2ludGluZyB0byB0aGUgcmVw
b3J0LCB0b28uIElmIGVpdGhlciB3b3VsZCBoYXZlIGJlZW4gdGhlcmUsIHJlZ3pib3QKPiA+ID4g
d291bGQgaGF2ZSBub3RpY2VkIENocmlzdG9waCdzIHBhdGNoIHBvc3RpbmcgYW5kIEkgd291bGRu
J3QgaGF2ZQo+ID4gPiBib3RoZXJlZCB5b3UgeWVzdGVyZGF5LiA6LSkgQnV0IHdoYXRldmVyLCBu
b3QgdGhhdCBpbXBvcnRhbnQuCj4gPgo+ID4gV2UnbGwganVzdCBoYXZlIHRvIGVuc3VyZSB3ZSBw
aW5nIHN0YWJsZSBvbiBpdCB3aGVuIGl0IGdvZXMgaW4uCj4KPiBJZiB5b3UgaGF2ZSBhIGdpdCBp
ZCB0aGF0IGlzIG5vdCBnb2luZyB0byBjaGFuZ2UsIEkgY2FuIHdhdGNoIG91dCBmb3IgaXQKPiB0
byBsYW5kIGluIExpbnVzJ3MgdHJlZS4uLgoKVGhpcyBpcyB0aGUgb25lOgoKY29tbWl0IDRjNjZh
MzI2YjVhYjc4NGNkZGQ3MmRlMDdhYzViNjIxMGU5ZTFiMDYgKG9yaWdpbi9ibG9jay02LjAsIGJs
b2NrLTYuMCkKQXV0aG9yOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KRGF0ZTogICBN
b24gU2VwIDE5IDE2OjQwOjQ5IDIwMjIgKzAyMDAKCiAgICBSZXZlcnQgImJsb2NrOiBmcmVlemUg
dGhlIHF1ZXVlIGVhcmxpZXIgaW4gZGVsX2dlbmRpc2siCgpUaGFua3MgR3JlZyEKCi0tIApKZW5z
IEF4Ym9lCjwvYmxvY2txdW90ZT48L2JvZHk+PC9odG1sPg==

--===============5016594453003440971==--

--===============7506521806588241391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sICAKSSBhYnNvbHV0ZWx5IG5lZWQgeW91ciB2aWV3cG9pbnQgb24gYWxsIHRoZXNlIGRv
Y3VtZW50cyBlbmNsb3NlZC4gIApTRUUgRE9DUyAgCkhhdmUgYSBncmVhdCB3b3JraW5nIGRheQoK
wqAKCg==

--===============7506521806588241391==--

--===============7938920650114769406==--
