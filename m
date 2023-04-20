Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748EA15CC
	for <regressions@lists.linux.dev>; Thu, 20 Apr 2023 00:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6316AC433EF;
	Thu, 20 Apr 2023 00:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681951396;
	bh=3TfSNpFYsuhxboTNumVnC5z5KX5U1yvWsKH2bQsrios=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XXm7+VqkcSuSfr75tU1q/8kzjPiLx9R2H7MT+z59XkHoh7y+n6BFa4ZsP/lSS5Op/
	 //Bv6mhBEG0ADIGRs0IlXQ3BaZIetBr+kiHpMJsEQTokgBUpsr+ZMyGeWAABqVMqyS
	 DpcYp3RCl/TZuauDdZLOezqu25ymatHL/dcGQoOuLdyr8WxsAaI0LIAp/OOQmx6gIn
	 z2LsaXJqe09nmyImfbN2gllFiUHdJMyUs7RkFgVmdWpaZCt+j1K4SoOPLkFjqsJ9co
	 dN8k975bSGvdD/xJ8vsltoN/NJSDMcnfEC7Acm63wFzu2Vm8PyATtdCO2MWh2CIWWZ
	 vDLMLd9U8VMkA==
Date: Wed, 19 Apr 2023 17:43:11 -0700
From: Saeed Mahameed <saeed@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Paul Moore <paul@paul-moore.com>,
	Leon Romanovsky <leon@kernel.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Shay Drory <shayd@nvidia.com>, netdev@vger.kernel.org,
	selinux@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>
Subject: Re: Potential regression/bug in net/mlx5 driver
Message-ID: <ZECKn2WwX22wrsMt@x130>
References: <ZDhwUYpMFvCRf1EC@x130>
 <20230413152150.4b54d6f4@kernel.org>
 <ZDiDbQL5ksMwaMeB@x130>
 <20230413155139.22d3b2f4@kernel.org>
 <ZDjCdpWcchQGNBs1@x130>
 <20230413202631.7e3bd713@kernel.org>
 <ZDnRkVNYlHk4QVqy@x130>
 <20230414173445.0800b7cf@kernel.org>
 <ZDoqw8x7+UHOTCyM@x130>
 <20230417083825.6e034c75@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230417083825.6e034c75@kernel.org>

On 17 Apr 08:38, Jakub Kicinski wrote:
>On Fri, 14 Apr 2023 21:40:35 -0700 Saeed Mahameed wrote:
>> >What do we do now, tho? If the main side effect of a revert is that
>> >users of a newfangled device with an order of magnitude lower
>> >deployment continue to see a warning/error in the logs - I'm leaning
>> >towards applying it :(
>>
>> I tend to agree with you but let me check with the FW architect what he has
>> to offer, either we provide a FW version check or another more accurate
>> FW cap test that could solve the issue for everyone. If I don't come up with
>> a solution by next Wednesday I will repost your revert in my next net PR
>> on Wednesday. You can mark it awaiting-upstream for now, if that works for
>> you.
>
>OK, sounds good.


So I checked with Arch and we agreed that the only devices that need to
expose this management PF are Bluefield chips, which have dedicated device
IDs, and newer than the affected FW, so we can fix this by making the check
more strict by testing device IDs as well.

I will provide a patch by tomorrow, will let Paul test it first.


