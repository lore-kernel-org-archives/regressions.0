Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976539;
	b=dX+aeN9Z4jht63isY2L+xQ4UK3usdwLU1iqL+unpkO1Fywt/r7+TueAuTbv7+EAqw54p
	 dJsByWbBkNKwLckOrII1HBwCdNpEQjmhjt547olqhFKJJQboIBu9oq85PTIt81ZBffAoF
	 dH5wSlVCcN5WEiO0Bo84gcs8AzxBskGNwJwd/xelaTlsuhLhh+KJW094/CqOZl4+4Eiij
	 XIbQQ/Pq2HZJVpLqHxyO6a82IZaTLrCk41iJzK+K7exmNYwW2bCjG3Q+FBQToq8vBLBZ/
	 53jOKHlPAMkXzWBCiiNWR4gvLh0y32guyFhUdLRJo5y/p9ZG+gZNXj0fHHXv4usl3Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VjjpT/WS6GzMNNn96hvzrrjqoEJgWtlxD5KPXsnUWGQ=;
	b=3nVWe2Vj8Lz2nEcm+neUg+WGcx4c9fcKFTD6cnYgziO/CwX3jQdZ0Alfjnz1zGjsN2SD
	 GU1i9TBB1Pr3WOQ9FdG1C8vX2vvq5G1Lftcc56YD5hnm5uozrrNxAMMnLWISP+Vk8CeZL
	 Rb9Ik+tO20DYTLvaSVH93tnnxa0s5F6lFZg7oSMQtKcOzldIKaO9t04RWYGDkstltrQO9
	 3859xksIsOzG3koW4kP3TFaMuWOLxWbQb5lFaE6jFR+wnaqEhq1edy+XuR7siaqC4D1DV
	 ziYc5HBxzhCOLOt5Waq1bR4CrNwt9fAXupBz3OF3W0UMEqhNPRUaR6kNC77e4PBO3ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P7QCiv2U;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0A5606A31D
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 01:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA0A5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P7QCiv2U
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so8092215e9.1
        for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 18:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792976537; x=1793581337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjjpT/WS6GzMNNn96hvzrrjqoEJgWtlxD5KPXsnUWGQ=;
        b=P7QCiv2U2un2PMv+Yvdb6Ub21zi6/+5ZqpPB5kaF+gqdZuFOWzbkuS7bvx8rfsSw7u
         93dqFvlpnDAGNRPl483VaLOYdoDA3RNUAgauODDzj4hBy45IgpSJfMbp9p8eZN181dn+
         kbgKBpq+MbZQ7cVM4Ufdp4YzkXmh2Vpfn+1bwgYTWFJcZvecN99fmSTic0mADi+xGVI9
         C/9HQwpdybGBp2GRsiCIP5yiWSMdfcAMdLynn+08lfq3E661cIEqnBbycJnLNfwEmWE3
         iPwfODYE3OdSUHhXjZWo5gdbuYvqqzZRjWAD50t6WypY6KEmud8vH5jm6p6TqovpyNM0
         //pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976537; x=1793581337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VjjpT/WS6GzMNNn96hvzrrjqoEJgWtlxD5KPXsnUWGQ=;
        b=aRZRIRwWeBBbwgTIX7JVpiI5Hnrcra4WZ1qtEsyARZj09KBPDLQbB8rphZo5sDVg4V
         S2pRH6OKiY0OastkSO8iDBVChh6i++QdRlgpvMMOKQlb/pCLSiie4gA81Ijn+PxuAce5
         7ySvD+oQF3/3OqqAqsfs2vmMV1Sej2shjJddFLQ5W32UlRcQspHPUST0HXqEZwilmY8i
         n0NwpZAaMXBIS5W1arM8NHa5aLcAoCC1UU5KvWuQH67vwERMBQsDx7998lQgMskhhyme
         qqRJMw2Y6JxSTzN+M+w93zla3dlFTJzDAhs1YV1/rqHYERD03+PHeHu0Mr7hempKc7tR
         zUBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtabee9Ox0kJ7kt9vlyt/yNLd5oNQYdvSmq7wzIyR/qZeOsH02lCsm155IMc5qdTTAAIKGqboRH2Jdrg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIvB8ZSAPIsC0pxuJ2kpi+tYJCundLZIJqIqdj7AL6zXMsJP49n
	hhaITnDnAmPyu6RgTp7u//oHREZ6bUZQ6hYAQznzHM/Kc+2HZyehesW/dmE7qw==
X-Gm-Gg: AYBFou1w0DLAFAdX3qe8BxIJx9ixHm/HMlPVHzqAJxege1NXc7i8TCiiqnqyQ/dJGSw
	DjAwIFIss6XhAkINV0uQyARNgn7bga+xK0gOa0IV+/+fWmE4DRf/BlH5q01SsKcmu2RJks/rCBg
	9tr+7ENdcYUCSilpT0NQfOoRKZ5Q5MktWPqO/vJP2W0/ETQEk2LBCtKRrIIjwnM86hq7IMrzTL1
	Jx3El1N3JyHmYgxAYGyRY1aUMorL+tRVpj0seqDca7QrW+PsG2by67/7/ezM/3mgiN24O3c0EfC
	9lim0EGcKTVOU7xh4JziYUUjCCY4n5zemaksWMFSFsPgCdiZqSw3gk/YMX1CS22TvKYFGF9XfCW
	4hnXB8DVhkeDZ5wksoYbfTLd2j4xzo846aIBX3vh8hFkwEU2MbflUTR+rDK0VpkDuvHKc70DTB7
	WpI4vZ2tyxminITIFflGQfB7g649/mxfHU4aP9TqdzkvSlOPDWFHYeilS8PtLNyv1cpv9HwW/uZ
	tX2UUWO6b7hPbCMhBcAnFdvtijWuF1wT2Hp9A9TDorJhtl+UWkFKeeaxTXDVYBS/kQONTp/RY6X
	ltsI6XYEzF/0xWXz28uu/2X+Y0i3h2sDfYXWeeu1XV2vIpBZDpH/MlYlxn6KWAp7np0cXWRUwX0
	gYuZqHzXWKvo4NYZfxX2Ofw9eW3a4Fw3aB81+vm6UIjOiqNdbg/1PWxD4iA==
X-Received: by 2002:a05:600c:3148:b0:4a0:1efa:c74a with SMTP id 5b1f17b1804b1-4a35ac96da9mr81454535e9.20.1792976537008;
        Sun, 25 Oct 2026 18:02:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a9cc-4401-09c3-9199-30c4-c6a3.310.pool.telefonica.de. [2a02:3100:a9cc:4401:9c3:9199:30c4:c6a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd354asm12325195f8f.43.2026.10.25.18.02.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 18:02:16 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Jiri Wiesner <jwiesner@suse.de>,
	Daniel J Blueman <daniel@quora.org>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] clocksource: Prevent immediate watchdog rerun after a delay
Date: Mon, 26 Oct 2026 02:02:00 +0100
Message-Id: <20261026010200.96371-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <874ie9zc3g.ffs@fw13>
References: <20261010065509.72916-1-kmehltretter@gmail.com> <87a4oeerwm.ffs@fw13> <atmhdRzqx5t8PYrc@gmail.com> <874ie9zc3g.ffs@fw13>
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

The watchdog rewrite made the clocksource check handle long intervals
between two measurements, but missed that the timer expiry needs to be
rebased after such a delay.

When a watchdog invocation is delayed by more than one interval, adding
WATCHDOG_INTERVAL to the previous expiry leaves the timer expiry in the
past. That causes an immediate second invocation. The resulting short
measurement interval can mark a clocksource unstable.

Cure this by rearming the timer based on jiffies, which places the next
expiry one full watchdog interval into the future.

Fixes: 763aacf86f1b ("clocksource: Rewrite watchdog code completely")
Closes: https://lore.kernel.org/r/20261010065509.72916-1-kmehltretter@gmail.com/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
The baseline and patched builds used identical configs and initramfs
images. Tested on v7.3-rc5 (72d3fcf802c4) with four QEMU 8.2.2 TCG
vCPUs. PTRACE_ATTACH stopped only the vCPU 0 TCG thread for 800 ms,
six times 12 seconds apart per boot.

                              baseline   patched
TSC marked unstable           2/3 boots  0/3 boots
boots with gaps below 250 ms  3/3        0/3
minimum watchdog gap          0.231 ms   505.484 ms

All 18 injected stalls completed for each kernel.

 kernel/time/clocksource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index f1253f5795c6e..58c0ca11cdc5a 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -673,7 +673,7 @@ static void clocksource_watchdog(struct timer_list *unused)
 
 	/* Could have been rearmed by a stop/start cycle */
 	if (!timer_pending(&watchdog_timer)) {
-		watchdog_timer.expires += WATCHDOG_INTERVAL;
+		watchdog_timer.expires = jiffies + WATCHDOG_INTERVAL;
 		add_timer_local(&watchdog_timer);
 	}
 }

base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
-- 
2.39.5 (Apple Git-154)

