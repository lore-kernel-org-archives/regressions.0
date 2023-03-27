Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CED62102
	for <regressions@lists.linux.dev>; Mon, 27 Mar 2023 13:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DDDCC433EF;
	Mon, 27 Mar 2023 13:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679923371;
	bh=+fcZvxX97vA2m/ogwTBOs9kzLHaA+njNUSUDR7zOHSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=u6fo6LTAQ4RARP9+kbRX0ydvNepTHHiRWm/Tj4NshewYQlu20tDwhn8nIFgF+5ugK
	 xQQIv6l/fh3IVPUt0CLVD4NEQfi3KOL7e6heeFCqTRBNGSr8PWDI7KT//yWclspGAb
	 p+8Mp0tkk3KM//ycR5G3kseORuFTitwQq2VMeWbYgB+v4Xxyu+W8sAHwhGv/T+l6G1
	 +zHajyiCECTfNbYXVJ6vdk1aODzQsDU/+bgfBxSgYo9xl3jKUmZ8TDAzXIi9c/j0jd
	 ZSUSoWwRbeZ+ioXMtcp1x3P8ZdlgYqAWTGrDYGgkGcRlke7ii0EI7JTa+4NJJh44Ry
	 ncOxQekI9ae3g==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, regressions@lists.linux.dev, 
 yung-chuan.liao@linux.intel.com, tiwai@suse.com, bagasdotme@gmail.com, 
 pierre-louis.bossart@linux.intel.com, Jason Montleon <jmontleo@redhat.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20230324170711.2526-1-jmontleo@redhat.com>
References: <20230324170711.2526-1-jmontleo@redhat.com>
Subject: Re: [PATCH] ASoC: hdac_hdmi: use set_stream() instead of
 set_tdm_slots()
Message-Id: <167992336898.3162140.14844931662953043048.b4-ty@kernel.org>
Date: Mon, 27 Mar 2023 14:22:48 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a

On Fri, 24 Mar 2023 13:07:11 -0400, Jason Montleon wrote:
> hdac_hdmi was not updated to use set_stream() instead of set_tdm_slots()
> in the original commit so HDMI no longer produces audio.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdac_hdmi: use set_stream() instead of set_tdm_slots()
      commit: f6887a71bdd2f0dcba9b8180dd2223cfa8637e85

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

