Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9E863AC
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaBzOs/t"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4084095722aso5441885e9.1
        for <regressions@lists.linux.dev>; Thu, 02 Nov 2023 02:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698917532; x=1699522332; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WqxvJKYv5vpdTxmgr1nqq+qFlX0PIIBhjoeGRz1GRg8=;
        b=JaBzOs/tNkm+n/hp5Uy5O0v5L7miMvMKsoftEKb1oJyj0qghTa/MbKr+RCFKs79bhI
         olIESqZmzgT+t2fwpYaa2uxqP8aPSjVVCLWOpG6+EFx6Iw4Wwc8Z8RbI2Npc0s/WDnaT
         pe+wVOH3nO23nRR6hC77I9764xpwdQLDS//2bWhqEw12XqApR+reCE1IVmqUKIolwi0U
         0f6capzYAX7AQSsQbjq923U/xz3UFEcvEeHd1+s0nnZVfipaHasosWfFFfFeAkC5dYvp
         7gxtcPU8WeFEWNpbZdn29TwdMujZSThzHzQo4RA+0MwZjSDogsk76BxxHzA1saxEkFe5
         Mf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698917532; x=1699522332;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WqxvJKYv5vpdTxmgr1nqq+qFlX0PIIBhjoeGRz1GRg8=;
        b=X9C5HS8H++GYTAu64nQG/9jomTTWW17g5IjTkcqLFdc6XQrBu/FX5i/2jFc/9SiAVN
         AnHIHv7sOI+Kvcoec7Jza7FyGvWmclansQQAQLxvW1ufacYOZ9E67IhkBGmvE2qdeDVD
         3JSbKdilTrUjYPle0d30odgbhnl4WHdLGMX6U8k1JFnJsX65upHNe6yNfvfyyFvq3kJo
         qLoBmq82vSkTeVyrr2ogGigB7nwYXEjjiH6HgWESvNhO3cpxVjJL4GbNCK2C6emw5osU
         I2XTt/fRy/1mkiwsWtVv5rXwK+/Kz/qK4yrRDn5ems9v4qIgZ1e/gSel6R8UoGZyUFvb
         JCDQ==
X-Gm-Message-State: AOJu0Yxy4OXFrtbVej5ffybwqKFtPT52qTrbsGvEa1IMV5+KicZDdnTL
	2ycZ4wHWul+IvqRJdtbEbso=
X-Google-Smtp-Source: AGHT+IHc0wpbmRp2tgf8ByRrDxa2IV0hXvaKz5WVhrwURQsV1he73lF5J1ODWGCP4OWwTpvppn7IUg==
X-Received: by 2002:a05:600c:5119:b0:409:2f7:d771 with SMTP id o25-20020a05600c511900b0040902f7d771mr15550596wms.4.1698917531582;
        Thu, 02 Nov 2023 02:32:11 -0700 (PDT)
Received: from debian ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id z6-20020a7bc7c6000000b00401d8181f8bsm2240311wmk.25.2023.11.02.02.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 02:32:11 -0700 (PDT)
Date: Thu, 2 Nov 2023 09:32:08 +0000
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Roman Li <roman.li@amd.com>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"linux-kernel@vger.kernel.orgLinus Torvalds" <torvalds@linux-foundation.org>,
	regressions@lists.linux.dev
Subject: mainline build failure due to 7966f319c66d ("drm/amd/display:
 Introduce DML2")
Message-ID: <ZUNsmJGbYwgPaUpY@debian>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

The latest mainline kernel branch fails to build x86_64 allmodconfig
with the error:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In function 'dml_prefetch_check':
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6707:1: error: the frame size of 2056 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
 6707 | }
      | ^

git bisect pointed to 7966f319c66d ("drm/amd/display: Introduce DML2")

I will be happy to test any patch or provide any extra log if needed.

#regzbot introduced: 7966f319c66d9468623c6a6a017ecbc0dd79be75

-- 
Regards
Sudip
