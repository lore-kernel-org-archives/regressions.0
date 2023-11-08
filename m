Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB86310798
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 17:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="QbJ8gfuN"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id AC101828551F;
	Wed,  8 Nov 2023 11:10:25 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id O2J1g0EgW3Ij; Wed,  8 Nov 2023 11:10:23 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 9E3788285633;
	Wed,  8 Nov 2023 11:10:23 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 9E3788285633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699463423; bh=Cs/CgpJHTfpGzcl5J8ZI9XgNp4WvIwdURRv+JNoJNGU=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=QbJ8gfuNZXxQSpHG8TVBxEjDkVaSOi/cQw/UKq+ryz5ht7pqntH2bc4fo2we4uK9V
	 d1N4YNWs/ztZWl5T0YgD4rVstwam8UQUqPxY+AmWa1VbbmI4xKaX7+TK6Xyq6gEBgC
	 vUQlSHLgV7tE2x00iyWlxSJa7picFQvkSkOsu/n8=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Ka_kINQONqKH; Wed,  8 Nov 2023 11:10:23 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 6BE46828551F;
	Wed,  8 Nov 2023 11:10:23 -0600 (CST)
Date: Wed, 8 Nov 2023 11:10:23 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <479322567.45813366.1699463423245.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <da7acad5-3297-4d25-95bf-81eb559d5244@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <712095554.45645374.1699400040368.JavaMail.zimbra@raptorengineeringinc.com> <8d966878-f7fd-43c8-bd91-ac33408c9317@kernel.dk> <1768720690.45649923.1699401768289.JavaMail.zimbra@raptorengineeringinc.com> <217cea83-f527-4e86-97c2-dc9a2f8f937b@kernel.dk> <431496020.45688461.1699416044413.JavaMail.zimbra@raptorengineeringinc.com> <f1761483-1f59-42bd-b556-ad3dde998dbc@kernel.dk> <da7acad5-3297-4d25-95bf-81eb559d5244@kernel.dk>
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
Thread-Index: zdkusUp25TQiXjBaFc7oSGKtINJdXw==

----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Wednesday, November 8, 2023 9:14:55 AM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/8/23 8:10 AM, Jens Axboe wrote:
>> It could also be a task that has pending IO and is doing exec() (and
>> friends), this would also cancel inflight IO.
> 
> If this is the case, then you could try with this one to just disable
> that and see if the corruption goes away:

Unfortunately that had no effect on the corruption.  I've also traced the signal generation into the get_signal() call, which is apparently sending SIGKILL when the thread group is marked for termination -- this is in turn why the PID fields etc. are all zero.

Investigation continues.
