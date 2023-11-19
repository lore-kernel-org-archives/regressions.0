Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367CA365
	for <regressions@lists.linux.dev>; Sun, 19 Nov 2023 00:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="LgY9S2eR"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 344248284ECD;
	Sat, 18 Nov 2023 18:16:57 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 9vQhWzw2l5fX; Sat, 18 Nov 2023 18:16:56 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 29D6A8285281;
	Sat, 18 Nov 2023 18:16:56 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 29D6A8285281
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1700353016; bh=F8cKf+ZvFEqNb+Wn9t+yn9XWSznOAUKGd+P1kqexYR4=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=LgY9S2eRH6B2vcGW+DaP1U+n2OyYv6TenELF8Vh9HHvSp5rLlsVtTMIvXrPpF2eVl
	 UuhsnT7WVjZ6c/hTfq/C8yJ6YKpDNLVp+hS8L17KBmNButuJO6yyNPmzGh57+CcydK
	 l/jH4n35QyhwXa+2GFJwkD8qEK+cWOvxG+VGRloM=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vYVLkkRFpr9m; Sat, 18 Nov 2023 18:16:55 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id DAE7D8284ECD;
	Sat, 18 Nov 2023 18:16:55 -0600 (CST)
Date: Sat, 18 Nov 2023 18:16:55 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: Jens Axboe <axboe@kernel.dk>, regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>
Message-ID: <636987821.48381355.1700353015684.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <368367067.47661779.1700106890793.JavaMail.zimbra@raptorengineeringinc.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <580f9fdb-475b-4b92-8e90-cab2100464ea@kernel.dk> <2046281833.47549655.1700067821653.JavaMail.zimbra@raptorengineeringinc.com> <4e171c09-bb9a-422f-b92c-230bb1238b22@kernel.dk> <bba85bd7-6f09-4d78-b33b-caa6a6dcb29c@kernel.dk> <230871836.47658490.1700105335407.JavaMail.zimbra@raptorengineeringinc.com> <5fb3fb19-cb9b-42d0-8949-7a9be8750682@kernel.dk> <368367067.47661779.1700106890793.JavaMail.zimbra@raptorengineeringinc.com>
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
Thread-Index: pKBzWVMxEqmEf7vHVrMn/xZC3Gep1OmkSuWW



----- Original Message -----
> From: "Timothy Pearson" <tpearson@raptorengineering.com>
> To: "Jens Axboe" <axboe@kernel.dk>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>, "Michael Ellerman"
> <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>
> Sent: Wednesday, November 15, 2023 9:54:50 PM
> Subject: Re: Regression in io_uring, leading to data corruption
> 
> OK, fair enough, I've been at this long enough I forgot about the precreated
> workers "fixing" things.  Let me step back a bit and meta-analyze all of what
> we've learned, even though a lot of it doesn't make any sense maybe there's a
> pattern somewhere in all the noise.

To close the loop on this long thread, I finally found the root cause and submitted a correct patch here:

https://lore.kernel.org/linuxppc-dev/1105090647.48374193.1700351103830.JavaMail.zimbra@raptorengineeringinc.com/T/#u

500+ loops and counting on this boot alone.  I think we're good now.  It was a ppc64 specific bug in the end, corruption of a specific FPU register. 
 It was definitely provoked by specific signals being sent, but also had a somewhat wider scope than just that, which was making debug quite difficult.
