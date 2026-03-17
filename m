Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E498323D7E3
	for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 17:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767840; cv=none; b=C24RzhKoqk1v+2g8v3h9Rk1oheTz22efLBvLWHcwt6gWeYTHlDJYR1MU2jZ6yUeU+uENFqslbsXiCDlgQ0fGrBbJw4TqRZjaT5TRkllTfDba2szPluSBfW1DvFAbh6O6wkB1k76Ws9b3MPejUokWJCbeoEdwh0wz2q8c5U5N1Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767840; c=relaxed/simple;
	bh=XhSjXodKL8Rt/Y67hCKslvvCpl7oVhQShD0o7Pvcs6k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uApy1CPHOLrZ515HxOA1b89z/uLf8u7iYn2Sama9hWW8leC7cK/e1zWCs1lBY7Gty6efK4MGLtxjmbn/KHVnQyR7qEZq/sCxYyUG20sYUsfQImGxHhR254tHR3N2nRaYTJs3WyyivmHtDGIrOg83sXUNX3ViQb+iiAruFzUzBpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=FHzC+KyJ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="FHzC+KyJ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3DF9A411D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773767839; bh=XhSjXodKL8Rt/Y67hCKslvvCpl7oVhQShD0o7Pvcs6k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FHzC+KyJww9n9K3dOwGFMr8Lp8aJM6FHAJXQMgI3cKiLbu9hZ8uNnvgThGuNTGWF1
	 wmf6vvVafAlxMDplcRgPFok5wx6N1zlNdKfajht6nd8XYJn3gnN5lY8wu1sI8+U0gt
	 o7LWqUEaXBy0YpCmlt/gG8TJ+eYHFJ2EsA1dE6wwgXLIpPvLZQ/By6yef8rMNdqQv1
	 pQeg6ZPabk/vr6jHl+ObduuveNeGFRm+EkdoFAH5GC6b3tL2cpp70q0Pe2pbsuSDUz
	 D8xjae+mRn6HecwUupnl2ZZjMtvFuixWc2mnPVYmA/S6F1WCWb72kq59+Zir5Dup8L
	 6FMj92vuJgqNw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3DF9A411D3;
	Tue, 17 Mar 2026 17:17:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: linux-doc@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] docs: reporting-issues: tweak a few areas and
 rewrite the ending
In-Reply-To: <cover.1773750701.git.linux@leemhuis.info>
References: <cover.1773750701.git.linux@leemhuis.info>
Date: Tue, 17 Mar 2026 11:17:18 -0600
Message-ID: <87pl529y01.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> This patch-set tweaks a few parts in the fringes of our text on bug
> reporting while replacing two sections at the end with a new text as
> proper appendix that hopefully better fits the purpose and covers more
> aspects.
>
> This is the first versions of this patch-set, but it starts as v2, as it
> contains three patches and a few bits that were part of an earlier and
> bigger patch-set. This incorporates review feedback given there. The
> last patch in this series is mostly new, but includes a few bits from
> patch 4 and 5 of the earlier series.

I don't see anything to complain about here ... if nobody screams, I'll
apply them in a few days or so.

Thanks,

jon
