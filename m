Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71A8197
	for <regressions@lists.linux.dev>; Fri, 24 Feb 2023 17:22:19 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id i202so6700394ioa.3
        for <regressions@lists.linux.dev>; Fri, 24 Feb 2023 09:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIhL+7wCr8VkTTgGU+GEYfZOk+G/RcroJUOmvYxXEp0=;
        b=PYTclbWmSrXk8nYGGaCdGXqFOKuW5+i4pwrgn8FgY3GZ3LCSq6mrOb4G7rwyCVpE6V
         6dBiicK01GMwMR73EpdvvJxkEaJ5uqhon0atfQ1Mr4ziwBCYmm5gEhoIFDVyO4oOEfOK
         WfwutPrqH4TEh1/S2P1PsJanRCT3kZXQDa/0nUEajXQk8a6VTD95CKBmKZwk106WHaFt
         H+QqE9Ux21kfrTWej+UQLrRNNpOOvHsS0XhEw6Xq9EOgT0yJ2oHB/5SRAXXbo6N/c9OW
         fUXMyIz4g/dlcvJ+BnMmmZ0S2i6ncdlxGMklcOREDbNtBkF9iaZzoVn85RoQmMW6HlBa
         QISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIhL+7wCr8VkTTgGU+GEYfZOk+G/RcroJUOmvYxXEp0=;
        b=ilk+SNzPWCdFgnQ9z0vAD4cNk//yYsIS3Q6WrHhmT1Pft8NcSbNbYztvYtnSYr3crL
         h0uvh18gdgWoiBE8l5M+lrdJwxjXk968N5i/VP6fsuprHs/KzXrpnKqaYeCEiA99rGSw
         4aVSojr1GJcN0N+29NitGPHR0n965lHYBA/SnLqwTPHlFZKymjSfWYWbrFdEJgFsZNvP
         5fpV4UeF6b/CTN5RZOi80AE/XjrxRHE9kLAJUAnkQuf2Jito0Rk15hwA04/yKy02fCu4
         u4HTAQjJx8izV0XZkd7MfVgltl2mrkBWFAdrldS9FNm7UoJwCczcqoWMVRTaEokBBW8c
         SLhw==
X-Gm-Message-State: AO0yUKUb1NppSEAtlwXRmeSoKarxISW7v/z5PrOuqn+RTV5KDsX5LnJy
	epNqhY1fPwcNrfwqVeJjkFc=
X-Google-Smtp-Source: AK7set/UEGsOEs1PXObz/cZCnFB7/vf45E85IfqMcKjp0BSpoYbyUTxSDxMs+CVBz9WXeF97FpaNVw==
X-Received: by 2002:a6b:d803:0:b0:74c:88df:2cbb with SMTP id y3-20020a6bd803000000b0074c88df2cbbmr9599394iob.3.1677259338830;
        Fri, 24 Feb 2023 09:22:18 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g14-20020a92c7ce000000b00314007fdbc2sm3959073ilk.62.2023.02.24.09.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:22:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 24 Feb 2023 09:22:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Josef Bacik <josef@toxicpanda.com>
Cc: linux-btrfs@vger.kernel.org, kernel-team@fb.com,
	regressions@lists.linux.dev
Subject: Re: [PATCH 8/8] btrfs: turn on -Wmaybe-uninitialized
Message-ID: <20230224172217.GA1224837@roeck-us.net>
References: <cover.1671221596.git.josef@toxicpanda.com>
 <1d9deaa274c13665eca60dee0ccbc4b56b506d06.1671221596.git.josef@toxicpanda.com>
 <20230222025918.GA1651385@roeck-us.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222025918.GA1651385@roeck-us.net>

Copying regzbot.

#regzbot ^introduced 1ec49744ba83
#regzbot title Build failures for sparc64:allmodconfig and parisc:allmodconfig with gcc 11.x+

On Tue, Feb 21, 2023 at 06:59:21PM -0800, Guenter Roeck wrote:
> On Fri, Dec 16, 2022 at 03:15:58PM -0500, Josef Bacik wrote:
> > We had a recent bug that would have been caught by a newer compiler with
> > -Wmaybe-uninitialized and would have saved us a month of failing tests
> > that I didn't have time to investigate.
> > 
> 
> Thanks to this patch, sparc64:allmodconfig and parisc:allmodconfig now
> fail to commpile with the following error when trying to build images
> with gcc 11.3.
> 
> Building sparc64:allmodconfig ... failed
> --------------
> Error log:
> <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
> fs/btrfs/inode.c: In function 'btrfs_lookup_dentry':
> fs/btrfs/inode.c:5730:21: error: 'location.type' may be used uninitialized [-Werror=maybe-uninitialized]
>  5730 |         if (location.type == BTRFS_INODE_ITEM_KEY) {
>       |             ~~~~~~~~^~~~~
> fs/btrfs/inode.c:5719:26: note: 'location' declared here
>  5719 |         struct btrfs_key location;
> 
> Bisect log attached.
> 
> Guenter
> 
> ---
> # bad: [8bf1a529cd664c8e5268381f1e24fe67aa611dd3] Merge tag 'arm64-upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
> # good: [c9c3395d5e3dcc6daee66c6908354d47bf98cb0c] Linux 6.2
> git bisect start 'HEAD' 'v6.2'
> # good: [e43efb6d713bca3855909a2f9caec280a2b0a503] dt-bindings: riscv: correct starfive visionfive 2 compatibles
> git bisect good e43efb6d713bca3855909a2f9caec280a2b0a503
> # bad: [1f2d9ffc7a5f916935749ffc6e93fb33bfe94d2f] Merge tag 'sched-core-2023-02-20' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> git bisect bad 1f2d9ffc7a5f916935749ffc6e93fb33bfe94d2f
> # bad: [553637f73c314c742243b8dc5ef072e9dadbe581] Merge tag 'for-6.3/dio-2023-02-16' of git://git.kernel.dk/linux
> git bisect bad 553637f73c314c742243b8dc5ef072e9dadbe581
> # good: [274978f173276c5720a3cd8d0b6047d2c0d3a684] Merge tag 'fixes_for_v6.3-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs
> git bisect good 274978f173276c5720a3cd8d0b6047d2c0d3a684
> # bad: [801fcfc5d790f4a9be2897713bd6dd08bed253f1] btrfs: raid56: add a bio_list_put helper
> git bisect bad 801fcfc5d790f4a9be2897713bd6dd08bed253f1
> # bad: [e2fd83064a9bae368ce1c88a0cb9aee64ad4e124] btrfs: skip backref walking during fiemap if we know the leaf is shared
> git bisect bad e2fd83064a9bae368ce1c88a0cb9aee64ad4e124
> # bad: [cb0922f264643f03b04352f7a04abb913c609369] btrfs: don't use size classes for zoned file systems
> git bisect bad cb0922f264643f03b04352f7a04abb913c609369
> # good: [cd30d3bc78d9acbd505d0d6a4cff3b87e40a8187] btrfs: zoned: fix uninitialized variable warning in btrfs_get_dev_zones
> git bisect good cd30d3bc78d9acbd505d0d6a4cff3b87e40a8187
> # bad: [235e1c7b872f9cf16e8a3e6050a05774b8763c58] btrfs: use a single variable to track return value for log_dir_items()
> git bisect bad 235e1c7b872f9cf16e8a3e6050a05774b8763c58
> # bad: [d31de3785047a24959eda835b0bafb1f8629f8a9] btrfs: go to matching label when cleaning em in btrfs_submit_direct
> git bisect bad d31de3785047a24959eda835b0bafb1f8629f8a9
> # bad: [1ec49744ba83f0429c5c706708610f7821a7b6f4] btrfs: turn on -Wmaybe-uninitialized
> git bisect bad 1ec49744ba83f0429c5c706708610f7821a7b6f4
> # good: [a6ca692ec22bdac5ae700e82ff575a1b5141fa40] btrfs: fix uninitialized variable warning in run_one_async_start
> git bisect good a6ca692ec22bdac5ae700e82ff575a1b5141fa40
> # first bad commit: [1ec49744ba83f0429c5c706708610f7821a7b6f4] btrfs: turn on -Wmaybe-uninitialized
