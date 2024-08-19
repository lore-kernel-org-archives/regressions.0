Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3591E166F11
	for <regressions@lists.linux.dev>; Mon, 19 Aug 2024 11:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724067885; cv=none; b=p8Lv/2eFFD2MQyDscpYBL9RnV8deIVPd/Vl/xwA8JqzNOIDjZQ0g2FlUIMetLPLyk71PrjvGR+0iTVvLVszXG68Tm8t4wSARLgxijF79Yfe1SJUs59cAlxEp8bsECaFrCUvkj5LBOlEjgfqc718n+LM4rQzK+0vIP5k1803oozI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724067885; c=relaxed/simple;
	bh=3dm5jhhU1tb4Z93ZafF+6iMrIY69gXRErqdXw1h2T24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Od+XPIBB46oRcfFDidB9+rtYTCfNH/vRymwtfWT6F8sEs4SKfnB9iwHEt+i6q2zTWfucYyUEHsu5sgYoqNr88pMbSEETnAF2+aCe+0303FA7Nap+NT9qwOgk19w0FlYtpPgrU5QuKTqR9B5H8SvwZiI55l0jAD1nApaKjVzw6ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/cBwXKg; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/cBwXKg"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f3ce5bc7b4so18168191fa.2
        for <regressions@lists.linux.dev>; Mon, 19 Aug 2024 04:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724067882; x=1724672682; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=odjopEvwH67dxv9w6eekXOxb49yPm4nXGo4n1/uD+2g=;
        b=J/cBwXKg7CzSW31KTKpHWIQFjcHQNQG9KBBU1DLobOTC1bkzuTa720GhDmBcPfTtXM
         pfUeGk8GGCGFhyzJJ2m5cEhj1eEgIj6H47wqTd/sUapSLrEduIZy7nkI8WhTo1LnuqzV
         2Qck7eF+8NfQYTcxgWA4ubP9pnjFXqXD2ZAKa0QgffkKJYM6NTZ8rL9ofmfM3xtwdLTV
         S/hUXRijv+Ae2qS9bDfepmYnlDiQBGP48CTqrKqB9FsOpy2CeFf6NWF89e0z51G8ShaB
         ezYEj3NbZoReJSry3l8X+A3pENwoqTXe1Iz7YZ4gjhrdz417D3uGIEcPBTdmQNspCRIk
         Sgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724067882; x=1724672682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odjopEvwH67dxv9w6eekXOxb49yPm4nXGo4n1/uD+2g=;
        b=UahO8XE0KAOrw4N2vcpZ+Gx3owkGDPaAc+qmySPKbP0NY9l6XH1WSN7DgQLcmQI4eR
         ayiI8xs+kMSXLioaEb6Ll13qUtk6Dli+v+kIF/fWy/p0hJxwZk5pawk5WbxIXi4sBzIw
         m8VAvKSMvtdqCnpzOM5Wh0YWZkBPdXynuyGo9Xj45Sd9PR1wpnblY50IL28CpBBUfS9a
         /MAoOiXUOZ8aWRLKHF5IDcKTBxw9xqA6Wv8Qx94KHZDJqgGted5pLJlA6qW9ZP6kRRKW
         7L3acYtMgTUZr0R5LgkX6I93uXQ4R21vBa0B7uwygJhp5a4I3IxeAqncuGzPtCSvsbm2
         BELg==
X-Forwarded-Encrypted: i=1; AJvYcCVPBrFFjKkUmasqQQDwZxJwJCoN1WwV6UzAV59FuaY9498/oxo0JDRGexvmiMfZpC50oWkOYDhJWjYAq2bY90qBwibhhfYN9t0vfpY=
X-Gm-Message-State: AOJu0YzWwcY3W4nELfLcWd/tSonqFyFOrWxXz/fAxPEe3uGQBH652J/3
	V2H93HeDBf8Lz3LS9xy0FSJ2Jm3SgzuvNWK9tV3n46/dx/Qv0kRr/v/70riGyPnBgkxKbdMxwwX
	jHht9b77Usb/+kUvL/1MgTvjg9Sg=
X-Google-Smtp-Source: AGHT+IE6iUag+9k8LcZQ7Ws/9/lpqTS4a+bFfYRN5dOywfrtT3S1T+b3EIasvMiglZRrty9MSEU87+4Uo5NVYT57yl4=
X-Received: by 2002:a2e:1319:0:b0:2ef:2b53:c785 with SMTP id
 38308e7fff4ca-2f3be607459mr62202961fa.41.1724067881847; Mon, 19 Aug 2024
 04:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuFDon59=Nw6WCdgp0FanZ1oE3dCkoq71EK0Bxe6Jhe_g@mail.gmail.com>
 <CA+G9fYtd1Hw9YLpceUAwwC+UytVQVXOET4gmGT9jiCgHa+WexQ@mail.gmail.com>
In-Reply-To: <CA+G9fYtd1Hw9YLpceUAwwC+UytVQVXOET4gmGT9jiCgHa+WexQ@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 19 Aug 2024 19:44:25 +0800
Message-ID: <CAMgjq7Bz0DY+rY0XgCoH7-Q=uHLdo3omi8kUr4ePDweNyofsbQ@mail.gmail.com>
Subject: Re: gcc-8: mm/swapfile.c:863:40: error: array subscript 1 is above
 array bounds of 'struct list_head[1]' [-Werror=array-bounds]
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Chris Li <chrisl@kernel.org>, linux-mm <linux-mm@kvack.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Barry Song <21cnbao@gmail.com>, 
	"Huang, Ying" <ying.huang@intel.com>, Hugh Dickins <hughd@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: multipart/mixed; boundary="000000000000aaac9d062007d5df"

--000000000000aaac9d062007d5df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 6:16=E2=80=AFPM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> On Mon, 19 Aug 2024 at 13:58, Naresh Kamboju <naresh.kamboju@linaro.org> =
wrote:
> >
> > The x86 builds failed with gcc-8 due to following build warnings / erro=
rs on
> > Linux next-20240802 to next-20240819.
> >
> > x86_64 defconfig gcc-8 build failed
> > x86_64 defconfig gcc-13 build pass
> >
> > First seen on the next-20240802 tag.
> >
> >   GOOD: next-20240730
> >   BAD:  next-20240802
>
> Anders bisected this and found the first bad commit id as,
> aded4352f648 ("mm: swap: separate SSD allocation from
> scan_swap_map_slots()") first faulty one
>
> - Naresh
>

Hi Naresh,

Thanks for the report, the problem will occur when CONFIG_THP_SWAP is
disabled. Can you try the following patch? I can confirm it's fixed
with my test.

--000000000000aaac9d062007d5df
Content-Type: application/octet-stream; 
	name="0001-mm-swap-fix-array-bounds-error-with-CONFIG_THP_SWAP-.patch"
Content-Disposition: attachment; 
	filename="0001-mm-swap-fix-array-bounds-error-with-CONFIG_THP_SWAP-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m00x6nue0>
X-Attachment-Id: f_m00x6nue0

RnJvbSA4OWYwYWFmYTAzYWQ1ODc4ZTg5MDJlMDdlMTJlYzBjMDIwZGJhMmRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlydWkgU29uZyA8a2Fzb25nQHRlbmNlbnQuY29tPgpEYXRl
OiBNb24sIDE5IEF1ZyAyMDI0IDE5OjMxOjU1ICswODAwClN1YmplY3Q6IFtQQVRDSF0gbW06IHN3
YXA6IGZpeCBhcnJheS1ib3VuZHMgZXJyb3Igd2l0aCBDT05GSUdfVEhQX1NXQVA9bgoKU2lnbmVk
LW9mZi1ieTogS2FpcnVpIFNvbmcgPGthc29uZ0B0ZW5jZW50LmNvbT4KLS0tCiBtbS9zd2FwZmls
ZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvbW0vc3dhcGZpbGUuYyBiL21tL3N3YXBmaWxlLmMKaW5kZXggZDljZjMx
YjA0ZGIzLi4xNmVjNmI3ZGYxOTggMTAwNjQ0Ci0tLSBhL21tL3N3YXBmaWxlLmMKKysrIGIvbW0v
c3dhcGZpbGUuYwpAQCAtODM2LDcgKzgzNiw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIGNsdXN0
ZXJfYWxsb2Nfc3dhcF9lbnRyeShzdHJ1Y3Qgc3dhcF9pbmZvX3N0cnVjdCAqc2ksIGludCBvCiAJ
CWdvdG8gZG9uZTsKIAogCS8qIE9yZGVyIDAgc3RlYWxpbmcgZnJvbSBoaWdoZXIgb3JkZXIgKi8K
LQlmb3IgKGludCBvID0gMTsgbyA8IFBNRF9PUkRFUjsgbysrKSB7CisJZm9yIChpbnQgbyA9IDE7
IG8gPCBTV0FQX05SX09SREVSUzsgbysrKSB7CiAJCS8qCiAJCSAqIENsdXN0ZXJzIGhlcmUgaGF2
ZSBhdCBsZWFzdCBvbmUgdXNhYmxlIHNsb3RzIGFuZCBjYW4ndCBmYWlsIG9yZGVyIDAKIAkJICog
YWxsb2NhdGlvbiwgYnV0IHJlY2xhaW0gbWF5IGRyb3Agc2ktPmxvY2sgYW5kIHJhY2Ugd2l0aCBh
bm90aGVyIHVzZXIuCi0tIAoyLjQ1LjIKCg==
--000000000000aaac9d062007d5df--
