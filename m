Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385954685
	for <regressions@lists.linux.dev>; Tue,  9 Aug 2022 19:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C2BC433D6;
	Tue,  9 Aug 2022 19:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660072864;
	bh=tKMYoRRNrw7s9C1u1VUizQSkNhOJEAukDhZ5r3U923c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=U8yvOBycT+Ib1E2+PR98/FayttiKC9Otp2p8gnB5cQnlURjyMyLMfC6NxmC5PdWVY
	 Ydu7V0Ib0ucTeQClxXazs9yxSJh81CSjPQmbFQ75R64F05d5vmdC3PeGxKgPwisFqJ
	 Fw4P9+6fGLPuBg/Ggtnhzs6H9q8TnQ6w8H4eLafiKze97QFvn6cGO+KBWoADO2/G+D
	 qMO37QVVXTnXpxHjefJpqHd2oLkN0lsQQ70cebYf7CxqR0pHvBISLDU26pv1ulIp14
	 tiDxyBNx2BNLQsRSceJ009vzmWpReSV8UfZFGgmVu4jXBK6NhPZrXNv3hghwjiPVC5
	 1FCQf+jtm364A==
Date: Tue, 9 Aug 2022 14:21:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	bhelgaas@google.com, gregkh@linuxfoundation.org,
	linux-pci@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] changes to driver_override parsing broke DPDK script
Message-ID: <20220809192102.GA1331186@bhelgaas>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809112943.393684af@hermes.local>

[+cc regressions list]

23d99baf9d72 appeared in v5.19-rc1.

On Tue, Aug 09, 2022 at 11:29:43AM -0700, Stephen Hemminger wrote:
> This commit broke the driver override script in DPDK.
> This is an API/ABI breakage, please revert or fix the commit.
> 
> Report of problem:
> http://mails.dpdk.org/archives/dev/2022-August/247794.html
> 
> 
> commit 23d99baf9d729ca30b2fb6798a7b403a37bfb800
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Date:   Tue Apr 19 13:34:28 2022 +0200
> 
>     PCI: Use driver_set_override() instead of open-coding
>     
>     Use a helper to set driver_override to the reduce amount of duplicated
>     code.  Make the driver_override field const char, because it is not
>     modified by the core and it matches other subsystems.
>     
>     Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>     Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>     Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>     Link: https://lore.kernel.org/r/20220419113435.246203-6-krzysztof.kozlowski@linaro.org
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> 
> The script is sending single nul character to remove override
> and that no longer works.
> 
> Source code to dpdk-devbind
> https://github.com/DPDK/dpdk/blob/main/usertools/dpdk-devbind.py
