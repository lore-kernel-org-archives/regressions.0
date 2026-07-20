Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC373839A3
	for <regressions@lists.linux.dev>; Mon, 20 Jul 2026 16:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563250; cv=pass; b=lYEslLscH8P0HFsEwetzDMXkN9nTEnpd5TdvoyeB1L/7imfqSaspWn9rUWSf9BqtKxTq/BqrpYDrYaw4wuYQjtGcKkyn8uIUWw9Hn0qKtVM7niAt/Q84SrlCNaKbuFA5LbkAPbyteqnC24l2NAFuiqDztAM0fuuLnCBXIHSP1hU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563250; c=relaxed/simple;
	bh=5Xbtz/Av6bHkE96U4IBoQl5A9uLRqp5aeHgjDtdNOrA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=lMnPngxlhX7hkgG2wHUgiyUJBfnSkTtywtLWIfCFcPrgZhKbhMP+LDp8toBGrgQrIDKYQLpT6B/37VEQiu7Xcw7dGJOFRn06Kzxjmrws1kgEs2QzHpltdZDj9LwdHcgFUjBI86Ma0Q64tfF01RcD/KShV8eXeBmkAXcP8jk+5fM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhODThQI; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhODThQI"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b015532f7bso10153227e87.0
        for <regressions@lists.linux.dev>; Mon, 20 Jul 2026 09:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784563247; cv=none;
        d=google.com; s=arc-20260327;
        b=rSGeULD4cLEWYmLO33epFS6hz1peC15vsSpglgPk695uzg8IMrpNS79UkqDm0etgH+
         iNx8ncdSFHUQH/919n3mz5NeJAPNc04LYH6v7Upj5zIRRlgbKA1yBB/Lfu1qLgN2C03A
         DLd49Rvj+gaxsVJ17+88bTl5orks8PU3zkWO9buiDQcbpQCpiPN1PFtYOXYnIHEUP1xX
         7aAkHL3rhgMLgSxv9rDYql2BukxFzHhECtJPDdAYopn1liLTfox15NRPjox7fjTX7dZ4
         G1nBnT05vu6bgIM7k6f02EGLAl1eKUpvgR1VUa1lbvkhitOd5OZgeqWK+dTd6AzDQog7
         5VKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=gOqp80OGxHNHpl1a0k006+fhM1SsculZu3NHpvxX72g=;
        fh=mJShpKv2BoQvNv1YUtfGNvtHccVju8nvtS1Ulme3PqA=;
        b=VLnwF7DAkoA3BdUniv7b9vO0x/1CPqh1oFRmK7yoZhaq/RanteNLUgm6gMSCzwW3qT
         waxlmHRcRMno27QacvIz6ttrle2ry1gqb099pfFco7tbGq91u8m4MmsAI5YUrwWzsJVU
         jxcbqn/ngC3YLgIlcWeM6tIVvTLaBFoUba4XNC+FV7T9oSHkxtszsAu2gRqjnnwe15zr
         IDWf2rTqiyte5p8izF8SUwa15JmF0HS7p9uk0RaxO2PK2NUMA3VNtFZf0uklesIDmEjS
         yyyGG6KkvinjdNZpAeW7L8oWty/kX2NBLa1rH6E5TAcSRAV5kGJqCXbX5ACgfxyMU0TS
         JQMQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563247; x=1785168047; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gOqp80OGxHNHpl1a0k006+fhM1SsculZu3NHpvxX72g=;
        b=hhODThQIJpQyOOBWXES2jAluTmdX2Wl8Gm5Sg9VgksEGBNbeFNAOucv6ABuoERlcE0
         mDSpRAXZJwn76/0RedHT77aWLE0jzaS9rv3HoRvGyHqT9gS2bSFh9aQzICLeNUoBk5vN
         78l/um7/g4947WWlO+MGhVnazFr4zbooRCT7HSEFX5fgGQQ5bG374wTI7Sz+4G8Qtivp
         fKBC85LZIC1rmtd9DTEijzZ5xpiaQfWnD6+ELAcWi0pVdlRVR8ItUnxSE+t1fRAMxHvz
         dTqHSboARmCZKnPXkQP+itV2EA8JaPGeYCvlL2cocjJPCGbavL5F25MO6NLIU5YLvmtO
         OYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563247; x=1785168047;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gOqp80OGxHNHpl1a0k006+fhM1SsculZu3NHpvxX72g=;
        b=koCeY+c2rr8yfYVm/Qje9bPgY1Oo+S0YLmNqB2CirC/KRDWqJMks4QVtOAtMq1cxbG
         01cuqIm0pXEblRi5QCJmOd6uuDGg6L69tc8oEglO9rZuDAafAY8pQwb10TcdHBd8wZ4A
         WU5pH3j3M2oXIZpxAK5XpT6lHSlNzrLCPVEdmpab3cfBeIiGYamUu8j46FR2v7LPN50f
         C4myc+X+uFB3gYeSSCtWyusmDhzeIxQBUv63w+dFsHWazx9Fc5QiWXNmSx+E9dwjADMv
         cYVLliJNnQWvxt05fpOLv9LMAmaRzeydK1O0G4mtIbH0VB23eYDQC63AQrKWw9eIZCkM
         EEdg==
X-Forwarded-Encrypted: i=1; AHgh+RpaPTFZP2wLXIOw+T1NqINXyGtyuRDVnKaMeHX8O3lBHfI3KaMwolS5ljwONxELGHTqj9jlkmqzO2WZJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYfYc3z2U8eDYcFmDxYOdNTVEluKqWZ3enhZeAvHs4N38Wk/W1
	dK8K2KH8pPLnUmfjsd/XvNYQ3i0cIWEFtol3WfVT0kPZapQFSOx0RgKBUXPgkgDt1GG2yfb88yc
	WsAFjqfOqnUQfcZDA9KuM+7NsG73YqxtJtHYRt2VnXg==
X-Gm-Gg: AfdE7cl7VhXoQRQsz8bWdc1bv1CfsapO+cNhD1VzYFaad0H1Jr/TcJgmY62UhDwf/nt
	cNejkw1WLRdbAZLlH4FwIhUJ1S/35V6ThiLX9/69GsrbjBhr76M6AcoDWq5ycDp4KpOtn0hoEc+
	UcTyM+IIycfA6rc97Z149vlR4pHYSYD2xKHHtu8/nmeo/5CYynqJlkpacrydk7CQHnuqigTtxL0
	D70xz359jgxbVttmEzGJYvFPJ1sASCGMc5Rl8Q45ZJ2FPDhPkbrh4ISAPWI
X-Received: by 2002:a05:6512:3e09:b0:5b0:2176:69f6 with SMTP id
 2adb3069b0e04-5b28f9a4a5cmr3279364e87.37.1784563246327; Mon, 20 Jul 2026
 09:00:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Tue, 21 Jul 2026 00:00:32 +0800
X-Gm-Features: AUfX_mw7s-B5RFQiepxXY56GnETnBGDLw1NkaBnVDrpf0kTbCGVvQQn3VTL6hdE
Message-ID: <CANGjgd=RwMy=29OYG14b6kkoF1uBHz67jTGge5Nubb-XemMvBg@mail.gmail.com>
Subject: [REGRESSION] fsnotify: concurrent inotify watch add/remove slows
 after 94bd01253c3d
To: Jan Kara <jack@suse.cz>
Cc: Amir Goldstein <amir73il@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Jan, Amir, and Christian,

I found a repeatable slowdown in a concurrent inotify workload. An exact
bare-metal comparison points to:

  94bd01253c3d ("fsnotify: Track inode connectors for a superblock")

#regzbot introduced: 94bd01253c3d
#regzbot title: fsnotify concurrent inotify watch add/remove slowdown

This is a focused synthetic microbenchmark, not an application benchmark. It
uses tmpfs, 96 separate inotify instances, and 96 files with different inodes.
Eight threads, each pinned to a different P-core, concurrently add one watch
for each instance/inode pair and then remove it.

The matched control uses the same instances and pathnames, but all pathnames
are hard links to one inode. A keeper watch keeps that inode's connector alive
during timing. The control therefore measures watch add/remove without
connector creation and destruction.

I used a fresh boot for each point:

  6c790212c588 parent A -> 94bd01253c3d child -> 6c790212c588 parent B

Each point had 2 warm-up rounds and 25 measured rounds. The kernels used the
same normalized config, compiler, Kbuild metadata, module-signing key,
preemption mode, and equal-length release strings.

The machine was an Intel Core i7-12700KF system with 32 GiB RAM. The workers
used CPUs 0,2,4,6,8,10,12,14. The CPU governor and EPP were set to performance,
Turbo was disabled, and the runtime setting was preempt=none.

The primary medians were (lower is better):

  metric                         parent A      child   parent B
  P8 distinct, aggregate worker ns/watch
                                  4182.614   4920.865   4274.895
  P8 distinct/shared ratio       0.248777   0.292725   0.240657

P8 means eight workers. The first metric sums the time spent by all workers
adding and removing watches, then divides by 96; it is not wall-clock time.
The ratio compares each distinct-inode round with its matched shared-inode
control round.

Relative to parent A and parent B, the child was slower by 17.65% and 15.11%
for the distinct-inode metric, and by 17.67% and 21.64% for the ratio. Parent
drift was 2.18% and 3.32%, respectively. All correctness and affinity checks
passed. Updating an existing watch mask and pathname lookup both changed by
less than 0.3%; the shared-inode control was slightly faster in the child.

A second parent-child-parent sequence checked worker-count scaling. At P6,
the distinct-inode metric increased by 9.03% and 9.56%, and the ratio by
10.75% and 10.85%. At P8, the distinct-inode increases were 19.58% and
19.11%, and the ratio increases were 17.62% and 16.80%. Exact P1 and P4 tests
stayed below the pre-registered 5% threshold. A 16-worker SMT run changed in
the same direction, but missed the variability gate and is not part of the
main result.

I also tested two diagnostic variants at the child commit in this order:

  full -> lock-only -> full -> nolist -> full

Full is the unmodified child. The reductions below are averages relative to
the full builds immediately before and after each probe:

  build       list updates   list_lock   P8 distinct reduction   ratio reduction
  full        kept           kept        baseline                baseline
  lock-only   removed        kept        14.27%                  12.70%
  nolist      removed        removed     21.43%                  20.46%

The lock-only result shows a cost from the list updates or the extra time they
hold the lock. Removing the lock recovered about 7 percentage points more.
This suggests that lock acquisition and handoff also contribute. These builds
are diagnostic probes, not proposed fixes.

Before sending this report, I checked v7.1.4, v7.2-rc4, Linus' master at
1590cf032971, next-20260717, and the linux-fs fsnotify, for_next, and for_linus
branches. Connector creation and detach still use the list_lock and
list_add()/list_del() operations introduced by 94bd. I found no equivalent fix
or matching report in the official linux-fsdevel and regressions archives
through July 20. The exact timing claim above remains limited to the direct
parent/child comparison.

As a topology check, I traced eight unmodified Ubuntu inotifywait processes,
each watching a different subtree of a Linux 7.1.3 source tree on one ext4
filesystem. They created 4,177 directory watches. For each process, the counts
of fsnotify_add_mark_locked(), inode-connector allocations, and
fsnotify_detach_connector_from_object() matched its watch count. Watch-add
events from all eight processes appeared in the same 1 ms interval. I started
them together on purpose, so this trace shows that normal software can create
the tested topology; it does not measure application performance or how often
this concurrency occurs in normal use.

I understand that a05fc7edd988 ("fsnotify: Use connector list for destroying
inode marks") uses this list to avoid scanning all inodes during unmount. I am
therefore not asking to revert 94bd.

Is the extra watch add/remove cost an expected trade-off? If not, would it be
useful to develop an optimization that preserves the connector list and the
current unmount behavior?

Evidence bundle:

  https://github.com/lcf0399/linux-regression-evidence/tree/245fec71aa05eb2dbd68f11e4c98729f22bbc541/fsnotify-concurrent-inotify-watch-setup

Standalone reproducer:

  https://github.com/lcf0399/linux-regression-evidence/tree/245fec71aa05eb2dbd68f11e4c98729f22bbc541/fsnotify-concurrent-inotify-watch-setup/reproducer

Thanks,
Chengfeng
