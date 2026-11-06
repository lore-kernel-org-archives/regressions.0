Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945584;
	b=KV7zVcbBiCNaZtE5Wt/nZnCFR+pJc7HuiZho7DJREP1MMqL2PzkkmyxSAj6KG/mebw3z
	 uLfX8Cz4No9o/5IBmttcL4pC4KsGt3sjI+qeG2DlHtrGG1q+njVsMpnYahqkk/Ud+US2r
	 cNTXxNCOtejoE2xPHPGyGpabGqUuqzBIXC+waz217s66DMASaEg6lQF/wY+wB3lOgxRjO
	 kxlbYrGaYnsdiTs4ONt6ZXln6MFpz+xE9DZwVC9cTNTh7ayflJZ4I4nKF92nwNPbPJbvR
	 N4mwSMvPPsr9as5lFOjv9onCePfYYxF1BcYtSoCB0FUScE+yEVL9ydHP90FLo6naULQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yqC5kqEmzZTPK10ulwI68LiQM+78XkN3IO/N+99yYEU=;
	b=RaDptRxE/Dn1GAkBlkJu1YYCqaI3Op9CZJEMwMetjk1JkmoJaB3z4tI0iz9KlNgGAMH1
	 ZBqbbbZpMGuta5bv6a8x9LVYKiTMJu46cFPe+HgszRYXZaZ0MC0vOzx5+kpq15h6fhO07
	 SWkHuwTiFeJLAd0L39BedddFhhYWiFBn27syS3AoMnnNOpNaxlGmEsdKx7Np6U0cujUZT
	 cbBOqCxELvP1OPpdIg2VNBgTEBudILZ1L4MrhsaS1Jv6JM5TWThD97siJSSrm35xs3rps
	 yZu/0PTR/DED6KGvSqf1rAD7yZMIvo9TxFiFsdlKb6yYi9ow3p1jrq3iO5li4y13l8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l5WJQXer;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A542606A328
	for <regressions@lists.linux.dev>; Fri,  6 Nov 2026 06:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A542606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l5WJQXer
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a315ed211so363110eec.0
        for <regressions@lists.linux.dev>; Thu, 05 Nov 2026 22:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793945577; x=1794550377; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqC5kqEmzZTPK10ulwI68LiQM+78XkN3IO/N+99yYEU=;
        b=l5WJQXer5eFImpDOQsBwPDCcfEpKb2mrpVdRcBF8wHIPaCZcJ99fJF6D3AbSjjqRYW
         xG2Mkhh+g77aKAKCLWl8NRVVBM7jaoWiS3m3S6lGytK9dsJuZ2gmraqgLMnFhdh82A1T
         g6DdfJ8nI9z+5bbVWuqkZ1dCg8Zv1CseFcOfwQfjhO76pBLukHc7j1WsdCZrn9rKzxHT
         9RaSIVFTASENhG1ODzJylVQJ5ZRA8JNcQEy9VdvvoEXdXr8djpSYlMVbPsCVfvNhx/Gg
         Bpr4b6QSbYT/e74T26V2sZtaBCxBCUjV63cZzPgL+aDqWY/+ss6vqD3kfsHCjT7om08w
         6YcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945577; x=1794550377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqC5kqEmzZTPK10ulwI68LiQM+78XkN3IO/N+99yYEU=;
        b=TbCzKKC/FKXSkEDfdLiT6U8NYHaTW4BlgPf01ZuT03qm2cAd80lK90M4xr0yz123W/
         85JRH5p+TMvl4MPc/cYpBqa+9+nz77YBbHT7B2FmWo/wkKxavy1dG7QH9azLYGG9gA3d
         XC3z3ITUdqbPVrUahAsTNsntODQq+j8xKxmZ5VQUNV3YUWmamtSuls7+2RVc3eFOiHat
         XobM1hTNrW7GAvEFtwmAm7dihF1R4dzDaT8HM4JOoUps2yqY4SNRgqg1m400/9E6hxeo
         zSRYrnpqBjPDPMiXP4bb8RSJF94uBPWCHU8LJ7MMw2sBxa9hYEFdDTjeF4CDnjlNUQTV
         wxuA==
X-Forwarded-Encrypted: i=1; AL+hErFhWaDkiXsaydTyKdIpl5ug7uk8H1Tv79gXOG15pQJa0ZwiLksxLZQg32iLMgO19tufuTYZBlQdGutgoA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Os2ToKViGRmcZ3matlZyCxfKqc3TUdD3Nq8id8cUfdIukOwUL
	OilVuz2wlzoBLqIGYTDITSIXEHoxHVgQ8ecH2o8cm6MztYcKz7XXeSBvFB581IQYjA==
X-Gm-Gg: AYBFou1j2LR91lOqIiGx9z43ITpE1n3CmUl7EZ+e2by32xcv4UqP2/QSBTuZgTkc1+s
	7rMZ91W40qYlent980UeG1RZROar7vNuCXw9vwpmyvjm3oY3HnOwjcNkYuklAYrg/l6euHX2+wm
	NNLEQNdK3hLPeanKqLlc4Vv2HT1JWV14bDYzZ2Ozoq5hHp5Iw/dYBTEQhOpcTMIMG7UuYtPaoMN
	Jw2QJrXUeFGd66NhOinrBS11hxYcharTxZILavPgWkKhFypaSeEgZ2MW1Qpa3d4RyeJyWu7clRR
	1TWvTjfesMsrirFaXe9yBAoSIJ6ZMCclt4yKEO8sgI3BTIKTR4tWc77DeWSv4vMbzB91zGJHWgP
	R24mGozIABkyIPqceYYex4hqIm3xtJPOSgwoX93dGS3me6PSezW6H/e6Uw3BpYtqlMLZIjKpq3X
	6Uvld8DLOu7R1jLmPc0xDT0YBBETHpm/Yh1dAifaTDThWpLM9QtvXg6ehskFZQxn3ikTZl++wz+
	udKrFjf09J2H+3KG2KFp9w788uEEngvzaxxkSffpDI/ctb7VgXOe/hwu+BrRlV/ehhDjH++4ID4
	ttqg6MYNjW4Gm8Pv8m/3MnIed3+nwGUUUR24/zjcj1p3t8JKgFRCr1SV4iL5C33B3BXJI4pwvP7
	PwLBB0nnEv0l1Y/fHhA==
X-Received: by 2002:a05:7300:8a14:b0:343:5f5f:eef0 with SMTP id 5a478bee46e88-36de7432bb6mr6742335eec.21.1793945577142;
        Thu, 05 Nov 2026 22:12:57 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm3755879eec.10.2026.11.05.22.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:12:56 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v4 0/2] usb: misc: onboard_usb_dev: don't defer probing after the device is configured
Date: Fri,  6 Nov 2026 13:12:49 +0700
Message-ID: <cover.1793941292.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a BeagleY-AI, kernels since commit f918e3804498 ("arm64: enable
HAVE_SHARED_GPIOS for all ARM64 platforms") no longer boot: the on-board
USB hub is re-probed in a loop, because onboard_usb_dev defers probing
after the hub has been configured.

v3 added a pre_probe callback to the USB core, which turned out to add
significant complexity. v4 follows Johan Hovold's other suggestion [1]
instead. Patch 1 exports the generic driver's operations. Patch 2
changes onboard_usb_dev to call them itself instead of setting
generic_subclass.

Tested on the BeagleY-AI on top of v7.4-rc1: the board boots normally,
and unbinding and rebinding the onboard-usb-dev platform device works.

I used an LLM coding assistant to help prepare this series.

[1] https://lore.kernel.org/all/auSdA8MfolA8OhdM@hovoldconsulting.com/

v3: https://lore.kernel.org/all/cover.1793669297.git.jjc@jclark.com/
v2: https://lore.kernel.org/all/20261030151919.3511106-1-jjc@jclark.com/
v1: https://lore.kernel.org/all/20261030114705.3159093-1-jjc@jclark.com/

James Clark (2):
  usb: core: export the generic device driver's operations
  usb: misc: onboard_usb_dev: don't defer probing after the device is
    configured

 drivers/usb/core/generic.c         |  4 ++++
 drivers/usb/core/usb.h             |  6 ------
 drivers/usb/misc/onboard_usb_dev.c | 14 +++++++++++---
 include/linux/usb.h                | 10 +++++++++-
 4 files changed, 24 insertions(+), 10 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

