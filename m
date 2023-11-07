Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17ED2A8C0
	for <regressions@lists.linux.dev>; Tue,  7 Nov 2023 22:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="deKBrMBW"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 49A5F82850F8;
	Tue,  7 Nov 2023 16:29:49 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id WV2PJiMphGPT; Tue,  7 Nov 2023 16:29:48 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 17D868285165;
	Tue,  7 Nov 2023 16:29:48 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 17D868285165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699396188; bh=P5pR60/DpyxHChSv+DWc2XPz0NsCwPjVidY+65UQp00=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=deKBrMBWisHdO+q5zXkBxVxHFFH7VbA2g/bgtz0+Kp/wzGW9V2tJwyPYC9aRIXaQq
	 Y3WFLuoQGVQw3j4jpsz+DX8eoKr17AD5qqlZ+R/CYSKYC95K2Re6AZURlC0d2DwbVw
	 UR29pVWuSbSn5SWhVqZKekmpsA80L5Gm2c6y7Pe4=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kf24iwDwOMV2; Tue,  7 Nov 2023 16:29:47 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id DD03282850F8;
	Tue,  7 Nov 2023 16:29:47 -0600 (CST)
Date: Tue, 7 Nov 2023 16:29:45 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <23615262.45634897.1699396185842.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <fbdefa85-f63b-48eb-825a-a16ae27b749b@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <92d55351-f8c2-4376-affb-d361782e20e1@kernel.dk> <1779502278.45625230.1699393171901.JavaMail.zimbra@raptorengineeringinc.com> <9529b97f-1c37-43e4-925e-5eeca47678bb@kernel.dk> <394590569.45631219.1699394864909.JavaMail.zimbra@raptorengineeringinc.com> <fbdefa85-f63b-48eb-825a-a16ae27b749b@kernel.dk>
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
Thread-Index: UMnQjIAk6NOTKuGdqmQldeufW8ToEA==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Tuesday, November 7, 2023 4:16:51 PM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/7/23 3:07 PM, Timothy Pearson wrote:
>> Interestingly enough that's where my current investigation is leading
>> as well.  After instrumenting and re-instrumenting the codebase far
>> more times than I'd like to admit, I've noticed that the workers don't
>> time out on kernel builds that show the corruption, they are directly
>> terminated via signal (SIGKILL).  On kernel builds with the delay, the
>> workers time out and self-terminate.  I'm still trying to parse out
>> what the exact difference between these two mechanisms would be and
>> how it plays into the corruption, but at least it's a start...
> 
> Maybe poke at how they are exiting - you say timeout, so they've been
> idle for a while and then go away? This would then cause worker creation
> again later on if, say, we have 1 worker left and it goes to sleep. So
> the timeout itself may not tell you much, outside of then causing that
> other condition to happen. You could even try and shrink the timeout to
> HZ / 10 or something like that to make it more likely to happen.

Agreed.  As of right now I can confirm that with the delay in place (no corruption) the workers are exiting on their own, no signals and no IO_EXIT bit being set.  When I remove the delay (reintroducing the corruption) I see signal 9 being sent to the workers, and a mix of IO_EXIT being set and not being set.

Ignoring the signal 9 does not fix the corruption, which makes me wonder more about IO_EXIT and whether things are not fully committed / properly torn down when the worker thread terminates.  This also dovetails nicely with the fact that the observed write corruption always seems to be in the latter portions of the page, never at the beginning of the page, also indicating rapid / unclean termination of the writer process.

Will keep digging...
