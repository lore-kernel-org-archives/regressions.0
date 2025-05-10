Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9AC13D503
	for <regressions@lists.linux.dev>; Sat, 10 May 2025 08:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746865979; cv=none; b=hSZNPT4mRAuN8ioB/OWu2Zcw7/JEP79X6IHF5iwjuJe254WxOgnu0/l/tQuFAX8G2ayNup3IeUHNlK9O510uf4amXAXXuyhvEq162UkD2hlmoI5QnS5sikh6OADnoq+2VEphKdgq+TPlRkvzCL7gKWHN/EIAqQtO6pAaZeFwiJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746865979; c=relaxed/simple;
	bh=wzzFa+llKuBIq/PHdm225hWRCF4m+fAmzTAvtGucufc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PP9+SbQI/xqWvAA92jfnDtJLP6SAHoeXN23aJcY0CDfiuavo6V80ghXAKsvKTD6rohLTuF/cAFLLkzK8MMg3TkoznJHlIkyNbIxQyBvugb+IeLPthO+QDzoYhRW6DHpjjv6Jq5QEkR3yM1iybtaDL2LN7+RArmRzQCV08OhGwLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHLob5iX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHLob5iX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so20141575e9.2
        for <regressions@lists.linux.dev>; Sat, 10 May 2025 01:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746865974; x=1747470774; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=96N6c5zNsvE51w2vtmVNNcx0r5x+wbngo93p1PmyKNk=;
        b=eHLob5iXlyjaDGmusH6UmJR6IL4U2Rp6e1RKpSHq+qEC7QB7t6JF/HqoxG+WYK6mMe
         pD94sPC4GUn+JHFKLc0Bt5oUhK0GAGJV5YgBBMlbY/E+f4Iy/cKjVNtOwUbTPInBm4kB
         w1YMFLsf4WivARBRStvqzOwtcrVe5MiIPmxgKN9P5m85bsTuAn6hBI0SZuFvfRJcNz3R
         imn+WGURWAtoCZP8zI8MRGMEixDonbXMPxuYiVi8s/LRJWevCLp/Ug3htMKhUSYH67KJ
         4trEeWbpTuDVeMns6HgukxcNjUf2vxm/TZmEd/7hVDqXb4ikc4eiV+xOfkGDLMzDaaSq
         chWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746865974; x=1747470774;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=96N6c5zNsvE51w2vtmVNNcx0r5x+wbngo93p1PmyKNk=;
        b=ZtlKqtbKf0HB4Qa9BgfPQm8pg7LEQhDosvM0cKoxCuqMRW7Bhnpew/vxta9vkCgAXv
         k+esi44cGyQO+3HENboO2hYeGuMmAA0iadMVrxIK8ic8uV1U0ftupAuzgWgoQUXFNCH2
         iA46ew47Tkso4U3473lwfG8TJeju/yDq/VEs0pzixRhE6BkAhtfZE41xJQdMDJT+FsWd
         FJbsKItRe4XP/z3ncrgT5iH74CjN6tqJvYM2XcLJQ69JoRgKdpz+vb0WXe79g/xl50x8
         KZ/sLiYKPWOsKeAxVe+8ES1HI8nwh1B1X1OzLKt0oVwVRsZHb7j3hdrNY4z6um6s+XPz
         fPPA==
X-Gm-Message-State: AOJu0YwKbrinFG5DyOsnDcqpFnf6UHf6Kg8Uz3PvVbOwxZ+YgRvIVkH2
	NdhtqixZUZzc121sf076tL6zLfnZhvhc8OQIRPV41GrE2DZBMCiI
X-Gm-Gg: ASbGncukl0Oqtqw8RRH/gmnWDrx41nxLiUgLwZjpbrTd1d3FhpP1CeG49AUpPkUffKD
	7IpWM6B0Q48eVNxTtj7mpwvgOY5PZFsKZMznG0TNNwDN1ZUNssp9EEWAsLcdNHe9UOSfG9attVE
	OOdyAfhXBBAsmY/PPOofGe2rFy0YqGHD4NlwTIXTasbqWEJJTGa99flFTqqFn38z9JndzWJkWlN
	5rSCEIjaA85cU4LTE91CrCDh3IZaiEGxb518PkSuLQx0ZQah8j0f8UC/gP5JZ5gzqvBJUMnm0pA
	ImlOXeGHz3rIeDR885cEkbP0jSJnDX/A5NrNgfDt+o7Yq8PKmJZX/kkGxmAlgggi1hxfW3K/7sA
	ZhPBsOC9ppxY12GwTuc0Gow==
X-Google-Smtp-Source: AGHT+IHyyfTmxbEdosCyv2KetxGm5MYuEi0+jOwis2p8ekr84805hxzVkrcXCw9Pluvx7zR+3Qykpw==
X-Received: by 2002:a05:600c:608c:b0:43c:e70d:450c with SMTP id 5b1f17b1804b1-442d6dbbd6cmr52529265e9.22.1746865974309;
        Sat, 10 May 2025 01:32:54 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:279d:81d3:e5dc:d675? ([2a02:168:6806:0:279d:81d3:e5dc:d675])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d5cf5d6bsm60811955e9.1.2025.05.10.01.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 01:32:53 -0700 (PDT)
Message-ID: <dd55ba91a5aebce0e643cab5d57e4c87a006600f.camel@gmail.com>
Subject: Re: [v3 PATCH] crypto: marvell/cesa - Do not chain submitted
 requests
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, Corentin Labbe
	 <clabbe.montjoie@gmail.com>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org, Linux Crypto
 Mailing List <linux-crypto@vger.kernel.org>, Boris Brezillon
 <bbrezillon@kernel.org>, EBALARD Arnaud	 <Arnaud.Ebalard@ssi.gouv.fr>,
 Romain Perier <romain.perier@gmail.com>
Date: Sat, 10 May 2025 10:32:53 +0200
In-Reply-To: <aBw_iC_4okpiKglQ@gondor.apana.org.au>
References: <ZwduxHxQtHdzz-kl@gondor.apana.org.au>
	 <ZwePSPG8aWm6mwKK@gondor.apana.org.au>
	 <15fadc356b73a1e8e24183f284b5c0a44a53e679.camel@gmail.com>
	 <Zw31JIEyh28vK9q7@gondor.apana.org.au>
	 <5db212655dc98945fa3f529925821879a03ff554.camel@gmail.com>
	 <Zw9AsgqKHJfySScx@gondor.apana.org.au>
	 <aBoMSHEMYj6FbH8o@gondor.apana.org.au>
	 <aBsdTJUAcQgW4ink@gondor.apana.org.au> <aBt5Mxq1MeefwXGJ@Red>
	 <aBw-C_krkNsIoPlT@gondor.apana.org.au>
	 <aBw_iC_4okpiKglQ@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-05-08 at 13:22 +0800, Herbert Xu wrote:
> v3 simplifies it a little bit:
> =C2=A0
> ---8<---
> This driver tries to chain requests together before submitting them
> to hardware in order to reduce completion interrupts.
>=20
> However, it even extends chains that have already been submitted
> to hardware.=C2=A0 This is dangerous because there is no way of knowing
> whether the hardware has already read the DMA memory in question
> or not.
>=20
> Fix this by splitting the chain list into two.=C2=A0 One for submitted
> requests and one for requests that have not yet been submitted.
> Only extend the latter.
>=20
> Reported-by: Klaus Kudielka <klaus.kudielka@gmail.com>
> Fixes: 85030c5168f1 ("crypto: marvell - Add support for chaining crypto r=
equests in TDMA mode")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>


[...]


So, I am back at the hardware (armada-385-turris-omnia), and gave this patc=
h a try.
CONFIG_CRYPTO_DEV_MARVELL_CESA=3Dm

Upon modprobe marvell-cesa, I get the following results.



v6.15-rc5, unmodified
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

[   73.061653] marvell-cesa f1090000.crypto: CESA device successfully regis=
tered
[   73.115082] alg: ahash: mv-hmac-sha1 test failed (wrong result) on test =
vector 2, cfg=3D"import/export"
[   73.115206] alg: ahash: mv-hmac-md5 test failed (wrong result) on test v=
ector 6, cfg=3D"init+update+update+final two even splits"
[   73.124364] alg: self-tests for hmac(sha1) using mv-hmac-sha1 failed (rc=
=3D-22)
[   73.135887] alg: self-tests for hmac(md5) using mv-hmac-md5 failed (rc=
=3D-22)
[   73.135893] ------------[ cut here ]------------
[   73.135902] ------------[ cut here ]------------
[   73.135896] WARNING: CPU: 0 PID: 394 at crypto/testmgr.c:5871 alg_test+0=
x5f0/0x614
[   73.135906] WARNING: CPU: 1 PID: 397 at crypto/testmgr.c:5871 alg_test+0=
x5f0/0x614
[   73.135911] alg: self-tests for hmac(md5) using mv-hmac-md5 failed (rc=
=3D-22)
[   73.135914] Modules linked in: marvell_cesa
[   73.135918] alg: self-tests for hmac(sha1) using mv-hmac-sha1 failed (rc=
=3D-22)
[   73.135921]  libdes
[   73.135922] Modules linked in:
[   73.135924]  libaes
[   73.135925]  marvell_cesa libdes

[   73.135929]  libaes
[   73.135932] CPU: 0 UID: 0 PID: 394 Comm: cryptomgr_test Not tainted 6.15=
.0-rc5 #3 NONE=20
[   73.135940] Hardware name: Marvell Armada 380/385 (Device Tree)
[   73.135943] Call trace:=20
[   73.135948]  unwind_backtrace from show_stack+0x10/0x14
[   73.135963]  show_stack from dump_stack_lvl+0x50/0x64
[   73.135973]  dump_stack_lvl from __warn+0x7c/0xd4
[   73.135982]  __warn from warn_slowpath_fmt+0x110/0x16c
[   73.135994]  warn_slowpath_fmt from alg_test+0x5f0/0x614
[   73.136004]  alg_test from cryptomgr_test+0x18/0x38
[   73.136011]  cryptomgr_test from kthread+0xe8/0x204
[   73.136021]  kthread from ret_from_fork+0x14/0x28
[   73.136028] Exception stack(0xf0ac1fb0 to 0xf0ac1ff8)
[   73.136033] 1fa0:                                     00000000 00000000 =
00000000 00000000
[   73.136038] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   73.136042] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   73.136045] ---[ end trace 0000000000000000 ]---
[   73.136046] CPU: 1 UID: 0 PID: 397 Comm: cryptomgr_test Not tainted 6.15=
.0-rc5 #3 NONE=20
[   73.136052] Hardware name: Marvell Armada 380/385 (Device Tree)
[   73.136055] Call trace:=20
[   73.136057]  unwind_backtrace from show_stack+0x10/0x14
[   73.136070]  show_stack from dump_stack_lvl+0x50/0x64
[   73.136079]  dump_stack_lvl from __warn+0x7c/0xd4
[   73.136087]  __warn from warn_slowpath_fmt+0x110/0x16c
[   73.136098]  warn_slowpath_fmt from alg_test+0x5f0/0x614
[   73.136108]  alg_test from cryptomgr_test+0x18/0x38
[   73.136115]  cryptomgr_test from kthread+0xe8/0x204
[   73.136123]  kthread from ret_from_fork+0x14/0x28
[   73.136130] Exception stack(0xf0ac9fb0 to 0xf0ac9ff8)
[   73.136135] 9fa0:                                     00000000 00000000 =
00000000 00000000
[   73.136140] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   73.136144] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   73.136147] ---[ end trace 0000000000000000 ]---
[   73.137628] alg: ahash: mv-hmac-sha256 test failed (wrong result) on tes=
t vector 0, cfg=3D"init+update+final aligned buffer"
[   73.148747] alg: self-tests for hmac(sha256) using mv-hmac-sha256 failed=
 (rc=3D-22)
[   73.148755] ------------[ cut here ]------------
[   73.148760] WARNING: CPU: 0 PID: 399 at crypto/testmgr.c:5871 alg_test+0=
x5f0/0x614
[   73.148783] alg: self-tests for hmac(sha256) using mv-hmac-sha256 failed=
 (rc=3D-22)
[   73.148791] Modules linked in: marvell_cesa libdes libaes
[   73.148827] CPU: 0 UID: 0 PID: 399 Comm: cryptomgr_test Tainted: G      =
  W           6.15.0-rc5 #3 NONE=20
[   73.148840] Tainted: [W]=3DWARN
[   73.148842] Hardware name: Marvell Armada 380/385 (Device Tree)
[   73.148847] Call trace:=20
[   73.148854]  unwind_backtrace from show_stack+0x10/0x14
[   73.148878]  show_stack from dump_stack_lvl+0x50/0x64
[   73.148893]  dump_stack_lvl from __warn+0x7c/0xd4
[   73.148912]  __warn from warn_slowpath_fmt+0x110/0x16c
[   73.148929]  warn_slowpath_fmt from alg_test+0x5f0/0x614
[   73.148951]  alg_test from cryptomgr_test+0x18/0x38
[   73.148960]  cryptomgr_test from kthread+0xe8/0x204
[   73.148970]  kthread from ret_from_fork+0x14/0x28
[   73.148977] Exception stack(0xf0addfb0 to 0xf0addff8)
[   73.148982] dfa0:                                     00000000 00000000 =
00000000 00000000
[   73.148987] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   73.148991] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   73.148994] ---[ end trace 0000000000000000 ]---



v6.15-rc5, with the v3 PATCH
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

[   28.374751] marvell-cesa f1090000.crypto: CESA device successfully regis=
tered
[   28.427503] alg: ahash: mv-hmac-sha1 test failed (wrong result) on test =
vector 0, cfg=3D"init+update+final misaligned buffer"
[   28.427520] alg: ahash: mv-hmac-sha256 test failed (wrong result) on tes=
t vector 2, cfg=3D"init+update+update+final two even splits"
[   28.438688] alg: self-tests for hmac(sha1) using mv-hmac-sha1 failed (rc=
=3D-22)
[   28.438693] ------------[ cut here ]------------
[   28.438695] WARNING: CPU: 1 PID: 392 at crypto/testmgr.c:5871 alg_test+0=
x5f0/0x614
[   28.450482] alg: self-tests for hmac(sha1) using mv-hmac-sha1 failed (rc=
=3D-22)
[   28.450486] Modules linked in:
[   28.450485] alg: self-tests for hmac(sha256) using mv-hmac-sha256 failed=
 (rc=3D-22)
[   28.450489] ------------[ cut here ]------------
[   28.450490]  marvell_cesa libdes libaes
[   28.450494] WARNING: CPU: 0 PID: 395 at crypto/testmgr.c:5871 alg_test+0=
x5f0/0x614
[   28.450504] alg: self-tests for hmac(sha256) using mv-hmac-sha256 failed=
 (rc=3D-22)
[   28.450502] CPU: 1 UID: 0 PID: 392 Comm: cryptomgr_test Not tainted 6.15=
.0-rc5+ #4 NONE=20
[   28.450508] Modules linked in:
[   28.450510] Hardware name: Marvell Armada 380/385 (Device Tree)
[   28.450511]  marvell_cesa
[   28.450513] Call trace:=20
[   28.450514]  libdes libaes
[   28.450519]  unwind_backtrace from show_stack+0x10/0x14
[   28.450534]  show_stack from dump_stack_lvl+0x50/0x64
[   28.450544]  dump_stack_lvl from __warn+0x7c/0xd4
[   28.450554]  __warn from warn_slowpath_fmt+0x110/0x16c
[   28.450565]  warn_slowpath_fmt from alg_test+0x5f0/0x614
[   28.450575]  alg_test from cryptomgr_test+0x18/0x38
[   28.450582]  cryptomgr_test from kthread+0xe8/0x204
[   28.450592]  kthread from ret_from_fork+0x14/0x28
[   28.450599] Exception stack(0xf0b09fb0 to 0xf0b09ff8)
[   28.450604] 9fa0:                                     00000000 00000000 =
00000000 00000000
[   28.450609] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   28.450613] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   28.450616] ---[ end trace 0000000000000000 ]---
[   28.450617] CPU: 0 UID: 0 PID: 395 Comm: cryptomgr_test Not tainted 6.15=
.0-rc5+ #4 NONE=20
[   28.450624] Hardware name: Marvell Armada 380/385 (Device Tree)
[   28.450626] Call trace:=20
[   28.450628]  unwind_backtrace from show_stack+0x10/0x14
[   28.450640]  show_stack from dump_stack_lvl+0x50/0x64
[   28.450650]  dump_stack_lvl from __warn+0x7c/0xd4
[   28.450658]  __warn from warn_slowpath_fmt+0x110/0x16c
[   28.450669]  warn_slowpath_fmt from alg_test+0x5f0/0x614
[   28.450679]  alg_test from cryptomgr_test+0x18/0x38
[   28.450686]  cryptomgr_test from kthread+0xe8/0x204
[   28.450694]  kthread from ret_from_fork+0x14/0x28
[   28.450701] Exception stack(0xf0aa9fb0 to 0xf0aa9ff8)
[   28.450706] 9fa0:                                     00000000 00000000 =
00000000 00000000
[   28.450711] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   28.450716] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   28.450718] ---[ end trace 0000000000000000 ]---
[   28.454686] alg: ahash: mv-md5 test failed (wrong result) on test vector=
 1, cfg=3D"init+update+final aligned buffer"
[   28.465109] alg: self-tests for md5 using mv-md5 failed (rc=3D-22)
[   28.465120] ------------[ cut here ]------------
[   28.465125] WARNING: CPU: 1 PID: 385 at crypto/testmgr.c:5871 alg_test+0=
x5f0/0x614
[   28.465140] alg: self-tests for md5 using mv-md5 failed (rc=3D-22)
[   28.465143] Modules linked in: marvell_cesa libdes libaes
[   28.465172] CPU: 1 UID: 0 PID: 385 Comm: cryptomgr_test Tainted: G      =
  W           6.15.0-rc5+ #4 NONE=20
[   28.465181] Tainted: [W]=3DWARN
[   28.465183] Hardware name: Marvell Armada 380/385 (Device Tree)
[   28.465186] Call trace:=20
[   28.465190]  unwind_backtrace from show_stack+0x10/0x14
[   28.465205]  show_stack from dump_stack_lvl+0x50/0x64
[   28.465215]  dump_stack_lvl from __warn+0x7c/0xd4
[   28.465224]  __warn from warn_slowpath_fmt+0x110/0x16c
[   28.465235]  warn_slowpath_fmt from alg_test+0x5f0/0x614
[   28.465246]  alg_test from cryptomgr_test+0x18/0x38
[   28.465253]  cryptomgr_test from kthread+0xe8/0x204
[   28.465262]  kthread from ret_from_fork+0x14/0x28
[   28.465270] Exception stack(0xf0ae9fb0 to 0xf0ae9ff8)
[   28.465275] 9fa0:                                     00000000 00000000 =
00000000 00000000
[   28.465280] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   28.465284] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   28.465287] ---[ end trace 0000000000000000 ]---
[   28.465317] alg: ahash: mv-hmac-md5 setkey failed on test vector 0; expe=
cted_error=3D0, actual_error=3D-80, flags=3D0x1
[   28.475674] alg: self-tests for hmac(md5) using mv-hmac-md5 failed (rc=
=3D-80)
[   28.475685] ------------[ cut here ]------------
[   28.475694] WARNING: CPU: 0 PID: 390 at crypto/testmgr.c:5871 alg_test+0=
x5f0/0x614
[   28.475716] alg: self-tests for hmac(md5) using mv-hmac-md5 failed (rc=
=3D-80)
[   28.475724] Modules linked in: marvell_cesa libdes libaes
[   28.475752] CPU: 0 UID: 0 PID: 390 Comm: cryptomgr_test Tainted: G      =
  W           6.15.0-rc5+ #4 NONE=20
[   28.475770] Tainted: [W]=3DWARN
[   28.475772] Hardware name: Marvell Armada 380/385 (Device Tree)
[   28.475774] Call trace:=20
[   28.475780]  unwind_backtrace from show_stack+0x10/0x14
[   28.475799]  show_stack from dump_stack_lvl+0x50/0x64
[   28.475818]  dump_stack_lvl from __warn+0x7c/0xd4
[   28.475831]  __warn from warn_slowpath_fmt+0x110/0x16c
[   28.475853]  warn_slowpath_fmt from alg_test+0x5f0/0x614
[   28.475865]  alg_test from cryptomgr_test+0x18/0x38
[   28.475872]  cryptomgr_test from kthread+0xe8/0x204
[   28.475881]  kthread from ret_from_fork+0x14/0x28
[   28.475888] Exception stack(0xf0b05fb0 to 0xf0b05ff8)
[   28.475893] 5fa0:                                     00000000 00000000 =
00000000 00000000
[   28.475897] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   28.475902] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   28.475904] ---[ end trace 0000000000000000 ]---

