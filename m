Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792931928;
	b=fhD1lV5Ousz5frTW6g/1Jljwp/U4ZzpNhZYmu3iYXJqsqtq8HYn7dkfmDmHme7XWx6Rs
	 QTuJbm+mPVXxHLgqdqycVZMqg/084VaCcw49RxdaP/Tfsx9NfK7enD+EloV9gYNRzM6En
	 73paLfmmHerfdSPSP4JoAl8zaK2D0bBQTM9IiGW2icW1QqlsHTXeEbe7ZB0O+haWdqgR+
	 UK/LZHXpsj0SXhqrsB5L8lQX+VSzqC2TMAryVPHpqOXOYLGzIyczHY8bEOls6/lTFxQsZ
	 hjmJzoQ4p8kzdVD2BQqUkUCi3Puy9sxRt2V/RLLh+zpxgYhxUhatZSN0kkZdXiULW4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792931928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=ifIa5BWnf8laepgAGnQECywu1F41hu5JMjyB1fMNjtc=;
	b=Puh7ja3Bmo+vPQBvoqBf45M6DDA+4aFfCQIVbJlTnfbDh4VgX0w0CYiZ7CcqQXwrtuy2
	 Ufl2oDLGEynlaYRTYdm0rSRO+pj3uMVfWgVOmDl9WqGHYpT2UXig0z8xWX53IpwfA1g7o
	 aWZCO9bjAV+W0uJLGF5v9S2bH75gUKAzN+8U619Yjm1wC2bLkBXA4BI9V1WWqq2elBQSt
	 h2Gjy/tqgCHXerhsr65znqsD58BFDrgQVzvvlxQ5OjiVT8ueeU3omdbczA5yorrbxSIcx
	 4zlwr2gTmOVTrqkjDKsnTNzVvfppgwL3AnSwDlTBDlY5HaaXUSb+B0TL+q6hwDTrE2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=svWO3vDz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3364C606A31E
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 12:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3364C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=svWO3vDz
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e812e2b31bso12572785ad.3
        for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 05:38:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792931927; cv=none;
        d=google.com; s=arc-20260327;
        b=kJRdey5SjhGsD3iMFqZzvtNA3XAoOHNFJAOz50ixyNiMjvusG4IZ7fArmonbLfnPs9
         fQXOimbTzsmYvgPr03huBIZ06XXneutmtQG5c/G59dtbNaFTR9ao96GLjzF40nuWXWX5
         lZjsyjolIGGGDW2Jsh+iZxpxl/rw2eNOKn1ZoGconCR+T/bFo/O16zkbMfCZoJNKCswY
         iiZxaoOs3atCLT49FZ65JoQL8f/EoyicWCT+5JnCDf/hVYvCDquRiduvQS0teRxFNucw
         DUkJWkuRG/tdy/40gL5c+KlN/fSWIaYx2aNA4x8FX02ZCgsTnfHYJSSY1EbCln62jkq6
         jCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ifIa5BWnf8laepgAGnQECywu1F41hu5JMjyB1fMNjtc=;
        fh=BimCxU4R/HNhHImyHpc35zFSjrwIDqaoklDGi2/o0MU=;
        b=b4bo5ev+AfiW71NonWnqu7GyLpWixGb8aAPBb6l98XliTS8Adwd5cMn/TKdOdBrzoa
         l/Z9pLCZc4Zk5P4ojngWoTMrVE3jKGDddvA6ExscyA06VoQzQgQSl3POyjLtU2V6TJRZ
         hA14Hg2G6RmY8b9MM0XIoAhWZiGr4Vpqrr5mKAcpXx4QUU+SItyhxK0iP1tFXJILPfRB
         3npB7L4JfhGliONVLLixKNG1HT4LoA13D8pCjJJDOtvn9GhEOVmxBTqh+8w0LyEoNz15
         WegidCdkvp+UGYwD+saXv/ssqKkb7R5+l1RuzXuSg/XYv0bmx0tXTOU0cDIu3mQ9DPh7
         MXog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792931927; x=1793536727; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ifIa5BWnf8laepgAGnQECywu1F41hu5JMjyB1fMNjtc=;
        b=svWO3vDzPGvygahDm1qFiVCxoY/bJxx+nUH559bIfIv1V0XNlesX6JnYdZ3h57WdXp
         TUIyoOUh6wiHcggucfhE5QF814IUTw70o5IYxx24RYCbdGfUIV9YwRURiG58m1vBd5/v
         esaYTbUdXHYosxIVK0q+bsSB/nxOjkaWrWJkjw7bc9pCEDGXQBj9J65t0pKnEm9yN3g2
         IlrFxq94xOf2ICrgLXnksQXhJAyan2Xq5PRSxe9ODvxQKqD3bZU3LsGJeoQ6Uk0zbFqv
         FAIo5e/4fsKJ1zK5Sr6e2cDfHX15djAHrpjJ8fm+sCTHDgjBZwdfIqcmDnpakjPowaVy
         tFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792931927; x=1793536727;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ifIa5BWnf8laepgAGnQECywu1F41hu5JMjyB1fMNjtc=;
        b=YbXUr4+z5GDCDL8rvHlVEDpNnPGXswAwzB8WfV6e1l+/z2lXcGofigTFWbYfqVAgNK
         Xjwxm7Iaq+MLwP0URsrODNVAqmC+ZIujxYb2oBCwq16m6HPNyDIy3I7qqnS4mMK5IVvP
         VnQ9XfBXVJ+HAXHGx1Tpe9Tq4slaSYoXDBIv7GFSq5FkYFvs8tTRh+TL0zBpZfryW69B
         8sHLJBYLsxMvwNmNxGxNJ3sPu2kQCMxEJjqh6+wfpy+1lfUw01weCK2S/ag+TqzoGEg1
         6oqJpIBrjdVVMDrcXuu7HephJUbkWwcQh//HkDOAVpn2TdB/rBc6bpRlxmvB/Xz2IJCA
         rPzw==
X-Forwarded-Encrypted: i=1; AKwUvBxf9iaiuXwLsHFnJZuDyRR+Wjw2xEtvDOMb57SC9uILZW3D9mkLuwWkodW7T4VVSQkBGhE8hcAh+u45BA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIV/47ouhnvDED+9Z87ASlhV2HyvESlyJlq9WqOiORZNYUhTYCV
	ImmmHyhW7wP2CZ66jTQXy6TwLjv6Not5J+LqPabQd23B0oT6j/3yic43Vn+rvemtgfZE8mvyMAn
	52cYMhH+Ql7h9BAwCYh+ZnGr3PjK4spg=
X-Gm-Gg: AYBFou1rSGRz12tfdXHH+lIN/HIyw4lmLQQIU1rXYMuh1RKuPyZpYTkQkK8qQXZ+/DW
	xXEKlWFiU85DYftjpmzMDv1SqjErUageMbrgDJ6qHjiFuiNoRH1K0DKySpeRhAGB4aZtwu5R/X9
	mjVfkvm2BwW1moCAzpw9KoANXaS/RYM0pXaU+lpvoaazH583X9a5YcpYZxw4F4qxohHDhry/CaI
	JUZbvKY3bBIK2RWHFED7JXIHU7k520mAJioliUXZk3VZCen+2HrbcW/A7CaErzbcRMhMhVX2Jz2
	+8i8LMEy7GK5SERze3DimZXjsVeFpVcjlvpJfoWSrG24I6WSE8AlozaTsYGvD3HjJUMxDi7rtlI
	dndmF+FCQHCYdraJOoox0/crI9IH5YPzayHhkk8I=
X-Received: by 2002:a17:903:1103:b0:2e8:3e5d:b2b7 with SMTP id
 d9443c01a7336-2ea9c8754e2mr34279705ad.40.1792931927515; Sun, 25 Oct 2026
 05:38:47 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Konstantin Nikiforov <helllamer@gmail.com>
Date: Sun, 25 Oct 2026 15:38:36 +0300
X-Gm-Features: AclHuK-zJVIt5pMq4aEG8YbVUe1pdfb3ZT8Uy3v4AWHcgp8mQbjuBakU33gJh-A
Message-ID: <CAO96y0V6oncv54ihXnHfJMYiG_QAQ-NM8BOdqPDXKL8r8-kR9Q@mail.gmail.com>
Subject: [REGRESSION] md/raid5: discards on an array of non-TRIM HDDs now fail
 with BLK_STS_NOTSUPP; bcache counts them as backing-device errors and stops
 the device
To: linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org
Cc: "wale.zhang.ftd@gmail.com" <wale.zhang.ftd@gmail.com>, kent.overstreet@linux.dev, colyli@fygo.io, 
	"song@kernel.org" <song@kernel.org>, yukuai@fygo.io, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

#regzbot introduced: 90573092673c

Hi,

since upgrading from 7.1.8 to 7.2.11 a machine with root on
LVM -> bcache -> md raid5 (three SATA HDDs without TRIM) loses its root
device a few minutes after boot. The same stack ran on 7.1.x without
any bcache backing-device errors.

Storage stack
-------------
  3x ST1000DM010-2EP102 (no TRIM; discard_max_hw_bytes = 0)
   -> md126: raid5, 3 devices, 512K chunk, metadata 1.2
   -> bcache0: md126 as backing device, cache set detached
      (also reproduced while an NVMe cache was attached)
   -> LVM vgpcrd5
   -> btrfs (/usr, /var, /opt; mounted without any discard option)
      + ext4 (/, /home)

Kernel: 7.2.11-arch1-1 (Arch Linux), mdadm 4.6, bcache-tools 1.1

Symptoms
--------
Every boot, starting ~3 minutes after mount, dmesg fills with:

  bcache: bch_count_backing_io_errors() md126: IO error on backing
device, unrecoverable

in bursts of up to ~35 lines 2 ms apart. Per boot I counted 11, 17, 22
and 63 of them. bcache's io_error_limit is 64, so once a boot crosses it
bch_cached_dev_error() stops bcache0 and root, /usr, /var and /home
disappear. No I/O errors are logged by libata, sd or md; all three
members are healthy (SMART clean, array [UUU], no rebuild).

Analysis
--------
Since 90573092673c ("md/raid5: validate discard support at request
time", v7.2-rc1) raid5_set_limits() unconditionally sets

  lim.max_hw_discard_sectors = UINT_MAX;

and records member support in conf->raid5_discard_unsupported. On this
array sysfs now shows:

  /sys/block/md126/queue/discard_max_hw_bytes: 2199023255040
  /sys/block/md126/queue/discard_max_bytes:    2199023255040
  /sys/block/md126/queue/discard_granularity:  0
  /sys/block/sd[abc]/queue/discard_max_hw_bytes: 0
  (md127, a raid1 on the same disks, still shows 0 for all of these)

Two upper layers react to the advertised discard support:

1. btrfs enables discard=async by default because the device advertises
   discard (mount shows "ssd,discard=async" although nothing in fstab
   asks for it).

2. bcache forwards discards to the backing device whenever
   bdev_max_discard_sectors(dc->bdev) is non-zero (cached_dev_write()
   and detached_dev_do_request()). Before 7.2 that was 0 for this array
   and bcache completed the discards itself.

raid5_discard_limits() then completes every such bio with
BLK_STS_NOTSUPP. bcache's backing_request_endio() treats any non-zero
bi_status as a media error and calls bch_count_backing_io_errors(), so
each discard brings the backing device one step closer to being stopped.
With 64 small deletions on the btrfs volume a root filesystem on
raid5+bcache is gone.

The granularity is also inconsistent: discard_granularity is 0 while
discard_max_hw_bytes is non-zero, so writing any non-zero value to
discard_max_bytes fails with EINVAL (only 0 is accepted).

Related changes I found:
- efdffeb6d491 ("md: skip discard on unsupported member devices", 7.3)
  fixes the same bcache symptom for raid0/raid10 via
  md_submit_discard_bio(), but raid5 does not use that helper and still
  returns BLK_STS_NOTSUPP in current mainline (raid5_discard_limits()).
- 85764f475f3b ("md/raid5: complete discard bios while reshape is
  active") addresses a different fallout of the same commit (hang during
  reshape).

I have not found a report for this raid5 + bcache case on lore.

Possible fixes (either side would do):
- md/raid5: when conf->raid5_discard_unsupported is set, complete the
  bio successfully (discard is advisory) instead of BLK_STS_NOTSUPP, or
  do not advertise max_hw_discard_sectors in that case, as before 7.2.
- bcache: do not count BLK_STS_NOTSUPP (or failed REQ_OP_DISCARD) in
  bch_count_backing_io_errors(), the same way REQ_RAHEAD failures are
  already ignored.

Workaround in use
-----------------
A udev rule writing 0 to /sys/block/md126/queue/discard_max_bytes and
/sys/block/bcache0/queue/discard_max_bytes (also inside the initramfs),
plus "nodiscard" on the btrfs mounts. With that, io_errors stays at 0.

I can test patches on this machine.

Regards,
Konstantin Nikiforov
Claude Fable 5.1
