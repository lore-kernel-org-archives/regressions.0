Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676865;
	b=2FGMHd2zSv42++uHKsDplo5gwRaZp9KMrNGs0GL1W9yJ+t+1qDgTGHUk3NBwNUKdWBi1
	 KJkruWfv8aA9SZw1OnVGaHIq6VgesTyixFlvBi9DyFoyBHNsBqeUp43tgGjQXO1P46dcQ
	 /RBlJJKZD3MwYY8EF7edOFTOjaY9Odk/guefYLoxrzWS2NyOVAkB3e7+t04kte4mS9OhK
	 74B5yNbfeY3bT+5BY3BjC6cLhDMxv1hnUCfVVQZhCl31NzyskQmywOsG2cwVsNqzGjczd
	 LPOL9cDgADqo6fwSHcwQ2tVtG7C2RSpCwuAmvkLlrN+USZ1kA8WcATUZMUwyqiO6ADQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b1Rw55oWDrh7Qrrp6JFBlhT1fM/bU2NaiuzfyjKKcU8=;
	b=ARpLntNKdjfRZ9hDRSL6YgSa/wSQXGwM4BD3Ze8BL/LhE3doAfoXUJDLHoLSE9catIkB
	 K7VkFwfKabX7V6yJ8D4vaVyQYIB/QEwJcFzy91TBEx2zPQaywc6+9+385YPe0g7aB6GBZ
	 gC5nYtmyl46n9/hCiv/v9KLK9rqsDZ3uJl8mAD0vCC3dBWjIRpvtt6lBTi3eWF9+vYyi3
	 C7mQc3UYOJ1X4935ERZjFsPN5h7sT9YVgeiT19b/Dqr9yNXQkop0k7pKHzFnZmgiHJiJI
	 PmuiWCnAz1/tkkDzhZvgWEzV1iV2L1VddoI2zJ8awL8ZxWqkoJhcUzebVtVpjZBcFTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nnDSdkz7;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6FE606A32E
	for <regressions@lists.linux.dev>; Tue,  3 Nov 2026 03:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B6FE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nnDSdkz7
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8b20a899fso25215905ad.1
        for <regressions@lists.linux.dev>; Mon, 02 Nov 2026 19:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793676859; x=1794281659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1Rw55oWDrh7Qrrp6JFBlhT1fM/bU2NaiuzfyjKKcU8=;
        b=nnDSdkz7B3KIyMdRBmzg0uf+Htm4j5Y4X0bDc30u37pfr1S0sEq8/5E4tLsZkME8v3
         g4rxQ4T+1hnOo1+1OzIIVjoG3s4HrCgZDW+pp86uxsEb/F7H8cOLuSSqVSGbadOIvVYq
         uwvxeWLc5z3Rwepi5aearoAfoYoxCWenSA9ZFHKLhQDuxDf3pPPCT2Xf4cc1BCLtesUt
         XlgEHjOfKlc2I2vkCcC3QSuD4COIjVbrSL4OugF5urFNjjQnwtYdenQPTjoHk0Xx6QD0
         umHtJouTZXY07N7dWFf6314x+SxpUDvR7h4pX4nttoWS6Cqz/c7jatv2xnbFcMXVgOr/
         XxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793676859; x=1794281659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1Rw55oWDrh7Qrrp6JFBlhT1fM/bU2NaiuzfyjKKcU8=;
        b=noJYgWF57j0OWwbim9UWX+fN8GNsFMDzKPe5E879qQHti7JW5oaEzlgB5Afvz48Gmv
         RTgvXuhajaDO26Bbi4C1hd8/EI6PwJR6Fs4Ny6GulaoeJLSLYnGCJy7yi06X9OVUTuqW
         cFDGoMZwXqxIMxJMUo+y/g2L92mpB2eHYmhsdTsM0t4J1wxxJ+vhgq9hoZ436ampmeIi
         5kNy4QT42zDP0DRK//6Gbt6oiLmXaNH1u9+pgkjK7XZvb4/zEG8mgjB9stN6jLFktUsp
         zLREL4dRClANxTSLkU4/uy4Vo7awfE+dKCq/F0y7y5H1Vt5cntocqf2QWHFfoggqIoUP
         wXWA==
X-Forwarded-Encrypted: i=1; AKwUvBxX7ghIaFTtIddLbxNMN5RPPa+yn+yibXTDe0M5ri55w5zuue8B5aA3CDtmGRhrBUEFYOwkUDS5421d5w==@lists.linux.dev
X-Gm-Message-State: APuU4Z+m7HleW6a9/fD9ScE1joA4R0q30I5ML6cq6dXC1vWWsRdIe7wO
	lPjfeJGuA4+1xiv45O1e7rZ/47QBWuTINURb6erfO3KeOGKd4C2yZSzOcvmQcJ7E3A==
X-Gm-Gg: AYBFou1sdirkjQzKjCFyBWdVJWuUur/YiyCq7hp+QZTI2DFa/alpExXcTODhZrzqAZe
	jMyr3nkVTf16Nq7JKmgPM2wNBJwJYACx8Y05iyJQV9k7/TsJuIallpZXjQhdCwv1A1ahLANaQUX
	knBwaZRgfEQDT005eZdLbEOpRzS0H4LXKP5tY1Fp2sNAy8Ub7yJCsohwKa+O0FJWBtoXIA1vg51
	w5nYRy1daRORQqOvuV5QQbdYqWbYyiVrt2g/mNDiod/1bPrBpa4rJhQ3kYhnfH0ltQHllTlVf43
	8UgABXWxe5+zpGLWkdGqtWgetk4Ijr5y6zR9GnUnKd65t+/ycMXOyPnEKu065mnaA9T/RjHkaNL
	1DfdL3rOQNs6/c4Tc+YBpkVqD39xa+Z/XUABfAd7nFMI6cSMppdJBtplCAeYWd1AwQhpNxIfblR
	DE0FArYJ7zfHeIEYjh6uIiJbQKskD0d2wmmM6GEdKRY1Do7KrX4X+8aYmsUX7zdwZcLkYeO+T2E
	hrSC6VbVd//arfqq1Dhh6joRlsKrDUAh1N6XF9za5LjhV1PSuWNJ/xaofEyUfxm5BT62n5KynC6
	vZbYrCysaPSbmJSNxKx3Qwnig0U4EVuCed2X/xYENKVfL/cezDJVZDUSKQCgimQgmZDqFjvMdAD
	PPd7FyDjJECyavAs35w==
X-Received: by 2002:a17:90b:2d0c:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3ae897e30c8mr9894127a91.65.1793676858713;
        Mon, 02 Nov 2026 19:34:18 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c29e619sm1965566a91.0.2026.11.02.19.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:34:18 -0800 (PST)
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
Subject: [PATCH v3 0/2] usb: core: fix failed device driver probes, add pre_probe
Date: Tue,  3 Nov 2026 10:34:11 +0700
Message-ID: <cover.1793669297.git.jjc@jclark.com>
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

On a BeagleY-AI with BeagleBoard's device tree, kernels since commit
f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms")
no longer boot to a usable system: the on-board USB hub is re-probed in
a loop. Patch 2 fixes this as Johan Hovold suggested, with a pre_probe
callback that lets onboard_usb_dev defer before the hub is configured.

Patch 1 fixes two pre-existing bugs found by a Sashiko review of v2.

Tested on the BeagleY-AI on top of v7.4-rc1: the board boots normally.
The -ENODEV fallback that patch 1 changes is not reached on this board.

I found this by booting commit 85b4bc79dde7 (net/main during the 7.4
merge window) on a BeagleY-AI with BeagleBoard's device tree. A coding
agent identified the problem, explained it to me and proposed an initial
fix, which was revised numerous times on the basis of comments on v1 and
v2, my feedback and local Sashiko reviews. I verified that the series
fixes the problem on top of v7.4-rc1.

v3:
- Add a patch to fix existing problems, as requested by Alan Stern.
- Patch 2: rebased on it, no other change.
v2: https://lore.kernel.org/all/20261030151919.3511106-1-jjc@jclark.com/
v1: https://lore.kernel.org/all/20261030114705.3159093-1-jjc@jclark.com/

#regzbot introduced: f918e3804498

James Clark (2):
  usb: core: clean up before handing a device to the generic driver
  usb: core: add a pre_probe callback for device drivers that may defer

 drivers/usb/core/driver.c          | 42 ++++++++++++++++++++++++++----
 drivers/usb/misc/onboard_usb_dev.c | 15 ++++++-----
 include/linux/usb.h                | 14 ++++++++++
 3 files changed, 59 insertions(+), 12 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

