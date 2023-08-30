Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53DE46A8
	for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 11:30:01 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-31768ce2e81so4563578f8f.1
        for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 04:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693394999; x=1693999799; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HeVnp6+dMLCahTFEnv2mqRZRz0x2Xyv/+Cdn1caRov8=;
        b=Qd/JAvpsY3/jRmSQkfMQ6PbQoMbdHJ5g+RhYPZChfACLAkK1OkOo1OMJ+ar1l2uVXB
         OU/dwTCivB0tWBt+QXR9TYVs5rkFz8zQJwQCFgJqRHTMETxe7SYbQTV22IbgWDL3WSbA
         SxYYKfZGB35Bc5pROMn1YTjbjKvux8fhzh5OSgVenBG/jVKcMp0Ay2JLCj3oeMFuDf/G
         BhfJKIlyvLxIIJAANyfv77UeYNgT3hfxlUC91Xh7ls97qusIAiFkder7iy9lVHH1esqR
         zJwt800Ez4YAu16cYqnsCU2WmlQIYahRP7AWl/A+bVP2qgoC2TkHjReGRahZahwdWw7Z
         M2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693394999; x=1693999799;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HeVnp6+dMLCahTFEnv2mqRZRz0x2Xyv/+Cdn1caRov8=;
        b=PtxmEVuZIWfRKUFqaKIl4/MIpjoObjSqcgfC8Bi3MZMETj5U93PIeZi1WweQkNQjkn
         XkeLfFgZJwnHWrNQSZxC8xMdNEWX6uKTe2VbMZWB/hIzwtFVDpZSfyc7YKdvx9HOGHa5
         tmm5E5RMsS35QK9XNjv3L40pz/ag1yZQ2+MHz2sN2yISnBCj6rjGxOyYm4HObkV/oCgQ
         IIzZ4DeDV3pHLNfVjeGPn5WNHQ4ka+LX3zHRFzVB9crNo0v1pEc9QLM8zho2mc+A0zKk
         qXEl18isRkEh/zMqcXrUrUX/QBrmw2dj04e2GGfvy2vean3+nPeQAF6J0p8cfljbSBgO
         ro9A==
X-Gm-Message-State: AOJu0Yzq5mJjbE2UkI8WP6md1dKMzCV23WXJ3MC8ZRCXZTZg3ZwWBHbd
	bN5qMVnJEZWYt2BpZ8+dpmg=
X-Google-Smtp-Source: AGHT+IGyoO44Uu/f7TuIuGzv0Vb43TqZU+jGwsOABGqlgchMxzq3Xguj5jA+dX0NyTf8Pn0T7/S9hw==
X-Received: by 2002:adf:fd0f:0:b0:31a:dcfa:c6bc with SMTP id e15-20020adffd0f000000b0031adcfac6bcmr1501071wrr.32.1693394999377;
        Wed, 30 Aug 2023 04:29:59 -0700 (PDT)
Received: from debian ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id f17-20020a1c6a11000000b003fed8e12d62sm2017759wmc.27.2023.08.30.04.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 04:29:58 -0700 (PDT)
Date: Wed, 30 Aug 2023 12:29:57 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	regressions@lists.linux.dev
Subject: mainline build failure due to ace6d1448138 ("mfd: cs42l43: Add
 support for cs42l43 core driver")
Message-ID: <ZO8oNb2hpegB6BbE@debian>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

The latest mainline kernel branch fails to build alpha, csky and s390
allmodconfig with the error:

drivers/mfd/cs42l43.c:1138:12: error: 'cs42l43_runtime_resume' defined but not used [-Werror=unused-function]
 1138 | static int cs42l43_runtime_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~
drivers/mfd/cs42l43.c:1124:12: error: 'cs42l43_runtime_suspend' defined but not used [-Werror=unused-function]
 1124 | static int cs42l43_runtime_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~
drivers/mfd/cs42l43.c:1106:12: error: 'cs42l43_resume' defined but not used [-Werror=unused-function]
 1106 | static int cs42l43_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~
drivers/mfd/cs42l43.c:1076:12: error: 'cs42l43_suspend' defined but not used [-Werror=unused-function]
 1076 | static int cs42l43_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~

git bisect pointed to ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")

I will be happy to test any patch or provide any extra log if needed.


-- 
Regards
Sudip
