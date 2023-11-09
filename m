Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D340225D5
	for <regressions@lists.linux.dev>; Thu,  9 Nov 2023 17:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="TOtgBDuT"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 47491828550E;
	Thu,  9 Nov 2023 11:42:14 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id HGmKmO6yR_Pa; Thu,  9 Nov 2023 11:42:13 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 36A1A82858BB;
	Thu,  9 Nov 2023 11:42:13 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 36A1A82858BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699551733; bh=BSb8G/89k6d+INF4wHzHiyuk3ajTtOXXmCudkLNxbTI=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=TOtgBDuTLdEYrOm3suoxsXbSV0jtYOnDAkatwrouDxokNqqESXiqBze0pyckpBsko
	 53x+OXR8VYqprqWb1TcreJozggnSN+fRovz6aVtzDP82E9B9kFnRRmEcwWaSYPWbwY
	 6/g7I8SaEk1sr2Yk4KhRfZTQP6vDCJk+Tz1zv9Co=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wnsGujEfq7Yd; Thu,  9 Nov 2023 11:42:13 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 06664828520C;
	Thu,  9 Nov 2023 11:42:13 -0600 (CST)
Date: Thu, 9 Nov 2023 11:42:12 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <871420600.46050861.1699551732591.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <a262a91e-f2ec-402f-ba40-adacb76c72b9@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <9860f9b2-1d98-497c-9480-56852fda781b@kernel.dk> <1557819821.46044536.1699549241816.JavaMail.zimbra@raptorengineeringinc.com> <f4fffe29-7c95-4d22-918b-f2835fb76366@kernel.dk> <597693097.46047776.1699550641104.JavaMail.zimbra@raptorengineeringinc.com> <e3e1b31f-a9a0-4387-982e-aba6d9763c6b@kernel.dk> <1926532589.46050149.1699551411577.JavaMail.zimbra@raptorengineeringinc.com> <a262a91e-f2ec-402f-ba40-adacb76c72b9@kernel.dk>
Subject: Re: Regression in io_uring, leading to data corruption
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Topic: Regression in io_uring, leading to data corruption
Thread-Index: 5RQUGjKUm9+WJ8dKXcOdu4b8OTeRiQ==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Thursday, November 9, 2023 11:38:10 AM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/9/23 10:36 AM, Timothy Pearson wrote:
>>> Hmm ok, that is odd. How quickly does it trigger for you?
>> 
>> Almost immediately.  Third pass in this case, which is pretty typical
>> -- without any delays etc. it will normally fail in under 10
>> iterations.  When I add other delays in e.g. the worker thread it
>> becomes less likely to fail, but still fails.   Only adding the udelay
>> in the one specific (IRQ locked) location allows it to pass all 200
>> iterations.
> 
> What specific IRQ locked location? Hard to know where you are adding
> these things without seeing the patches.
> 
> --
> Jens Axboe

Sorry about that.  Here's the patch that automagically makes things work (bear in mind line numbers etc. are munged since I have a bunch of other debug stuff in here at this point):

 static void io_wqe_dec_running(struct io_worker *worker)
@@ -312,19 +326,39 @@ static void io_wqe_dec_running(struct io_worker *worker)
        if (!(worker->flags & IO_WORKER_F_UP))
                return;

+       udelay(1000);
        if (atomic_dec_and_test(&acct->nr_running) && io_wqe_run_queue(wqe)) {
                atomic_inc(&acct->nr_running);
                atomic_inc(&wqe->wq->worker_refs);
