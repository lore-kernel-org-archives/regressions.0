Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D8F7E2
	for <regressions@lists.linux.dev>; Sat,  7 Oct 2023 01:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFiaSqXk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEB40C433C8;
	Sat,  7 Oct 2023 01:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696640423;
	bh=NEqHBe+eX7OIDPmmjjD/TBY6CeK3+9IHwSncD+p1M4s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QFiaSqXkVqWALVSRNzn2GDbFcJC+WebIruWduuxNJD4VSWK7FLri/04tdsLx5onGo
	 18IykfxGDDdNyxbgPnGwjTqAHClNJlkuRzegYTzT77havYer20gy/0BJIJBR2TzSdr
	 q27cAZOA60dm21IiFqO4s4PObIyeIR8LyFX3cvY97fiToAyF54BoRwNQRJqaZ6OtZO
	 yEx6GEKpb2L3Uop3dUH2QoM+J15ceMWk3ga86tvZ2c7Dte7MnZOsym83RlO/OV18oL
	 RB4VV79wZKOcIX/lVHrTsuwvX2q2feB9sURgOF9lkOdxL0wYqRttab1SERScACdtL7
	 CIDNHdSSmXIJA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C2E00C41671;
	Sat,  7 Oct 2023 01:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btrtl: Ignore error return for
 hci_devcd_register()
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <169664042379.23949.8315443049400174883.git-patchwork-notify@kernel.org>
Date: Sat, 07 Oct 2023 01:00:23 +0000
References: <20231006024707.413349-1-max.chou@realtek.com>
In-Reply-To: <20231006024707.413349-1-max.chou@realtek.com>
To: Max Chou <max.chou@realtek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 alex_lu@realsil.com.cn, hildawu@realtek.com, regressions@lists.linux.dev,
 kirill@shutemov.name, bagasdotme@gmail.com, linux@leemhuis.info

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 6 Oct 2023 10:47:07 +0800 you wrote:
> From: Max Chou <max.chou@realtek.com>
> 
> If CONFIG_DEV_COREDUMP was not set, it would return -EOPNOTSUPP for
> hci_devcd_register().
> In this commit, ignore error return for hci_devcd_register().
> Otherwise Bluetooth initialization will be failed.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btrtl: Ignore error return for hci_devcd_register()
    https://git.kernel.org/bluetooth/bluetooth-next/c/3ef20de6b2a8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


