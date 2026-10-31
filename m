Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793421758;
	b=EpGHZBriAz/ICy6tScMx3m6C0BrMVbqk0BqFGPh28HTyUkrXIoV7pqyRd6gsVZUgR1r6
	 8gqBLBHpZh6Ce7hcYuJI9MtWwsBnyQzTMvn5U4TCgCjAIVwp5fnR/GBMEeWswXEzrgQEM
	 bQ0fKHQkR1C/UqLFLZtjHTIpAocR+WCHoqEviUlSNyCuVO2OJSYiIUQS+4sM48Bcxaq/q
	 mi4fJn2+LtFrixpSm+x+wM59mOB/j4JGirYHAuWraoZlx/NQJBbnHbd44nKZooT2oyP6n
	 gMMCohgL4AVsGXym5Q2eu5ldBUjZTWR6LLSFaltzz/Ac4ETc3eAuEVaNiEuyht/YxGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793421758;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-ZohoMailClient;
	bh=sJ8c5IFCspf4DEBszgGmF7j4hNNQUDcLYzLMI5yLgEQ=;
	b=xiCsR5GVAW0tf4WyHVVWJ+lSPJFBgFqRFAiwQblBpZ0R5urjj/E1B+ltpp0FwopHWlur
	 ysnTLNQABVP6cqFx0EFpezz4aqQa/yCKRgXWztfqyAETN1t5I7Wbz7TpAGXt3UZg7kbop
	 9QqV/dcY89bif7f572kjlaJXwEAYKB9nVWq7SIJJPpddjajORoSKfz8VDDaX1P0JVUKs2
	 tgPi3SsE6EKMPM7EDp8S67M0wmfi/IiT8p67v+AiSUiaRAvhRciiYlxNSFYDH74j+z9Ag
	 8Cb2mAJ/o0AoE6DLtvMWYhPEYciXVcK6DmIqDNrZsDhOGyNXQ9opcE2Zgt/3oq11UJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=laveeshbansal.com;
	spf=pass smtp.mailfrom=laveeshbansal.com;
	dkim=pass header.d=laveeshbansal.com header.i=@laveeshbansal.com header.a=rsa-sha256 header.s=zoho header.b=Z4KXrakm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.15
Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28329606A31A
	for <regressions@lists.linux.dev>; Sat, 31 Oct 2026 04:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28329606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=laveeshbansal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laveeshbansal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=laveeshbansal.com header.i=@laveeshbansal.com header.a=rsa-sha256 header.s=zoho header.b=Z4KXrakm
ARC-Seal: i=1; a=rsa-sha256; t=1793421727; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qrnh/0l1BjZe0hRSg+hJR51f8ivnnA4Scj3HvyOLaP+46Jl01lVSUfEQ73WcOfrd/ajVb/2Nluy2EiCjf+FfKoLs0B99QCSwMwDfpM+mDOLWcL0na3HUtT7ar5KFhae3o27DT/ccV/gWZBeD8GPC71xf5kMMKLWnJeGmKdyEwzY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793421727; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sJ8c5IFCspf4DEBszgGmF7j4hNNQUDcLYzLMI5yLgEQ=; 
	b=gwJsenMSVQqygQaSljcsBT8OcK8Nyr2GMB5SYRTuqoxvYMjPzRpIL2oL3Iy+N+ptrIKfYH1N1Ceit99mQ5cCumZ6OuTZ8IA9T6UxV4C58GS9r1R4jtOuUnTMAFllq16JO5uZjx8FIh864rIqwmAB7XMUUpmIKnL8JnL/98DyvAk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=laveeshbansal.com;
	spf=pass  smtp.mailfrom=laveeshb@laveeshbansal.com;
	dmarc=pass header.from=<laveeshb@laveeshbansal.com>
DKIM-Signature: a=rsa-sha256; b=Z4KXrakm1cIB6eVUJu2+dqdKAoSGXt+QvS3LF0cnw+mMHWrWSK8o3rzoPGIrp0THR8FURK+rPLY2PCM9cazdyN872Qv9tscQ9q4eiSuiklNmXd/aw7nXui6a2Xs7ljSRdcpNuMXuzrOxN/igx6cUCr26DN2CgQCFMq+gEMRPQEc=; c=relaxed/relaxed; s=zoho; d=laveeshbansal.com; v=1; bh=sJ8c5IFCspf4DEBszgGmF7j4hNNQUDcLYzLMI5yLgEQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793421724606653.8085461912727;
	Fri, 30 Oct 2026 21:42:04 -0700 (PDT)
From: Laveesh Bansal <laveeshb@laveeshbansal.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	Ming Lei <tom.leiming@gmail.com>,
	Christoph Hellwig <hch@lst.de>,
	Yu Kuai <yukuai@fygo.io>,
	Reindl Harald <h.reindl@thelounge.net>,
	regressions@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] block: only serialize elevator switches of the same queue
Date: Fri, 30 Oct 2026 21:41:41 -0700
Message-ID: <20261031044141.5569-1-laveeshb@laveeshbansal.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Since commit 4ff58d6bc9dd ("block: serialize elevator changes for the
same queue using a writer lock"), a write to queue/scheduler fails with
-EBUSY whenever something else holds set->update_nr_hwq_lock. That
commit takes the lock for write, and it has to be a trylock because of
commit ce8ee8583ed8 ("block: use trylock to avoid lockdep circular
dependency in sysfs").

The lock covers the whole tag set, so it is easy to hit. A scheduler
write fails while another queue of the set is switching, or while a
sibling disk of the same SCSI host or NVMe controller is added or
removed. This matches the udev failures reported on 7.2.

Go back to taking the lock for read. The write lock was there to keep
two switches of one queue from overlapping in elevator_change_done(),
which touches the elevator sysfs and debugfs entries outside of
q->elevator_lock. Use QUEUE_FLAG_NO_ELV_SWITCH for that instead: a
write sets it before elevator_change() and clears it afterwards, and a
write that finds it set returns -EBUSY. Disk removal already sets the
flag under the write lock, so no switch can start once it has run.

Writes to the same queue, and writes that race with an nr_hw_queues
update, an nr_requests write or disk removal, can still get -EBUSY, as
with 4ff58d6bc9dd. A write to a disk that is being removed now gets
-EBUSY instead of -ENOENT.

Fixes: 4ff58d6bc9dd ("block: serialize elevator changes for the same queue using a writer lock")
Cc: stable@vger.kernel.org # v7.2+
Reported-by: Reindl Harald <h.reindl@thelounge.net>
Closes: https://lore.kernel.org/r/077dd42e-cbc9-4c23-a5ef-3d20e4fc7757@thelounge.net
Suggested-by: Nilay Shroff <nilay@linux.ibm.com>
Assisted-by: LLM
Signed-off-by: Laveesh Bansal <laveeshb@laveeshbansal.com>
---
Changes since v1 (https://lore.kernel.org/r/20261023201704.20577-1-laveeshb@laveeshbansal.com):
- Replaced the new mutex with QUEUE_FLAG_NO_ELV_SWITCH as a busy bit
  under the read lock, as Nilay suggested
  (https://lore.kernel.org/r/7f697f9d-6e8c-4544-bca7-137d3f3d2dbf@linux.ibm.com).
- Shin'ichiro's Tested-by on v1 does not carry over, since the code changed.
- I also tried taking q->sysfs_lock around the switch instead. It fixes
  the report too, but same-queue writers wait on it, and 1bf70d08cc3b
  ("block: introduce a dedicated lock for protecting queue elevator
  updates") moved elevator switching off that lock, so I kept the flag.

Tested on arm64 and x86_64 in QEMU, with KASAN, lockdep and debug lists.
Writes to queue/scheduler failing with -EBUSY, one number per run
(writers x writes):

                                       x86_64        arm64
  one writer per namespace (NVMe, one controller)
    v7.3, 4 x 400                      572, 649, 597 704, 662
    this patch, 4 x 400                0, 0          0, 0
  one writer, sibling namespaces added and removed
    v7.3, 1 x 400                      23, 32, 34    42, 43
    this patch, 1 x 400                0, 0, 1       0, 4, 1
  four writers on the same queue (null_blk)
    v7.3, 4 x 400                      849, 795, 756 807, 926
    this patch, 4 x 400                779, 790      910, 816
  one writer per SCSI disk (scsi_debug, 4 LUNs on one host)
    v7.3, 4 x 400                      828, 818      -
    this patch, 4 x 400                0, 0          -
  one writer on a SCSI disk, siblings deleted and rescanned
    v7.3, 1 x 400                      43, 46        -
    this patch, 1 x 400                0, 0          -

20 disk removals under writers complete on both architectures, with no
KASAN, lockdep or hung-task reports. blktests on x86_64 (all groups
except bcache, blktrace, rnbd and srp) gives the same results as v7.3.

 block/elevator.c       | 30 +++++++++++++++++-------------
 include/linux/blkdev.h |  4 +---
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/block/elevator.c b/block/elevator.c
index 2161b6eea680..66edf1a5768a 100644
--- a/block/elevator.c
+++ b/block/elevator.c
@@ -812,25 +812,29 @@ ssize_t elv_iosched_store(struct gendisk *disk, const char *buf,
 	 * reference during concurrent disk deletion:
 	 *   update_nr_hwq_lock -> kn->active (via del_gendisk -> kobject_del)
 	 *   kn->active -> update_nr_hwq_lock (via this sysfs write path)
-	 *
-	 * Use the writer lock instead of the reader lock of update_nr_hwq_lock
-	 * to serialize the two-stage elevator switch steps in
-	 * elevator_change(): the core switch step under the elevator lock and
-	 * the elevator_change_done() step outside the elevator lock.
 	 */
-	if (!down_write_trylock(&set->update_nr_hwq_lock)) {
+	if (!down_read_trylock(&set->update_nr_hwq_lock)) {
 		ret = -EBUSY;
 		goto out;
 	}
-	if (!blk_queue_no_elv_switch(q)) {
-		ret = elevator_change(q, &ctx);
-		if (!ret)
-			ret = count;
-	} else {
-		ret = -ENOENT;
+
+	/*
+	 * The reader lock is shared, so use QUEUE_FLAG_NO_ELV_SWITCH to allow
+	 * only one switch of this queue at a time, and none once the disk is
+	 * going away.
+	 */
+	if (test_and_set_bit(QUEUE_FLAG_NO_ELV_SWITCH, &q->queue_flags)) {
+		ret = -EBUSY;
+		goto out_unlock;
 	}
-	up_write(&set->update_nr_hwq_lock);
 
+	ret = elevator_change(q, &ctx);
+	if (!ret)
+		ret = count;
+
+	blk_queue_flag_clear(QUEUE_FLAG_NO_ELV_SWITCH, q);
+out_unlock:
+	up_read(&set->update_nr_hwq_lock);
 out:
 	if (ctx.type)
 		elevator_put(ctx.type);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 4f7905c3412b..3989bb0dd43b 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -675,7 +675,7 @@ enum {
 	QUEUE_FLAG_HCTX_ACTIVE,		/* at least one blk-mq hctx is active */
 	QUEUE_FLAG_SQ_SCHED,		/* single queue style io dispatch */
 	QUEUE_FLAG_DISABLE_WBT_DEF,	/* for sched to disable/enable wbt */
-	QUEUE_FLAG_NO_ELV_SWITCH,	/* can't switch elevator any more */
+	QUEUE_FLAG_NO_ELV_SWITCH,	/* a switch is running or disk is going away */
 	QUEUE_FLAG_QOS_ENABLED,		/* qos is enabled */
 	QUEUE_FLAG_BIO_ISSUE_TIME,	/* record bio->issue_time_ns */
 	QUEUE_FLAG_ZONED_QD1_WRITES,	/* Limit zoned devices writes to QD=1 */
@@ -716,8 +716,6 @@ void blk_queue_flag_clear(unsigned int flag, struct request_queue *q);
 	((q)->limits.features & BLK_FEAT_SKIP_TAGSET_QUIESCE)
 #define blk_queue_disable_wbt(q)	\
 	test_bit(QUEUE_FLAG_DISABLE_WBT_DEF, &(q)->queue_flags)
-#define blk_queue_no_elv_switch(q)	\
-	test_bit(QUEUE_FLAG_NO_ELV_SWITCH, &(q)->queue_flags)
 #define blk_queue_zoned_qd1_writes(q)	\
 	test_bit(QUEUE_FLAG_ZONED_QD1_WRITES, &(q)->queue_flags)
 
-- 
2.43.0

