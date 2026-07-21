Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2382821255A
	for <regressions@lists.linux.dev>; Tue, 21 Jul 2026 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637554; cv=none; b=PlbVaHdmuab5sPH4wPNBIeLDfT6hp8y1LacCq0SKJh9kYRYH4QiIk+Sj50ssu00D/hn0Qp6yZt6Q+XUsO9HBrH8bKdfQEuigvkLUDCCxMZQhkvm3qFbayZWf4i0KDJoXHWzW/P/BGhLwnK1mKVYgoDMflAMLS3KqEh53rVg7S/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637554; c=relaxed/simple;
	bh=J9o7MHeYrhqvMtTxAxjODO81wUU1IlSjmrdACYphAuk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=grXXc1GOJMDZHQ7KLvUqMC8E/IEwjr+ojlfpI3S09P8uGZE8y796ufEil2xwT5tW7Abnhf8u7jGncBVQCUKJj/J6vSw6VwQF8c8n9ZcQqsP6ubUOieFqyq0ekvJ6SANVavDYsRL3RVPcVETb0cvYuQb8sTJACVKwJH6clyXtoCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.xmu.edu.cn; spf=pass smtp.mailfrom=stu.xmu.edu.cn; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.xmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xmu.edu.cn
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-7 (Coremail) with UTF8SMTP id AQAAfwAX+UFpaF9qCBUjAQ--.40501S2;
	Tue, 21 Jul 2026 20:39:05 +0800 (CST)
Received: from chengfenglin$stu.xmu.edu.cn ( [23.249.17.80] ) by
 ajax-webmail-mail (Coremail) ; Tue, 21 Jul 2026 20:39:01 +0800 (GMT+08:00)
Date: Tue, 21 Jul 2026 20:39:01 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Chengfeng Lin" <chengfenglin@stu.xmu.edu.cn>
To: "Pedro Falcato" <pfalcato@suse.de>,
	"Andrew Morton" <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: "Liam R. Howlett" <liam@infradead.org>,
	"Lorenzo Stoakes" <ljs@kernel.org>,
	"Vlastimil Babka" <vbabka@kernel.org>,
	"Jann Horn" <jannh@google.com>, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] mm/mprotect: shared-dirty base-page toggle slower
 since v6.17
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2025.3-cmXT6 build
 20260202(ad063891) Copyright (c) 2002-2026 www.mailtech.cn OP_ICM_ICMVM
In-Reply-To: <433d619a.1e8a6.19f1d4d1be6.Coremail.chengfenglin@stu.xmu.edu.cn>
References: <7c9eeb21.1c04f.19efaacbb2f.Coremail.chengfenglin@stu.xmu.edu.cn>
 <433d619a.1e8a6.19f1d4d1be6.Coremail.chengfenglin@stu.xmu.edu.cn>
X-CM-CTRLMSGS: =?B?+TW9bjiH6nJ5xwDR7hwMki1N8jM=
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <6c8d9b6c.24a8b.19f84afccdd.Coremail.chengfenglin@stu.xmu.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:AQAAfwAXMvNlaF9qBIjCAA--.14436W
X-CM-SenderInfo: astqjiysvrikiuszmqhvwxh5lpxovvfxof0/1tbiAQALEGpZQDgCZ
	QAFsz
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=chengfengl
	in@stu.xmu.edu.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7uw1DWry7WF1rXw17Gw4rXwb_yoW8Cw1DpF
	ZxCry5Gr4kCw1jy392van7WrWrCr93Ja15Jrs5K34xZas8GF9FyrWSy3W8ZF4jgr10v34Y
	vrs8Kw17Jrs8uaUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
	UUUUU

SGksCgpKdXN0IGEgZ2VudGxlIHBpbmcsIHdpdGggcmVzdWx0cyBmcm9tIGFuIGV4YWN0IGNvbW1p
dC1sZXZlbCBjaGVjay4KCkkgdGVzdGVkIGNhYzFkYjhjM2FhZCAoIm1tOiBvcHRpbWl6ZSBtcHJv
dGVjdCgpIGJ5IFBURSBiYXRjaGluZyIpCmFnYWluc3QgaXRzIGRpcmVjdCBwYXJlbnQgNDUxOTlm
NzE1Yjc0LiBFYWNoIHBvaW50IHVzZWQgYSBmcmVzaCBib290OgoKICA0NTE5OWY3MTViNzQgcGFy
ZW50IEEgLT4gY2FjMWRiOGMzYWFkIGNoaWxkIC0+CiAgNDUxOTlmNzE1Yjc0IHBhcmVudCBCCgpJ
IHVzZWQgdGhlIHNhbWUgbmFycm93IDY0IE1pQiBzaGFyZWQtZGlydHkgNCBLaUIgYmFzZS1wYWdl
IHRvZ2dsZQp3b3JrbG9hZCBmcm9tIHRoZSByZXBvcnQuIEVhY2ggcG9pbnQgaGFkIDMgd2FybS11
cCBwcm9jZXNzZXMgYW5kCjE1IG1lYXN1cmVkIHByb2Nlc3Nlcy4gRWFjaCBtZWFzdXJlZCBwcm9j
ZXNzIHJhbiAxLDAwMCBpdGVyYXRpb25zLgpUaGUgcHJpbWFyeSByZXN1bHQsIGl0ZXJhdGlvbl9u
c19wZXJfcGFnZSAobG93ZXIgaXMgYmV0dGVyKSwgd2FzOgoKICBwb2ludCAgICAgICBtZWFuIG5z
L3BhZ2UgICAgU0QKICBwYXJlbnQgQSAgICAgICAgICAzOC4xMzMgIDAuNzQzCiAgY2hpbGQgICAg
ICAgICAgICAgNTMuNTMzICAwLjUxNgogIHBhcmVudCBCICAgICAgICAgIDM4LjQ2NyAgMC42NDAK
ClRoZSBwYXJlbnQgbWlkcG9pbnQgd2FzIDM4LjMwMCBucy9wYWdlLiBUaGUgY2hpbGQgd2FzIDM5
Ljc3JSBzbG93ZXIsCndoaWxlIHBhcmVudCBCIGRpZmZlcmVkIGZyb20gcGFyZW50IEEgYnkgb25s
eSAwLjg3JS4gRHJvcHBpbmcgdGhlIGZpcnN0Cm1lYXN1cmVkIHByb2Nlc3MgZnJvbSBldmVyeSBw
b2ludCBsZWZ0IGEgMzkuNTMlIGNoaWxkIGRlbHRhLgoKQWxsIDQ1IG1lYXN1cmVkIHByb2Nlc3Nl
cyBwYXNzZWQgdGhlIHNlbWFudGljIGNoZWNrcyBhbmQgdXNlZCA0IEtpQgpwYWdlcyB3aXRoIG5v
IFRIUC4gVGhlIHByb3RlY3QgYW5kIHJlc3RvcmUgY29tcG9uZW50cyBlYWNoIGluY3JlYXNlZApm
cm9tIDEzIG5zL3BhZ2UgaW4gdGhlIHBhcmVudCBjb250cm9scyB0byAyMCBucy9wYWdlIGluIHRo
ZSBjaGlsZC4KVGhlIHBvc3QtdG91Y2ggY29tcG9uZW50IHN0YXllZCBjbG9zZSB0byAxMiBucy9w
YWdlLgoKVGhlIGV4YWN0IGNvbW1pdCBjaGFuZ2VzIG9ubHkgbW0vbXByb3RlY3QuYy4gQm90aCBr
ZXJuZWxzIHdlcmUgYnVpbHQgZnJvbQp0aGUgZXhhY3QgY29tbWl0cyB3aXRoIHRoZSBzYW1lIG5v
cm1hbGl6ZWQgY29uZmlnLCBHQ0MgMTUuMi4wLCBhbmQgS2J1aWxkCm1ldGFkYXRhLiBFdmVyeSBw
b2ludCB1c2VkIHRoZSBzYW1lIENQVSBzZXR0aW5ncyBhbmQgcnVudGltZSBwcmVlbXB0PW5vbmUu
CgpGb3IgdGhpcyBuYXJyb3cgd29ya2xvYWQsIHRoZSBleGFjdCBwYXJlbnQvY2hpbGQgcmVzdWx0
IGlkZW50aWZpZXMKY2FjMWRiOGMzYWFkIGFzIHRoZSBzb3VyY2Ugb2YgdGhlIG1lYXN1cmVkIHNs
b3dkb3duLiBJIGFtIG5vdCBjbGFpbWluZwphIGdlbmVyaWMgbXByb3RlY3QoKSBvciBhcHBsaWNh
dGlvbi1sZXZlbCByZWdyZXNzaW9uLgoKRXZpZGVuY2U6CgogIGh0dHBzOi8vZ2l0aHViLmNvbS9s
Y2YwMzk5L2xpbnV4LXJlZ3Jlc3Npb24tZXZpZGVuY2UvdHJlZS9hM2FlN2JmMWE1MGU0ZDg4YjU3
MmM2MDA1YTAzNzY3OTUzMGM5YjFmL21wcm90ZWN0LXNoYXJlZC1kaXJ0eS10b2dnbGUvYmFyZS1t
ZXRhbC8yMDI2MDcyMS1jYWMxZGI4YzNhYWQtZXhhY3QtYWIKCiNyZWd6Ym90IGludHJvZHVjZWQ6
IGNhYzFkYjhjM2FhZDk3ZDZmZmI1NmNlZDg4NjhkNmNiYmJkMmJmYmUKCklmIHVzZWZ1bCwgSSBj
YW4gc3RpbGwgY29sbGVjdCBhIHBlcmYgcHJvZmlsZSBvZiB0aGUgY2hpbGQgYXJvdW5kCmNoYW5n
ZV9wdGVfcmFuZ2UoKS4KClRoYW5rcywKQ2hlbmdmZW5nCg==

