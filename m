Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4668430C15F
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 02:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779157468; cv=none; b=XqKNKLWltOMUaQ3Fg8T7UNNPGDv5df7kuzLhgPS+Hw2m/9HdPCl1M8qblvABmUkSZVPC4AUQ2rvcnOG/vM0uNjnGnFxUM/W+nVsXpkks2QabbHxI5OuZ51tTInyiewjOPUIqSbCIm98ctXOOeJmR7Qohswf7hpbq0cEsP6z5vjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779157468; c=relaxed/simple;
	bh=Ycp8qjO/PfRK7m2ntTo/IEVUWNXQB9mhil572m7SDNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NVMdFMa5hXpVMi0Nk6Zj9j2+NQHepKs4YPLX50+wLzbavOFns5fgXkVLSgjx+sJdo5aP7q0zWxzFvDYdGtFJ96Mfle4f7BxAbb0ECrB4CacsQOqIPEj2qrwGxx2kBcGGew7uBywWxJfOqe80Zd95+EU/mCpCw53ffY46TuIFVPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rFAzQv7G; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rFAzQv7G"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c19d23b19so4126675c88.0
        for <regressions@lists.linux.dev>; Mon, 18 May 2026 19:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779157466; x=1779762266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=McykzsXvEssTvn0E09J8JSZwHaEDmP0RB4n+c5Q/cuI=;
        b=rFAzQv7GOMJiZkJcWYYRyfwsn3Uy02l1mvmPefne/ZhDhZmWsLOVffEWA2Ftnn/dui
         wkgLSFeaF8vSJ6AV2e13Wi3AB7IKvDzFt2rBIr0Mj3PvYk4fD3D9SL8l4LgmzvXFfJH1
         Np8SSuQoj0hY0v8VjwRFhyh+g3OY0SBpDoJUwOMmBpjrqfHCOOViwF9cpadB9oimo5eP
         Wg/RbLRW4ynBskhV2ciTa1+HmgRuru3+DndMDalzo7RB4qp7rL4/wVbCtPCRR3v4G6Ue
         RtYTspxgF5VELgO/08IlaVWSObENEoN4von88ClcGbgMVNz1qHjQvG7g/jq/E53468wr
         mD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779157466; x=1779762266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McykzsXvEssTvn0E09J8JSZwHaEDmP0RB4n+c5Q/cuI=;
        b=Ad3VkE7hRfcvyL2/kGdZsYehPhYx4TqzXl9Q7MgPHVsDdhe8kbsw1ZNMHMXJblKDCz
         +yKnwxNgKDRoNh5BZ4i1xgTRf5sroecnSw3aWMOgCU3GrUzZ+M3sCcxovWgq5JECxPDz
         PXV6sJDqOOEISL/TjbpZfphjwZn6mxSZnv7wGgbsXOkb9DKjwaaQDqkyvgsERJVk9z6K
         7QhpW5h+7YoRngqeMCtH7PoGiUlyQTVUnUk4vaMJPkloHjePDs7Ff0c/2amdgf+fxIgN
         ukczk3fLnp7MXsH9GxBdPrdgjZedSPxdV1w/6UvQl2IzliywIOHIxKNj1P9ivbNG93AK
         nBTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EUWnBxjMtMRYu/Zp6E8971xtQHaXytrSUEuslQ+L7plL6ZDSYWnmrLl18qBOFQkB6TsH1TLsua710uw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCjjv9Qk6dnaNrgBeEDAeqR/YaKaWNbCo5E4u6VvCIU2c6qRkZ
	CJQvQtGwLbmaqzTzxroRQ+JywHrZrt8tfwrsA0021Uy+sW/8JofSoFqp
X-Gm-Gg: Acq92OFKA3eAh7M5g+73hEa/o37SmZJ8rvInCvP59mPNLKPR3SmIU7i6IcZnsNvFKwo
	ljNx4onI5YimI0lqWRDO/FOnyy7VOIR8Mkesu0KZBigNPbXFUgRC4pyk0mFUlrjjXvtSL2tqb4p
	WJqdE4sdzK15vDYJFvWl9QfxF6j1fI29/qyXAlnuurbWF9ATjE00NCoqNZdYI+Ys1qvIxLUygXY
	Khh3Lv3t8sG6UG0q1BMuICMzZ4lOnJRXlLE2nGGgsFbZw20SCy3lq/ZI6142EGEgDVu6rBGTM4e
	CAVR51ORyELlYpwPW15RJzDcQPZzUzxp3UK+b8qx09ztaMvXx2APUW7zqtfVNBrWcutKsBrIcnJ
	CyjoA2KrR4OUeKu8R4vj1MV1baaT1XFHDxoKsQvy+2PSfVCMh5RE+0pHhM5tzxvTGKhbDNMaj27
	hnsMPXRcyvhBM9wcAWIwO+U2JLxRKvZzlXKWOZ
X-Received: by 2002:a05:7022:7a2:b0:130:c9cc:3384 with SMTP id a92af1059eb24-13504840a80mr6837676c88.30.1779157466235;
        Mon, 18 May 2026 19:24:26 -0700 (PDT)
Received: from s7t7-debian-test.local ([67.170.89.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294adddaasm15104386eec.13.2026.05.18.19.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 19:24:25 -0700 (PDT)
From: Tony Rodriguez <unixpro1970@gmail.com>
To: davem@davemloft.net,
	sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	andreas@gaisler.com,
	tglx@kernel.org,
	thomas.weissschuh@linutronix.de,
	regressions@lists.linux.dev,
	glaubitz@physik.fu-berlin.de,
	linux@leemhuis.info,
	torvalds@linux-foundation.org,
	Tony Rodriguez <unixpro1970@gmail.com>
Subject: [PATCH v2 1/1] sparc64: Fix comparator problem with timer interrupts
Date: Mon, 18 May 2026 19:24:08 -0700
Message-ID: <20260519022421.5978-1-unixpro1970@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sparc64: Fix comparator problem with timer interrupts

This patch fixes SPARC64 tick/stick comparator logic that can cause missed
timer interrupts

Full dmesg and crash dumps:
https://github.com/unixpro1970/Sparc64-Kernel-Debugging-Dumps/blob/main/s7-2-05122026-dump.tar.gz

Debugging discussion:
https://lore.kernel.org/all/87tssb6olo.ffs@tglx/
https://lore.kernel.org/all/871pfcznw0.ffs@tglx/

Short dmesg excerpt:
[   48.632215] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[   48.676018] rcu: rcu_sched kthread timer wakeup didn't happen for 5259 jiffies!
[   48.743621] rcu:     Possible timer handling issue on cpu=100 timer-softirq=15

Test summary:
After applying this patch, S7-2 and T7-1 systems no longer hang on v7 and v7.1 kernels.

Tony Rodriguez (1):
  sparc64: Fix comparator problem with timer interrupts

 arch/sparc/kernel/time_64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--
2.53.0

