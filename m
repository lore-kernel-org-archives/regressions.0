Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217B8523781
	for <regressions@lists.linux.dev>; Wed,  9 Sep 2026 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966847; cv=none; b=g3CHXiHajVOuXeycD28wu/m8g0q+UIw2rB1kmhCGm5qDWG1nvf/rVV47OxdZ/l3vBTdT1ORTTACaPAKiPJEduWlk+1/K2Tn3TrKrHv5GM66CB/+KxvTvTGIMlGWSjscg7FZne56GZCAVXq47BzElUkCqAJBZI/7SmAv6djJzCbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966847; c=relaxed/simple;
	bh=5nErqxyy4U/PrC3bwsfzZKm5u+9t+1sJ9lGBoWWFN+k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KDj6TTU/s9WTMr0PAj5YyMOJr70QDRFTg6BmESOF4dEosVOYUd7slBFn4HuEsZOSPZjo95FJDmYk9UssKGyF1ikdiGUhRlaE093B2ubsKkltB+YgS6rrJVdP3nYQ0S0BPPRzUDNzMJAWPfALSmHeWGp3TTB6xBDLL8r625fm4uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qeTehaVC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="qeTehaVC"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 71351408E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788966845; bh=Xovuw/DMI9TMu0yxaKPoqBHlh/i31hlhlIPmpkJokkA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qeTehaVCs7MB4/Vzyqx78yyUdYsdHLC6soRjmHmBdMPh/+oFVwYfi93Vd8TnqeMnf
	 mQkGu6AdFOrLRJSScXdBHycoDVNnl13oginUARFLxVlngo42oh1nEAwxvGxQCnY9G9
	 /ln1YIOlWqlGcRaqzODX3mfAy1nYGkTbIPTjGwyTYzbsW7v3akvSrgKWHGaNX7gu6a
	 GObCQDybOvC85fmwyMq6BistRYDu7TzGlUs6gdV4Eh5ERqogG5a7K5q3WU06niLQsP
	 rshgPsyW8elLlUwA2e480YbSpkYUVbBjauUCbO8Cjirl+AgJtIwv0AgLqNWEzU+eCR
	 aq05xWCMTTgmw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 71351408E5;
	Wed,  9 Sep 2026 15:14:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ruben Sutton <ruben@scstudios.tech>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Thorsten Leemhuis <linux@leemhuis.info>,
 workflows@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Ruben Sutton <ruben@scstudios.tech>
Subject: Re: [PATCH] docs: process: use gender-neutral pronouns
In-Reply-To: <20260909144100.78177-1-ruben@scstudios.tech>
References: <20260909144100.78177-1-ruben@scstudios.tech>
Date: Wed, 09 Sep 2026 09:14:04 -0600
Message-ID: <87pkymlao3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Ruben Sutton <ruben@scstudios.tech> writes:

> Several process documents use gendered pronouns when referring
> generically to developers and maintainers. Use singular they instead,
> making the language inclusive without changing its meaning.
>
> Leave pronouns referring to named people and text in attributed
> quotations unchanged.
>
> Assisted-by: LLM
> Signed-off-by: Ruben Sutton <ruben@scstudios.tech>
> ---
>  Documentation/process/2.Process.rst            | 2 +-
>  Documentation/process/5.Posting.rst            | 2 +-
>  Documentation/process/6.Followthrough.rst      | 2 +-
>  Documentation/process/handling-regressions.rst | 2 +-
>  Documentation/process/howto.rst                | 2 +-
>  Documentation/process/submitting-patches.rst   | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Ouch.

I have no objection in principle to this change, but if we try to clean
up the whole kernel in this way we're going to have a *lot* of churn
and, undoubtedly, some unpleasant discussions at some point.

I'm tempted to raise this question at the maintainers summit to see if I
can get some sort of project-wide policy laid out.

Thanks,

jon
