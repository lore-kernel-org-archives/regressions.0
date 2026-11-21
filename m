Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795260783;
	b=bYxARt1JJhL/RMeE//GtGwbm0OOfj9Imdjqu2OE3kAPWurSq28lUMxB1yY+y9RD4wKHe
	 sGuUmmIREkKC4IVEzJTzHkJ0V0qec8NSiXCcLEDB3hwdqvMB3hPXu0q/yDfCBjP60av0b
	 yiMRt901uE5R2l4UqiGMNmCYlAZaJ6ALiOqmKLSUvXWatOnsiKH5Z+VNf3VBjRvF2VmXa
	 TyQH+deDcAjcOduKGBrKQJdkL7HAHpuROfHRbXUPpBvTBoUVaHja2tQ0TZhSt7wCTn0pi
	 ERXeedlk9b6vKxHDoTLAW79zemMZZfuBzN2ya43IcVQi7GodDfvqVrQ26FC/ZFfKuDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795260783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KK9UBGoOXxDgxdIHhYwv6EiDDgCB6dEuVsqhbAuDLYA=;
	b=fWD4xvPlcF5Gf4Qv68NE3qPEzYK+MTdl6eiG4QeNKnwP7wxJDKIHmJKPywhimLBXYK/0
	 jmF+5F8Cxfc4ImAJUTs0P3PhY0a4kUQrGrcYWkPbJrmy05etFRIMWR7gSK2ve0zUS8RJE
	 I4MO9J1dZKMDqU4IZIOEfyUgF5+HPzB8DrgE/mzHPtZyyOuZ3NUypEDb4pLt41tdIqcxh
	 cdGBA3mJlV32QEEupb+IUj47nqbC4IV8Rl4ePlekGF4NDw3cs5lyDxUQx2I51egNiYyuu
	 dkoLpi7uF3Bj+oDHVXjAXHVmjJaj+Prlitb3Lnlw+VItCGd7DiIzytCBUMqQcTUBwAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l2JAZ3j0;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50596606A337
	for <regressions@lists.linux.dev>; Sat, 21 Nov 2026 11:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50596606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l2JAZ3j0
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso2461355a91.0
        for <regressions@lists.linux.dev>; Sat, 21 Nov 2026 03:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795260783; x=1795865583; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KK9UBGoOXxDgxdIHhYwv6EiDDgCB6dEuVsqhbAuDLYA=;
        b=l2JAZ3j0IrIxAbgCBe5guMQsEd+dpPK5CvcXDMC7EDm1zcdkJgC7IQr2al/usb/x4X
         oHWB3zSsZGYs5nefIvnqYS6WnRgECVsGp0eUJqmMiifXnnbwb7crSe7cdL3U+HeBJ603
         NNrIJy82tr2Bln55BgU8qsBxq1F9ZfVnYG4v2silVNRtzKuCnIzvVhCDHxVpF5JGK8eb
         AHOSgirRjSb02hn34+5uVZT8uNb2HrAY/OHdsPazCnHnk5Ed4MRuc2YuhHjIWJVBNacX
         J4Bav3/iq+ujo0YhLH/bP0h3hzMGKX3s19fgijZaT/ye0jT/bpycGJlAQCeXKr6bGkXF
         EhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795260783; x=1795865583;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KK9UBGoOXxDgxdIHhYwv6EiDDgCB6dEuVsqhbAuDLYA=;
        b=OdnLbztOd1p62rdg5sbOLSByFRNU7r4DrWoeko3Nb0JvmUcnyWI1ATj6bzUuu0QaZI
         5sxkBv1jNCrAGYfh/zzKvuGG4Z5bCl/t+l5UYz3OPpUXv5gN0qtZI3vSSFW/LRKObnZ1
         HlKFlmiXGsf582UTFOYplKSsriGWHL/LwfnS7JPCgTVCMN8cijjuM/1LQi8WeLBYQufQ
         mq3WOhL8SWMRw7gKdzNrCnRMP2omNpG+rY6eoRKr/2TXpAN0MEWCriTIcRipnu32dFz8
         5Jb78WI9rxCjQMe4cMYoNbN1N5yrq3k1IL/VcSehtnZ/VEovQo1p2uQv9z8UPAVanSyv
         E4Ew==
X-Forwarded-Encrypted: i=1; AL+hErFmURLkNzolh6FUrfOzSRFaOD/N4kfbLRqh8ncuihEz/1eSYJvvnPEaLdoM3hfMPfFDSoqq6n6UW6vyHA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9xBprVFpFR/i+GxQipQm8jkwWPbdITuaDGyu0eqYuwQyG3Gi2V
	HUhXEVT8CQM+hYXU0cKIiI/rBeejlYqcc0/P2eYCM4U2A+f2pu74a8fl
X-Gm-Gg: AZFdTZeyyGPh7ontZup94n8IzRM2bgz2ZUYVgjtsPyEmlORgPwizsgSERiWvpENprkA
	fqAgMU7H2Z/8bTp4AZQ6h+dtlcQPHaLFiQ6Bqa9CkUB6hWQUeJVcZ9i8IhkRsd2p11d9zPO3Y+A
	QJ26t1AWP2fxy3JKIiy97Mm85IEQnae2QHoMCM0oehlML2c2U8G9JKRd3whOACwMvKnt/00R03h
	KYgGJPFoLU1KjGAs1DuJLYBbWnjgMMkpQbm+Mtv4mKOsV11gbXdvN9Dm0ayLXRAnWn75MjpANF0
	VGvZx4BGRMYdRCQLaFIBxXsoscG4xdueZklCtN+o87u47Cs8VhDyhqztrHc+BaC8DSVeC3fEdKT
	m0gBQkaw/IDiSZOBuV7TxZMQvA7mtz9GlldOfypfYoZRjS7IlTbpAGupsydZJBUgNRp0RyHxeO+
	hQqYRW2WYyHUACmdJabS1VjlgeVykYn93HiM13ox//1DFuiENte+w+p2qC4Yq6esG6QeF/sQfii
	H8C27MrTeVDDWs6eI0o6rz9KaC5R7FpiHtahdXLcHP4bnXzEmvwwF39VkBqyzQt6vJxBXf5SD3y
	n5jtwTNY8WD/Z/cxvvTdYGwmT2fQEA8LAKapcBJFcj2E
X-Received: by 2002:a17:90b:390b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b41c56f34amr3999717a91.0.1795260782587;
        Sat, 21 Nov 2026 03:33:02 -0800 (PST)
Received: from [127.0.1.1] ([2408:840d:6830:46f1:7c60:7a01:9164:e1a0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm11111223a91.16.2026.11.21.03.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 03:33:01 -0800 (PST)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Martin King <martin3kx@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev, linux-kernel@vger.kernel.org, linux-rt-users@vger.kernel.org
Subject: [PATCH] sched/rt: push a queued task when its priority is boosted
Date: Sat, 21 Nov 2026 19:31:27 +0800
Message-ID: <179526068763.97100.12205093734161349836@gmail.com>
In-Reply-To: <20261015084615.05957ae3@gandalf.local.home>
References: <CAEB5A_91hob8ddOhW=PrO1=O7GrFmSxY3r1-_Ard6x8KHHuJGA@mail.gmail.com> <20260814183652.611e7ecf@gandalf.local.home> <6db9c47f-a1f8-49dd-9e80-f9014d75f9e8@leemhuis.info> <20260903092037.5b739980@gandalf.local.home> <20261015061915.126442-1-chaosheng.qu.linux@gmail.com> <20261015084615.05957ae3@gandalf.local.home>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

A PI boost can raise a queued task above everything that is runnable on
other CPUs while it still cannot run on its own rq, because the task
currently running there has equal or higher priority.  prio_changed_rt()
only calls resched_curr() in that case.  The task then waits for the
current task to schedule out.

The pull side does not necessarily rescue it: pull_rt_task() only picks a
task whose affinity includes the pulling CPU, so a task whose mask
excludes the CPUs that just became idle is unreachable until the running
task leaves on its own.  With RT_PUSH_IPI off this is the difference
between a millisecond migration and a wait for the hog to finish.

Queue a push when the priority of a queued, non-current RT task goes up.
push_rt_task() already declines to move a task that is not pushable and
skips the reschedule path when the task is higher priority than the
current one, so the extra callback only acts when a migration target
exists.

Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
---
Steve,

This is the fix we discussed in October.  The case that matters is the
queued task that the pull side cannot reach because its mask excludes the
CPUs that just became idle.

Numbers from a 4-vCPU QEMU guest (TCG; KVM is not available here), non-RT
kernel, RT_PUSH_IPI off.  L is FIFO 10 with mask {cpu1,cpu3}, X is FIFO 99
hogging cpu1, W is FIFO 90 on cpu2 and blocks on L's PI mutex, R is FIFO 60
on cpu3:

   baseline: 1/5 rescued, 802.8 / 1161.0 / 1311.8 / 30.2 / 1280.0 ms
   patched:  5/5 rescued,  13.8 / 1.1 / 0.2 / 0.2 / 0.8 ms

The reproducer is a small static C program; I can post it if useful.

 kernel/sched/rt.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 85303add7..db93bfff7 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2499,6 +2499,19 @@ prio_changed_rt(struct rq *rq, struct task_struct *p, u64 oldprio)
 		 */
 		if (p->prio < rq->donor->prio)
 			resched_curr(rq);
+
+		/*
+		 * A (PI) boost can make @p the highest priority
+		 * pushable task on this rq while it still cannot run
+		 * here, because the running task is of equal or higher
+		 * priority. If @p's affinity excludes the CPUs that
+		 * become idle, the pull side cannot pick it and it may
+		 * stay queued until the current task schedules out.
+		 * Trigger a push for the new priority.
+		 */
+		if (oldprio > p->prio && p->nr_cpus_allowed > 1 &&
+		    p->prio >= rq->donor->prio)
+			rt_queue_push_tasks(rq);
 	}
 }
 
-- 
2.43.0


