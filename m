Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A6E38B15E;
	Tue, 28 Apr 2026 23:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419227; cv=none; b=bLC8zUmtMP9c9SSFvpNVgbKihIMgR3AEifZYgO/HgiGOYx51QTDnMbTUZI3LvvkrBNhbP955GN2J6X/kxnjtgrsiX1C+uoaSvTFgYXdmjutaBHz+lruPSEgCDr91xWrjJ9i+l7oXRjqUNs+prlDr5dU9P/pJyR8GA2f9AfXFOMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419227; c=relaxed/simple;
	bh=tQN6MWf/5YWMmuXTo+JR3VXnNeV3GXdK1CV+HEyv1Sw=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=K7AOzKoNPpQnwKwvkSOOklx2gwrKDTp2iJaqAScTmxMALb0YDEvYE5yO2yVFiTeuMPfoPYcHt6lcrTWOWu1CjL63WdjNzYLCIld8JPhi2t/+WiRmLPIxp3vQOYl0nAM0wVWHIWgn/MzkwDE5/rLmtk12Qe4ibBqYVbLWyFD65WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcAO8V9M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcAO8V9M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8A4C2BCAF;
	Tue, 28 Apr 2026 23:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777419227;
	bh=tQN6MWf/5YWMmuXTo+JR3VXnNeV3GXdK1CV+HEyv1Sw=;
	h=Date:From:To:Cc:Subject:References:From;
	b=rcAO8V9M6pHxogbzH/vEAUnm9iBn4dhcb3Qh27EtC2mnGV3PA+2AxS+FGbGa6YG92
	 GJqSPzRFJZifw4s56LTPGSMu8cDDZfeZePXfFxBH60Gr+UtZeDMSGenBO0l3IzIRHu
	 ePnVt6q73yU2nXxZKkRTesQfM5vLuau3qv1Kn0QSGkspzyCoYVcD7OgmlfbFARju7x
	 pIZL81DIiogyx+0Ej9yGY5RKA9qxYQHlzwUTdBNK58KzVstr1E4cHBljXHNtn3L6bz
	 EAwK9DLBxhebYmf9PQ2x27fnWDGTPmb7Dwf0VtdzNXRDfAceO3gX4FdHls8Oz8iKp9
	 +nFRL3/atVvCw==
Date: Wed, 29 Apr 2026 01:33:43 +0200
Message-ID: <20260428224427.353887714@kernel.org>
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
Subject: [patch 02/10] rseq: Protect rseq_reset() against interrupts
References: <20260428221058.149538293@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

rseq_reset() uses memset() to clear the tasks rseq data. That's racy
against membarrier() and preemption.

Guard it with irqsave to cure this.

Fixes: faba9d250eae ("rseq: Introduce struct rseq_data")
Reported-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: stable@vger.kernel.org
---
 include/linux/rseq.h |    1 +
 1 file changed, 1 insertion(+)

--- a/include/linux/rseq.h
+++ b/include/linux/rseq.h
@@ -119,6 +119,7 @@ static inline void rseq_virt_userspace_e
 
 static inline void rseq_reset(struct task_struct *t)
 {
+	guard(irqsave)();
 	memset(&t->rseq, 0, sizeof(t->rseq));
 	t->rseq.ids.cpu_id = RSEQ_CPU_ID_UNINITIALIZED;
 }

