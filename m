Received: from abi149hd125.arn1.oracleemaildelivery.com (abi149hd125.arn1.oracleemaildelivery.com [129.149.84.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475502F44
	for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 21:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-arn1-20220924;
 d=augustwikerfors.se;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=H8VUP4moo1XVYiRBDWgPNjnI1wJ8sH7VT2dNJjvItbc=;
 b=Ui1++Qndmy2QHhaV+7pzDFIxdz19lDQ0nF7u5P6pgSLjeCeOtMSqM5zkmDVx+nGlDeF+npYf/EDo
   xgYGFzn6QLN9Uq1Wq4tq3lTs2kEq+Mx+/FQbYVQf2dfTNp+YIHzEkRVetZYzd2C45mJShkP64aHZ
   m+nXLmrw32PM87K7zAMGTevje5ToT3Le5K0IsROXVJ3cIRaWduucnjS1HFVbdwONUO8KQ+/SgKBF
   3GMI3jq+fQMmcqusgZ8+9M36tASH19foDu9O9FaM/EKh0BJ6GyB7cYp7/+Lf0Ump+yCMNd3+Km4l
   QpKknvb60SIngLeqJNN+sitEX6ljptF9VjSOOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-arn-20211201;
 d=arn1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=H8VUP4moo1XVYiRBDWgPNjnI1wJ8sH7VT2dNJjvItbc=;
 b=JSopP8Ez2n2cBaDICKbnGcBItDOAOI+phWUeuAV0HdXGhhtiUckXkRMBX8+Tp742pFsMlPFs0a6X
   KCRYseziCIFozk1feU7wnNam+wtVNkp0uohT8J/HTzx0vHn3jmh+yVqLITNyCiKrzbhnwaAw0SYl
   Q8+LbOEp6XhNtvmgr1ZUyeXC/wH0WCGjK0wCO/yW7TNz5TRfPkFRE0dUuV9ivVFsA1gVCy0w1h7Q
   Izvye0882rP14tePg/LIFYNTnLKTpW1F7PQWZ9mmknwvUPMJLf6p82ZjLjYL7nQsE1b6TgS7uN8/
   9nOrVLuLO9hCvnWz/+9bOJ7Gf36foUXrqEFWgA==
Received: by omta-ad1-fd1-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230808 64bit (built Aug  8
 2023))
 with ESMTPS id <0S0U005O7BY4GX50@omta-ad1-fd1-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com>
 for regressions@lists.linux.dev; Mon, 11 Sep 2023 21:34:52 +0000 (GMT)
From: August Wikerfors <git@augustwikerfors.se>
To: Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,	regressions@lists.linux.dev,
	August Wikerfors <git@augustwikerfors.se>
Subject: [PATCH] ASoC: amd: yc: Fix non-functional mic on Lenovo 82QF and 82UG
Date: Mon, 11 Sep 2023 23:34:09 +0200
Message-id: <20230911213409.6106-1-git@augustwikerfors.se>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-version: 1.0
Content-transfer-encoding: 8bit
Reporting-Meta:
 AAFMhxbHdTEVooZy00RNFw7yNWnRQQsRpdo9xMUMs12GakU/CcQg5lXkTxfeIA1j
 UFC2bx3C9ai1vUeHgw7HlDUTwUvNnakXPNuF1hEYN/k4aOME0lIc56ccc1MVLSZu
 C7ouYwEPFhqm8fVBm5/fO5ONV5U8AcjbcfuNgj9X9c4zZub3MqsXNF4rb3qjnaL+
 DUu8u9jjDdEu7kAf0kbgNh1j2kgMRHcceTzU6eGrY+GzsJsWw3wD5a2dgl3TwxxT
 73zGt7IPCHfDWD+Bm08dAR9XmzUoCaUYHQfE/AqvQdHYvOiUN2+kHdZSR3cw6GNs
 O1lFNVn6qisO8y3Ez5dEL6qw9J7LyTSgxn99azYGO7xb9vt5tuWaXMN29ATkX3Zp
 7FP1EpKYyuHzOkMzXMotEvuTfFRYxpD2SN9OrHBrEx4Kg4ytpGlZbLUCpBZZVysx +AhWrSM=

Like the Lenovo 82TL and 82V2, the Lenovo 82QF (Yoga 7 14ARB7) and 82UG
(Legion S7 16ARHA7) both need a quirk entry for the internal microphone to
function. Commit c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on
Lenovo 82SJ") restricted the quirk that previously matched "82" to "82V2",
breaking microphone functionality on these devices. Fix this by adding
specific quirks for these models, as was done for the Lenovo 82TL.

Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on Lenovo 82SJ")
Closes: https://github.com/tomsom/yoga-linux/issues/51
Link: https://bugzilla.kernel.org/show_bug.cgi?id=208555#c780
Cc: stable@vger.kernel.org
Signed-off-by: August Wikerfors <git@augustwikerfors.se>
---
 sound/soc/amd/yc/acp6x-mach.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 59aa2e9d3a79..94e9eb8e73f2 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -213,6 +213,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
@@ -220,6 +227,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "82TL"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82UG"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.42.0

