Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588215;
	b=nra1LwzJqDLpupqwx/BLWZuhZHL9z1rMbw3DSMe9Yr3JhhJqTCC/cvmK2sL7zlSw1G1Z
	 ukZukwJtUcTafdqxjrzqchCIVapWe27dZmBCHLFf9wFvB1G1xAnCzZ4wXOIXl6TqN78ud
	 tqfpiVeYoR8l+lcvX8Y5d0rDjD4+CtNKQbHqoevBsiAGlcsWB8fNjvqlD3XJ2H70VHNBO
	 spUnIfcC6tP4oHS9ReU833Z+n5jijyrTt/3UL8507RabZO7K7mipCGVffJsmbc3xkK77/
	 uTceTdsJGVG5DAvxLp8fLvtWy2PP02bDXcldCvMkHFxhTHP9rVQAI4EY/N6/wsLKitA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kCIy61a3Xg4nO5urxAH55V+yrXEsE58ZJ5Oo+jGSLDg=;
	b=LQr54fDt6ZrTF5pIFev2JMdsmZ69qioLn+Mh3i8zIL6drvES8FkXZdY0yel1RFAV7UjH
	 zofgrtd1Xax6VeWsUcMR35mbfTKbw40riivDQKLkOsQGBU/9SbzBrkuzbTS/xJn5EI9eK
	 7b955G7MIY/D2h9qB0uyyWE5quyDBkG3tffiI/R3Z5JYcUqQVg8fBRiDMhj2x8XNDk9UX
	 HHpCy+koC+02iYlHoVgre+xR/xzDosyjTUWjCyf6FVEnyY+SXXYk2FBgyywH1zqcOdGee
	 fJOZFKZwblRJBxL8P4AxkRZyl7X/pVN+ygepwbPZtNUQSor+tZB53qlMbEBzajranpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AbQnI226;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D362760A260F
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 13:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D362760A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AbQnI226
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1efc90e7cso10490055e9.1
        for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 06:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588213; x=1793193013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kCIy61a3Xg4nO5urxAH55V+yrXEsE58ZJ5Oo+jGSLDg=;
        b=AbQnI226+kTnCE7PYSx2e5of5AYltU2YF/hG9X92S7SzOsOe8WjMcO38SVo6HXJbKD
         Fcw6njUuzbwLHjxm4nqQrZIAlGm3QyBnZJhdf+P/7YwxgWnCzHBezDxDbGixIUF3Q5CC
         os6PYjU/gkTbCfn2SfnOMfD9Hcbv5DwzUpfXeV1AOSWZvZPI2HhOzcO4g1x5dDoU7nU+
         TOOBi9+xXGjInKmu9NudPK4LaRFJkjNedeqs5ii0yRSgnP24IKcKlrifJUU9rEbX355W
         Tn/SQ7LZQnglwvab7cS4uqAddFWP6VPBNiXzbkWBvviPEWUVipl4ozS4YoTKWlcwILiV
         ZEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588213; x=1793193013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kCIy61a3Xg4nO5urxAH55V+yrXEsE58ZJ5Oo+jGSLDg=;
        b=HTga98Y2csGIbfABkEh/xJfEkBbklE8ubFFK+uoC3K2LuPaRLXS1dlwxkqCYm9W+/7
         7tg8DKjUg8ojBhXKZarOA5125enH7185y9QB5hWMYKNNVYXq0NAKB5HwfVJXMVduoJfb
         v1Unq0mtah8TyY6+dS3x/xJSaARqEKqe+jdXObLgiUWylaiE8ChHQz+9LCVos8XLBXJu
         MREaeP4cp3/ye6rxHf1HEkzoRnt271sDrjAsKl4QwN63k992CmH07Ltxq9G94Ax2Vkx2
         mttxTdYlhwJaKEwQxqxuQbmUw3pY68ro0W8EKJ5cHUHd4SqsF6UiPJAcR6NIpS6/Ckbj
         xSaQ==
X-Forwarded-Encrypted: i=1; AKwUvByIuKjY5zhY0AWkmOhtAnm+tZwerwxay+LQf6QQvt66EigQmGHxkpQpG/RdGX51TMtHSt6GuPzOlbcCLQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIQnV93+ZiyfecLNnl/4Emy6RY+h4cJ3160fSAbMdAVorn8IW+6
	jyB/LpvLOfl3eJtoEfr8VOvthFYQbKslm9h6IxSamRPKl4DMRFUaiOWS
X-Gm-Gg: AYBFou3up3IyVEGGHcSdrZTo9j/Yo5fThmQgvfzUUikkplbvDM+i7KFmhrOgocqTIRq
	+vTqIOShOkpdr2Cg9hTs4bZuRCMyU6qZPhWwiYwuCn9Au2AKYXl6NoMoKk67pKGoQFgHNWOvWgU
	jrM4P45nqsbvHKmcsA3lWEWgKZBc+OHQxD56SsIZust/vXeknT0NS/bSc82bAJDEtw5tpAq22YI
	c26EB7QhfYrsie+2bSEhHI+D4ypzTf7R/ObLuy9xTxG8OpfYaWCwt9WWWM4lEAXZOVg3THjW07z
	Jyqa4FQdmxPXRcrXMPoGkve5MRloltqTGObrQwnubPQE0jnJRkNhHO+bbVXZBosHjsBGmaB7DsW
	fK+d/mgpvuNl1lFugnjV6qWxqYmQ9Dcz3n4tmWjZKlNGervkuNGolF/w2rjZ9oz1tfnoQED3oM8
	slHYzu2CpIS54NtLxDthTGo8aK04ECQ4xnft6UN6vwW+MIzLy0m5MedtMCnibebkTnchuTjO07y
	PfwkJ7ccIlxaCoAX2cJTSGiDTht1teJLE1djWUbBhiTxw==
X-Received: by 2002:a05:600d:864c:10b0:4a2:317:d0ed with SMTP id 5b1f17b1804b1-4a20317d208mr440795e9.1.1792588212996;
        Wed, 21 Oct 2026 06:10:12 -0700 (PDT)
Received: from fedora ([2.35.202.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d85a9bsm170890685e9.15.2026.10.21.06.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:10:12 -0700 (PDT)
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
Subject: [PATCH] perf test: Add test for events re-armed with PERF_EVENT_IOC_REFRESH
Date: Wed, 21 Oct 2026 15:10:06 +0200
Message-ID: <20261021131006.2101248-1-nigro.fra@gmail.com>
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
PERF_EVENT_IOC_REFRESH from its SIGIO handler, as self-profilers such
as async-profiler do, and check that each of 1000 events delivers a
signal. One case uses a software event (page faults), the other the
syscalls:sys_enter_getppid tracepoint.

The tracepoint case fails since
commit 18dbcbfabfff ("perf: Fix the POLL_HUP delivery breakage"):
only the first overflow is delivered. It passes on the parent commit.
The software case passes on both.

The test was written with an AI coding assistant (Claude) from a
standalone reproducer; I reviewed it and ran it in QEMU on current
mainline, on that commit and on its parent.

Link: https://github.com/async-profiler/async-profiler/issues/1813
Signed-off-by: Francesco Nigro <nigro.fra@gmail.com>
---

Notes:
    To run it on any x86_64 box with virtme-ng:
    
      vng --kconfig && make -j$(nproc)
      make -C tools/perf NO_LIBTRACEEVENT=1
      vng -- tools/perf/perf test -v REFRESH
    
    Results, 2 vCPUs:
    
      b320789d6883 (parent)  Tracepoint event: Ok
      18dbcbfabfff           Tracepoint event: FAILED, 1000 events, 1 overflows
      a804c5742bff (master)  Tracepoint event: FAILED, 1000 events, 1 overflows
    
    The software event passes on all three.
    
    Leo Yan's series "perf: Revert direct PMU stop for refresh limit"
    (linux-perf-users, 2026-05-12) reverts 18dbcbfabfff for a different
    reason; I haven't tested it against this.
    
    #regzbot introduced: 18dbcbfabfff

 tools/perf/tests/Build           |   1 +
 tools/perf/tests/builtin-test.c  |   1 +
 tools/perf/tests/event_refresh.c | 136 +++++++++++++++++++++++++++++++
 tools/perf/tests/tests.h         |   1 +
 4 files changed, 139 insertions(+)
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
index 000000000..480f738de
--- /dev/null
+++ b/tools/perf/tests/event_refresh.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Re-arm a sampling event from its overflow signal handler with
+ * PERF_EVENT_IOC_REFRESH and check that every overflow is delivered.
+ */
+#include <errno.h>
+#include <fcntl.h>
+#include <signal.h>
+#include <stdlib.h>
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
+
+static volatile sig_atomic_t overflows;
+
+static void sig_handler(int signum __maybe_unused, siginfo_t *info,
+			void *uc __maybe_unused)
+{
+	overflows++;
+	ioctl(info->si_fd, PERF_EVENT_IOC_REFRESH, 1);
+}
+
+/* Count overflow signals for NR_EVENTS calls of trigger(), period 1. */
+static int count_overflows(struct perf_event_attr *attr, void (*trigger)(int i))
+{
+	struct sigaction sa, old_sa;
+	int fd, i, err = TEST_FAIL;
+
+	attr->size = sizeof(*attr);
+	attr->sample_period = 1;
+	attr->disabled = 1;
+
+	fd = sys_perf_event_open(attr, 0, -1, -1, perf_event_open_cloexec_flag());
+	if (fd < 0) {
+		pr_debug("failed opening event: %s\n", strerror(errno));
+		return TEST_SKIP;
+	}
+
+	memset(&sa, 0, sizeof(sa));
+	sa.sa_sigaction = sig_handler;
+	sa.sa_flags = SA_SIGINFO;
+	if (sigaction(SIGIO, &sa, &old_sa) < 0) {
+		pr_debug("failed setting up signal handler\n");
+		goto out_close;
+	}
+
+	fcntl(fd, F_SETFL, O_RDWR | O_NONBLOCK | O_ASYNC);
+	fcntl(fd, F_SETSIG, SIGIO);
+	fcntl(fd, F_SETOWN, getpid());
+
+	overflows = 0;
+	ioctl(fd, PERF_EVENT_IOC_REFRESH, 1);
+	for (i = 0; i < NR_EVENTS; i++)
+		trigger(i);
+	ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
+
+	pr_debug("%d events, %d overflows\n", NR_EVENTS, overflows);
+	if (overflows == NR_EVENTS)
+		err = TEST_OK;
+
+	sigaction(SIGIO, &old_sa, NULL);
+out_close:
+	close(fd);
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

