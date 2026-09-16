Received: from mail-wr2-f32.google.com (mail-wr2-f32.google.com [74.125.225.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE1C359A90
	for <regressions@lists.linux.dev>; Wed, 16 Sep 2026 06:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539750; cv=none; b=eKpO3hPOUrm0hjynIGHN/hW0FeUTfXayxWxdq3YZAWEUJXHv1ZAmab0zhtNnBHGwL+UlARTDNxP4bxr9A6OI285IHU6nuTHhALcGfva3bM1PeGTSuJMyDdpvhRXp8CYEv+Tltm68/gGK16MeKTsqAENFWutet6Ujz6+gCaG0ZlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539750; c=relaxed/simple;
	bh=IPAgThF9jC7bFh1055v5ZtbJ+nlwCQZ8xCiNPM47tqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HHLARHwX6QQ//veVO80deTU5HZ+63e7W7DsX1va9gOEoqDi5btjlH08SVmBQDeu8opXhLdFA+brA80mv0sUTqGwiQSfrNRqmxL7P4lCq1/ocbTPEu0vS8I0ugsrK27L8xhFow6IDFYiv+wLbbB9LyHQLlhcM64u8QtYTFfyv7wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rSfOxZLV; arc=none smtp.client-ip=74.125.225.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rSfOxZLV"
Received: by mail-wr2-f32.google.com with SMTP id ffacd0b85a97d-482f6350f91so247895f8f.1
        for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 23:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789539747; x=1790144547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0WHX+dp2Boxju7SrcSzARyHP/hpDCqm9COAQ0KdyjLM=;
        b=rSfOxZLVHmBYruE81AeCNJlOZK+Hxz9qSVLtyFuL2RcoLSSYGlKAXyAlF3h5HZvfOM
         Bg0QMgSoV0P9gy1t7ahu8oy8m88kU7amNb1R1vvCCoX31BqyQWXS2kyUf7RHbfrwYf+V
         8oQbpNzXV0xMeUFcDgHUXJi7xxaOGb8zpL7rSa1SJ6+HnEoYaHHvrp3g96K2Vo9OfgUn
         V00ZBD6OGd92+I2LVtr1iqedxtUzdU/iQRWlsLACY1tBuj64UlQz0PCcveSHfYrhwo09
         8R0uu4geJRixE87IU5ehzihg69GID2+eh9M09qd0tZX6wOUYR3fLxkuvevAdZbfffBnU
         7dtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789539747; x=1790144547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0WHX+dp2Boxju7SrcSzARyHP/hpDCqm9COAQ0KdyjLM=;
        b=h7U/RKasPPfD+pcKI3zm27eRx3cVE8o7TSEV2XhhOq3HoxRZDt6+6Po6QeUlgIIeOU
         KzruPzF/gL4pOdUD+e5pRxtIofLb+cUeziMVjDAACzYAMYSKK94g8sRjrkqx1t2a1mOf
         FSiS/5Z1HWoJ6AsH5nIHf/J1RZd8DMx3G//OQUpAAMRg5T97YifoLQOB0TjsOg8OmUtR
         6etS8sC6bPz4n9dmnNlx3z1e3FU9XflKt1/ZZhouEygsxh3v3fp+vcoUfKklPNYZ3oKv
         puT4ahxhV2IVXkIDT+mr0RdU04hQd7PXP+FiYQwJdsB0hPxciiEkv0ejzSHKLH8mgi/o
         L9vg==
X-Forwarded-Encrypted: i=1; AKwUvBynxZJKsMkz0eqeJD2WX7dLQn/FX6J4cVCWpU7g+NMBe/iykp5rDfLSxPih7GAm3DUcySsIAOcb1pqylw==@lists.linux.dev
X-Gm-Message-State: AFuF++lrmaSyJ7VVkjC8HkbfOScb7ZbWa6awM37V+C8kRITEqBRSva52
	LVrL6WfpkhsXnpCMGnkybZ8g4oxaU6QypZDnBD9JrU2Zx8SK9Gstbp7c
X-Gm-Gg: AYBFou1Jm6xogPlCTJjIz8gI6oGi2UpNIsbF6/HW+1Z/e2ekWj/rd2HD03GjhDN3wAh
	Eu7YUnB5NjkubI7IrwiKMwz0h5+4YnV54ueN+w+ANrow5gLDnG9gOkTs4PFFXVVisepk4Jq5uio
	ufe8hhc4Ad7w2c4VHU69MXaaHRwC0guyhQFTcKP/UZeFZXDFXNNt6+r7lQh4mu5O0/QQ1YBZ5je
	/8/Tw4k4q28JcSSmW5IhMFAaIfSbgBS53YXa8wO5jNqWRrzjjEKu0A6l0FGqYBZfcbho1GoFqjg
	U6g1hGkx6DApgYx9GWjcbJfWYr2EM8ChDPL5QpGSgmx2f6q+JESoX0BIIm1Ne7tRLAxgIpJKufw
	Lcyrlruj1vGPjbJw1oEd6OeZ8HoXFgaBc7Gl0HSumfS/l6wDL5Yy6eYOzfSe6J9HFb4lWWCJOIi
	1fTZRbd5eAivlszywuLJgCG+j7s+9EHKfHGs2CQe7okGqx2reHrsu0AydU+PKLM9rs1C6QIUQXg
	9JLGNCadA/0ccvgg0Jd9RtE+WSgr8bNeqB/X38+aRmHq9U96Ymsd5ot6tqESzPnUqOmxyM=
X-Received: by 2002:a5d:64ef:0:b0:487:765:46bf with SMTP id ffacd0b85a97d-4870cf2080amr1418487f8f.19.1789539747371;
        Tue, 15 Sep 2026 23:22:27 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fe7esm4336679f8f.6.2026.09.15.23.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:22:25 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Toshi Kani <toshi.kani@hpe.com>,
	linux-mm@kvack.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH] x86/mm: avoid a reclaiming allocation in pud_free_pmd_page()
Date: Wed, 16 Sep 2026 11:22:22 +0500
Message-ID: <20260916062222.27347-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a box with a discrete GPU, lockdep reports a possible deadlock as soon
as kswapd shrinks the TTM page pool:

  WARNING: possible circular locking dependency detected
  7.3.0-rc3-f6e7b42bf05b+ #183 Tainted: G     U
  ------------------------------------------------------
  kswapd0/269 is trying to acquire lock:
  ((init_mm).mmap_lock){++++}-{4:4}, at: change_page_attr_set_clr+0x29a/0x4a0
  but task is already holding lock:
  (pool_shrink_rwsem){.+.+}-{4:4}, at: ttm_pool_shrink+0xb2/0x330 [ttm]
  Chain exists of:
    (init_mm).mmap_lock --> fs_reclaim --> pool_shrink_rwsem

The cycle is built from three edges:

  1) pool_shrink_rwsem -> (init_mm).mmap_lock

     The TTM shrinker restores the caching attribute of every page it
     frees, while holding pool_shrink_rwsem:

       ttm_pool_shrink()
       -> ttm_pool_dispose_list()
       -> ttm_pool_free_page()
       -> set_pages_wb()
       -> change_page_attr_set_clr()   [ init_mm mmap read lock ]

  2) fs_reclaim -> pool_shrink_rwsem

     The same shrinker, called from reclaim.

  3) (init_mm).mmap_lock -> fs_reclaim

     ioremap() installing a huge PUD mapping over an existing PMD table:

       ioremap_page_range()
       -> vmap_range_noflush()
       -> vmap_try_huge_pud()          [ init_mm mmap read lock ]
       -> pud_free_pmd_page()
       -> __get_free_page(GFP_KERNEL)  [ enters reclaim ]

Edge 3 is the one that should not exist.  Now that reclaim can acquire the
init_mm mmap lock, that lock must not be held over an allocation which can
enter reclaim.  This rule is stated by commit d5d8b8662e6e
("x86/mm/pat: Acquire init_mm read lock on attribute changes to avoid UAF")
and honoured inside CPA itself, where split_large_page() drops the lock
around pagetable_alloc().  The vmap path took the same lock earlier, in
commit 26444eb71465
("mm/vmalloc: acquire init_mm lock on huge vmap to avoid ptdump UAF"),
and pud_free_pmd_page() still allocates its scratch page with GFP_KERNEL
underneath it.  Neither commit deadlocks on its own; together they close
the cycle.

Use GFP_NOWAIT for that page.  pud_free_pmd_page() already returns 0 when
the allocation fails, and its only caller, vmap_try_huge_pud(), then maps
at PMD granularity through the existing page table - exactly what it does
when its own mmap trylock fails.  So the failure path is not new, and a
failed allocation costs nothing but a smaller mapping.

This breaks the cycle at its source: no code holds the init_mm mmap lock
across a reclaiming allocation any more, so no shrinker-held lock can be
ordered against it.  The same cycle was reported from the i915 shrinker
with &vm->mutex in place of pool_shrink_rwsem.

Link: https://lore.kernel.org/all/80993b70-352f-4069-84c7-39a04c061e98@intel.com/
Fixes: d5d8b8662e6e ("x86/mm/pat: Acquire init_mm read lock on attribute changes to avoid UAF")
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---

#regzbot introduced: d5d8b8662e6e

Reproduced and verified on a Ryzen 9 7950X with a Radeon RX 7900 XTX
(Navi 31, 0000:03:00.0), lockdep and KASAN enabled.

On a kernel with a TTM driver bound the report above reproduces on
demand, no memory pressure needed:

  # cat /sys/kernel/debug/ttm/page_pool         # wc/uc rows non-zero
  # cat /sys/kernel/debug/ttm/page_pool_shrink

The second read runs the TTM shrinker with fs_reclaim held, so the
same cycle is reported from the reading task instead of kswapd.

Before (7.3-rc3-f6e7b42bf05b, #183): report within 105 s of boot,
2048 pool pages scanned.

After (same base plus this patch, #185): 1536 write-combined pages
scanned - the order-9 row of the pool went from 3 to 0 and total
node0 from 27650 to 26114 - no report, and /proc/lockdep_stats still
showed debug_locks: 1 afterwards.

 arch/x86/mm/pgtable.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index cb03f5a2b243..c79587962526 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -713,7 +713,7 @@ int pmd_clear_huge(pmd_t *pmd)
  * Context: The PUD range has been unmapped and TLB purged.
  * Return: 1 if clearing the entry succeeded. 0 otherwise.
  *
- * NOTE: Callers must allow a single page allocation.
+ * NOTE: Callers must allow a single non-blocking page allocation.
  */
 int pud_free_pmd_page(pud_t *pud, unsigned long addr)
 {
@@ -722,7 +722,13 @@ int pud_free_pmd_page(pud_t *pud, unsigned long addr)
 	int i;
 
 	pmd = pud_pgtable(*pud);
-	pmd_sv = (pmd_t *)__get_free_page(GFP_KERNEL);
+	/*
+	 * The only caller, vmap_try_huge_pud(), holds the init_mm mmap read
+	 * lock, which reclaim can take via set_memory_*().  Do not enter
+	 * reclaim from here.  Failing is fine: the caller then keeps the
+	 * existing PMD table instead of installing a huge PUD mapping.
+	 */
+	pmd_sv = (pmd_t *)__get_free_page(GFP_NOWAIT);
 	if (!pmd_sv)
 		return 0;
 
-- 
2.55.0

