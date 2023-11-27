Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192A72DF91
	for <regressions@lists.linux.dev>; Mon, 27 Nov 2023 18:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="Hc56b9w4"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id B5D9182853F9;
	Mon, 27 Nov 2023 12:39:17 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id HtmLQvd4iRqn; Mon, 27 Nov 2023 12:39:17 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id DEC328285877;
	Mon, 27 Nov 2023 12:39:16 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com DEC328285877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701110356; bh=xzRtKEXNSZXRxueeraHHFnjhN1dbr0ogCssrNQclvqo=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Hc56b9w4Txk34dZBAnTXub8aqBoaEbB1TRcKoKAEXfV4gLtGv0Swab12d/6RAhK1H
	 cCGuxVDe930FNnYBdZ0Pw3CiN7F9FYD6dDeFfpHu5EYzYnFj4CAG3uVs24iS1w0mbz
	 FqR15phex2Ok1QAN7UQQ4/uQQJpjaYER0LEKp7wQ=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Sl2aoHRTI7dG; Mon, 27 Nov 2023 12:39:16 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id ABAB282853F9;
	Mon, 27 Nov 2023 12:39:16 -0600 (CST)
Date: Mon, 27 Nov 2023 12:39:14 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Jens Axboe <axboe@kernel.dk>, regressions <regressions@lists.linux.dev>, 
	npiggin <npiggin@gmail.com>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <1276384468.50536225.1701110354677.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <1340817182.49635143.1700784119445.JavaMail.zimbra@raptorengineeringinc.com>
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com> <877cmc7ve9.fsf@mail.lhotse> <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com> <874jhg6lkn.fsf@mail.lhotse> <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com> <87leaqjs8x.fsf@mail.lhotse> <1340817182.49635143.1700784119445.JavaMail.zimbra@raptorengineeringinc.com>
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
Thread-Index: OkyGhBWE6ESNaH7+hHk9xkTdc0AVjZlU0+oQ

Just wanted to check back and see if this patch was going to be queued up soon?  We're still having to work around / advertise the data destruction issues the underlying bug is causing on e.g. Debian Stable.

Thanks!
