Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86F937A487
	for <regressions@lists.linux.dev>; Wed, 22 Jul 2026 10:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716670; cv=none; b=hiGD5qy2RAiVAtj5pSMJ21xONFZdGIHwqEd+AB6ZmIbCArZqQP5BIm7cZ1TLyuziHaarct3YrBpgnOjjTAu7fbjbe2tTHvggH5b7zAuMm+2hrKjW3ggzOBhsZMtrvBEQnnC43CHqBmFR3b+s/vq4De7DzN70yQBlxi2LWIFmoeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716670; c=relaxed/simple;
	bh=OpLSq6kMn+7e8Y64iijG0Abs08qWe44S0vppPIbTksI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=CxIJOxroyf/4ueodsV4xzYHzVWJjw/+rb5WUUL6jwlAiWp2tIykWjCdBmvLs/danfWnU/MlCCsX5gSfkmIaWHjpyadJfKGv4LY51zh8X9NuzMrpaeuFoNIgyJ4Q4j+7wOHvHZudZi+tknJc4j/uYahEvUn+ooB06HUygf1YeAcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.xmu.edu.cn; spf=pass smtp.mailfrom=stu.xmu.edu.cn; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.xmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xmu.edu.cn
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-7 (Coremail) with UTF8SMTP id AQAAfwBnYGxsnWBq7+pIAQ--.25198S2;
	Wed, 22 Jul 2026 18:37:32 +0800 (CST)
Received: from chengfenglin$stu.xmu.edu.cn ( [23.249.17.30] ) by
 ajax-webmail-mail (Coremail) ; Wed, 22 Jul 2026 18:37:30 +0800 (GMT+08:00)
Date: Wed, 22 Jul 2026 18:37:30 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Chengfeng Lin" <chengfenglin@stu.xmu.edu.cn>
To: "Dev Jain" <dev.jain@arm.com>
Cc: "Pedro Falcato" <pfalcato@suse.de>,
	"Andrew Morton" <akpm@linux-foundation.org>, linux-mm@kvack.org,
	"Liam R. Howlett" <liam@infradead.org>,
	"Lorenzo Stoakes" <ljs@kernel.org>,
	"Vlastimil Babka" <vbabka@kernel.org>,
	"Jann Horn" <jannh@google.com>, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] mm/mprotect: shared-dirty base-page toggle slower
 since v6.17
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2025.3-cmXT6 build
 20260202(ad063891) Copyright (c) 2002-2026 www.mailtech.cn OP_ICM_ICMVM
In-Reply-To: <dc402537-1527-4433-839e-960b6eb32bc4@arm.com>
References: <7c9eeb21.1c04f.19efaacbb2f.Coremail.chengfenglin@stu.xmu.edu.cn>
 <433d619a.1e8a6.19f1d4d1be6.Coremail.chengfenglin@stu.xmu.edu.cn>
 <6c8d9b6c.24a8b.19f84afccdd.Coremail.chengfenglin@stu.xmu.edu.cn>
 <dc402537-1527-4433-839e-960b6eb32bc4@arm.com>
X-CM-CTRLMSGS: =?B?WG2ENDiH6nJ5xwDR7hwMki1N8jM=
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <4dceab6f.24e3b.19f8966e8ed.Coremail.chengfenglin@stu.xmu.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:AQAAfwAXMvNqnWBqIlPHAA--.15404W
X-CM-SenderInfo: astqjiysvrikiuszmqhvwxh5lpxovvfxof0/1tbiAQAQEGpf17YCF
	wACsC
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=chengfengl
	in@stu.xmu.edu.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7KFW7KFyxuw45Zr1UCr47CFg_yoW8ZFW8pF
	W3K3WSkr4DGwn7tasFya18CF4rGws7X3yqqr98KrWUZw45GF9FyFySyr40gw4xCrnYgw1I
	vr4Dtw4DJF4DZaDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
	UUUUU

SGksCgpTb3JyeSB0aGF0IG15IGVhcmxpZXIgbWVzc2FnZSB3YXMgZGlmZmljdWx0IHRvIGZvbGxv
dy4KClRoZSBwcmV2aW91cyBleGFjdCBwYXJlbnQvY2hpbGQgdGVzdCBzaG93ZWQgdGhhdCBjYWMx
ZGI4YzNhYWQgc2xvd2VkIHRoaXMKd29ya2xvYWQgYnkgMzkuNzclLiBUbyBhbnN3ZXIgeW91ciBx
dWVzdGlvbiBkaXJlY3RseTogbm8uIEluIGEgc2VwYXJhdGUKbWF0Y2hlZCB2Ny4xLjMgcGF0Y2gt
b24vcGF0Y2gtb2ZmIHRlc3QsIFBlZHJvJ3MgZnVsbCB2MyBzZXJpZXMgd2FzIDYuMjAlCnNsb3dl
ciB0aGFuIHRoZSBuby12MyBjb250cm9scywgc28gaXQgZGlkIG5vdCByZWR1Y2UgdGhlIHNsb3dk
b3duIGluIHRoaXMKd29ya2xvYWQuCgpJIGFsc28gY2hlY2tlZCBmb3IgYW4gdXBkYXRlLiBUaGUg
bGF0ZXN0IHB1YmxpYyByZXZpc2lvbiBJIGZvdW5kIGlzIHN0aWxsIHYzLAphbmQgaXQgaXMgYWxy
ZWFkeSBpbmNsdWRlZCBpbiBMaW51eCB2Ny4xLjMuCgpUbyBpc29sYXRlIHRoZSBzZXJpZXMsIEkg
dXNlZCB0aGUgc2FtZSB2Ny4xLjMgc291cmNlIGZvciBib3RoIGtlcm5lbHMuIFRoZQpuby12MyBr
ZXJuZWwgcmVwbGFjZXMgb25seSBtbS9tcHJvdGVjdC5jIHdpdGggdGhlIGV4YWN0IHByZS1zZXJp
ZXMgZmlsZSBhdAoxOTk5OWU0NzljMmEuIFRoZSBmdWxsLXYzIGtlcm5lbCBpcyB1bm1vZGlmaWVk
IHY3LjEuMyBhbmQgbWF0Y2hlcyB0aGUgc2VyaWVzCnRpcCBhdCA4OWU2MTNiYzBiMmQuIFRoZSBu
b3JtYWxpemVkIGNvbmZpZ3MgYW5kIGFsbCBvdGhlciBidWlsZCBjb25kaXRpb25zCndlcmUgdGhl
IHNhbWUuCgpJIHVzZWQgYSBmcmVzaCBib290IGZvciBldmVyeSBwb2ludDoKCiAgcG9pbnQgICAg
ICAgbWVhbiBucy9wYWdlCiAgbm8tdjMgQSAgICAgICAgICA1NS4zMzMKICBmdWxsIHYzICAgICAg
ICAgIDU4LjIwMAogIG5vLXYzIEIgICAgICAgICAgNTQuMjY3CgpUaGUgbm8tdjMgbWlkcG9pbnQg
d2FzIDU0LjgwMCBucy9wYWdlLiBGdWxsIHYzIHdhcyA2LjIwJSBzbG93ZXIgdGhhbiB0aGF0Cm1p
ZHBvaW50LiBUaGUgdHdvIGNvbnRyb2xzIGRyaWZ0ZWQgYnkgLTEuOTMlLiBEcm9wcGluZyB0aGUg
Zmlyc3QgbWVhc3VyZWQgcnVuCmZyb20gZXZlcnkgcG9pbnQgbGVmdCB0aGUgdjMgZGVsdGEgYXQg
KzYuMTglLgoKVGhpcyB3YXMgdGhlIHNhbWUgbmFycm93IHN0YW5kYWxvbmUgd29ya2xvYWQ6IGEg
NjQgTWlCIHNoYXJlZCBhbm9ueW1vdXMKbWFwcGluZywgZGlydHkgNCBLaUIgcGFnZXMsIGFuZCBy
ZXBlYXRlZCBmdWxsLXJhbmdlIHJlYWQtb25seSwgcmVzdG9yZSwgYW5kCndyaXRlLXRvdWNoIGN5
Y2xlcy4gRWFjaCBwb2ludCBoYWQgMyB3YXJtLXVwIHByb2Nlc3NlcyBhbmQgMTUgbWVhc3VyZWQK
cHJvY2Vzc2VzOyBlYWNoIG1lYXN1cmVkIHByb2Nlc3MgcmFuIDEsMDAwIGN5Y2xlcy4gVGhlIGJl
bmNobWFyayB3YXMgcGlubmVkIHRvCm9uZSBQLWNvcmUgd2l0aCBUdXJibyBkaXNhYmxlZCBhbmQg
cHJlZW1wdD1ub25lLgoKQWxsIDQ1IG1lYXN1cmVkIHByb2Nlc3NlcyBwYXNzZWQgdGhlIHJldHVy
bmVkLXZhbHVlIGNoZWNrcyBhbmQgc3RheWVkIG9uIDQgS2lCCnBhZ2VzIHdpdGggbm8gVEhQLiBU
aGUgcHJvdGVjdCBhbmQgcmVzdG9yZSBwaGFzZXMgd2VyZSBlYWNoIGFib3V0IDIzIG5zL3BhZ2UK
d2l0aCB2MyBhbmQgMjEgbnMvcGFnZSB3aXRob3V0IHYzLiBUaGUgbGF0ZXIgd3JpdGUtdG91Y2gg
cGhhc2Ugd2FzIHVuY2hhbmdlZC4KClNvLCBmb3IgdGhpcyBzcGVjaWZpYyBtaWNyb2JlbmNobWFy
ayBvbiB0aGlzIG1hY2hpbmUsIFBlZHJvIHYzIGRpZCBub3QgcmVkdWNlCnRoZSBzbG93ZG93bi4g
SXQgcHJvZHVjZWQgYSBzbWFsbCBzbG93ZG93biBpbnN0ZWFkLiBJIGFtIG5vdCBtYWtpbmcgYSBj
bGFpbQphYm91dCBvdGhlciBtcHJvdGVjdCBwYXR0ZXJucyBvciBhcHBsaWNhdGlvbi1sZXZlbCBw
ZXJmb3JtYW5jZS4gTXkgZWFybGllcgpRRU1VIHJlc3VsdCB0aGF0IHN1Z2dlc3RlZCBhIHBhcnRp
YWwgaW1wcm92ZW1lbnQgc2hvdWxkIG5vdCBiZSB1c2VkLgoKVGhhbmtzLApDaGVuZ2ZlbmcKCg==

