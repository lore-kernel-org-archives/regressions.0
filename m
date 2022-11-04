Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D671C10
	for <regressions@lists.linux.dev>; Fri,  4 Nov 2022 14:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E7FC433D6;
	Fri,  4 Nov 2022 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667573763;
	bh=aFT+OYWwtWWikyYe2ydT4JOUjF+vaIMzzwvgJK0u6u0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sCTs4qMpQHoWjZwWKZylJU5GOrjmgd5bBsy0I3pfZ9THAWllObwZzZ8Me2QOMcrqb
	 ORhc4xj9oT/Z0IigtSXNdzcXcxZ5a1c7ZaK4X9u6tEX46lKvrkdT/xYGcKAzjdQiBO
	 VHYfz1Bml0McMBViOUrLN+OewKqxu6ZkPeOkzr9VhpMNcV5s6NbP3HvYVK9xn/M32b
	 ONVa8FQZ8vsRf9yb4Z0lTS9KxC9zNCPs6/5lskvWEKJACF46wsoxVgJ/D2uvqI+6KS
	 cpdKNPnfBrVlVUUbO0f9GGzFqbkrPrAmihh4icXjFzx/dKohjXFZ/Idy0KT6G/HNdr
	 ndnz/sfYo1oNQ==
From: Mark Brown <broonie@kernel.org>
To: Jason Montleon <jmontleo@redhat.com>, pierre-louis.bossart@linux.intel.com
Cc: ckeepax@opensource.cirrus.com, regressions@lists.linux.dev, tiwai@suse.com, stable@vger.kernel.org,
 oder_chiou@realtek.com, cezary.rojewski@intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20221103144612.4431-1-jmontleo@redhat.com>
References: <20221103144612.4431-1-jmontleo@redhat.com>
Subject: Re: [PATCH v4 1/2] ASoC: rt5514: fix legacy dai naming
Message-Id: <166757376119.346347.7384763439814980163.b4-ty@kernel.org>
Date: Fri, 04 Nov 2022 14:56:01 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921

On Thu, 3 Nov 2022 10:46:11 -0400, Jason Montleon wrote:
> Starting with 6.0-rc1 these messages are logged and the sound card
> is unavailable. Adding legacy_dai_naming to the rt5514-spi causes
> it to function properly again.
> 
> [   16.928454] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: CPU DAI
> spi-PRP0001:00 not registered
> [   16.928561] platform kbl_r5514_5663_max: deferred probe pending
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt5514: fix legacy dai naming
      commit: 392cc13c5ec72ccd6bbfb1bc2339502cc59dd285
[2/2] ASoC: rt5677: fix legacy dai naming
      commit: a1dca8774faf3f77eb34fa0ac6f3e2b82290b1e4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
