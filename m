Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFF443B6E0
	for <regressions@lists.linux.dev>; Thu, 20 Aug 2026 11:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787226499; cv=none; b=cj4gU/uQLbu8KnmPzAGOPw8DpJCESHZ4xii0iaRXa8CJ7+S/FsKrx5phgvDqqJjAZm7cYCexUdEjejYqJymdLwe3+yAMaYW2xS/HfZvEnP6fTED32+xEu+PwRmDAa2IbdAxwHKmzszlCwQBIXkTnKiN+wouTgCJ+gaOkyaSAvL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787226499; c=relaxed/simple;
	bh=mEeUMUtD98Xw/GmKeKfpsPPagIcFqKc11s37OIWjxHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A7pPTKF+iS4JzpWOgXvq6DJZhu80UtQ30TjWmHSJSyfeVcIxIskqlqO88GTb5s2H1//CzLLAy+WriB4Q3S0CWBfFzV68sw1WDMOv7Xyr0PVTTSDmrMEsggDdZVysQzZV/UAnm0300nWQ82JdC4QcBPNI+tgC89v4XRwjxoMKurY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zadarastorage.com; spf=pass smtp.mailfrom=zadarastorage.com; dkim=pass (2048-bit key) header.d=zadarastorage.com header.i=@zadarastorage.com header.b=Jycq5h6x; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zadarastorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zadarastorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zadarastorage.com header.i=@zadarastorage.com header.b="Jycq5h6x"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495590dde14so24661755e9.0
        for <regressions@lists.linux.dev>; Thu, 20 Aug 2026 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zadarastorage.com; s=google; t=1787226496; x=1787831296; darn=lists.linux.dev;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:organization:date:subject:cc
         :to:from:reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sjZ6o2B4u5+ODMneCLOWQXXYoRKfP63ZeuV0QIVzkkY=;
        b=Jycq5h6xjp17FxTHbTlLLNSN+N4n7HW+d13SRjOlbHha8haj3klm9Af/07fYYtoAjs
         Tt2QNvJ29nESjMWfsQ29ovbCIxUuJ8vbju5aTSePiHA1fXV2hE0JpLljfVtrQcY/tRTq
         kZmfZJFqEIaff9vDO+sMB5oBC+S9nXOYKjRi6jinKr8StyD2XjhF1nGJo1yndcvh1keN
         kdhhJA1VtZhiiVUe6KMGB9CO+0DgGtJ1YXepa45ZVa4UyFwViESOkexdJgdrSJRVchxX
         xLWten0EslA8kfMh5MRoUX99+TafSxFKRxCE1hcy1W3CKqg48aEIW5VWmlnC7CIRyFIu
         2HvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787226496; x=1787831296;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:organization:date:subject:cc
         :to:from:reply-to:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjZ6o2B4u5+ODMneCLOWQXXYoRKfP63ZeuV0QIVzkkY=;
        b=Q3WN6fhiyX4uC+Graby3ONa/BxcZPwgoBGHYAN5VVSko5yK3dyLXJBpbIk3C5NTEyy
         KJNEn+iMUQLZEMehGjdfaZnLT52wGSDBSvOKXeq3D2tde6WxL6ldJt1zZNm937/WT3wD
         xGnllyf/XvepCz3L5FIMJh5shpEOHNaGszCIJ3KE2p/gyRqsHPyVPj38ycYa2BHzWo4f
         NJDPr062t3RJJLxM1JehpZMgbuKPrDVSgtlXxIpOXpnAyYDfH6R/JScer22vccEqtHr1
         pkFoo0AL8bC+b0d9+cMmx+zcJlxla3R4arbE8OB8fXu9I98b5dIBxJdgEiYuWa3YNuV2
         Kdqg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4+SYVAtKtUx5726o7P8MgiWa9st2zSy3Zfm34EjK4X1Q6MDM7McIrEjncI3OLJ5UEo3n0p9rLCXlnZg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+3Q+Wc63oh4r60PHAOe+HGkXl4JXnjsQKAaIdBgeoqgVxaW5w
	jZpZnUfGVa5RwYMRNzb1AZHeytDW1IuNR24Cx/s3Rg+gZ2lfNcBhMIYis/Gd4mY4280=
X-Gm-Gg: AR+sD13BX7cOD3NeYiHmQPKpK3JiNhD8RNJJLpBmjih5kMfx6yUeiO2U+wKXiR5yKSC
	SLZeNLJxJ6mLelhz30SSZUbIP8rCXAl/T7CSnYtgvPgZc9W7V/VAK+qUVEla8DLTetC4IAjINlb
	VVXGql4LrI/hA+rmC0spFgdBir+fuligkf/0EtOiTffDpsdNufDeJtDvyL7sj7+HesYb28N3CkJ
	IcaUNSLJTu1VbhcJRDALu4LJTG3o8yT1cqcNDFYCEp6XcOAKUsc91RltPDBwWgP4bfTxh/N3V6Y
	3TdJqcHesTXw//ZOzUJkw7/Gvy0BOPbtQijFbWHx4QeJeujkFocboZs/vcMfAj3UVLQmpidD34x
	57rVxK4CvWGmV5/j6aXsgGeL8wmNSvR15Sb+8X/FrxfoWsdecBAeC9dsMKvu284Pp4qsZbNKBKT
	wVvzC7c5j2XadJ8wM4qmUC1EAQPNfZO+K932U9iMAunUMBFtVl5s/2/G0Pu0/BHfLmE5g=
X-Received: by 2002:a05:600c:c167:b0:495:4d00:2fda with SMTP id 5b1f17b1804b1-499aa143546mr227118585e9.2.1787226495784;
        Thu, 20 Aug 2026 04:48:15 -0700 (PDT)
Received: from levpc4 ([82.166.81.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm181074585e9.11.2026.08.20.04.48.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2026 04:48:14 -0700 (PDT)
Reply-To: <lev.vainblat@zadara.com>
From: <lev@zadarastorage.com>
To: <linux-block@vger.kernel.org>
Cc: "'Jens Axboe'" <axboe@kernel.dk>,
	<linux-kernel@vger.kernel.org>,
	<regressions@lists.linux.dev>,
	"'Ming Lei'" <tom.leiming@gmail.com>,
	"'Yu Kuai'" <yukuai@fygo.io>,
	"'Keith Busch'" <kbusch@kernel.org>,
	<linux-nvme@lists.infradead.org>
Subject: [REGRESSION] blk-mq: hctx loses BLK_MQ_F_TAG_QUEUE_SHARED across blk_mq_update_nr_hw_queues()
Date: Thu, 20 Aug 2026 14:48:10 +0300
Organization: Zadara
Message-ID: <00cb01dd3099$c82b66c0$58823440$@zadarastorage.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad0v5ziZbJoftdS9SsWisTfxJtxmzQ==
Content-Language: en-il

Hi,

After blk_mq_update_nr_hw_queues(), every hctx on the tag set can end
up with BLK_MQ_F_TAG_QUEUE_SHARED cleared while set->flags still has
it (it alternates - see below).

blk_mq_alloc_hctx() deliberately masks the bit off:

  hctx->flags = set->flags & ~BLK_MQ_F_TAG_QUEUE_SHARED;

which is right at initial queue creation, because the queue is not yet
on set->tag_list and blk_mq_add_queue_tag_set() applies the bit
immediately afterwards. But __blk_mq_realloc_hw_ctxs() exits and
re-inits every hctx even when nr_hw_queues is unchanged, and
__blk_mq_update_nr_hw_queues() does that for every queue on the tag
set without re-applying the bit. On that path the queue is already on
set->tag_list, so nothing calls queue_set_hctx_shared().

The strip alternates, which is likely why this has gone unnoticed.
blk_mq_init_hctx() never assigns hctx->flags, blk_mq_exit_hctx()
pushes the old hctx to the head of q->unused_hctx_list, and
blk_mq_remove_hw_queues_cpuhp() runs only after every queue on the tag
set has been realloc'd. So the just-exited hctx is refused by
blk_mq_hctx_is_reusable() - still cpuhp hashed - while the hctx exited
during the *previous* update has since been unhashed and is reused
carrying its stale flags:

  after 0 resets: alloc_policy=FIFO SHOULD_MERGE|TAG_QUEUE_SHARED|BLOCKING
  after 1 reset:  alloc_policy=FIFO SHOULD_MERGE|BLOCKING
  after 2 resets: alloc_policy=FIFO SHOULD_MERGE|TAG_QUEUE_SHARED|BLOCKING

Within one update it is uniform: every hctx of every queue on the tag
set goes the same way, with no partial mix.

One namespace is enough for the tag set to be shared, since
nvme_alloc_io_tag_set() puts ctrl->connect_q on the same tag set for
fabrics, so the set is shared from the first connect.
nvme_tcp_configure_io_queues() and nvme_rdma_configure_io_queues() reach
blk_mq_update_nr_hw_queues() unconditionally on the !new path, so every
reconnect and every controller reset does it. nvme_fc_recreate_io_queues()
only calls it when the queue count actually changes across reconnect
(prior_ioq_cnt != nr_io_queues); nvme-pci calls it unconditionally on
reset.

__blk_mq_update_nr_hw_queues() does return early when the queue count
is unchanged and set->nr_maps == 1, which might look like it should
cover a same-count reset - but tcp and rdma pass nr_maps = 2 (or
HCTX_MAX_TYPES with poll queues), so that early return never triggers
for them. It does apply to fc, which passes nr_maps = 1 and is
filtered twice: once by its own prior_ioq_cnt check, once by this.

This is directly observable with no I/O scheduler and no load at all:

  # sized small for the stall reproducer below
  nvme connect -t tcp -a $ADDR -s $PORT -n $NQN \
       --nr-io-queues=1 --queue-size=16

  grep -H . /sys/kernel/debug/block/nvme0n1/hctx0/flags
  # alloc_policy=FIFO SHOULD_MERGE|TAG_QUEUE_SHARED|BLOCKING

  echo 1 > /sys/class/nvme/nvme0/reset_controller
  grep -H . /sys/kernel/debug/block/nvme0n1/hctx0/flags
  # alloc_policy=FIFO SHOULD_MERGE|BLOCKING   <- TAG_QUEUE_SHARED gone
  # set->flags still has it (retry the reset if not - see the
  # alternation above)

The general impact, independent of any I/O scheduler: hctx_may_queue()
opens with

  if (!hctx || !(hctx->flags & BLK_MQ_F_TAG_QUEUE_SHARED))
    return true;

so an affected hctx skips the fair-share depth division entirely and can
draw more than its share of the shared pool, starving sibling namespaces
of driver tags. This is not scheduler-specific: with no elevator,
__blk_mq_get_tag() applies hctx_may_queue() to every unreserved allocation
at request-allocation time, and with one attached,
__blk_mq_alloc_driver_tag() applies it when dispatch takes the driver tag.
Either way the stripped bit skips the check. Separately, blk_mq_tag_busy()
and blk_mq_inc_active_requests() are also gated on the same bit and become
no-ops, so tags->active_queues and hctx->nr_active read 0 regardless of
load - the exact diagnostic an operator would reach for to see the
contention above is blind. Both of these apply on every affected system,
with or without a scheduler, and with or without a request ever getting
stuck.

This is separate from the in-flight work to drop shared-tag fairness
throttling entirely - that would remove hctx_may_queue()'s fair share and
the active_queues symptom by design, but the flag itself would still be
mistracked, and the hang described below gates on the same bit through
code the fairness removal does not touch.

Presumably the fix is to re-apply the bit per queue after the realloc
loop. Dropping the mask in blk_mq_alloc_hctx() instead would not fix
this: the reuse path never goes through blk_mq_alloc_hctx() at all, so
a reused hctx keeps whatever flags it had in its previous life either
way, which is the actual bug (see the alternation above). I have not
tested a fix - I have no mainline test rig - but I can test patches on
6.6.y, and the reproducer below turns one around in about a minute.

I have not established when this started, and I do not have the resources
to bisect it. By inspection, 85672ca9ceea ("block: avoid to reuse `hctx`
not removed from cpuhp callback list") looks like the point where it
became reachable on the ordinary same-count reset path: before it the
reuse test was numa_node only, so the just-exited hctx at the head of
q->unused_hctx_list was reused and its flags carried over intact; after it
that candidate is refused while still cpuhp hashed. I could not test a
kernel without that commit, so please treat that as a hypothesis and not a
bisect result. The asymmetry in blk_mq_alloc_hctx() is older than that
commit either way, and the code path is unchanged in master as of
d58772d8520c.

I searched the linux-block archive for BLK_MQ_F_TAG_QUEUE_SHARED and
found no existing report of this, but I may well have missed one -
please point me at it if so.

Worst case: with an I/O scheduler attached, this can hang a request
forever, and it did in production.

With the bit clear, blk_mq_mark_tag_wait() takes the non-shared branch,
sets BLK_MQ_S_SCHED_RESTART and registers no waiter on the tag waitqueue,
and the dispatch tail schedules no re-run because no_tag is gated on the
same flag. The comment on that gate - "For non-shared tags, the RESTART
check will suffice" - is precisely the invariant a wrongly-cleared bit
breaks: the check does not suffice, because the tags really are shared.
Recovery then rests solely on a request completing on this hctx - but the
tags are shared, so they are freed by the sibling queues, whose
completions restart only their own hctx. Two or more namespaces actually
carrying I/O are needed for this part, because the tags have to be freed
by a different queue's hctx - the flag loss above needs only the one.

Reproducer. Continuing from the connection above, now with an I/O
scheduler and load across all four namespaces on the controller.
Reproduced on 6.6.146 and on stock Ubuntu 6.8.0-137-generic:

  # with a scheduler, driver tags are acquired at dispatch time
  for d in /sys/block/nvme0n*; do
      echo mq-deadline > $d/queue/scheduler
  done

  # confirm the flag is gone on every namespace, not just n1
  grep -H . /sys/kernel/debug/block/nvme0n*/hctx0/flags
  # alloc_policy=FIFO SHOULD_MERGE|BLOCKING   <- TAG_QUEUE_SHARED gone

  # moderate load now stalls the whole controller within a second
  fio --name=hammer --ioengine=libaio --direct=1 --rw=randread --bs=4k \
      --iodepth=64 --numjobs=8 \
      --filename=/dev/nvme0n1 --filename=/dev/nvme0n2 \
      --filename=/dev/nvme0n3 --filename=/dev/nvme0n4

All I/O stops permanently. Every fio task:

  io_schedule+0x46/0x70
  blk_mq_get_tag+0x155/0x2f0
  __blk_mq_alloc_requests+0xc4/0x290
  blk_mq_submit_bio+0x190/0x6b0
  submit_bio_noacct+0x162/0x5c0
  blkdev_direct_IO.part.0+0x40/0x90

Three of the four namespaces end up with parked requests - one alone
accumulates four. From one of the namespaces holding a single parked
request:

  hctx0/dispatch: {.op=READ, .state=idle, .tag=-1, .internal_tag=10,
                   .rq_flags=STARTED|SCHED_TAGS|USE_SCHED|IO_STAT}
  hctx0/state:    SCHED_RESTART
  hctx0/flags:    alloc_policy=FIFO SHOULD_MERGE|BLOCKING
  hctx0/tags:     nr_tags=15 nr_reserved_tags=1 active_queues=0
                  bitmap_tags: depth=14 busy=0 cleared=14 ws_active=0
                  ws={ all 8 .wait=inactive }

The empty namespace shows the identical tags line - same shared pool -
with no dispatch entry. All 14 non-reserved driver tags are in the
cleared word awaiting the deferred merge, none allocated, and no
waiter is registered anywhere.

While the shared pool is still busy with the sibling queues' inflight I/O,
every run of such an hctx - including runs triggered by later submissions
- fails to get a driver tag, re-parks what it pulled, and parks the new
requests behind it. Once every fio thread is blocked on scheduler tags and
the inflight I/O has drained via the sibling queues, nothing runs the hctx
again: the hctx has SCHED_RESTART set with no waiter registered, and
blk_mq_sched_restart() is only called by a completion on the same hctx.
Those parked requests, and the requests queued behind them in the
elevator, hold the *scheduler* tags the blocked tasks are waiting for. The
fourth namespace stays empty only because every fio thread was already
stuck by the time it was captured.

Once stalled there is no reliable way out from userspace - every
teardown path (elevator switch, reset_controller, nvme disconnect)
freezes the queue and waits on the same stuck request. Anyone
reproducing this should expect to reboot sometimes. Attaching no
scheduler beforehand prevents it (driver tags are then taken at
request-allocation time, where waiting works correctly) but won't
rescue an already-stalled queue.

We hit this in production as a 20 minute md/raid1 hang and hung_task
panic on nvme-rdma - same signature: sole entry on hctx->dispatch, all
126 driver tags free, and set->flags still carrying
BLK_MQ_F_TAG_QUEUE_SHARED while every hctx of the reconnected
controller had lost it; a second controller on the same host that
never reconnected retains it on every hctx.

Thanks,
Lev

