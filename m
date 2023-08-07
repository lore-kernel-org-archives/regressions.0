Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF19413AE6
	for <regressions@lists.linux.dev>; Mon,  7 Aug 2023 22:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CCBCC433CC;
	Mon,  7 Aug 2023 22:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691448622;
	bh=UqATlph8Eo/e5YiJi8/QqaqNEUFiDAYOsk+a0ly4odQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iFqW/QLFnyeNdEkB1FKRTxoutUm2irL9EmxC/fd8R/KCcmR2ugMQ2o31g+GSKyijc
	 9HGH+3As9jM0cRlD+3fFT3LMZx5pVCDHp3stPOyJ/COiNcQAVrZOTFTjVaB7ZwUxUQ
	 a4YjlPbobB7TaBygDxUclDdqijqqZE6lK3t7wePOIfqphlPIUEpz4KkfEHSkzX2JZg
	 quaLQKLdoaG/Cm6zCp06ZwNB0Q75YnAWMPYhPyEf1ssEhLBJq+Dup5YBXk7unXTTeD
	 Hd/pCanVfBh7ZGEUfxJFrPpsh4aO49QoUWS+nV4eFoevaSpcH2M79hV4pRGJbt2fXN
	 aWlBVu4pD1IfA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3FB26E33098;
	Mon,  7 Aug 2023 22:50:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] Bluetooth: btrtl: Load FW v2 otherwise FW v1 for RTL8852C
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <169144862225.1999.15719551303477888698.git-patchwork-notify@kernel.org>
Date: Mon, 07 Aug 2023 22:50:22 +0000
References: <20230807114259.13654-1-max.chou@realtek.com>
In-Reply-To: <20230807114259.13654-1-max.chou@realtek.com>
To: Max Chou <max.chou@realtek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 alex_lu@realsil.com.cn, hildawu@realtek.com, karenhsu@realtek.com,
 kidman@realtek.com, juerg.haefliger@canonical.com, vicamo.yang@canonical.com,
 Riley.Kao@dell.com, jwboyer@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 regressions@lists.linux.dev

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 7 Aug 2023 19:42:59 +0800 you wrote:
> From: Max Chou <max.chou@realtek.com>
> 
> In this commit, prefer to load FW v2 if available. Fallback to FW v1
> otherwise. This behavior is only for RTL8852C.
> 
> Fixes: 9a24ce5e29b1 ("Bluetooth: btrtl: Firmware format v2 support")
> Cc: stable@vger.kernel.org
> Suggested-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> Tested-by: Hilda Wu <hildawu@realtek.com>
> Signed-off-by: Max Chou <max.chou@realtek.com>
> 
> [...]

Here is the summary with links:
  - [v4] Bluetooth: btrtl: Load FW v2 otherwise FW v1 for RTL8852C
    https://git.kernel.org/bluetooth/bluetooth-next/c/77bceb7a4d68

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


