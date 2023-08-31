Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0148B1170A
	for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 18:48:24 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-401bbfc05fcso11796275e9.3
        for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 11:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693507703; x=1694112503; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ahmrOVqwwJFu3WxpSfgce+G5opjA33YS4PMyyXAd7ms=;
        b=g2Ce2APFSjLVEKMm0OpzPofVFmlm87tvjGM0krqD/nmMtyiTRAJQck/xbF3wD0MjGq
         XJ4uz2u25p58XO/zI1i2Y684wneUXVKqe2v3PzU5PTANppg614TSXfgF1meshsloh1l4
         WwnJZjAEVpu/CUtEDaD0FmYc7WZxsbmgAqcaTIoltfP6iVFB5KI6Z0Xxj5PyqQ2ZxviN
         hFYnd2CgES89OQ+9h+zZ+I4EGvw2eHC7JcXycMZdrlYtYD5CiV1GyNSsIymYRf3OR6h+
         z+snc5OW7qw5wIPpaSN2M3OgY/mE4PMFNdHnBMW4s6tGfDcbvxhAz3YoaUT3T1VNczvI
         mtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693507703; x=1694112503;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ahmrOVqwwJFu3WxpSfgce+G5opjA33YS4PMyyXAd7ms=;
        b=BOwiYRg+J+1prRrvbtadutPvaWa66OFx4CXEIDKDSEPujJz+JH5g7Y/QxQhcgH24E+
         MOB3bte7YGOlOQgnLqpv4CdgTuEyjX2nZKvELSisA6EG50oD//O6ppI85ZcTFcm1Ef1S
         PvHAn7tkYr93Bqcge9t0bapU/5qUzVNeUc6lGAWXzIQrQRQb52lJmOQmnIAlKY0V4Rde
         0oUFPDqcPUJMbtK8GEVibDJAGMs8Wm9Uw41jcLqX98eo+l2I4OCLXlk30jMgq2nQ9cU5
         b/Pb7h4/2MRY5f/zhxuHuOVuwW483ygKjNP3eGCGI2uee0lbqtDFnZIP7QUTpy3hGCpi
         t3Ig==
X-Gm-Message-State: AOJu0YwvTkss6iu5PGpFmZHkUN1bdD4kj05Vq8VTBpb8Na6T7YYoR32L
	FMNJSqPdcziGV+QCw1w/FdE=
X-Google-Smtp-Source: AGHT+IGfZb8579Yjvtnal5tdT/GYaF1cGdV5xTKFKo1tpdq7EudzAt4mbBHbPvzHbNAvuygNNe1mGQ==
X-Received: by 2002:a1c:7911:0:b0:401:4542:5edf with SMTP id l17-20020a1c7911000000b0040145425edfmr181282wme.0.1693507702525;
        Thu, 31 Aug 2023 11:48:22 -0700 (PDT)
Received: from debian ([63.135.72.41])
        by smtp.gmail.com with ESMTPSA id o24-20020a05600c379800b003fed70fb09dsm2745829wmr.26.2023.08.31.11.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 11:48:22 -0700 (PDT)
Date: Thu, 31 Aug 2023 19:48:20 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	regressions@lists.linux.dev
Subject: mainline build failure due to 501126083855 ("fbdev/g364fb: Use fbdev
 I/O helpers")
Message-ID: <ZPDgdGBbxrTl+m2s@debian>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

The latest mainline kernel branch fails to build mips jazz_defconfig with
the error:

drivers/video/fbdev/g364fb.c:115:9: error: 'FB_DEFAULT_IOMEM_HELPERS' undeclared here (not in a function); did you mean 'FB_DEFAULT_IOMEM_OPS'?
  115 |         FB_DEFAULT_IOMEM_HELPERS,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
      |         FB_DEFAULT_IOMEM_OPS


git bisect pointed to 501126083855 ("fbdev/g364fb: Use fbdev I/O helpers").

Reverting the commit has fixed the build failure.

I will be happy to test any patch or provide any extra log if needed.

#regzbot introduced: 5011260838551cefbf23d60b48c3243b6d5530a2

-- 
Regards
Sudip
