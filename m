Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D798F13AE7
	for <regressions@lists.linux.dev>; Mon, 22 May 2023 15:58:45 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0BCA2240007;
	Mon, 22 May 2023 15:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684771118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lNO7ihmAZxKF90Y/XV+Q0lLC8kGDIEujfsZBJ+mXFHk=;
	b=dlJCMm21miORp2NPYFg4PRL/poVGsZi+hkpYbTXClU9/ZpSzNUIAC7Xmm2icgQWrZLmiMs
	6/GyuZk9X8UjXRjMWZ3Fmgmmx5H4KzpTO1XwPCmx9dGeN5U2IolIAJye9uJzm8GcmscTSR
	v47NXFbeSRU8Mf8MxUD8dETcFjZuzBjbdBjBnBObEiemoKaE3zu/0wrxZQqeBK3NZhUt85
	+6Rw3fA2nS5nf1W5J2pSAaNGaUKpnHVPb1YycdKNy1tJDN/yIpyGXTQmw9V34S5+OOrYjI
	96J+T7bHVsLnAvZy3YQhzZTO5v4UjM3bfXHREXqhNwcu+Lo4wYqej71FPocJUQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	todd.e.brandt@intel.com
Cc: vigneshr@ti.com,
	pratyush@kernel.org,
	michael@walle.cc,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@leemhuis.info,
	bagasdotme@gmail.com,
	regressions@lists.linux.dev,
	joneslee@google.com,
	Todd Brandt <todd.e.brandt@linux.intel.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix divide by zero for spi-nor-generic flashes
Date: Mon, 22 May 2023 17:58:35 +0200
Message-Id: <20230522155835.46756-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518085440.2363676-1-tudor.ambarus@linaro.org>
References: 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'da8291aa0ca6c789dcfab7bd2654b7faa3894956'
Content-Transfer-Encoding: 8bit

On Thu, 2023-05-18 at 08:54:40 UTC, Tudor Ambarus wrote:
> We failed to initialize n_banks for spi-nor-generic flashes, which
> caused a devide by zero when computing the bank_size.
> 
> By default we consider that all chips have a single bank. Initialize
> the default number of banks for spi-nor-generic flashes. Even if the
> bug is fixed with this simple initialization, check the n_banks value
> before dividing so that we make sure this kind of bug won't occur again
> if some other struct instance is created uninitialized.
> 
> Suggested-by: Todd Brandt <todd.e.brandt@linux.intel.com>
> Reported-by: Todd Brandt <todd.e.brandt@linux.intel.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217448
> Fixes: 9d6c5d64f028 ("mtd: spi-nor: Introduce the concept of bank")
> Link: https://lore.kernel.org/all/20230516225108.29194-1-todd.e.brandt@intel.com/
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Tested-by: Todd Brandt <todd.e.brandt@linux.intel.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel
