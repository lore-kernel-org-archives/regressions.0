Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2C5C121
	for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 05:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="Y0T9qWKJ"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id E285882854A4;
	Mon, 13 Nov 2023 23:06:47 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Z_2-KCm5KkmP; Mon, 13 Nov 2023 23:06:47 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id DACCF82854A7;
	Mon, 13 Nov 2023 23:06:46 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com DACCF82854A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699938406; bh=th5izTiDGFrsRGkZHv6+S4V12NcrwhtKiPFWlqHM3Pk=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Y0T9qWKJirFWo680t+y/BlJwM0l1h5cyEo+1qfNxKM+x6p2wAWvcSIkTL2L/4Qk9D
	 yeOtJG2NbA6q9dp3LCWHrnZmY2qqpzfxL923JmirUoMkyOsjAL1B5NHjyVy5NMeQ2N
	 OutcUXdjaRMyzZ/0mxzG3SLl3+f9IVsC+q67n258=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zuKAOJQMZchR; Mon, 13 Nov 2023 23:06:46 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id B294E82854A4;
	Mon, 13 Nov 2023 23:06:46 -0600 (CST)
Date: Mon, 13 Nov 2023 23:06:44 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: Jens Axboe <axboe@kernel.dk>, regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <1357741503.47170425.1699938404661.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <1270025902.47126081.1699923171139.JavaMail.zimbra@raptorengineeringinc.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <1843925555.47083836.1699909110545.JavaMail.zimbra@raptorengineeringinc.com> <483d8017-4d15-4367-bac4-0e420cb4eb54@kernel.dk> <1205485505.47107959.1699917571021.JavaMail.zimbra@raptorengineeringinc.com> <a42053ed-3a45-4dae-b953-00fb5aacb1de@kernel.dk> <146986614.47116966.1699920294190.JavaMail.zimbra@raptorengineeringinc.com> <7f74cf55-d1ca-482b-95c3-27b02996d999@kernel.dk> <1270025902.47126081.1699923171139.JavaMail.zimbra@raptorengineeringinc.com>
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
Thread-Index: LATC/2gB2QpFKfhlqTwx+IU+MU8HO3BjthXU



----- Original Message -----
> From: "Timothy Pearson" <tpearson@raptorengineering.com>
> To: "Jens Axboe" <axboe@kernel.dk>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Monday, November 13, 2023 6:52:51 PM
> Subject: Re: Regression in io_uring, leading to data corruption
> 
> Seemed to do what I wanted, however corruption remains.  Was worth a try...
> 
> I guess I'll proceed under the assumption that somehow the thread setup is
> stomping on userspace for now.

Finally found it!  Patch here:

https://lore.kernel.org/regressions/19221908.47168775.1699937769845.JavaMail.zimbra@raptorengineeringinc.com/T/#u

We were missing the appropriate barrier instruction inside the IPI issued by the task_work_add() call, which was in turn issued during queued io worker creation.  The explaination for how userspace was getting corrupted boils down to an inconsistent view of main memory as seen the two cores involved in the worker handoff and new worker creation.

Who doesn't love a one line fix after a week and a half of pulling one's hair out? ;)
