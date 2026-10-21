Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592268;
	b=e5/S7yva5plStde6VH47nopAy20sHAFtlc/NKxQAgZc5d9UB7tLN4NxzpeEOrzHDq5OQ
	 ZMhyGMpESxb+vSOepcTySu14BG5EN/fZsIB3lB88bv1qk7qTy6Z2S/Tu7GKPQO7W2JUOD
	 K0O4Ke0sNuSgOrRSX9shiMe6jCUwuS87M+MfBbgAd7CritEtusfh1ht2uNFOXvaSv36KP
	 AnzRxor0UEBJiFKbpc17CWexWheUdcrk0Qg0ExkY12Csg/O1C2Xj96vmg6dn07peIFa3a
	 K2KRAnuYvPLx4e9UTF50TC8E7ZGTVFIElOPndamvsAQp7jX7G+WsCSADWhhWQ5Vlb2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4emiTpWAarBibaAu0jj3yHN8NkMHkhKjP1v4saRY9lo=;
	b=gNIFEr1LRBBGd+96BOgVND+UPtpv2j2nM/7BCxPCaMjM9MXSEG+dcbK1T5xF4nyuhSsL
	 Y+jgUiQ1R7wkOVykz2pvkm0IG6t6EFGBHgZDqveN50n288k6PXEHZwvloW+Pq/pRp8pRJ
	 2Uy1dTWJJriJvVyGT25IB+/+EdIVPPpQEFQf/FSGsKQHnrp+lzdwbdhOz2L/5P6KlZoF9
	 f9SUXg1aFFIZjy8c6uZyMKCzgFTLfbl6WHfM8b3ZvkeXm4vu7dDyR1H1npWZqAUJr1/Vu
	 C7apUhIF0b33aqd2v4wRU57ALe4whIPvFShWYzCLl5baUKvhBA1/VzSthA1UuRWnB8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MUDlB+Y8;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD65E606A31E
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 14:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD65E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MUDlB+Y8
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a01933b584so6093605e9.0
        for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 07:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792592266; x=1793197066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4emiTpWAarBibaAu0jj3yHN8NkMHkhKjP1v4saRY9lo=;
        b=MUDlB+Y8gBvlpmBSX4GhKC6EJMdGY7U7a0Merh0C0fDwNXRtxHe2q7WygWv2Wm7f4G
         EysniY5HqUQQ4yAY7eGuETM2qmCaOyggx4q6VKA1vwoBjwPlJ0v8WYk9aTD0JSKCqU8g
         etJlsW9ZJP8wmr5RvHdctN1K1McfrMjPZmOMWtusuWrDu7SowsQCEzTYgvIR5dIpOtfg
         E/vW5jFShW+xh6iKwRExIBLo2A84z+Ub6mM4G3Ar2rlDeHBQkTHbBezEFNA+N6yCG93c
         i9eCT6CTDzvkvw56NwwfVd+8bNrv5XuY/yZJ7pgNq3EVp3ijmbwv0yrAkHxSfT6+kosE
         YMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592266; x=1793197066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4emiTpWAarBibaAu0jj3yHN8NkMHkhKjP1v4saRY9lo=;
        b=bpHYrG4ZaHc/qcWhiusGtpnCEOEUg/iehZlt/g3HoHO7SRpcOsdECgqHHZ5T3OYlNb
         0AbsU7bCclkqHIf4upyPonGzlZkFbess1nEMGvK7zDXUE1DwMVnQilBFZAlzCtH1iF2h
         xxc/CSNmYYrD1PyOzdakkQUsNjDJTe6WhA5nPhiOt5joMDZxwSKMy+GXUgCEVzvsRTpu
         KWUM8o14OYso5krcLbRmP8Yx1QMihcixzcetkNF+/VDYYHeCsZU6NX7b0EW+3nOo6B8w
         0SGlM8xyBXmBH+PC65DlkktjbZwEjcLGv1UQFNwpBus9KK+tASIl7QmLm7SXstn9KK2Q
         qY5A==
X-Forwarded-Encrypted: i=1; AKwUvBzuXphnqKESURLitP+budGL+/U1XnSqLm84aRj5HXWyrH7R6lrMHU/G5Attwx1tChglfRW51bqv9vyTiQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLoz/B6hhnPlMVn9aKcG9O+sr+Wm85GJHDI7Dy5g9pBW+ik5SQ5
	qMfjfqYJGsBOzvnk0C8rJmb0QuKvj5R4dsY9v4cndCvZo0lm3OyPAmHW
X-Gm-Gg: AYBFou0c+ZrDLiXtxKLIeTM54okqeEbkkvg8NS9zP5TxE6Pxd9u5KQSa0wlQ1gBa65g
	skuyThOAasFv8VzEubeFci6fb+aIR/IGnpT1hD3l0BLvA5ys3ACNwjfgO0BejrRZKN0PE3xhyYT
	koqIzDhaiOgWYKs3r+w0ue5SJadLFo0EBI8rDuUixtyQBHop5BoVM3DY/CqukxmQsv4BmaQqv29
	5E8LCE1QELVNyuHXisqKu2bzVg3OrN57HAATXRbgKFTTesAMInfZ6M/gEPXDyJzn4SFTsenbGtl
	zITwkirzstlxS1yx4QaqbgsPM4faRVmwXRQ2Vgs5t5S9rV6eznEu6h5b4SW6TwsxfNlKUbBhBG+
	c86lQiklox61UsrkJ1BmD3KxDtoNXhNwNMZa1ciA9Gr3JX/PBiwO+QtKaL0VV1Ahm7HLRSr/w9l
	6PzdTVhvmjGm/LNKCYr4ZuM4n1jTcvb2BMFQSqp3GwZaaHaUb7R1uuAi9pYOYh4+SaDrjHKoawP
	fQn80CttP4eayV+yLQOOl684Z70ZQLVERZMjCt0t1s/oDeXUs4wH0b1kG6uotGQw94=
X-Received: by 2002:a05:600c:3492:b0:4a1:e4c4:f6a9 with SMTP id 5b1f17b1804b1-4a1fdd3d479mr46131875e9.23.1792592265996;
        Wed, 21 Oct 2026 07:17:45 -0700 (PDT)
Received: from fedora ([2.35.202.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm103238355e9.7.2026.10.21.07.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:17:45 -0700 (PDT)
From: Francesco Nigro <nigro.fra@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org
Cc: mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	kan.liang@linux.intel.com,
	leo.yan@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Francesco Nigro <nigro.fra@gmail.com>
Subject: [PATCH v2] perf test: Add test for events re-armed with PERF_EVENT_IOC_REFRESH
Date: Wed, 21 Oct 2026 16:17:36 +0200
Message-ID: <20261021141736.2414170-1-nigro.fra@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Open a sampling event with sample_period 1, re-arm it with
PERF_EVENT_IOC_REFRESH from its overflow signal handler, as
self-profilers such as async-profiler do, and check that each of 1000
events delivers a signal. One case uses a software event (page faults),
the other the syscalls:sys_enter_getppid tracepoint. The signal is a
real-time one, so overflows cannot be coalesced, and the page fault
buffer is marked MADV_NOHUGEPAGE so that each touched page faults once.

The tracepoint case fails since
commit 18dbcbfabfff ("perf: Fix the POLL_HUP delivery breakage"):
only the first overflow is delivered. The re-arming ioctl succeeds,
but the event count stays at 1. It passes on the parent commit. The
software case passes on both.

The test was written with an AI coding assistant (Claude) from a
standalone reproducer; I reviewed it and ran it in QEMU on current
mainline, on that commit and on its parent.

Link: https://github.com/async-profiler/async-profiler/issues/1813
Signed-off-by: Francesco Nigro <nigro.fra@gmail.com>
---

Notes:
    v2:
    - Mark the page fault buffer MADV_NOHUGEPAGE: with transparent_hugepage=always
      the software case got 489 of 1000 overflows (reported by Sashiko).
    - Use a real-time signal instead of SIGIO, so overflows cannot be coalesced.
    - Print the event count, POLL_HUP signals and the re-arm ioctl's errno.
    - Skip only on EACCES/EPERM, check the setup calls, accept >= 1000
      overflows, close the event before restoring the signal handler.
    
    v1: https://lore.kernel.org/r/20261021131006.2101248-1-nigro.fra@gmail.com
    
    To run it on any x86_64 box with virtme-ng:
    
      vng --kconfig && make -j$(nproc)
      make -C tools/perf NO_LIBTRACEEVENT=1
      vng -- tools/perf/perf test -vv REFRESH
    
    Tracepoint case, 2 vCPUs:
    
      b320789d6883 (parent)  Ok:     count 1000, 1000 overflows (1000 POLL_HUP)
      18dbcbfabfff           FAILED: count 1, 1 overflows (1 POLL_HUP), re-arm errno 0
      a804c5742bff (master)  FAILED: count 1, 1 overflows (1 POLL_HUP), re-arm errno 0
    
    The software case passes on all three, and on master with
    transparent_hugepage=always.
    
    Leo Yan's series "perf: Revert direct PMU stop for refresh limit"
    reverts 18dbcbfabfff for a different reason; I haven't tested it
    against this:
    https://lore.kernel.org/r/20260512-arm_cs_clean_perf_handle-v1-0-75ff373ecd22@arm.com
    
    #regzbot introduced: 18dbcbfabfff

 tools/perf/tests/Build           |   1 +
 tools/perf/tests/builtin-test.c  |   1 +
 tools/perf/tests/event_refresh.c | 162 +++++++++++++++++++++++++++++++
 tools/perf/tests/tests.h         |   1 +
 4 files changed, 165 insertions(+)
 create mode 100644 tools/perf/tests/event_refresh.c

diff --git a/tools/perf/tests/Build b/tools/perf/tests/Build
index 66944a4f4..199e10c8c 100644
--- a/tools/perf/tests/Build
+++ b/tools/perf/tests/Build
@@ -23,6 +23,7 @@ perf-test-y += hists_output.o
 perf-test-y += hists_cumulate.o
 perf-test-y += bp_signal.o
 perf-test-y += bp_signal_overflow.o
+perf-test-y += event_refresh.o
 perf-test-y += bp_account.o
 perf-test-y += wp.o
 perf-test-y += task-exit.o
diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
index 4d0784b16..2b10f4d7f 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -98,6 +98,7 @@ static struct test_suite *generic_tests[] = {
 	&suite__hists_link,
 	&suite__bp_signal,
 	&suite__bp_signal_overflow,
+	&suite__event_refresh,
 	&suite__bp_accounting,
 	&suite__wp,
 	&suite__task_exit,
diff --git a/tools/perf/tests/event_refresh.c b/tools/perf/tests/event_refresh.c
new file mode 100644
index 000000000..726e5de4c
--- /dev/null
+++ b/tools/perf/tests/event_refresh.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Re-arm a sampling event from its overflow signal handler with
+ * PERF_EVENT_IOC_REFRESH and check that every overflow is delivered.
+ */
+#include <errno.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <signal.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <linux/perf_event.h>
+
+#include "cloexec.h"
+#include "debug.h"
+#include "tests.h"
+#include "tp_pmu.h"
+#include <internal/lib.h> // page_size
+#include "../perf-sys.h"
+
+#define NR_EVENTS 1000
+/* A real-time signal is queued, so no overflow can be coalesced away. */
+#define REFRESH_SIGNAL (SIGRTMIN + 1)
+
+static volatile sig_atomic_t overflows, hups, refresh_errno;
+
+static void sig_handler(int signum __maybe_unused, siginfo_t *info,
+			void *uc __maybe_unused)
+{
+	int saved_errno = errno;
+
+	overflows++;
+	if (info->si_code == POLL_HUP)
+		hups++;
+	if (ioctl(info->si_fd, PERF_EVENT_IOC_REFRESH, 1) < 0)
+		refresh_errno = errno;
+	errno = saved_errno;
+}
+
+/* Count overflow signals for NR_EVENTS calls of trigger(), period 1. */
+static int count_overflows(struct perf_event_attr *attr, void (*trigger)(int i))
+{
+	struct sigaction sa, old_sa;
+	uint64_t count = 0;
+	int fd, i, err = TEST_FAIL;
+
+	attr->size = sizeof(*attr);
+	attr->sample_period = 1;
+	attr->disabled = 1;
+
+	fd = sys_perf_event_open(attr, 0, -1, -1, perf_event_open_cloexec_flag());
+	if (fd < 0) {
+		int open_errno = errno;
+
+		pr_debug("failed opening event: %s\n", strerror(open_errno));
+		return open_errno == EACCES || open_errno == EPERM ? TEST_SKIP : TEST_FAIL;
+	}
+
+	memset(&sa, 0, sizeof(sa));
+	sa.sa_sigaction = sig_handler;
+	sa.sa_flags = SA_SIGINFO;
+	if (sigaction(REFRESH_SIGNAL, &sa, &old_sa) < 0) {
+		pr_debug("failed setting up signal handler\n");
+		close(fd);
+		return TEST_FAIL;
+	}
+
+	if (fcntl(fd, F_SETFL, O_RDWR | O_NONBLOCK | O_ASYNC) < 0 ||
+	    fcntl(fd, F_SETSIG, REFRESH_SIGNAL) < 0 ||
+	    fcntl(fd, F_SETOWN, getpid()) < 0) {
+		pr_debug("failed setting up signal delivery: %s\n", strerror(errno));
+		goto out;
+	}
+
+	overflows = 0;
+	hups = 0;
+	refresh_errno = 0;
+	if (ioctl(fd, PERF_EVENT_IOC_REFRESH, 1) < 0) {
+		pr_debug("PERF_EVENT_IOC_REFRESH failed: %s\n", strerror(errno));
+		goto out;
+	}
+	for (i = 0; i < NR_EVENTS; i++)
+		trigger(i);
+	ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
+
+	if (read(fd, &count, sizeof(count)) != sizeof(count))
+		pr_debug("failed to read the event count\n");
+	pr_debug("%d events, count %" PRIu64 ", %d overflows (%d POLL_HUP), re-arm errno %d\n",
+		 NR_EVENTS, count, overflows, hups, refresh_errno);
+	/* Unrelated page faults can only add overflows, never hide one. */
+	if (overflows >= NR_EVENTS)
+		err = TEST_OK;
+out:
+	/* Close first: a late signal must still find our handler. */
+	close(fd);
+	sigaction(REFRESH_SIGNAL, &old_sa, NULL);
+	return err;
+}
+
+static char *pages;
+
+static void touch_page(int i)
+{
+	pages[(long)i * page_size] = 1;
+}
+
+static int test__event_refresh_sw(struct test_suite *test __maybe_unused,
+				  int subtest __maybe_unused)
+{
+	struct perf_event_attr attr = {
+		.type = PERF_TYPE_SOFTWARE,
+		.config = PERF_COUNT_SW_PAGE_FAULTS,
+	};
+	int err;
+
+	pages = mmap(NULL, (long)NR_EVENTS * page_size, PROT_READ | PROT_WRITE,
+		     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (pages == MAP_FAILED)
+		return TEST_FAIL;
+	/* One fault per touched page: a huge page would cover many of them. */
+	madvise(pages, (long)NR_EVENTS * page_size, MADV_NOHUGEPAGE);
+
+	err = count_overflows(&attr, touch_page);
+	munmap(pages, (long)NR_EVENTS * page_size);
+	return err;
+}
+
+static void call_getppid(int i __maybe_unused)
+{
+	syscall(SYS_getppid);
+}
+
+static int test__event_refresh_tp(struct test_suite *test __maybe_unused,
+				  int subtest __maybe_unused)
+{
+	struct perf_event_attr attr = {
+		.type = PERF_TYPE_TRACEPOINT,
+	};
+	int id = tp_pmu__id("syscalls", "sys_enter_getppid");
+
+	if (id < 0) {
+		pr_debug("no syscalls:sys_enter_getppid tracepoint\n");
+		return TEST_SKIP;
+	}
+	attr.config = id;
+
+	return count_overflows(&attr, call_getppid);
+}
+
+static struct test_case tests__event_refresh[] = {
+	TEST_CASE_REASON("Software event", event_refresh_sw, "permissions"),
+	TEST_CASE_REASON("Tracepoint event", event_refresh_tp, "permissions"),
+	{	.name = NULL, }
+};
+
+struct test_suite suite__event_refresh = {
+	.desc = "Event re-armed with PERF_EVENT_IOC_REFRESH",
+	.test_cases = tests__event_refresh,
+};
diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
index cee9e6b62..ecc25b5a3 100644
--- a/tools/perf/tests/tests.h
+++ b/tools/perf/tests/tests.h
@@ -124,6 +124,7 @@ DECLARE_SUITE(parse_events);
 DECLARE_SUITE(hists_link);
 DECLARE_SUITE(bp_signal);
 DECLARE_SUITE(bp_signal_overflow);
+DECLARE_SUITE(event_refresh);
 DECLARE_SUITE(bp_accounting);
 DECLARE_SUITE(wp);
 DECLARE_SUITE(task_exit);
-- 
2.55.0

