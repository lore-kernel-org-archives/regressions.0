Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A8A1946F
	for <regressions@lists.linux.dev>; Thu, 20 Jun 2024 06:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718864402; cv=none; b=r6D4uZ16bd9XVNy1gQ2KqwgoXwsU+GVavXPVgk6xdurhA+rlujgW0AY/WGiMzm1b3z5AR7ekMq8QPYVYDfoCEXsiSxbBUsmokAJjp8Gg9GlNCPMfDWHh7m70SUInetKncalnUv0Z/lDYFstKMUgtSOtRsCtpYoqNNh3wBQg66rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718864402; c=relaxed/simple;
	bh=peldQDD8fX0rCddVnPKm00DWDkiNS7jGfd0xai7xvfI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=pt7Keyz9vUVkWLH40nhSjZYp5RyY/TjxzBjVEp1wVxZtegcgFdgFlqtSu41H9GJdre5mnLRfIHJSGrLi33A64yRpQ8kYyq26bJkeH55ZiHeL9xn5zqr4kllaXLu4dhqGbjQPW9nc0P/nBGTpYu7JeJzU9R5+hiXGvIl8l2bjA1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=JW416Qv1; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="JW416Qv1"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7eba486df76so17071439f.0
        for <regressions@lists.linux.dev>; Wed, 19 Jun 2024 23:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1718864399; x=1719469199; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnkvD4cfQUmf2KA0m74cKP53JC7ZJecS/w08f8Y1czY=;
        b=JW416Qv1CfLC/evm/IO6I5vaW7rIaFgpQmBlCbDOczhXaHn08PNhSuSmLFmjl8Y78D
         DlArI0Ok/umzUo1KR95u/Ax/2/Wfr9t3ynr4/fk15cj6sv+cEANFf8aGZpuuqjK4c0pL
         ZJwCOjuVxLrP/loM2Rie0FzQ2QZGTfhz9oOckkJSqoUuxwHtLjbhTQZqUKSPRcIjTIRF
         7ULx62ZMSqpBq7CrSqz3hsDEf0BLTMmgnts2vl1cAy65lCOioAPdXiqdOwyALoIipLbK
         yO1UIwqR+mlVwc9xCJgb1J8bzkX3Zwjw18bhUa8rFbH4pLjgZqqYamB89CISR4aOHmmX
         OzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718864399; x=1719469199;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fnkvD4cfQUmf2KA0m74cKP53JC7ZJecS/w08f8Y1czY=;
        b=cwpEPQvCCZyOStzywj9urWE1xuhN2QbPtk+Yej2rrXmKi04UQkqPblG7Tx6jro+O6F
         3NwoMMhME7XDplXP9mveFwpCDWkp6s2HNq1uHaCLT7sOHObDdcSXF58ZCriOhqg6Xe42
         8hbhpuzrEitcjZ+rxFX63OpCO6i/JbhymWJa1ge1u/3QWEmqGuGQo3md6aN6ha6rcxFV
         bZWzjRXscB/ASKw4fcUGODxQuBCC/ImwWndvCf2FnFj40h10Cw8Zio1tgrjmEqvyKzom
         B7corEZaGXsuLKYVSOwOgrVTGcM5f6xGPyCmgsjebDW5/vcKOLNjCjyIygd9seE6r4xS
         vsoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUQBfRyAM/FNvTSs/GOm2IVHWXniuo6IWmZblw4ZEa32yHoHbBrNss1hW3QbQhlhG/q5QvBzD8oPj4lFkwEi8mkIX90fLrUdEB7rE=
X-Gm-Message-State: AOJu0YyEDfPDO+g2nqbZB9qHWclczwjAuSAuEi8NqwBW7ejuH2wEAmM9
	V0mJju1pbDcsg9OW0v+ArnuQIaRvDo9V3NfaJqYlIUF7E6beuJAZB+dwzY8X0W8=
X-Google-Smtp-Source: AGHT+IEweE+BqUFhGY/6fudIXEF+fvD2H/USf2krBJgYZqMQDIJsLzTlr6q3dcUXoEbGkMG6ZYHORg==
X-Received: by 2002:a05:6602:2dc3:b0:7eb:65ed:c1f2 with SMTP id ca18e2360f4ac-7f13eb9aa1fmr298219339f.0.1718864399534;
        Wed, 19 Jun 2024 23:19:59 -0700 (PDT)
Received: from [192.168.0.50] (dhcp-24-53-241-2.cable.user.start.ca. [24.53.241.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-7f370965fecsm64369939f.34.2024.06.19.23.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 23:19:59 -0700 (PDT)
Message-ID: <75e17b57-1178-4288-b792-4ae68b19915e@draconx.ca>
Date: Thu, 20 Jun 2024 02:19:57 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
From: Nick Bowler <nbowler@draconx.ca>
Subject: PROBLEM: kernel crashes when running xfsdump since ~6.4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

After upgrading my sparc to 6.9.5 I noticed that attempting to run
xfsdump instantly (within a couple seconds) and reliably crashes the
kernel.  The same problem is also observed on 6.10-rc4.

This is a regression introduced around 6.4 timeframe.  6.3 appears
to work fine and xfsdump goes about its business dumping stuff.

Bisection implicates the following:

  062eacf57ad91b5c272f89dc964fd6dd9715ea7d is the first bad commit
  commit 062eacf57ad91b5c272f89dc964fd6dd9715ea7d
  Author: Uladzislau Rezki (Sony) <urezki@gmail.com>
  Date:   Thu Mar 30 21:06:38 2023 +0200
  
      mm: vmalloc: remove a global vmap_blocks xarray

This reverts pretty easily on top of v6.10-rc4, as long as I first
revert fa1c77c13ca5 ("mm: vmalloc: rename addr_to_vb_xarray() function")
as this just causes conflicts.  Then there is one easily-corrected build
failure (adjust the one remaining &vbq->vmap_blocks back to &vmap_blocks).

If I do all of that then the kernel is not crashing anymore.

A splat like this one is output on the console when the crash occurs (varies a bit):

  spitfire_data_access_exception: SFSR[000000000080100d] SFAR[0000000000c51ba0], going.
                \|/ ____ \|/
                "@'/ .. \`@"
                /_| \__/ |_\
                   \__U_/
  xfsdump(2028): Dax [#1]
  CPU: 0 PID: 2028 Comm: xfsdump Not tainted 6.9.5 #199
  TSTATE: 0000000811001607 TPC: 0000000000974fc4 TNPC: 0000000000974fc8 Y: 00000000    Not tainted
  TPC: <queued_spin_lock_slowpath+0x1d0/0x2cc>
  g0: 0000000000aa9110 g1: 0000000000c51ba0 g2: 444b000000000000 g3: 0000000000c560c0
  g4: fffff800a71a1f00 g5: fffff800bebb6000 g6: fffff800ac0ec000 g7: 0000000000040000
  o0: 0000000000000002 o1: 00000000000007d8 o2: fffff800a4131420 o3: ffffffff0000ffff
  o4: 00000000900a2001 o5: 0000000000c4f5a0 sp: fffff800ac0eeac1 ret_pc: 0000000000040000
  RPC: <0x40000>
  l0: fffff800a40098c0 l1: 0000000100800000 l2: 0000000000000000 l3: 0000000000000103
  l4: fffff800a40081b0 l5: 0000000000aeec00 l6: fffff800a40080a0 l7: 0000000101000000
  i0: 0000000000c4f5a0 i1: 00000000900a2001 i2: 0000000000000000 i3: fffff800bf807b80
  i4: 0000000000000000 i5: fffff800bf807b80 i6: fffff800ac0eeb71 i7: 0000000000503438
  I7: <vm_map_ram+0x210/0x724>
  Call Trace:
  [<0000000000503438>] vm_map_ram+0x210/0x724
  [<00000000006661f8>] _xfs_buf_map_pages+0x58/0xa0
  [<0000000000667058>] xfs_buf_get_map+0x668/0x7a4
  [<00000000006673e0>] xfs_buf_read_map+0x20/0x160
  [<0000000000667548>] xfs_buf_readahead_map+0x28/0x38
  [<000000000067a4f8>] xfs_iwalk_ichunk_ra.isra.0+0xa8/0xc4
  [<000000000067a8f0>] xfs_iwalk_ag+0x1c0/0x260
  [<000000000067ab08>] xfs_iwalk+0xdc/0x130
  [<0000000000679fc8>] xfs_bulkstat+0x10c/0x140
  [<0000000000695528>] xfs_compat_ioc_fsbulkstat+0x1a4/0x1e8
  [<000000000069572c>] xfs_file_compat_ioctl+0x8c/0x1f4
  [<0000000000534ab0>] compat_sys_ioctl+0x9c/0xfc
  [<0000000000406214>] linux_sparc_syscall32+0x34/0x60
  Disabling lock debugging due to kernel taint
  Caller[0000000000503438]: vm_map_ram+0x210/0x724
  Caller[00000000006661f8]: _xfs_buf_map_pages+0x58/0xa0
  Caller[0000000000667058]: xfs_buf_get_map+0x668/0x7a4
  Caller[00000000006673e0]: xfs_buf_read_map+0x20/0x160
  Caller[0000000000667548]: xfs_buf_readahead_map+0x28/0x38
  Caller[000000000067a4f8]: xfs_iwalk_ichunk_ra.isra.0+0xa8/0xc4
  Caller[000000000067a8f0]: xfs_iwalk_ag+0x1c0/0x260
  Caller[000000000067ab08]: xfs_iwalk+0xdc/0x130
  Caller[0000000000679fc8]: xfs_bulkstat+0x10c/0x140
  Caller[0000000000695528]: xfs_compat_ioc_fsbulkstat+0x1a4/0x1e8
  Caller[000000000069572c]: xfs_file_compat_ioctl+0x8c/0x1f4
  Caller[0000000000534ab0]: compat_sys_ioctl+0x9c/0xfc
  Caller[0000000000406214]: linux_sparc_syscall32+0x34/0x60
  Caller[00000000f789ccdc]: 0xf789ccdc
  Instruction DUMP:
   8610e0c0
   8400c002
   c458a0f8
  <f6704002>
   c206e008
   80a06000
   12400012
   01000000
   81408000

Let me know if you need any more info!

Thanks,
  Nick
