Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAD011C83
	for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 13:32:25 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fbc060a2caso3932055e9.3
        for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 06:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688045543; x=1690637543;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vCNFfEAbLHyMqZFM6llkFTJRY+kQekzRP0RrqaYUy78=;
        b=HskV4C783dd9XjnLO3UPWQNHPOEgfdNsuYPbJAE7KjgNp8FtRl9zpGOg6Lsh8aUZmS
         ftJgw15Hd2cnAwy6Gqo1x690oceBY+OoZ9OuP8RcBLnjmMcU3mzslAxeI8R1lsscUj/8
         2lIQ/gf6nD4S6lMoq97jYGx0KMl2w9GoJ0+ONiS2X9WsmEC2liizlirxd5agDu7asJ3m
         oQ79nmS/VM0UUmu2kFclu8oHLD0Gd6aWQryU3vAZWeAPx/k9rATpYABsusWzfelb2Kpi
         Skq8P4m7DmZWUFg6qNxjmeZqsA2rH0xW0GvGITrZ/5V2ixqTwiddwuQQik0y9b/+YgZX
         A4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688045543; x=1690637543;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vCNFfEAbLHyMqZFM6llkFTJRY+kQekzRP0RrqaYUy78=;
        b=gvfKvh+3L9mhWBQMQKFqI+Bp7nNJcFabc++kZrz6qPphIeksNX1odib7R9lmAHga3n
         Ovt6CoecH2CL+qrImpac23ckXPP2qe/RP/lnuz1HomnOXdYwXsd80OKvIDdczaM5eSZ2
         LT83Ir9kqdNDGlUjP3kRWX9pwAufXEm3ViZu9ugWyiVMyvmgM57QMz26wZ159FmcrtLB
         FSYs7zeYqy8AInoaN3cnl/LvcFo72Z5JhlhcVtw2mYhQxF1IGahh1pmVEpSSpu2GOnxf
         rzJS+JL7u21UXIh2EuYjnHPB3xSHJQyBXxYUILHdPZq+RBxFlaXeUFw3FXgsoLDPxNvx
         4Mcg==
X-Gm-Message-State: AC+VfDw5l4GQZeliAzotXRWKECOb2JSHoCmuGWHCqrz6gzgnHEXO0wqH
	gl59a9Bqv6kuCUGuir7K/h8=
X-Google-Smtp-Source: ACHHUZ6nJLsWqU4SPC+H50CZgItQBxSSpPEPOrwQtTyPsyZwAstUdKLEPtJpZvNoI90rcQnh3WcdGQ==
X-Received: by 2002:a1c:e90d:0:b0:3f8:fc2a:c7eb with SMTP id q13-20020a1ce90d000000b003f8fc2ac7ebmr27588599wmc.5.1688045542818;
        Thu, 29 Jun 2023 06:32:22 -0700 (PDT)
Received: from debian ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id m9-20020adff389000000b00313f551b032sm10122946wro.53.2023.06.29.06.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 06:32:22 -0700 (PDT)
Date: Thu, 29 Jun 2023 14:32:20 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Yu Kuai <yukuai3@huawei.com>, Song Liu <song@kernel.org>
Cc: linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	regressions@lists.linux.dev
Subject: mainline build failure due to 8295efbe68c0 ("md/raid1-10: factor out
 a helper to submit normal write")
Message-ID: <ZJ2H5FWuo9oDMgPm@debian>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

The latest mainline kernel branch fails to build x86_64, arm64 and arm allmodconfig
with clang (version 16.0.1), and the error is:

In file included from drivers/md/raid1.c:52:
drivers/md/raid1-10.c:119:25: error: casting from randomized structure pointer type 'struct block_device *' to 'struct md_rdev *'
        struct md_rdev *rdev = (struct md_rdev *)bio->bi_bdev;
                               ^

git bisect pointed to 8295efbe68c0 ("md/raid1-10: factor out a helper to submit normal write").

Reverting the commit has fixed the build failure.

I will be happy to test any patch or provide any extra log if needed.

#regzbot introduced: 8295efbe68c080047e98d9c0eb5cb933b238a8cb

-- 
Regards
Sudip
