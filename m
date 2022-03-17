Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD36E2F31
	for <regressions@lists.linux.dev>; Thu, 17 Mar 2022 16:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F1B5C340F5;
	Thu, 17 Mar 2022 16:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647535211;
	bh=6MisLZ+bYSgioty0zyGTw7QaXhNxopS1ATEHqy16iDQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Plo+FLh7d286uYhWY0/wiW0eFddtOpToHCLh/hNe9IKkkO9unXf2wfYKUBRtbzosu
	 LdRfhIExVZfNlH1nZYN18E9TCMLY1Gqqlj0GEFmAT35t8ME+b3IAoA47bSCR9sPdnN
	 N61FZennqrJ4JhafT9feGb3D7ZBTVoOOqIoV8OVyqQAbhrJtomMhW8n0x9qiqg4+Ot
	 YqEhCO7VZEbO3FPLIqNPLzO6oqT6CDyKldgsj32RUli23l3xekyVxV9vFtSgML9bRA
	 kGRPfKib1Qibd911Xp/VbWHcliOQkHLIhX6v1hB+8a6iVzLNquungXd4rfemmsN2nK
	 k//MddMrV1v7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 51562F0383F;
	Thu, 17 Mar 2022 16:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] bnx2x: fix built-in kernel driver load failure
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <164753521133.23544.8557619135269165608.git-patchwork-notify@kernel.org>
Date: Thu, 17 Mar 2022 16:40:11 +0000
References: <20220316214613.6884-1-manishc@marvell.com>
In-Reply-To: <20220316214613.6884-1-manishc@marvell.com>
To: Manish Chopra <manishc@marvell.com>
Cc: kuba@kernel.org, pmenzel@molgen.mpg.de, netdev@vger.kernel.org,
 aelior@marvell.com, regressions@lists.linux.dev, stable@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 16 Mar 2022 14:46:13 -0700 you wrote:
> commit b7a49f73059f ("bnx2x: Utilize firmware 7.13.21.0")
> added request_firmware() logic in probe() which caused
> built-in kernel driver (CONFIG_BNX2X=y) load failure (below),
> as access to firmware file is not feasible during the probe.
> 
> "Direct firmware load for bnx2x/bnx2x-e2-7.13.21.0.fw
> failed with error -2"
> 
> [...]

Here is the summary with links:
  - [net] bnx2x: fix built-in kernel driver load failure
    https://git.kernel.org/netdev/net/c/424e7834e293

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


