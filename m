Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F63223ABBF
	for <regressions@lists.linux.dev>; Sat, 16 May 2026 15:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778943794; cv=none; b=MUHzHF+LjuFE8hx5cjYZobgof/HMFmiv9Rs4ghnUzZ77oc/Nt1OaX20ZL6d/A1ANuZ7LInKmqgeyeEbVlb4ovnXun85FFPDtASP3Qwvj3qoDjqCneUlmfhrSpOYOAFjE0D8moIHAOddxPunPBvY6OUtdcI0wePCwgh0GW/Mq2/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778943794; c=relaxed/simple;
	bh=QmkJpHUldte/egmuA7DGybI2tVG7cghkcZq8VmZIces=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d/QXXTELyobvmMxnqvMZ/lBdaebU6kPyh/7WkyvSc/rRXAu6EVS4wuHjHaqQgp50qFmUh0zCfRdvQLUQL+dQR+dET/X6oX9FMZDhaaz43ZsMBLIXkcONuHtfetUdcwX8IzWABGCuChGld4/wQkYFJMESg5JJwikwgLGT4qLuA7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZhQLSLR; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZhQLSLR"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bd4f8260e4eso189340166b.1
        for <regressions@lists.linux.dev>; Sat, 16 May 2026 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778943791; x=1779548591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zxxDjL5gnnI2uwzrc+KACxtlyJsnDYW3Yb57xozjSks=;
        b=mZhQLSLRaGl3tcL/sBw2p4mwGc0/lhkHOEe/qwkZ3KEiVAs7lWtRVGus9BnoMi5Owq
         XjFd6mpenIY+bnqs6S0tgj4C7EH3XNSx7kaG+wssSKh6rd48x7a7t/+zXSjfHno76fgI
         mC9RfY4W2Prxbb70ujKWjYZlqIetMNAJapWwQzLeBCF6G6fGpEJhOxesheEUTw75XqSr
         Cg4Ikq5UJGWOvIz3DsRwHjTKDSsxS6LNLVYrJR1ysUbqNZUGqnqlog6GLmrx2yLfUEca
         0OhD0/24KUuayXEHYfuXmdlrb1NagKGD9GrvQwe2LEWviHEaiW1kQwTFu8S2n9l1ekJS
         gZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778943791; x=1779548591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxxDjL5gnnI2uwzrc+KACxtlyJsnDYW3Yb57xozjSks=;
        b=N9aM5NKfK1VoUaqt8nVnuk+4EFbV/vS8c+U0gufVnV2q9S8hQR0hJ7vnzi+pPeWpRA
         XvNYef+2zl3HZg8j7bJ08/tKuVGuOYhQRA9Vklyp1nS/1pR86QuuwO0wT7XYkbYHS8CY
         Xal0em532XItVKVBSYonvqSKaFsm7c824PugQ/h9V7uA7MxpFEmhEwkX/HPo/sxwRI/K
         2cHG4qvYtCDdNXwGZJaePIsHqpL7YaCpvEFjkYMTN6Tx6m5ihHi1k+KbMtk0Snx5AdOW
         SAUFGP1t1DCs3JSMYbbg5AvTEuuOG7Jfmwc1r+PbJoFrABEfvJizh9Q0MCE/yCDMXH+r
         8yEw==
X-Forwarded-Encrypted: i=1; AFNElJ/mzRoMy/LKhc0XPRBQpSeC/ZZsYCoKsBVgDg2YQekxaw19l8ifLZRGGtD9Bk+l98JYmuLcw8Of6EtsBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyT4qbqvuYdikrw0+mCD7fjTR2io8mlBcpG3KqxUTij9XJ4jF88
	IFyw/D3Y1KG/kjidrbCuKPbldQXjowMipL3OTmwjJcrpjWQ24dCtgQI=
X-Gm-Gg: Acq92OHLbEKwgP5NPMeC+1uTsSWP/nBfn1iRY49WUbbzNYpz+xs6BC++q1R6hHa6Iwb
	nvAiAtpImKYZppyNh6E1DJgSSyz6t5fhIxmONP4xAiPPoqV9cRu/tEyoM6y2P/1cYetA28ek+++
	GJ69s1pr2jbwwHiJUS6L+gdGOJkpdaVe6U8NyRqH6ntQavTE2nodXLNlEa873uFIr8/TsotfbvE
	cdbhOuoNNq4xRoJxKY6/ukSDBXDFSC++DLI2ARpBixfmJeQ6AEU8sKJBZJExXV1blxdGumWG4dO
	/k3OhRSLXord8nJTCP7A9CAGQoYSjwqZeE71HCPABKHO+LwaMsXeE4v3/cvM9Vn67m1uLBp5XDy
	i5sRR8TczjBd+IkBYl5KsrXE8Y3I8+iYj164Z+xjCL1YQAmfMRH0i1oyTRLR87a4+8oKrI2aGnc
	MpSnaxgVjzXcWoW1XUvPUQM2UNozWgGZflodgTYr3puuYlBfrQ/WfqXN3ol8vQ/ITTA28BPNibX
	tuhKfjkjMaZ/ybg+PWT7REO/ZOau7THhwgYAf3VGZY=
X-Received: by 2002:a17:906:f59a:b0:bd4:6c96:f87b with SMTP id a640c23a62f3a-bd5178f913bmr453717966b.28.1778943790650;
        Sat, 16 May 2026 08:03:10 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e8fbsm3313946a12.2.2026.05.16.08.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:03:09 -0700 (PDT)
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
Subject: [PATCH net v2] net: phy: skip EEE advertisement write when autoneg is disabled
Date: Sat, 16 May 2026 18:02:51 +0300
Message-ID: <20260516150251.879680-1-nerijus.bendziunas@gmail.com>
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
MDIO_AN_EEE_ADV).  These registers are read by the link partner only
during auto-negotiation, so writing them while autoneg is disabled
cannot influence the link.  On some PHYs (e.g. Broadcom BCM54213PE)
the write nevertheless reaches the chip and disturbs the receive
datapath.

Concretely, running

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
Changes since v1:
 - Reworded the inline comment and commit message: the MMD AN
   write is read by the chip with side-effects, not silently
   ignored. Suggested by Andrew Lunn.
 - Tightened the reproducer paragraph (was repeating paragraph 1).

v1: https://lore.kernel.org/netdev/20260516114334.812828-1-nerijus.bendziunas@gmail.com/
 drivers/net/phy/phy-c45.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/phy/phy-c45.c b/drivers/net/phy/phy-c45.c
index d48aa7231b37..126951741428 100644
--- a/drivers/net/phy/phy-c45.c
+++ b/drivers/net/phy/phy-c45.c
@@ -940,6 +940,14 @@ EXPORT_SYMBOL_GPL(genphy_c45_read_eee_abilities);
  */
 int genphy_c45_an_config_eee_aneg(struct phy_device *phydev)
 {
+	/* Writing MMD AN advertisements while autoneg is disabled has no
+	 * effect on link-partner negotiation, but on some PHYs (e.g. the
+	 * Broadcom BCM54213PE) the write itself disturbs the receive
+	 * datapath. Skip it.
+	 */
+	if (phydev->autoneg == AUTONEG_DISABLE)
+		return 0;
+
 	if (!phydev->eee_cfg.eee_enabled) {
 		__ETHTOOL_DECLARE_LINK_MODE_MASK(adv) = {};
 
-- 
2.54.0

