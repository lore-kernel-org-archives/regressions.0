Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7207D518
	for <regressions@lists.linux.dev>; Tue, 18 Jul 2023 15:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8838C433C8;
	Tue, 18 Jul 2023 15:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689694674;
	bh=4lzpTYj2kIXHXWaJYs/83EbVi/o1EKnwum3LfzARXr8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cNzyHRvyhQo8fy2tY5qhlfauywDksEZ+wW+jlrLSvyw0CUNqEW+spb+JpKUeB2vOF
	 XRpuWyi5psLzSvAtrML+E9fp18f+Wxveel+SbkG2kyrEQIi1sELC0TkdIjv8SKOj6E
	 HvfhLomkv0Sc67piLn6lGkvzrpMvQz7GqNiKqfkczbT1uZnRHaCUYs7u4O3MUvUPeQ
	 rP7waYDkAeKoM0V0LAbaZjfjyY+bD8tj/zX3/bJBJtCrOHshOjfjNsx8x45l1cEGDE
	 37ios2bSMjDt03MW1wvDgqPoxSzZVqBJqMqK2DNaN3mYtVo/gjp/77YoiLOgZpOhX2
	 XoHMPrp44k96A==
Date: Tue, 18 Jul 2023 08:37:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Krzysztof
 Kozlowski <krzk@kernel.org>, corbet@lwn.net, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH docs] docs: maintainer: document expectations of small
 time maintainers
Message-ID: <20230718083753.2d1e003a@kernel.org>
In-Reply-To: <bb8c6476-283c-3bc6-710b-5a8602ccd40e@leemhuis.info>
References: <20230713223432.1501133-1-kuba@kernel.org>
	<6f1014cd-f8c5-f935-dcc7-4f5a6b85e473@kernel.org>
	<20230714101028.337fb39a@kernel.org>
	<bb8c6476-283c-3bc6-710b-5a8602ccd40e@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 15 Jul 2023 12:31:02 +0200 Linux regression tracking (Thorsten
Leemhuis) wrote:
> Maintainers must ensure severe problems in their code reported to them
> are resolved in a timely manner: security vulnerabilities, regressions,
> compilation errors, data loss, kernel crashes, and bugs of similar scope.

SG, thanks for the suggestion!

One edit - I'd like to remove "security vulnerabilities" from the list.
Security implications are an axis on which bug can be evaluated, one of
many. All kernel bugs have some security implications. Placing them as
a category like crashes, lockups or compiler errors could deepen the
confusion.
