Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388CF33ADA3
	for <regressions@lists.linux.dev>; Mon, 18 May 2026 23:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779148610; cv=none; b=KFsEHbEYt4d+yuD/rfsEewYyiSXfHUjjtnpOehqr9pPY1+389hbDzPLfTT/99NU3GyY6O6r4M7czlJGkUetgDnjB3zEUn7AiC7ePv8NgrKZEzW14xDohP78LEToPzY/AdakctehgSjVKu0EGA44JnhGA4+aMJAH6toENpPPDfDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779148610; c=relaxed/simple;
	bh=GaS4Ko50/fcvGwi7jfjzVijI3Xzh0Js36JrNYZOR7To=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VgatcxpmHxGMUopTMFbJ0IoQeI4/arFm/fIcgED66xoZncRWrzvNEFUc4jZhaGwitB62tm4aURapdqivLDnE2GLBZxQA0IIkwRH7pRn2sgQbGFmh9EH9kYpxvLkajZ3pqVEL8MJmop3h57oo9mgFWLFuMPWQL63ynj8VA3ojyGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCch04Ps; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCch04Ps"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-134fe980658so3733730c88.1
        for <regressions@lists.linux.dev>; Mon, 18 May 2026 16:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779148608; x=1779753408; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/re5UGXJXnbUiTOLP9irqWGJnT3W7803B73Ky28WmY=;
        b=LCch04PswKVD/YOzUH6eQMWANgYS3QvjaMusLDH1KZb9HTa2OEs8Nd3+MRwgC7SfJH
         vvhs8+enEAfKpdCKgsj48gZ0IEefe41XKgyTAMjaiR1WDIOWvB1s5AQW2Rt4ZPkYoDiv
         SdFZk/zRZd5l152EoMdgo2TcoQDm5XB9lKG2lpA1b2ZuKxp9Ci1UTmW0eG0IFLq1Xaga
         kv47NxAQn4MuVgol8UfMNfDnklodTvzhcgjWDevaEgrJDFCUvYUdmPEVN4zW8ie6SJVE
         4+ecj4P2bZH2W5C5uzlqAv+DSfbI7ahhNiTeeB1kPsEMyBmrvtOdZtfzl648Ic2HZOux
         B7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779148608; x=1779753408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I/re5UGXJXnbUiTOLP9irqWGJnT3W7803B73Ky28WmY=;
        b=JkLafgSH2YUx3UTw84DOM+NU+iwHqs4H9/+V4yigv+44tQS1aKAR+ArRIefRhi9Cei
         6j0zBBii3Dlq7ygMjskqpuoCM5VrSYn2EAXZhMRv7djuyXqxy9uD8BwGBqMalwAV00Rs
         2UYXHw+FBMOwFBJoCYZDQQKCA7cBTYvc61kIwg6yIsNSGsv/3KmKZTd9ZmVgDnCeAq4y
         BZYOZ9fzBrgIYngDfC81oicoiXNm5JQ2njxNXsg2rRAgJDY/wBOqkSSqmBo++PMrWMLW
         LyTcLP+1OinpncLwmjJgoSrx+RTNLBm0axpADe+tUJJHWw8Txuo9ZAAZE4llWeglq59t
         Y+ug==
X-Forwarded-Encrypted: i=1; AFNElJ/v/Nck6/pUtT8hv290N7Mn5mCV5/YMlTrCNbxgyURJKfOseC7lfn40/FF1yA2jbGW8rfhRC88dwZ8YtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeZlhmseH0UVc3wdhubriV7gICJLSOJVvAhtiIB7pZDzFyFL1U
	JWdvIKGZ97ITpuOJm2QT700URUN1NfjEFpISvR+n/WVpmJCCoN5deqSG
X-Gm-Gg: Acq92OE1WJSZ9A9rbwhts6zgn9zAYgXDdEWBqPfEMaaC4p38LNfbRbgN2JPjRLtDFTD
	5TTAqk17mzl/E5QuJHVkIqHRSSzhWSZu9FEmstqmUEMGx+X7pgSJK+wUB674PJQX0qanHgZ88Fi
	eThRPIfJ0xrSh6y+k8gk7+ZlU0Km9D6kGqpJPfrq+Yn41rkAtaoeDjUzPubyhL7lGx/iIepl9Zy
	HOoShHB4+R8ll02z3SDn/ZN8gRdXVyd2tOtrf5mlR3ajq/QPlMNMEC/lyAoyOw3eEyDHFbMuaGh
	FvSMjC5IJHPv+ac6DNZ9IqDM3S448RPKN0eP5aKs67uBo8aBcJG+dG8zxo8NKaJ46frAP8oCqmy
	pYPmMl98kHNe2YqluKDWM4bwen17wYHgGGgD0dFUSnt+VOIQSAUL4pmGJm95Ej2N44N+ez+CLXV
	BIH1ObpsZpYhqWJP9y87g16eUrxo/iNF0UJq9o
X-Received: by 2002:a05:7300:a94b:b0:2ed:a64:a457 with SMTP id 5a478bee46e88-303986552f6mr7440960eec.20.1779148608109;
        Mon, 18 May 2026 16:56:48 -0700 (PDT)
Received: from s7t7-debian-test.local ([67.170.89.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294500726sm14141408eec.10.2026.05.18.16.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 16:56:47 -0700 (PDT)
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
Subject: [PATCH 1/1] sparc64: Fix tick/stick comparator equal-compare hazard
Date: Mon, 18 May 2026 16:56:03 -0700
Message-ID: <20260518235632.5122-2-unixpro1970@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518235632.5122-1-unixpro1970@gmail.com>
References: <20260518235632.5122-1-unixpro1970@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On SPARC64 the timer interrupt is generated only when the counter
equals the comparator (tick == tick_cmpr). There is a latency between
writing the comparator register and the comparator becoming active.
If the counter reaches the comparator value before the comparator is
armed, the equality moment can be missed and the hardware may not
generate the interrupt.

Previously the helper treated equality as success:

    return ((long)(new_tick - (orig_tick + adj))) > 0L;

Here `exp` is the expected comparator value (orig_tick + adj). If
new_tick == exp the code considered the event scheduled, but the
hardware may already have missed the equality window. Treat equality
as failure so the caller will retry with a later expiration:

    return ((long)(new_tick - (orig_tick + adj))) >= 0L;

This prevents missed timer interrupts and stalled hrtimers on affected
SPARC64 systems.

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

