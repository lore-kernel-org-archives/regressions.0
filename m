Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664903ACA61
	for <regressions@lists.linux.dev>; Sat,  3 Oct 2026 09:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018905; cv=none; b=u/qPrsGy+/Pt77UXo/uPAA8ErvlTCxggNbXjetRTdmdJICchdHIxZsJBdKnASDx4Ju1iNmhZ5fJwBkhaA9ho38OxYMAkRpEx/zuq9Pa6eLBFgAX9m7NdhcJ2bzU6Wpifr/Jvqm8leYv/ERBAbXrkd4D/m6QnAKxeez5icjtX+Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018905; c=relaxed/simple;
	bh=rP9RNg9VVmVKDqjlIhXyymS0DyeJ4N2kWy3XBRaq6DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=My1gjTnSDU/P4U5h+D4q4goWdFLbF0vHuj3goWSceePAlJZ9Szm+IY494pSZv3BEcVYaLMw3Pp/5s8tBszVRiVVxcUhpoSndBu4hQeHEBclxetXTuzLjrd7i4M1eeVC/R6Ml4/KrXA10SJyBHQdDRkTUJSfUtbA7Vhy+3rpDDj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnGbnFBn; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnGbnFBn"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso208701f8f.0
        for <regressions@lists.linux.dev>; Sat, 03 Oct 2026 02:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791018902; x=1791623702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IWrQtgnBBrtxYpdGid+lEFP8Z5fa4mnFJvTHl2+VUDc=;
        b=SnGbnFBnzn/CaWHK3C405gr9fcAHqX0xNOAuodcxuakmiR7yiQtEGKCzYW1tawr7mJ
         sCyTWPAf8QlvUP+2cm3UzS+LrZ6BocBicgPFCFDTCEuLYQHldLgYOJErRaXJi5+pilgY
         xUOCfThaimTUmUe24E7B5RlOx0mM0a4W8M+OO1tzQ3yBNO2eDbUftvhKmerq3WmBC+su
         RefozAMLrvqsZ1tzShdPvpTSmTI51JKScud5AOtcHkHfUnZS6exQ0RYYaxUgWE/IYo5J
         zBDSfU9nNdx3TP8CrzjT8oFwmwz7iFYe5gr2MCjncpjNyzUyoCYPqME/5UXU45RCu04x
         ufeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018902; x=1791623702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IWrQtgnBBrtxYpdGid+lEFP8Z5fa4mnFJvTHl2+VUDc=;
        b=Tf3tXUW54s4Q+im5e2B5mb6aroQOeoCR0+AMAOxfCZiPDky9D0ZDqFWEEfSy+9fqs/
         L7mEiS728hcPk+iI0njls+Cq7VJmbN7P4orv03ANbFbtDVmhw1s6FBVofeTbdmRqmQik
         4QF+Cjccm40qmIUc9Dl+b0o+QcgjuQWo71UhpNQd6Y4JoNNmJyB6Z3O3DRxXCSvzqU/k
         0b9S0oHDTjHgGXcGDrEkmCndLYF2ApGBkmSaRNndD+OE/gajY5TPxB6n8kIx4ux/nQxd
         pZYHE4d0RUXVV8oQT/JJllR4hRXoDHNhOZDfFX9pQdkq1Kssh5RL7Obh1ROKTKNddV9k
         LZTA==
X-Forwarded-Encrypted: i=1; AKwUvByqgr4Hiu/AJFE0+uVkJ0cC6cxGkmdX8jzvr/MdWrr+GWLRJt99hY0gnL8B7nT9fFS+kKmTAW0WKPBh5Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYLDLyxwTq3B6+DI50Gw4ncRmb+RZIqbNgX21fAmOGomDFMB6bvI
	KWK4hG0hxvmCf8q7WnqbB8TmRIIGadDDR7/Fx6AzTeKuSwaZbvr2RbiM
X-Gm-Gg: AYBFou3XAJvR56Mm+0u4p1dQI+QYCnR8yEw0M497G/trh5fmM1UAxevpsVqP1/D/yDU
	Ce3vXGg0S47ueJ16AGQM954E/KdPPl8IHgopAMLlrWM6AUpsEmrYDwUG4L4XEwn5W7zAODp7NJU
	d+vOZsFw5+yAKoarKZcLkbvPN6a3rw9FJF7gIfEjautxfE2aOZYNDJ2pk0Z4MuFxTG40k3j4MOr
	QUug/4dkEMpCndm1dQixdeY2fM+wxTTLPUUWBb0HInakHxDqgNBik3Q7x33/TJ43rZ6vERPkWPE
	ySu521lVMaf/lkftWQd4ez1iK9dDD3eWK2aStzznRlgMnm4NJy8iVkQRPpFz7GYrUPId+DgwVPB
	lItwmYqAwv4qC9qY3vhSlkFIMdijqFZUfav1hgsQayPWpFu2JefLvXi5FzMCoUPMa9bCiO60xxk
	gVLsQpkaFn2crgPvNzr90vb6QbMjLKod1myvYyl4TwOVdgCgorCKPe72Yv0kdzFEmV0/gMvrcjW
	FExhmcDRJw=
X-Received: by 2002:a05:6000:230c:b0:488:7f1d:2728 with SMTP id ffacd0b85a97d-48c47fe497fmr3047875f8f.30.1791018901393;
        Sat, 03 Oct 2026 02:15:01 -0700 (PDT)
Received: from FranzSP11.fritz.box ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8ab4sm10549817f8f.35.2026.10.03.02.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:15:00 -0700 (PDT)
From: Franz <franzelfranzel@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linux-pm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] power: sequencing: qcom-wcn: power off WLAN at probe
Date: Sat,  3 Oct 2026 11:14:51 +0200
Message-ID: <20261003091451.4727-1-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAPjyS8dY0Q_o3XmFjuKZZsjhzhoSNL+ZGJtw5cQt8HiV3sUtxA@mail.gmail.com>
References: <CAPjyS8dY0Q_o3XmFjuKZZsjhzhoSNL+ZGJtw5cQt8HiV3sUtxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WLAN enable GPIO is requested with GPIOD_ASIS and then kept at its
current level, so that a WLAN module left powered on by the firmware is
not switched off. The FIXME explains why: toggling it would take the
PCIe link down, and the controller driver could not recover from that.

That reasoning held while the PCIe link was trained before the
sequencer probed. Since commit b921aa3f8dec ("PCI/pwrctrl: Switch to
pwrctrl create, power on/off, destroy APIs"), qcom_pcie_host_init()
powers the endpoint through pwrctrl before it starts link training, and
defers until the pwrctrl driver is bound. That driver cannot bind
before this sequencer has probed. Power-on therefore always comes
before link training, and keeping the firmware state is now harmful.

On the Microsoft Surface Pro 11 (X1E80100), the WCN7850 sits on a
PCIe port without a PERST# GPIO. While pci-pwrctrl-pwrseq is not yet
bound, the host init is deferred about ten times, and each attempt
powers the PHY and controller back down. The later power-on only sets
a GPIO that is already high, so the chip is never reset and the link
never comes up:

  qcom-pcie 1c08000.pcie: Device found, but not active

The endpoint is not enumerated and ath12k never probes. Bluetooth on
the same chip fails too ("QCA Failed to send TLV segment (-110)").

Request the GPIO as GPIOD_OUT_LOW. The chip is then off when the
sequencer probes, and pwrctrl powers it up cleanly right before link
training. Drop the FIXME and the code that preserved the firmware
state.

Tested on a Surface Pro 11:
 - b921aa3f8dec plus a one-line version of this change: endpoint
   enumerated at 2.4 s, ath12k and Bluetooth working.
 - next-20260929 plus this patch: "PCIe Gen.3 x2 link up" at 3.4 s,
   ath12k and Bluetooth working, Wi-Fi connected.
Without the change, neither kernel enumerates the endpoint.

The culprit was found by bisecting v6.17..v7.1, with the DTB and
.config held constant.

Fixes: b921aa3f8dec ("PCI/pwrctrl: Switch to pwrctrl create, power on/off, destroy APIs")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Closes: https://lore.kernel.org/all/CAPjyS8dY0Q_o3XmFjuKZZsjhzhoSNL+ZGJtw5cQt8HiV3sUtxA@mail.gmail.com/
Signed-off-by: Franz <franzelfranzel@gmail.com>
---
 drivers/power/sequencing/pwrseq-qcom-wcn.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
index 7f88a29b2..636dd7e63 100644
--- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ -526,15 +526,8 @@ static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ctx->bt_gpio),
 				     "Failed to get the Bluetooth enable GPIO\n");
 
-	/*
-	 * FIXME: This should actually be GPIOD_OUT_LOW, but doing so would
-	 * cause the WLAN power to be toggled, resulting in PCIe link down.
-	 * Since the PCIe controller driver is not handling link down currently,
-	 * the device becomes unusable. So we need to keep this workaround until
-	 * the link down handling is implemented in the controller driver.
-	 */
 	ctx->wlan_gpio = devm_gpiod_get_optional(dev, "wlan-enable",
-						 GPIOD_ASIS);
+						 GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->wlan_gpio))
 		return dev_err_probe(dev, PTR_ERR(ctx->wlan_gpio),
 				     "Failed to get the WLAN enable GPIO\n");
@@ -545,13 +538,6 @@ static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ctx->xo_clk_gpio),
 				     "Failed to get the XO_CLK GPIO\n");
 
-	/*
-	 * Set direction to output but keep the current value in order to not
-	 * disable the WLAN module accidentally if it's already powered on.
-	 */
-	gpiod_direction_output(ctx->wlan_gpio,
-			       gpiod_get_value_cansleep(ctx->wlan_gpio));
-
 	ctx->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(ctx->clk))
 		return dev_err_probe(dev, PTR_ERR(ctx->clk),

base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
-- 
2.56.0

