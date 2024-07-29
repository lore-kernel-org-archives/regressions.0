Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA31E28399
	for <regressions@lists.linux.dev>; Mon, 29 Jul 2024 10:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722250516; cv=none; b=pBvEskBxJCieJHFmPSqs+uKu7cL95KWvCMo0qwjJk6PQB6dIUDx1HrU8zRhs8kHip12azuw1uZpl7/+GbSIloPGklcKj5iy6cwdEy67L9KVcV+Ha/lNpvFNn/36oYayf3Y+elSMkoO2nc5JBpFHt+aKII13l6f2E18OjfEQ2ZpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722250516; c=relaxed/simple;
	bh=qlPoAEQDaoq9poVD+6XpYTePjZiKeShQ2Dhs+Z8Yrkk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ieRfGSfKuFSga3jBro8w6y3QwC1vTcwZDGcyIPNfRZ9UFokzvzJtSK/ywV63kYt/sucrgLO/M/Oa25Wbotz4J8cA4Lnw5Ded1xIpDo3asT9MlM6FJ7nAQZn4zCfBPeJ3IVKP88yJDOo4+6iQaNLVLjypfnX3lmnt1bX8NKy3C3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WXZvs0y0Cz6K99S;
	Mon, 29 Jul 2024 18:53:13 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D8FB140B30;
	Mon, 29 Jul 2024 18:55:05 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 11:55:04 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	<rafael.j.wysocki@intel.com>, <catalin.marinas@arm.com>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H . Peter Anvin"
	<hpa@zytor.com>, <Terry.bowman@amd.com>
CC: <linuxarm@huawei.com>, <guohanjun@huawei.com>, <gshan@redhat.com>,
	<miguel.luis@oracle.com>, Linux List Kernel Mailing
	<linux-kernel@vger.kernel.org>, Linux regressions mailing list
	<regressions@lists.linux.dev>, <shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH] x86/aperfmperf: Fix deadlock on cpu_hotplug_lock
Date: Mon, 29 Jul 2024 11:55:04 +0100
Message-ID: <20240729105504.2170-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

The broken patch results in a call to init_freq_invariance_cppc() in a CPU
hotplug handler in both the path for initially present CPUs and those
hotplugged later.  That function includes a one time call to
amd_set_max_freq_ratio() which in turn calls freq_invariance_enable() that
has a static_branch_enable() which takes the cpu_hotlug_lock which is
already held.

Avoid the deadlock by using static_branch_enable_cpuslocked() as the lock
will always be already held.  The equivalent path on Intel does not
already hold this lock, so take it around the call to
freq_invariance_enable(), which results in it being held over the call to
register_syscall_ops, which looks to be safe to do.

Fixes: c1385c1f0ba3 ("ACPI: processor: Simplify initial onlining to use same path for cold and hotplug")
Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Closes: https://lore.kernel.org/all/CABXGCsPvqBfL5hQDOARwfqasLRJ_eNPBbCngZ257HOe=xbWDkA@mail.gmail.com/
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 arch/x86/kernel/cpu/aperfmperf.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/aperfmperf.c b/arch/x86/kernel/cpu/aperfmperf.c
index b3fa61d45352..0b69bfbf345d 100644
--- a/arch/x86/kernel/cpu/aperfmperf.c
+++ b/arch/x86/kernel/cpu/aperfmperf.c
@@ -306,7 +306,7 @@ static void freq_invariance_enable(void)
 		WARN_ON_ONCE(1);
 		return;
 	}
-	static_branch_enable(&arch_scale_freq_key);
+	static_branch_enable_cpuslocked(&arch_scale_freq_key);
 	register_freq_invariance_syscore_ops();
 	pr_info("Estimated ratio of average max frequency by base frequency (times 1024): %llu\n", arch_max_freq_ratio);
 }
@@ -323,8 +323,10 @@ static void __init bp_init_freq_invariance(void)
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
 		return;
 
-	if (intel_set_max_freq_ratio())
+	if (intel_set_max_freq_ratio()) {
+		guard(cpus_read_lock)();
 		freq_invariance_enable();
+	}
 }
 
 static void disable_freq_invariance_workfn(struct work_struct *work)
-- 
2.43.0

