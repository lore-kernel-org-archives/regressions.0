Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4975257;
	Mon, 17 Jul 2023 07:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EBB5C433C9;
	Mon, 17 Jul 2023 07:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689577820;
	bh=ArYIPRQW1LKUm/pgfdXi7BhvBgA/OJLHSmaMb23ci84=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FDe/uHsA0B/oldYklXRbfsiXmWEQnfcWUtusDio8clwtGWSbezQdZ0KYO/3LSUyOM
	 h3lscZuyp/oqgO7qPN01lzfTL4GCyy9h5WPUoln5pa9rOfoxRtjlr6kaExTwPLtoU6
	 QjnmUu9DDbVPknuiyJMJEZ65CCUCQ0fx9CCy6ICEU6E7MBH6Q5RHwAQ5/eTl8qZnlz
	 itnspxvlsucMFMUFXrKEEcvT+2gs8SMwomPrM/Qb+cvz/K1ocVjayYhaW61hb0awNJ
	 wE1jBtay5W+JKkAyWT9ULsDXjlyf8MHL7Px+osvKgwUqTaQ3iDKeiVPp41Efi8n1fR
	 I6eEhzWojsfxQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 45E2CE270F6;
	Mon, 17 Jul 2023 07:10:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] r8169: fix ASPM-related problem for chip version 42
 and 43
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <168957782028.7157.9470541301376951008.git-patchwork-notify@kernel.org>
Date: Mon, 17 Jul 2023 07:10:20 +0000
References: <f605d9cd-220d-5fa2-142e-746afa9e1665@gmail.com>
In-Reply-To: <f605d9cd-220d-5fa2-142e-746afa9e1665@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: kuba@kernel.org, davem@davemloft.net, nic_swsd@realtek.com,
 edumazet@google.com, pabeni@redhat.com, netdev@vger.kernel.org,
 regressions@lists.linux.dev, joey.joey586@gmail.com

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Fri, 14 Jul 2023 07:39:36 +0200 you wrote:
> Referenced commit missed that for chip versions 42 and 43 ASPM
> remained disabled in the respective rtl_hw_start_...() routines.
> This resulted in problems as described in the referenced bug
> ticket. Therefore re-instantiate the previous logic.
> 
> Fixes: 5fc3f6c90cca ("r8169: consolidate disabling ASPM before EPHY access")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217635
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net,v2] r8169: fix ASPM-related problem for chip version 42 and 43
    https://git.kernel.org/netdev/net/c/162d626f3013

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


