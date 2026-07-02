Received: from zmailpro.com (zmailpro.com [174.129.240.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DDB30C37A
	for <regressions@lists.linux.dev>; Thu,  2 Jul 2026 15:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=174.129.240.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007152; cv=none; b=aN8ZAY2hkBvYLELDbuzxiO30C1W3iQJZxXhdMpVIGotoP9jYY7K0VsOlqLjBu/6JonBaInUa1bXC5rCRN6dL2DelXJq6b6X8UA0PagTuTxSxcMFr3t0ZUtxxNdQgzCZt2s7npuqrspGiGJ3H1gMLvmAjEcI0eH/1OVETWNMIaJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007152; c=relaxed/simple;
	bh=RtjhN4hzzUcgdFyzNrzwF/kg6AW9MyBHZxzUuimsCEU=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=ob+zgzye7JIvTw51GP3y0yYybxBPCy0M8Kp7rsPxBsL3rwEOBtEYx4GwvNCXuU8/BezEcT6IPjNCrvOBdVOckJ3irPJHhHfhEJI61/rf2FxtRknhB1+lJtitgMnpeeU4qS6l7Ya9GwVrFVeaThIOF17+zjNxwygcDf99yMeyU+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deeplearntech.com; spf=pass smtp.mailfrom=lhjonline.com; dkim=pass (2048-bit key) header.d=deeplearntech.com header.i=@deeplearntech.com header.b=PNG7cuOX; arc=none smtp.client-ip=174.129.240.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deeplearntech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lhjonline.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deeplearntech.com header.i=@deeplearntech.com header.b="PNG7cuOX"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zmailpro.com (Postfix) with ESMTP id 812B88EDC47;
	Thu,  2 Jul 2026 11:36:21 -0400 (EDT)
Received: from zmailpro.com ([127.0.0.1])
 by localhost (zmailpro.com [127.0.0.1]) (amavis, port 10032) with ESMTP
 id xUs2QFPxW_UB; Thu,  2 Jul 2026 11:36:20 -0400 (EDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zmailpro.com (Postfix) with ESMTP id 8E61F8EDC48;
	Thu,  2 Jul 2026 11:36:20 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmailpro.com 8E61F8EDC48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=deeplearntech.com;
	s=E11F0DAC-414D-11E7-97F0-308B22DE3479; t=1783006580;
	bh=RtjhN4hzzUcgdFyzNrzwF/kg6AW9MyBHZxzUuimsCEU=;
	h=From:Mime-Version:Date:Message-Id:To;
	b=PNG7cuOXPRlpsCXQC13h4Gz/obnw4yKDQopuZ8Q7zBLJI9BwKg/+6UI03XNMVVqLB
	 D3xzFQm0rDl976obCmpUtMPkRgDfLoil6+AWBu5TcFALCoa7Sw4zccOpkSvCmPnkO8
	 XsCd79S+xJU5/weQpEGlaaaKM/dZ3dNZ69ctnaOSh6WZ4nra2Bh6wczTcHZD4XaAXF
	 duiMRBq+o8peX30bTV6Y5NotLbjYfEs2yVEbppbt0+DiOVM2dOSaQq2LheyibH+Nhu
	 LZCXWD6G1Fvm1ybO/2uSH9U3MFAesOOJ7xGYJHqPXu0M9hd01QF6dDU8rVOh4/1eHa
	 3Fsiv0XbgSS5Q==
X-Virus-Scanned: amavis at zmailpro.com
Received: from zmailpro.com ([127.0.0.1])
 by localhost (zmailpro.com [127.0.0.1]) (amavis, port 10026) with ESMTP
 id Rwmb9SNgP1ch; Thu,  2 Jul 2026 11:36:20 -0400 (EDT)
Received: from zmailpro.com (zmailpro.com [174.129.240.60])
	by zmailpro.com (Postfix) with ESMTP id 6398F8EDC46;
	Thu,  2 Jul 2026 11:36:20 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: base64
From: Harris Landgarten <harrisl@deeplearntech.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Subject: Re: [BUG] linux-firmware-amdgpu 20260622 prevents clean poweroff on AMD RX 6800
Date: Thu, 2 Jul 2026 11:36:19 -0400 (EDT)
Message-Id: <1337579792.18818.1783006579737.JavaMail.zimbra@zmailpro>
References: <64546a50-5593-4083-aaa7-6f772f8c81b5@leemhuis.info>
Cc: IT4roundtheW0rd <IT4roundtheW0rd@protonmail.com>, linux-firmware@kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	Alex Deucher <alexander.deucher@amd.com>, 
	=?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	amd-gfx@lists.freedesktop.org
In-Reply-To: <64546a50-5593-4083-aaa7-6f772f8c81b5@leemhuis.info>
To: Thorsten Leemhuis <regressions@leemhuis.info>
X-ZxMobile-Command: SmartReply
X-ZxMobile-Version: 3.20.0
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927
Thread-Topic: linux-firmware-amdgpu 20260622 prevents clean poweroff on AMD RX 6800
Thread-Index: Pp2FXLDtWZLWhI2Pyw2GKLf8ubymbg==

SXQgaXMgdW5saWtlbHkgdGhhdCBpdCBpcyB0aGUgZmlybXdhcmUuIEkgaGFkIHRoZSBzYW1lIGlz
c3VlIGFuZCBpdCBzdGFydGVkIHdpdGggNy4xLXJjMi4gSSBhbSBydW5uaW5nIGdmeDExNTAuIFRo
ZSBpc3N1ZSBhcHBlYXJzIHRvIGhhdmUgYmVlbiBmaXhlZCBieSA3LjItcmMxDQpTZW50IGZyb20g
bXkgaVBob25lDQoNCj4gT24gSnVsIDIsIDIwMjYsIGF0IDQ6MDfigK9BTSwgVGhvcnN0ZW4gTGVl
bWh1aXMgPHJlZ3Jlc3Npb25zQGxlZW1odWlzLmluZm8+IHdyb3RlOg0KPiANCj4g77u/W2FkZGlu
ZyBhIGZldyBwZW9wbGUgdG8gdGhlIENDXQ0KPiANCj4gT24gNi8yNy8yNiAwMjo0MiwgSVQ0cm91
bmR0aGVXMHJkIHdyb3RlOg0KPiA+DQo+ID4gSSdkIGxpa2UgdG8gcmVwb3J0IGEgcmVncmVzc2lv
biBpbiBsaW51eC1maXJtd2FyZS1hbWRncHUgaW50cm9kdWNlZCB3aXRoDQo+ID4gdGhlIDIwMjYw
NjIyIHJlbGVhc2UuDQo+ID4NCj4gPiAqU3lzdGVtOioNCj4gPiAtIERpc3RybzogQ2FjaHlPUw0K
PiA+IC0gS2VybmVsOiA3LjEuMS0yLWNhY2h5b3MNCj4gPiAtIEdQVTogQU1EIFJYIDY4MDAtc2Vy
aWVzDQo+ID4gLSBCb290bG9hZGVyOiBHUlVCDQo+ID4NCj4gPiAqUHJvYmxlbToqDQo+ID4gQWZ0
ZXIgdXBkYXRpbmcgbGludXgtZmlybXdhcmUtYW1kZ3B1IGZyb20gMToyMDI2MDUxOS0xIHRvIDE6
MjAyNjA2MjItMSwNCj4gPiB0aGUgc3lzdGVtIG5vIGxvbmdlciBzaHV0cyBkb3duIGNvbXBsZXRl
bHkgd2hlbiBydW5uaW5nIGBwb3dlcm9mZmAuDQo+ID4gRmFucywga2V5Ym9hcmQgTEVEcywgYW5k
IHBvd2VyIGJ1dHRvbiBMRUQgcmVtYWluIGFjdGl2ZSBhZnRlciB0aGUNCj4gPiBzaHV0ZG93biBz
ZXF1ZW5jZS4gVGhlIHN5c3RlbSBoYW5ncyBhZnRlciAiU2VuZGluZyBTSUdURVJNIHRvIHJlbWFp
bmluZw0KPiA+IHByb2Nlc3Nlcy4uLiIgYW5kIG5ldmVyIHJlYWNoZXMgZnVsbCBwb3dlci1vZmYg
KEFDUEkgKlM1KS4qDQo+IA0KPiBBIGZldyBxdWVzdGlvbnM6DQo+IA0KPiAqIFdoaWNoIGZpcm13
YXJlIGZpbGVzIGRvZXMgeW91ciBHUFUgdXNlIGV4YWN0bHkgKGEgZnVsbCBkbWVzZyBsb2cNCj4g
c2hvdWxkIGFuc3dlciB0aGlzKQ0KPiAqIERvZXMgdGhlIHByb2JsZW0gaGFwcGVuIHdpdGggYSB2
YW5pbGxhIGtlcm5lbCBhcyB3ZWxsIChpdCBtb3N0IGxpa2VseQ0KPiB3aWxsLCBidXQgd291bGQg
YmUgZ29vZCB0byBjb25maXJtLCBhcyBoZWF2aWx5IHBhdGNoZWQgdmVuZG9yIGtlcm5lbHMNCj4g
Y2FuIGxlYWQgdG8gYWxsIHNvcnQgb2YgaXNzdWVzKS4NCj4gDQo+IENpYW8sIFRob3JzdGVuDQo+
IA0KPiA+ICpSZWxldmFudCBsb2cgZXhjZXJwdCAoam91cm5hbGN0bCAtYiAtMSk6Kg0KPiA+DQo+
ID4gICAgIEp1biAyNyAwMjowNDoxNCBjYWNoeW9zIHN5c3RlbWQtc2h1dGRvd25bMV06IFNlbmRp
bmcgU0lHVEVSTSB0bw0KPiA+IHJlbWFpbmluZyBwcm9jZXNzZXMuLi4NCj4gPg0KPiA+IChubyBm
dXJ0aGVyIGVudHJpZXMg4oCUIHN5c3RlbSBoYW5ncyBoZXJlKQ0KPiA+DQo+ID4gKldvcmthcm91
bmQ6Kg0KPiA+IERvd25ncmFkaW5nIHRvIGxpbnV4LWZpcm13YXJlLWFtZGdwdSAxOjIwMjYwNTE5
LTEgcmVzb2x2ZXMgdGhlIGlzc3VlDQo+ID4gY29tcGxldGVseS4NCj4gPg0KPiA+ICpTdGVwcyB0
byByZXByb2R1Y2U6Kg0KPiA+IDEuIFVwZGF0ZSBsaW51eC1maXJtd2FyZS1hbWRncHUgdG8gMToy
MDI2MDYyMi0xDQo+ID4gMi4gUnVuIGBwb3dlcm9mZmANCj4gPiAzLiBTeXN0ZW0gaGFuZ3Mg4oCU
IHBvd2VyIGlzIG5vdCBjdXQNCj4gPg0KPiA+ICpBZGRpdGlvbmFsIG5vdGVzOioNCj4gPiBUaGUg
cm9vdCBjYXVzZSBhcHBlYXJzIHRvIGJlIHRoYXQgdGhlIG5ldyBmaXJtd2FyZSBibG9iIHByZXZl
bnRzIHRoZQ0KPiA+IGFtZGdwdSBkcml2ZXIgZnJvbSBjbGVhbmx5IHJlbGVhc2luZyB0aGUgR1BV
IGJlZm9yZSB0aGUgQUNQSSBTNSBwb3dlcg0KPiA+IHN0YXRlIHRyYW5zaXRpb24uIE5vIG90aGVy
IHBhY2thZ2VzIHdlcmUgdXBkYXRlZCBpbiB0aGUgc2FtZSB0cmFuc2FjdGlvbg0KPiA+IHRoYXQg
Y291bGQgZXhwbGFpbiB0aGlzIGJlaGF2aW9yLg0KPiA+DQo+ID4gVGhpcyBpc3N1ZSB3YXMgcmVz
ZWFyY2hlZCBhbmQgdGhpcyByZXBvcnQgd2FzIGRyYWZ0ZWQgd2l0aCB0aGUNCj4gPiBhc3Npc3Rh
bmNlIG9mIENsYXVkZSAoQW50aHJvcGljIEFJKS4NCj4gPg0KPiA+IEJlc3QgcmVnYXJkcywNCj4g
Pg0KPiA+IEJlbmphbWluIE1hYXMgDQo+IA0K
