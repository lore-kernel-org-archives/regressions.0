Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657813;
	b=F14Cw2sH70ipYEFziKqFCoHWDXPVFULHVRgMlOVx2wO+zCIyVYyxUdAZ7XCon0IYzZVZ
	 wb4u+lYv1b6vPvV94Y3S+pLwaAWLz+dlIPAl5KyxBj6CjfAaqq/uQz62CU2JrOaF+Smv7
	 CB7D5R1dkR+fQd2Hgyom8AABYf7kmRqT/DL5bdYLjhScxTTQWuwSC39nuXFDEjwmhZVBi
	 BcMAbbJIhr2fPNQi2TvLo4tIA5IdlzZgANXK3kMVk3fcDL7c/rY9+EWtLLy4EqAjoSsaz
	 4/+aNp/2pxEHFUBCzrlTUTrDO3RrMlF4FcUfhZlv4A2JRb2MHx1btsMA7GUw9LJxUZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ov64R61JC1VLupte76D4hmlAMcowcOFiftvcocoORZM=;
	b=PAuNUhRoIZf7cijN7Z2tMHp4o10nG/DDUEVMqfymqsLDka5r3Ytot8TevufbCwBDiRDJ
	 rqy6ZoPnLxYK8dTrzeb4y8bzLS7MLf1esnQklwqx2o6RlZaZz+Jo4zVzmqzVno5g0wi3J
	 eBO4YWZZpnUkkuYnpiIoKi2D1ejer+CGWy4cNkFZozYMiDw9TR1EF2rG0b+r8fTGNHiOv
	 5sEws1p3h73rreuKC+Xtp74XRBv3orYDsnQrovLXRqhJN6gP0ggzCRAm9CRKgzfVKw5KE
	 +2ljFuv3nV2pxgqZLFG2wmjvRH24kd2n+yqOqI/TdnVqsUJLZa7yGMR+qaPE+M7dZOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wetterwald.eu;
	spf=pass smtp.mailfrom=wetterwald.eu;
	dkim=pass header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=RlBiK06+;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5004C606A320
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 08:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5004C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=RlBiK06+
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso2103875e9.1
        for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 01:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1792657805; x=1793262605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ov64R61JC1VLupte76D4hmlAMcowcOFiftvcocoORZM=;
        b=RlBiK06+CK7VkcdLvh9FEjDoZOFr2qrAGsuPBrD1rQOPPl19X7XJ8+vUW5lVAVlGdz
         yZsCRFfEHwChpLdQcG53M3hdo2gwrAD+lyPdUtjkFUa3oDaaYtG83xRBHHr3KQ8fyUGe
         kSgMeA9nBgIGOmgQtMdCzcnKr8EtCL1miWOC32xrkx1nzuK/E/iraNXwNpyv92NciBI8
         5oa/zXwRQZKWrUZHDu9PJ/W3WCeGGxbFil79BWESfJmW4sDymtj+Hw/Fx4vpnKtLYy/L
         lidCOjcoc69bQmansydOeSSxFQiIZQAave+llpqnSaos3YZYO+6qr76SSJmcJEsWsjcc
         05OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657805; x=1793262605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ov64R61JC1VLupte76D4hmlAMcowcOFiftvcocoORZM=;
        b=zT5VXWgpGKP1EBS9LkirDgeKEs5+BgZR3RbMtaVF1V4AmdY7VsCO1mVfq4CJYSrdLg
         QvRBfwIgVCSAGUm7MuOT0GJAMDjX0fw8h9oTOYy2V482cDcrqaxmxtdWFFqA6o+DZ6ZC
         4eDuldfn2+Bxs/vsIRtHVemCrJavpc3HwW7TF/rGvuFSCvZBy+c7Y5A28Xth1FB2JvrZ
         kSPbSZmPPWwj0b6Cw1TUXszQ5Flmq0M9indsyhI093Cf8il1L4tUuaZAbRtDSZQwqPY+
         SUzlXP5AgqGSFmj6Lnh6Jdr3UDsqAAVESmIjkexnTow1fLS4XJOeCykxq35Dw2qfjHsV
         zv0g==
X-Forwarded-Encrypted: i=1; AKwUvBxgd7KJSAfxWLyowZo70M81xCM10G4ey9/y8VEbSyGPsbGK/X6BHgMiZjlx5TvmIWWYs/g2qCq+WRYb1A==@lists.linux.dev
X-Gm-Message-State: AFq9FYKP1xya+AUYiTS9fRE3xgO21L3+t1z0wy9w0FoK0V3zVPhc/7of
	tmq+6d91OfWrDIV3fSvVZ7Wb7+GrHiRYqE3g63YMcN/z2rmpXczU9I0TdCgB7Zacrag=
X-Gm-Gg: AYBFou2t9fswJcnyV4XmTqoOvfowmtGLEjDuU9w//YaUrgjk+rmRki0sFB5GLUKqWi3
	DHyTNVk7RDtuvig1PzIw9Bu466jvqbkgrIfhzEiUWH72Mpt0KGzUq7iV7rJf6x/Ws5CAsoBx0dj
	ax4HKc//qaPjPMh4dFKouAT/8JDmwdHURr2ZK+Vkc7oUAaTBlyrNnSg3SR9KMLejHxIXtKQDHkf
	OZHO/mUi4p2/EJBoQOw7feKzHYgwfUbVxlgyLr+mp8cG/iiJufE9OzVjg+PqtUwm8MC5yMiCv1h
	EN4HOhH6UPMdknlCX9RstgMrSBPJbExz9HCU9ZnT0QonKMDwgsSYMiE6vHbLZehZpXG7Z9TALtz
	T2XbMMaa8Ycs1IjbIS19hXcb5q+kkXwFpquRB9e6vB86R7RKA45yRaN7oSwtc9xL3u20ha2baOa
	TbtqWhdfFJLjcsllQne5CRtxHQ17jfo7jGPQGMvjztnOgEzxk/1QaUWwfrECA95s2OdpIMQOT0f
	lU8UDQEstOozvn0nwVo0M4dMMMwVb4pQ8sljAxztHEIJvzLLSqQao2kDY90FEeVzFFm5ghWzUPi
	+wsTv1tlbUVhjPvPJKonwEXswYkCBOk+bREUZVftWFxjZ0Cnkkd0t8Ax6Nw=
X-Received: by 2002:a05:600c:190f:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4a2001aa316mr79122885e9.0.1792657805302;
        Thu, 22 Oct 2026 01:30:05 -0700 (PDT)
Received: from localhost.localdomain (2a02-8429-85a0-b901-3ef0-11ff-fe45-70e0.rev.sfr.net. [2a02:8429:85a0:b901:3ef0:11ff:fe45:70e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a62aaasm53713635e9.15.2026.10.22.01.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:30:04 -0700 (PDT)
From: Martin Wetterwald <martin@wetterwald.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Martin Wetterwald <martin@wetterwald.eu>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>,
	Kees Cook <kees@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
Date: Thu, 22 Oct 2026 10:29:24 +0200
Message-ID: <20261022082927.59030-1-martin@wetterwald.eu>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
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

Since 6.19-rc1, with CONFIG_BCM2835_VCHIQ=y and CONFIG_SND_BCM2835=y
(both builtin), the sound cards bcm2835_headphones and bcm2835_hdmi are
not detected anymore (vc4-hdmi is not affected).

dmesg shows:

  Driver 'bcm2835-audio' was unable to register with bus_type
  'vchiq-bus' because the bus was not initialized.

Since the VCHIQ interface was moved out of staging, its bus is no longer
guaranteed to be registered before its client drivers. bcm2835-audio,
still in drivers/staging, registers at device_initcall level and now
runs first.

Register the bus and the platform driver at subsys_initcall so the bus
exists before any client driver, independently of link order. The
platform driver probe already returns -EPROBE_DEFER while the firmware
is not ready, so probing earlier is safe. When built as modules, this is
equivalent to module_init() and nothing changes.

Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
bcm2835-audio both builtin and both as modules.

Cc: stable@vger.kernel.org
Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
Reported-by: Martin Wetterwald <martin@wetterwald.eu>
Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Tested-by: Gaston Gonzalez <gascoar@gmail.com> # Raspberry Pi Zero
Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
---
Hi Greg,
this is a regression introduced by aa125180c673 (via your tree) in
6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
7.4-rc1 has not been sent yet, could you take it there? Otherwise,
staging-linus would be great. Thanks!

v2:
- Reword commit message with more precise description
- Add Cc: stable@vger.kernel.org
- Remove redundant Link: pointing to same report as Closes:
- Collect Tested-by and Reviewed-by tags from v1
- Link to v1: https://lore.kernel.org/all/20261013131435.1454019-1-martin@wetterwald.eu/
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index e78641703252..d35f5ac5c2e2 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -1462,7 +1462,7 @@ static int __init vchiq_driver_init(void)
 
 	return ret;
 }
-module_init(vchiq_driver_init);
+subsys_initcall(vchiq_driver_init);
 
 static void __exit vchiq_driver_exit(void)
 {
-- 
2.56.0

