Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836323D0930
	for <regressions@lists.linux.dev>; Tue,  5 May 2026 20:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778013615; cv=none; b=pg0BDTjs5w+/QBFPnCvhTYuhU5vo4i6N13OweW1OXRij44b3IkiqRkPhT5lph39loBlWkuSHF8Eelpa5iEEjLiCDDcxBJJ9Jw3JeffcGAIoEEuBVadIl7ftzt5PBpsh317xd+kDWkhfojrOhhKVG9CUgXVAA5aP/Mz9KXNv6jn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778013615; c=relaxed/simple;
	bh=EpGaEwKFGuiP4t9mZpBgQM5X2R+L9JBlxUfkrxWEs1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VrjWHlyM+z5AEHv+R9bp3ntmbnGRy+14DagR91YFqOqZbt7dCqtRzOWoyRa+S8FzGiw9FEulnxVez7MHSuVf5vNAyKLrrEMCLyRJ9581WTFhliS5KSVOrpx6e4N4nDR9g95v+kql1sy+Mx9UXhO0PQ4tWbJeAkvs9msOuJk8RH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZyDhyAV; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZyDhyAV"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-671dad7cac8so6326274a12.0
        for <regressions@lists.linux.dev>; Tue, 05 May 2026 13:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778013612; x=1778618412; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wP0T8HbpG/ezhgyMGr0ErCtPzM0+G4QaMUxS65Bsvbc=;
        b=jZyDhyAVKghYU6+CLr8kPQtR68O5kSg6B5+IvZAHjFYsl6wFrrygq66ncuBRm1rk32
         0UcB0z66EU/l/AAORcarJjBjqDNEwFVXdA5Utztqiv/jxjgbmp/ni7sCMCf4lSJO2cFN
         FOy9xAfbML8wDAih4lGKeMnWPC8MonK5N2T9JFe0RhIm98yDQZuISz/Sx2L/e+erRLD1
         oz2F3v0CzUFuGdGOyX5Z9vMY3RtLQoOmZX/okFAuMuV16z3bIWPve15Ob4oaIHdFKoQC
         j72gxOZJVF2bIrFTvas+DSu4GnuWjFCQIMFDxahX3LhiwWsEXJw7IZnK4P3WzaonMFBt
         Dqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778013612; x=1778618412;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wP0T8HbpG/ezhgyMGr0ErCtPzM0+G4QaMUxS65Bsvbc=;
        b=drbN4J2ZT1wnJXSAU9wcifxSQbCgcO9Fpd2kxt4cc6iyDkQkWnG8Am1eepwu+nlPFm
         v5j5t3P+t1u3SKGQ6su7CAMfgtvylciYRuYnER14lTF9tr3wN6Pl4FZjNukVHVCtQ26F
         RpCG7mgPddYAaGUjwxNAzYsV9PRPBZW0Ctd9XGRLv7LzQWVCisaFAbBuHXYGYpWVZ0eP
         d2ZkXR9ppLIUxwzJWsIa4VxvHkWHRH3iJWPgE5VBLctmz8C7BL5LznEoDP2Gf9dpfuaS
         eOZ4LNtwragecauTQf327why5OTOViZC16/3s/bvcEyx6bCkoWRLWp9qXUBhBam95xQg
         a+Xg==
X-Forwarded-Encrypted: i=1; AFNElJ+x1DmItbO+489wOPPyvoglkIrZpGJ6WeJYy2JBusrnkzWmBw5hvueCguZ2QGbsT4BN8nC6R8VYg68RAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUG8r4v4mhv4BMdLHVS+tM6km9AC2V/qGOuYV+10BfFByzd49U
	LPxnskavhAY5oxv4F5Ld4nihtDVVnrG7YNb9YFBnXuZGlLdntvMsTb6Z9cAbj5ow
X-Gm-Gg: AeBDievB37gj8eEBnX1/Ah0kc8sO2uz4qmlvjtIJGcBzFuhlYCBP4JZ/SyKI04lzFZG
	W0sAng8HS9eVMOfXwyoXFYpzMQmR6bIIDImA+xcHs4NiQk73qacPrq9115o87eGGK6pEND1qAxK
	JHKMMyrzRmqVRqlkazMSUqlWgeISH7WLh4L5iXEemiIAxPEU3yYuzBC0sdlMEs2Y27XO07BGkRp
	Lkirm1FYN3v1ESRXkHbT7Z29nOZSul9nBItVQaSkkMuymoaf4I9wDaNL6wAAWoE93Z68ucidO5X
	YY8Fme3qso8bvJzyu3BkymOJKfgrkZFl7bClk0bJ63Lw0FWKRcbHXvooX8rKOitvnElh258o/p5
	CDRZ5yc6KCJBLE14qVmRzpdth3rvZNoo2eUnwF8fEFmUimlwIS0Ab90J06TIWsCgC/+zmNFHvHv
	0APFFaHLaq5Cd3s1m55qSR0AoqbV8xZyo=
X-Received: by 2002:a05:6402:2b8a:b0:67c:5935:39e4 with SMTP id 4fb4d7f45d1cf-67d638b1793mr68564a12.3.1778013611534;
        Tue, 05 May 2026 13:40:11 -0700 (PDT)
Received: from eldamar.lan ([88.130.212.107])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd91ea07dsm675870a12.31.2026.05.05.13.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 13:40:10 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 6A563BE2EE7; Tue, 05 May 2026 22:40:09 +0200 (CEST)
Date: Tue, 5 May 2026 22:40:09 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: stable <stable@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>, regressions@lists.linux.dev,
	Ankit Soni <Ankit.Soni@amd.com>, Srikanth Aithal <sraithal@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Joerg Roedel <joerg.roedel@amd.com>, 1135313@bugs.debian.org,
	Friedemann Stoyan <fstoyan@swapon.de>
Subject: Please backport 9e249c484128 ("iommu/amd: serialize sequence
 allocation under concurrent TLB invalidations") to 6.12.y
Message-ID: <afpVqZDIRVmdV960@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="aSHEFBW7c4jh6yb3"
Content-Disposition: inline


--aSHEFBW7c4jh6yb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

After updating to 6.12.85 in Debian we got a regression report, where
frequently a user had "AMD-Vi: Completion-Wait loop timed out" logged.
The report is at: https://bugs.debian.org/1135313

While investigating it looks d2a0cac10597 ("iommu/amd: move
wait_on_sem() out of spinlock") got backported to 6.12.y but a
followup for it not.

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1135313#43 confirmed
that a backport of 9e249c484128 solved the problem. Now that one does
not apply cleanly. As an alternative the following two might work, the
first is a clean cherry-pick, the second on top needed a slight
adjustment since in 6.12.y f32fe7cb0198 is not present.

it would be though ideal if the maintainers can confirm this is the
way to go.

Regards,
Salvatore

--aSHEFBW7c4jh6yb3
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-iommu-amd-Use-atomic64_inc_return-in-iommu.c.patch"

From c1eddc8c4ee7dc0ef651d87c51676fe4cd60a9df Mon Sep 17 00:00:00 2001
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 7 Oct 2024 10:43:31 +0200
Subject: [PATCH 1/2] iommu/amd: Use atomic64_inc_return() in iommu.c

commit 5ce73c524f5fb5abd7b1bfed0115474b4fb437b4 upstream.

Use atomic64_inc_return(&ref) instead of atomic64_add_return(1, &ref)
to use optimized implementation and ease register pressure around
the primitive for targets that implement optimized variant.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Link: https://lore.kernel.org/r/20241007084356.47799-1-ubizjak@gmail.com
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
---
 drivers/iommu/amd/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index fecca5c32e8a..24e2de90ac2e 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -1266,7 +1266,7 @@ static int iommu_completion_wait(struct amd_iommu *iommu)
 	if (!iommu->need_sync)
 		return 0;
 
-	data = atomic64_add_return(1, &iommu->cmd_sem_val);
+	data = atomic64_inc_return(&iommu->cmd_sem_val);
 	build_completion_wait(&cmd, iommu, data);
 
 	raw_spin_lock_irqsave(&iommu->lock, flags);
@@ -2929,7 +2929,7 @@ static void iommu_flush_irt_and_complete(struct amd_iommu *iommu, u16 devid)
 		return;
 
 	build_inv_irt(&cmd, devid);
-	data = atomic64_add_return(1, &iommu->cmd_sem_val);
+	data = atomic64_inc_return(&iommu->cmd_sem_val);
 	build_completion_wait(&cmd2, iommu, data);
 
 	raw_spin_lock_irqsave(&iommu->lock, flags);
-- 
2.53.0


--aSHEFBW7c4jh6yb3
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0002-iommu-amd-serialize-sequence-allocation-under-concur.patch"

From c0e5ddae730cd75b2c806655a8ced16148bafa2c Mon Sep 17 00:00:00 2001
From: Ankit Soni <Ankit.Soni@amd.com>
Date: Thu, 22 Jan 2026 15:30:38 +0000
Subject: [PATCH 2/2] iommu/amd: serialize sequence allocation under concurrent
 TLB invalidations

commit 9e249c48412828e807afddc21527eb734dc9bd3d upstream.

With concurrent TLB invalidations, completion wait randomly gets timed out
because cmd_sem_val was incremented outside the IOMMU spinlock, allowing
CMD_COMPL_WAIT commands to be queued out of sequence and breaking the
ordering assumption in wait_on_sem().
Move the cmd_sem_val increment under iommu->lock so completion sequence
allocation is serialized with command queuing.
And remove the unnecessary return.

Fixes: d2a0cac10597 ("iommu/amd: move wait_on_sem() out of spinlock")

Tested-by: Srikanth Aithal <sraithal@amd.com>
Reported-by: Srikanth Aithal <sraithal@amd.com>
Signed-off-by: Ankit Soni <Ankit.Soni@amd.com>
Reviewed-by: Vasant Hegde <vasant.hegde@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
[Salvatore Bonaccorso: Backport to v6.12.y where f32fe7cb0198
("iommu/amd: Add support to remap/unmap IOMMU buffers for kdump") is not
present]
Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
---
 drivers/iommu/amd/amd_iommu_types.h |  2 +-
 drivers/iommu/amd/init.c            |  2 +-
 drivers/iommu/amd/iommu.c           | 18 ++++++++++++------
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index a14ee649d3da..df2aa1c4fafc 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -781,7 +781,7 @@ struct amd_iommu {
 
 	u32 flags;
 	volatile u64 *cmd_sem;
-	atomic64_t cmd_sem_val;
+	u64 cmd_sem_val;
 
 #ifdef CONFIG_AMD_IOMMU_DEBUGFS
 	/* DebugFS Info */
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index e1816ae8699d..78e9ceda2338 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -1742,7 +1742,7 @@ static int __init init_iommu_one(struct amd_iommu *iommu, struct ivhd_header *h,
 	iommu->pci_seg = pci_seg;
 
 	raw_spin_lock_init(&iommu->lock);
-	atomic64_set(&iommu->cmd_sem_val, 0);
+	iommu->cmd_sem_val = 0;
 
 	/* Add IOMMU to internal data structures */
 	list_add_tail(&iommu->list, &amd_iommu_list);
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 24e2de90ac2e..d0e53a03eff0 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -1252,6 +1252,12 @@ static int iommu_queue_command(struct amd_iommu *iommu, struct iommu_cmd *cmd)
 	return iommu_queue_command_sync(iommu, cmd, true);
 }
 
+static u64 get_cmdsem_val(struct amd_iommu *iommu)
+{
+	lockdep_assert_held(&iommu->lock);
+	return ++iommu->cmd_sem_val;
+}
+
 /*
  * This function queues a completion wait command into the command
  * buffer of an IOMMU
@@ -1266,11 +1272,11 @@ static int iommu_completion_wait(struct amd_iommu *iommu)
 	if (!iommu->need_sync)
 		return 0;
 
-	data = atomic64_inc_return(&iommu->cmd_sem_val);
-	build_completion_wait(&cmd, iommu, data);
-
 	raw_spin_lock_irqsave(&iommu->lock, flags);
 
+	data = get_cmdsem_val(iommu);
+	build_completion_wait(&cmd, iommu, data);
+
 	ret = __iommu_queue_command_sync(iommu, &cmd, false);
 	raw_spin_unlock_irqrestore(&iommu->lock, flags);
 
@@ -2929,10 +2935,11 @@ static void iommu_flush_irt_and_complete(struct amd_iommu *iommu, u16 devid)
 		return;
 
 	build_inv_irt(&cmd, devid);
-	data = atomic64_inc_return(&iommu->cmd_sem_val);
-	build_completion_wait(&cmd2, iommu, data);
 
 	raw_spin_lock_irqsave(&iommu->lock, flags);
+	data = get_cmdsem_val(iommu);
+	build_completion_wait(&cmd2, iommu, data);
+
 	ret = __iommu_queue_command_sync(iommu, &cmd, true);
 	if (ret)
 		goto out_err;
@@ -2946,7 +2953,6 @@ static void iommu_flush_irt_and_complete(struct amd_iommu *iommu, u16 devid)
 
 out_err:
 	raw_spin_unlock_irqrestore(&iommu->lock, flags);
-	return;
 }
 
 static void set_dte_irq_entry(struct amd_iommu *iommu, u16 devid,
-- 
2.53.0


--aSHEFBW7c4jh6yb3--
