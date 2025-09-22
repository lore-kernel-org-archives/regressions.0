Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058133054E9
	for <regressions@lists.linux.dev>; Mon, 22 Sep 2025 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542349; cv=none; b=Oqmo2cr/FJ4YupNpWl759wUE+Hgmvt8J8GlQZmiH3mcMeJcpcH0BRBhKh5UGUiaLAX3sEPFv4Ijcs/MwGQl0pjYZagP5zVuhtUhgRiO+M+p+aI0aGa6LG+S1lwOapjKSHpizhzNmIixe05IIOxzzHTa/YBAIz4hireX96s790Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542349; c=relaxed/simple;
	bh=rEwZQCl2kLqparyM2Vvi6pKeJ586h+Hlnko9n4oM7Mc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Rd5tmQyX5/lKsAAZ4fjK8EDlJ9cE2hSStT+A/IaOsy7fulrjYr+znz26uhoEEvtkHgsWc4qplB5y/uGQNm4SKsECi4duRsEInZTELMSA6sCx0UTSv9b0UnO4IttondzJD1V/Xxg10GUvHyRgpi6eCOYKMXTle7rMX+poJEKlDds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=WyFw1H8V; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="WyFw1H8V"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-279e2554b6fso4985095ad.2
        for <regressions@lists.linux.dev>; Mon, 22 Sep 2025 04:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758542346; x=1759147146; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQH7pPh1Sjb9Crvn0LF0FKaZmkeW4LiN21oBQrxkEcQ=;
        b=WyFw1H8VQ6+p5HiTv9U0sbWhgY1U8cuzrZcQX5MyyIXAGjIAYr+Yq+Za3w4uBwg1lj
         hWRjgkINGfflwl9lZMjS0w6+JwX+hyO322psmQgWCdvJqr/bGZy8R6nYSOxCRt501wfC
         uIyfvCABT5fERMCbM0B7FgcCd3nH4WU6xdy48s9v8VzaDChwUhw6XJap/TUjV5Geilep
         Q2BU7xehGFjyoZqij6Kbwdjno6wpQS8jQYiZPFavoeLLg9qJ6EMCD3pKDSqnAY7z7LXW
         PFYQDeLXY5dy9HYIz568JfJXN+SkGlA1fhmfO6wSln3fecZUHqrFKzZOnEV9KEBTtkUw
         Vkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758542346; x=1759147146;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oQH7pPh1Sjb9Crvn0LF0FKaZmkeW4LiN21oBQrxkEcQ=;
        b=rcHnsfaGskFuCF3HPIzp3KnxCAhoqTdTgwsPZePsBFn4dZpx3OTLVhEo5et+Jdw2KL
         P+JbsPXLrHpBmRGodZ8tU6Efap5gbI1RacRaP3tvXHczN9RRmFWfhtCtxukhZ4YHyvzh
         ijLjnexZYuudMsnbtvMRlVYpI4gHTNBqdL2N33g0r5H1sWLUTXqzGNG+t49LsOuHPldL
         elxVf5MHO8Xq7Uc4GGHlMWkqhZAHoF+RZdJ7FVL1yNUW1mp7xI+rVsnus+ZaGtYkgZN9
         +zKcy1cE0UdOkWZcXN8J4uqzVWziyHxfJNfOZ7bjsSZ6oIeqUkdLLLOy+1fxV8lng0fZ
         1+Yg==
X-Gm-Message-State: AOJu0YznO5cKnvXvtEEIiqLW1XuSOp/XGsOjK9KY+RXKxG5L5irZAl1I
	3fkF6SmoLialw/ForI6atR7zxb5u2aAHDmnYlA3bZ6NHojWENW6NYkNZpkgnJeQ1ZwM=
X-Gm-Gg: ASbGncsjaTQxeAlFNUq0pZwg0nAVYc1txhHSTPYBuu0TFmvbMeKnPsa71sctDqi0zWy
	3ByxLDONokQ+Q5a1gO6/6jAXLHjC+v7igLNwMOugFjVMPxbEesGGvEghXj3YX27gbEjFbTTD9wY
	m0XCYg8a6MDeum9VNPhKz2HvUgruz0uh4P9INwaZ7h1Z/Rbe1DGvzDAmwFFQ2xdPgk8pslL02SO
	mANKqlMs3iM7UISwzKrtSIHjmmNCzZSBmTRmJ5B1efaJnrlG5CsB7yKsk9atv0uhO+jIJB7LT1u
	IuCL86SOwUhhkGePvl7CN2ZgHTJQe7Sb4vQMv9Cu/XbvPgrEtUha6rIEVnTC9EsjFfTx1hdT9rn
	S311SiXSa87AgrO6Y
X-Google-Smtp-Source: AGHT+IGcree0ZMf3YB3uRs9Rg0qxg1gCxlMaY6C6+lUh2ItTw4KZ8WnTFp5oIpU9E0oyVPDlvmn+MQ==
X-Received: by 2002:a17:902:f686:b0:25c:b1d6:c41a with SMTP id d9443c01a7336-269ba434d24mr154065215ad.11.1758542346081;
        Mon, 22 Sep 2025 04:59:06 -0700 (PDT)
Received: from 166871acc15a ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980303456sm131919635ad.96.2025.09.22.04.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?q?=5BREGRESSION=5D_next/master=3A_=28build=29_implicit_declaration_o?=
 =?utf-8?q?f_function_=E2=80=98F=E2=80=99_=5B-Werror=3Dimplicit-function-de?=
 =?utf-8?q?=2E=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 22 Sep 2025 11:59:04 -0000
Message-ID: <175854234379.725.11726275319419663408@166871acc15a>





Hello,

New build issue found on next/master:

---
 implicit declaration of function ‘F’ [-Werror=implicit-function-declaration] in arch/x86/kvm/emulate.o (arch/x86/kvm/emulate.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:ec1d28aaff2a1b8f5b95187d16e2791bddbb5367
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  bf2602a3cb2381fb1a04bf1c39a290518d2538d1
- tags: next-20250922


Log excerpt:
=====================================================
arch/x86/kvm/emulate.c:4091:9: error: implicit declaration of function ‘F’ [-Werror=implicit-function-declaration]
 4091 |         F(DstMem | SrcNone | Lock,              em_inc),
      |         ^
arch/x86/kvm/emulate.c:4091:9: error: initializer element is not constant
arch/x86/kvm/emulate.c:4091:9: note: (near initialization for ‘group5[0].flags’)
arch/x86/kvm/emulate.c:4092:9: error: initializer element is not constant
 4092 |         F(DstMem | SrcNone | Lock,              em_dec),
      |         ^
arch/x86/kvm/emulate.c:4092:9: note: (near initialization for ‘group5[0].intercept’)
arch/x86/kvm/emulate.c:3993:21: error: field name not in record or union initializer
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                     ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:21: note: (near initialization for ‘group5[0].pad’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                     ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:30: error: conversion from ‘long long unsigned int’ to ‘unsigned char’ changes value from ‘220676381741154496’ to ‘192’ [-Werror=overflow]
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                              ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:36: error: field name not in record or union initializer
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                    ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:36: note: (near initialization for ‘group5[0].pad’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                    ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:49: error: initialization of ‘unsigned char’ from ‘int (*)(struct x86_emulate_ctxt *)’ makes integer from pointer without a cast [-Werror=int-conversion]
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                                 ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:49: note: (near initialization for ‘group5[0].pad[1]’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                                 ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:49: error: initializer element is not computable at load time
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                                 ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:49: note: (near initialization for ‘group5[0].pad[1]’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                                 ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:4090:39: error: missing braces around initializer [-Werror=missing-braces]
 4090 | static const struct opcode group5[] = {
      |                                       ^
 4091 |         F(DstMem | SrcNone | Lock,              em_inc),
      |         {
arch/x86/kvm/emulate.c:3993:22: error: ‘union <anonymous>’ has no member named ‘flags’
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                      ^~~~~
arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro ‘I’
 4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
      |         ^
arch/x86/kvm/emulate.c:3993:30: error: initialization of ‘int (*)(struct x86_emulate_ctxt *)’ from ‘long long unsigned int’ makes pointer from integer without a cast [-Werror=int-conversion]
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                              ^
arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro ‘I’
 4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
      |         ^
  CC      mm/highmem.o
arch/x86/kvm/emulate.c:3993:30: note: (near initialization for ‘group5[0].u.execute’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                              ^
arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro ‘I’
 4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
      |         ^
arch/x86/kvm/emulate.c:3993:37: error: ‘union <anonymous>’ has no member named ‘u’
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                     ^
arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro ‘I’
 4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
      |         ^
arch/x86/kvm/emulate.c:3993:49: error: excess elements in union initializer [-Werror]
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                                 ^
arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro ‘I’
 4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
      |         ^
arch/x86/kvm/emulate.c:3993:49: note: (near initialization for ‘group5[0].u’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                                 ^
arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro ‘I’
 4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
      |         ^
arch/x86/kvm/emulate.c:4090:39: error: missing braces around initializer [-Werror=missing-braces]
 4090 | static const struct opcode group5[] = {
      |                                       ^
 4091 |         F(DstMem | SrcNone | Lock,              em_inc),
      |         {
arch/x86/kvm/emulate.c:4095:9: error: braces around scalar initializer [-Werror]
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:4095:9: note: (near initialization for ‘group5[0].check_perm’)
arch/x86/kvm/emulate.c:3993:21: error: field name not in record or union initializer
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                     ^
arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro ‘I’
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:21: note: (near initialization for ‘group5[0].check_perm’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                     ^
arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro ‘I’
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:30: error: initialization of ‘int (*)(struct x86_emulate_ctxt *)’ from ‘long long unsigned int’ makes pointer from integer without a cast [-Werror=int-conversion]
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                              ^
arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro ‘I’
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:30: note: (near initialization for ‘group5[0].check_perm’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                              ^
arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro ‘I’
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:36: error: field name not in record or union initializer
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                    ^
arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro ‘I’
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:36: note: (near initialization for ‘group5[0].check_perm’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                    ^
arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro ‘I’
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:49: error: excess elements in scalar initializer [-Werror]
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                                 ^
arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro ‘I’
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:49: note: (near initialization for ‘group5[0].check_perm’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                                 ^
arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro ‘I’
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:4090:39: error: missing braces around initializer [-Werror=missing-braces]
 4090 | static const struct opcode group5[] = {
      |                                       ^
 4091 |         F(DstMem | SrcNone | Lock,              em_inc),
      |         {
arch/x86/kvm/emulate.c:4090:39: error: missing braces around initializer [-Werror=missing-braces]
arch/x86/kvm/emulate.c:4090:39: error: missing braces around initializer [-Werror=missing-braces]
arch/x86/kvm/emulate.c:4090:39: error: missing braces around initializer [-Werror=missing-braces]
  CC      crypto/gcm.o
cc1: all warnings being treated as errors

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.6/x86_64/chromeos-amd-stoneyridge.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d130d075b320799d36f202

## cros://chromeos-6.6/x86_64/chromeos-intel-pineview.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d130d375b320799d36f209


#kernelci issue maestro:ec1d28aaff2a1b8f5b95187d16e2791bddbb5367

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
