Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFACC13FED
	for <regressions@lists.linux.dev>; Tue, 24 Oct 2023 07:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFKCV29J"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1cab2c24ecdso25739865ad.0
        for <regressions@lists.linux.dev>; Tue, 24 Oct 2023 00:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698134133; x=1698738933; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rryMd0X9WV6QFu55eyAQUdUJEIXyug/kgmEK9WWRvfQ=;
        b=MFKCV29JyLCrSZ3RMMpE72bB/DRTLTK9EDa2iJLPLc6lkFt6Ta9zY20HMJ0psky346
         LLsOAUdJk1UORi5+BjUD1/XjaHnlqKrU9jXSabYa15pzUTtxmhe1D3R/ax0jEm3diZtO
         gaCuL3bZz4u8uP5l/6nc5Iz9SEO+mVa5y7uwJm3Np6t9oJKLh1PO2cW7n2WEAIWTfS0C
         krVdyzUizKnRa8W3qvK1p/i3kJHJ4In/bvoy/hsbcmftTpBkLgA4TPT5kT/pHtNcRhr6
         JbBXf7Fat0ztr1kuSXxX5LOGiFOUGfB+zz589taiDpsG797ra9GeArucMlO64ByGnubc
         Cx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698134133; x=1698738933;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rryMd0X9WV6QFu55eyAQUdUJEIXyug/kgmEK9WWRvfQ=;
        b=sr4P/5ntNmjWJWjg17RgjcqQ2+figX3S8E9w9gc/oyA9qyXGpOmRVhJMFXu2JkRK44
         eCIbDzFoFacosO9BQZ8gRuAIqk5yqOgj02sshHhDOQ9TlT/VAuVU/hpj7o6PTkYQS0zS
         cWyc1fFwUCpeTtvu8cGqJ7bMmKygGnGbqNCHcpHWp/kF74EY0Ttz2ZTb7/aQhc6IgV0c
         do1Fg6ysxqq4sD+TnYqAB4ulwRDzey/has/o92H5vaHlS0OMhmrV/tuxj6+LJV/HDe4I
         e7x41A+xqc9FrFZVOJ36YPeV2Vyvtg09LwMfRkw7LqD4naeaDyW2L3PDXXicgzuzI6bL
         u2YA==
X-Gm-Message-State: AOJu0Yyqhix3hmkJAzOwiFTNeoFlb6Dv2ycZO15uHiiT0FAFs3BpMVl/
	roY9Wpu1ZRJhbGb7sssv/DM=
X-Google-Smtp-Source: AGHT+IFzIRaOleX12I4ui38DgrzuR5MDHSegKCH+0WDtTjaT5p3P/qRLJ2gPYCdahRV3qCjph6dhEw==
X-Received: by 2002:a17:902:ca0b:b0:1c4:72c9:64ef with SMTP id w11-20020a170902ca0b00b001c472c964efmr7090388pld.40.1698134133184;
        Tue, 24 Oct 2023 00:55:33 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id iy17-20020a170903131100b001ca86a9caccsm7051112plb.228.2023.10.24.00.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 00:55:32 -0700 (PDT)
Message-ID: <429b452c-2211-436a-9af7-21332f68db7d@gmail.com>
Date: Tue, 24 Oct 2023 14:55:27 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Filesystem Development <linux-fsdevel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
Cc: Chuck Lever <chuck.lever@oracle.com>,
 Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, vladbu@nvidia.com
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Memleaks in offset_ctx->xa (shmem)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> We have been getting memleaks in offset_ctx->xa in our networking tests:
> 
> unreferenced object 0xffff8881004cd080 (size 576):
>   comm "systemd", pid 1, jiffies 4294893373 (age 1992.864s)
>   hex dump (first 32 bytes):
>     00 00 06 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     38 5c 7c 02 81 88 ff ff 98 d0 4c 00 81 88 ff ff  8\|.......L.....
>   backtrace:
>     [<000000000f554608>] xas_alloc+0x306/0x430
>     [<0000000075537d52>] xas_create+0x4b4/0xc80
>     [<00000000a927aab2>] xas_store+0x73/0x1680
>     [<0000000020a61203>] __xa_alloc+0x1d8/0x2d0
>     [<00000000ae300af2>] __xa_alloc_cyclic+0xf1/0x310
>     [<000000001032332c>] simple_offset_add+0xd8/0x170
>     [<0000000073229fad>] shmem_mknod+0xbf/0x180
>     [<00000000242520ce>] vfs_mknod+0x3b0/0x5c0
>     [<000000001ef218dd>] unix_bind+0x2c2/0xdb0
>     [<0000000009b9a8dd>] __sys_bind+0x127/0x1e0
>     [<000000003c949fbb>] __x64_sys_bind+0x6e/0xb0
>     [<00000000b8a767c7>] do_syscall_64+0x3d/0x90
>     [<000000006132ae0d>] entry_SYSCALL_64_after_hwframe+0x46/0xb0
> 
> Memleak trace points to some syscall performed by systemd and none of our tests do anything more advanced with it than 'systemctl restart ovs-vswitchd'. Basically it is a setup with Fedora and an upstream kernel that executes bunch of network offload tests with Open vSwitch, iproute2 tc, Linux bridge, etc.
> 
> It looks like those may be caused by recent commit 6faddda69f62 ("libfs: Add directory operations for stable offsets") but we don't have a proper reproduction, just sometimes arbitrary getting the memleak complains during/after the regression run.

See Bugzilla for the full thread.

Anyway, I'm adding it to regzbot:

#regzbot introduced: 6faddda69f623d https://bugzilla.kernel.org/show_bug.cgi?id=218039
#regzbot title: stable offsets directory operation support triggers offset_ctx->xa memory leak

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218039

-- 
An old man doll... just what I always wanted! - Clara
