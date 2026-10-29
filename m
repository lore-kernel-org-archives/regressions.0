Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271108;
	b=lSTfFrSHi/EA9L0ob/D/fmOr8pSYqQTXmSB5X2FQIxGLoA9VfUw7ZuQA48s8bUVGil+6
	 jbeJg7m2FbF+fMzE1+g5S6H+Wx9In/riSb4MxwFkTHQLjRBiJcunHh8mRodL+i9ZIT6Le
	 1LngkPOsDzjVyuFLX86WQAV6GlreyK8Ed9TbIoj7hYdUTJp+z8lCgCI9/5NMCL+1D2Pu/
	 5sdD/YBUE3RSPYvCGwwF0DIatpe1Vtz9PBGG6vIShwVAN2B22HJ94EhyIdj0/zl7lZFWf
	 zQYMgKyiLe2lWfYfd3L5rkJtrZu38nEeznpW6vw8cwPsdJTdGNUXzTFDCXbQoddCUSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mP84m2R3RTnJmL7bh8t5NoWh+UIYojXhPPzkKJZg4tI=;
	b=XOOWIMY5Jo2YDE3j24xJKmjNhytAl4kGYqLtz1iworTSeRlBenpOuSu7fms6vtfdVwqZ
	 gjKhJ7dnMtn3v1WYsbarDx8boS2qEDJ42GiwpPkECd41DsztoJA23NQTz9yFW76PtZJHD
	 m3vdg28X381CWVf20pehA/d770kWv4bTIwGeAbG4C4fXAoT3C5Aq0Sw8Sy+jtO3HtccKX
	 uFdizTNNaIyqU1G2EHuU8fXpEGbqFEpMoF0Du54OEXttaBafRCXOG2vKvoMQLZWrT55dx
	 tZxHY7YPGDHutgEBSe6GqwUHfirfEOmVkYyv5BJppJgxzuue7nxWRvA8C4B3HgtziUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dt8DwZpn;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D904C606A31C
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 10:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D904C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dt8DwZpn
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1846bc43c28so2278658c88.0
        for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 03:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271107; x=1793875907; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mP84m2R3RTnJmL7bh8t5NoWh+UIYojXhPPzkKJZg4tI=;
        b=Dt8DwZpndqnJ62XAeWq+Sv3Vaj3dFDhDNVtIuG3Q68WFwzRXRCCpc10yQfdG4dbK28
         v8fXqmcQwYWBK/nFd9+5VqRiuNfYx0HWM0qizOggq/GgIBiQW7w3ABx6UiMvutGLe7oH
         8n1CwfiajXlWFvX77nub4YrDC4jRnuwPvyN0uRgvZFnAHPRXvME7C56dcjCh19+LRsCr
         kC9Q7XSTyQ8Qp69BUQs7SMBxzgdjEqU5kFrQalGZYlWvjFw50Ug4XlaxQakCYJWr0SDo
         lOJDRq5E85sarNhzGwdDwZeqdgrzNeJByWoU3Qfuyn/A27vRpcbzLBP1ksqIGfFMtK2k
         vO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271107; x=1793875907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mP84m2R3RTnJmL7bh8t5NoWh+UIYojXhPPzkKJZg4tI=;
        b=pwqmnmVL6zlElV6kgKIRV9oBUzMKWlU2wPcMawviA+Xfm/WMtRSPz5kakwbnmow7DH
         8+zudlxyZQc9vF0PDYM1MuWo3HTo+CMeg/YVEyfoVfWIVHQBJ593tAMxNDiztGjQAqhw
         /RcjVdUj0Gsf2PRo8yUp7a+ZPtp5lH1jyLFyG0f3kNXnkKjB38EZfJGPHdAKdVMsGbGj
         D/UlB35wTgF96fVugqQjQbYRKk4uY7lHTwvaBxrbITchvy9652SUZEaiFyLZt60pBLka
         oOzGnYIWXPYDz0YTvoK2guzia91Jegv1McTEnyHMSMFjQr3jbZbV/pVgQeIFfMiXyHM3
         AKAw==
X-Forwarded-Encrypted: i=1; AKwUvBz48jbWPpaj4sgG/u/XQmzUxdywrvIXTgUmF8sWBF5fLb89RQIkyeyzxc3YAoUhMt2AefSzxMOxXVt6GA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIIjbFQjudSZ2DKqyeY0HK+vt/doVPUN5zgXvYHmennZwH69r3n
	ntrOfXFlQxWi/8dpC81adxKYZwciu0BnnC+9Aq7vjAiBeaKZiRfZm3tN
X-Gm-Gg: AYBFou1VcPIMKYuzefrGKRt68er1c8NIptqmDrEIgpT/zQLXuprqGsRfLj6+GzqUzmT
	bWZNKo/XyIm6WR1/EhC37dUbkUXzdN+Gt/4hgsKZ/ce3Xcy1wgITiVyolEQyQO+qDvpfQbwFilU
	ZG3CvmbK6gxDzb8g9HfAifKafA3Bpx908G3sQ+bZyL/iFsLcI1d1MKJyheotcKOwIKk7SFSaAhn
	GF9U1NVY4GLGmrm7g83gMe8ahEy8tBKZCS8T0l6/On9hxO+p7yPjWroAismfGGgn43xs1tVuixz
	bkx7l5d/gdVRGFbTKCbH7SRJPQk8AR1KsbPXmO1jFFLrs/KfoZ/3I8sQESt0QkC0wkFlpz08xMB
	Vkua4jQyl5NdrAEaPj6JP2qHyYMIf8b9Rw5FfRUmrPxpVE1tk8KLEPaV3Q9ticD7lV+RD5+qYoA
	cV0c4iis2hls9j3MuhEpf+J0S4TkDbhwZSkG79axvfp2bT26EKL4Rpx0vtmUlXk11NigkbfDGxK
	kbdkbu2OfcfLiQVLazrMFBkYvBddBf4JAbjZ2Jts+AQNpZGMtsZaVZrR6r2lm0sa05okJ0IG1/2
	SgPy0eW5fgqiDKxbFPkSFVrfqGJJ0SsKvsEi0YgGzIlF
X-Received: by 2002:a05:701b:2311:b0:16a:f5cd:365 with SMTP id a92af1059eb24-1a6c7d2be52mr5911291c88.5.1793271106955;
        Thu, 29 Oct 2026 03:51:46 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a7549528ebsm12858707c88.0.2026.10.29.03.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:51:46 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: mani@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	effeffe99@gmail.com,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH net v3] net: qrtr: announce local services again once our HELLO is sent
Date: Thu, 29 Oct 2026 19:51:42 +0900
Message-ID: <20261029105142.2503-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint
register"), qrtr_node_enqueue() drops every packet but HELLO with
-EAGAIN until our HELLO has gone out to the node. When the remote's
HELLO arrives first, the NEW_SERVER replies from the name service are
dropped, and so are the broadcasts for services registered before our
HELLO goes out. Nothing announces these services again, so the remote
never learns about them.

On Kaanapali the modem sends its HELLO before it accepts ours. With
rmtfs started first, the modem never learns about rmtfs and its
watchdog resets the SoC about 40 s later.

Remember that the remote has sent a HELLO. Once our HELLO has been
sent to such a node, pass a HELLO from it to the local name service
again, so that it announces the services it has at that point. Retry
the replay if it cannot be queued, and queue it under ep_lock only
while the endpoint is registered, so that it cannot follow the BYE
from qrtr_endpoint_unregister().

The flag is not cleared when qrtr_endpoint_hello() restarts the
handshake on resume, so a HELLO that the remote sent before then is
not lost. The cost is that the remote gets the same NEW_SERVER
announcements twice when its HELLO arrives before ours goes out but
the name service handles it after, and on every resume.

Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
Cc: stable@vger.kernel.org
Tested-by: Filippo Falezza <effeffe99@gmail.com> # Motorola Moto G 5G Plus nairo (SM7250)
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Changes in v3:
- Retry the replayed HELLO if it cannot be allocated or queued, without
  sending our HELLO again [Mani, Sashiko]
- Queue the replayed HELLO under ep_lock only while node->ep is set, so
  that it is ordered before the BYE from qrtr_endpoint_unregister()
  [Sashiko]
- Keep Filippo's Tested-by from v2: when nothing fails, v3 only adds the
  ep_lock around queueing the replay
- v2: https://lore.kernel.org/all/20261022163116.1042-1-26rote@gmail.com/

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali; out-of-tree board
support) with rmtfs started before the modem: the replayed HELLO
follows the modem's, rmtfs gets the modem_fs1/2 opens and the modem
stays up, also with an error injected into the first replay, which is
then retried.

 net/qrtr/af_qrtr.c | 53 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index e7b364742..45cb8e8c3 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -122,6 +122,7 @@ static DEFINE_XARRAY_ALLOC(qrtr_ports);
  * @qrtr_tx_flow: xarray of qrtr_tx_flow, keyed by node << 32 | port
  * @qrtr_tx_lock: lock for qrtr_tx_flow inserts
  * @hello_sent: hello packet send successful
+ * @hello_rcvd: remote has sent a hello packet
  * @rx_queue: receive queue
  * @item: list item for broadcast list
  * @say_hello: delayed work for sending hello packet
@@ -136,6 +137,7 @@ struct qrtr_node {
 	struct mutex qrtr_tx_lock; /* for qrtr_tx_flow */
 
 	bool hello_sent;
+	bool hello_rcvd;
 
 	struct sk_buff_head rx_queue;
 	struct list_head item;
@@ -541,6 +543,11 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 		qrtr_node_assign(node, le32_to_cpu(pkt->server.node));
 	}
 
+	if (cb->type == QRTR_TYPE_HELLO) {
+		/* Pairs with smp_load_acquire() in qrtr_hello_work() */
+		smp_store_release(&node->hello_rcvd, true);
+	}
+
 	if (cb->type == QRTR_TYPE_RESUME_TX) {
 		qrtr_tx_resume(node, skb);
 	} else {
@@ -599,6 +606,8 @@ static void qrtr_hello_work(struct work_struct *work)
 	struct qrtr_node *node;
 	struct qrtr_sock *ctrl;
 	struct sk_buff *skb;
+	bool hello_sent;
+	int rc = 0;
 
 	node = container_of(to_delayed_work(work), struct qrtr_node, say_hello);
 
@@ -609,17 +618,45 @@ static void qrtr_hello_work(struct work_struct *work)
 		return;
 	}
 
-	skb = qrtr_alloc_ctrl_packet(&pkt, GFP_KERNEL);
-	if (!skb) {
-		qrtr_port_put(ctrl);
-		schedule_delayed_work(&node->say_hello, msecs_to_jiffies(100));
-		return;
+	mutex_lock(&node->ep_lock);
+	hello_sent = node->hello_sent;
+	mutex_unlock(&node->ep_lock);
+
+	from.sq_node = qrtr_local_nid;
+	if (!hello_sent) {
+		skb = qrtr_alloc_ctrl_packet(&pkt, GFP_KERNEL);
+		if (!skb)
+			goto retry;
+
+		pkt->cmd = cpu_to_le32(QRTR_TYPE_HELLO);
+		to.sq_node = node->nid;
+		if (qrtr_node_enqueue(node, skb, QRTR_TYPE_HELLO, &from, &to))
+			goto out;
 	}
 
+	/* Pairs with smp_store_release() in qrtr_endpoint_post() */
+	if (!smp_load_acquire(&node->hello_rcvd))
+		goto out;
+
+	skb = qrtr_alloc_ctrl_packet(&pkt, GFP_KERNEL);
+	if (!skb)
+		goto retry;
+
 	pkt->cmd = cpu_to_le32(QRTR_TYPE_HELLO);
-	from.sq_node = qrtr_local_nid;
-	to.sq_node = node->nid;
-	qrtr_node_enqueue(node, skb, QRTR_TYPE_HELLO, &from, &to);
+	to.sq_node = READ_ONCE(node->nid);
+
+	mutex_lock(&node->ep_lock);
+	if (node->ep)
+		rc = qrtr_local_enqueue(NULL, skb, QRTR_TYPE_HELLO, &to, &from);
+	else
+		kfree_skb(skb);
+	mutex_unlock(&node->ep_lock);
+	if (!rc)
+		goto out;
+
+retry:
+	schedule_delayed_work(&node->say_hello, msecs_to_jiffies(100));
+out:
 	qrtr_port_put(ctrl);
 }
 

base-commit: abeacca61eea4f6803df4a595b656ea45c2d3249
-- 
2.43.0

