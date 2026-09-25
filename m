Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F9435C6A4
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 05:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790312816; cv=none; b=AqNAV44Dva2mGWxhjSWxaMQo3OrFUzWjBzK5F6mK1am62Lzm6viX6v25Y8QWL7yDoaFwxnLA8ZK3y402nXmcpiOpQKucE3weqLLY/uvPS0xXcL4uShboimao2/W647DTq3yhHMus03+9bwnsB8Q5LOzzmtP89hHis1AlEyAqvJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790312816; c=relaxed/simple;
	bh=FgNvILV90xm1SMzdCLuDcjJ9uRlnlkG2a/778kvewAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SrX41ITE+BnxdHxvrosC5BMGGwQxw1nA29G57rKk+8sml5YJaKg39M657tXt3xA6YZ4NM7066m+ax1gnfE0U9pxKgr66SCUrlneY5dUR2DFf5VTTdKG60OYF9qrBXydNKJ8bopsQuvJ2tAywlYnYWBqdAJTUHLgWCaURfYLJF48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfOdqvTb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfOdqvTb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso6206245e9.2
        for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 22:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790312812; x=1790917612; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bTHdBxfhS/8AwdrGP71aETufCPYtjaKQTmoOMEZkDuQ=;
        b=YfOdqvTbJi0WG6zFkmsq72fQAmo7E+rILTWxDU7gHyJmx2zIuA2XPbpwjzLglxXUsm
         6kYiJhZ0k58OfM7yFCr6PD1TksxW/IUlIwty6qDOAWWOZDHyr8qUYkhJcKDz9cyL6lOz
         g2tP7ki6SyOEZ+L8QyIv4NzaBuU9R1XIY5Y4o7mwXvSC7+n/HefhBi3RFPsTEGJF5mDC
         9vOuu3MS3FlCHzAL1wAwX7VB8kZF1o7fPNJDiFHUCyzXuxT39nbKgoyKqE97n3GKvQt4
         yZ2Z7t1AA1Ae9y2YWUonqYIbF0oCwdRx7X/E9xwsZEB293y9r7MQXkP6Hm6VtY57YJhQ
         tNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790312812; x=1790917612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bTHdBxfhS/8AwdrGP71aETufCPYtjaKQTmoOMEZkDuQ=;
        b=c+p3dsze3gJRuh0V6KRIKEerdcFt12rszK+pTtXZUnvIJIq4XC3AA/uN0pvVNMbsdf
         LgU71AmLJZ+Wef5u6LZOiqMU2CUY10duZ3dCvScLYbn/+9ZRDAh/HYT4iDVg5aPS9lsK
         vqCBCa2kR2fcE6ybXgYTYVjJEKMdtmvh59hKnZmf6SzncaUAgTIontDthO/7qwzxLHDp
         vbuKU2BoU1hll9qQkN3fO0FgeHfESdspaxHKrdbgdMrbx24k3DNP7lyMPNWhndSh/w44
         HLinOjQ84Qx7ZuvnLWh3Iryc9Gek7eqnusAGWRU4OuTTEuTTrg5gre5UfD6a7MJ1bt4S
         5Gsg==
X-Forwarded-Encrypted: i=1; AKwUvBx5rEeSOn0/kI8M2JL7Zpk5evHBKQ4pFjy75VhZlvhiP2VpidqKdeXi0ZH4RBsA8r+SMzPi7c4IfMJr1w==@lists.linux.dev
X-Gm-Message-State: AFuF++kjkeAPehb+P1qsGgZ7eqAHnuj2hrmeY8pFXC6SclRQcvTsr/SU
	usTs1tUnhqEmWHojlh+7005ayODvdkUZ8v/9tUOv5MXbVG9gJEHQjuva
X-Gm-Gg: AYBFou1u/VQscVJuKlGYiaPDJNJn9AzsvcIVMYrRtGMtbPA4EXb+RtNtHejzyQALlcK
	HkGmHva7SP4OCcxji0cIZYfFZ8JZMn2U4f6pPUs1ooMrx/w9mlSPuRAAlTR5+IHInIXCZCoRluX
	IgDlt/APvBEe7BtinVW52bdpyA7Td8paIl9j8ieofBSMaTmHPAaNxxM1uBcQX/YRcVoWEhm+cnL
	foeJcC8UMekuSrHs6XJg5JPFCTRFx3QXb6wEkSrCA+prCZ/NLtb3WWeAvI1e8FBqZTVSuBzVheh
	mteiaxwknVbjlKf/jv1481nvq3Q8Tg7RKEHMR5REuXO5HGVixNhih0qnITG7PP8j3yKt9+KdsbT
	NUs5El6e/5mvEfYLMoLfonVKnJDGalgJXaW5aGWonIplqvp0b44uDbowQbWKdlNVquQapf0LcKH
	SMbDGKQEj2VIbCuXhc2AG43NFJS+fy7HP53/sAca7h8P/NbqE3dmqqInUmcpRgTHijprDffaprJ
	XsH+4+mWlMZyhlf/3ztGJyJsEjRR5o9/q8asVKsM6Gxv/TMHVjhTZfpfxZargJfpe/DemU=
X-Received: by 2002:a05:600c:154c:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49fe66cab86mr77104535e9.7.1790312811460;
        Thu, 24 Sep 2026 22:06:51 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06bdef2sm29882305e9.11.2026.09.24.22.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:06:50 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Vishal Moola <vishal.moola@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	x86@kernel.org,
	linux-mm@kvack.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v3] mm: don't schedule deferred kernel page table freeing while booting
Date: Fri, 25 Sep 2026 10:06:47 +0500
Message-ID: <20260925050647.86913-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Booting with a boot-time function tracer and a filter, for example

  ftrace=function ftrace_filter=pud_free_pmd_page

panics on 7.3-rc4 as soon as the tracer starts:

  [   23.531178] Starting tracer 'function'
  [   23.675800] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000038: 0000 [#1] SMP KASAN NOPTI
  [   23.819917] KASAN: null-ptr-deref in range [0x00000000000001c0-0x00000000000001c7]
  [   23.964025] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.3.0-rc4-fe2ec83746e5-with-fixes-v2+ #195 PREEMPT(undef)
  [   24.252248] RIP: 0010:__queue_work+0xab/0xf00
  [   25.981629] Call Trace:
  [   26.125727]  <TASK>
  [   26.413912]  ? pagetable_free_kernel+0x20/0x120
  [   26.990283]  queue_work_on+0x97/0xf0
  [   27.134382]  __cpa_collapse_large_pages+0x501/0x6f0
  [   27.566662]  cpa_flush+0x394/0x620
  [   27.998953]  change_page_attr_set_clr+0x321/0x4a0
  [   29.151729]  set_memory_rox+0xa2/0xf0
  [   29.584018]  create_trampoline+0x431/0x6f0
  ...
  [   44.343347] Kernel panic - not syncing: Attempted to kill the idle task!

The boot-time tracer is started from early_trace_init(), which runs
before workqueue_init_early().  Making its trampoline read-only splits a
large page, and CPA collapses it again right away.  The split table has
been a kernel page table since commit 9e4a3ec3411b
("x86/mm/pat: Allocate split page tables as kernel page tables"), so the
collapse frees it through pagetable_free_kernel(), which queues work on
system_percpu_wq - still NULL at that point.  That commit is correct in
itself; it only lets CPA reach pagetable_free_kernel() before the
workqueue that function relies on exists.

Keep putting the table on the list, but don't schedule the work while
the system is still booting.  A core_initcall schedules it once to free
whatever was queued by then.

Fixes: 9e4a3ec3411b ("x86/mm/pat: Allocate split page tables as kernel page tables")
Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Link: https://lore.kernel.org/20260924064321.23787-1-mikhail.v.gavrilov@gmail.com
---
v3:
 - Schedule the work once from a core_initcall to free whatever was
   queued during boot (Lorenzo Stoakes, Dave Hansen, David Hildenbrand).
   late_initcall would work just as well; workqueues exist from
   workqueue_init() on.
 - Keep the fix in pagetable_free_kernel() rather than skipping the
   collapse during boot (Mike Rapoport): that would only avoid this
   caller, and any other early free would still need a workqueue.
v2: https://lore.kernel.org/20260924092307.22813-1-mikhail.v.gavrilov@gmail.com
v1: https://lore.kernel.org/20260924064321.23787-1-mikhail.v.gavrilov@gmail.com

Tested on a Ryzen 9 7950X with a Radeon RX 7900 XTX (lockdep, KASAN),
7.3-rc4 plus unrelated local changes, by booting with

  ftrace=function ftrace_filter=pud_free_pmd_page,pagetable_free_kernel,kernel_pgtable_work_func,kernel_pgtable_drain_early

The boot that panicked without the fix completes, and the trace shows
kernel_pgtable_drain_early() and then kernel_pgtable_work_func() before
any other kernel page table is freed.

 mm/pgtable-generic.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index b91b1a98029c..cd227fc05d2d 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -438,12 +438,30 @@ static void kernel_pgtable_work_func(struct work_struct *work)
 		__pagetable_free(pt);
 }
 
+static void schedule_kernel_pgtable_free(void)
+{
+	schedule_work(&kernel_pgtable_work.work);
+}
+
 void pagetable_free_kernel(struct ptdesc *pt)
 {
 	spin_lock(&kernel_pgtable_work.lock);
 	list_add(&pt->pt_list, &kernel_pgtable_work.list);
 	spin_unlock(&kernel_pgtable_work.lock);
 
-	schedule_work(&kernel_pgtable_work.work);
+	/*
+	 * The workqueue may not exist yet while the system is booting.
+	 * kernel_pgtable_drain_early() schedules the work once it does.
+	 */
+	if (system_state != SYSTEM_BOOTING)
+		schedule_kernel_pgtable_free();
+}
+
+static int __init kernel_pgtable_drain_early(void)
+{
+	/* Free the kernel page tables queued while booting. */
+	schedule_kernel_pgtable_free();
+	return 0;
 }
+core_initcall(kernel_pgtable_drain_early);
 #endif
-- 
2.55.0

