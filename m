Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AEE4071E9
	for <regressions@lists.linux.dev>; Mon, 15 Jun 2026 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539147; cv=none; b=oU3vieJ6FroqNhmPpV/Tt0d/iT+68Ug7RE6v4mGaO0Lz4rMdfGmeMlCG5OhArN5BaIPI0F8qR3d9LQuEsQ8s/LKMQEZb6Nas1ztq3xJdwuDBniD3mz9FzSD3VPQdtY0Oaz9GPLpfftPGqRwuoyndS86MlsYTQ0dTTec8FPRH/GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539147; c=relaxed/simple;
	bh=h9WtLBt7aXoEerx3JYYDClbxGXJc5p9lpfgPJl3St0s=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=U/6dF2GeDgJE4puIIjFs4rLAfLiptvIcmX+bK60lVMUSur8oFX5VNdbzFtuJFlndWbjt4Lb267WC14C1oBp+N0Tzp5tzD2M+ANb8QE0F9u+TyRLHpJ0igAAiUmeHB2xph30JEyaHlEQ4PJdoOjnORHw0ks7ZWUToQMzLXA8FX9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=A929Uc4o; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="A929Uc4o"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1390f75d8bbso4478122c88.0
        for <regressions@lists.linux.dev>; Mon, 15 Jun 2026 08:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781539145; x=1782143945; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhvhhvBBu9uGx40m6SrfaOHHRfJTVRO4+8KVZRHE9cs=;
        b=A929Uc4o1/sryYUYbygklK0rqImQUOd9GqcSm29Kjg/KDH+diy6qvK3ay/XvIE/DJ2
         oniVauxWwlEdZo2qotMFutxTlLzoh3QS4V+8/bvxWskURpAb6BpnWKpSQ7UIQ6G/ua7n
         Ukk7d3wxBCMaSoCc4+P/E1RSA7Eym+dI0vS9kEVfEcxu/i53IErqAdx7r/ID2tvsr/VT
         Zh4R29wiN1yDjqJGX9EkP02twTLFk/KQqKpcEuLkPETnFOliBtNfVbFyhSbVNWA4wtoh
         4Trpi5NLtp2CyvhEb+mFWXWNlMKX3I2iUV0bgUKGOTnlw5EPEAoWWSlXMOIH9ojPJ7RP
         uJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781539145; x=1782143945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MhvhhvBBu9uGx40m6SrfaOHHRfJTVRO4+8KVZRHE9cs=;
        b=QkvtbQKt8tlYw3gLgFPno3AZGfjsRnUeaSqCi1+9dia7I82pwTC7GDTx5mQfe6tIO9
         rwWvS5ZdOYRvMDI4vMA3im/J/mj8Nkr7gLuThVAOLHsGsh4r+kIzYeFhgUnCoQM7qJ+G
         GS1BUtHKWovOHAlWqx9q+LosxcWr6Ir2NR1IURZoVYsz5CQduSh1e/YuWARlFROrhHyI
         mSN0bCrN97UwY2Vo28ZcdpTWkzh+pG3N7xHQapoJh3TmukkZ+7f0jw/P04Duv5uv98yx
         +/YtKjmY6xcbpjSwQrGwrXEQGGGPfWMmpspWd+wbCtx8LFUuGb6JSoT872s09IPcyrq3
         o0Eg==
X-Gm-Message-State: AOJu0YyzT2ciOvpJ0Hro6dpm7SUdKDDnzLKs3gdr/mOE2mAtJRTMljnm
	aikdcRudVc5e/1s0VFnnEDiKKPBBBRBN8jEtvXkGC8g4Ruy7zmgEl8KgzlI0tbOCCGre6t9oEv5
	4Bs1X
X-Gm-Gg: Acq92OEKeQQ0n5Fj7xzZq9+JaJ0/xeR0b7tSb3x9dElBn96vbvtgfEayH4V6cmyCqmw
	2dO7GiDFbQpDtp05eLzyB76TC4V71lTkAhF8hkugeJVedlL1nuYB8mYnN2ADKOmSH45pb0qpSHT
	AEJDaKOCacQ5tRPukMnHNxJKT5EV1eIjX31NBKe1bwcVLD6Fk8VE+dc7L5H7ECNlbp0qLW4/e1T
	U2wqJZSsg+KXQmOrL6t9tmYscMQ7gjTpDlNAcWY2uXdYDRMw10SsJaVho3rIywj8ymbwwecBs0M
	kA7o0kmKlC1sk7Ba7MIsRdQ5MIfM6YeChOpWHJfmWOqL6wx8PDmuloZ5aXG2dkUZdqZ8gMgSaUT
	j5fhVWzfksB/Sk9lSNwFIbQK2aHB3JKFLCkQmBjGzrtN0IhIr8hbELRk3ddJfiiZxCZZZhcDoLu
	/6OnETxih7BEWtYKZ5
X-Received: by 2002:a05:7022:6087:b0:12d:b7e5:a67b with SMTP id a92af1059eb24-1384bb361b9mr7540341c88.14.1781539144964;
        Mon, 15 Jun 2026 08:59:04 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b964862sm10902662c88.10.2026.06.15.08.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) passing argument 1 of
 '__do_kmalloc_node'
 makes pointer from integ...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 15 Jun 2026 15:59:04 -0000
Message-ID: <178153914414.15282.5994241043459847090@330cfa3079ca>





Hello,

New build issue found on next/master:

---
 passing argument 1 of '__do_kmalloc_node' makes pointer from integer without a cast [-Wint-conversion] in mm/slub.o (mm/slub.c) [logspec:kbuild,kbuild.compiler.warning]
---

- dashboard: https://d.kernelci.org/i/maestro:88b7de4573d3ff7942d5e1c391739d0d3854fe51
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  700f8f17ac2c84f94b7cf4420f306a23a5ddfd24


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
mm/slub.c:5552:42: warning: passing argument 1 of '__do_kmalloc_node' makes pointer from integer without a cast [-Wint-conversion]
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                                          ^~~~
      |                                          |
      |                                          size_t {aka unsigned int}
mm/slub.c:5340:39: note: expected 'struct kmem_cache * (*)[15]' but argument is of type 'size_t' {aka 'unsigned int'}
 5340 | void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
      |                         ~~~~~~~~~~~~~~^
In file included from ./include/uapi/linux/posix_types.h:5,
                 from ./include/uapi/linux/types.h:14,
                 from ./include/linux/types.h:5,
                 from ./include/linux/kasan-checks.h:5,
                 from ./include/asm-generic/rwonce.h:26,
                 from ./arch/arc/include/generated/asm/rwonce.h:1,
                 from ./include/linux/compiler.h:369,
                 from ./arch/arc/include/asm/ptrace.h:11,
                 from ./arch/arc/include/asm/bug.h:11,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/mmdebug.h:5,
                 from ./include/linux/mm.h:7,
                 from mm/slub.c:15:
./include/linux/stddef.h:8:14: warning: passing argument 2 of '__do_kmalloc_node' makes integer from pointer without a cast [-Wint-conversion]
    8 | #define NULL ((void *)0)
      |              ^~~~~~~~~~~
      |              |
      |              void *
mm/slub.c:5552:48: note: in expansion of macro 'NULL'
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                                                ^~~~
mm/slub.c:5340:48: note: expected 'gfp_t' {aka 'unsigned int'} but argument is of type 'void *'
 5340 | void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
      |                                          ~~~~~~^~~~~
mm/slub.c:5552:61: error: incompatible type for argument 4 of '__do_kmalloc_node'
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                                                             ^~~~
      |                                                             |
      |                                                             int
mm/slub.c:5341:41: note: expected 'kmalloc_token_t' but argument is of type 'int'
 5341 |                         kmalloc_token_t token, struct slab_alloc_context *ac)
      |                         ~~~~~~~~~~~~~~~~^~~~~
In file included from ./include/linux/mm.h:34:
./include/linux/slab.h:520:41: error: incompatible type for argument 5 of '__do_kmalloc_node'
  520 | #define PASS_TOKEN_PARAM(_token)        ((kmalloc_token_t){})
      |                                         ^~~~~~~~~~~~~~~~~~~~~
      |                                         |
      |                                         kmalloc_token_t
mm/slub.c:5553:33: note: in expansion of macro 'PASS_TOKEN_PARAM'
 5553 |                                 PASS_TOKEN_PARAM(token), &ac);
      |                                 ^~~~~~~~~~~~~~~~
mm/slub.c:5341:75: note: expected 'struct slab_alloc_context *' but argument is of type 'kmalloc_token_t'
 5341 |                         kmalloc_token_t token, struct slab_alloc_context *ac)
      |                                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
mm/slub.c:5552:24: error: too many arguments to function '__do_kmalloc_node'
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                        ^~~~~~~~~~~~~~~~~
mm/slub.c:5340:7: note: declared here
 5340 | void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
      |       ^~~~~~~~~~~~~~~~~
  CC      lib/zlib_inflate/inflate_syms.o
mm/slub.c:5558:1: error: control reaches end of non-void function [-Werror=return-type]
 5558 | }
      | ^
cc1: some warnings being treated as errors

=====================================================


# Builds where the incident occurred:

## haps_hs_smp_defconfig on (arc):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arc-haps_hs_smp_defconfig-6a301b2ca1ade4ad5d108e15/.config
- dashboard: https://d.kernelci.org/build/maestro:6a301b2ca1ade4ad5d108e15


#kernelci issue maestro:88b7de4573d3ff7942d5e1c391739d0d3854fe51

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
