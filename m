Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C6C945F
	for <regressions@lists.linux.dev>; Tue, 18 Jul 2023 11:12:43 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-51e48e1f6d1so7548040a12.1
        for <regressions@lists.linux.dev>; Tue, 18 Jul 2023 04:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689678762; x=1692270762;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AhHDBQW6pCSNYq1JTlmhXhxZHoAPbM2Neu+cKdkqJ04=;
        b=VM7pWwj1nbHBD6FGgtN2keWkZHbhFifDdVzLK3OM0i2Ji14xDFhxP10ION5oiU9Kcs
         uqW1HscwM57gG0d3MfvLuBXYTXknnZaSf7nt1AxqzGy6XLwX8TJYluclEv0bevOhfXUp
         sDChMGm2zNAfYGQyFdeeqGQzgJ/3tGusLAHEWZudInPBbb1R/c7pSHgHkm7zjC3zW4tt
         zh+yOUa1QFGKUytEMiEC0QnX48FsSd+prdpVf1FNwVYTEQ4DjT2wGcX02SULancts7LR
         KqFIWbwzUAubyXbEc1gnVn4FI67FCwEhlkoBv1VxcmnKLDGHHzAeqqQ5baqglIzr1xps
         ZINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689678762; x=1692270762;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AhHDBQW6pCSNYq1JTlmhXhxZHoAPbM2Neu+cKdkqJ04=;
        b=VPD2CsxiSGTzS1Tne1xJjtiYQKfzDWdObRUhcPeW5MeZZZTjdP+9LvIKaL6tUq7IVK
         CrAxVQSKTYh03/juuaS6RtqYmO8dRuaAQ+Ce5MWyiqK2maeyl0u6FKs+57/OVZ8Ky8zd
         fois96b8Mkvv5QgytmowuWoptBBkQhpZ7//aKKFpk20HjDJioAWUXwyP+rTmtUHYLije
         nO4VPLV+2fdxkitauyL5+tQ7RXplRXtSbB8z6rVRmPILuNsZjvQsc02DESq5FTbCTbR9
         sQkmATIPLmewJtfiO72q1tvOsmyArnn0aPkGQ3lOZiaCVgYEpT7LzRUq9v8nK4Gqa90M
         8/uw==
X-Gm-Message-State: ABy/qLaD8SflMELQfFJhIWeW7qQany4pCoZndPQ4kmQ2rUMFlwuUGc9b
	26gB36tHsGNOWKdgKwrgrh8=
X-Google-Smtp-Source: APBJJlF8PYZrSZWOV5+xp82ZVFWmXBkl7Fy3+j2iMEgyO7zrqEX8cdH8lsIgT6Fel7Md3Vbbo/QPJw==
X-Received: by 2002:a50:fa97:0:b0:521:8bb0:499d with SMTP id w23-20020a50fa97000000b005218bb0499dmr4232324edr.41.1689678761644;
        Tue, 18 Jul 2023 04:12:41 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7315:d100:15fd:b3ca:86:923? (dynamic-2a01-0c22-7315-d100-15fd-b3ca-0086-0923.c22.pool.telefonica.de. [2a01:c22:7315:d100:15fd:b3ca:86:923])
        by smtp.googlemail.com with ESMTPSA id v17-20020aa7d651000000b0051de3e1323dsm1044195edr.95.2023.07.18.04.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 04:12:41 -0700 (PDT)
Message-ID: <57f13ec0-b216-d5d8-363d-5b05528ec5fb@gmail.com>
Date: Tue, 18 Jul 2023 13:11:31 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH net 1/2] r8169: revert 2ab19de62d67 ("r8169: remove ASPM
 restrictions now that ASPM is disabled during NAPI poll")
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <ddadceae-19c9-81b8-47b5-a4ff85e2563a@gmail.com>
In-Reply-To: <ddadceae-19c9-81b8-47b5-a4ff85e2563a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There have been reports that on a number of systems this change breaks
network connectivity. Therefore effectively revert it. Mainly affected
seem to be systems where BIOS denies ASPM access to OS.
Due to later changes we can't do a direct revert.

Fixes: 2ab19de62d67 ("r8169: remove ASPM restrictions now that ASPM is disabled during NAPI poll")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/netdev/e47bac0d-e802-65e1-b311-6acb26d5cf10@freenet.de/T/
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217596
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/ethernet/realtek/r8169_main.c | 27 ++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index fce4a2b90..8a8b7d8a5 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -623,6 +623,7 @@ struct rtl8169_private {
 	int cfg9346_usage_count;
 
 	unsigned supports_gmii:1;
+	unsigned aspm_manageable:1;
 	dma_addr_t counters_phys_addr;
 	struct rtl8169_counters *counters;
 	struct rtl8169_tc_offsets tc_offset;
@@ -2746,7 +2747,8 @@ static void rtl_hw_aspm_clkreq_enable(struct rtl8169_private *tp, bool enable)
 	if (tp->mac_version < RTL_GIGA_MAC_VER_32)
 		return;
 
-	if (enable) {
+	/* Don't enable ASPM in the chip if OS can't control ASPM */
+	if (enable && tp->aspm_manageable) {
 		/* On these chip versions ASPM can even harm
 		 * bus communication of other PCI devices.
 		 */
@@ -5165,6 +5167,16 @@ static void rtl_init_mac_address(struct rtl8169_private *tp)
 	rtl_rar_set(tp, mac_addr);
 }
 
+/* register is set if system vendor successfully tested ASPM 1.2 */
+static bool rtl_aspm_is_safe(struct rtl8169_private *tp)
+{
+	if (tp->mac_version >= RTL_GIGA_MAC_VER_61 &&
+	    r8168_mac_ocp_read(tp, 0xc0b2) & 0xf)
+		return true;
+
+	return false;
+}
+
 static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct rtl8169_private *tp;
@@ -5234,6 +5246,19 @@ static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 				     xid);
 	tp->mac_version = chipset;
 
+	/* Disable ASPM L1 as that cause random device stop working
+	 * problems as well as full system hangs for some PCIe devices users.
+	 * Chips from RTL8168h partially have issues with L1.2, but seem
+	 * to work fine with L1 and L1.1.
+	 */
+	if (rtl_aspm_is_safe(tp))
+		rc = 0;
+	else if (tp->mac_version >= RTL_GIGA_MAC_VER_46)
+		rc = pci_disable_link_state(pdev, PCIE_LINK_STATE_L1_2);
+	else
+		rc = pci_disable_link_state(pdev, PCIE_LINK_STATE_L1);
+	tp->aspm_manageable = !rc;
+
 	tp->dash_type = rtl_check_dash(tp);
 
 	tp->cp_cmd = RTL_R16(tp, CPlusCmd) & CPCMD_MASK;
-- 
2.41.0


