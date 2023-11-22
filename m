Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DFFC155
	for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 05:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="YogX3JWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700629314;
	bh=cnv4HPjqzpENgSwb6uKQtFMG29qppfeUnvFNRoTLgL0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YogX3JWOhSw5uZggo5VoYNmRhvjL8UEBdsqPezIoy7PJ+trAgLaMfMJs8byrttGCR
	 taH/aP/aqTwAsrEhaMUx7N+eG51Ves5Mz12AtHGR8kGJ3+jQ2eV9K5RpF/lFQIAgWx
	 XwlXSVNwBejFErkFRBYnW/zxGfE48on1DDTfDMXdeMlhuiswDvqpTDRqQt0iANRZ8M
	 zU5aTHtRkC6S4A1UHdKohYl1b6sIXunJ6ZvricfU8x2pNex6H1vd2LEtjm6WbXOjK5
	 rX4upN14k9Nt8TwL9fMBYdQJIt/Uxy2anQtmpEV6O/HNz+w+nKIw40CwvAoFaWtOyB
	 oEMqJMXhDzGGg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZpxr3Ynvz4xNG;
	Wed, 22 Nov 2023 16:01:51 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: Jens Axboe <axboe@kernel.dk>, regressions <regressions@lists.linux.dev>,
 npiggin <npiggin@gmail.com>, christophe leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
In-Reply-To: <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com>
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com>
 <877cmc7ve9.fsf@mail.lhotse>
 <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com>
 <874jhg6lkn.fsf@mail.lhotse>
 <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com>
Date: Wed, 22 Nov 2023 16:01:50 +1100
Message-ID: <87leaqjs8x.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Timothy Pearson <tpearson@raptorengineering.com> writes:
>
...
>
> So a little more detail on this, just to put it to rest properly vs.
> assuming hand analysis caught every possible pathway. :)
>
> The debugging that generates this stack trace also verifies the following in __giveup_fpu():
>
> 1.) tsk->thread.fp_state.fpr doesn't contain the FPSCR contents prior to calling save_fpu()
> 2.) tsk->thread.fp_state.fpr contains the FPSCR contents directly after calling save_fpu()
> 3.) MSR_FP is set both in the task struct and in the live MSR.
>
> Only if all three conditions are met will it generate the trace.  This
> is a generalization of the hack I used to find the problem in the
> first place.
>
> If the state will subsequently be reloaded from the thread struct,
> that means we're reloading the registers from the thread struct that
> we just verified was corrupted by the earlier save_fpu() call.  There
> are only two ways I can see for that to be true -- one is if the
> registers were already clobbered when giveup_all() was entered, and
> the other is if save_fpu() went ahead and clobbered them right here
> inside giveup_all().
>
> To see which scenario we were dealing with, I added a bit more
> instrumentation to dump the current register state if MSR_FP bit was
> already set in registers (i.e. not dumping data from task struct, but
> using the live FPU registers instead), and sure enough the registers
> are corrupt on entry, so something else has already called save_fpu()
> before we even hit giveup_all() in this call chain.

Can you share the debug patch you're using?

cheers
