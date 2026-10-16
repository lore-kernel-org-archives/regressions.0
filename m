Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DD34A49A5
	for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 12:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154769; cv=none; b=pV2mg+gGPRJj3htYFND8ZCIhcdd0lDuTJQsUW3egX3JhyC2KsmsueycYGqEbQBaR4OGga+WZLwCijIwdmbkxhwOJIJBiQcNxR782NQO1Irq7/Ty0/NwGjfzv5/glVPk9vhalFCn6w3ZJdqvkn01S7WTuhT+WVBBNUmApJUpObJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154769; c=relaxed/simple;
	bh=lKAkidrvbBJ/vTXYNpqVpCG9VNbWjHMk4s8lEayu9QY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B8hZ+Qb8vjovJ4P3+9oZr2QMY46vKw+Wgq0MyYOT2lEBo8suGZ6wg6dU/UdYhbe5KNLA8rBkCvBlnX4/Hvi4KkXfym6C2HOudiQkMXHnqx8C2O8FVdpmerDVXS62hj9/mNxC6TihhWpKzLL+3pe9yRspb55AWd9oXdYxIrgz0rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUE7SVbh; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUE7SVbh"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38759bcd877so4035951a91.2
        for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 05:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792154767; x=1792759567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TrslgNHse2Dg20EAEUVpp54Hl92z5vT+wdBvkKVG3Qo=;
        b=TUE7SVbhtGI5uMvKrxVtZuxD3vPkGf/E2rQpnr1BQS+kLCKz0pbf/q+E5ji+6AqUX9
         /GgOCPRRUkaTqUOlvsglqsxeGvzrUP0y2V0t+sKh34y5N1I3j0h+Ldsh2BhxwEZykVNk
         ZY/qf/n0E4ARIdcmmGNoRmEGzjAeZa0Cks4ESZi+yQFM0HZpI6gKHGcQKlbQermiy/aF
         5bUHT6hm7vqgnSD4Bdy9L4E8MjHLGqB/Cz6LQ3LrwSVq7wxFPP1GmPCn2j6p6rYeFM6m
         NL1oKZLHHBF3rtPZPJIXYKE84+4/n7fFxE+xXJeHn5nmbXG+JlyEeQx9loCcDff/3dao
         7cSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154767; x=1792759567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TrslgNHse2Dg20EAEUVpp54Hl92z5vT+wdBvkKVG3Qo=;
        b=XXd8iaAjiSNm6sZsFimO/h+qNIBDeLIpS9ToO/WDdFUouK44tiUM0aTXIidGphb/6m
         JBWPnCykGo6pAhZBxyeTAuUnse6zOGALzIMOOto0YEmfrE6/rdTOMQbkpCmE2Kh7NBge
         aYnjlw3MCid3AjV7ChaDnUp9fgSKs3DszsLIjRvA0Y4FP8x1x6oXP3y5wQfD2aRX2uTx
         9aGpFAvX2BIhI5w5lzAaSoEBRAxWyaSlLkWHc2VHH+SGHy7LYe2qFjxdBDjtFlgMH9lE
         JuQkAVNNSamoi9gD0T762X5ZzIhI4QDj8HVmZhWub4/Jy+B6OND6zH/AdCIwpG/MWSer
         5nNA==
X-Forwarded-Encrypted: i=1; AKwUvBwwDqP9jXFONRqLZEcSEEdSoTC6g0j2+Xv2J6qu5S1+luuFIKqX3Uy3EtRLWQfBshpsux2617fyu/CWRA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLUA9tec6Og/VtrG8os0zEjK9ZvEtsZLS+09h+rfbskp3j79jox
	h0EqL5HWQxtlCSXFkuP/2smyijIFfoDQCh9BUQG6SDsK139MFXlhNNHM
X-Gm-Gg: AYBFou1PnRkSWUTwJLgqSoMpMMHL2J4BHSmCZmK7Q+ATXrtfhTS3+Y1F/YtKvmV+kjB
	ymLaBYOU9hp9iQ99Gt5ndcA/K3Gog4+PrgoP1rM7LFsowVGIpi1Ttc3eshIIqJrReOX/HMdI0zt
	z8HIndSKJk/cci6LTK9SIBN3V2f5jE7DlCVZwa8lF/jjLlOlb8JVf31tMrRek/TmTDrza1ao0DQ
	wrEIwUa7p5tISsf69ob/fWVWaW+OWvj0ayBlYq50eGvFPfOAHfwI/f+uigYATS0O+LWaVNjVCqi
	cY1/GnDQglWY6ChXGOWPrexS5CRl4Jqr1MorvBbEVli3Rm3C4IuaOCPRhUtFls72dfNxWTazsQ/
	4h0RokN0ZPXmIYkaUCMJq/Ghca5wdQiG6cjVktZcW2nUfuAyfpZmMXe5sF4G4FZJJWERhIIEHJ7
	M1TQP2nIw8sW/arpvUqiSQZrQn7vIHkoYxGiH0lK7uFJ+dYjtXF6w6e95UP/HgttqMz+ce3F4Ff
	/AGkWxiNze2YQ==
X-Received: by 2002:a17:90a:d604:b0:3ac:8af9:4a6a with SMTP id 98e67ed59e1d1-3ac8af94f17mr5664608a91.42.1792154767359;
        Fri, 16 Oct 2026 05:46:07 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ace34c8d9asm753751a91.5.2026.10.16.05.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:46:06 -0700 (PDT)
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
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH net] net: qrtr: ns: retry service announcements on -EAGAIN
Date: Fri, 16 Oct 2026 21:45:59 +0900
Message-ID: <20261016124600.31-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint
register"), qrtr_node_enqueue() returns -EAGAIN for every packet but
HELLO until our HELLO has gone out to the node. The HELLO is retried,
but the NEW_SERVER announcements sent in reply to the remote's HELLO
are not, so a service registered before the remote came up is never
announced to it.

On Kaanapali the modem sends its HELLO before it accepts ours. With
rmtfs started first, the modem never learns about rmtfs and its
watchdog resets the SoC about 40 s later.

Retry each announcement for up to 10 s while it fails with -EAGAIN.
announce_servers() runs from the name service worker, which can sleep.

Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
Cc: stable@vger.kernel.org
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Tested on a Lenovo Legion Tab Y700 Gen 5 (out-of-tree board support)
with rmtfs started before the modem: without this patch the SoC resets;
with it the announcement goes out on the first retry and the modem
stays up. Starting rmtfs after the modem avoids the problem, but
distribution units start rmtfs first and let it boot the modem.

 net/qrtr/ns.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index bcb090ee79d4..33a9c4449d6f 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2020, Linaro Ltd.
  */
 
+#include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/qrtr.h>
 #include <linux/workqueue.h>
@@ -226,7 +227,13 @@ static int announce_servers(struct sockaddr_qrtr *sq)
 
 	/* Announce the list of servers registered in this node */
 	xa_for_each(&node->servers, index, srv) {
+		unsigned long timeout = jiffies + 10 * HZ;
+
 		ret = service_announce_new(sq, srv);
+		while (ret == -EAGAIN && time_before(jiffies, timeout)) {
+			msleep(100);
+			ret = service_announce_new(sq, srv);
+		}
 		if (ret < 0) {
 			if (ret == -ENODEV)
 				continue;
-- 
2.43.0

