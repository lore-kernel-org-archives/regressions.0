Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACF6199CC
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 22:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="O8tLQT5f"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 711238285584;
	Wed,  8 Nov 2023 16:28:15 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id E6rkxGG7y4iX; Wed,  8 Nov 2023 16:28:14 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 61C5B82855B2;
	Wed,  8 Nov 2023 16:28:14 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 61C5B82855B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699482494; bh=DIP5GM37Au2ZCzYxvqW//z8PLMyU6Vg9E3idWRDvBqo=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=O8tLQT5fgsmaUtB+NKpwVxSZk6MUPP4JzyDAiWwl0rJW/hyUC0YldjmJ1EXF4CwtR
	 Kgl9JkvypJFHNlSbZOff6gZk3cwHffJ1DOTV59sU/ygDso0JDiVe2PFE1ABvvqmG/0
	 2TTV6PBPnAG/zkbSfAaLh1Bttc1gnpWrkNOaWZhs=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id avSwOkCpV3sz; Wed,  8 Nov 2023 16:28:14 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 3962A8285584;
	Wed,  8 Nov 2023 16:28:14 -0600 (CST)
Date: Wed, 8 Nov 2023 16:28:14 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <786787644.45864383.1699482493996.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <b40fd4c2-ea0e-4260-87f6-a3d43dd06c9d@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <74d15590-3af6-40ed-8d3b-5bf8cd3881a5@kernel.dk> <217080ad-adb4-4cbd-ae91-1287bb6a5400@kernel.dk> <410961969.45826785.1699468561883.JavaMail.zimbra@raptorengineeringinc.com> <2225dc79-37ec-4239-b13a-ac444bfa6a6b@kernel.dk> <3f2dcaba-d18e-4d1d-9b96-2a168f550881@kernel.dk> <262637196.45862863.1699481726721.JavaMail.zimbra@raptorengineeringinc.com> <b40fd4c2-ea0e-4260-87f6-a3d43dd06c9d@kernel.dk>
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
Thread-Index: U0Z5QeqyI+Ud3jBriz9FNJlPtXL8jA==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Wednesday, November 8, 2023 4:18:20 PM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/8/23 3:15 PM, Timothy Pearson wrote:
>> 
>> 
>> ----- Original Message -----
>>> From: "Jens Axboe" <axboe@kernel.dk>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>> <asml.silence@gmail.com>
>>> Sent: Wednesday, November 8, 2023 4:05:50 PM
>>> Subject: Re: Regression in io_uring, leading to data corruption
>> 
>>> On 11/8/23 12:06 PM, Jens Axboe wrote:
>>>>> I have been giving some thought to the CPU pinning of the workers, and
>>>>> one thing that may have been overlooked is that this could potentially
>>>>> force-serialize worker operations.  Did you just have to pin the io
>>>>> workers or did the workqueue also need to be pinned for the corruption
>>>>> to disappear?
>>>>
>>>> Not sure I follow, the workers ARE the workqueue. For the pinning, I
>>>> just made sure that the workers are on the same CPU. I honestly don't
>>>> remember all the details there outside of what I can read back from the
>>>> emails I sent, it's been a while. My suspicion back then was that it was
>>>> some weird ppc cache aliasing effect with the copy into kernel memory
>>>> happening on cpu X, and then we immediately punt it to cpu Y for
>>>> processing.
>>>
>>> You could try something like this, though I still need to verify that we
>>> never end up running it on the wrong CPU. But may be worth a shot, for
>>> debug purposes.
>> 
>> Getting a bunch of:
>> 
>> [   25.268005] work cpu 5, me 23
>> [   25.269217] work cpu 5, me 23
>> [   25.269804] work cpu 5, me 23
> 
> [snip]
> 
>> [  153.029120] work cpu 32, me 10
>> 
>> They happen both for corrupt and non-corrupt runs.
> 
> OK, let me actually test this thing and see if I can make it solid
> first...

No problem.  I'll test as soon as you have it stable on your side.

Thanks!
