Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405192BE7BB
	for <regressions@lists.linux.dev>; Mon, 22 Sep 2025 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542349; cv=none; b=E94zYe1+ThCCn8OlodPC+qLTlvIuqnjM3+EAcQG/DsBNDkLSKasYRPdqtnf1fa5WQPwG3DOHARjz7mgj7lZXMENXJEGmU1ESwLggSbbDqz/TVU0swcgsrBGPIyvnXxP7bTnJS+j0V2N0kU1nOyXRdfFLoI9NzLSFtPmxgqafa3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542349; c=relaxed/simple;
	bh=rEwZQCl2kLqparyM2Vvi6pKeJ586h+Hlnko9n4oM7Mc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ruqKR8DLb74O9wwTFWuYady0PEVaa0VR44ja/VrxdvlnakPzSAuzlf61RP2lWWAZbg6ovnvOlVZHLLPr/Sm1HYvGop6e9jLR/H5b3eLeE9qP9QI9Q1CCHq2DbEP+BQZXs0K0eUdvudO/EIhqGQAjrXmM5iobD+h4tyoEQ5j5vZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=wTEErwFJ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="wTEErwFJ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-32b8919e7c7so4848918a91.2
        for <regressions@lists.linux.dev>; Mon, 22 Sep 2025 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758542345; x=1759147145; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQH7pPh1Sjb9Crvn0LF0FKaZmkeW4LiN21oBQrxkEcQ=;
        b=wTEErwFJg6Lm7ZN7ZdEc3ieqdnSg81C/swCCJwjBCw7S7Mebe8/myN6GlYn/eHPYxW
         sy7JrT0RwPX63KNThAmZ+3hkdfnr728O2GuR4udYTogK0aEPEBLnbd/INCuMei5onVMf
         ewvwutS1rzhWBDblDRwmt+6SW0cYTXdwoXaR5ovZ3NBhQzISNmDIt5W1Fqs4ov1WrgU5
         ZNUy6EDzHZDCv2pznASsAO6LnuVrjYjoYL2SYxNR4xPL/5v7j9DougXr/V1LS3KFJIuX
         MZL3691NFerrHrY/e0oL46o+qEo/KZaBsJsZAVP0XF3d7pcoHcoaPDm/7E0Jtp3xngxw
         74xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758542345; x=1759147145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oQH7pPh1Sjb9Crvn0LF0FKaZmkeW4LiN21oBQrxkEcQ=;
        b=gMlwah27Ah87GLMw9ltLyDqGDqnY0h1DSr4pkOPgmNwgGsWv1d2OO1ATtA6mq+ixVG
         bsnoH8I08n8NzS5LQhkhGK9h5RjMWDur35qyozfsrEQEpaR61SG5nqZ/MwqHQ1t0tyzH
         oddtdFXWgj5YsAyNvdzofs796yQM1stfLm9IAgX1NIege2omb1O1ax/Ngp4bXA5v6f5H
         Ky53hNfWHYBdmqdrAhu6Syjs+HH71JGbbpEycw4tq2bu8WL92OsLJP1CuyrZHVmpQiPb
         4WExPvwiJoleoH10ZydFDlGotiaVchXw3M21V7Qo9SPlpEw9G/xQV6gzTg+uXZA2jhv1
         bvlQ==
X-Gm-Message-State: AOJu0YziaeGU41usNxb1jMqzAetRgtmGjy/zXsQrV68uqGZf3VJu+9Uf
	OsomjxXnwQlUy2VKN3BQf7muNPrgf/tFqPO9M/swHLcCtjJWbsbJmyiwEbLaKDECfDHegZ1Kq40
	tx7OlvK0=
X-Gm-Gg: ASbGncsADvk3YcS7EHhu9Wb+nZeI/iSxItx7n6LHBOfl/GWyk43KVhE6xrmTkinCRvU
	NeiKaX1ZBmEvZleLT5x+hic+SnK78k+n4YwAJ3lCixRRp1Bk2xSkfkFdwUa+BE5fh4nop2qy0+a
	+jD7bZwi0S1wqyL0ef2Yv+OEAr41xSp6D9P/W3wiMUc3yVAoNofbkJ1MQGiQ+l3A5FmDRpF2QdH
	KnYOrYj6jiOxxBSDdAP87xbSukEe7CeD4YiUvPgTkgbklNeomcQSzFawIKxlweIT9F+nXcCpPVg
	V8w+SoC0gDT9t/U7xcpGyUSdm5sSNG5TpSikaDvxV6dL+0I1irTpEO6Xq6khHaCGz0jjQzruxLe
	CHtcfDI768P2eV9dtHtpQn+uWhPU=
X-Google-Smtp-Source: AGHT+IHFLDlPUqXlFqRm4EJDPyAhOKyiDG5EifBvqbEW2P+7fzOZPuCaPUKqnZrlY+hXfVx351YteA==
X-Received: by 2002:a17:90b:33c8:b0:32e:64ca:e84a with SMTP id 98e67ed59e1d1-33097ff7032mr16457362a91.12.1758542345339;
        Mon, 22 Sep 2025 04:59:05 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ee4741086sm6811321a91.6.2025.09.22.04.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:59:04 -0700 (PDT)
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
Date: Mon, 22 Sep 2025 11:59:03 -0000
Message-ID: <175854234340.873.16561535782920336667@1dfac204f25d>





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
