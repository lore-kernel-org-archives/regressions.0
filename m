Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFB763D6
	for <regressions@lists.linux.dev>; Mon, 21 Nov 2022 18:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57163C433C1;
	Mon, 21 Nov 2022 18:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669053808;
	bh=NPPlVNTPIt4eZj5V4vKEYND7lKQPzlo4Jgr8cU3tjk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNFJxEw69uAcvtWuATMKdAwYS+zHD+dtmBA9L1isrOaa2fTZn3v7Lrur5G6PrX4NG
	 LfHeuTyApHTnDgYJZQ4+IJwHbJU6FFXTcci6aFO9+/dAUv6gwkuVe8B9O5Q+D7+wSc
	 D25q/T49IUKIBj2q4WmrBK+VaVab0XZWI2YgZE0bipmrm0L2+8KBeAIuWxHgpG2J3C
	 aSstHsMaEY3bDtSruJ1DzJ/u3GX8dCD/rlFjSkasAl6ppsQpHzFBidPBIkA5QBqYps
	 cBPNPOOkZy2iBowz6Usnnmf7yN4xJM1pjcAqDMbE9m+8ooacLpojhX03s3jDFQoIbz
	 k6FhMWvh2KpHQ==
Date: Mon, 21 Nov 2022 18:03:22 +0000
From: Will Deacon <will@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
	regressions@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] arm64/mm: Drop redundant BUG_ON(!pgtable_alloc)
Message-ID: <20221121180321.GA7645@willie-the-truck>
References: <CA+G9fYuYashEQsCfScoVbVqAxeXC4w6VnenO-5dHDH8OEfFBTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuYashEQsCfScoVbVqAxeXC4w6VnenO-5dHDH8OEfFBTQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Nov 21, 2022 at 09:17:18PM +0530, Naresh Kamboju wrote:
> LKFT detected arm64 boot regression on today's Linux next-20221121 tag.
> The Kernel boot log did not show anything on the serial console.
> 
> Anders bisected this problem and found the subject commit is the
> first bad commit.
> 
> # first bad commit: [9ed2b4616d4e846ece2a04cb5007ce1d1bd9e3f3]
>         arm64/mm: Drop redundant BUG_ON(!pgtable_alloc)
> 
> Later it was found this lore link which was already reported [1].
> 
> ref:
> [1] https://lore.kernel.org/all/Y3pS5fdZ3MdLZ00t@dev-arch.thelio-3990X/

Yup, I've queued a revert locally and will push it out this evening.

Cheers,

Will
