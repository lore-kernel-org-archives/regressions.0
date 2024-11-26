Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555091A260
	for <regressions@lists.linux.dev>; Tue, 26 Nov 2024 06:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732603961; cv=none; b=lck+1FM1x4px3NWAPS3uXcSy450WL6ta+VtTs3JoBUiFcSMLzviEfpLqH4YxcTgHsknHXd9EfqMqlVqYFYiuNHmHzPXLFRb+tpmXgFwzwqRPzO7sj1y07hlF5DJ9MDHFKwENHGkCj1u1mkW3+CAqhurOCcOks2KqhmYkfomP1ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732603961; c=relaxed/simple;
	bh=fZ3MdI0uHsT8GRAXYo0ivhqyqC0NqYb3/xfCtKxRiJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z67yDxDGxBc/xfuKez1nL/hk4xUqsKpR36QJF7Ik1B/yFyCsD32dnukjM+dsZZkNQi7q/kVcNsYIFwRUUTmXA2DvqMauan4I5NLp6749kNJd37lWxw5BbkrQ3WmvO3rYnag7A/504ATP3tIx+XtaqE+q+DIJ6xk4+p+p0nEB/gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id DB08668D80; Tue, 26 Nov 2024 07:52:28 +0100 (CET)
Date: Tue, 26 Nov 2024 07:52:28 +0100
From: Christoph Hellwig <hch@lst.de>
To: Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: hch@lst.de, LKML <linux-kernel@vger.kernel.org>, axboe@kernel.dk,
	bvanassche@acm.org,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-block@vger.kernel.org, semen.protsenko@linaro.org
Subject: Re: [REGRESSION] ioprio performance hangs, bisected
Message-ID: <20241126065228.GA1133@lst.de>
References: <CAP-bSRbCo7=wfUBZ8H7c3Q-7XSG+SB=R4MHHNNGPvBoinsVSZg@mail.gmail.com> <CAP-bSRab1C-_aaATfrgWjt9w0fcYUCQCG7u+TCb1FSPSd6CEaA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP-bSRab1C-_aaATfrgWjt9w0fcYUCQCG7u+TCb1FSPSd6CEaA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Nov 25, 2024 at 05:16:39PM +0000, Chris Bainbridge wrote:
> I did a bit of debugging.

Thanks, this was extremely helpful!

mq-deadlink not only looks at the priority in the submission path,
but also in the completion path, which is rather unexpected.  Now
for drivers that consume bios, req->bio will eventually become
NULL before the completion.

Fortunately fixing this is not only easy but also improves the
code in mq-deadline.  Can you test the patch below?

diff --git a/block/mq-deadline.c b/block/mq-deadline.c
index acdc28756d9d..91b3789f710e 100644
--- a/block/mq-deadline.c
+++ b/block/mq-deadline.c
@@ -685,10 +685,9 @@ static void dd_insert_request(struct blk_mq_hw_ctx *hctx, struct request *rq,
 
 	prio = ioprio_class_to_prio[ioprio_class];
 	per_prio = &dd->per_prio[prio];
-	if (!rq->elv.priv[0]) {
+	if (!rq->elv.priv[0])
 		per_prio->stats.inserted++;
-		rq->elv.priv[0] = (void *)(uintptr_t)1;
-	}
+	rq->elv.priv[0] = per_prio;
 
 	if (blk_mq_sched_try_insert_merge(q, rq, free))
 		return;
@@ -753,18 +752,14 @@ static void dd_prepare_request(struct request *rq)
  */
 static void dd_finish_request(struct request *rq)
 {
-	struct request_queue *q = rq->q;
-	struct deadline_data *dd = q->elevator->elevator_data;
-	const u8 ioprio_class = dd_rq_ioclass(rq);
-	const enum dd_prio prio = ioprio_class_to_prio[ioprio_class];
-	struct dd_per_prio *per_prio = &dd->per_prio[prio];
+	struct dd_per_prio *per_prio = rq->elv.priv[0];
 
 	/*
 	 * The block layer core may call dd_finish_request() without having
 	 * called dd_insert_requests(). Skip requests that bypassed I/O
 	 * scheduling. See also blk_mq_request_bypass_insert().
 	 */
-	if (rq->elv.priv[0])
+	if (per_prio)
 		atomic_inc(&per_prio->stats.completed);
 }
 
