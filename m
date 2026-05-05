Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A551B17A300;
	Tue,  5 May 2026 00:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940328; cv=none; b=MasgmRMBmcziB47N8dQaXInvJFI4TU/BbOIf1zulcyO6M4yMFKGudWK7QffdnywuYbPghUxp3ikiKYqzDD9lkJ5n+14+IGwH09A8iRRuvz/cevuGtr1ePd7zbCHGE7VtvFrliqnXl5s9+fcCsicLheVvcym6tN2ZGZfWVJ+WxOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940328; c=relaxed/simple;
	bh=hs17YSO5zdLa9CQfIIBW0p/kb4VlFchE5/CMRTDODlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rnw4HnB2smHRPq+bfU5/YgfTRY+zQuSSO7NzwKC7eqGZ86avV+EROcK0g5r3U/3ITwmqgysjy1vdhT2csjjaaWVtFP/qTjir8YqiE55AoDbxO2L6EBFwKCB/RiH5r8xCDo5n7VSyGuF5ZePKFVYOiUWffgkjAEXMjl2D6hLJAk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=n1/tnQkD; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="n1/tnQkD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=YsvbD8znTiKAHU1uxCkygMz8F00bLo5nvIAxppBphy4=; b=n1/tnQkDTT3SyWoayvb6b8WCJM
	pYFGm8r6u/ZsI/NEXYYYzgxdfW7PphQqoHsaO5k52dVQ92izE5GY5swfKerqGzKG4y/F6fj3hKcfn
	f9QQJUYcOZ0Edpbr+qgFAQcM1vJS/UaaZNwrZ96eIri4clr+mrfvmPXcVmfB/FurCq8X3e0p/3rvk
	Hzs1eHCQPCawmb5pJTylw6cp+UW1qtnLGPcdEJkPi4RbXTTtblWm0Q4G4ehM2/phIo0e8sCMbbj15
	p9/ZZonicJCAWDh35y2mY4lxScgLiPkk75GKS7UlifQIELoi+MHVLI8qYBcY0P6Kb4k/cTH7XGckK
	NI0Ik5WA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK3Un-0000000EhRx-1BtI;
	Tue, 05 May 2026 00:18:41 +0000
Message-ID: <0a8be4da-73f4-42cc-b026-c3ac031f3268@infradead.org>
Date: Mon, 4 May 2026 17:18:40 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] next/master: (build) variable 'num_ports' is
 uninitialized when used here [-Werror,-Wun...
To: kernelci@lists.linux.dev, kernelci-results@groups.io,
 Rosen Penev <rosenp@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
References: <177793914437.2560.9287713196857718000@997d03828cfd>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <177793914437.2560.9287713196857718000@997d03828cfd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[add more people/list]

commit 8bdb0b3830ea
Author: Rosen Penev <rosenp@gmail.com>
Date:   Fri Apr 24 18:42:01 2026 -0700
    usb: typec: intel_pmc_mux: combine kzalloc + kcalloc


On 5/4/26 4:59 PM, KernelCI bot wrote:
> 
> 
> 
> 
> Hello,
> 
> New build issue found on next/master:
> 
> ---
>  variable 'num_ports' is uninitialized when used here [-Werror,-Wuninitialized] in drivers/usb/typec/mux/intel_pmc_mux.o (drivers/usb/typec/mux/intel_pmc_mux.c) [logspec:kbuild,kbuild.compiler.error]
> ---
> 
> - dashboard: https://d.kernelci.org/i/maestro:4c562376c15477320ad9a138b83a5256431b57cb
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> - commit HEAD:  9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
> - tags: next-20260504
> 
> Please include the KernelCI tag when submitting a fix:
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> 
> 
> Log excerpt:
> =====================================================
> /tmp/kci/linux/drivers/usb/typec/mux/intel_pmc_mux.c:740:3: error: variable 'num_ports' is uninitialized when used here [-Werror,-Wuninitialized]
>   740 |                 num_ports++;
>       |                 ^~~~~~~~~
> /tmp/kci/linux/drivers/usb/typec/mux/intel_pmc_mux.c:735:14: note: initialize the variable 'num_ports' to silence this warning
>   735 |         u8 num_ports;
>       |                     ^
>       |                      = '\0'
> 1 error generated.
> 
> =====================================================
> 
> 
> # Builds where the incident occurred:
> 
> ## x86_64_defconfig+kselftest+x86-board on (x86_64):
> - compiler: clang-21
> - config: None
> - dashboard: https://d.kernelci.org/build/maestro:69f922810e4ee292cbd1a001
> 
> 
> #kernelci issue maestro:4c562376c15477320ad9a138b83a5256431b57cb
> 
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
> 
> Made with love by the KernelCI team - https://kernelci.org
> 

-- 
~Randy

