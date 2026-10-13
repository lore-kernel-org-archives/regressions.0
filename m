Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346E94F052A
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897364; cv=none; b=kMm7yV4OJozwrB5ACHdt/Zrua0SvDp4utUC3yfZgEcrVYQ+cq+/NCr7stjSZtkAKyxnBNBUDwlvh9FyIVuPUiqLDB7Bn9Aw/CAcMJAUJtUd5oFNM7sC1ylvkWmPZn8tOf+WOgZ64kv4zeWZ8AlWgwh2JqEBRMA3q3D+LYYMaFYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897364; c=relaxed/simple;
	bh=KYNq+5UASvVLUUueo5+fWrGKvfr+e6x8JGly1DJBrfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mS0k7F1899Q7lACSORXGoXvIOo0TBwC2inVGqJ6b0N8pd/fk/3t152pDV7T3BWxx7bJD6KgwSYP9zXAKXoIG9i7FDc+2l4FcVcdS12PeQQwU15W8Db2ZCVhPHjwn6zdfTya+uRuSxRKKnpnHtv+Cro65bUIdIz2/fafkz4rZRAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu; spf=pass smtp.mailfrom=wetterwald.eu; dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b=rO+uDpEH; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b="rO+uDpEH"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso3372259f8f.1
        for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 06:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1791897359; x=1792502159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ig0Y0bs9FN6Dhfi95iv4Xq2tV5MXRKRrxHG4lzB5XTM=;
        b=rO+uDpEHImSw9FP3tZvTrtubwORcUNZEARbY/7LnUrcn7IDpX+/jBqyOpy5Voen8Jo
         +vsnPXlTGABtdcBHs/cSh4gsAjTU0ZrlyToqjHCpAYkb4xo3QUW74hxxedtetKrmFNA1
         HrkMatrO8MDgcQ9G52xaD2+fKfJAXtH8K+LF8mrADTzVIZBXEBynM7pmhfKQECPL9Rfe
         axq7j2eGhILKPrlYZaacV/lVG8m1YLxbdwJzR+hliPGaDjo5Cq2eTbIvp5jA4OBn5EGe
         W41/vnTbmMFlYnjrb2NMGsljsBUzwRdbDJ1tBRcOV958TgTmuizj+WO2ilBWI2SGYZyv
         bSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897359; x=1792502159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ig0Y0bs9FN6Dhfi95iv4Xq2tV5MXRKRrxHG4lzB5XTM=;
        b=BxFzWKb/yJpyp3/dR9nYP+0RMU7PTytiiVPpcqwtsLtSLh9KTUW+3fe1KXJUDeSQFa
         UCHtsRVgxTyvs8Gv6dHGgc+KlFjqiDpM4jx2zPnyro2REZLQjI8K0J7F9e6uWD0c702i
         7bBjrgMIovlR6cyXqCeTNsaIOGo5PkLshpGZyZ4AG7j+PWJAet0Soy1Iiv3olM6VgjaX
         a6m4HkZlWF8yIREFIqtmNFchcd+0YkY6QeM/Gk/n6mrFbG3xhfs/AFScsJ9W+Td2xmde
         A6NmDX+e1+C1NkBn1nxgbrwq6m66g6asMK24UJ3gZM7hONe7XKG3HviiNuNInfTfDX+E
         SGug==
X-Forwarded-Encrypted: i=1; AKwUvBxAIVyDFkBNaOZPKJoJk8b+fJHwJNS3DeGFOZCzX5uOOtPJhjG9LyVO94WQJJOSorUMhQ/3lUupnvWh/g==@lists.linux.dev
X-Gm-Message-State: AFq9FYLd8aqN30KDaV/d+W7RXUppdSl73H1eWdzv2FcQVfNHzSX1i4vY
	iuF0udMEn0+20gyMaJbPsUhsqge3SiU9vv+mVCSWdfPxuIGtOBR9grd9VZ3pzQL7Uj4=
X-Gm-Gg: AYBFou2FvpTejSTPy1J078D7xduXEvjkOGLmF3yiV1d1PZFuNC8hvwi/vXRoiOnxFOO
	/OwiFJ/YZaNYCPFTTnQ/Uje91rzD8FMPtjjWj3Xy5qV0QgzwcR6bo8LQ/0SGZn7k4eLikG5dnh3
	DusGBSMS/wDXXKA+bYZgCPH5rnwCCVJfRWTtUMSzSTXD037zKwI20TQss9fOAYO2QRgrvCa7UNu
	DSsDcQ9KW8/Q1X3OKUkGsufqmSHVMECjXL6a/E4QExuAp9/Lacl6kQ0cqRJPwXJT5FcUvlEAHuK
	zG4Ek0xtMNrtTiJ+QkQS+pzhf8sA/gfeXCyeXWlkSREOUDeI9XArgGiAktYTaE31vv6u+ei30Bj
	NiVm8jWE1tJcDSlciwCyCLr+/kbB1Cuj56ZxrwpFtHIEHfOcsQrk3y+lwPfzwkLnwPYxPQYSfpS
	lP/ozczITQFRsZsbEQGC3HGWaBqMGFDjVJuOWa4GHzEAZ6rvRwYpiIzgXHp14oPoOuAg==
X-Received: by 2002:a05:600c:3512:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a18e4913c3mr213743705e9.8.1791897359239;
        Tue, 13 Oct 2026 06:15:59 -0700 (PDT)
Received: from Halley ([2a01:e0a:dcd:52a0:bf8b:5759:6fe4:3105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be96549sm520141515e9.6.2026.10.13.06.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:15:58 -0700 (PDT)
From: Martin Wetterwald <martin@wetterwald.eu>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>,
	Kees Cook <kees@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Martin Wetterwald <martin@wetterwald.eu>
Subject: [PATCH] platform/raspberrypi: vchiq: register bus at subsys_initcall
Date: Tue, 13 Oct 2026 15:14:35 +0200
Message-ID: <20261013131435.1454019-1-martin@wetterwald.eu>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the VCHIQ interface was moved out of staging, its bus is no longer
guaranteed to be registered before its client drivers. bcm2835-audio,
still in drivers/staging, registers at device_initcall level and now
runs first:

  Driver 'bcm2835-audio' was unable to register with bus_type
  'vchiq-bus' because the bus was not initialized.

Register the bus and the platform driver at subsys_initcall so the bus
exists before any client driver, independently of link order. The
platform driver probe already returns -EPROBE_DEFER while the firmware
is not ready, so probing earlier is safe. When built as modules, this is
equivalent to module_init() and nothing changes.

Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
bcm2835-audio both builtin and both as modules.

Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
Reported-by: Martin Wetterwald <martin@wetterwald.eu>
Link: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
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
2.55.0

