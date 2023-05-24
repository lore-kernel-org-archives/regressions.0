Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D9B1FB1
	for <regressions@lists.linux.dev>; Wed, 24 May 2023 10:58:14 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-253e0f1e514so70119a91.1
        for <regressions@lists.linux.dev>; Wed, 24 May 2023 03:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684925893; x=1687517893;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtNtYGFCrVyZey4VNLOickd29YxbAE5d03gdnH81J+U=;
        b=l3Y8DRIQWeZSAkdFMfWSj0ifqiRCoUl+MxNzyGPTw4ZMaQ6QWphZ802TjCA9rSm9so
         WMG3R44sc0gr+xXBTBY7TCuICT3d45vwv+Fhc2Kif7HhDdftbNF0EkAGL8oVUJSe2Eay
         ZUaEtkJpPuwE8y8NK/iA7PUeSMknfa4tcoav5tGrXwUQFy8oRiNb9MqyPcTeGkb27rHp
         hMzPGBz5WgbeekaXTC+5mYde3P4XFoDPx30/BpGiJJRyymxVzStX6k13W/tbQ/2bM4zm
         Va38TCsEtvSD8nOdlVZbYfj30hYNmcztUhE7KWlVnuBOtz6HCt6W+ZPxpyac7saVfI9j
         9sDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684925893; x=1687517893;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EtNtYGFCrVyZey4VNLOickd29YxbAE5d03gdnH81J+U=;
        b=Nj3FbZEfV3n+Xnl8RLKfPagH5FwPWQ35IGh7IaBKB9085OPI0v/WTXFr6ljE0f+Rha
         wjFdvKuXpHLshkDCktna64VsIIhKg/V76+xXvKDSBhJSLmwdo8U4vHUSWiTpdAs0QFl+
         Gcipun07KtWU+wUtorhLTGx4WiNERqTs31dmO8dxW9wg5DOkNLdHmF7BKafkpd25ktNK
         ccl3933GKmrr+4gtEkfaOnSC8xuDn/JwK35yGCwo3/s0Kn6Qdj0H9aZWLpdvPEWt6Uyk
         go9gZFLKnOABXBk73Ur5Ke0bLYH3yrpWWy6njwp1RhRFZ56r2JTwOuPI/oa7vzlvZ8xh
         jyrQ==
X-Gm-Message-State: AC+VfDwteiWcFhCcDYbRbae/hw0wH2vhq8aPT9bwyZIeInvmDofoQACE
	Xy/TaJ1ikAO9/KDn5Wa09qo=
X-Google-Smtp-Source: ACHHUZ4x3mbRZza/OnPc7Hf62AB/tvNESZBkKaby/M3eKCGQRKizRlGE/zRB69YbxrIb8Twc5v/liA==
X-Received: by 2002:a17:90a:bf8b:b0:253:727e:4b41 with SMTP id d11-20020a17090abf8b00b00253727e4b41mr15726441pjs.34.1684925893529;
        Wed, 24 May 2023 03:58:13 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-28.three.co.id. [180.214.232.28])
        by smtp.gmail.com with ESMTPSA id i2-20020a17090ac40200b0024de39e8746sm1110323pjt.11.2023.05.24.03.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 03:58:13 -0700 (PDT)
Message-ID: <2a1cd5e6-01f7-66f9-1f9d-c655cc3f919b@gmail.com>
Date: Wed, 24 May 2023 17:58:07 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Regressions <regressions@lists.linux.dev>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Zi Yan <ziy@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 doru iorgulescu <doru.iorgulescu1@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Disha Goel <disgoel@linux.vnet.ibm.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: ./include/linux/mmzone.h:1735:2: error: #error Allocator
 MAX_ORDER exceeds SECTION_SIZE (v6.4-rc3 build regression)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a powerpc[64?] build regression on Bugzilla [1]. Quoting from it:

>  CC      arch/powerpc/kernel/asm-offsets.s
> In file included from ./include/linux/gfp.h:7,
>                 from ./include/linux/xarray.h:15,
>                 from ./include/linux/list_lru.h:14,
>                 from ./include/linux/fs.h:13,
>                 from ./include/linux/compat.h:17,
>                 from arch/powerpc/kernel/asm-offsets.c:12:
> ./include/linux/mmzone.h:1735:2: error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
> 1735 | #error Allocator MAX_ORDER exceeds SECTION_SIZE
>      |  ^~~~~
> make[5]: *** [scripts/Makefile.build:114: arch/powerpc/kernel/asm-offsets.s] Error 1

Apparently removing the errored line solves the problem for the reporter
(the attached dmesg on [2] looks fine at a glance).

Anyway, I'm adding it to regzbot:

#regzbot introduced: 23baf831a32c04f https://bugzilla.kernel.org/show_bug.cgi?id=217477
#regzbot title: Allocator MAX_ORDER exceeds SECTION_SIZE caused by MAX_ORDER redefinition

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217477
[2]: https://bugzilla.kernel.org/show_bug.cgi?id=217477#c1

-- 
An old man doll... just what I always wanted! - Clara
