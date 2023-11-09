Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A88B208CD
	for <regressions@lists.linux.dev>; Thu,  9 Nov 2023 17:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="Ftq52wWb"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id B4964828593E;
	Thu,  9 Nov 2023 11:24:04 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id k3goXKZnHf0h; Thu,  9 Nov 2023 11:24:03 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 784838286713;
	Thu,  9 Nov 2023 11:24:03 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 784838286713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699550643; bh=EcOj4sOYAsX2SF5DzYH4cpfzTLt74u9L/e9UdOQMxQk=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Ftq52wWbVjJxWGrMIgjRbzzw9rH35BXhvE00OaK9TzbcfNGyHT8FqITuoPYLjGr5P
	 Kor+yR9mt+D6HUCfOPMZ1yqi4UUAmyDq2M+hq8b7gNCBGDlnu325+QYGSjppQkl6jZ
	 VzAZ0lerjTgStsGLoLpwGMlaDvSb+4I5VfBbw92o=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id boO7ZCf4AJLC; Thu,  9 Nov 2023 11:24:03 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 48C33828593E;
	Thu,  9 Nov 2023 11:24:03 -0600 (CST)
Date: Thu, 9 Nov 2023 11:24:01 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <597693097.46047776.1699550641104.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <f4fffe29-7c95-4d22-918b-f2835fb76366@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <3f2dcaba-d18e-4d1d-9b96-2a168f550881@kernel.dk> <262637196.45862863.1699481726721.JavaMail.zimbra@raptorengineeringinc.com> <b40fd4c2-ea0e-4260-87f6-a3d43dd06c9d@kernel.dk> <0672220d-1b3a-46b3-811d-0a691e380097@kernel.dk> <9860f9b2-1d98-497c-9480-56852fda781b@kernel.dk> <1557819821.46044536.1699549241816.JavaMail.zimbra@raptorengineeringinc.com> <f4fffe29-7c95-4d22-918b-f2835fb76366@kernel.dk>
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
Thread-Index: Bo4yASyFH8VFfbAXZqiK97HGlifybQ==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Thursday, November 9, 2023 11:17:03 AM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/9/23 10:00 AM, Timothy Pearson wrote:
>> 
>> 
>> ----- Original Message -----
>>> From: "Jens Axboe" <axboe@kernel.dk>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>> <asml.silence@gmail.com>
>>> Sent: Thursday, November 9, 2023 9:12:07 AM
>>> Subject: Re: Regression in io_uring, leading to data corruption
>> 
>>> On 11/8/23 4:58 PM, Jens Axboe wrote:
>>>> On 11/8/23 3:18 PM, Jens Axboe wrote:
>>>>> OK, let me actually test this thing and see if I can make it solid
>>>>> first...
>>>>
>>>> Here's a suitable hack - it just creates a new io worker for each item,
>>>> ensuring that that worker is run on the same CPU.
>>>
>>> Turns out I didn't send you the current one, this one was older and
>>> untested. Please try this one instead.
>> 
>> I'm still seeing an oops with this newer patchset applied:
>> [   76.419788] Kernel attempted to read user page (9c) - exploit attempt? (uid:
>> 0)
>> [   76.419853] BUG: Kernel NULL pointer dereference on read at 0x0000009c
>> [   76.419887] Faulting instruction address: 0xc0000000008374d4
>> [   76.419919] Oops: Kernel access of bad area, sig: 11 [#1]
>> <snip>
>> [   76.429125] Call Trace:
>> [   76.429142] [c000000009a8f800] [c000000000ea4e7c] schedule+0xfc/0x150
>> (unreliable)
>> [   76.429190] [c000000009a8f870] [c000000000ead8f0]
>> schedule_timeout+0x170/0x1e0
>> [   76.429238] [c000000009a8f940] [c000000000ea3fc8]
>> io_schedule_timeout+0x68/0xa0
>> [   76.429285] [c000000009a8f970] [c0000000007adcbc] blk_io_schedule+0x3c/0x70
>> [   76.429326] [c000000009a8f990] [c00000000065da84] __iomap_dio_rw+0x8d4/0x9f0
>> [   76.429374] [c000000009a8fb70] [c00000000065dea0] iomap_dio_rw+0x20/0x80
>> [   76.429415] [c000000009a8fb90] [c008000000514eac]
>> ext4_file_write_iter+0x814/0xdb8 [ext4]
>> [   76.429475] [c000000009a8fc60] [c000000000833aa0] io_write+0x280/0x540
>> [   76.429514] [c000000009a8fd80] [c0000000008183bc] io_issue_sqe+0xdc/0x390
>> [   76.429554] [c000000009a8fdd0] [c000000000818ab4]
>> io_wq_submit_work+0x1c4/0x2c0
>> [   76.429601] [c000000009a8fe20] [c000000000835578]
>> io_wq_single_worker+0x88/0xb0
>> [   76.429652] [c000000009a8fe50] [c00000000000df3c]
>> ret_from_kernel_user_thread+0x14/0x1c
>> 
>> If you're not seeing an oops, that's an interesting difference that I
>> can investigate further.
> 
> Are you sure that's with the latest patch? Because that looks like
> something that'd happen with the buggy one I sent out, as the sleep/wake
> handling doesn't properly handle the specialized workers.
> 
> --
> Jens Axboe

You're right, the new patch wasn't applied, somehow it didn't copy over from my clipboard.  Apologies for the noise.

That said, the new patch is still showing the data corruption.  Maybe the pinning was just introducing the same timing alterations that my udelay() does on specific kernel builds?
