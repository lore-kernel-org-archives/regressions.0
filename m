Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7769C168BC
	for <regressions@lists.linux.dev>; Tue,  7 Nov 2023 16:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="jR6NAunA"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 873018285346;
	Tue,  7 Nov 2023 10:57:40 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 8knZxiMVX0FS; Tue,  7 Nov 2023 10:57:39 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 4809D82855CF;
	Tue,  7 Nov 2023 10:57:39 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4809D82855CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699376259; bh=tJnJDXUpSPm4/I+9YvXVGaXMBXg+2TTbcomdLX/FAJ4=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=jR6NAunAbyGp9P2EPs4llQKYLrw9Yeu8BMnT0UCLyS4uZMahd3vr30c4qTI5kugWu
	 f+60USwGFOJvyeWen0Hpys2+tVNxohFM2nZEtS2Mse4Ihyi/GC8ZVp9ZprTG0eBr25
	 vare8s8YVd/67Z8HiqEhdNjxM9cseTpPhFAIuziA=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wAhcX1FOR_Cw; Tue,  7 Nov 2023 10:57:39 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 124C68285346;
	Tue,  7 Nov 2023 10:57:39 -0600 (CST)
Date: Tue, 7 Nov 2023 10:57:37 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <1979644721.45581249.1699376257136.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <eb4f04b9-1bbf-489d-88ee-7ad7e4fb455b@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <eb4f04b9-1bbf-489d-88ee-7ad7e4fb455b@kernel.dk>
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
Thread-Index: KZOzJjQA4Jj2t+H6adTTykFCCsXCeA==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
> <asml.silence@gmail.com>
> Sent: Tuesday, November 7, 2023 10:49:34 AM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/7/23 9:34 AM, Timothy Pearson wrote:
>> I have spent some considerable effort tracking down a bug that appears
>> to be present in the io_uring workqueue.  As I have not yet been able
>> to isolate the exact cause, I would like to solicit ideas from the
>> developers / maintainers of the io_uring system.  This regression
>> persists into the latest kernel GIT head, and is only reliably
>> reproduceable under fairly exacting conditions.
>> 
>> In GIT hash 685fe7fe the workqueue manager thread was removed and
>> replaced with code that allows the workqueues to manage their own
>> workers.  This has the unfortunate side effect of exposing what I
>> believe to be an existing timing-dependent race condition somewhere
>> else within the kernel.  On a ppc64el host, I can reliably trigger
>> data corruption on what I believe to be writes by running the
>> following mysql mtr sequence:
>> 
>> ./mtr encryption.innodb-discard-import --repeat=100 --force
>> 
>> This results in corruption of the data being written to disk --
>> reverting 685fe7fe resolves the issue by (I believe) masking it
>> through changes in workqueue inter-thread timing.
>> 
>> I can make the corruption disappear by adding a 1ms busy wait delay
>> into io_wqe_dec_running().  This appears to alter the timing of
>> something in the io_uring system just enough to make the (presumed)
>> data race disappear.  KASAN and KCSAN do not show any issues, nor does
>> the lock debugger, yet a corruption problem that disappears with a
>> delay is indicative of a race somewhere.  The delay primary impacts
>> how long the IRQ lock is held, if the delay is moved outside of the
>> IRQ locked section the corruption returns.
>> 
>> I have already tried adding memory barriers etc. to the code paths in
>> question, with no effect.  The exact same issue persists on the latest
>> kernel versions.
>> 
>> Thoughts welcome -- this is a serious issue causing data corruption on
>> production systems.
> 
> I looked into this for quite a while back in March, see my initial
> postings on it here:
> 
> https://lore.kernel.org/all/2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk/
> 
> it unfortunately never got anywhere, and as far as I can tell, this is
> most likely a page cache or ordering issue on the ppc side. I no longer
> have hardware to test with, and not really a huge inclination to dive
> into this again as it's hugely time consuming and doesn't seem to be an
> io_uring issue to begin with, but I'd be happy to help out with this.
> 
> Back then I looked into getting some ppc hardware to test with for
> this very reason, and even reached out to various manufacturers to see
> if they would be able to lend/give me some. Didn't pan out, and ended
> up using a university vm for it.
> 
> --
> Jens Axboe

Understood.  I think between the pinning and the findings above, plus the fact that (IIRC) this seemed to disappear in SMT1 mode, I may have some better idea of where to look.  The pinning "fixing" things is something I wasn't aware of and will significantly reduce debug effort on this end, thanks for the pointer!

In the future, Raptor is more than willing to offer bare metal access to test machines for ppc64el at no cost.  I was unaware of the need so couldn't respond.

Thanks again!
