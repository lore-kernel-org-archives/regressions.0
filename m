Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795598685;
	b=aab6gxf7bEqFdvhphzGKUEjr9yEZwu0ai9+v7P+uLcq8Rnfmr9jkseYnYXAns+MQMzDA
	 0ebc/m53EE3qS151RynpeSbDht1T6hkrurz2cVb8iIzjrE+zi9Nk9Ys7Z9slFoqxQeFK9
	 RR+cTE21InPCQzp8xM2VEgSTudnoFSYSaDKHLmvNEzGGALbYxzy9oo+2L3absP44hCx7U
	 oAtI1ugReJ9dIAblLXgc1DxVvjAaxn9P2mRIDs6+AMSfj7CHz66VVXTnmglt24jL4FwOn
	 0JHehXHp3sFWOsninoLNSGv47SYzrngM7azT2CqVuB0cplZLzQGUW9iMoW/0q/8JgPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=LoUqXSMbdzfiCID2GLThVhw132KJLt9huSg+e/LMgag=;
	b=WAaCr5a7xjxNxLmueihEhn45Ak4deC361/awJR3ZKATptNqMTARQFXStPvzIUVNmY8XF
	 S/4JR3DBHWclr7xoAYULcT2u4j7kdYGogCO+ZvaaWq5Uo75eeQGTzKolo3XrkjD/Mo84m
	 r0q+86yVXlRhDZl2k+LAshIx3/e7MwunXgZWbaBnJKKw9yRt2Oy4g+BBhdxLtklLYEioa
	 fUc4/USjdG26lDrFPvvxZAR+f71gINpb5T20KssxDMjFL+mYoc/nIKcJqC+E5fnD15Fs8
	 sVUBrhih487eaNPxRMr2sltozluAOMCa9WFy/WIhGlxlSkEcrEMyXcJGPNizSviBwxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GzfwIUnH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593A7606A33D
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 09:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593A7606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GzfwIUnH
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so49388371fa.1
        for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 01:24:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795598683; cv=none;
        d=google.com; s=arc-20260327;
        b=KK8lq0fnmGiofOBHrj5/WPQKXxKaMUhGS2akP+zT6FCEJeAtY+vlz4+vGkBiRdVCcX
         sZkrZixCpLHA8AVOKdBd7ZmSGfOXi97v5HU53QwuGkzXpOTjJ/cBfKunaL5jECrUgYZi
         mk39JMDxWw4P3+djsP4JrFWCI6cEpgFQe91YEcgzn01mnrn5+Va2pFEEjtWv22k/oWX+
         OL6h7wc5GEHveyIhDQqAmjapypA38IJX917pJ2d23RNcW40m6sTeLpdrt5oUg7Lpzuxz
         59BzJjz0kiQeU3HmxzUb8ynzd8HqHfa468AJr/NW5YG3y7NJqOp64Qgj1jIoniHUhRZU
         c15g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=LoUqXSMbdzfiCID2GLThVhw132KJLt9huSg+e/LMgag=;
        fh=94ZhTimBgRKatjQ5dAeuiAvH9bsj4T0qK5KJu9NR8s0=;
        b=eee71/m2AYPl/CzF/BSIsFluSNpC+D3pZtXaISrPXSDxmR7KVRuV9Ly9Xk9AVHExE6
         TJtEw1IJY8gdDz0EHr1SnPL0tspNgSJofF1KCvjFv3wjV0vHy0+XraWyhXNiAXgr1umV
         27HW+rEcV2hpIv/D3k8U+4ZOKcQy97TcK/oFGLjvE/wJHDRQrI3Dc8HRpaslqtTTK61k
         BlGDgKOkfzYMG2afjjl7x2jCjWmoD1jSzubK49jdc48SEgyBOK81jJfHPLAcEIAhBCF7
         yVlsPAWfjpMX6e+7b+bXsZBIKWYPPBOyMY6wov7Q5hhCXE02kAhX6FSdUej3fVfh1xc7
         XTcg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795598683; x=1796203483; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LoUqXSMbdzfiCID2GLThVhw132KJLt9huSg+e/LMgag=;
        b=GzfwIUnHcJacAiSJiFVPmLeiw7ADZPv58aSaOhdmbWa2R7hUTlMRFPqEsUu5Db+b2E
         htgpuEWOTL5UYhCmEjnbzWZaqzkFq37ZknfYUTe10uipBT5UgpUOcS/F4A9BbH8gMplA
         idbNJ9xp/MrbcBlI7wOd/u5RiQi3WaOYCwwalP/MU7IhoJuMbSvymHPnSbCHyszFfJjM
         9/9f4Jqk5enasBD32PlOvJuv1zrf2o32JcsNkrnmt6vAb6sCs1OXFX1v9gW07SrrI7TN
         P3dRmhB/VLQJjHekUoqBE1n5oAwfXj5OBMt9tD1Iz5X3WZxCHue3SirnuatHMd5nvi6B
         WXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598683; x=1796203483;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LoUqXSMbdzfiCID2GLThVhw132KJLt9huSg+e/LMgag=;
        b=c8DWxKZ7CNjPKrhBnXpseaS2Q7MXy22Uku4DA2kryWjglwdW8+YWYv52PK2/xZi6NP
         MOWZzYrX++dthpKp3vEAvhEyFgWJziPouDrEDECabLQek/9igsrkrfqQEZI6nM316ejW
         eoaXZ2TvaSm/Qv+P6y+/B564vWJmYtu7AUaUweStMUuOTYh24eyc3jD1X0RNm+4sBCwk
         BYq6B8wOqMOgZde7o+C8NI9/uhi6rKoxcqbgqMkJaZ77C2byJiRcPE2rEkmb1GBnR6Ee
         3apAvAfVG6q04iJdPzaM3U1ZacGT7HrEu2H/eaP0WJRV8PmE//iIg/cYlGJvh9KNgd6J
         6Lgg==
X-Forwarded-Encrypted: i=1; AL+hErFr2L5ygnbm6LcXiuUUyS4msS9OOZcaURxLganQj+lARr/mKMTC4wU2X4WVA5rXgx0PC75gOYXEWrKCFg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/QIqmqxSAXrJQ3BzJ4sclqJpFd8VZgiDHLuD50jLCOBXuWJ6e5
	JUTGmsswNmqNu00hfKNEzAVD6tVCPK3ydlTMLYuzmJu5eWcqLJvYLCUl8FpO4de/+A0XY8ImSWb
	tPU6qGfv0xwCAFUOo+Iyo3vV0Uc5zl2M=
X-Gm-Gg: AZFdTZf3YdXRHfT4csoag44x7NtgYaek6opTVa/kYffGf/h99caLFa43GRIblagbkjb
	vxhYO5HJwHpvtd4+V05adgNzCHaX08VQAh+Esy7UsyadOSwmi42fV5JBT0oRXnwEZjbX9DDFm2q
	QcVpy5f63S8ZD34x0zxdnp5xI/xO1qtGq/124l/0M+2HVo3NqddCT2VV7LnFX+shZcXVQ+M3PEO
	R30qcTWmeoOcLqsRqpvzK0GivIKW9mnDg4/f/FokDzB0pbUCk4h3QhdE8posjU6gwyluekq9tus
	qqqaOgKODYfwaWPznM6givT5rWDf+lkbWgqP1C1j2XAjgN0Av+IbWh5kQ2P4jA0KOTv8aQAkRtS
	y/wOKqdc5qcLYEuQgxQ7mMQH0MBZGTqgi8Ov4s3uJySIAHw2wiTwkAQOUC+haxlNOrKkj
X-Received: by 2002:a05:651c:1585:b0:3ac:ff0a:9d85 with SMTP id
 38308e7fff4ca-3ae7f9b2233mr51182081fa.7.1795598683266; Wed, 25 Nov 2026
 01:24:43 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Jun Cheol Gim <dialogbox@gmail.com>
Date: Wed, 25 Nov 2026 18:24:31 +0900
X-Gm-Features: Aa3M54qT9tnmZcrxybXqvrlGXEWwLRvn7QmQG1FspTFq6CZWWSzhu5tBjdUlIuw
Message-ID: <CANb8v8EGmQf90hRvr8cE3vTKOOY8b6LTxki1uORW_TJ9HadrZw@mail.gmail.com>
Subject: [REGRESSION] Lunar Lake: s2idle randomly misses S0ix when PCH xHCI
 (8086:a87d) is runtime-suspended; much worse since 7.3
To: Mathias Nyman <mathias.nyman@intel.com>, Xi Pardee <xi.pardee@linux.intel.com>
Cc: linux-usb@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

On a Lenovo ThinkPad T14s Gen 6 (Core Ultra 5 228V, Lunar Lake),
s2idle sometimes resumes normally but never reached S0ix: last_hw_sleep
is 0 and the package stays in PC2 for the whole sleep (about 1.7 W
instead of 0.25 W). Since 7.3 this got much more frequent. Full details,
acpidump and logs: https://bugzilla.kernel.org/show_bug.cgi?id=222281

I narrowed it down. If the PCH xHCI controller at 00:14.0 (8086:a87d)
is runtime-suspended (D3hot) when the system suspends, the platform
fails to reach S0ix at random. If it is kept in D0 (power/control=on),
the failures almost go away, on both 7.0 and 7.4-rc4. That is why a
live USB system with a USB stick plugged in never failed (280/280).

Test loop: battery, no external USB devices, screen off, then
rtcwake -m mem -s 8 repeatedly. A cycle counts as OK if the S0i2.2
residency increased. "instr" means pm_debug_messages=1 plus an Intel
PMT telemetry dump around every cycle. That changes the success rate
by itself, so runs are only compared at the same instrumentation
setting.

  kernel               xHCI 00:14.0          instr  OK / total
  -------------------  --------------------  -----  ---------------
  7.0.0-44 (Ubuntu)    auto (D3hot, default) no     112 / 130 (86%)
  7.0.0-44 (Ubuntu)    on   (D0)             no      99 / 100
  v7.4-rc4             auto (D3hot, default) no       5 / 30  (17%)
  v7.4-rc4             on   (D0)             no      95 / 100
  7.0.0-44, same boot  auto                  yes     45 / 100
  7.0.0-44, same boot  on                    yes     96 / 100

- on vs auto: Fisher p = 1e-12 (7.0, same boot) and 1e-13 (7.4-rc4).
- With xHCI on, 7.0 and 7.4-rc4 cannot be told apart (99% vs 95%,
  p = 0.21).
- Caveat on the regression range: mainline v7.0 built with my config
  (Ubuntu config plus localmodconfig, checked that all loaded modules
  were built) reached only 15/30 with xHCI at "auto". So the clearly
  good kernel is Ubuntu's 7.0.0-44 (v7.0.14 plus Ubuntu patches), not
  plain v7.0. I have not tested v7.0 with xHCI on.

Failed cycles, according to Intel PMT (LNL aggregators 0x3072105 /
0x3072005, decoded with the public Intel-PMT XML):
- PREVENT_PKGC6_CHIPSET_1 and _2 count for the whole sleep (about 8300
  of 8300 ms). In OK cycles they count 40-75 ms.
- The package sits in PC2 and never enters PC10. GT RC6, media C6,
  core C6 and memory self-refresh look normal.
- In the unnamed regions telem5 (GUID 0x12057328) and telem6
  (0x11646436), most counters do not move at all during a failed sleep.
- The few failures left with xHCI on have the same signature.
- pm_debug_messages shows no "Constraint not met" over several hundred
  cycles. The LPS0 _DSM calls always succeed, and the RTC is the only
  wake source.
- Nothing read before suspend predicts the outcome. I checked every
  32-bit field of all 9 PMT regions and the PMC live status.
  Consecutive cycles are independent.
- Real lid-close sleeps behave the same way. An 82 min failed sleep was
  blocked by CHIPSET_1/2 for about 4960 s; a 105 min good sleep was
  100% PC10.

Workaround in use (one udev rule, split with backslashes):
  ACTION=="add|bind|change", SUBSYSTEM=="pci", \
    ATTR{vendor}=="0x8086", ATTR{device}=="0xa87d", \
    ATTR{power/control}="on"
During suspend I see no cost: OK cycles with on and auto use the same
package and Psys energy. I have not measured the idle cost while the
system is awake.

Questions:
1. Is there a known LNL issue when the PCH xHCI enters system suspend
   while already runtime-suspended (direct_complete or similar), as
   opposed to from D0? Should xhci-pci resume it before s2idle on this
   platform?
2. What do "Chipset 1" and "Chipset 2" in PREVENT_PKGC6_CHIPSET_* cover
   on LNL? Can the telem5 and telem6 data narrow down which IP keeps the
   package out of PC6? Raw per-cycle dumps are attached to the bugzilla
   entry (xhci-pmt-data.tar.gz).
3. I can bisect v7.0..v7.3 with xHCI left at "auto" if that is useful.
   Each step needs about 100 cycles (about 30 minutes) to separate the
   success rates reliably.

System: BIOS N4IET31W 1.17 (latest), EC 1.12, microcode 0x128,
Kubuntu 26.04, KDE Wayland. The cmdline also has no_console_suspend
(removing it at runtime did not help).

#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=222281

Thanks,
Jason Kim
