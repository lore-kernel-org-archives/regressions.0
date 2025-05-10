Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494381E5202
	for <regressions@lists.linux.dev>; Sat, 10 May 2025 09:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746869901; cv=none; b=bGS9hdq5mZgjfsYMiMpLf2EZQ4adk6XD7ToNSexBGb8m2JaNeaWgHFoHfXEM5DRzTf/0HVq6QXSlvT7LaEz/COXBkALEPK5Uk+HJtilCbWSDpsSTubC1X7hQN57v+I9oLH1o1ClS/q/ubcgBZbPhl6/4OhV0ry313OcyG4pgHSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746869901; c=relaxed/simple;
	bh=0mTlCEWkW6rkQPOGq6Wkvk0qBns1LaA++h6ShXw6fho=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SxWrVVnXtKY/p911oWWPV4HQGUh+Le7m6KgGS3f8YScJXdhmuqmCF7IbLD4BgEc3TLA1X8iX81cdADeL6U7NfBV8rhS/yCcYGxjaEJ98L60EwKhkdLUCT47QenPyQiZ1r5v/u2LLmZ2fKBEELiRiV8Ds5GkCcfrX+aA6AxiJr5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iu2YtXzI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iu2YtXzI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so27295235e9.1
        for <regressions@lists.linux.dev>; Sat, 10 May 2025 02:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746869897; x=1747474697; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Brc+ZiTm9hUXSm8GgCWOjwKSMPotzD18vsery3NQJm8=;
        b=Iu2YtXzImw93ujcK5rX4hHLaonQ3zb55flCiLklIZAVJnqypMMtqubrvlJ1uWqmuSK
         ZGS2jbwlNd+IgIuey4sCOCuSfWPDAtvPFAsFIPy5UZTga1C2ONkZbfh0ouyqRuv3k8sO
         VP0BeScYeJ3q8vxQrZnng5YY93G1zPiAOGeq1zo1AvmRjorw7Lb2NSD6rFFEWb6Y355k
         Dw7GbSx64gFyaSk4L5iyb5TpmLHK/8WYIsKbW7ct42FI08dCpAr3bf+rORihlrSkkMRW
         yS17YzdykvQcJWvPatxyxlWnHXM3V26gBlq7ZOFG/vw12R1AK0Bzw57UojLMWRMbYdys
         YH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746869897; x=1747474697;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Brc+ZiTm9hUXSm8GgCWOjwKSMPotzD18vsery3NQJm8=;
        b=JXiWvyxzSXsjP/v1OjErgpHPZhMD8mnlP1z8q3dDBZZACHmKH2kZAWBG99pyYSFAUk
         knSr1rGDGW9rjKedWCdQNAePPa9jUrSChAojM3+LKRLXSOU6XewEnka4PM9Vho3zjv9s
         AMUk0kMjc/GaNvu4y4C4fOHid2WEz2q5ipUMS2Qiq/eBshTBI3DTlv9ZnTYwnnTxn/8i
         Ufmexzi/ohQ8+pmuc8sDkNJJ+32KcOm39LAIuhFpfZxbiMo3Rd2thYszOdSQ5UdCmRZD
         RsgddYjWToW96v5yFuoubiMM8/GPxTeTuuxdzzTP2cmnA0NkZpr4QiL60xj4gpKwunUc
         42XQ==
X-Forwarded-Encrypted: i=1; AJvYcCV02Baeolxdx3GOO63m8oRlB2F7Vvyu+0qdkYrRt1ut7T3o/i0szyZy73qCLe+bNwL0F6MSHwyS3F5N/A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+Sa212MRTo5yqUr5WKjRL3/u1498B+Cz7v7zHG64n/fNu1Fy5
	QKX1059fMofIsFaC1lDgn0c7YGAo2brEmU/Q3KFZcp0sO+dWe+qp
X-Gm-Gg: ASbGncvwhJkpKpOnTSH78D/cOhZRelIcgDli8MsPVWXKoLzcgHf9T3zbeCKrFMMhKHy
	xsGib4NCRlz0/BjH363UrYFblJk3KauBBpXsXV5Wmit5QgtnhRCDihHbPYf7obWQYTdhU0VP8n4
	PqAquMjHchiIr+ayZboIUxh6OlyeIxbCyWx7pIk9x//uZOEBjLC+Qb4hQupi5gbahJJeqMIUkLs
	nTYG+UgQphqKBipGsg0t6d7CsB6hbILf2jxPD5KhotnOcfdFHApXJYaypMtpm/g8hme+Idxqrcx
	HLeMGnH4ZfjgKbnDlF7FJQ27Q2GF8JPtdqPIrqpahLtZahwkiWqY5agTOcLJAOpBC5DFwPDfFRF
	kIA1Io3RmBe1oc+8KR/sVwA==
X-Google-Smtp-Source: AGHT+IFbdGYVIQ49iY5bbmzcUxZMtkwMLdtF45nk6ZTl6i0nDudvhlHAg2cQZJagCGG2wfh9qIm1OA==
X-Received: by 2002:a5d:5885:0:b0:38d:dc03:a3d6 with SMTP id ffacd0b85a97d-3a0b98fcdb9mr9604832f8f.4.1746869897251;
        Sat, 10 May 2025 02:38:17 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:dea1:3038:3d90:d2ab? ([2a02:168:6806:0:dea1:3038:3d90:d2ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec98dsm5819768f8f.25.2025.05.10.02.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 02:38:16 -0700 (PDT)
Message-ID: <41680c5d41ed568e8c65451843e3ff212fd340c4.camel@gmail.com>
Subject: Re: [v3 PATCH] crypto: marvell/cesa - Do not chain submitted
 requests
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, regressions@lists.linux.dev,
 	linux-kernel@vger.kernel.org, Linux Crypto Mailing List	
 <linux-crypto@vger.kernel.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 EBALARD Arnaud <Arnaud.Ebalard@ssi.gouv.fr>, Romain Perier
 <romain.perier@gmail.com>
Date: Sat, 10 May 2025 11:38:16 +0200
In-Reply-To: <aB8W4iuvjvAZSJoc@gondor.apana.org.au>
References: <15fadc356b73a1e8e24183f284b5c0a44a53e679.camel@gmail.com>
	 <Zw31JIEyh28vK9q7@gondor.apana.org.au>
	 <5db212655dc98945fa3f529925821879a03ff554.camel@gmail.com>
	 <Zw9AsgqKHJfySScx@gondor.apana.org.au>
	 <aBoMSHEMYj6FbH8o@gondor.apana.org.au>
	 <aBsdTJUAcQgW4ink@gondor.apana.org.au> <aBt5Mxq1MeefwXGJ@Red>
	 <aBw-C_krkNsIoPlT@gondor.apana.org.au>
	 <aBw_iC_4okpiKglQ@gondor.apana.org.au>
	 <dd55ba91a5aebce0e643cab5d57e4c87a006600f.camel@gmail.com>
	 <aB8W4iuvjvAZSJoc@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2025-05-10 at 17:05 +0800, Herbert Xu wrote:
> On Sat, May 10, 2025 at 10:32:53AM +0200, Klaus Kudielka wrote:
> >=20
> > So, I am back at the hardware (armada-385-turris-omnia), and gave this =
patch a try.
> > CONFIG_CRYPTO_DEV_MARVELL_CESA=3Dm
> >=20
> > Upon modprobe marvell-cesa, I get the following results.
>=20
> Thanks, could you please try this patch which goes on top of the
> previous v3 patch to disable chaining completely?
>=20
> Thanks,

Patch applied on top.
On the first attempt all self-tests passed, but on the second and third unf=
ortunately not.

[   16.841981] marvell-cesa f1090000.crypto: CESA device successfully regis=
tered
[   16.912258] alg: ahash: mv-sha256 test failed (wrong result) on test vec=
tor 2, cfg=3D"import/export"
[   16.917574] alg: ahash: mv-md5 test failed (wrong result) on test vector=
 3, cfg=3D"init+update+final misaligned buffer"
[   16.921323] alg: self-tests for sha256 using mv-sha256 failed (rc=3D-22)
[   16.931961] ------------[ cut here ]------------
[   16.931966] WARNING: CPU: 1 PID: 388 at crypto/testmgr.c:5871 alg_test+0=
x5f0/0x614
[   16.931982] alg: self-tests for sha256 using mv-sha256 failed (rc=3D-22)
[   16.931985] Modules linked in:
[   16.931984] alg: self-tests for md5 using mv-md5 failed (rc=3D-22)
[   16.931989] ------------[ cut here ]------------
[   16.931989]  marvell_cesa libdes libaes
[   16.931993] WARNING: CPU: 0 PID: 386 at crypto/testmgr.c:5871 alg_test+0=
x5f0/0x614
[   16.932001] CPU: 1 UID: 0 PID: 388 Comm: cryptomgr_test Not tainted 6.15=
.0-rc5+ #5 NONE=20
[   16.932004] alg: self-tests for md5 using mv-md5 failed (rc=3D-22)
[   16.932007] Modules linked in:
[   16.932009] Hardware name: Marvell Armada 380/385 (Device Tree)
[   16.932012]  marvell_cesa
[   16.932013] Call trace:=20
[   16.932015]  libdes libaes
[   16.932018]  unwind_backtrace from show_stack+0x10/0x14
[   16.932033]  show_stack from dump_stack_lvl+0x50/0x64
[   16.932042]  dump_stack_lvl from __warn+0x7c/0xd4
[   16.932052]  __warn from warn_slowpath_fmt+0x110/0x16c
[   16.932063]  warn_slowpath_fmt from alg_test+0x5f0/0x614
[   16.932073]  alg_test from cryptomgr_test+0x18/0x38
[   16.932080]  cryptomgr_test from kthread+0xe8/0x204
[   16.932090]  kthread from ret_from_fork+0x14/0x28
[   16.932097] Exception stack(0xf0aadfb0 to 0xf0aadff8)
[   16.932102] dfa0:                                     00000000 00000000 =
00000000 00000000
[   16.932107] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   16.932112] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   16.932115] ---[ end trace 0000000000000000 ]---
[   16.932115] CPU: 0 UID: 0 PID: 386 Comm: cryptomgr_test Not tainted 6.15=
.0-rc5+ #5 NONE=20
[   16.932122] Hardware name: Marvell Armada 380/385 (Device Tree)
[   16.932125] Call trace:=20
[   16.932127]  unwind_backtrace from show_stack+0x10/0x14
[   16.932139]  show_stack from dump_stack_lvl+0x50/0x64
[   16.932148]  dump_stack_lvl from __warn+0x7c/0xd4
[   16.932157]  __warn from warn_slowpath_fmt+0x110/0x16c
[   16.932168]  warn_slowpath_fmt from alg_test+0x5f0/0x614
[   16.932178]  alg_test from cryptomgr_test+0x18/0x38
[   16.932185]  cryptomgr_test from kthread+0xe8/0x204
[   16.932193]  kthread from ret_from_fork+0x14/0x28
[   16.932200] Exception stack(0xf0aa1fb0 to 0xf0aa1ff8)
[   16.932205] 1fa0:                                     00000000 00000000 =
00000000 00000000
[   16.932210] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   16.932214] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   16.932217] ---[ end trace 0000000000000000 ]---
[   16.932990] alg: ahash: mv-hmac-md5 setkey failed on test vector 0; expe=
cted_error=3D0, actual_error=3D-80, flags=3D0x1
[   16.943346] alg: self-tests for hmac(md5) using mv-hmac-md5 failed (rc=
=3D-80)
[   16.943353] ------------[ cut here ]------------
[   16.943357] WARNING: CPU: 0 PID: 391 at crypto/testmgr.c:5871 alg_test+0=
x5f0/0x614
[   16.943370] alg: self-tests for hmac(md5) using mv-hmac-md5 failed (rc=
=3D-80)
[   16.943374] Modules linked in: marvell_cesa libdes libaes
[   16.943408] CPU: 0 UID: 0 PID: 391 Comm: cryptomgr_test Tainted: G      =
  W           6.15.0-rc5+ #5 NONE=20
[   16.943418] Tainted: [W]=3DWARN
[   16.943420] Hardware name: Marvell Armada 380/385 (Device Tree)
[   16.943423] Call trace:=20
[   16.943428]  unwind_backtrace from show_stack+0x10/0x14
[   16.943445]  show_stack from dump_stack_lvl+0x50/0x64
[   16.943455]  dump_stack_lvl from __warn+0x7c/0xd4
[   16.943465]  __warn from warn_slowpath_fmt+0x110/0x16c
[   16.943476]  warn_slowpath_fmt from alg_test+0x5f0/0x614
[   16.943487]  alg_test from cryptomgr_test+0x18/0x38
[   16.943495]  cryptomgr_test from kthread+0xe8/0x204
[   16.943504]  kthread from ret_from_fork+0x14/0x28
[   16.943512] Exception stack(0xf0ab9fb0 to 0xf0ab9ff8)
[   16.943517] 9fa0:                                     00000000 00000000 =
00000000 00000000
[   16.943522] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   16.943527] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   16.943530] ---[ end trace 0000000000000000 ]---
[   16.943600] alg: ahash: mv-hmac-sha256 setkey failed on test vector 0; e=
xpected_error=3D0, actual_error=3D-80, flags=3D0x1
[   16.954188] alg: self-tests for hmac(sha256) using mv-hmac-sha256 failed=
 (rc=3D-80)
[   16.954195] ------------[ cut here ]------------
[   16.954200] WARNING: CPU: 0 PID: 394 at crypto/testmgr.c:5871 alg_test+0=
x5f0/0x614
[   16.954211] alg: self-tests for hmac(sha256) using mv-hmac-sha256 failed=
 (rc=3D-80)
[   16.954215] Modules linked in: marvell_cesa libdes libaes
[   16.954229] CPU: 0 UID: 0 PID: 394 Comm: cryptomgr_test Tainted: G      =
  W           6.15.0-rc5+ #5 NONE=20
[   16.954236] Tainted: [W]=3DWARN
[   16.954238] Hardware name: Marvell Armada 380/385 (Device Tree)
[   16.954241] Call trace:=20
[   16.954244]  unwind_backtrace from show_stack+0x10/0x14
[   16.954257]  show_stack from dump_stack_lvl+0x50/0x64
[   16.954266]  dump_stack_lvl from __warn+0x7c/0xd4
[   16.954275]  __warn from warn_slowpath_fmt+0x110/0x16c
[   16.954286]  warn_slowpath_fmt from alg_test+0x5f0/0x614
[   16.954296]  alg_test from cryptomgr_test+0x18/0x38
[   16.954304]  cryptomgr_test from kthread+0xe8/0x204
[   16.954312]  kthread from ret_from_fork+0x14/0x28
[   16.954320] Exception stack(0xf0ac5fb0 to 0xf0ac5ff8)
[   16.954324] 5fa0:                                     00000000 00000000 =
00000000 00000000
[   16.954329] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   16.954333] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   16.954336] ---[ end trace 0000000000000000 ]---
