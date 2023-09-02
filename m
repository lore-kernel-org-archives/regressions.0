Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85203C1E
	for <regressions@lists.linux.dev>; Sat,  2 Sep 2023 15:42:53 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-56c2e840e70so5142a12.3
        for <regressions@lists.linux.dev>; Sat, 02 Sep 2023 08:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693669373; x=1694274173; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6SQfYFAS0iiVi0orcSaVcos5wFLJxvemd/2Ha3R3PtM=;
        b=BRQ5yyVUtzfRUoLjYsMwoSa1SQrOfGmwi78+LWQvkAyOrBuo7wwEvTlumCCDc//l9k
         pxyV5k9FYLWzWpvwaa9l7vpka+0I/iq/hQKRxPqzvAn+dFRkCAd1VJ2kzpqkr+gsZWyX
         2tEOUmuF18nJcWqhjN5Iujx/AoOLeWWHHeTZCMYVGjecWLOfFkjh8l8IEhdlxDdBvrOv
         YtwZaaG+WAQc1xGCMFAQl6BmuMI5IdHIgZiEw+2tq7q8s7HWyHtc9+8nALwbXvDccHIO
         lIM7ziiJjDwCuBVZEih2ibQ3I49RSrz003bxtQgtGdbhA3wd0kleYRRXm/CeNuatyjur
         VmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693669373; x=1694274173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SQfYFAS0iiVi0orcSaVcos5wFLJxvemd/2Ha3R3PtM=;
        b=WWCzOZTEepyMV/WGpxGVgwHDsVGdk8wO4HP9AJamKKhmxj89c6SYudodtsgStCrJ7I
         Baevb8Ol6GRKZ7vEi8t90oFYAscEuwjVAq14LVQeolZGAr3emHGQm7A0AVUVFP8yF65i
         S7Ad/eMUVuvlwdbyj8lW+wlVNwv+7qjOhelvtqJ+YepYFcPXvLG9whRD9F/sKnvfvjGx
         Zi6gR5iWGhad18baIZMWj3V6cFiA8vTxy7gOUKAJp9gEzZen7jtJjpqKp9qWDRlSmp4p
         fNfdKa7S8VDrG3rdOt0ph/OEL4XKJz2sOo/cuDPplTEVyI0F35rG8ongeH12ovQLRWSL
         DGbg==
X-Gm-Message-State: AOJu0YyCd9ONmYSvBDLbYAfwNwl744iOlVNgVrwTPuKjY9B+Ne2NVHLX
	b5Nu5K8HkeAs4DNcNLU+Brc=
X-Google-Smtp-Source: AGHT+IE2AG9OKVJwY3C00izsMETmrEpukmxWa4XJJxTCGW/GqZ7zAP1hi8yl32ymGI5dgepZormV6g==
X-Received: by 2002:a05:6a20:244d:b0:12f:382d:2a37 with SMTP id t13-20020a056a20244d00b0012f382d2a37mr7402802pzc.15.1693669372796;
        Sat, 02 Sep 2023 08:42:52 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:eca7])
        by smtp.gmail.com with ESMTPSA id m28-20020a63711c000000b0056c3ee09b71sm4773430pgc.74.2023.09.02.08.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 08:42:51 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Sat, 2 Sep 2023 05:42:50 -1000
From: Tejun Heo <tj@kernel.org>
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc: Miaohe Lin <linmiaohe@huawei.com>, Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	regressions@lists.linux.dev
Subject: [PATCH cgroup/for-6.6-fixes] cgroup: Put cgroup_local_stat_show()
 inside CONFIG_CGROUP_SCHED
Message-ID: <ZPNX-jZAZbebizXA@slm.duckdns.org>
References: <ZPMdTJ7zwrCkdMTu@debian>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPMdTJ7zwrCkdMTu@debian>

From d8416c5d2a38e36651f022be01bb234a404b8f01 Mon Sep 17 00:00:00 2001
From: Tejun Heo <tj@kernel.org>
Date: Sat, 2 Sep 2023 05:28:06 -1000

677ea015f231 ("sched: add throttled time stat for throttled children") which
was merged through the sched branch added cgroup_local_stat_show() which is
marked with __maybe_unused and used iff CONFIG_CGROUP_SCHED is set. This was
following the existing pattern of cgroup_extra_stat_show().

However, in the cgroup tree, 1299eb2b0ad5 ("cgroup: minor cleanup for
cgroup_extra_stat_show()") moved cgroup_extra_stat_show() inside
CONFIG_CGROUP_SCHED and dropped __maybe_unused and subsequently d1d4ff5d11a5
("cgroup: put cgroup_tryget_css() inside CONFIG_CGROUP_SCHED") moved
cgroup_tryget_css() inside the config option too as cgroup_extra_stat_show()
was the only user.

When the tree commits met in mainline, this led to a build breakage when
!CONFIG_CGROUP_SCHED as cgroup_tryget_css() was no longer available for the
__maybe_unused cgroup_local_stat_show().

Fix it by moving cgroup_local_stat_show() inside CONFIG_CGROUP_SCHED and
also drop __maybe_unused.

Signed-off-by: Tejun Heo <tj@kernel.org>
Reported-by: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Link: http://lkml.kernel.org/r/ZPMdTJ7zwrCkdMTu@debian
Fixes: 677ea015f231 ("sched: add throttled time stat for throttled children")
Cc: Josh Don <joshdon@google.com>
Cc: Miaohe Lin <linmiaohe@huawei.com>
---
Sorry about that. This should fix it. Guess nobody is building linux-next w/
!CONFIG_CGROUP_SCHED. I'll send the pull request to Linus soon.

Thanks.

 kernel/cgroup/cgroup.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index babb34a643ea..156eb96d7cc5 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -3686,8 +3686,9 @@ static int cpu_stat_show(struct seq_file *seq, void *v)
 	return ret;
 }
 
-static int __maybe_unused cgroup_local_stat_show(struct seq_file *seq,
-						 struct cgroup *cgrp, int ssid)
+#ifdef CONFIG_CGROUP_SCHED
+static int cgroup_local_stat_show(struct seq_file *seq, struct cgroup *cgrp,
+				  int ssid)
 {
 	struct cgroup_subsys *ss = cgroup_subsys[ssid];
 	struct cgroup_subsys_state *css;
@@ -3704,6 +3705,7 @@ static int __maybe_unused cgroup_local_stat_show(struct seq_file *seq,
 	css_put(css);
 	return ret;
 }
+#endif
 
 static int cpu_local_stat_show(struct seq_file *seq, void *v)
 {
-- 
2.42.0

