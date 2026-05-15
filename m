Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8584C6EF9
	for <regressions@lists.linux.dev>; Fri, 15 May 2026 16:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863995; cv=pass; b=SeZt9M+FA6ulh8MOWMSXOTsSsuw4wnMMStF9K00rOk3+/loDiDyHhSK4qYEFmbg0RPtIC5auwWVgCGIQolxctLVYvZ95pgAExA29Doxg56autl1F/XblN/evN/vxq8/QVGj5GI+nmKggU4yXovSuPNBd/XL0RYIqTyhIIJwucbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863995; c=relaxed/simple;
	bh=oour2uG5iRfmu2ayrytJIqDx9R0+oLFFwOaMHB+gtAU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=czHzq8Cgt5PDW3jh7uSi8iPZKoCa+lmCaf3ar6aHnizJdDzUotiUfyJZ3ZUrde18cXLuFShXKKqA6ZoVPvd/4VHlzGax1qTvp+9Nz9oU643s1G6GsIpGdoan0kBpqgJ9zeZEvKDgchjNZAF9sui7AhQA/dveizWfZ6Zt93kaZIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPb1XMpv; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPb1XMpv"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a3ffd11fa2so520221e87.0
        for <regressions@lists.linux.dev>; Fri, 15 May 2026 09:53:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778863991; cv=none;
        d=google.com; s=arc-20240605;
        b=cf7iaZH6QKJwxRXa5EuGuclyp8mnXkyGDcFG+FTEbsgxiXql5EYWDrRiKzpF7hDqC/
         9pv4rMy093cjZU3zaP2GxrxNCWu2z4bDlZxH4OJu7z2xq8+uuTeiHxm+o6UdpdjVFvTp
         3oIj0MvJZWellJBclb4D9t09A+9TeqZciPza9791Hdb+IFenc4nJjRq7wcBPoftHExqH
         8M9OWupUiZs8g+qsIydGzPWmb5F8cQYcO3F3eA5I/ONv7B8S8AIMGXDW5mxVjfgBk+6f
         KsjHk0BMgWlrFrrp+aBAiXT6ZCJ7FKcX2mKDALM9LRFI8bH9h1JsTMGMHsI5Lr7c4O6j
         1KvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=QyIEXMzo0LLWlJtxbIVaApvLffeGdlkhSdDar+auJNA=;
        fh=qh5f6/4bVC19ZjnQwAdbZ83QcgPqO0r8GGCyoKKGxoM=;
        b=OcLzn0oXmqIdMestR056uKeCPOvhoJazhLtiXWOQlAnN8UDW0qJT/jmClzK1/RQ7zx
         Cg3j3j9x/MWBubVslG4Hy1mgHz9ma2JWe6VHuwqtptaqJKvzW1RtVb/nZwmBEXPfQ1Jo
         R2DN65UcejjNxDLFtVqStjtrCGY/haOeVz+441sOtpO3DPnWBeInUERfT2y+o1d/JjiO
         wK3uah26tP3nPP2f/x0OSSSFfEMuSLP/k4kEALjIpSS+pZxQe4GJql/Y9HfuWVVDXaUX
         15pLi8jZ9Ia955K0sEVEKjbTrrB51ZZupGZHy0/saQue3+bxkWmZ+M0rsBksk3yK9WZo
         Mc5w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778863991; x=1779468791; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QyIEXMzo0LLWlJtxbIVaApvLffeGdlkhSdDar+auJNA=;
        b=EPb1XMpvDwMMReBdXckAp/4bbVzNrkWASYtSzpxRiPTFXks6S3G5KoCYsjxCjuOCgU
         +GekDLeaqkqVl08md07mv5146ZoeyrA9pE+ygrPezGjCs5xTj0WbsxgOPw+dXKTZ71to
         7wp5IOdXDlFjCx1v111xoURyurt1CZe5UzGY/E3BPK0n8oedWF/qgYsVgUd+fiU5y4aa
         Pc9p4nllrqvCryEonPqSd0DSTjieQ9i0SgHDsrcc3BjT7fz9cwss6l9C+vYBhg7BymjT
         9abHNlJbt1+Wnn6eAAkBIdTU5Sy9IqsGcTBu9WfpL+H0NlqW2Q3GewhvKtahFljCEuWQ
         Zg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778863991; x=1779468791;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QyIEXMzo0LLWlJtxbIVaApvLffeGdlkhSdDar+auJNA=;
        b=VRcxDcuXDLByOaVVzxVd+IIQtXpG/LPXjbBxssEB73r3qjvW9meuRh3z+eotl5X9zT
         mWERKyC8WUUDsDrmzj0BlLMsSHBfEpLCpBNP00XNJQlMxn98HpE740aQUkGU58TlKn/C
         Z13b/xG4GcUZjh8yzByw2ZIVscpSF96Cq5YjJM68+KPumo5sRMtbFn2HjRwwNapTN4/f
         DJ4WF4kwz75tIV+lkAHEzRiCkCBZNLzYwHHK9nkecOQ/yUpykFfLGifJEgenEy5CgizO
         0De3J/feWrH2GvpwR0MrfnGixw9vQDfupRohg1WQa6IUcy8AhumVS6tu0rmS4pMjG5yM
         5Myg==
X-Forwarded-Encrypted: i=1; AFNElJ+3gXSUWPp2uUpSD67u4u2jXZh7eWiSSHmqRpvXdlWMqFiGOP2tMJVXKV8dVstkRPnqhKuYwCI0h67jQA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqn+1KudoE4pWfmYb4B+t4yoDRRPkNb3LoJpqOw9WtlcCtYUym
	PJD0Cm7y6a2I9GNWmVw/OASBQ2528VqDvNtBMuJ8c/LItTiQ6zTqqFAnctu2ttoCfkdajBJ0MVi
	4t05oI61HTG/IKhvqV9i1/Rb52RGuCAc=
X-Gm-Gg: Acq92OFoC/vPjjEl5QxTbGWzzyl8ePvbhFWBzb2O9fGKP109WG5YalFRZjAswZzw7AP
	eiNav6rwKqm8F5GTZElRuhbaWqWbBVWAEGULKL/5KH7qXGgSykWp1hCgR625+4aGHqMI6818hHe
	qiCVCm1UD2uXgxXI+ZtyXGfmnJ35Rnv13owFH2fN3FKCdaFXEYX0kpkiuyt7PBe+XVs87owOLHN
	2051MoyN/4Q91RvR2tSKcLDD2LEYs94kcBd898Bj9uIoZolRPHseJpCfIUD+Ekbv09XJDNgvntY
	wEyFCW0=
X-Received: by 2002:a05:6512:108a:b0:5a4:19de:eb77 with SMTP id
 2adb3069b0e04-5aa0e74c40emr560236e87.3.1778863990648; Fri, 15 May 2026
 09:53:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Vjaceslavs Klimovs <vklimovs@gmail.com>
Date: Fri, 15 May 2026 09:52:59 -0700
X-Gm-Features: AVHnY4K5KLdo5SUY6rORreRp5hLSJu5MynIgl0mmY702h5swQNzKJAuKAe4ZMPI
Message-ID: <CAC_j7i1R7oy+nRhxEjCTba=DUgn02w9X+p94DCu0aHv5+5tKnQ@mail.gmail.com>
Subject: [REGRESSION] block: virtio-blk + LVM raid1 spurious sector-0 read
 failures on libaio/threads submit since 5ff3f74e145a ("block: simplify direct
 io validity check")
To: Jens Axboe <axboe@kernel.dk>
Cc: Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, 
	linux-raid@vger.kernel.org, dm-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Summary
-------
On v6.18, starting a libvirt/QEMU guest with virtio-blk backed by an
LVM "--type raid1" LV (drivers/md/dm-raid.c stacked on
drivers/md/raid1.c) makes md/raid1 register read failures at LV
sector 0 within seconds of "virsh start" and mark rimage_0 Faulty
once max_corrected_read_errors (default 20) is exceeded. Reads
succeed via the redirect path so guests boot, but every guest disk
ends up degraded on every VM start. Same workload on legacy
"--type mirror" (drivers/md/dm-raid1.c) crashes the host: a
zero-length READ reaches the NVMe controller, is rejected with
"Invalid Field in Command", and the dm-mirror recovery path oopses.

Symptom on dm-raid raid1 (post --type raid1)
--------------------------------------------
Per LV, at virsh start, in host dmesg:

  kernel: raid1_end_read_request: 95 callbacks suppressed
  kernel: raid1_read_request: 95 callbacks suppressed
  kernel: md/raid1:mdX: dm-58: rescheduling sector 0
  kernel: md/raid1:mdX: redirecting sector 0 to other mirror: dm-58
  kernel: md/raid1:mdX: dm-58: rescheduling sector 0
  kernel: md/raid1:mdX: redirecting sector 0 to other mirror: dm-58
  [... 10 rescheduling/redirecting pairs ...]
  kernel: md/raid1:mdX: dm-58: Raid device exceeded read_error
threshold [cur 21:max 20]
  kernel: md/raid1:mdX: dm-58: Failing raid device
  kernel: md/raid1:mdX: Disk failure on dm-58, disabling device.
  kernel: md/raid1:mdX: Operation continuing on 1 devices.

  dmeventd: WARNING: Device #0 of raid1 array, vg0-iris_boot, has failed.
  dmeventd: WARNING: Waiting for resynchronization to finish before
initiating repair on RAID device vg0-iris_boot.
  dmeventd: Use 'lvconvert --repair vg0/iris_boot' to replace failed device.

Subsequent "lvs -a":

  WARNING: RaidLV vg0/iris_boot needs to be refreshed!
  See character 'r' at position 9 in the RaidLV's attributes and its SubLV(s).

dmesg | grep nvme is EMPTY on this path. The NVMe driver is not
involved in producing the error; the failure originates between the
virtio-blk bio submission and raid1_end_read_request().

Symptom on legacy dm-mirror (pre-conversion --type mirror)
----------------------------------------------------------
Same workload on drivers/md/dm-raid1.c reaches the NVMe controller
as a zero-length READ and panics the host through dm-mirror's
recovery path:

  kernel: operation not supported error, dev nvme1n1, sector 935446535
op 0x0:(READ) flags 0x0 phys_seg 0 prio class 2
  kernel: nvme1n1: I/O Cmd(0x2) @ LBA 935446535, 0 blocks, I/O Error
(sct 0x0 / sc 0x2)
  [... 10+ identical bursts at same timestamp ...]
  dmeventd: Primary mirror device 252:58 read failed.
  dmeventd: vg0-iris_boot is now in-sync.
  [kernel oops in dm_mirror recovery path, full trace lost to console flash]

The "phys_seg 0", "0 blocks", "sct 0x0/sc 0x2" trio (NVMe Generic,
Invalid Field in Command, NVMe spec 4.1.1.2) is unambiguous: a bio
with bi_iter.bi_size == 0 and bi_vcnt == 0 left the block layer and
hit the controller. dm-raid raid1 hides this by retrying on the
surviving leg, but the upstream-of-md trigger is identical.

Bisect
------
git bisect, v6.12..v6.18, 16 deterministic GOOD/BAD steps, no skips,
~104 minutes:

  5ff3f74e145adc79b49668adb8de276446acf6be is the first bad commit
  block: simplify direct io validity check

  --- a/block/fops.c
  +++ b/block/fops.c
  @@ -38,8 +38,8 @@ static blk_opf_t dio_bio_write_op(struct kiocb *iocb)
   static bool blkdev_dio_invalid(struct block_device *bdev, struct kiocb *iocb,
                                  struct iov_iter *iter)
   {
  -        return iocb->ki_pos & (bdev_logical_block_size(bdev) - 1) ||
  -                !bdev_iter_is_aligned(bdev, iter);
  +        return (iocb->ki_pos | iov_iter_count(iter)) &
  +                        (bdev_logical_block_size(bdev) - 1);
   }

The dropped bdev_iter_is_aligned() used to walk the iov_iter and
reject per-segment misaligned/degenerate vectors at the blkdev fops
entry point. The replacement only validates ki_pos and total length
against the logical block size. Cases that now pass that no longer
get rejected:

  - iter with iov_iter_count(iter) == 0  (degenerate; total length is
    "sector-aligned" since 0 % 512 == 0)
  - iter where total length is sector-aligned but a segment isn't

The commit message justifies the removal with "The block layer
checks all the segments for validity later". This is true for the
io_uring submit path (which enters __blkdev_direct_IO directly and
does its own validation) but not for the libaio aio_read/write_iter
or the worker-pool sync read/write_iter paths that enter via
blkdev_{read,write}_iter() -> blkdev_dio_invalid(). For those paths,
the segment check has no replacement.

Reproducing
----------------------------------------------------------

The trigger requires QEMU virtio-blk's specific submission shape AND
a non-io_uring submit. Userspace libaio alone, userspace
preadv-in-a-thread alone, and QEMU's raw-driver open probes (which
qemu-img info exercises identically) are all insufficient. The
combination that hits the bug is "guest-driven I/O through
virtio-blk-pci with cache.direct=on and aio in {native, threads}".

#regzbot introduced: 5ff3f74e145adc79b49668adb8de276446acf6be

Thanks,
Vjaceslavs Klimovs
