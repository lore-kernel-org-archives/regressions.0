Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBC724A05
	for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 21:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="gOGmdRt/"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 266E282855DE;
	Mon, 13 Nov 2023 15:09:02 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id vAJo2KCjTg3i; Mon, 13 Nov 2023 15:09:01 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 537D58285612;
	Mon, 13 Nov 2023 15:09:01 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 537D58285612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699909741; bh=qCS6ncFYTjseK+Wl1NXuwEcjfay/ki2zdkhM5TZ3bAs=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=gOGmdRt/1T3CTnn9FsqbxwBt0hdLZ9ScenPZGyP1372j8d9V5ZOrepTHG1WMbJi7L
	 U7OfJEcI3r6hUTQla6LEBC4X+KqIVZcbJuZ8csw/0RRwUro/rxZKZOLn8Gv8WN+lSE
	 BpK2X51GNXLRyv2Wh9umqUF6ldKhbuBODhgDmydI=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UBSHYazloEEQ; Mon, 13 Nov 2023 15:09:01 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id D9F3C82855DE;
	Mon, 13 Nov 2023 15:09:00 -0600 (CST)
Date: Mon, 13 Nov 2023 15:08:58 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <1094567926.47085500.1699909738622.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <4fa13453-cd23-4122-870a-83902787d541@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <1475520442.46161385.1699590908294.JavaMail.zimbra@raptorengineeringinc.com> <776997436.46185793.1699598887190.JavaMail.zimbra@raptorengineeringinc.com> <eee9b0ff-dae7-4613-8c63-fed1043e047c@kernel.dk> <414471427.46558741.1699728159797.JavaMail.zimbra@raptorengineeringinc.com> <634718570.46592899.1699739843363.JavaMail.zimbra@raptorengineeringinc.com> <172487905.47043248.1699895175662.JavaMail.zimbra@raptorengineeringinc.com> <4fa13453-cd23-4122-870a-83902787d541@kernel.dk>
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
Thread-Index: 6BXgLiDuW9kUs6injdphpnr3ADSWIQ==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Monday, November 13, 2023 2:47:13 PM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/13/23 10:06 AM, Timothy Pearson wrote:
>> When the bug is hit, and if all other conditions are exactly correct,
>> *something* (still to be identified) writes 32 bytes of gibberish into
>> one of the mariadb in-RAM database pages at a random offset.
> 
> Do you have one or more examples of what those 32 bytes look like?
> Ideally more than one. Would be nice if we could deduce something from
> the content there. A long shot, but...

Assuming we're on byte boundaries, here are a few examples.  Problem is since the offset is random it's hard to know for certain how many zeroes start (or end) the block, so I've trimmed the zeroes off both ends of these three examples with the exception of a leading zero needed to get to a byte boundary:

45713881df1783472b45a32d373f59b6
3063d0146087fdfd7d03cc2ff3523588
0fbfcd0b37bc3b861c5bd51c4f0f1365

And I just realized I misspoke, it's 16 bytes (32 nibbles).  They don't really look like pointers, and they don't correlate with anything on disk.  I had already tried to figure out what this data is without much success, it's not even program code...
