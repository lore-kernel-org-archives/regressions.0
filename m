Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2E51940AA
	for <regressions@lists.linux.dev>; Wed,  2 Oct 2024 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727867451; cv=none; b=NIV3OoNA8maCLCfh1q3/JhTK5sLCyEyt3STrp9fEdio4c34xh3a4vGdqiElDUezfvGWh1EpDIBMUWz7FdG3387Y4WjdMGA1+wXw32tUvzPusajZxDICN2dgjDoHTaC6knJ4oITq/Qw5vTzxi9ICZFXO1km+OPOSh25OLdnBlSv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727867451; c=relaxed/simple;
	bh=Xa+lW0fjqVmBEgZJFM3xdIUf1yL8qSpAWWexKBzHebE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MuSecxfVeS5frni5dqVsx4eRhiO++Huvkok21pcFPgkODK+fRn+CUd6hReO5DWbNli5IvxlyyAkC74N/H2gOhgtCB0tACqbzyCHtPsjLuiQzljiPyiNP/En6SbDMFBC8J7lp9cBhGajTizxTmPhVOS49mInAgmMDYE6K4tX9iFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kL3bisrZ; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kL3bisrZ"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4a3c6bc4cecso970230137.0
        for <regressions@lists.linux.dev>; Wed, 02 Oct 2024 04:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727867448; x=1728472248; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2kGi5asJjvPPSghlJTF20OUed1yXJQ8MjIuBXcPNa8c=;
        b=kL3bisrZqScFdSEPwO7BAedvwxBlu7vPVFyOCDEgn7kvCI60oMR8c7GjINOgIQIQbh
         8QSs/BINWnY2jp1W1mWaEd6vMwZx+BcMO5CVxpTM4DtS1p3gh8avbFm4uqs6z+1zueHT
         CgMhXAn+0xcT1duHXjbILtf6ItrBhnWjimCrSPi4CU54GOoobgf1zOwNvLCYiyrYzHbq
         23UE/nudpiGvR1NNBngc3bWHfliOJhKKTj23JCPKCiLtAN4oJaOsgIqQUTdlYE0LGmsm
         1rErUrcLA4Jny9L/5ft7x7hwKsihez0E/meiwHu9oGfbZGw1Nc3xQpZ54dh2FvKvVxng
         Kkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727867448; x=1728472248;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2kGi5asJjvPPSghlJTF20OUed1yXJQ8MjIuBXcPNa8c=;
        b=tqJoLrQR95HKhYJz3pTzs8is6Jk3ROr+m1UsAYuAX/PrxymU/T15RcIMGVrrtghLw3
         cyF2gNXR66c8vqS7zhX1vJRnqMlspBfLCYypsNgcnprwcoaQUMsCSwSj1mTg1THDPDH9
         gdUGLqD43qPFIVmpPaM9uxD15IfbW37uFF6tHKwdqSZigvc/oh5bCBkzZpEWM50yMXZe
         VeY+SGp6RCFSdOiNBYy/n1umi7mHWGmQ8sFBMmqIitfMEBmqxvq1ctuV0kE7xmzqwQMu
         +LK74QihXtqa/2dXY1iu/nU02YgPgUKl+BAT3RMHHg5ENRX46VTQ0dn5cB6pzDlH4ckH
         bfLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiyZ9odGPsV+pEGNkU4H36XFg2w8RwO8JTPfInYazltR9EbIGljAg4J3yUAk/Bz7IOX9DJCu0IJc6iPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz26VJrGOvm35PxpIBrHCLiDQxrPccG/+Od+HoyXcRezzT421WH
	YVst9EuI3+IYAhoLvllGew6zlb1TZcGLgMc/W8Rd4ww3AcY6swplPPZLNcy1AvegsDBXueRP/Fj
	lNPzDl+vpb3gHVU7EdsFWqA31CWlt4Ra86Myarff6dxjZGqEBNBs=
X-Google-Smtp-Source: AGHT+IFiKKSaJD7S31bQvy9uMtiLZrCFDEgo+HN4D40OjnWSzEx7to/xFzO7TFWzKf+00X0VN8/NZaGH3WXPbVzxdBQ=
X-Received: by 2002:a05:6102:370d:b0:4a3:a137:b9b with SMTP id
 ada2fe7eead31-4a3e68519b1mr1659730137.11.1727867448216; Wed, 02 Oct 2024
 04:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Oct 2024 16:40:36 +0530
Message-ID: <CA+G9fYvo5npQ3o_vgiOX2guHtgafRoFPL__4O8Kcwg2=ssXmKg@mail.gmail.com>
Subject: next-20241001: WARNING: at mm/list_lru.c:77 list_lru_del
 (mm/list_lru.c:212 mm/list_lru.c:200)
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-mm <linux-mm@kvack.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following kernel warnings have been occurring on arm64 DUT and qemu-arm64
running Linux next-20240930, next-20241001 and next-20241002 while
booting the kernel.

This is an intermittent warning noticed on arm64
 - Juno-r2
 - Dragonboard-410c
 - Qemu-arm64

First seen on next-20240930

  Good: next-20240927
  BAD:  next-20240930..next-20241002

Since this is an intermittent problem hard to bisect.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Warning log:
----------
<4>[   26.293906] ------------[ cut here ]------------
<4>[ 26.295948] WARNING: CPU: 1 PID: 1 at mm/list_lru.c:77
list_lru_del (mm/list_lru.c:212 mm/list_lru.c:200)
<4>[   26.299608] Modules linked in: fuse drm backlight ip_tables x_tables
<4>[   26.308212] CPU: 1 UID: 0 PID: 1 Comm: systemd Not tainted
6.12.0-rc1-next-20241001 #1
<4>[   26.310552] Hardware name: linux,dummy-virt (DT)
<4>[   26.313304] pstate: 23400009 (nzCv daif +PAN -UAO +TCO +DIT
-SSBS BTYPE=--)
<4>[ 26.315519] pc : list_lru_del (mm/list_lru.c:212 mm/list_lru.c:200)
<4>[ 26.316457] lr : list_lru_del (mm/list_lru.c:76 mm/list_lru.c:200)
<4>[   26.317603] sp : ffff80008002b950
<4>[   26.319015] x29: ffff80008002b950 x28: fff00000c0540240 x27:
0000000000000000
<4>[   26.321155] x26: fff00000c2dce690 x25: 8000000000000000 x24:
0000000000000000
<4>[   26.322653] x23: fff00000c0c4e900 x22: fff00000c12f4478 x21:
fff00000c12f4458
<4>[   26.324697] x20: fff00000c1b14800 x19: fff00000c0542088 x18:
0000000000000000
<4>[   26.326121] x17: 0000000000000000 x16: 0000000000000000 x15:
0000000000000000
<4>[   26.327590] x14: 0000000000000000 x13: fff00000c146b940 x12:
0000000000000005
<4>[   26.329087] x11: 0000000000000000 x10: 0000000000000402 x9 :
0000000000000003
<4>[   26.330650] x8 : ffffffffffffffff x7 : 0000000023d53570 x6 :
0000000023d53570
<4>[   26.332484] x5 : 00000000000f000c x4 : ffffc1ffc3032e20 x3 :
fff00000c2f70800
<4>[   26.334759] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
0000000000000001
<4>[   26.338095] Call trace:
<4>[ 26.339907] list_lru_del (mm/list_lru.c:212 mm/list_lru.c:200)
<4>[ 26.340990] list_lru_del_obj (mm/list_lru.c:221)
<4>[ 26.341972] d_lru_del (fs/dcache.c:463)
<4>[ 26.342794] to_shrink_list (fs/dcache.c:477 fs/dcache.c:887)
<4>[ 26.343615] select_collect (fs/dcache.c:0)
<4>[ 26.344524] d_walk (fs/dcache.c:1278)
<4>[ 26.345384] shrink_dcache_parent (include/linux/list.h:373 fs/dcache.c:1511)
<4>[ 26.346512] d_invalidate (fs/dcache.c:1617)
<4>[ 26.347451] proc_invalidate_siblings_dcache (fs/proc/inode.c:143)
<4>[ 26.348744] proc_flush_pid (fs/proc/base.c:3480)
<4>[ 26.349747] release_task (kernel/exit.c:281)
<4>[ 26.350810] wait_consider_task (kernel/exit.c:1253 kernel/exit.c:1477)
<4>[ 26.352093] __do_wait (kernel/exit.c:1617 kernel/exit.c:1651)
<4>[ 26.353151] do_wait (kernel/exit.c:1693)
<4>[ 26.353958] __arm64_sys_waitid (kernel/exit.c:1775
kernel/exit.c:1788 kernel/exit.c:1783 kernel/exit.c:1783)
<4>[ 26.359772] invoke_syscall (arch/arm64/kernel/syscall.c:50)
<4>[ 26.360706] el0_svc_common (include/linux/thread_info.h:127
arch/arm64/kernel/syscall.c:140)
<4>[ 26.361477] do_el0_svc (arch/arm64/kernel/syscall.c:152)
<4>[ 26.362218] el0_svc (arch/arm64/kernel/entry-common.c:165
arch/arm64/kernel/entry-common.c:178
arch/arm64/kernel/entry-common.c:713)
<4>[ 26.363014] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:765)
<4>[ 26.364138] el0t_64_sync (arch/arm64/kernel/entry.S:598)
<4>[   26.365321] ---[ end trace 0000000000000000 ]---

boot Log links,
--------
  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241001/testrun/25235075/suite/log-parser-boot/test/check-kernel-exception-warning-cpu-pid-at-mmlist_lruc-list_lru_del/log
  - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2mp2m5m4PnjJgdix32h7pIGe63Y/logs?format=html

Test results history:
----------
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241002/testrun/25242215/suite/log-parser-boot/test/check-kernel-exception-warning-cpu-pid-at-mmlist_lruc-list_lru_del/history/

metadata:
----
  git describe: next-20241001
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git sha: 77df9e4bb2224d8ffbddec04c333a9d7965dad6c
  kernel config:
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2mp2jhmSKhlF6c0x1SBsJFyBbTq/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2mp2jhmSKhlF6c0x1SBsJFyBbTq/
  toolchain: clang-19 and gcc-13

Steps to reproduce:
---------
- https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2mp2m5m4PnjJgdix32h7pIGe63Y/reproducer
- https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2mp2m5m4PnjJgdix32h7pIGe63Y/tux_plan

--
Linaro LKFT
https://lkft.linaro.org
