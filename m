Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F5C42CAEC
	for <regressions@lists.linux.dev>; Tue,  7 Jul 2026 16:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.209.48.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441772; cv=none; b=oYGxMJ/EcDDa0Oi5Qf6VtomU1wyTkJuoVWlhs74BRw1y7pmaTcqjE+N7R9FNa4KBfAMIuU03vKOBOCjAvOyxvbPGz4XD8S9/bwnp7eyF0K0kNl5TeV4SdA9/K30GJArN9A6HZG7Hl9OnwnO2KWXr/U6e0QAt4yhQhLloUWWP4sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441772; c=relaxed/simple;
	bh=iStYC0Iq8iFRqb83/hsfeJQsuMLUUC870SWEGOWoh+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KrR0g8D4my5LYERdQt7TK1yvWnErwAk7DPJRSjOMZ+Y/Zv4smZm38pg3M1rLFAIPGj9x13v+ASzmkoSWhr0FDS8Vdi+MHRIGSjqkxGm42lYc9jeHdzuzypFujS8MlbRtysX9UbHjjPYLFeffZL/ugcFkSAJpxnu9fBZvS5IzkD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=agner.ch; spf=pass smtp.mailfrom=agner.ch; dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b=OExklQX0; arc=none smtp.client-ip=178.209.48.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=agner.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=agner.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="OExklQX0"
Received: from allenwind.lan (unknown [IPv6:2a02:169:3c38:10::3a0])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 5A49C5CA16B;
	Tue,  7 Jul 2026 18:21:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1783441310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:
	 content-transfer-encoding:content-transfer-encoding:in-reply-to:
	 references; bh=1lw1VBDE1/D2I6ja8qlx//S0jIyLgr96wpIl4MJHkxE=;
	b=OExklQX0Z1RbE+wjJPmTMPSVhBQoTHdvN82uETaE1DHuFypcgBk2aUoB16NyUEuQN0lUe4
	0X/5M9sDKZj7IoVSnybczAGLz9yKrX1VHWAUjX1+XzzOmz6OPBeG2pUd6bb87VxYv6/OwM
	AlvuAaXr2C2jIkXgK31f8EO6df7/474=
From: Stefan Agner <stefan@agner.ch>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	regressions@lists.linux.dev,
	Stefan Agner <stefan@agner.ch>
Subject: [PATCH net] net: stmmac: resume PHY before reopening the interface on MTU change
Date: Tue,  7 Jul 2026 18:21:46 +0200
Message-ID: <20260707162146.73823-1-stefan@agner.ch>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the referenced commit, changing the MTU on a running interface no
longer disconnects and reconnects the PHY; __stmmac_release() merely
stops phylink, which also suspends the PHY (BMCR power-down) when WoL
is not enabled. __stmmac_open() then performs the DMA software reset in
stmmac_hw_setup() before phylink_start() resumes the PHY again.

IEEE 802.3 22.2.4.1.5 allows a PHY to stop its receive clock while
powered down, and stmmac requires a running receive clock for the DMA
software reset to complete (the phylink config sets mac_requires_rxc).
On such setups, e.g. the RK3566-based Home Assistant Green with an
RTL8211F-VD PHY in RGMII mode, any runtime MTU change now times out and
leaves the interface dead:

  rk_gmac-dwmac fe010000.ethernet end0: Failed to reset the dma
  rk_gmac-dwmac fe010000.ethernet end0: stmmac_hw_setup: DMA engine initialization failed
  rk_gmac-dwmac fe010000.ethernet end0: __stmmac_open: Hw setup failed
  rk_gmac-dwmac fe010000.ethernet end0: failed reopening the interface after MTU change

In the field this is triggered by NetworkManager applying an MTU while
activating the connection, breaking networking entirely.

Resume the PHY before reopening the interface, like stmmac_resume()
does, to ensure the receive clock is running for the DMA software
reset.

Fixes: db299a0c09e9 ("net: stmmac: move PHY handling out of __stmmac_open()/release()")
Link: https://github.com/home-assistant/operating-system/issues/4858
Assisted-by: Claude:claude-fable-5
Tested-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
Note: phylink_prepare_resume()'s kernel-doc says it is to be called
prior to phylink_resume(); here it is paired with phylink_start()
(called from __stmmac_open()) instead, which phylink_resume() itself
uses to restart the machinery. If preferred, I can extend the
kernel-doc or introduce a more generically named helper.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5884,6 +5884,15 @@
 
 		__stmmac_release(dev);
 
+		/* phylink_stop() in __stmmac_release() suspends the PHY.
+		 * IEEE 802.3 allows PHYs to stop their receive clock while
+		 * powered down, but the DMA software reset performed by
+		 * stmmac_hw_setup() requires a running receive clock.
+		 * Resume the PHY, as on system resume, to ensure its clocks
+		 * are running before reopening the interface.
+		 */
+		phylink_prepare_resume(priv->phylink);
+
 		ret = __stmmac_open(dev, dma_conf);
 		if (ret) {
 			free_dma_desc_resources(priv, dma_conf);
-- 
2.49.0
