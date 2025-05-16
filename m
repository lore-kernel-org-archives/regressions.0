Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8831B21D5BD
	for <regressions@lists.linux.dev>; Fri, 16 May 2025 17:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747417017; cv=none; b=qWBb7pEbwgG8cxeSbqBG2GWImRQ5yY36p4gME1e9uw8rjIcbE6rZ8sa201lEhaxKGvgcy3XQD89utWIRua5FhUL2CqRcuhlxWa1pqBdVjbXsu04au3YbCBAzeItnvUCBEwTqA91/8fj47iRjhu8+541b14gi4UxnaucB19sM4UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747417017; c=relaxed/simple;
	bh=11KTuzLPta8PuFq5HMGHeyAAbypq6bhKZBp2eFuQvHk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lcCyt+yBCnOzas7If3woOvwDWSwzeMchJqNL7Go+pb+SuPfMjDpx2Wy5V7U9xc3PNG932W50pS1PppEtUFSx2qqf/A45jpup3qf1EHG4oBXQZROnxPy5BNr+ohHyae7KV0gB7CUnUwZu5PXSPJJcKrn1n8/ZXy4iWzhbsnL8pto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AurH4yTk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AurH4yTk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so15151995e9.0
        for <regressions@lists.linux.dev>; Fri, 16 May 2025 10:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747417014; x=1748021814; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f6QQjxjPgk5p/ILY4E/8DWRz+jrN/FDqH9hiUDq8BOE=;
        b=AurH4yTknPyaK2HAgYfPMHhlwA3HTYg0qLCfQF8BNwAPh6mnfRnjjlRECkPmzzYLzc
         zNGwDYofLEJNRn2XHhqVYRxZR/l/bn+ye/B75W3ChOSfd0vBGAKFVtxI+YvfDQZTTxaF
         r20CCcGBUBS824q2Z9R9pQgie2A3rQgSKnNdFZ++BPtv7vLbGNhzPukg4BtAUcman0rb
         ZUo0gd72hN+rCXT4ogKif4ShlKMaWA7nr/OcFExsA6Lv/sdUPuWu+9Baw38cZ2exjS/G
         Z5Qh/yPKImnpBWuCFCORvAtCTL2I7RWQZjbkSSDn5EIFaFTm0sVtm72njkTYFioAAjQq
         08kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747417014; x=1748021814;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f6QQjxjPgk5p/ILY4E/8DWRz+jrN/FDqH9hiUDq8BOE=;
        b=BW9XBUN510cQGTJfiLDelAUyByNlbZkKlkqrLVmGvGCpau5pZvgbP+cpxzV8xgwf8l
         K9RWVWhn1etZhVwP5Fj+BibEwdfKIRqQsGMnVn5lFB0ZrJHjfDtCOJJwaAtQ8REc3VCN
         vAKIQDZy/tZjP+2pO0ncvnhD2xMZ8zYLMXu8NGnh7iPOps+MJXnEkwYn9lI6kXM38p1j
         MwEaW4EZZ7l+AanvGz4+9+nWuHzY/TPmZ83S2zXWbdrL+H+CkMlK4LfopXuVWyA8uAIb
         tnBqXoxDXmQq8elKSh90X3mSyO20qvytJ4+4xaSdZ3nVRbuR1SsFWEwxgX7nPAD3aIGm
         womQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAuksyVqbqfxoaWyCUZnXz+LXGeU1V2wdaF8TWAo+j9gMd02N9PM2vApHWHGUXzpxKCsTAmgGH0TJmBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9LaZitMlc/SUNuU+mtgGOk6/+X3u+tV1SzzvYbrc98IGQhusA
	tqsGocEP5XWNteWVTH6XQEwVmrGo2EfvzdDaRwTBIlCeku52Z1SvX+Zh
X-Gm-Gg: ASbGnct3OErlHIk/Ct1Cd5t9PJZdg7GzvDJh4uU3GgCMNKNz/SBumbD8j495ag9U6RL
	V6281hg9uiTgTuibiAqt5TCpDFJvfpQW6/55wiPIxOyOdiy6cMhndq5uywVXgflLh3GSVFuquTF
	Q02kz1tc6/RV/LP1MhFKeEKxIJD/DJm88K/YqXZoa2j+YlH/LBZ9OxJLn6dfEIg5JRjzCsdZ0Yv
	pqu5HauyvITAFt8OpVEG/OjWN+K8H69/4Qm14PuC97uQ2G6QDQ5JVSHXvY+7ygK0nQAuRQ0+Rwv
	gf9yIfX5a1h2p7vaVLRqzkMTNBEutMUuE3L59hi/5GDdMjKSlHvUjktbqjOLSfDQ+hUQehZfpdc
	ZQZhTgr8Xi/IFPhDA6qg=
X-Google-Smtp-Source: AGHT+IFnqfp6SFZgUJPa88LnSIu45A0pT+iLF/neMjMZKyLAyAHtZGTZaRKNnyn+H6ZF2Onk3+NMNA==
X-Received: by 2002:a05:600c:297:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-442f84d5776mr61793195e9.9.1747417013347;
        Fri, 16 May 2025 10:36:53 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:4563:288:ad48:133a? ([2a02:168:6806:0:4563:288:ad48:133a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f33804d9sm113362765e9.12.2025.05.16.10.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 10:36:52 -0700 (PDT)
Message-ID: <c01e9b258e024e745ef8711bb94e0d5f6d7d4f96.camel@gmail.com>
Subject: Re: [PATCH] crypto: marvell/cesa - Avoid empty transfer descriptor
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, regressions@lists.linux.dev,
 	linux-kernel@vger.kernel.org, Linux Crypto Mailing List	
 <linux-crypto@vger.kernel.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 EBALARD Arnaud <Arnaud.Ebalard@ssi.gouv.fr>, Romain Perier
 <romain.perier@gmail.com>
Date: Fri, 16 May 2025 19:36:52 +0200
In-Reply-To: <aCa7J3I8DyRs7pP_@gondor.apana.org.au>
References: <aB8W4iuvjvAZSJoc@gondor.apana.org.au>
	 <41680c5d41ed568e8c65451843e3ff212fd340c4.camel@gmail.com>
	 <aB8t1ZTVBexqGlcm@gondor.apana.org.au>
	 <dcb0b04e479d6f3cfed87795d100ea09e4fbcf53.camel@gmail.com>
	 <aCAX8rj2ie4QMnTo@gondor.apana.org.au>
	 <28184fb96e2de8a0af32816f5ff1b3d776b57217.camel@gmail.com>
	 <aCMOyWVte4tw85_F@gondor.apana.org.au>
	 <8e9b45bdafe6ac3f12bcbb5fce5bc9949566344f.camel@gmail.com>
	 <aCQm0aHYnI6ciyPz@gondor.apana.org.au>
	 <20dde00750d803a9a364ded99dab1e3e22daec77.camel@gmail.com>
	 <aCa7J3I8DyRs7pP_@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2025-05-16 at 12:12 +0800, Herbert Xu wrote:
>=20
> Something doesn't look right.=C2=A0 There are zero ahash lines in your
> dmesg.=C2=A0 IOW all the output was from skcipher tests alone.
>=20
> That could explain why ahash appears to be working.
>=20
> What does /proc/crypto show after boot-up? Do the cesa ahash
> algorithms show up as tested in there?
>=20
> Cheers,

Plain cryptodev tree, marvell-cesa as module.
Directly after boot, only the builtin crc32c-generic shows up.
After loading the module, the marvell-cesa ahash show up with "selftest : p=
assed".
But whether they REALLY were tested, I can't say.

# cat /proc/crypto=20
name         : crc32c
driver       : crc32c-generic
module       : kernel
priority     : 100
refcnt       : 1
selftest     : passed
internal     : no
type         : shash
blocksize    : 1
digestsize   : 4

# modprobe marvell-cesa
# cat /proc/crypto=20
name         : hmac(sha256)
driver       : mv-hmac-sha256
module       : marvell_cesa
priority     : 0
refcnt       : 1
selftest     : passed
internal     : no
type         : ahash
async        : yes
blocksize    : 64
digestsize   : 32

name         : hmac(sha1)
driver       : mv-hmac-sha1
module       : marvell_cesa
priority     : 0
refcnt       : 1
selftest     : passed
internal     : no
type         : ahash
async        : yes
blocksize    : 64
digestsize   : 20

name         : hmac(md5)
driver       : mv-hmac-md5
module       : marvell_cesa
priority     : 0
refcnt       : 1
selftest     : passed
internal     : no
type         : ahash
async        : yes
blocksize    : 64
digestsize   : 16

name         : sha256
driver       : mv-sha256
module       : marvell_cesa
priority     : 0
refcnt       : 1
selftest     : passed
internal     : no
type         : ahash
async        : yes
blocksize    : 64
digestsize   : 32

name         : sha1
driver       : mv-sha1
module       : marvell_cesa
priority     : 0
refcnt       : 1
selftest     : passed
internal     : no
type         : ahash
async        : yes
blocksize    : 64
digestsize   : 20

name         : md5
driver       : mv-md5
module       : marvell_cesa
priority     : 0
refcnt       : 1
selftest     : passed
internal     : no
type         : ahash
async        : yes
blocksize    : 64
digestsize   : 16

name         : cbc(aes)
driver       : mv-cbc-aes
module       : marvell_cesa
priority     : 300
refcnt       : 1
selftest     : passed
internal     : no
type         : skcipher
async        : yes
blocksize    : 16
min keysize  : 16
max keysize  : 32
ivsize       : 16
chunksize    : 16
walksize     : 16
statesize    : 0

name         : ecb(aes)
driver       : mv-ecb-aes
module       : marvell_cesa
priority     : 300
refcnt       : 1
selftest     : passed
internal     : no
type         : skcipher
async        : yes
blocksize    : 16
min keysize  : 16
max keysize  : 32
ivsize       : 0
chunksize    : 16
walksize     : 16
statesize    : 0

name         : cbc(des3_ede)
driver       : mv-cbc-des3-ede
module       : marvell_cesa
priority     : 300
refcnt       : 1
selftest     : passed
internal     : no
type         : skcipher
async        : yes
blocksize    : 8
min keysize  : 24
max keysize  : 24
ivsize       : 8
chunksize    : 8
walksize     : 8
statesize    : 0

name         : ecb(des3_ede)
driver       : mv-ecb-des3-ede
module       : marvell_cesa
priority     : 300
refcnt       : 1
selftest     : passed
internal     : no
type         : skcipher
async        : yes
blocksize    : 8
min keysize  : 24
max keysize  : 24
ivsize       : 0
chunksize    : 8
walksize     : 8
statesize    : 0

name         : cbc(des)
driver       : mv-cbc-des
module       : marvell_cesa
priority     : 300
refcnt       : 1
selftest     : passed
internal     : no
type         : skcipher
async        : yes
blocksize    : 8
min keysize  : 8
max keysize  : 8
ivsize       : 8
chunksize    : 8
walksize     : 8
statesize    : 0

name         : ecb(des)
driver       : mv-ecb-des
module       : marvell_cesa
priority     : 300
refcnt       : 1
selftest     : passed
internal     : no
type         : skcipher
async        : yes
blocksize    : 8
min keysize  : 8
max keysize  : 8
ivsize       : 0
chunksize    : 8
walksize     : 8
statesize    : 0

name         : crc32c
driver       : crc32c-generic
module       : kernel
priority     : 100
refcnt       : 1
selftest     : passed
internal     : no
type         : shash
blocksize    : 1
digestsize   : 4

# dmesg | tail
[    4.883366] mv88e6085 f1072004.mdio-mii:10 lan2: configuring for phy/gmi=
i link mode
[    4.884517] br0: port 3(lan4) entered blocking state
[    4.884527] br0: port 3(lan4) entered forwarding state
[   88.867746] marvell-cesa f1090000.crypto: CESA device successfully regis=
tered
[   89.034292] alg: skcipher: skipping comparison tests for mv-cbc-des beca=
use cbc(des-generic) is unavailable
[   89.045265] alg: skcipher: skipping comparison tests for mv-cbc-des3-ede=
 because cbc(des3_ede-generic) is unavailable
[   89.052456] alg: skcipher: skipping comparison tests for mv-cbc-aes beca=
use cbc(aes-generic) is unavailable
[   89.099763] alg: skcipher: skipping comparison tests for mv-ecb-aes beca=
use ecb(aes-generic) is unavailable
[   89.099819] alg: skcipher: skipping comparison tests for mv-ecb-des3-ede=
 because ecb(des3_ede-generic) is unavailable
[   89.099908] alg: skcipher: skipping comparison tests for mv-ecb-des beca=
use ecb(des-generic) is unavailable

