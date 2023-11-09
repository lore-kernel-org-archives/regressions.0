Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076F21E51E
	for <regressions@lists.linux.dev>; Thu,  9 Nov 2023 18:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="OK0MC1Wc"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0DD1A8285431;
	Thu,  9 Nov 2023 12:20:32 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id CRZa0xix8WT4; Thu,  9 Nov 2023 12:20:31 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 163148285626;
	Thu,  9 Nov 2023 12:20:31 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 163148285626
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699554031; bh=x0YXOrR0Zy1N1cNk0SuzhOFgDr2Yp6701jfm5mOK5Os=;
	h=Message-ID:Date:From:To:MIME-Version;
	b=OK0MC1Wc4zI7KwcY2BK98tb3z73zYbUlFdCp7ufBESbmKeB65PF+PmnwRqsniBGFh
	 zJqVSZr6tgXBfRAwK+VV4lYxvVvftyALeoAE50P99t6dGeqkVZ2rgo3QaLeq8YXFJC
	 KPYOiI3A6U336QtTx/mSOPHrvSLQfUNB3HdEQbmg=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9ZrViMBjrvij; Thu,  9 Nov 2023 12:20:30 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id C37FC8285431;
	Thu,  9 Nov 2023 12:20:30 -0600 (CST)
Received: from 192.168.3.91 (proxying for 172.59.186.90)
        (SquirrelMail authenticated user tpearson@raptorengineering.com)
        by vali.starlink.edu with HTTP;
        Thu, 9 Nov 2023 12:20:30 -0600
Message-ID: <9867b2be9c0845f9f2e3a16f91f40574.squirrel@vali.starlink.edu>
In-Reply-To: <99f43fc0-a500-41b5-9575-33a57d0795de@kernel.dk>
References:
    <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
    <9860f9b2-1d98-497c-9480-56852fda781b@kernel.dk>
    <1557819821.46044536.1699549241816.JavaMail.zimbra@raptorengineeringinc.com>
    <f4fffe29-7c95-4d22-918b-f2835fb76366@kernel.dk>
    <597693097.46047776.1699550641104.JavaMail.zimbra@raptorengineeringinc.com>
    <e3e1b31f-a9a0-4387-982e-aba6d9763c6b@kernel.dk>
    <1926532589.46050149.1699551411577.JavaMail.zimbra@raptorengineeringinc.com>
    <a262a91e-f2ec-402f-ba40-adacb76c72b9@kernel.dk>
    <871420600.46050861.1699551732591.JavaMail.zimbra@raptorengineeringinc.com>
    <99f43fc0-a500-41b5-9575-33a57d0795de@kernel.dk>
Date: Thu, 9 Nov 2023 12:20:30 -0600
Subject: Re: Regression in io_uring, leading to data corruption
From: tpearson@raptorengineering.com
To: "Jens Axboe" <axboe@kernel.dk>
Cc: "regressions" <regressions@lists.linux.dev>,
 "Pavel Begunkov" <asml.silence@gmail.com>
User-Agent: SquirrelMail/1.4.22
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;charset=utf-8
X-Priority: 3 (Normal)
Importance: Normal
Content-Transfer-Encoding: quoted-printable

> On 11/9/23 10:42 AM, Timothy Pearson wrote:
>>
>>
>> ----- Original Message -----
>>> From: "Jens Axboe" <axboe@kernel.dk>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>> <asml.silence@gmail.com>
>>> Sent: Thursday, November 9, 2023 11:38:10 AM
>>> Subject: Re: Regression in io_uring, leading to data corruption
>>
>>> On 11/9/23 10:36 AM, Timothy Pearson wrote:
>>>>> Hmm ok, that is odd. How quickly does it trigger for you?
>>>>
>>>> Almost immediately.  Third pass in this case, which is pretty typica=
l
>>>> -- without any delays etc. it will normally fail in under 10
>>>> iterations.  When I add other delays in e.g. the worker thread it
>>>> becomes less likely to fail, but still fails.   Only adding the udel=
ay
>>>> in the one specific (IRQ locked) location allows it to pass all 200
>>>> iterations.
>>>
>>> What specific IRQ locked location? Hard to know where you are adding
>>> these things without seeing the patches.
>>>
>>> --
>>> Jens Axboe
>>
>> Sorry about that.  Here's the patch that automagically makes things
>> work (bear in mind line numbers etc. are munged since I have a bunch
>> of other debug stuff in here at this point):
>>
>>  static void io_wqe_dec_running(struct io_worker *worker)
>> @@ -312,19 +326,39 @@ static void io_wqe_dec_running(struct io_worker
>> *worker)
>>         if (!(worker->flags & IO_WORKER_F_UP))
>>                 return;
>>
>> +       udelay(1000);
>>         if (atomic_dec_and_test(&acct->nr_running) &&
>> io_wqe_run_queue(wqe)) {
>>                 atomic_inc(&acct->nr_running);
>>                 atomic_inc(&wqe->wq->worker_refs);
>
> Ah I see, you're on older stable? What specifically?

I run two test branches, one right after the issues showed up (5.12-rc7+)=
,
and one basically at GIT master (6.6+).  I tend to test on 5.12 just so
that we're not inadvertently compounding issues, once we figure out what
is wrong on 5.12 then I can try to forward port to 6.6.

