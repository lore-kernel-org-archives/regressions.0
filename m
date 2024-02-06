Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4333512B177
	for <regressions@lists.linux.dev>; Tue,  6 Feb 2024 09:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707210691; cv=none; b=r1wftvLzOSxwCQNGdQYRrmCb8rvi2DG/X5YbAq1A5NZg7S0ZcN3rwqgb0Ikw+bFQxOJ7J//UEe5ze1cr/ttcMw10IzE7VxIb2kZGLFg4gm2PGbIPLT84uxUck9N5APrziZHZ58CJvKoFZRDJxNu9JsO6Gys7LY7CJTv/P+Gffg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707210691; c=relaxed/simple;
	bh=rfF/2hEZvke0SrtkyH4eMd943eOFLhj786txrpm8IRc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tTKTvBRiBVZ6pFCE+t2qENUZojH7pyS8O5tXIPiS1irkNF7hpY1MDfOfhHOUau1czHg5RVhnOFvm7WYrzmtuoaeS/fTz50iDdzH9qFxGR+6Ja8gXeXmYLH5ADOKDrjNtqwEgOZXbl6bR/tO5bj7/s1LTJ0NEmRhwrbdDCyPEJHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zc5/Ul4P; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zc5/Ul4P"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4c01ac04569so1190384e0c.1
        for <regressions@lists.linux.dev>; Tue, 06 Feb 2024 01:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707210689; x=1707815489; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dt8kqDOU/E24oKSolewG5gpnabtVYYG3lPQtya8JjLk=;
        b=Zc5/Ul4P5BWnteJ6L2bnVgbdmUB3A7hNCsL4Mk6PRu7QZpFtrO3IC8kZimIQxgLFvk
         HpMNq40kmCpyOrk3VmXELG7UK0K6UdrtsxUQ2eIVGBm2ayCotjgsYCBaa99XUMj0IVfd
         Ul9j+jj/UGJkcYNZwoNdB6l57pEy7uUdUrV0NoU6C5vEB4EwBb/Xwr96sCwCBYPZs/7k
         vlw/izEHIIYY7cFFAbHilpkFJLHfyNWtGcy8vi4SvTSLJwuzGoyOAArYgx9PUYpbElEk
         a5V/rVeHvQweudxBf2psSKjpaL9CgSBwDKOwPp9rTzdYOE8z0uxPSrggwOy4zP260Qlh
         1QIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707210689; x=1707815489;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dt8kqDOU/E24oKSolewG5gpnabtVYYG3lPQtya8JjLk=;
        b=DhDVGzFS82+e6no4y/w0BmUge08NZB8ZN6atRDr8MjEZ+BzbG/gU18V+Yy5XMPdzVJ
         UeI2hkXF2EJ5dDZFcz1F6ubp6auHz8VdQO+xrW8dja81MAUZt0W0dI81m+mJtP1JQqvF
         t4YdEr1sy3Y8zuDfkOZmXjKdjsbWdnwNfRE7hniwicKbhlwQXKw5I54uBDik/Vwc5Z2r
         o5J65Ry8tAMszTRHBUMnKH/2AQoIOYwVhz7DvCo2ZZBfPSJuaRLLoJFF9ufXbrAKYRAm
         QKw2DvmiAJ2osCyca9/LKNdYKugMbidGKsQHwfs9fIFGJ7GR2oBF0ixUsyEQ1KOJAyfS
         ZsUw==
X-Gm-Message-State: AOJu0Yw9jx3jQR3m8JNMlCtiBO7fYV4LtdcZza6P/2lDAijfufjI6sU2
	DpW0Mm8bQtzfTppFgTKZWwXtjXNNvBnpoCJ2AMBhTtmVYrZGEDspdVHtESuDx2HaDnIlabZRNM+
	wMlemUx5es8agsFeF7BuzsJZT3bf2NiOUyFv6RA==
X-Google-Smtp-Source: AGHT+IF6WWYrlBchEW0hvYZVNUtoLNY60FaTDcfmV9bCAdemD+s2jyOnG/4mz1rNqY28ZHvSjRzTK9XeDR3BEloMUHA=
X-Received: by 2002:ac5:c64f:0:b0:4c0:1a5c:9185 with SMTP id
 j15-20020ac5c64f000000b004c01a5c9185mr1828685vkl.4.1707210689106; Tue, 06 Feb
 2024 01:11:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 6 Feb 2024 14:41:17 +0530
Message-ID: <CA+G9fYttTwsbFuVq10igbSvP5xC6bf_XijM=mpUqrJV=uvUirQ@mail.gmail.com>
Subject: next: /dev/root: Can't open blockdev
To: linux-block <linux-block@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, linux-fsdevel@vger.kernel.org, 
	lkft-triage@lists.linaro.org
Cc: Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"

All qemu's mount rootfs failed on Linux next-20230206 tag due to the following
kernel crash.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Crash log:
---------
<3>[    3.257960] /dev/root: Can't open blockdev
<4>[    3.258940] VFS: Cannot open root device "/dev/sda" or
unknown-block(8,0): error -16
<4>[    3.259704] Please append a correct "root=" boot option; here
are the available partitions:
<4>[    3.261088] 0800         2500336 sda
<4>[    3.261186]  driver: sd
<4>[    3.262260] 0b00         1048575 sr0
<4>[    3.262409]  driver: sr
<3>[    3.263022] List of all bdev filesystems:
<3>[    3.263553]  ext3
<3>[    3.263708]  ext2
<3>[    3.263994]  ext4
<3>[    3.264160]  vfat
<3>[    3.264419]  msdos
<3>[    3.264589]  iso9660
<3>[    3.264773]
<0>[    3.265665] Kernel panic - not syncing: VFS: Unable to mount
root fs on unknown-block(8,0)
<4>[    3.266991] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
6.8.0-rc3-next-20240206 #1
<4>[    3.267593] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
BIOS 1.16.3-debian-1.16.3-2 04/01/2014
<4>[    3.268937] Call Trace:
<4>[    3.269316]  <TASK>
<4>[    3.270113]  dump_stack_lvl+0x71/0xb0
<4>[    3.271837]  dump_stack+0x14/0x20
<4>[    3.272128]  panic+0x12f/0x2f0
<4>[    3.272812]  ? _printk+0x5d/0x80
<4>[    3.273097]  mount_root_generic+0x26e/0x2b0
<4>[    3.273941]  mount_block_root+0x3f/0x50
<4>[    3.274212]  mount_root+0x60/0x80
<4>[    3.274610]  prepare_namespace+0x7a/0xb0
<4>[    3.276008]  kernel_init_freeable+0x137/0x180
<4>[    3.276285]  ? __pfx_kernel_init+0x10/0x10
<4>[    3.276563]  kernel_init+0x1e/0x1a0
<4>[    3.276837]  ret_from_fork+0x45/0x50
<4>[    3.277319]  ? __pfx_kernel_init+0x10/0x10
<4>[    3.278176]  ret_from_fork_asm+0x1a/0x30
<4>[    3.278560]  </TASK>
<0>[    3.280750] Kernel Offset: 0x1a800000 from 0xffffffff81000000
(relocation range: 0xffffffff80000000-0xffffffffbfffffff)
<0>[    3.281985] ---[ end Kernel panic - not syncing: VFS: Unable to
mount root fs on unknown-block(8,0) ]---


Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240206/testrun/22547673/suite/log-parser-test/test/check-kernel-panic/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240206/testrun/22547673/suite/log-parser-test/tests/

--
Linaro LKFT
https://lkft.linaro.org
