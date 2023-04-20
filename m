Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68B61844
	for <regressions@lists.linux.dev>; Thu, 20 Apr 2023 04:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0016C433D2;
	Thu, 20 Apr 2023 04:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681963336;
	bh=4be8Vmw4Xr7f1Xkb+YKX82snsvYgeZSDSgMs/ZlMiw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCvbnghgf+e8NRhLYe+Zpmqxw1So9qWZnVLNicp1MY4d9VEraPbAsv6B/up9eKlyx
	 FwMG8FcMpVGXTOyIrVeLhRQx6te9YfIes8t8cvgFKAnVQ43IP1iAHkUaY0jwGQ/56L
	 rflxqwvrSMIo+6ojHiqtxelUhZGiuYwLffkmJyHfPZIIMpjG9qyDoAI4uqamlzR/R+
	 P1rq/x+/0BpM2m+zeJDrFfgOHOCPbt6ZpLysoIJIiNUZIa3KGxMkcmzpNxlT4nLvWV
	 GFyGjgNQnkVz5eoRV1Fj9YnKRA7tRbXqFNSQ09YRNiEThqelXqp3sU5GosH9dY6xiO
	 7D3jMvKgBlEAQ==
Date: Wed, 19 Apr 2023 21:02:12 -0700
From: Saeed Mahameed <saeed@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Paul Moore <paul@paul-moore.com>,
	Leon Romanovsky <leon@kernel.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Shay Drory <shayd@nvidia.com>, netdev@vger.kernel.org,
	selinux@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>
Subject: Re: Potential regression/bug in net/mlx5 driver
Message-ID: <ZEC5RJCmOx43yRGP@x130>
References: <ZDiDbQL5ksMwaMeB@x130>
 <20230413155139.22d3b2f4@kernel.org>
 <ZDjCdpWcchQGNBs1@x130>
 <20230413202631.7e3bd713@kernel.org>
 <ZDnRkVNYlHk4QVqy@x130>
 <20230414173445.0800b7cf@kernel.org>
 <ZDoqw8x7+UHOTCyM@x130>
 <20230417083825.6e034c75@kernel.org>
 <ZECKn2WwX22wrsMt@x130>
 <20230419174625.280a6ed9@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230419174625.280a6ed9@kernel.org>

On 19 Apr 17:46, Jakub Kicinski wrote:
>On Wed, 19 Apr 2023 17:43:11 -0700 Saeed Mahameed wrote:
>> So I checked with Arch and we agreed that the only devices that need to
>> expose this management PF are Bluefield chips, which have dedicated device
>> IDs, and newer than the affected FW, so we can fix this by making the check
>> more strict by testing device IDs as well.
>>
>> I will provide a patch by tomorrow, will let Paul test it first.
>
>What's "by tomorrow"? Today COB or some time tomorrow?
>Paolo is sending the PR tomorrow, fix needs to be on the list *now*.

I just saw you applied the revert, anyway here's our proposal:
https://patchwork.kernel.org/project/netdevbpf/patch/20230420035652.295680-1-saeed@kernel.org/

We just tie Management PF to specific device IDs where it's actually
supported.

I guess I can bring back a combination of the original patch and my fix
to next cycle.
