Received: from mail-wr2-f24.google.com (mail-wr2-f24.google.com [74.125.225.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C728F440A16
	for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790241800; cv=none; b=ORDA9fl+WA/t50JfbBQUb/iAZMIm6yb550Rc3hakW2kBJStY2bDXLedLUOVxbH0CpR6hU+Vzr9JnZRbMP59kUFTecW57lAB9qrNOvaTtehANLX9OLx+xRdlCcrBtjGuNg7/sdgR2XQ+kY//jt6jxdR++LHDXRing2g2U8O9+Ttg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790241800; c=relaxed/simple;
	bh=JPetP2Z7gxwCfIfjyw7nBBtyy1O/JrS80AC6dx7KIYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FmAZejeTuudlvY0wu+rpRf172R/EyrbGBD1zfdtD4sdXAuQfNFSFOykH0kfdf5+iqNLwt+R9M5sJ3E++o0xSxhLRy88lex+ollmSqvWWloeqGhRivypbTdiaEV4koeajcifzLkk2j88Z+qj6Xpwz52gKc3cNrdDZ+cRK5RTFh68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oItIKlLd; arc=none smtp.client-ip=74.125.225.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oItIKlLd"
Received: by mail-wr2-f24.google.com with SMTP id ffacd0b85a97d-482f63546c3so1465796f8f.1
        for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 02:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790241791; x=1790846591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7QZ8HgImhCopDFDWHquBQ0HUnxqZBWvfTbRoX5PG3mc=;
        b=oItIKlLddL9CdUstN0sK+14ljwr/5udVycNwVBnY8WWb/z2eoIdgtH1//ylarhuVd4
         ServXN3cbRn9DZo/1YXz4yFLWp48vuDmjicHlVUObauaWVNu09c5683l/mkv0pOSX2he
         c1zHmwQ38VHozshTt0Z+kiAyVuARB69NpyKidIdODFpE3fKn13e3pZLy2omA3NcakJD/
         ZKI3D+Qn2CihVNKvvXLQrXC7P4Nc7KFMSdM+xKk2XZhW0D+sHhMcq6tgguqZXdrnnOhd
         mDEaiR9sN+FEbE9oQ9YER1ubIZr0Khz1SHy/vX4YL0GRgB7ERyj34cEJoujDDMzkCIGx
         GMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790241791; x=1790846591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QZ8HgImhCopDFDWHquBQ0HUnxqZBWvfTbRoX5PG3mc=;
        b=L61zZW/oYW/jfwhjx+e8DtP3ZlIN/wvs3GBQ2pcdGqkZRit0HW8iMiCicgaXtQiOFQ
         uDwYzIIltjGPsgR+9wum1BQXBDpn3tpJVNtWLhzxTd2ZKRkYEzR0q/al96CjL1s7XBDZ
         WzxjQuClwpD/7D33M/JQNNZivEH0aJTP7casVryvg7UXpy1UeF8/Dm6GHtbt67/MnJmg
         xKQc0kXWGk7Bxmt+jh/AtwY2mlT+egVesGF+JijTV8fATT1e/YUfUDu04lIXDSIxWB+p
         MrrzVLVUGrJMmM+2QqdOVCfx2QtJixlZXtQzmooX92FI2Yf7HV+p4EFYTuuEW8g11p8D
         7wiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwY8/9/fmN2kkFySwDBwoZs2/cLTQDit8doflnJjOuM0bTZ4hL3VMAS48f/n40r91iHYnl7ZZD7054u2Q==@lists.linux.dev
X-Gm-Message-State: AFuF++k2htZ5ATMap+0NurxitNm2MXW8l8lMaDfPkhr/huMBoJBOSDit
	nLYPw14LFoGGpeyKkQSrdpigRBdvCjaTMehqsAxJhE7RrjUeKaX/NOcj
X-Gm-Gg: AYBFou2LJG3ATqrWnmYGvpQyhyWVtlBY1XH1f25IkBwxVINqsxy0+FSubj4bDd1oQS/
	48cJuTeu1sPm3aNAJtGE9PuvhVdN5gX/wffPbMM6ZNhJfCgsEAf6iqN+TVfM2UoWc/yRrPX57EP
	OJQIhhu7Uwv8Z4vgHuEUDxi9kx/t6vVotEcJn3ow35pYT/2fUiO6oZW2uG72u9AOxY2cvOS/xDP
	t+YYuFVd+w5ydPETtNcVKK+I6U/0wJQH2p3hMMwtgtXt1QP7SNLOH/FMauZH2zoJk98BiIJiw/5
	EOlRyty2PJFhwtkOXcr9iKvjs3kWQBPLD1gC92RmeWMbp/SocO0X+XS5YUusvKAHuuBzm6PEmld
	GuL9yjW+tfCLTj5ujPcm9GjYHQ0kahkFKixluxQA0hi352ei4dWHZT+4bsPkU86kyZasMeYSdJO
	ZkJX0l51/Z95MweYqZBrSw6NSHzBha3qjUuBu1dnL4jhnaA3x8lVv4o8YaON2StMBLjW2sYWw0z
	OLCtXKWMzWK9LQg6UDgLnpRO1UqM+yj3XbfOGqcU4Ru1BxO9k/qXI4zgD1VSQtr/fW24IiB
X-Received: by 2002:a05:6000:2c07:b0:486:fa7b:d3aa with SMTP id ffacd0b85a97d-4887172d776mr3144237f8f.23.1790241791054;
        Thu, 24 Sep 2026 02:23:11 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488684862a3sm12164848f8f.7.2026.09.24.02.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:23:10 -0700 (PDT)
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
Subject: [PATCH v2] mm: don't schedule deferred kernel page table freeing while booting
Date: Thu, 24 Sep 2026 14:23:07 +0500
Message-ID: <20260924092307.22813-1-mikhail.v.gavrilov@gmail.com>
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
the system is still booting.  The next kernel page table freed after
boot schedules it, and the work then frees the early table too, after
the same IOMMU flush as any other.  If no kernel page table is freed
after boot, the ones freed during boot stay on the list.

Fixes: 9e4a3ec3411b ("x86/mm/pat: Allocate split page tables as kernel page tables")
Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Link: https://lore.kernel.org/20260924064321.23787-1-mikhail.v.gavrilov@gmail.com
---
v2:
 - Keep the table on the list and only skip scheduling the work while
   booting, instead of freeing it directly (David Hildenbrand)
 - Say that 9e4a3ec3411b is correct in itself and only exposes the
   problem (Lorenzo Stoakes)
v1: https://lore.kernel.org/20260924064321.23787-1-mikhail.v.gavrilov@gmail.com

Tested on a Ryzen 9 7950X with a Radeon RX 7900 XTX, lockdep and KASAN
enabled, on 7.3-rc4 (fe2ec83746e5) with the same unrelated local
changes as noted for v1, booting with

  ftrace=function ftrace_filter=pud_free_pmd_page,pagetable_free_kernel,kernel_pgtable_work_func

The boot that panicked without the fix completes.  The table freed
while the tracer installs itself does not show up in the trace, since
the tracer is not live yet at that point, but the first kernel page
table freed after boot does: systemd-modules-load freeing one from
__cpa_collapse_large_pages() schedules the work, and
kernel_pgtable_work_func() runs 0.8 ms later and drains the list.  From
then on every pagetable_free_kernel() in the trace (660 entries, none
lost) is followed by a work run within a few milliseconds.  So on this
box the early tables wait until the first module is loaded, and no
separate drain is needed.

 mm/pgtable-generic.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index b91b1a98029c..f7f504f57914 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -444,6 +444,12 @@ void pagetable_free_kernel(struct ptdesc *pt)
 	list_add(&pt->pt_list, &kernel_pgtable_work.list);
 	spin_unlock(&kernel_pgtable_work.lock);
 
-	schedule_work(&kernel_pgtable_work.work);
+	/*
+	 * The workqueue may not exist yet while the system is booting.
+	 * The next kernel page table freed after boot schedules the work,
+	 * which then frees this one as well.
+	 */
+	if (system_state != SYSTEM_BOOTING)
+		schedule_work(&kernel_pgtable_work.work);
 }
 #endif
-- 
2.55.0

