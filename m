Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CD4377ED2
	for <regressions@lists.linux.dev>; Tue,  3 Mar 2026 18:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772561594; cv=none; b=u6mt3SZXQ28M1DpYq96I2VXY8Rx6eXJSwQ44tCIsIFs4kiUtU2Swmy2nrkq3sfTvwDFD0GPqNiCILUWEJY1HQW+7LbzNEpHZC4ruDE4BEtmTVs95i6O40dKR492DlRteAPdO1P9h0YwWrQcULBVYkce9uL7bwe44zo9nXNcfp60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772561594; c=relaxed/simple;
	bh=uwGs40p6feBIPmxttrBlFcsUuz8AcouQMwkXE1EJb2g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UPHK/OtKqvam9L878YLC1hpu3XPPBS630xDz9+PSiVESBzqBfd+ckfYHEc1Zo4x+cftzAJHVQif+4u6g1W3YuXS3NjF8Q1AqnFfBKa9o1FV8szNct8/Uo7E06Xw+81y/Zl2BiZjujJ8RVFao218vw7oVHgh08pRDt2wqRHWPHyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=TXIknWRt; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="TXIknWRt"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A414940429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772561591; bh=ead+Jt3hyOuA/EpgwUGvluHqgPzw4HZOyqlUlURdtUQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TXIknWRtFY9RUwFfzFovBV1ooGTwfgCtdFOCBeEQn0SlgFeR1Ps0gl3PFg3XeR9Ay
	 VFfsfM0T8riQ6FqUfB7Yqr+2CiV1gKAIjnsrzqSwDQ01bpZVqPiHSror3dKVVIqL41
	 +hdwIvmfV8iNNnbvp1NYTinSBgIs76ZEhFdobZL3isdZ8UQQH/Cpx8W+ms1Iylm35Y
	 1qNa+FChAvWEK6VZXTIXj3AvaLjPMJMCQxNtav/337O+vVm20EgmnXA8sILr5EqJ/o
	 79kvX5T6h0yNA5EYN/xC+RSpObOxOmsmXXM30IzJbza64HtaJJ7UZ215r1lhmpjgEO
	 7yk99GjI8KSlg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A414940429;
	Tue,  3 Mar 2026 18:13:11 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: linux-doc@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] docs: handling-regressions: add, trim, and sort
 quotes from Linus
In-Reply-To: <c825d7981e1badb22d15f3f6fc9c95001a017f09.1771833924.git.linux@leemhuis.info>
References: <c825d7981e1badb22d15f3f6fc9c95001a017f09.1771833924.git.linux@leemhuis.info>
Date: Tue, 03 Mar 2026 11:13:10 -0700
Message-ID: <87342gbx3d.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> Add additional quotes from Linus while trimming the existing ones and
> sorting them all into categories. That makes it easier for new
> developers and maintainers to look up how Linus expects certain
> situations wrt regressions to be handled. The earlier sections in the
> document already explain this, but those parts are often questioned --
> or not considered authoritative at all and plainly ignored. Having it
> straight from the horse's mouth helps get everyone on the same page,
> even if that makes the document quite a bit longer (the raw line count
> of this section doubles, but the number of characters increases by
> nearly 50%). In return, this covers a lot more aspects and, due to the
> sub-headings, is easier to navigate.
>
> In contrast to the more neutral description in the early sections of the
> document, this also provides a better insight into how serious Linus is
> about the "no regressions" rule and how he wants it to be interpreted in
> practice; this makes it easier for new developers and maintainers to
> understand things and prevent run-ins with higher-level maintainers.
>
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> ---
>  .../process/handling-regressions.rst          | 695 ++++++++++++------
>  1 file changed, 463 insertions(+), 232 deletions(-)

I really have to wonder just how many quotes from Linus are needed here;
that's a lot to plow through.

Oh well, I've applied the patch, thanks.

jon
