Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5AE286B9;
	Mon, 16 Oct 2023 17:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfGErQeh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 223EBC433C9;
	Mon, 16 Oct 2023 17:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697478024;
	bh=YE8MV4L87LoXSPHfgHSpNYR3qUPuVdzDgJOEEjAyswk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PfGErQehjQbVq2zZa+DapTMGFT3uN7ex8slsbFQpJlOC/UFptAtmgzJW+sfcnIoTy
	 FMrMfpdWBGXq0phQOMA+T/41V7kJ8YeDlFyzticwP8EUpzOGZpBxlDt2eoIefY1PDj
	 1k3Piz522/8FA4Ys8L0UsU3zzw+vmG8nMkOK05jnuhe31yAAzQaP9ynlNwimA+WC/t
	 CRnrv2eKPc9wEh3lNLz5BhVBoTbQjKZJNe0ipfwUwtM4w8qQxs+7dlGnL9ryjQj9N2
	 piKpDJjX+YEriyN+wUa/m/RPXfj8GhFG/3J9hTUUnodmT3DNIetVulQW0SJ2nQ91C3
	 6WXC6ADKj6jlQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 05780C4316B;
	Mon, 16 Oct 2023 17:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Mark bcm4378/bcm4387 as
 BROKEN_LE_CODED
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <169747802401.23804.5795808252113645471.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 17:40:24 +0000
References: <20231016-bt-bcm4377-quirk-broken-le-coded-v1-1-52ea69d3c979@jannau.net>
In-Reply-To: <20231016-bt-bcm4377-quirk-broken-le-coded-v1-1-52ea69d3c979@jannau.net>
To: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Cc: marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io,
 marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 luiz.von.dentz@intel.com, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 16 Oct 2023 09:13:08 +0200 you wrote:
> From: Janne Grunau <j@jannau.net>
> 
> bcm4378 and bcm4387 claim to support LE Coded PHY but fail to pair
> (reliably) with BLE devices if it is enabled.
> On bcm4378 pairing usually succeeds after 2-3 tries. On bcm4387
> pairing appears to be completely broken.
> 
> [...]

Here is the summary with links:
  - Bluetooth: hci_bcm4377: Mark bcm4378/bcm4387 as BROKEN_LE_CODED
    https://git.kernel.org/bluetooth/bluetooth-next/c/b00d44276894

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


