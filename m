Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945353E1238;
	Tue, 28 Apr 2026 23:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419221; cv=none; b=r3g9lbYzoUB072Xke707pO46HlpkbVKOflhwm30NnYud4r7KNcv8ME7kB+hVynYMsl6TqPSv3qrzdpbDRNGCY1qP0UyvXS2Ylc7TzSzRF+s2vVZLLoEAsTDwnVlw90HDJKjcFnpTlyHRu4UuQ/giZeL/R4bDbJngKRjQfkYZ0mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419221; c=relaxed/simple;
	bh=q3X1KnnfJZ02/srklaWib7iUNJBMrUyFhloVAzkIzUQ=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=dN6OGaXMhwGGzWN7k/kaQfHeUZhx/7mG02eh0ecGI3gsaHpLj0DxEgbqTv5153GuXch6rnclGXlzSsFpCX6lW16LELdQxq+FJuSWrZeyaUcAKJfpQ8LaVzrHx8Q5tcDe6l4dBNUEeoHci2pxkxS4c7xUV9MLcko6Kldp4DECOGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhhbH8P1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhhbH8P1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788CFC4AF11;
	Tue, 28 Apr 2026 23:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777419221;
	bh=q3X1KnnfJZ02/srklaWib7iUNJBMrUyFhloVAzkIzUQ=;
	h=Date:From:To:Cc:Subject:References:From;
	b=VhhbH8P1cmP2mjIrXrURDBFguhE9B9ClrwDfZstdNKJxYJ7dhN0JS2fg86ljsosaK
	 0mi8nT/DoWFrEinj/iHyqmguwZWU0DTr7Y+V7sAjELW1YnsF1uaP2DKeZDTYOxw3nc
	 sChfejL9gQfNUdKmFCZquCmiLDBE+UQ4lKcww93W37pXf+BkSsohiG5nCoTtJfpHWB
	 TC3y5q7jDDBb9p0TzqqjACb2Cwk2aE9zHg7OZ05ycdiSw98Zs3m5ouyPGvXd8MRltK
	 4KMEfzt0wFhGLzFa50rt6IGCUnHYzKLOS4F6KACTD2CLs6JkYICd6EiDPMvr2x8VAj
	 sPQ6BZcH7+nFQ==
Date: Wed, 29 Apr 2026 01:33:37 +0200
Message-ID: <20260428224427.271566313@kernel.org>
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
Subject: [patch 01/10] rseq: Set rseq::cpu_id_start to 0 on unregistration
References: <20260428221058.149538293@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

The RSEQ rework changed that to RSEQ_CPU_UNINITILIZED, which is obviously
incompatible. Revert back to the original behavior.

Fixes: 0f085b41880e ("rseq: Provide and use rseq_set_ids()")
Reported-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: stable@vger.kernel.org
---
 kernel/rseq.c |   20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -236,11 +236,6 @@ static int __init rseq_debugfs_init(void
 }
 __initcall(rseq_debugfs_init);
 
-static bool rseq_set_ids(struct task_struct *t, struct rseq_ids *ids, u32 node_id)
-{
-	return rseq_set_ids_get_csaddr(t, ids, node_id, NULL);
-}
-
 static bool rseq_handle_cs(struct task_struct *t, struct pt_regs *regs)
 {
 	struct rseq __user *urseq = t->rseq.usrptr;
@@ -384,19 +379,22 @@ void rseq_syscall(struct pt_regs *regs)
 
 static bool rseq_reset_ids(void)
 {
-	struct rseq_ids ids = {
-		.cpu_id		= RSEQ_CPU_ID_UNINITIALIZED,
-		.mm_cid		= 0,
-	};
+	struct rseq __user *rseq = current->rseq.usrptr;
 
 	/*
 	 * If this fails, terminate it because this leaves the kernel in
 	 * stupid state as exit to user space will try to fixup the ids
 	 * again.
 	 */
-	if (rseq_set_ids(current, &ids, 0))
-		return true;
+	scoped_user_rw_access(rseq, efault) {
+		unsafe_put_user(0, &rseq->cpu_id_start, efault);
+		unsafe_put_user(RSEQ_CPU_ID_UNINITIALIZED, &rseq->cpu_id, efault);
+		unsafe_put_user(0, &rseq->node_id, efault);
+		unsafe_put_user(0, &rseq->mm_cid, efault);
+	}
+	return true;
 
+efault:
 	force_sig(SIGSEGV);
 	return false;
 }

