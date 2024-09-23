Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D688197A87
	for <regressions@lists.linux.dev>; Mon, 23 Sep 2024 12:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727093031; cv=none; b=Pw7X7TFPQm59+u8bBU0+mUg/l4ZMCrhkOQMm7woSJn8ubKTsDKvXlFB0PCCqHgy44MKbN1T56Vcd0p9MKhMy24gRknIrJ0Tosm5jvaLjhl5xNGKlT6QBkgHVbBfXvF8X99Cx6csUKGIg9iiTWOZVb73DfhK73ubdxspWBlkQCwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727093031; c=relaxed/simple;
	bh=2Vb2Cv2Dv37X/Ids8L19JvM6vzYR+tLqulzI/IrwbfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A2auXjtvpiQd1oUZtm/9VVdtT9919XO6Pu9ADcRj3pnzoxTgaYfdQVGN9BCe/SHkcH3ERucKO4S1xfQg34Esi5CJFDX2asRI706igeJipWrqjahgkQcTJVUD4XOSrNKL+FGiHdJlzNeIKgMIr4wkHtq8mYBbZI2U6fW0Hi/zGnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyZMD+2f; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyZMD+2f"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e1a74ee4c75so3554107276.3
        for <regressions@lists.linux.dev>; Mon, 23 Sep 2024 05:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727093029; x=1727697829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDgplFVDTcPA7FhAL3SqKT1KaN8IQNqhOche9v7f6Is=;
        b=gyZMD+2fEhc2TJeZhWhfOZpAJrulDeehSXmFjdEgzLstnHWtIa+cjEWkg9IvMLTanO
         8QLZMq853V6ravxxU6VnXQe3ssbfqF4YAYdPQIC4JBKO1K9hiX2Lb/OFyeIQpPAvqe28
         ZErAtNgeGDIN4mnX3VDCCOI+hVoSWmHsLKs+sYIoUq3lpbUyyozdes4xD1/NG/pCZznx
         0a0GrqaMFRYlaDj61gHDsK2kDiVXs7dUhAnCTmD2AY+wDv6M1a99CXXyDa6cgBaW9kDS
         qxXoERSPZhYnveIUkl7z6S5TAYxsBuoRtlAnLI2z6lbdEbD9SG4Mcx0Xwr5rTMbXJvLp
         +MRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727093029; x=1727697829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDgplFVDTcPA7FhAL3SqKT1KaN8IQNqhOche9v7f6Is=;
        b=Woi4qnPvVEdxa5SamxwpkeWm+o91BuBWXyG+noJFs2oV2Tk4Wl4xHNoN4EAr0Tl40W
         RlzP0S25Co3F5th9Myo97p/1pYr+XGFJeTIbB/d+rjH+vNemVMkM3GCZpvXSknlsigeG
         J2Rx0w1zEPoQX9ajhQOyF82ylAc3vkRZ8+9d6mibC6yElANtI4zrsAqML+7iEY5QCSGP
         AMMdXf0RrFatYooMfkgewAEW7eY5eZY+d2VY+Kypx+PLn0GsMZM8MC4wlFyaX5uVu22J
         m/qpugt9VtFQwiqMohejRo7MHtChb+KTLMJ3Qix9dAjLI+wDoLpOPlAD08+DLtCbQPx6
         WkFg==
X-Forwarded-Encrypted: i=1; AJvYcCXJHE/9RSI7FJvfe2faYTvhDbb8RWaEQ3vY+emtDV8h1q0xLt3A68acAXQzaEQNPbApoE7m90/q1aqMqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQYYv0z9oTbhY2Ckfaql2JqdtEwc67ySxrhCWcn+9rJaSu05/3
	+TujcHYKiR4If77AmpuVyAK1IV3AMUE+iIu3y6hwOavQ7VQxIuAU
X-Google-Smtp-Source: AGHT+IFE91qwRy5TXm8qvsiN6PSwuYu09R8ZNvZiypUYOO86nm2CbYAASmOi5MZ6YSjoP243bxN7Qg==
X-Received: by 2002:a05:690c:7086:b0:66a:ba89:d671 with SMTP id 00721157ae682-6dfeeed1dd1mr84975457b3.35.1727093028967;
        Mon, 23 Sep 2024 05:03:48 -0700 (PDT)
Received: from borker.localdomain ([2605:a601:90ad:5400:5953:ee4b:cc9a:dd36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ddcd8ac3cesm28960767b3.78.2024.09.23.05.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 05:03:48 -0700 (PDT)
From: Parag W <parag.lkml@gmail.com>
To: hannes@cmpxchg.org
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	peterz@infradead.org,
	pmenzel@molgen.mpg.de,
	regressions@lists.linux.dev,
	surenb@google.com,
	tglx@linutronix.de
Subject: Re: Error: psi: inconsistent task state! task=1:swapper/0 cpu=0 psi_flags=4 clear=0 set=4
Date: Mon, 23 Sep 2024 08:03:39 -0400
Message-ID: <20240923120339.11809-1-parag.lkml@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240922102047.GA437832@cmpxchg.org>
References: <20240922102047.GA437832@cmpxchg.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FWIW, moving psi_enqueue to be after ->enqueue_task() in sched/core.c made no difference - I still get the inconsistent task state error. psi_dequeue() is already before ->dequeue_task() in line with uclamp.


diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index b6cc1cf499d6..748143d2c218 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2012,16 +2012,16 @@ void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
 	if (!(flags & ENQUEUE_NOCLOCK))
 		update_rq_clock(rq);
 
-	if (!(flags & ENQUEUE_RESTORE)) {
-		sched_info_enqueue(rq, p);
-		psi_enqueue(p, (flags & ENQUEUE_WAKEUP) && !(flags & ENQUEUE_MIGRATED));
-	}
 
 	p->sched_class->enqueue_task(rq, p, flags);
 	/*
 	 * Must be after ->enqueue_task() because ENQUEUE_DELAYED can clear
 	 * ->sched_delayed.
 	 */
+	if (!(flags & ENQUEUE_RESTORE)) {
+		sched_info_enqueue(rq, p);
+		psi_enqueue(p, (flags & ENQUEUE_WAKEUP) && !(flags & ENQUEUE_MIGRATED));
+	}
 	uclamp_rq_inc(rq, p);
 
 	if (sched_core_enabled(rq))
