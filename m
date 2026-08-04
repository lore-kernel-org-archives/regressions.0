Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38FE46C838
	for <regressions@lists.linux.dev>; Tue,  4 Aug 2026 14:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785852267; cv=none; b=bsTXncmZEDPXEpP28Rd1d2aSlXYa9Z2oefjYsXnFRfcLSp/tKMr1ez1Pu/wP9InYrOtwWye9j6ZsOPzO0CaoSsHjZm+Sg8H6Ver5g0Q4ctXxejHn9S7TMu8YuqsFca9xqwUAgIl3U4Hzv9K/14t35qybFCC2t0T/rIcSS45APtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785852267; c=relaxed/simple;
	bh=wL00NWYR0qqOjvAw7M3DFDe7cB35AxOZNJLMdcw9+EQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nN+yDkAi+3CEfMS/k0OHpEgNXFdUWdYeQgbUylBTh4RpsxnGj6j0Aaq3Ye2UjTKMEFBozRb3PAcAemqKZ0pEQN1f18t7vVbHFmGyflomn7D7+ojDH5BTyafY8bpiQfLbeCBMKwOtl5147HOq3JcQFPDDx1VxM7T/iSQDDuAzHww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ng7iKQNE; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ng7iKQNE"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39f927721f2so18342031fa.0
        for <regressions@lists.linux.dev>; Tue, 04 Aug 2026 07:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785852264; x=1786457064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0SIB9ZNDGWSkbhYbrVPXtpZTZPzNmn29odQM0RAb0dw=;
        b=Ng7iKQNEvoKolNevtBNJFYFrdDrHiHX849I4MjV2jnjIFEELecl5cRnFGbiRNQg00o
         wC1yqR5sJvzOw74lk+Nvdd9oxWEyzkvpuC0Aho+S27DSn9nH4gdyIbesscYiwKopOXp5
         LEFHAu84AdRyh0xvyQvyO89bheJA3kob0UwsS2sn6Ec+N+Q0Sy52Vzu68AfP2rIPSb44
         9kzjx1UM7JNsnLsRCtV+TU01V6JkI/vVl59wZJPHP+BqRFOME3jUAaLBA5ZYS3bp7PuD
         ynJTt/wUN3nye6fsjRCUbdLY1aXbce1bjV6kI/VCAvKGfgXsw/8qBWCkTIunA6c3YWax
         bfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785852264; x=1786457064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SIB9ZNDGWSkbhYbrVPXtpZTZPzNmn29odQM0RAb0dw=;
        b=VC19Ia5lm5GYzk21ELytRBOwvHNYOhep/wPYTb7VkKnLv/qy9ciLR2mEMZGHNxYoSG
         CpWmhx/N085iU5zhAWSrm5Mm4L+DPdIx21onkUlogfaT1UGJr9EQMQNrxiu/po7Eh7PC
         7kwx+eGniy5fQ5WvdGqLA1gXcXTwrNyHwsjgQjH71D+EWiS7hiLzvjWeGijPPYaPaJge
         grALiDu4nCkMcbQMEA3tkBLv0llWNc6TI1lVjpTOZ4yL6ZbF+sgpzD4LItEqDWrQjsTk
         vqRVCybO3UAHPZN/+DQGQBboPzA/d5wTJcvaw59JExmu9GBQtdjQRqQnyw0CItG4OFS3
         ME/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpNAHPOh7yQWR1IvGDiRCOPWnj//v78RIxt3lF4B7mHxRpYtzOm0P49Sr8B944832mca50Gr4MwWPeemA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6hSDYHol6AubvpPmrBx26RbyiNJw2e6XX1WYTUhgWgqfJgJol
	8WhYaScBiVmzP+zZAs3qB7DO/FUAPEH4eUGrnnPcA6Duxlh3vS+UBg4r
X-Gm-Gg: AR+sD1392LNcNbZEGpFyyGhrxHlUwbynIpbS2HSskozvgN78088k+LHFezt7Uk74Zmr
	vhf2sTpOPSPKd/mW9fyBYu2jM4L9JRVqPwKApQSU8QMtKWpwIONbPyV96WrnwMWLI160ANv8jnx
	o481CcDNYnvlM3sA/bTbpgQ4sazXhZHO9GJCxji2vhzw2FFxgvO0Sl1WlwLJ4o43xflp8GTknCw
	e7kFU9C9BBfbjpBoWQPlnB1ilC1+XI+oMy7fQlNK1g0lawuHEG0+Rr2lVv1lniTWCgmiEhs95lA
	Bu2O7OIm1NYa8PTP4JE4o1C6J4XrALXgw8Vt8tzr3r9CcFN0ehj3TfKe2GGxb4AF+IVHPyGrT+E
	xgSDH0Wg1a0LaAjD+DuoSKT9MrUZ1CoKntr7RYU5xaaF3ET/FdikvPB/VegZpL08NreYWoxup+Z
	Q+rvkmaI/HcV8tsM3gOpoc6eGNsKxvVRpf1TQ+IAbCTLujKgLl4CBmbC4dNyqwhb5/CEssZWSiw
	5uIspvEAACEVphovMmnhFfS+vxv4ba2TND47nER
X-Received: by 2002:a05:6512:39c3:b0:5b2:a396:1793 with SMTP id 2adb3069b0e04-5b2e4f76abemr2965624e87.37.1785852263358;
        Tue, 04 Aug 2026 07:04:23 -0700 (PDT)
Received: from kfastov-mac ([91.217.3.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e245536dsm2669672e87.67.2026.08.04.07.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 07:04:22 -0700 (PDT)
From: Konstantin Fastov <kfastov@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	Konstantin Fastov <kfastov@gmail.com>
Subject: [PATCH] drm/gem-shmem: Install writable PTEs for write faults
Date: Tue,  4 Aug 2026 17:04:03 +0300
Message-ID: <20260804140403.16337-1-kfastov@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the introduction of dirty tracking, drm_gem_shmem_vm_ops has a
.pfn_mkwrite handler.  Its presence makes vma_wants_writenotify() true,
so vma_set_page_prot() removes the write bit from vm_page_prot of
shared mappings, and the vmf_insert_pfn() call in the fault handler now
installs read-only PTEs even when serving a write fault.

For regular CPU accesses this is transparent: the retried access faults
again on the present read-only PTE, goes through wp_pfn_shared() into
.pfn_mkwrite() and the PTE is upgraded to writable.  But consumers that
resolve faults through fixup_user_fault() + follow_pfnmap_start()
perform no such retry.  In particular KVM's hva_to_pfn_remapped(),
after "successfully" handling a write fault, finds a present read-only
PTE, treats it as KVM_PFN_ERR_RO_FAULT and fails the vcpu run with
EFAULT.  Observed as AsahiLinux/linux#560: muvm/libkrun microVMs
mapping virtio-gpu blob resources die with EFAULT on first GPU access.
The traced failing sequence:

  follow_pfnmap_start()        -> -EINVAL   (no PTE yet)
  fixup_user_fault(WRITE)
    drm_gem_shmem_fault()
      vmf_insert_pfn()         -> NOPAGE    (read-only PTE installed)
  fixup_user_fault()           -> 0         (fault "handled")
  follow_pfnmap_start()        -> 0, !writable
  hva_to_pfn()                 -> KVM_PFN_ERR_RO_FAULT

Fix it the same way commit cb2a2a5b37ad ("drm/shmem_helper: Make sure
PMD entries get the writeable upgrade") did for the PMD path: when the
fault is a write fault, install a writable entry directly and record
the write for dirty tracking, instead of relying on a refault that not
every fault-resolution path performs.

To do that at PTE level, add vmf_insert_pfn_mkwrite(), the VM_PFNMAP
counterpart of vmf_insert_mixed_mkwrite(): insert_pfn() already
implements the mkwrite semantics, there was just no wrapper exposing it
for pfn inserts with the default pgprot.

Fixes: 28e3918179aa ("drm/gem-shmem: Track folio accessed/dirty status in mmap")
Cc: stable@vger.kernel.org
Closes: https://github.com/AsahiLinux/linux/issues/560
Assisted-by: Claude:claude-fable-5
Signed-off-by: Konstantin Fastov <kfastov@gmail.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 20 +++++++++++++-
 include/linux/mm.h                     |  2 ++
 mm/memory.c                            | 36 +++++++++++++++++++++++---
 3 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 545933c7f712..37662f6f6ed9 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -573,7 +573,25 @@ static vm_fault_t try_insert_pfn(struct vm_fault *vmf, unsigned int order,
 				 unsigned long pfn)
 {
 	if (!order) {
-		return vmf_insert_pfn(vmf->vma, vmf->address, pfn);
+		vm_fault_t ret;
+
+		/* .pfn_mkwrite enables write-notify, so vm_page_prot lacks
+		 * the write bit and a plain vmf_insert_pfn() would install
+		 * a read-only PTE even for a write fault.  Not every fault
+		 * resolver refaults into .pfn_mkwrite() to upgrade it (KVM
+		 * doesn't), so install a writable PTE and record the write
+		 * directly, like the PMD path below.
+		 */
+		if (vmf->flags & FAULT_FLAG_WRITE) {
+			ret = vmf_insert_pfn_mkwrite(vmf->vma, vmf->address,
+						     pfn);
+			if (ret == VM_FAULT_NOPAGE)
+				drm_gem_shmem_record_mkwrite(vmf);
+		} else {
+			ret = vmf_insert_pfn(vmf->vma, vmf->address, pfn);
+		}
+
+		return ret;
 #ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
 	} else if (order == PMD_ORDER) {
 		unsigned long paddr = pfn << PAGE_SHIFT;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 80fce2515930..7b76a281bdd1 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4551,6 +4551,8 @@ vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
 			bool write);
 vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
 			unsigned long pfn);
+vm_fault_t vmf_insert_pfn_mkwrite(struct vm_area_struct *vma,
+		unsigned long addr, unsigned long pfn);
 vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
 			unsigned long pfn, pgprot_t pgprot);
 vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
diff --git a/mm/memory.c b/mm/memory.c
index 86a973119bd4..6562a0d8bb68 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2751,8 +2751,9 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
  * Context: Process context.  May allocate using %GFP_KERNEL.
  * Return: vm_fault_t value.
  */
-vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
-			unsigned long pfn, pgprot_t pgprot)
+static vm_fault_t __vmf_insert_pfn_prot(struct vm_area_struct *vma,
+		unsigned long addr, unsigned long pfn, pgprot_t pgprot,
+		bool mkwrite)
 {
 	/*
 	 * Technically, architectures with pte_special can avoid all these
@@ -2774,10 +2775,39 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
 
 	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
 
-	return insert_pfn(vma, addr, pfn, pgprot, false);
+	return insert_pfn(vma, addr, pfn, pgprot, mkwrite);
+}
+
+vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
+			unsigned long pfn, pgprot_t pgprot)
+{
+	return __vmf_insert_pfn_prot(vma, addr, pfn, pgprot, false);
 }
 EXPORT_SYMBOL(vmf_insert_pfn_prot);
 
+/**
+ * vmf_insert_pfn_mkwrite - insert single pfn into user vma, making it writable
+ * @vma: user vma to map to
+ * @addr: target user address of this page
+ * @pfn: source kernel pfn
+ *
+ * Similar to vmf_insert_pfn(), but the inserted PTE is made young, dirty and
+ * writable (subject to the VMA's write permission).  For use by fault
+ * handlers of write-notify VMAs (where vma->vm_page_prot has the write bit
+ * removed) that serve a write fault and do their own dirty accounting, so
+ * that a "handled" write fault always results in a writable PTE.  The
+ * VM_PFNMAP counterpart of vmf_insert_mixed_mkwrite().
+ *
+ * Context: Process context.  May allocate using %GFP_KERNEL.
+ * Return: vm_fault_t value.
+ */
+vm_fault_t vmf_insert_pfn_mkwrite(struct vm_area_struct *vma,
+		unsigned long addr, unsigned long pfn)
+{
+	return __vmf_insert_pfn_prot(vma, addr, pfn, vma->vm_page_prot, true);
+}
+EXPORT_SYMBOL(vmf_insert_pfn_mkwrite);
+
 /**
  * vmf_insert_pfn - insert single pfn into user vma
  * @vma: user vma to map to
-- 
2.55.0

