Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D014B38332F
	for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 06:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232209; cv=none; b=RsjChC7XcriLeWJlGzNQH6Q+fX2lGfZTiw0+KRAdLZGuEdNUGd3wpNwEbjajt1GA2/hcl2+aGRBv/DtiBCB77Dg+91fWojQNxQlJAJllD56g6r0vnQ22jiLt7IPWNXytnlePlz3U7KBPuj10EbI8zihgcxuxHbQNpyqF/AH0ir0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232209; c=relaxed/simple;
	bh=lrI7esIax69ngJYm931hYNsW1zvRdM31DhVgSi9jBVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CRRUj1ZQGtxHpg+MtndFdTbHr6guEZDzdSERDvPUYfLH4CjGOjR5CoP90bNhylJk01T9q/PRO+Boktq79K/sv0JrH8msv3VSxdSy9wUFXU2/bJKjuFl1bFHbqfWJHU31hB5qV1Tb47JSf+Tiaq1QeHinY8W3iwxJWmvOvadRB/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9M3SUiC; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9M3SUiC"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so11397815e9.0
        for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 23:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790232206; x=1790837006; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sd81Spa/YxvQixpMcNxhaEy6XglgEfTWtaXZ4D7EaWc=;
        b=f9M3SUiC6/j9ezrmggO5rLVqfI27OPoX1ag3o6gzCl1CZL+HehRq8zONLDm2XSLcA/
         cFdTnggz4fZZwWbKWrgUgx08v3eaZMUKngiBYiE/P0QVRuGEhnZShIppGFiPCxkdC/f8
         qNdgyzzO/7pSAv9vWwNrDRbPHU+S6d6NTmOJoIdpOKZyxsgsFx2kZqlj5cVuwb/cfR/W
         +Oj7Pf+d9ZNdijS41V87y2pFFJD0LNhyiWJpUuT73+BE2wLDO+z0oKmWQaHs30r9AFPb
         AX49Q/fUmv6+kvxT6dYUSH5Gf6Vb1carBamZqe2U2uTXo1uWsFBWI4eT+bCThRPMeuDm
         P50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232206; x=1790837006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sd81Spa/YxvQixpMcNxhaEy6XglgEfTWtaXZ4D7EaWc=;
        b=zoKLrZ4dJ2XPsj6Upr37VI1dHNapns9S8O5nHbf9e9Hz5vGAkm/hG2UZF9nv18fUqX
         3CVZnpNmDYvYmD636uSSQo9sKVmuPjVnCe2207wo7MaLmovxHJLe18JBBzx88lbNHrCx
         4g/oGt0eLlBSEJsLb8SkpJZe7XUFTGZHWPsFsG67+OZlDdihSQ0OPiHDUZx5BYhJkFMd
         L+krO/JUJIjbt8ky/YOh0iRyVcN9PIPhDPpIpr7oTVMKry8VtmH0H/VKxb9v8APnMwBF
         8Xc2pY0L38wKjyVHlCRSYUS957bO9eC/ZIWoMk2BGoU4o1O/IacsTovVAlNxOmwxgdc/
         bEfg==
X-Forwarded-Encrypted: i=1; AKwUvBygiVoSUqFVzd8hGGOu7VWi/+2xtM0zikJpNCYwsaAJAclltXIm7Kxg1sMoVp7Cq4pzhiu9Oql/o5TBAg==@lists.linux.dev
X-Gm-Message-State: AFuF++mMlV/PQB6Uz4/adw6yROsXBZloBUbP+gRhhxE2xmpBKXZBNhKO
	0GPKPX1arZ3+vixymX9eYrfwQKQ0diPX1hLLFzqghkR5HgH88DRW7wWX
X-Gm-Gg: AYBFou3GcFpQ0lQ2HrTmBtbUdULDbusaz3PNQi2BpYl4V1KfDcW3LyO9+rqegY2DALQ
	C5KtcH6Y4UN/QgMJNmQZuZ89xbbtnN3P1PGIlE6kbj+6PoAJO38ykODjkstoynKaIIyczbkaa7T
	LEmCResa2PKFWZiXBH4CzK7kKKWFLmkBF+fVruaY7V2vIVpBhLT+UEK75blkGwkYP2D5KtJYhTh
	bg1CUFjVU23drkYVGxdaWI1JWS2IkXxiKMj6L721JVVpeo9V9Am8Lq4X2U2L3xk6BKwW/t5h2al
	1tNsnmCrvSnKrXK3f2qiibUIc/3e+MFLLviQ2Jct4APOwqKkYQKxp2kKGi0pfrAHBEGaMop/0IA
	ByTrkRcKe3u2VteEBTty/KzNhMbAq53QQ1JBBK/9TNBWhaOSw9sxb9qMzIha8daSkt/+4ggOmrB
	Et91Qyc+rWs2/3hZcGfFltu2vKqljMcsaxLGvVzjYWLrbrx2vJY0cH2F8IsfNGp02F5dG6zLiQa
	lofyktrRfTmVS1f/AcpAe3e8Y2OmkhyTp/ww7gopYmODf9Ha8VqENzAO1V3eC1hQj2263s=
X-Received: by 2002:a05:600c:8b22:b0:49e:6fd2:a45 with SMTP id 5b1f17b1804b1-49fe66d81fbmr22703135e9.16.1790232205833;
        Wed, 23 Sep 2026 23:43:25 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf99df60sm90788905e9.1.2026.09.23.23.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:43:24 -0700 (PDT)
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
Subject: [PATCH] mm: don't defer freeing kernel page tables while booting
Date: Thu, 24 Sep 2026 11:43:21 +0500
Message-ID: <20260924064321.23787-1-mikhail.v.gavrilov@gmail.com>
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
system_percpu_wq - still NULL at that point.

The deferral exists so that IOMMUs using SVA can have their paging
structure caches flushed before a kernel page table is freed.  While
system_state is still SYSTEM_BOOTING only the boot CPU runs and no IOMMU
has been initialised yet (on x86 that happens from pci_iommu_init(), a
rootfs_initcall), so there is nothing to flush.  Free the table directly
in that case.

Fixes: 9e4a3ec3411b ("x86/mm/pat: Allocate split page tables as kernel page tables")
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
#regzbot introduced: 9e4a3ec3411b

Tested on a Ryzen 9 7950X with a Radeon RX 7900 XTX, lockdep and KASAN
enabled, booting with the command line above plus earlycon=efifb so
that the oops is visible:

  7.3-rc4 (fe2ec83746e5)             panics as quoted
  + revert of 9e4a3ec3411b           boots
  + this patch, 9e4a3ec3411b kept    boots

With this patch the boot-time tracer works as intended and records
pud_free_pmd_page() being called from vmap_p4d_range() during boot.
All three kernels also carry my pud_free_pmd_page() v2 patch and
unrelated local changes elsewhere (HID, sound/usb, Bluetooth, debugfs);
none of them is on this path.

9e4a3ec3411b is also in 7.2.7 and 6.18.53, together with the deferred
pagetable_free_kernel(); I have not tried those.

 mm/pgtable-generic.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index b91b1a98029c..2d9b4ba33b46 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -440,6 +440,17 @@ static void kernel_pgtable_work_func(struct work_struct *work)
 
 void pagetable_free_kernel(struct ptdesc *pt)
 {
+	/*
+	 * While the system is still booting only the boot CPU runs and no
+	 * IOMMU has been set up, so nothing can be caching this table and
+	 * there is nothing to flush.  The workqueue this defers to may not
+	 * exist yet either.
+	 */
+	if (system_state == SYSTEM_BOOTING) {
+		__pagetable_free(pt);
+		return;
+	}
+
 	spin_lock(&kernel_pgtable_work.lock);
 	list_add(&pt->pt_list, &kernel_pgtable_work.list);
 	spin_unlock(&kernel_pgtable_work.lock);
-- 
2.55.0

