Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556B33F0755;
	Tue, 28 Apr 2026 23:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419243; cv=none; b=fTLXT8akI7gI3xubxQTvVUIiEuk7PkB7ByNKj0qNBMtLpmwr3hcV3ZW+QhloDppfzMpxYCkg/UyaWxhLtLwFXxHDQE95bVHdU9W/YBU6t0NZV5rlRZNcsSEEsKYpgc+2SMed1oonQwHXFBCPUlT4bvnObOJxROu4UrL3onDHWvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419243; c=relaxed/simple;
	bh=Yc/e2ydR2bgKQuaSQ9GcEXY+tPnsGOUafO5/8Wy2NSw=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=F7jktILcsdj7ROKffOSm1hRYjZM9skP+cfGrw7dIaBh7Hi4t/5uZ5oZvX8+c5AgKRxtwQZze4qYQrSIsknrkajcgmbSbGqE0unZyQLVlE+ojojrbFloB98yC64wa5u7iNB5VAIMoz+x8CvEiZM7Tge71/Xjv7tJVM5ubsoGoP+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jW0eZcd/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jW0eZcd/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A42C2BCAF;
	Tue, 28 Apr 2026 23:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777419243;
	bh=Yc/e2ydR2bgKQuaSQ9GcEXY+tPnsGOUafO5/8Wy2NSw=;
	h=Date:From:To:Cc:Subject:References:From;
	b=jW0eZcd/h0iiRH6Jgdi4Y4pPvmDdUMAM9Rxrrari0B3o8uEewlQliigRWNnoCoV8d
	 X4vjjlPnZr4BXNoqrsGrCA3+k+Q4KGJZQ1BbSorwoRAdVOUpmRXC5Qw7MT7lYnVEct
	 qah6aL6qXAQHYVEItD7DpB7ep547UeH2mwUgLQURsFU5d+/9Vdb2HNV2aktJSV+VWE
	 Qbh5DLDvOt3vhgiKiIysXD17i9ix2C3P0HWi9FIIU4wn5CXh99UaEGVoxdStzPwtin
	 RxFTBLY+ujzMW1h2QLgSr+p/WdYdhLbAXnw6Exhm1dn3gDGC7VooJ2hySWA6VXmusz
	 SAJN2f8Ll5UcQ==
Date: Wed, 29 Apr 2026 01:33:59 +0200
Message-ID: <20260428224427.597838491@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Mathias Stearn <mathias@mongodb.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Peter Zijlstra <peterz@infradead.org>,
 linux-man@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Chris Kennelly <ckennelly@google.com>,
 regressions@lists.linux.dev,
 Ingo Molnar <mingo@kernel.org>,
 Blake Oler <blake.oler@mongodb.com>,
 Florian Weimer <fweimer@redhat.com>,
 Rich Felker <dalias@libc.org>,
 Matthew Wilcox <willy@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>
Subject: [patch 05/10] selftests/rseq: Skip tests if time slice extensions are
 not available
References: <20260428221058.149538293@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Don't fail, skip the test if the extensions are not enabled at compile or
runtime.

Fixes: 830969e7821a ("selftests/rseq: Implement time slice extension test")
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: stable@vger.kernel.org
---
 tools/testing/selftests/rseq/slice_test.c |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

--- a/tools/testing/selftests/rseq/slice_test.c
+++ b/tools/testing/selftests/rseq/slice_test.c
@@ -124,6 +124,13 @@ FIXTURE_SETUP(slice_ext)
 {
 	cpu_set_t affinity;
 
+	if (rseq_register_current_thread())
+		SKIP(return, "RSEQ not supported\n");
+
+	if (prctl(PR_RSEQ_SLICE_EXTENSION, PR_RSEQ_SLICE_EXTENSION_SET,
+		  PR_RSEQ_SLICE_EXT_ENABLE, 0, 0))
+		SKIP(return, "Time slice extension not supported\n");
+
 	ASSERT_EQ(sched_getaffinity(0, sizeof(affinity), &affinity), 0);
 
 	/* Pin it on a single CPU. Avoid CPU 0 */
@@ -137,11 +144,6 @@ FIXTURE_SETUP(slice_ext)
 		break;
 	}
 
-	ASSERT_EQ(rseq_register_current_thread(), 0);
-
-	ASSERT_EQ(prctl(PR_RSEQ_SLICE_EXTENSION, PR_RSEQ_SLICE_EXTENSION_SET,
-			PR_RSEQ_SLICE_EXT_ENABLE, 0, 0), 0);
-
 	self->noise_params.noise_nsecs = variant->noise_nsecs;
 	self->noise_params.sleep_nsecs = variant->sleep_nsecs;
 	self->noise_params.run = 1;

