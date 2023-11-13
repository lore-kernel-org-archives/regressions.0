Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119ED22EF6
	for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 19:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="jwoyks5g"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 914738285800;
	Mon, 13 Nov 2023 13:02:05 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id wg_3mshMXMNR; Mon, 13 Nov 2023 13:02:04 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id E4F808285966;
	Mon, 13 Nov 2023 13:02:03 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com E4F808285966
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699902123; bh=/NM+PMiLJlrMysOE1LB7JEOeR9ZYKlMR2+SW8kfl16g=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=jwoyks5gPMFpb9jeCncNimt2IiHp8vYFBGXzeZpR9CC+SVK+0FPrpONt/6h1Zoof/
	 JKzd6vAu1qgsLBVRoWBhHSom96DXddavqjzxM8FyTAHUnl4KV+5+DwPEt1MkG3irqT
	 2DLjcpUeo1pmhK0iXMaS/Zq6W9lSnGNbkKeZtpiw=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7PUxRNcutgsz; Mon, 13 Nov 2023 13:02:03 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A3FC48285800;
	Mon, 13 Nov 2023 13:02:03 -0600 (CST)
Date: Mon, 13 Nov 2023 13:02:01 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <1450850996.47063900.1699902121475.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <74c0d436-cb83-4c55-a4fd-4e0061ac19bb@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <1475520442.46161385.1699590908294.JavaMail.zimbra@raptorengineeringinc.com> <776997436.46185793.1699598887190.JavaMail.zimbra@raptorengineeringinc.com> <eee9b0ff-dae7-4613-8c63-fed1043e047c@kernel.dk> <414471427.46558741.1699728159797.JavaMail.zimbra@raptorengineeringinc.com> <634718570.46592899.1699739843363.JavaMail.zimbra@raptorengineeringinc.com> <172487905.47043248.1699895175662.JavaMail.zimbra@raptorengineeringinc.com> <74c0d436-cb83-4c55-a4fd-4e0061ac19bb@kernel.dk>
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
Thread-Index: 0ID4XfpUNmPqJmM8aYHZLtujxvMHNQ==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Monday, November 13, 2023 11:39:30 AM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/13/23 10:06 AM, Timothy Pearson wrote:
>> ----- Original Message -----
>>> From: "Timothy Pearson" <tpearson@raptorengineering.com>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>> Cc: "Jens Axboe" <axboe@kernel.dk>, "regressions" <regressions@lists.linux.dev>,
>>> "Pavel Begunkov"
>>> <asml.silence@gmail.com>
>>> Sent: Saturday, November 11, 2023 3:57:23 PM
>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>
>>> Unfortunately I got led down a rabbit hole here.  With the tests I was running,
>>> MariaDB writes the encrypted data separately from the normal un-encrypted page
>>> header and checksums, and the internal encrpyted data on disk was corrupt while
>>> the outer page checksum was still valid.
>>>
>>> I have since switched to the main.xa_prepared_binlog_off test, which shows the
>>> corruption more easily in the on-disk format.  We are still apparently dealing
>>> with a write path issue, which makes more sense given the nature of the
>>> corruption observed on production systems.
>> 
>> Quick status update -- after considerable effort applied I've managed
>> to narrow down what is going wrong, but still need to locate the root
>> cause.  The bug is incredibly timing-dependent, therefore it is
>> difficult to instrument the code paths I need without causing it to
>> disappear.
>> 
>> What we're dealing with is a wild write to RAM of some sort, provoked
>> by the exact timing of some of the encryption tests in mariadb.  I've
>> caught the wild write a few times now, it is not in the standard
>> io_uring write path but instead appears to be triggered (somehow) by
>> the io worker punting process.
>> 
>> When the bug is hit, and if all other conditions are exactly correct,
>> *something* (still to be identified) writes 32 bytes of gibberish into
>> one of the mariadb in-RAM database pages at a random offset.  This
>> wild write occurs right before the page is encrypted for write to disk
>> via io_uring.  I have confirmed that the post-encryption data in RAM
>> is written to disk without any additional corruption, and is then read
>> back out from disk into the page verification routine also without any
>> additional corruption.  The page verification routine decrypts the
>> data from disk, thus restoring the decrypted data that contains the
>> wild write data stamped somewhere on it, where we then hit the
>> corruption warning and halt the test run.
>> 
>> Irritatingly, if I try to instrument the data flow in the application
>> right before the encryption routine, the bug disappears (or, more
>> precisely, is masked).  If I had to guess from these symptoms, I'd
>> suspect the application io worker thread is waking up, grabbing wrong
>> context from somewhere, and scribbling some kind of status data into
>> memory, which rarely ends up being on top of one of the in-RAM
>> database pages.  This could be an application issue or a kernel issue,
>> I'm not sure yet, but given the precise timing requirements I'm less
>> and less surprised this is only showing on ppc64 right now.
>> 
>> As always, investigation continues...
> 
> I wonder if this has to do with copy_thread() on powerpc - so not
> necessarily ppc memory ordering related, but just something in the arch
> specific copy section.
> 
> I took a look back, and the initial change actually forgot ppc. Since
> then, there's been an attempt to make this generic:
> 
> commit 5bd2e97c868a8a44470950ed01846cab6328e540
> Author: Eric W. Biederman <ebiederm@xmission.com>
> Date:   Tue Apr 12 10:18:48 2022 -0500
> 
>    fork: Generalize PF_IO_WORKER handling
> 
> and later a powerpc change related to that too:
> 
> commit eed7c420aac7fde5e5915d2747c3ebbbda225835
> Author: Nicholas Piggin <npiggin@gmail.com>
> Date:   Sat Mar 25 22:29:01 2023 +1000
> 
>    powerpc: copy_thread differentiate kthreads and user mode threads
> 
> Just stabbing in the dark a bit here as I won't pretend to understand
> the finer details of powerpc thread creation, but maybe try with this
> and see if it makes any difference.
> 
> As you note in your reply, we could very well be corrupting some bytes
> somewhere every time. We just only notice quickly when it happens to be
> in that specific buffer.
> 
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 392404688cec..d4dec2fd091c 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1758,7 +1758,7 @@ int copy_thread(struct task_struct *p, const struct
> kernel_clone_args *args)
> 
> 	klp_init_thread_info(p);
> 
> -	if (unlikely(p->flags & PF_KTHREAD)) {
> +	if (unlikely(p->flags & (PF_KTHREAD | PF_IO_WORKER))) {
> 		/* kernel thread */
> 
> 		/* Create initial minimum stack frame. */

Good idea, but didn't work unfortunately.  Any other suggestions welcome while I continue to debug...
