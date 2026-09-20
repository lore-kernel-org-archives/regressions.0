Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E37314A60
	for <regressions@lists.linux.dev>; Sun, 20 Sep 2026 14:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789913811; cv=none; b=dilQE95hH6xeBCVrqNh+pK1d+2tJr2q3sJfOHvJy6n9069HGm9VJdl5JvBYzKMA+v5aDSQYUE1+jCX76asHkeC9hea/AmbFguTxMSzdK2XoiY0NQ/AnkUfNB3AdrX+GqQbNJyhf6uRrn5XuZgg5nsbqJS6sEF0XzkCRYBH4nL0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789913811; c=relaxed/simple;
	bh=5DeYmzlnwT2z51UpzgNPb7SeYRTZgxP3p7dZf7uEy/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRCv1vBRXqErA7sOsI9GmA4sjqTa9j8Y/Wh33aT5SgJIAvMyPvPxcHmAHW8vrJJMVj/pTM/I2DB6/bN/2n8w6H9/s+F1eQ3GODIL5YHTUMIuHMdOo1xevK7Q8Mz8l6NcSzAZJUX/Wmk+moCC9hp9H7ZTyiYXWSVLc6Db39b07c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=UZiKBcMv; arc=none smtp.client-ip=188.68.63.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="UZiKBcMv"
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4hnpLh1PKqz8d26;
	Sun, 20 Sep 2026 14:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789913772;
	bh=5DeYmzlnwT2z51UpzgNPb7SeYRTZgxP3p7dZf7uEy/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UZiKBcMvn2LyFdcpTn4xdID8QoAMN/hERh90Ct/VurIIIhEuz7C9fTw228RUPguLC
	 /E+BzaUMOQpKza033lc3n5NFBXQQyT1jeXLP8dbu++u14cQu5mUbBu4YCjLwQjymIH
	 9N+hNNJMDQvCqolhcitUf3RhJYWyIt4hvgJQIO2r7+EqcHoK4reAyGImkJ0Stgxx3r
	 mkoLDisurcbnhxFidTe24vqS3QOftEDXv/cHPm3TytGMjRzlk25619XlnCR9Yl7fuR
	 3q10kEyddXk1b7+R+oCLlHI7MejYte3gWl/ZWT9JuJtjfns9PP1/QIojRweAlsWHtC
	 3VCCwCG4CguEg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4hnpLg4LH2z8hFF;
	Sun, 20 Sep 2026 14:16:11 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hnpLg0xpVz8svY;
	Sun, 20 Sep 2026 16:16:10 +0200 (CEST)
Received: from luggage.fritz.box (unknown [IPv6:2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 7D0355F99A;
	Sun, 20 Sep 2026 16:16:10 +0200 (CEST)
Authentication-Results: mxe9fb;
	spf=pass (sender IP is 2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160) smtp.mailfrom=linux@leemhuis.info smtp.helo=luggage.fritz.box
Received-SPF: pass (mxe9fb: connection is authenticated)
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] net: qrtr: resend HELLO on MHI resume
Date: Sun, 20 Sep 2026 16:16:08 +0200
Message-ID: <20260920141608.2977460-1-linux@leemhuis.info>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <1f3e8e4b-2060-4edc-aa58-d2b7a68280ca@leemhuis.info>
References: <1f3e8e4b-2060-4edc-aa58-d2b7a68280ca@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <178991377074.1607990.16289536906234889544@mxe9fb.netcup.net>
X-NC-CID: V/XsRjUAGwpe9ESqAqbysvjMrAcUgMg/ioQsFIXFiO/pkwFwkAA=

From: Daniel J Blueman <daniel@quora.org>

Since the MHI HELLO exchange was relocated, it is sent only at device
registration. During a suspend-resume cycle, the firmware in WiFi
cards such as WCN7850 indefinitely waits for another HELLO,
triggering:

  ath12k_wifi7_pci 0004:01:00.0: timeout while waiting for restart complete
  ath12k_wifi7_pci 0004:01:00.0: failed to resume core: -110

Fix this by triggering the handshake from resume_early in the MHI
transport.

Validated on Qualcomm X1E-801800 on Lenovo Slim 7x across 10
suspend-resume cycles.

Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
Signed-off-by: Daniel J Blueman <daniel@quora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reported-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Link: https://lore.kernel.org/all/6257c447-788d-4362-851e-0d552bcf7c56@oss.qualcomm.com/
Tested-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Reported-by: Vlastimil Babka (SUSE) <vbabka@suse.com>
Link: https://lore.kernel.org/all/ab1491bb-cca5-4145-ac7d-31c966abf7b4@suse.com/
Tested-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Reported-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/all/87a4plsg4w.wl-tiwai@suse.de/
Tested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---

Hi Linus, as mentioned earlier in this thread, would be great if you
could merge this directly to fix an annoying regression. Ciao, THorsteh

---
 net/qrtr/af_qrtr.c | 13 +++++++++++++
 net/qrtr/mhi.c     |  9 ++++++++-
 net/qrtr/qrtr.h    |  2 ++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git net/qrtr/af_qrtr.c net/qrtr/af_qrtr.c
index 78347c937af76b..e7b3647424b8f1 100644
--- net/qrtr/af_qrtr.c
+++ net/qrtr/af_qrtr.c
@@ -623,6 +623,19 @@ static void qrtr_hello_work(struct work_struct *work)
 	qrtr_port_put(ctrl);
 }
 
+/* Trigger the HELLO handshake after the remote has been reset, eg on resume */
+void qrtr_endpoint_hello(struct qrtr_endpoint *ep)
+{
+	struct qrtr_node *node = ep->node;
+
+	mutex_lock(&node->ep_lock);
+	node->hello_sent = false;
+	mutex_unlock(&node->ep_lock);
+
+	schedule_delayed_work(&node->say_hello, 0);
+}
+EXPORT_SYMBOL_GPL(qrtr_endpoint_hello);
+
 /**
  * qrtr_endpoint_register() - register a new endpoint
  * @ep: endpoint to register
diff --git net/qrtr/mhi.c net/qrtr/mhi.c
index 3990da1a65dc4f..e9a4bb92ce76ff 100644
--- net/qrtr/mhi.c
+++ net/qrtr/mhi.c
@@ -183,6 +183,7 @@ static int __maybe_unused qcom_mhi_qrtr_pm_suspend_late(struct device *dev)
 static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
 {
 	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
+	struct qrtr_mhi_dev *qdev = dev_get_drvdata(dev);
 	enum mhi_state state;
 	int rc;
 
@@ -201,7 +202,13 @@ static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
 		return rc;
 	}
 
-	return qcom_mhi_qrtr_queue_dl_buffers(mhi_dev);
+	rc = qcom_mhi_qrtr_queue_dl_buffers(mhi_dev);
+	if (rc)
+		return rc;
+
+	qrtr_endpoint_hello(&qdev->ep);
+
+	return 0;
 }
 
 static const struct dev_pm_ops qcom_mhi_qrtr_pm_ops = {
diff --git net/qrtr/qrtr.h net/qrtr/qrtr.h
index 3f2d28696062a5..de2de69a619936 100644
--- net/qrtr/qrtr.h
+++ net/qrtr/qrtr.h
@@ -27,6 +27,8 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid);
 
 void qrtr_endpoint_unregister(struct qrtr_endpoint *ep);
 
+void qrtr_endpoint_hello(struct qrtr_endpoint *ep);
+
 int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len);
 
 int qrtr_ns_init(void);

base-commit: 5dd1818b15d98d4a20806cd00b1b40320b06004f
-- 
2.55.0

