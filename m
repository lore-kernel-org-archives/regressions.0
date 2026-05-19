Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B36F314B62
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 02:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779157473; cv=none; b=BIV4ypuIFaHBWZYa5+ZDYgLHAZdXD/H586ModyK46UAHDPFCu1Mwc+DFxIivo23ErtwTswfOMN6QlYeVcIEdevdq2n0J+I8A9RppCKQDz/iMXiuutjuy4YAoErc2Bm2DxVjOePsXo6QDlWTL+E9ZBTIQ2wYLEwslYG398vfEkAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779157473; c=relaxed/simple;
	bh=NADwrGOVcc4FjQYywWuWugOChYFB0Dkz+W/ArfLZ0PY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnmJzdpVCj8Ap+Z/zYzwqBn8aq4/CnVGD6E9dgXWEU98pEZzva0iP19vUwB4KuyrnaGYAqOvWPBUACwD4u9SH2qrLMObMOQs5jfjs08mq9cdi/SY07La9NAZnxOmQic7fD4Er+eEzokkoz+nhmbPBG82lWrfZqFjof7Qqp/thf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=el50DyhT; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="el50DyhT"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso2305924eec.0
        for <regressions@lists.linux.dev>; Mon, 18 May 2026 19:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779157472; x=1779762272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqlrn3+hTvrRB6nPsNJHnq1yi6Gz0E9UU0IYHYA6w/k=;
        b=el50DyhT9FhlAQkv6cCGo7MJ7SCknMviT9vUh/DAww++PcABw7niFsMsceLEpWDpLb
         iHP8e4I6c3Ieze3j3sXnoBCKgggwEiOXW5Mr2IWoV+X3qb5G6bye0asx23XKm8NiwJvG
         yyvwZuZgL8bpRRqyJe+bJ1E45Xb37mXQuvzQY6U9n6rZb73fue2vv9fEBA4kfJB5+8N0
         8BzNv/dFqcI93Ho+gCzgyS7+h4O9l/7CkyfWEV6tso6e0uMjrdufDCHNvr0LZso/sjNj
         6fbKWSdmx7tK3NFShwFcD3H0XkBCQGCBAx6yAFzaeGve9cCpkXhMkBHC9WfA+arHDg0C
         QiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779157472; x=1779762272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eqlrn3+hTvrRB6nPsNJHnq1yi6Gz0E9UU0IYHYA6w/k=;
        b=mHt3rVGGv1PlsCnPOEgbdgMXK5w2G83poWK7pXU+FuDq5U49EghJT3QcjOrckzbVuq
         ZuTB3s+/uALl8efBtNUw2hVEwFyjJHe7lEkW9qn90c/MLZuFnPdwCKUB40lEpo0P8ZcH
         9Q8qMvQJho5XkP+c3ZnuKDnEASoum5lxOBf4Re2Ird6dzOJWEcWcRI1hBn3I03K/SS7F
         NbAyThSin4j2m7pvKxbrRAPatGyDbMlCr/umaJA1oyHUT9r/ysmtdTGS++ergmB5WCVe
         MVZsy1S6mN4p7q/jMZqOoXTrEr70gZFMQdI6MwXJv+DoVE3b9xc68DHc5Y5E+dpSQZ59
         6G0A==
X-Forwarded-Encrypted: i=1; AFNElJ/dS19VHTb0hIi/uORVlUFE3mmVcUe6kDNnGiFucvPMcPb7iF/KrDEJIXrmkWuGUhXPnh595mBmIwghiA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWjmLALsp68KIqo9ltkMnvK2v8U5mHWSY6erER4HK53nSR2mBr
	ln1TT5iXEG80sdXSPeqqj2UMMZ0GELLL2OHVYtajWA5j1C2D8B2p9coY
X-Gm-Gg: Acq92OFn06MGS2ZAGBPRlfLKl3kk3CgJWrDV+Mi07HKfF6lSiRgEMCjNBr80BBpYVFY
	7FN1NcRLeQ901uC49pPvzRzVXon10cWAUcVdEASDmx2kPt87qosc9DSuRlkSZ0D4vXW9c8H31fL
	zLCUSQ8Lg5V1BKUPg0IJljivbIzgw/TV5jfJM4zXBZ3qTdHhatjOKWUtyK0px+uGwgHvfNgisnn
	QmyFA2QMkjADKLLOQXxqET2dbWc6iAapxcWhzU/hJVfVtDM5lXKXw07EG+oH2N+c1loTK6NecdK
	LcpmYow9HNIwFguMkwha++Lhjaav1C5RZtHXQ+bgpQmfRBE3nhQGwmLNmxjfgRgFiq5epeaYeLa
	8cMwJrPsbVd/kIVbP645N3wJq7glnc0/8m2U5Adq8YZrdU32pb5TS33+ifR9I7Ms/BV/AqhOULt
	6/pgIoHy10fREu2A/Btl4lNzV8u8Qa9MOJHYV0TZoystCi+Zk=
X-Received: by 2002:a05:7301:2c8a:b0:2f2:32bc:787d with SMTP id 5a478bee46e88-30398637044mr7365399eec.23.1779157471451;
        Mon, 18 May 2026 19:24:31 -0700 (PDT)
Received: from s7t7-debian-test.local ([67.170.89.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294adddaasm15104386eec.13.2026.05.18.19.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 19:24:31 -0700 (PDT)
From: Tony Rodriguez <unixpro1970@gmail.com>
To: davem@davemloft.net,
	sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	andreas@gaisler.com,
	tglx@kernel.org,
	thomas.weissschuh@linutronix.de,
	regressions@lists.linux.dev,
	glaubitz@physik.fu-berlin.de,
	linux@leemhuis.info,
	torvalds@linux-foundation.org,
	Tony Rodriguez <unixpro1970@gmail.com>
Subject: [PATCH v2 1/1] sparc64: Fix comparator problem with timer interrupts
Date: Mon, 18 May 2026 19:24:09 -0700
Message-ID: <20260519022421.5978-2-unixpro1970@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519022421.5978-1-unixpro1970@gmail.com>
References: <20260519022421.5978-1-unixpro1970@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


On SPARC64 the check:

    return ((long)(new_tick - (orig_tick + adj))) > 0L;

Is safe only if retries make forward progress. The comparator can
take effect with a latency, so the moment when counter == comparator
may be missed, which can cause delays or hangs on some SPARC64 systems.

For clarity:
    exp = orig_tick + adj   /* expected comparator value */

The current check requires new_tick to be strictly greater than exp;
equality (new_tick == exp) is treated as not yet passed and the caller
will retry.

By contrast, using:

    return ((long)(new_tick - (orig_tick + adj))) >= 0L;

causes the caller to stop retrying and assume the timer is scheduled;
both equality and greater-than are accepted (new_tick == exp or
new_tick > exp).

Signed-off-by: Tony Rodriguez <unixpro1970@gmail.com>
---
 arch/sparc/kernel/time_64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/sparc/kernel/time_64.c b/arch/sparc/kernel/time_64.c
index 87b267043ccd..783b60e547c4 100644
--- a/arch/sparc/kernel/time_64.c
+++ b/arch/sparc/kernel/time_64.c
@@ -146,7 +146,7 @@ static int tick_add_compare(unsigned long adj)
 			     : "=r" (new_tick));
 	new_tick &= ~TICKCMP_IRQ_BIT;

-	return ((long)(new_tick - (orig_tick+adj))) > 0L;
+	return ((long)(new_tick - (orig_tick+adj))) >= 0L;
 }

 static unsigned long tick_add_tick(unsigned long adj)
@@ -277,7 +277,7 @@ static int stick_add_compare(unsigned long adj)
 			     : "=r" (new_tick));
 	new_tick &= ~TICKCMP_IRQ_BIT;

-	return ((long)(new_tick - (orig_tick+adj))) > 0L;
+	return ((long)(new_tick - (orig_tick+adj))) >= 0L;
 }

 static unsigned long stick_get_frequency(void)
@@ -411,7 +411,7 @@ static int hbtick_add_compare(unsigned long adj)

 	val2 = __hbird_read_stick() & ~TICKCMP_IRQ_BIT;

-	return ((long)(val2 - val)) > 0L;
+	return ((long)(val2 - val)) >= 0L;
 }

 static unsigned long hbtick_get_frequency(void)
--
2.53.0

