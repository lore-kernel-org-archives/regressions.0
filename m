Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAC53D6494
	for <regressions@lists.linux.dev>; Sat, 16 May 2026 14:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778943162; cv=none; b=FWmdzCodXCdb29DImRCW75mLBZiZVcl3TF3ORRTqpw7J2ZwjR1DrxMRA9a8wuRd17gXrYInlefoQea5imb0goMKKP5ew/WiuLh1BRlGdHz1nvFRPqcU27sXTuAZrAJuRD+E66kvvpzI/4SvvTXnZ+LYHunK0iYhV4mIW7Ii4j6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778943162; c=relaxed/simple;
	bh=QmkJpHUldte/egmuA7DGybI2tVG7cghkcZq8VmZIces=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aUb9EQqnlZTMgK+DPFla+JGUAXAESpAhoFgGvCeFWK8EJZ6TeuakvIDt1otztuRs9JhX92G7Sv66LAoc3i2V+w7kcVMH2NZo+B/i60cS9q5NHWCOFM1RIcNjit8D6uokApmagGml4+ij2dVr59/qvriZhc6+ezVWhGqBy8HMgYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pzwZS407; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pzwZS407"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bcb5370bb0dso209983966b.1
        for <regressions@lists.linux.dev>; Sat, 16 May 2026 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778943159; x=1779547959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxxDjL5gnnI2uwzrc+KACxtlyJsnDYW3Yb57xozjSks=;
        b=pzwZS407UCqACacyZtJzcFqu3BzP5oNYg++DUmC/HkLWUdExojhZ9FrmPJ9I6JX+kr
         MtiqoMNFg3DwiRF7AEfbLzZuAaOKTlPGLEWdFvI94Vw2/yTEfUqRsFtia8SktH5hcSH1
         4ixME0dMhb3lT+0hOYbnVrdg3I07nR/M1QOLorOMNruFrpQDFuyZ63AwUJ3ViJmYmQsN
         gMyheMNOexJs7HFB4/jV2ZBf/Su+7UMKq9C0dnNZfC1Kn3AStqS70n4PUhHGHxYyY1nf
         gOb2G7vcumSunqEOsSJZSdiHIP1Aa1Sc+X8AOPAzWt00gzP1AAmDQa2N3CnTPPZ+ug3x
         r8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778943159; x=1779547959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zxxDjL5gnnI2uwzrc+KACxtlyJsnDYW3Yb57xozjSks=;
        b=bvAQtFHV++GBUz7ZlOmd/XY5JN9bY6F03qXfNnC8A23eDxRBLE+P2Mo/FwPSg8aiAt
         2W0PCwFfn+JF9rOeHqoO4WFZTYYgX9vnpuY8Ms5Rls5T4AZPPgl78wwnhbfSlqL2v68n
         sJUS4phjKbPsrG8XdNOHSqRa49d3IzHfnJDDR6mAeNB2hWipQiGL9jrZJrWTgdtqeQWJ
         mZGOrr370V8zaen2eq70oSLyaD8/h07c+KQMJotXa0wfnNXZkIWb+uELEZq9L06B1/gx
         9R6O8Ku6fY85wdZdsRrQWSHY/dPoHVkrJy65lx974toSQFJ+fvBE2gFJeqpT3Irtgd41
         G7nQ==
X-Forwarded-Encrypted: i=1; AFNElJ8p4ELDqBgT4TH5er3VOEpXfk/idIbeZUqcaojxYq9TQRSe20x0F+9Mx/5vmPnXFH257+r+G3HHLr3r8A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/XgGaAilRUAiepoathemrgNRbn+Ufn5vrIsTp2YP1QU8tzVWF
	Wz2y/ki9baSTENWavqoJxfOVDd+YRl46izaGfLTFrcRuCHNE9VNTkes=
X-Gm-Gg: Acq92OGtk0Whm2+H/rfG6Rl43reGgXamzqSrISIfYa5O160C1vIAbHegebND4WmliFq
	+1Ou8Rm905YNo9/ntHFL73+LmzeJ93VtVs8Rk0OrvRGJFFboH7SqTnEv10VUnGJuz3ElEUqFpI3
	FPNWWH2oO0cPnZkuF1g+iVLp4+XNxtzbupJ46GCCC3JtpaNKaDSoiUhcjGZFiTmZxAfjHouTCsE
	3JBZKNMIC41DPy5GR+iyVIbM2RPtjstmwYX1ZpTF4q5e9a5r6tGQknxjpvcWqYPKysDJyV9s5He
	Sw5n31XTThl8CzxFyZy4OK7OBCu5ChRGen7l87to1/0vRjfiHzGwUkzxEdW3gpx1Zcq17n/olRc
	1Mh4F0L+QPA8S0soBtSM8cU0UwQqXC5Yey9/eXv0GSrHE0+m/16aA8yEe3f7Dln/w1yGU0yLquf
	SVBpR2DfSPz9UFtE+tSM33NpQhysvhWLe/pAfPlfZYxOqdm4fOdnwfnjagFvwlIPObzJp6/hm0t
	XiHnqe/uEGpUMXglo0nqVNhobiLqNBQ8sRPx77vIPAWpQ9FUdc1hw==
X-Received: by 2002:a17:906:8e0e:b0:bd1:d244:ca24 with SMTP id a640c23a62f3a-bd517861053mr429002166b.14.1778943158629;
        Sat, 16 May 2026 07:52:38 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd0a40sm352858966b.12.2026.05.16.07.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 07:52:38 -0700 (PDT)
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
Date: Sat, 16 May 2026 17:52:20 +0300
Message-ID: <20260516145220.875871-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516114334.812828-1-nerijus.bendziunas@gmail.com>
References: <20260516114334.812828-1-nerijus.bendziunas@gmail.com>
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

