Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD198BE0;
	Fri,  5 May 2023 15:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33141C433D2;
	Fri,  5 May 2023 15:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683301939;
	bh=esyJrzwkSGQWNXny2nF4USQbJ4A4dvrAVZjB18tgnGQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ksNuYaJneF1n5GdsdmblG/wfMw4Ifmr9EjRhogMt0WJVaPYLKnBBHlCmNGlaweJHo
	 Xet4li83H6Y7nlIag4d2jqyMORJnG91sBO28VfNI5aKzsMr609H3WjPuFv48m9upFQ
	 i6jGbc9hm3XN790k14TmB4q9a2HmW7Lis/c2gkHig/5V/+Ev4xTYUIOldZW9tjtYyz
	 Jefy/LVY1kLq8U1AVN43FSV2UDnJ7TU0DTAtwu5m6845dkjllnPeR5JbOFSEtKTPyH
	 KlvSKXtF1b1aRIxD/GPTf49aU7uqlbtehfNdoHLzKqHNXmCVvONodENXnagMJYquuU
	 nK/esnlwx9Oog==
Date: Fri, 5 May 2023 08:52:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: workflows@vger.kernel.org, aros@gmx.com, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, tools@linux.kernel.org, linux@leemhuis.info
Subject: Re: Introducing bugbot
Message-ID: <20230505085218.60c62d75@kernel.org>
In-Reply-To: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Apr 2023 17:45:31 -0400 Konstantin Ryabitsev wrote:
> Hi, all:
> 
> Per our discussion last fall, I've been working on a bridge between bugzilla
> and public-inbox, which went live in the past few days. It's still a very
> early release, but it can do the following:

What about closing the bugs once they had been fixed/triaged/proven
invalid?
