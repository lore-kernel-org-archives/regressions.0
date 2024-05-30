Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD8A51C5A
	for <regressions@lists.linux.dev>; Thu, 30 May 2024 19:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717099068; cv=none; b=ldLdndRLQogV0ROdFdbf4oC+u+pkqlzp4MI8deNiSKO7hKV7JRp7wXsQnXLfJaRN0DrPRTEgGqVUo7jguSzvCIaZebZ1sjL5y7QZPwkFnjEZir/AewS0G2xv0y95bkLXsGfyKoCRcDGh/BDnzdbL35EtmxhzOfFu49SEKxfJAG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717099068; c=relaxed/simple;
	bh=70Z6Hwch5cDX1Yag0UqBCh6oP6TsMaD/hqajVrV9aAI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Fb3Q/KpvmsWvfCmeADCdGoD19fXLZttuquukpmeOQOTbIdgLgxBZJzlJ2FPpQ4HKGFjTOP2LDaY/79nRjJcBtFC78q/rbL909nfJ0toxc1RPV/sXK9EKMXC7zqFDLVrf0ea9zWyuhs8kXUT4pOdlOJzPK5UE81BU5HpLU+0cykE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=NINj71SQ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="NINj71SQ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8FA1A47C39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1717099065; bh=70Z6Hwch5cDX1Yag0UqBCh6oP6TsMaD/hqajVrV9aAI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NINj71SQ5RKm42gjS56ALOFe5BwtgBRPzAFWF7Sp8OLpdSxFbuhOPHp6rezJ6qIYx
	 7zIQTrLkA/SAVPpfCTsdkkANt/rTREKwRWdSfc8Ep2GnShsFVOMn6lwnogaEtbfoos
	 Hwm9Kx3qYgZaNpPyFQzYpVVp1agJF0A5MaNVaJIQSNmkdKuzkLcJrrpXwX8ZxVyI57
	 1iYXELLAdUzpEFYbIZUI93Jsps27HR8PQ6bj9FYkW4nCe6h+XyBxZwqdCs7HujaqYa
	 S3yZw9ZlFThOfJDyYxXBC0birY9a4cGgvfUTjXjuUVgq2GTQJt8ozj4/jgSiTDRJv4
	 UJwu82eIUJ2hA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8FA1A47C39;
	Thu, 30 May 2024 19:57:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karel Balej <balejk@matfyz.cz>, Thorsten Leemhuis <linux@leemhuis.info>,
 regressions@lists.linux.dev, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: balejk@matfyz.cz
Subject: Re: [PATCH docs-next v3] docs: handling-regressions.rst: recommend
 using "Closes:" tags
In-Reply-To: <20240513084145.2460-1-balejk@matfyz.cz>
References: <20240513084145.2460-1-balejk@matfyz.cz>
Date: Thu, 30 May 2024 13:57:44 -0600
Message-ID: <871q5jcbt3.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Karel Balej <balejk@matfyz.cz> writes:

> Update the handling-regressions guide to recommend using "Closes:" tags
> rather than "Link:" when referencing fixed reports. The latter was used
> originally but now is only recommended when the given patch only fixes
> part of the issue, as described in submitting-patches. Briefly mention
> that and also note that regzbot currently doesn't make a distinction.
>
> Also fix a typo.
>
> Acked-by: Thorsten Leemhuis <linux@leemhuis.info>
> Signed-off-by: Karel Balej <balejk@matfyz.cz>
> ---

Applied, thanks.

jon
