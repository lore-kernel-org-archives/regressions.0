Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322B03B1B3
	for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 00:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787703836; cv=none; b=tfKw5skSO8IAPQ+D/yHIVj60tV0I8QOCcCFSYn4rsLwwF0qQ2wajAfXkP+u9tmmH+LAaIursJVgtrh9b4NvbI7GkX0jc/OSYuzRo1ib5my0dEwl5ISeNe1pHz4ZNR5VX33wDucGdpNtOEOQmCmQqwSfWGk/29IKTPE5Vd5CgrR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787703836; c=relaxed/simple;
	bh=8wu0zwO/+fvrj3+ENKIuk2JDtYFbwkNND81ZqA6vKj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XC8XnkeNm5/QQTIaQM0zSzGqQ1VrGospg7Dnftowj+YBudHSAiZ6+u0IEKCWpCmEirn0ZuikoOSGtTVcAJy9F/f6nnMW1qbSnTmE8rJaglnf8lAVHtgi2X8B2Voy5YnHgVxP6ji0U6EqJQrhTDMO9LjNVjyF81ANkheomDFZqB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNi8rtEH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNi8rtEH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC7F1F00A3D
	for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 00:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787703835;
	bh=uUTmiHFEOceLcx9itCYMJtIGYFbMp7iKyog+97ymqj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WNi8rtEHOpv6c5q+N+tg2xIhLjQjOyGzIMxMZMW0sc3bpo2s/dU7+NuyxOwoVYRal
	 4M4tuq2xyGOxYQpTsA0pzm3TpkiWOrQw+F83ajnPAOroSHnMP0SJAm7oU6R+WV3O+4
	 TI6alN6C57pYasJ0YZOXCEQID6Su0BrCcHzGxy/F+IglO0Rekmfyeonm4GPTUdTPSv
	 ABRrEGgkXjVrrfZPTyVINvP2A5vl51GyM5+Ck9yluLF305lcxm47KIUMakUJC1wd4y
	 i9exey4lrUemz/+SoNulVpozyHRjdu/OOOeQGwGZCjF+SwSMWRuPPpLtl7ctr2uVNn
	 dhVdyDtDLx8hA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso525505a12.3
        for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 17:23:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoDLaJBf2rbdLxn3jfiCJv9KKCDn8xmxTPSl4pnQhMrGGjex5unMpsa/cD9QqK84PEioaLJRr+wLxmvsg==@lists.linux.dev
X-Gm-Message-State: AFuF++ksDo0DrI8//+TNwDS3bxfZuvVQMI5EQ9Im5rNbFkUgifLmDzHV
	NctVym4DWKxI5FGC1hg9HL4Mg3hXWn97dH/La98TQVFgTDmg6B/9NdHpM1lQdXNeipaGuv2RltQ
	I4oCkyKkpY6Y5GKpYEvUmv6fXqZq+HbY=
X-Received: by 2002:a05:6402:a0d9:b0:6a1:2863:ad75 with SMTP id
 4fb4d7f45d1cf-6a5df64d838mr2965272a12.13.1787703833588; Tue, 25 Aug 2026
 17:23:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ajQFErzQW4qfU_Cp@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
 <6a463902.41a38e5f.27f5bd.337a@mx.google.com> <akzN_iISxNTztbEw@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
 <20260825112755.GA62429@pevik> <ao2TtyQpCGP5TLpx@yuki.lan>
 <20260825132604.GA70046@pevik> <ao2cpyGYcL-rZLgc@yuki.lan>
In-Reply-To: <ao2cpyGYcL-rZLgc@yuki.lan>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 26 Aug 2026 09:23:39 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_3Za8Jzan9VV4WrK1ATB2WXTazLVuGJ5ViQ8RGp0xbLw@mail.gmail.com>
X-Gm-Features: AcwNN1UeAvkSqSZ2B8OwXMcLplrAMtwLAx7uHZMrWWrrghcYdk3dsO2C_j9V2AY
Message-ID: <CAKYAXd_3Za8Jzan9VV4WrK1ATB2WXTazLVuGJ5ViQ8RGp0xbLw@mail.gmail.com>
Subject: Re: [LTP] [PATCH v1 1/1] swap: Add exfat to filesystems requiring tst_fill_file
To: Cyril Hrubis <chrubis@suse.cz>
Cc: Petr Vorel <pvorel@suse.cz>, Jan Polensky <japo@linux.ibm.com>, ltp@lists.linux.it, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	Andrea Cervesato <andrea.cervesato@suse.com>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Yuezhang Mo <yuezhang.mo@sony.com>, Christoph Hellwig <hch@lst.de>, 
	"Darrick J . Wong" <djwong@kernel.org>
Content-Type: multipart/mixed; boundary="000000000000f737100659e83b24"

--000000000000f737100659e83b24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 10:46=E2=80=AFPM Cyril Hrubis <chrubis@suse.cz> wro=
te:
>
> Hi!
Hi Cyril, Petr,
> > > That does not make much sense, if swap_activate was added to kernel,
> > > pre-filling the fallocated file shouldn't be needed anymore.
> >
> > Good catch, you're right. I'm also confused, before v7.2 swap worked on=
 exfat,
> > now even with 82a81a7352bc ("exfat: add iomap buffered I/O support") [2=
]
> > and your fix 03a43677ca91 ("exfat: add swap_activate support") [3] is n=
ot
> > working. Obviously the fix was not good enough.
>
> There were two bugs I suppose, one is that fallocate() support for exfat =
broke
> the swapon on fallocated file. The second bug was introduced later when
> exfat was rewritten to use iomap. The iomap case was fixed in the patch
> above, however it looks like the original bug caused by fallocate()
> implementation for exfat is still there.
Can you check if an attached patch improves this issue?
Thanks.

--000000000000f737100659e83b24
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-exfat-map-allocated-extents-for-swap-activation.patch"
Content-Disposition: attachment; 
	filename="0001-exfat-map-allocated-extents-for-swap-activation.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mt9cmb1u0>
X-Attachment-Id: f_mt9cmb1u0

RnJvbSA1Njc5YTYyNDgxNjQ1NGM4ZTc2ODM4NDJlYjBhYjNmMWFkZjBkY2NhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOYW1qYWUgSmVvbiA8bGlua2luamVvbkBrZXJuZWwub3JnPgpE
YXRlOiBXZWQsIDI2IEF1ZyAyMDI2IDA5OjE0OjE0ICswOTAwClN1YmplY3Q6IFtQQVRDSF0gZXhm
YXQ6IG1hcCBhbGxvY2F0ZWQgZXh0ZW50cyBmb3Igc3dhcCBhY3RpdmF0aW9uCgpleEZBVCByZXBv
cnRzIGFsbG9jYXRlZCByYW5nZXMgYmV5b25kIHZhbGlkX3NpemUgYXMgSU9NQVBfSE9MRSB3aGVu
CklPTUFQX1JFUE9SVCBpcyBzZXQuIGlvbWFwX3N3YXBmaWxlX2FjdGl2YXRlKCkgYWxzbyB1c2Vz
IElPTUFQX1JFUE9SVAp3aGlsZSBjb2xsZWN0aW5nIHBoeXNpY2FsIGV4dGVudHMgZm9yIGEgc3dh
cCBmaWxlLCBzbyBpdCB0cmVhdHMgdGhlCnByZWFsbG9jYXRlZCB0YWlsIGFzIHVuYWxsb2NhdGVk
IGFuZCByZWplY3RzIHRoZSBmaWxlIHdpdGggLUVJTlZBTC4KClVzZSBzd2FwLXNwZWNpZmljIGlv
bWFwIG9wZXJhdGlvbnMgdGhhdCBzdXBwcmVzcyBJT01BUF9SRVBPUlQgYmVmb3JlCm1hcHBpbmcg
dGhlIGZpbGUuIFRoaXMgcmVwb3J0cyBwaHlzaWNhbGx5IGFsbG9jYXRlZCByYW5nZXMgYXMKSU9N
QVBfVU5XUklUVEVOIGR1cmluZyBzd2FwIGFjdGl2YXRpb24gd2l0aG91dCBjaGFuZ2luZyB0aGUK
Ynl0ZS1hY2N1cmF0ZSBTRUVLX0hPTEUgYW5kIFNFRUtfREFUQSBiZWhhdmlvciBvZiB0aGUgcmVn
dWxhciBpb21hcApvcGVyYXRpb25zLgoKRml4ZXM6IDAzYTQzNjc3Y2E5MSAoImV4ZmF0OiBhZGQg
c3dhcF9hY3RpdmF0ZSBzdXBwb3J0IikKU2lnbmVkLW9mZi1ieTogTmFtamFlIEplb24gPGxpbmtp
bmplb25Aa2VybmVsLm9yZz4KLS0tCiBmcy9leGZhdC9pb21hcC5jIHwgMTkgKysrKysrKysrKysr
KysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9mcy9leGZhdC9pb21hcC5jIGIvZnMvZXhmYXQvaW9tYXAuYwppbmRleCAw
YzgwNWJmNjY3NmEuLmJmOGJhZjc4YTliOCAxMDA2NDQKLS0tIGEvZnMvZXhmYXQvaW9tYXAuYwor
KysgYi9mcy9leGZhdC9pb21hcC5jCkBAIC0xNTUsNiArMTU1LDIyIEBAIGNvbnN0IHN0cnVjdCBp
b21hcF9vcHMgZXhmYXRfaW9tYXBfb3BzID0gewogCS5pb21hcF9iZWdpbiA9IGV4ZmF0X2lvbWFw
X2JlZ2luLAogfTsKIAorc3RhdGljIGludCBleGZhdF9zd2FwX2lvbWFwX2JlZ2luKHN0cnVjdCBp
bm9kZSAqaW5vZGUsIGxvZmZfdCBvZmZzZXQsCisJCWxvZmZfdCBsZW5ndGgsIHVuc2lnbmVkIGlu
dCBmbGFncywgc3RydWN0IGlvbWFwICppb21hcCwKKwkJc3RydWN0IGlvbWFwICpzcmNtYXApCit7
CisJLyoKKwkgKiBTd2FwIGFjdGl2YXRpb24gbmVlZHMgdGhlIHBoeXNpY2FsIG1hcHBpbmdzIG9m
IHByZWFsbG9jYXRlZAorCSAqIHJhbmdlcy4gRG8gbm90IHJlcG9ydCB0aGUgVkRMIHRhaWwgYXMg
YSBob2xlLgorCSAqLworCXJldHVybiBfX2V4ZmF0X2lvbWFwX2JlZ2luKGlub2RlLCBvZmZzZXQs
IGxlbmd0aCwKKwkJCWZsYWdzICYgfklPTUFQX1JFUE9SVCwgaW9tYXAsIGZhbHNlKTsKK30KKwor
c3RhdGljIGNvbnN0IHN0cnVjdCBpb21hcF9vcHMgZXhmYXRfc3dhcF9pb21hcF9vcHMgPSB7CisJ
LmlvbWFwX2JlZ2luID0gZXhmYXRfc3dhcF9pb21hcF9iZWdpbiwKK307CisKIC8qCiAgKiBleGZh
dF93cml0ZV9pb21hcF9lbmQgLSBVcGRhdGUgdGhlIHN0YXRlIGFmdGVyIHdyaXRlCiAgKgpAQCAt
Mjc0LDUgKzI5MCw2IEBAIGNvbnN0IHN0cnVjdCBpb21hcF9yZWFkX29wcyBleGZhdF9pb21hcF9i
aW9fcmVhZF9vcHMgPSB7CiBpbnQgZXhmYXRfaW9tYXBfc3dhcF9hY3RpdmF0ZShzdHJ1Y3Qgc3dh
cF9pbmZvX3N0cnVjdCAqc2lzLAogCQkJICAgICAgIHN0cnVjdCBmaWxlICpmaWxlLCBzZWN0b3Jf
dCAqc3BhbikKIHsKLQlyZXR1cm4gaW9tYXBfc3dhcGZpbGVfYWN0aXZhdGUoc2lzLCBmaWxlLCBz
cGFuLCAmZXhmYXRfaW9tYXBfb3BzKTsKKwlyZXR1cm4gaW9tYXBfc3dhcGZpbGVfYWN0aXZhdGUo
c2lzLCBmaWxlLCBzcGFuLAorCQkJCSAgICAgICAmZXhmYXRfc3dhcF9pb21hcF9vcHMpOwogfQot
LSAKMi4zNC4xCgo=
--000000000000f737100659e83b24--
