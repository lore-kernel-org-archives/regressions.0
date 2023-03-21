Received: from mailboxcontacts.org (mailboxcontacts.org [45.150.64.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF5FC96C
	for <regressions@lists.linux.dev>; Tue, 21 Mar 2023 14:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mail; d=mailboxcontacts.org;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:References:To:From:Date:
 Subject; i=Geneveve.Pizarro@mailboxcontacts.org;
 bh=ORNthE105XFwK5/2wYrW1LlK+07jSEggvKqTm82ASzU=;
 b=E/am+YccAIfYjyIppcK4WAnnWctMUzej34Fkk+GW0PnjUdhRTDkw7BaqjflM+qbNL725w8oGdLQu
   qycwjRsCXxDCEuE96YbVtPIMNeFE/X0Xt0Kq+sejN4smTdmZDY2SNzrPun2wYgB//4qbOrBeG23n
   qheq/twsoShLnplbdaU=
Content-Type: multipart/mixed; boundary="===============4935789384317118248=="
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <167939743451.8780.125555339669597675@zittware.com>
In-Reply-To: <c7c909aa-71d9-b43c-293e-d4801a00861e@kernel.dk>
References: <Yxr4SD4d0rZ9TZik@T590>
 <20220912071618.GA4971@lst.de>
 <Yx/jLTknQm9VeHi4@T590>
 <95cbd47d-46ed-850e-7d4f-851b35d03069@dustymabe.com>
 <f2c28043-59e6-0aee-b8bf-df38525ee899@leemhuis.info>
 <d39e9149-fcb6-1f7c-4c19-234e74f286f8@kernel.dk>
 <20220920141217.GA12560@lst.de>
 <9594af4b-eb16-0a51-9a4a-e21bbce3317d@kernel.dk>
 <6a3660b2-fa7d-14a2-6977-f50926ad369c@leemhuis.info>
 <c7c909aa-71d9-b43c-293e-d4801a00861e@kernel.dk>
To: regressions@lists.linux.dev <regressions@lists.linux.dev>
From: Geneveve.Pizarro@mailboxcontacts.org
Date: Tue, 21 Mar 2023 04:17:14 -0700
Subject: Re: regression caused by block: freeze the queue earlier in
 del_gendisk

--===============4935789384317118248==
Content-Type: multipart/alternative;
 boundary="===============8613851044760371948=="
MIME-Version: 1.0

--===============8613851044760371948==
Content-Type: multipart/related;
 boundary="===============5619293099550330100=="
MIME-Version: 1.0

--===============5619293099550330100==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPjwvaGVhZD48Ym9keT48cD4KICAgIEdvb2QgRGF5LCA8YnI+
IDxicj4KSW4gY2FzZSB5b3UgaGF2ZSBpbnF1aXJpZXMgcmVnYXJkaW5nIHRoZSBidXNpbmVzcyBw
cmVzZW50YXRpb24sIHBsZWFzZSByZW1lbWJlciB0byBjb250YWN0IG1lLiA8YnI+IDxicj4KPGEg
aHJlZj0iaHR0cHM6Ly9kbXByZXBvcnRzLmNvbS9tYnYzdyI+U0VFIERBVEE8L2E+IDxicj4gPGJy
PgpNYW55IFRoYW5rcywKCjxkaXYgc3R5bGU9ImRpc3BsYXk6IGZsZXg7IG1heC13aWR0aDo1MCU7
Ij48ZGl2IHN0eWxlPSJiYWNrZ3JvdW5kOm5vbmU7IGJvcmRlci1ib3R0b206IDFweCBzb2xpZCAj
ZDdkZmUzOyB3aWR0aDo1MCU7IG1hcmdpbjowOyBwYWRkaW5nOiAwOyI+Jm5ic3A7PC9kaXY+PC9k
aXY+PC9wPjxicj48YmxvY2txdW90ZSB0eXBlPSJjaXRlIj5PbiBXZWQsIFNlcCAyMSwgMjAyMiBh
dCAwODozNDoyNkFNIC0wNjAwLCBKZW5zIEF4Ym9lIHdyb3RlOgo+IE9uIDkvMjEvMjIgMzoyNSBB
TSwgVGhvcnN0ZW4gTGVlbWh1aXMgd3JvdGU6Cj4gPiBPbiAyMC4wOS4yMiAxNjoxNCwgSmVucyBB
eGJvZSB3cm90ZToKPiA+PiBPbiA5LzIwLzIyIDg6MTIgQU0sIENocmlzdG9waCBIZWxsd2lnIHdy
b3RlOgo+ID4+PiBPbiBUdWUsIFNlcCAyMCwgMjAyMiBhdCAwODowNTowNkFNIC0wNjAwLCBKZW5z
IEF4Ym9lIHdyb3RlOgo+ID4+Pj4gQ2hyaXN0b3BoIGFuZCBJIGRpc2N1c3NlZCB0aGlzIG9uZSBs
YXN0IHdlZWssIGFuZCBoZSBoYXMgYSBwbGFuIHRvIHRyeQo+ID4+Pj4gYSBmbGFnIGFwcHJvYWNo
LiBDaHJpc3RvcGgsIGRpZCB5b3UgZ2V0IGEgY2hhbmNlIHRvIGJhbmcgdGhhdCBvdXQ/IFdvdWxk
Cj4gPj4+PiBiZSBuaWNlIHRvIGdldCB0aGlzIG9uZSB3cmFwcGVkIHVwLgo+ID4+Pgo+ID4+PiBJ
IGdhdmUgdXAgb24gdGhhdCBhcyBpdCB3aWxsIGJlIGZhciB0b28gbXVjaCBjaGFuZ2Ugc28gbGF0
ZSBpbgo+ID4+PiB0aGUgY3ljbGUgYW5kIHNlbnQgeW91IHRoZSByZXZlcnQgeWVzdGVyZGF5Lgo+
ID4+Cj4gPj4gR290Y2hhLCBoYXZlbid0IG1hZGUgaXQgYWxsIHRoZSB3YXkgdGhyb3VnaCB0aGUg
ZW1haWxzIG9mIHRoZSBtb3JuaW5nIHlldC4KPiA+PiBJJ2xsIHF1ZXVlIGl0IHVwLgo+ID4gCj4g
PiBUaHggdG8gYm90aCBvZiB5b3UgZm9yIHRha2luZyBjYXJlIG9mIHRoaXMuCj4gPiAKPiA+IE5p
dHBpY2tpbmc6IHRoYXQgcGF0Y2ggaXMgbWlzc2luZyBhICJDQzogc3RhYmxlQC4uLiIgdGFnIHRv
IGVuc3VyZQo+ID4gYXV0b21hdGljIGFuZCBxdWljayBiYWNrcG9ydGluZyB0byA1LjE5LnkuIE9y
IGlzIHRoZSBibG9jayBsYXllciBhbW9uZwo+ID4gdGhlIHN1YnN5c3RlbXMgdGhhdCBwcmVmZXIg
dG8gaGFuZGxlIHN1Y2ggdGhpbmdzIG1hbnVhbGx5Pwo+ID4gCj4gPiBPaGgsIGFuZCBhIGZpeGVz
IHRhZyBtaWdodCBoYXZlIGJlZW4gZ29vZCBhcyB3ZWxsOyBhICJMaW5rOiIgdGFnCj4gPiBwb2lu
dGluZyB0byB0aGUgcmVwb3J0LCB0b28uIElmIGVpdGhlciB3b3VsZCBoYXZlIGJlZW4gdGhlcmUs
IHJlZ3pib3QKPiA+IHdvdWxkIGhhdmUgbm90aWNlZCBDaHJpc3RvcGgncyBwYXRjaCBwb3N0aW5n
IGFuZCBJIHdvdWxkbid0IGhhdmUKPiA+IGJvdGhlcmVkIHlvdSB5ZXN0ZXJkYXkuIDotKSBCdXQg
d2hhdGV2ZXIsIG5vdCB0aGF0IGltcG9ydGFudC4KPiAKPiBXZSdsbCBqdXN0IGhhdmUgdG8gZW5z
dXJlIHdlIHBpbmcgc3RhYmxlIG9uIGl0IHdoZW4gaXQgZ29lcyBpbi4KCklmIHlvdSBoYXZlIGEg
Z2l0IGlkIHRoYXQgaXMgbm90IGdvaW5nIHRvIGNoYW5nZSwgSSBjYW4gd2F0Y2ggb3V0IGZvciBp
dAp0byBsYW5kIGluIExpbnVzJ3MgdHJlZS4uLgoKdGhhbmtzLAoKZ3JlZyBrLWgKPC9ibG9ja3F1
b3RlPjwvYm9keT48L2h0bWw+

--===============5619293099550330100==--

--===============8613851044760371948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

R29vZCBEYXksICAKSW4gY2FzZSB5b3UgaGF2ZSBpbnF1aXJpZXMgcmVnYXJkaW5nIHRoZSBidXNp
bmVzcyBwcmVzZW50YXRpb24sIHBsZWFzZSByZW1lbWJlciB0byBjb250YWN0IG1lLiAgClNFRSBE
QVRBICAKTWFueSBUaGFua3MsCgrCoA==

--===============8613851044760371948==--

--===============4935789384317118248==--
