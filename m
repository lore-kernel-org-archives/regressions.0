Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B7354BFB
	for <regressions@lists.linux.dev>; Thu, 30 Nov 2023 16:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="t0LFkTgA"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 3A8388285445;
	Thu, 30 Nov 2023 10:29:29 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id BQz_W6JymoCG; Thu, 30 Nov 2023 10:29:27 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 22FCA82857C2;
	Thu, 30 Nov 2023 10:29:27 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 22FCA82857C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701361767; bh=KBrNxsfn70ZNE6O3pMxVwHnLB15qW72vRKbTDaVLNww=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=t0LFkTgArFzzrevhj6Vb+ckRoKrQxcosmNM8/Z746WwVMWnUaBUu9VNrkEmjA0xh6
	 zAo1ZZvJ1gUnO6V2ixITRs8B8XWHUdbPBVthOf/Ck7tR+dXakC6PG9oBfiYFR/tm6I
	 16VNTnHgNpuOQ+kyUkQ7oAhwmY3Yk0JBpGq5p9Rw=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gQPRFTXEBQjl; Thu, 30 Nov 2023 10:29:27 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id E9DC28285445;
	Thu, 30 Nov 2023 10:29:26 -0600 (CST)
Date: Thu, 30 Nov 2023 10:29:26 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Jens Axboe <axboe@kernel.dk>, regressions <regressions@lists.linux.dev>, 
	npiggin <npiggin@gmail.com>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <1098488175.51221332.1701361766751.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <87v89m2fz6.fsf@mail.lhotse>
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com> <874jhg6lkn.fsf@mail.lhotse> <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com> <87leaqjs8x.fsf@mail.lhotse> <1340817182.49635143.1700784119445.JavaMail.zimbra@raptorengineeringinc.com> <1276384468.50536225.1701110354677.JavaMail.zimbra@raptorengineeringinc.com> <874jh64xlb.fsf@mail.lhotse> <87v89m2fz6.fsf@mail.lhotse>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc: Don't clobber fr0/vs0 during fp|altivec register save
Thread-Index: +61a2k9b9zTChWj0nZEhaiQR+ReWxg==

----- Original Message -----
> From: "Michael Ellerman" <mpe@ellerman.id.au>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "Jens Axboe" <axboe@kernel.dk>, "regressions" <regressions@lists.linux.dev>, "npiggin" <npiggin@gmail.com>,
> "christophe leroy" <christophe.leroy@csgroup.eu>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Sent: Tuesday, November 28, 2023 6:57:01 AM
> Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec register  save

> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Timothy Pearson <tpearson@raptorengineering.com> writes:
>>
>>> Just wanted to check back and see if this patch was going to be queued
>>> up soon?  We're still having to work around / advertise the data
>>> destruction issues the underlying bug is causing on e.g. Debian
>>> Stable.
>>
>> Yeah I'll apply it this week, so it will be in rc4.
> 
> I reworked the change log to include the exact call path I identified
> instead of the more high level description you had. And tweaked a few
> other bits of wording and so on, apparently fr0 is a kernelism, the ABI
> and binutils calls it f0.
> 
> I'm not sure how wedded you were to your change log, so if you dislike
> my edits let me know and we can come up with a joint one.
> 
> The actual patch is unchanged.
> 
> cheers

The commit message looks OK to me.  I've also seen application crashes as a result of the register corruption, but that may be a minor detail that isn't really worth updating things over at this point -- those come from e.g. glibc using vs0 as part of a path that processes pointer information, typically seen where there's a need to replicate the same pointer to adjacent fields in a data struct.
