Received: from mx.ssi.bg (mx.ssi.bg [193.238.174.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A3C15688C
	for <regressions@lists.linux.dev>; Thu, 19 Dec 2024 05:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.238.174.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734584804; cv=none; b=upUe3pLElKWybuC8jSfV9t2mxm5nEkAodlGRQ4oexrLtBMN9meR/wTocmZr7z9/8PpeJuhSUZRh139c+I9Oj1WQCJiEkwQGdEz7zoZapWiocJ7K2/9+luIYVD0s5dED7RSaoftnvIGMbSFga9zxEi8rt/Ltky2wAfsFfft+mWn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734584804; c=relaxed/simple;
	bh=Z32VB8nanEUnJPIfQ/z+55VU6zYxBzUbLWcwQ9lFLYA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ac1e45403q5e2EktS0QgVRMk5AGiPowxAuchYU8MkF9a4deis/Ety9RqoXRv1t8UqGXgRTEAjKfYuCCQDHhLHSSlg68r7sJofOvQ2qNQ1AMNgkkgq0m4r4RPv+gqNNkSAZ/ULaHLoNZEuxO69qoCejRm3b6JxGAhXUDCxtGkudY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ssi.bg; spf=pass smtp.mailfrom=ssi.bg; dkim=pass (4096-bit key) header.d=ssi.bg header.i=@ssi.bg header.b=6QNb3x+E; arc=none smtp.client-ip=193.238.174.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ssi.bg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ssi.bg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ssi.bg header.i=@ssi.bg header.b="6QNb3x+E"
Received: from mx.ssi.bg (localhost [127.0.0.1])
	by mx.ssi.bg (Potsfix) with ESMTP id B345323564;
	Thu, 19 Dec 2024 07:06:31 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ssi.bg; h=cc:cc
	:content-type:content-type:date:from:from:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=ssi;
	 bh=1cOVO0SaylYhhURTaPnk/qOmR5sKtjr4wVU6mmJAdqo=; b=6QNb3x+EUBmT
	TABz1BtAb78ANqrDJ01HMZP1kjtrkQmt0aO02df8e6EcVWtWa+w4QeP+qWRzYSG2
	HVOOV59uV2SsZ24WwCrP1ZFr9pP/v4B5TYwJM/iHeUQU+1D2XJSI8aZt0DhtMjQp
	TWJKDDkhrjC+sWHlKT5y1S5qQDFevfwlvxrAnWWtFC6wG0PzzLL6IHdBn4cJkRnQ
	HkzWXYaeZcDKJAJ4t05mNYrVaZCJ29dipGbUnR/glev2aO//HpekCu1PMVFFa28V
	q250M5yXbWcmNqdn5gJJGGafX8D9a5Ix1jsggjhXCIe5WLx3ELkVWmDzDyaSP01S
	ieK8fhby7i68zWKxV0SUh+2wm8PgLKg9o5yMj1kDdmy/F7nODzUzTirThcgA6Q+L
	lgAqcM8VYq6VZefsz7rhleFIuYe3PU1kT6WU/gSaohh+/lKgLkjuylwQaYJwt+sD
	IzB/fmt2y9wEGyqmnL8iQ5TKRErzNDNWgZGifEw6gqGRCORePB15WEOG1eZxIlW0
	wsmYjkJf0MF8gVk5UZm5Q7+N2GwOD3WmT4HxAkNThyTkg+1l7ba4g+dK8c//UBCX
	xS40AxJRSDU7kcGK1jqu+S5bbpPgJuBLghr93C4UUsxPc+mqODOmcyCztsn8FLUZ
	/h+HBBM4Q7BIMT1E4xGNf/4XZzIrAuY=
Received: from ink.ssi.bg (ink.ssi.bg [193.238.174.40])
	by mx.ssi.bg (Potsfix) with ESMTPS;
	Thu, 19 Dec 2024 07:06:31 +0200 (EET)
Received: from ja.ssi.bg (unknown [213.16.62.126])
	by ink.ssi.bg (Postfix) with ESMTPSA id 7E04615EB0;
	Thu, 19 Dec 2024 07:06:26 +0200 (EET)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by ja.ssi.bg (8.18.1/8.17.1) with ESMTP id 4BJ56GQl005317;
	Thu, 19 Dec 2024 07:06:17 +0200
Date: Thu, 19 Dec 2024 07:06:16 +0200 (EET)
From: Julian Anastasov <ja@ssi.bg>
To: David Laight <David.Laight@ACULAB.COM>
cc: "'netdev@vger.kernel.org'" <netdev@vger.kernel.org>,
        "'Naresh Kamboju'" <naresh.kamboju@linaro.org>,
        "'Dan Carpenter'" <dan.carpenter@linaro.org>,
        "'pablo@netfilter.org'" <pablo@netfilter.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "'open list'" <linux-kernel@vger.kernel.org>,
        "'lkft-triage@lists.linaro.org'" <lkft-triage@lists.linaro.org>,
        "'Linux Regressions'" <regressions@lists.linux.dev>,
        "'Linux ARM'" <linux-arm-kernel@lists.infradead.org>,
        "'netfilter-devel@vger.kernel.org'" <netfilter-devel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>, lvs-devel@vger.kernel.org
Subject: Re: [PATCH net-next] Fix clamp() of ip_vs_conn_tab on small memory
 systems.
In-Reply-To: <5e288aa5-5374-5542-b730-f3b923ba5a36@ssi.bg>
Message-ID: <a0ebe11c-4ca2-d2f3-8e53-0d9f44bfdda0@ssi.bg>
References: <24a6bfd0811b4931b6ef40098b33c9ee@AcuMS.aculab.com> <5e288aa5-5374-5542-b730-f3b923ba5a36@ssi.bg>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


	Hello,

On Tue, 17 Dec 2024, Julian Anastasov wrote:

> On Sat, 14 Dec 2024, David Laight wrote:
> 
> > The 'max_avail' value is calculated from the system memory
> > size using order_base_2().
> > order_base_2(x) is defined as '(x) ? fn(x) : 0'.
> > The compiler generates two copies of the code that follows
> > and then expands clamp(max, min, PAGE_SHIFT - 12) (11 on 32bit).
> > This triggers a compile-time assert since min is 5.
> 
> 	8 ?
> 
> > 
> > In reality a system would have to have less than 512MB memory

	Also, note that this is 512KB (practically impossible),
not 512MB. So, it can fail only on build.

Regards

--
Julian Anastasov <ja@ssi.bg>

