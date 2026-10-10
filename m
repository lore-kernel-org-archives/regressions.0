Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B233D0BE7
	for <regressions@lists.linux.dev>; Sat, 10 Oct 2026 06:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615322; cv=none; b=cfGVNASu7+34pOaD5MnXRaRmNEH+tSm4ua7fh9Aqwd3nDWxhlV35XC4mRrSH165gvGoZcNXPdVIQBkkmhr6OYOUJxQiFghtI/nXjisP41j87s21ctwK33xlPNig7qdAEgHkNlz613fchxYd/V9JnBoJ0PHsKqPpzVkesYG7s0wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615322; c=relaxed/simple;
	bh=N/moG7D9OviUmWFrdyyxRnoldPlo6k5RA0k/Zye2yns=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AiVYzCnRy4RHMEiQdWg8vV1g6dU2HQF7dow9J6iO9IrQ4CR0pCa+fmNxJhq/vY2WzJaaVCAnKk/F96Ai3x+qe8B9Y95JhC+9th2G7f4pND/7JYwpc1TOb76wU44yKUG2t+qnGcV12BRHG1FzQmZ8h4AWzClDjIRQ4ZOSEhaeBm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTT2FPMu; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTT2FPMu"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so203009f8f.3
        for <regressions@lists.linux.dev>; Fri, 09 Oct 2026 23:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791615319; x=1792220119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3AVqi9fExl9fa9tq7hzL0SK6VcTdqG2rmyMeegGqrkE=;
        b=eTT2FPMuIbsYCkoRrf5vCUZjwzFMj95GYrTZip4bAIYRtRpxqEpS9Zb26b5K1GTo1f
         OvluLfB8zSA1/vS38PtMf+cWFTc3nmKWFoW0z9dUTClerzGqeKVttS80zXJU3dsATQOi
         KqIXwOLtIYnzLrUOTNUlL1y2NhAU2juZrOO7TXYzvDoNVLMWlfIhwkNUCuhZBmE8JhIs
         HnhHIglMywbWoj+dGVzKqWNNhBJUd838X96dp56GqpV5G4jnNXSLNelZsai6wr53LCzx
         e+QfS90ojCmwf/k+miSUGJ96zeXbKvuFvBqrYdj+Hdfkk4fsOdvWATlxekj/TOj1OlP8
         pUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791615319; x=1792220119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3AVqi9fExl9fa9tq7hzL0SK6VcTdqG2rmyMeegGqrkE=;
        b=bWw1gNB0BgBpfOQ+WzDUoumVWSYBcxJBqlXJeSy7dC4u+Fqh3zw3dLyZKiFGxTSNIM
         eMtettZ4wc/tI8vnyhfwoR1JrIYDXrCeFveUwdJTofvc9lBYoxETqy7M0voIqi46TwGA
         bM6MqDgapxpDL+I7CM/dG9GlZkYNIv1XiAlac/Zp6mUKEcEgmiCKlOmIG26aLeGxi4GX
         WWJZ9/B0AL/u0RNqcM0B17gT3FrwCfBptsXNQDnMqM+QEAABahQcpBmO5NsbjGp6PrJS
         HvQ/cWohfCK+/CZ4b8jXE2+pkKYNIGH/jF+/Bhizkh06V9uwd8iQh3U92vkv1UmDaMzG
         lCCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxn/lYxHF61YSTtXZdBDNGRXfzMPKMHO16ofgKfKdzeiJTLC2oBhBbLgfh2ONa9Ebg7FFK9gfO+uOP5sw==@lists.linux.dev
X-Gm-Message-State: AFq9FYK5uPiXaB4Su3X8kDKXgynnZV2E1j3rwuM9XHL1aS3UHirwnxH0
	PGRCKBN9K1zp5+fvNOdBueG6870ZuH10d1DMhvExFpA57awEsocMBY+/
X-Gm-Gg: AYBFou0L75nfQM6bC03OZB5ScRljGftlcgI6a6Bi0wo/2jp9yDKNjVlSbwbdek86UDn
	TQVWdEbGxHwPrD9tE+qBtb1Xcp7js1BT2eKkl40oNSgyJPswxEC3TBTRee+FCVnz8xdAdn1ZUS5
	fH7YIM66v+Ds1z46Cb3VxqPhr85i00KzJHciBwqbMNerm2weMxx/NAWFiZZP8gRYH2AuKv7IuCc
	GV/3kzEPfYEIIMKFavLHa7xBfUbs2MHB5IHP+GZMhdLNUEe5BNyyhZHFmzVmjQQy5C2JBbwM356
	0NCM4+BARzJYluUhVdKWrCkSlYYwUe6Ant1e/wVRaH0YrH6B3kN+5XhXfRxb09kODW8buPaOunB
	rmwkdhX718/28YA1L+EBNM6W/Nr14wEB1NL/xEN+cttF/QER6ecO6nfuASSRTPm2HHPc38+2ohx
	RNIKZQGaFY8hWUDkWXpfv3n61mv0kN7Cid1bYydsOkkLB2sLXoU10bPMPH0QVBCgvWIPnOI9qJw
	1B+dIGATO0dXyz7Z2IoZb8g7RNXZFSbDIEHbqxexSRJSG9vYNw5U+GWvD95QwydhD4dv3bCuyPq
	rBl8BMGcpuxV+O1qpbfXc+rGv0Ja74dtYCI+te7vN4XFC8i5ng1YFMgChpejqZ0N/YTFlCqZFIw
	=
X-Received: by 2002:a05:6000:40dd:b0:487:72f:fb41 with SMTP id ffacd0b85a97d-48dbace8754mr8021343f8f.39.1791615319107;
        Fri, 09 Oct 2026 23:55:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9d3f-0d01-48c7-5d76-0ec6-9dac.310.pool.telefonica.de. [2a02:3100:9d3f:d01:48c7:5d76:ec6:9dac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db946323bsm8691754f8f.2.2026.10.09.23.55.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Oct 2026 23:55:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Jiri Wiesner <jwiesner@suse.de>,
	Daniel J Blueman <daniel@quora.org>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [REGRESSION] clocksource: delayed watchdog can mark TSC unstable
Date: Sat, 10 Oct 2026 08:55:09 +0200
Message-Id: <20261010065509.72916-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the watchdog rewrite in v7.1, the TSC can be marked unstable
after a delayed watchdog run under QEMU TCG. Without injected stalls,
this happened on 5 of 12 boots on a loaded host and 0 of 6 on an idle
host.

The delayed run re-arms the timer with an expiry already in the past.
The watchdog then runs again almost immediately and rejects the TSC
based on a roughly 75 us measurement interval.

#regzbot introduced: 763aacf86f1b

v7.3-rc5, 4 vCPUs, after vCPU 0 was stopped for 0.8 s:

  clocksource: Marking clocksource tsc unstable due to frequency skew
  clocksource: Watchdog                    hpet interval:            74940ns
  clocksource: Clocksource                  tsc interval:            74251ns
  clocksource: Switched to clocksource hpet

The intervals are 75 us, not the 500 ms watchdog period. A function
trace of clocksource_watchdog() from the same boot:

  busybox-79 [000] ..s1. 15.168486: clocksource_watchdog <-call_timer_fn
  busybox-79 [000] .Ns.. 16.269726: clocksource_watchdog <-call_timer_fn
  busybox-79 [000] .Ns.. 16.269820: clocksource_watchdog <-call_timer_fn

The second call came 1.10 s after the first, the third 94 us after the
second. Re-arming with expires += WATCHDOG_INTERVAL leaves the next
expiry in the past when a run is more than one interval late.

For a 75 us interval, the 500 ppm allowance is only about 37 ns, plus
the readout time. The measured difference was 689 ns.

Before 763aacf86f1b an interval above WATCHDOG_INTERVAL_MAX_NS was
skipped with "Long readout interval, skipping watchdog check" and the
timer re-armed from jiffies, so there was no immediate second run, and
the skew was compared against a fixed margin of at least
2 * WATCHDOG_MAX_SKEW. The rewrite dropped both.

Reproducer: a v7.3-rc5 guest with allnoconfig plus the fragment below,
4 vCPUs, qemu-system-x86_64 -accel tcg, the HPET as watchdog.
PTRACE_ATTACH on the "CPU 0/TCG" thread for 0.8 s, detach, six times
12 s apart. The TSC was marked unstable on the first stall in 2 of 2
runs. Stopping the whole QEMU process did not reproduce it. The guest
clocks stopped with it.

The same stall against other kernels, same config:

                                        TSC marked unstable
  v7.3-rc5                                   2 of 2 runs
  v7.3-rc5 + the check below                 0 of 2
  763aacf86f1b (the rewrite)                 3 of 4
  763aacf86f1b^                              0 of 2
  v7.0                                       0 of 2

763aacf86f1b^ and v7.0 print the "Long readout interval" line for the
same stalls and keep the TSC. 763aacf86f1b marked it unstable on a
170 us window, hpet 169720 ns against tsc 168974 ns.

The added check in watchdog_check_freq() skips the frequency check and
resets the watchdog when the measured interval is shorter than a quarter
of the period:

	if (max_delta < WATCHDOG_INTERVAL * TICK_NSEC / 4)
		goto reset;

Re-arming from jiffies instead of from the previous expiry would avoid
the second run altogether.

An LLM agent helped me with the test setup and the trace analysis. I ran
the tests and checked the results.

The relevant part of the config fragment on top of allnoconfig:
  CONFIG_64BIT=y
  CONFIG_EXPERT=y
  CONFIG_SMP=y
  CONFIG_NR_CPUS=4
  CONFIG_PREEMPT=y
  CONFIG_HIGH_RES_TIMERS=y
  CONFIG_NO_HZ_FULL=y
  CONFIG_HZ_250=y
  CONFIG_ACPI=y
  CONFIG_PCI=y
  CONFIG_VIRTIO_PCI=y
  CONFIG_VIRTIO_CONSOLE=y
  CONFIG_BLK_DEV_INITRD=y
  CONFIG_SERIAL_8250=y
  CONFIG_SERIAL_8250_CONSOLE=y
  CONFIG_FTRACE=y
  CONFIG_FUNCTION_TRACER=y
  CONFIG_IRQ_TIME_ACCOUNTING=y
  CONFIG_PROVE_LOCKING=y
  CONFIG_DEBUG_PREEMPT=y

Thanks,
Karl
