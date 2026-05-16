Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C1B3D5656
	for <regressions@lists.linux.dev>; Sat, 16 May 2026 11:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778931852; cv=none; b=m84dJFfmaf3EcQHJGOC/y91lZoQKmx/xWB0nIIiQlJUk7d2i5vFGZr6T+UdAmhbo7p+hsdr7yWVcvLTETe/6hs4hTa1DbCrzr++3dNfoiuYMxHfDc/CaAN1S9dM/uoGXcyAB1qW4lCEomR0qsgWwPjFDLETDtY300ITYh63l+dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778931852; c=relaxed/simple;
	bh=++BkVs6zd7CoLhOO3C+xH2eBltu/4VfD8o0OiHfcmv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GsMS5ByLQm0q6dm0GhLTHdUn9LVqg43o2CV6Gb8QG903mVw/d2pkQF+wZgxmCHJbKAt4AS6bwxVmq5gMtK3sTN+DuhZP+/3uQr2VCGseZ82hyOh8ctTtunt+BE6YMFDibUyxK7KX8rrfc7fahbXWfIvGH1BmBP7d5QWFO4ARK4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+pSQxlF; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+pSQxlF"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-448528f4e69so343960f8f.3
        for <regressions@lists.linux.dev>; Sat, 16 May 2026 04:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778931848; x=1779536648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xQSGGdfR3qK5EGYwiYLtow8+RTdavMFkAuIx9DxFHaE=;
        b=V+pSQxlFeN0J2otpNbCXCNZclOXq4W1dpGtZ/XxlKXsVH/busJUt6VGP+vMSORWMt8
         Bxi9tmdA+rEz0SI8u9REplucNWyZnocrE/gjjcLg+liSABpnRPpkSO8oMQR/XEIc05vF
         YPVVOUtPMa6dZ52cXY291K9YUjrA9WfpQ8HAj4bYF1a7lOfw3Xe/m3UnoIFopO4Jx316
         VEt85vGKTTGhuJk2YMepOyTfoTCQ55yeFxLdQLg8QgMRTSHuEuUykcYKHTZgtQIAZIT2
         /BEE4BcW3vlYWKisHeSUlpw1GUuOYa3mqXiwQo7h2FO3gxL3ObPvXpvXXJUURbxF0M3O
         ouIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778931848; x=1779536648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQSGGdfR3qK5EGYwiYLtow8+RTdavMFkAuIx9DxFHaE=;
        b=d/cZv1UUqNG2P46MCosXWgNrOkfdgMLuQ//m7IggKLKYxPnJVYHSVT+i21JeHf3Q7y
         S0cKJ0FHDPB8ih6M9pLnb94Kzv62JS5e5wvWiIFaw3Xo/AO7PlXYbHq8MIUleKA5XUX0
         RzzVwpDidQWXc4TEK7WeRNEQ4GyW/1IK5y4nvtTP9FsOFJN7h/eAdk3Lc2IG+bdX9Dhy
         7ZOoSSN5jr6Fg0TONgHng3WUNIr9mzBbm54y1iRH6a5ABlg3RGaHrVFc6PO85FhSHc0v
         ZkilLDWJQY49Mss9Efuu6nkgK/HWPJt6x1+qlCJ6d3tep+6LIgjQdWGrf/U4Y0EeBTps
         1AOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/dhcv+aT5CZRE9DNEEKhVXKYFPPGpBEbxuNA+ix/hCXj9BBhAALolWzcS+IACtHgSct2Yr5h4iumMoDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YywwRupaDDO3QBt1vjoBi5SQrp9qDOUAEKsuF8WmDz/TIXbgGaX
	tjU3l1sD+x0xNcOmY5sXO9J/duhifOrZNBfnQPCejMJeZKwfzX+tVok=
X-Gm-Gg: Acq92OHe3B23lEO19/nPQpoI/99z/TTpb1mu9PwAwr9Pd9JqZ0nAfqsQjSm5tpbrp7U
	92tw8REp7SPtdaoZPVug0Tq7Axq7HI7WwdAffVn8ZE5X3Wnz7VCgzyrmcn66qUUEM9XmP0eniuk
	0uRJnLLnpkw3jw2PPSOehgTCp//2JEIwjdK7ByxOm3PfzT9N6FF6Kg9lN5oO2gsLt4nKG3UuZ9+
	46svfcMAYEJeMUVpvLUEEuPIXSHwPjZCjxtl/8v8AabJySZgD/AB7OQDjepvAhThKPoGa+Heb4T
	kaVzdu7Ga5imDvSVXangWdmjlmUhCbpZNaUFU+o/wCbcwnGc87KUZNJQSyx8arPQVMK/JyQ4Ml2
	ndCgP+s9kINwjoQstPdSEOXh7/J3MllRXmvJXBXjdjoEH69QTS7V+FFwJjN/LOu9RuiOpHv3ByJ
	tWcoYP0mrsVwghZ3bX/MbVEc+lNmzB+VjnV5rBy99puxXsdux4PJrojvUIsuh6RZS+CcMH7ZhsP
	iOK+KLr3XWIjeMhFHSv15flb37Y5dAsDJFfc1k51mtbEmbAmtqVqQ==
X-Received: by 2002:a5d:64c6:0:b0:43b:4136:1e6f with SMTP id ffacd0b85a97d-45e5c5dadbamr10534747f8f.38.1778931847777;
        Sat, 16 May 2026 04:44:07 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a178adsm22836469f8f.18.2026.05.16.04.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:44:06 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH net] net: phy: skip EEE advertisement write when autoneg is disabled
Date: Sat, 16 May 2026 14:43:34 +0300
Message-ID: <20260516114334.812828-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

genphy_c45_an_config_eee_aneg() writes the EEE advertisement to the
auto-negotiation device's MMD register space (MDIO_MMD_AN, register
MDIO_AN_EEE_ADV).  These registers are only consumed by the link
partner during auto-negotiation, so writing them while autoneg is
disabled is semantically a no-op.

On at least the Broadcom BCM54213PE PHY, however, the indirect MMD
write triggered from this path while the link is currently forced
(autoneg off) disturbs the receive datapath: the kernel still
reports the link as UP at the configured speed/duplex, but no
frames are received until the link is renegotiated.  Concretely,
running

    ethtool -s eth0 speed 100 duplex full autoneg off
    ethtool --set-eee eth0 eee off

leaves eth0 with TX working and RX completely silent on a
Raspberry Pi 4 / CM4 board (bcmgenet + BCM54213PE in rgmii-rxid).
Switching back to autoneg recovers the link.

Prior to commit f26a29a038ee ("net: phy: ensure that genphy_c45_an_config_eee_aneg() sees new value of phydev->eee_cfg.eee_enabled"),
the disable path was effectively a no-op because the helper read
the stale eee_cfg.eee_enabled, so the underlying PHY behavior never
surfaced.

Bisected on rpi-6.12.y between commits 83943264 (good) and
effcbc88 (bad) to f26a29a038ee.

Fixes: f26a29a038ee ("net: phy: ensure that genphy_c45_an_config_eee_aneg() sees new value of phydev->eee_cfg.eee_enabled")
Cc: stable@vger.kernel.org
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 drivers/net/phy/phy-c45.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/phy/phy-c45.c b/drivers/net/phy/phy-c45.c
index d48aa7231b37..65de6a5fa204 100644
--- a/drivers/net/phy/phy-c45.c
+++ b/drivers/net/phy/phy-c45.c
@@ -940,6 +940,10 @@ EXPORT_SYMBOL_GPL(genphy_c45_read_eee_abilities);
  */
 int genphy_c45_an_config_eee_aneg(struct phy_device *phydev)
 {
+	/* MMD AN advertisements are only consumed during autoneg. */
+	if (phydev->autoneg == AUTONEG_DISABLE)
+		return 0;
+
 	if (!phydev->eee_cfg.eee_enabled) {
 		__ETHTOOL_DECLARE_LINK_MODE_MASK(adv) = {};
 
-- 
2.54.0

