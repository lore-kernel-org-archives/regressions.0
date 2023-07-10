Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [195.201.174.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342FC156D6
	for <regressions@lists.linux.dev>; Mon, 10 Jul 2023 21:16:44 +0000 (UTC)
Received: from leda.eworm.de (p5085aabd.dip0.t-ipconnect.de [80.133.170.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id EA99B23645A;
	Mon, 10 Jul 2023 23:16:42 +0200 (CEST)
Received: by leda.eworm.de (Postfix, from userid 1000)
	id 58C2C1831DF; Mon, 10 Jul 2023 23:16:42 +0200 (CEST)
From: Christian Hesse <mail@eworm.de>
To: linux-integrity@vger.kernel.org
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Peter Huewe <peterhuewe@gmx.de>,
	Christian Hesse <mail@eworm.de>,
	stable@vger.kernel.org,
	roubro1991@gmail.com
Subject: [PATCH v3 1/2] tpm/tpm_tis: Disable interrupts for Framework Laptop Intel 12th gen
Date: Mon, 10 Jul 2023 23:16:09 +0200
Message-ID: <20230710211635.4735-1-mail@eworm.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710231315.4ef54679@leda.eworm.net>
References: <20230710231315.4ef54679@leda.eworm.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This device suffer an irq storm, so add it in tpm_tis_dmi_table to
force polling.

Link: https://community.frame.work/t/boot-and-shutdown-hangs-with-arch-linux-kernel-6-4-1-mainline-and-arch/33118
Fixes: e644b2f498d2 ("tpm, tpm_tis: Enable interrupt test")
Cc: stable@vger.kernel.org
Reported-by: <roubro1991@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217631
Signed-off-by: Christian Hesse <mail@eworm.de>
---
 drivers/char/tpm/tpm_tis.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
index 7db3593941ea..52bb8b642207 100644
--- a/drivers/char/tpm/tpm_tis.c
+++ b/drivers/char/tpm/tpm_tis.c
@@ -114,6 +114,14 @@ static int tpm_tis_disable_irq(const struct dmi_system_id *d)
 }
 
 static const struct dmi_system_id tpm_tis_dmi_table[] = {
+	{
+		.callback = tpm_tis_disable_irq,
+		.ident = "Framework Laptop (12th Gen Intel Core)",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Laptop (12th Gen Intel Core)"),
+		},
+	},
 	{
 		.callback = tpm_tis_disable_irq,
 		.ident = "ThinkPad T490s",
-- 
2.41.0

