Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B859B3E490
	for <regressions@lists.linux.dev>; Mon, 27 Nov 2023 22:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="r0o1JnHb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701125624;
	bh=rOsMOelm9KRpuNWnGEzLQU2rWACE4VTemWp1UmvKWw0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=r0o1JnHbuwfMu52tsXpn+LH+mtP1FzON3AeXD30koUwocp09UXnyO2Rr+mwQBfblh
	 48VH4EUW2fiB4zoG9MssajfgR97t51aDTy24ymuAhfAc0Pau9MJBhbqEmGQ0RdiLZl
	 OoD5vKY40aRJIi6vCtyzQEPWnWlaELAl1ioKgyQHZCcUyLg3kHqB1p+yet5/X0XRl0
	 5d0RyXj5HXKmQUCkSdB1H8YdodoMZgZKoCMKUTWeabP6upi8C9W7VdmYXUUj1cBedz
	 VgfAYoEcNikhFeEh9qPzo3LyNcspozcpDh2B+v/NtlmTMuEzEkOVS5oK6OdJzT0XDD
	 i0ZoPG5DQtp2Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SfLVH3W5Tz4wbp;
	Tue, 28 Nov 2023 09:53:43 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: Jens Axboe <axboe@kernel.dk>, regressions <regressions@lists.linux.dev>,
 npiggin <npiggin@gmail.com>, christophe leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
In-Reply-To: <1276384468.50536225.1701110354677.JavaMail.zimbra@raptorengineeringinc.com>
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com>
 <877cmc7ve9.fsf@mail.lhotse>
 <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com>
 <874jhg6lkn.fsf@mail.lhotse>
 <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com>
 <87leaqjs8x.fsf@mail.lhotse>
 <1340817182.49635143.1700784119445.JavaMail.zimbra@raptorengineeringinc.com>
 <1276384468.50536225.1701110354677.JavaMail.zimbra@raptorengineeringinc.com>
Date: Tue, 28 Nov 2023 09:53:36 +1100
Message-ID: <874jh64xlb.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Timothy Pearson <tpearson@raptorengineering.com> writes:

> Just wanted to check back and see if this patch was going to be queued
> up soon?  We're still having to work around / advertise the data
> destruction issues the underlying bug is causing on e.g. Debian
> Stable.

Yeah I'll apply it this week, so it will be in rc4.

I wanted to be more certain the corruption only happens in practice with
io-uring before applying it.

cheers
