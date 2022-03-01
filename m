Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2C3161
	for <regressions@lists.linux.dev>; Tue,  1 Mar 2022 17:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB23BC340F0;
	Tue,  1 Mar 2022 17:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646154444;
	bh=+xeQcJ/bocIdjw95a8Bjh6EHGuz8SiftdYPm7+honYE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uWZaSQGijJgSVZN1drdfw9pW5SQnclpahX1TDnLjB8oTaS2Np5hBs+H+4POBcFXfo
	 3gu0xjj1NzQZ12ZYLuvCZTuK2rbdr7kgQLb+LpnLNztIzqliqGSKas/chvtd69SUrN
	 6sN70WGGF57vZEIu+75a7r1HFl73RnOQQO9gE9sq0/e+YMKKxJ7q9ojsQbRfVAeeIQ
	 TZXiH8WIJzfXQblAVrra8VqJH0HmW9zLz4Rk+a4NT2UDrKFTXleFw7pDATVLK6ZWe/
	 479KCSFAsFJ+B/jqV/QPaGuLmpjIiliZ0gQy/pIcr9/K9dJ2fhvSS00JkhGpTyTOW5
	 Jhe5yhpPzJZmA==
Date: Tue, 1 Mar 2022 09:07:23 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, Johannes
 Berg <johannes@sipsolutions.net>
Subject: Re: Bug 215523 - Firmware crash with 66.f1c864e0.0 (cc-a0-66.ucode)
 and 68.01d30b0c (cc-a0-68.ucode)
Message-ID: <20220301090723.762f607e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <adf5ac57-cd60-a004-a05d-6d7c3ad7efa7@leemhuis.info>
References: <adf5ac57-cd60-a004-a05d-6d7c3ad7efa7@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Feb 2022 10:56:13 +0100 Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> There is a regression in bugzilla.kernel.org I'd like to add to the
> tracking:
> 
> #regzbot introduced: v5.16..v5.17-rc1
> #regzbot from: Udo Steinberg <udo@hypervisor.org>
> #regzbot title: iwlwifi: Firmware crash with 66.f1c864e0.0
> (cc-a0-66.ucode) and 68.01d30b0c (cc-a0-68.ucode)
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215523

Hi Thorsten, does regzbot follow the additional links? Or do we always
need the fix to link to the original report? 
No preference - just clarifying.

#regzbot fixed-by: 1db5fcbba2631277b78
