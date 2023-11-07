Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E30B2C860
	for <regressions@lists.linux.dev>; Tue,  7 Nov 2023 21:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="tlICtcn0"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 1C06C828558C;
	Tue,  7 Nov 2023 15:39:35 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id qXr44HXgT9gi; Tue,  7 Nov 2023 15:39:34 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0089082855B3;
	Tue,  7 Nov 2023 15:39:33 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0089082855B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699393174; bh=leKKhXcBeKnKfNdOpa/l6HD27rUlFljOX02Anh+xq/A=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=tlICtcn0telux0AI5+ooL2Ua1C2OkADz8oI81Hs4sTJR+3VbAgFR4+gnlxkQGBHts
	 75zoO3OKqWwnmkOQeZzx4Qg9Ddk+ZcESmkCH0NFL3J3AJAjDRovkHw1fbuoT3FFm65
	 nJVLRx8h0QX5WLxg04fYKkMWRaILfkW8kxZkmLfo=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xhou2sVW-9lB; Tue,  7 Nov 2023 15:39:33 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id CF6D8828558C;
	Tue,  7 Nov 2023 15:39:33 -0600 (CST)
Date: Tue, 7 Nov 2023 15:39:31 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <1779502278.45625230.1699393171901.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <92d55351-f8c2-4376-affb-d361782e20e1@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <92d55351-f8c2-4376-affb-d361782e20e1@kernel.dk>
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
Thread-Index: mZX/Bbn3TXVyCSCefBUbGAu4ddDFhQ==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
> <asml.silence@gmail.com>
> Sent: Tuesday, November 7, 2023 3:22:16 PM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/7/23 9:34 AM, Timothy Pearson wrote:
>> I can make the corruption disappear by adding a 1ms busy wait delay
>> into io_wqe_dec_running().  This appears to alter the timing of
>> something in the io_uring system just enough to make the (presumed)
>> data race disappear.  KASAN and KCSAN do not show any issues, nor does
>> the lock debugger, yet a corruption problem that disappears with a
>> delay is indicative of a race somewhere.  The delay primary impacts
>> how long the IRQ lock is held, if the delay is moved outside of the
>> IRQ locked section the corruption returns.
> 
> This is interesting... This forces the current task to schedule out
> first, rather than potentially create a new worker.

That makes sense -- when debugging, everything seems to center around worker creation and the exact timing / context of that operation.

> If you put that 1 ms sleep at the top of io_wq_worker(), before the
> loop, does it fix it as well? With the previous one removed, of course.

No, it does not.

> Does it do anything if you just put isync() in there instead of the
> sleep in io_wqe_dec_running()?

Unfortunately no, that doesn't fix things either.

My gut says it's something racing with either the I/O worker creation or wake (trying to schedule work onto a half-created or still sleeping worker?) but so far I haven't been able to isolate the root cause.
