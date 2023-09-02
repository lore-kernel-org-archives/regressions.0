Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A4C2F3E
	for <regressions@lists.linux.dev>; Sat,  2 Sep 2023 11:32:32 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-401bbfc05fcso29083845e9.3
        for <regressions@lists.linux.dev>; Sat, 02 Sep 2023 04:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693654351; x=1694259151; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8iUJUPxov9O7zxFefQw4YzTRyz6MbPYWWecwL9vIvnM=;
        b=eFK0/tcj9zrA/ZG90qESx3pUiOXOlL9PZHxlxN2Np2Q/DXkJRgDxxeLl2yUPiafO9S
         aucYAjGC7YVW21Lg4sojwjr5DpV/cR0h+e4YepCCrOjwTJuh1PNTaCGGeNRjZynbELVX
         GDQXUa4wwFd5zRndApj4D92CEGGddLzO+k6doxzrBRf0RGWRGqi3LmQOva4Ns+BMOuYo
         i21AI208oY6QdQmPZ53vJL8/3WE63wWDWkp2BFbHj8KHJ1QZSwsL6sbiS3JieaKrdRqb
         BDBV+XXDDt5cFDsifCsK3dkMoIH/JIUfRSmZBa706jyo/AUwrTgA2/R1v+MPMPhhnm7G
         R9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693654351; x=1694259151;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8iUJUPxov9O7zxFefQw4YzTRyz6MbPYWWecwL9vIvnM=;
        b=JLpH2ZxT4k7o3NXjzox9qkakbb+b5WnYDaYI3AkOPOZuKI3GmnaQvtyizX+5x6by9H
         73k70zuS1kJQlD1+MpSL5LMP6ux1GOuUE42LgYM9k1wezTZaBykfPG/RbOYF4L0uQmG0
         gg50kT7u+Bks9HONmuic6lOJDjgGYQpg4y3YcCmu1yn3e4xfIlEGTwWFJCHKRm3WDDlo
         RwINGaDz9gp5YObtAaZ3Za3FOgGocAuLZmC+iRXQpqT/9LGq+O32FgGnHHqefHhgUmO/
         cO+lGJ5rU0HsZZnT/qrY7yHr738lA9ctR4s4nbEgDTKFCM+yKej/mafeQtAxUWV9fTMT
         sQ1Q==
X-Gm-Message-State: AOJu0YzgRcnO6bE3Q13hPBphESi3+EkoBbmRjHZvphJSTJEJss0tNlaZ
	UvQiTmtz06S7Pe8knlV2jlA=
X-Google-Smtp-Source: AGHT+IEksE8aCxWYWYtz9f8hJhASA/oom1urAUAGSWY1ZnDYtHwOpnaM2MoadmcuHWJOdFkt8mBWZQ==
X-Received: by 2002:a05:600c:364c:b0:401:b0f2:88b4 with SMTP id y12-20020a05600c364c00b00401b0f288b4mr3515615wmq.26.1693654350471;
        Sat, 02 Sep 2023 04:32:30 -0700 (PDT)
Received: from debian ([63.135.72.41])
        by smtp.gmail.com with ESMTPSA id m18-20020a7bca52000000b003fe601a7d46sm10868578wml.45.2023.09.02.04.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 04:32:30 -0700 (PDT)
Date: Sat, 2 Sep 2023 12:32:28 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Miaohe Lin <linmiaohe@huawei.com>, Tejun Heo <tj@kernel.org>
Cc: Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	regressions@lists.linux.dev
Subject: mainline build failure due to d1d4ff5d11a5 ("cgroup: put
 cgroup_tryget_css() inside CONFIG_CGROUP_SCHED")
Message-ID: <ZPMdTJ7zwrCkdMTu@debian>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

The latest mainline kernel branch fails to build mips sb1250_swarm_defconfig with
the error:

kernel/cgroup/cgroup.c: In function 'cgroup_local_stat_show':
kernel/cgroup/cgroup.c:3699:15: error: implicit declaration of function 'cgroup_tryget_css'; did you mean 'cgroup_tryget'? [-Werror=implicit-function-declaration]
 3699 |         css = cgroup_tryget_css(cgrp, ss);
      |               ^~~~~~~~~~~~~~~~~
      |               cgroup_tryget
kernel/cgroup/cgroup.c:3699:13: warning: assignment to 'struct cgroup_subsys_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
 3699 |         css = cgroup_tryget_css(cgrp, ss);
      |             ^


git bisect pointed to d1d4ff5d11a5 ("cgroup: put cgroup_tryget_css() inside CONFIG_CGROUP_SCHED").

Reverting the commit has fixed the build failure.

I will be happy to test any patch or provide any extra log if needed.

#regzbot introduced: d1d4ff5d11a5887a9c4cfc00294bc68ba03e7c16

-- 
Regards
Sudip
