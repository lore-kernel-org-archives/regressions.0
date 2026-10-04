Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ECF3D16F0
	for <regressions@lists.linux.dev>; Sun,  4 Oct 2026 16:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132696; cv=none; b=IsdAT7RbHN+t6f8dc/wj/WTPoPn4lJPeymUrVQqjt3gptl5Bv0ztGk+XBXovpyQZGtWXFS7XDKZ9f/F67Dy9CiHoAJ5Ak19qnil79lulK/vcMv7tgTJSER/ROk+zJobjaymUBX6W2ktKJlEr5579l8RlsueFr86d4Z8I+GBjIMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132696; c=relaxed/simple;
	bh=7wG9Ljo/wLQuUSFyuvqM5SlTjkxmEhtxmQbgpLCzXuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MYjzzVRrWSSfC9sJ7iGa88o8SWLFtwuP05LfPxng+hMpnhPJiYrmIJQcQDT1JilbO3LVQpM/7yzTgxOPgDINXaLGdNtKuZUblK8nqugLmp61smBDX7dlqC0oSnHA9D1cV1nVomtrY3GQJv0QV5XLknJxQbALfh4ja7Zk2tVhoks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4iZ7ikq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4iZ7ikq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1728d8dfcso625015e9.1
        for <regressions@lists.linux.dev>; Sun, 04 Oct 2026 09:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132692; x=1791737492; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NP4InVw4ZvTsXvnaGIApv16AhZMv/UaEABA2B83Ciew=;
        b=P4iZ7ikqLRFhPTsySU7QC6ch48mui6fcHATvQcy2gnrRGgPPTTZrxC3qBh5U0hzoqO
         b5JO8/NGUgnxbIslkzhgUYzj7g9sUft6aEJ1wBAc86cOCZhCQRjpgTyUEf6mdmI2q5bP
         tQT9xeaC0J7vGaoEokpoyMheFRMOO48N9VjpxSaY3t74/j19biSMAHUa+I3AzDE0PyCZ
         rDkJcigPRJW0KyUjDKvM6RxbYBaCpE49Es3/pnE8/m7fI4aD0E7qksvPEgVOJ2sq4YNa
         k3LRZgb2RlMYZ0WmPn55tM466x4E7PzHDgyIaLlA2AmtE1fOo/gr1a1ZBTITyZHrKc+D
         8r/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132692; x=1791737492;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NP4InVw4ZvTsXvnaGIApv16AhZMv/UaEABA2B83Ciew=;
        b=ZAk2w7eYOu/6u6lTdvXqgbsqyBMlonVOqxxZK9EHCvXCBDrYlF2yDFebm7YkmsJPkA
         AkR2WrZzTXDbt2oWSc1v+sUpxNLdXngSYDXusMRpKw4tm3kmZ9O6RLHH3a+5+VvnH2zu
         NM02J5oSRZjRRUf9zE5bS8VYWa9p/BoJboKFTzOT4iwBOp971qyFQ1RmJ6w8tmBnxxSX
         A4CVR7K88bqDZPdrkQv9aQgyTIFmw8f/ZpzFW79uSiViiaHkbQLpSRajbvW4D3C6y05e
         or4i2EhgP0G0A5yTykd4zFhKc3AuZ8RoVFE56RdY+oVmAHiRe1CRTh0tkvf+8y7cj87w
         bqiQ==
X-Forwarded-Encrypted: i=1; AKwUvByDOZKIp9AofH/kveV2lF2/n66/1Yfe/ljg7k2uzYpkh3yQ/iPDUNWHCkRlHDTbjJm25D4qxMDrNswEtA==@lists.linux.dev
X-Gm-Message-State: AFuF++lCxduvZxqHRUgxcdDOj40b8aznUxyIVHbh4SmxKv/bZrr4OMwM
	jmrMMSHAOPtWPDH1G9AeVkFhKOdlyC2t6HMYvVa6w413KSUqyF4EXehq
X-Gm-Gg: AYBFou1ESy7krllWQIzb+Vz94kUVXcjFIzUChefPZHCD24R1ZblYhe4yrAsjYIp7sDC
	KOJUCbk4tfVIQBwhATO7l9MHNEuQEn26NbJFbKGNO6foawXDBvP95QmLZbl2j+Kpt4RWgw2kxVe
	7gjcYoA24GYKpV16tWcLA1mxj5/Thj4bayv58JJFHW8qvD5SZrIs5LXpD4Hbt2IHi7DtEzKcG+J
	gI9UIAVXSUxhEeuseZr8ctKPgdmm2450ot1+21wNel/Jfm80FR0qkkkAUaBqRC7fVpxytm5PyZw
	vhbE/X5uOqSewMFQTamj/6TTiexeLGWma6u0oghCNJlxrwWKBSWHWLbJqO+Pe0i40monLqnpky5
	mJJBtr6KdUXYkFcxnYoW4tGW4KbHc5C9KeiaCWKNrlHNg7VHr2dRlON1fkSYfu3yrB3irpCaXg+
	N9y66xQbFtdW/oeaxwEk6ujSgMtw7DJfbquhysaHEzQHdZ0tH8Li5sgsCUips0Q4E6BudlL7oLk
	mE8+guy1V4=
X-Received: by 2002:a05:600c:698d:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-4a1680e5865mr77354445e9.14.1791132692261;
        Sun, 04 Oct 2026 09:51:32 -0700 (PDT)
Received: from FranzSP11.fritz.box ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm311375035e9.8.2026.10.04.09.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:51:31 -0700 (PDT)
From: =?UTF-8?q?Fran=C3=A7ois=20Roux?= <franzelfranzel@gmail.com>
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
Subject: [PATCH v2] power: sequencing: qcom-wcn: power off WLAN at probe
Date: Sun,  4 Oct 2026 18:51:24 +0200
Message-ID: <20261004165124.4277-1-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Closes: https://lore.kernel.org/all/CAPjyS8dY0Q_o3XmFjuKZZsjhzhoSNL+ZGJtw5cQt8HiV3sUtxA@mail.gmail.com/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: François Roux <franzelfranzel@gmail.com>
---
Changes in v2:
- Sign off with my full name.
- Use the Assisted-by format from Documentation/process/coding-assistants.rst.
- Add a Closes: tag pointing to the regression report.
No code change.

v1: https://lore.kernel.org/all/20261003091451.4727-1-franzelfranzel@gmail.com/

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

