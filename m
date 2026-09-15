Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47F04D09ED
	for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 19:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499364; cv=none; b=p2oTQ2AxaNq3LNTy+M+8syTzN7dfh2MgwSpK0myBOzW+8CEnqL4gjSv1A+dwmlP6OLhXkeICPjknu2JIWzxZI0psNmTSlB0mdaaUPNjwRQL3bnuVpBtGdLxV3ykZRki1A4emtFCaLSlLnkL3smt1PdwzMjZyvzhIUbW36vZYuA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499364; c=relaxed/simple;
	bh=r6vTlWu8L+pqG2KYIxQD7/yU1/Nk0zwPFB3r5hkcTwM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lJxM/LLDncnsOFH8a3rS/A1CAtF//aUq3BHsq5KygA4Ll4aMlf6UlNko9AlYOsMwc7zrtb/EeDMAFjnIfqLb7tvCw416IIYU+uGwYq1J1LlC+4KfG18RxSP3FhZtZ5kqsLdfhFhkcash/tNkBJbFaehDj3PQSGoub2NXTKhJUmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Ddk8RccR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Ddk8RccR"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BE4274090B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789499362; bh=lOg3uXb5f/Prl9xDMmMuiDmMSucetHILyt/F6LeO0fs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ddk8RccRWEIcLrdqoVaF8OfjYCyvDRqsM83i4hOoCJitzdv4pt41/kqWElT4Vi4BU
	 eEGDtaapXxBu6P+Am70nm2L+c0lM8s4VQAKN7U32Qx8NJC0UYO4GzJC1t5G3gV+JG/
	 5XXSSD+W+WE7GAWY8VRognFxjuAzTnzqc7NRj8RRfze6RWxdKhA3FgiH3Lu3AcRHt+
	 U3mtoUKO811z5ihvvvWIMQQhT8Rd5LYjGizqNkBR7/1hR8biIf3YFHRemgDegZovIJ
	 GclT8BwN0I28Ac7P3W+459pTKGh67H2A1K6l9uDBAwC6ucoJBw/vA0pNAr1zx94eo3
	 ydOijOf2uMnaw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BE4274090B;
	Tue, 15 Sep 2026 19:09:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ruben Sutton <ruben@scstudios.tech>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Thorsten Leemhuis <linux@leemhuis.info>,
 workflows@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Ruben Sutton <ruben@scstudios.tech>
Subject: Re: [PATCH] docs: process: use gender-neutral pronouns
In-Reply-To: <20260909144100.78177-1-ruben@scstudios.tech>
References: <20260909144100.78177-1-ruben@scstudios.tech>
Date: Tue, 15 Sep 2026 13:09:20 -0600
Message-ID: <871pau9vrz.fsf@trenco.lwn.net>
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

I have gone ahead and applied this as a clear improvement.

I do still fear a deluge of patches changing pronouns throughout the
kernel tree, though...that would be a lot of churn, and sooner or later
it will surely bring people out of the woodwork that we would probably
prefer not to hear from.

jon
