Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514590;
	b=bPagzcEWdNhF+j04peHPNg0t7zqW++eECf6WBS+A+292bt/MQrb5WYs9inrfSr6swkji
	 he/iAlzu6Af6fU2z9aUlV4Q6A6I0yLRxewlhhcF6e/qjs4IfhCmg7J1oVJbAwZiqTjosf
	 2RiuhOaS9OkhWGzPsoQrYkDWU5eM6dBXOyOoS/xcJTB28jWPdw0QFNrPheu/I9hDuoC+6
	 3K/F8soleRI5qlOCjVqTCOpLzeLcfM7lZKE+wBle5I/2vFEFpnrrcsFmoHg/7N8EYdsTa
	 QHWjWYWS4bBXQfjJwsUirJeG+nHX17qz1vGsqVO2Av8vt0kHNn/gQ0z0nOjfn8imrhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CdlYPARhuT5EgLufL/ZQ6dU/20tseBOVd7fjLCxWlSo=;
	b=UC1KBEu2oQEb/NsK6I5xCh0PFlur1omAOZ1/pQRcmdud7pIMY9fgDsdSsbch4omIYk3X
	 ygsnKwkYU33OVnL8GQkhylmqVG37eCkdBpRIJFWRiyINyRYeBIN8mWBB1sUePqYKhhsNd
	 7aQbFJ0GFG97Sfo8NgFL3ojPxv9Ap9Rv0KKpcPx+LsgWDljTxEBCgk07iblKGEcp81yrH
	 flaqjdUY7Bq1lRos/Ga08YS469V0SnsGL92ih6Lbu8VScXf3ixUszd3TQ5QluFruBLu0i
	 o/oamUP6QQcvsDUnDkk7QA1v/Z2sYWeCoqEw5p/Ugez35kkJHdpjRefqZUhoOHxFf9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CHuPu3l9;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64789606A328
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 16:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64789606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CHuPu3l9
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so18454575e9.2
        for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 09:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792514589; x=1793119389; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CdlYPARhuT5EgLufL/ZQ6dU/20tseBOVd7fjLCxWlSo=;
        b=CHuPu3l9chQO+r0YDq5l9YNBhAaMWwVXKPQeKzAWmfQqiX0IrxJlRF3tdNIct1Z4h0
         m4dEKlYOHZzR1E3f+/6Qo7nK1YB5aJAinTwCbFFq0zVcTae5xLIKpJKKMsvRnGByXxtt
         fCc/B0+Ceh9qkOCjkZHGTTiKnDy9dZRaoKVqZMZOHGMbGeGelBcrOiySuC/l07WHqGJ4
         /DaDQLG3Ycc41RYfsqKsrGoENhXZutm6uiJlZRAfTVrDXPP/N+6olguuzynH0WPSZ6CH
         8gc6bkDQMlLF6pW454X0tKUxIPEYemP7nk+o/yIP6zo6UHSF2kvFljhgRyRnVbWKZ7Fc
         QITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514589; x=1793119389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CdlYPARhuT5EgLufL/ZQ6dU/20tseBOVd7fjLCxWlSo=;
        b=UGvdOa5BMQTOc5G71VPhQ0mwG98B/Sytu9DzuKTInQhyt2Vf5c+FkwU0mV3DpRPnee
         7TOamKYlIuBdQUIkhpsGMLNz6unPiBylKfCzi9y0Q5I42r0l/k/b4PNVnh19NshotQA4
         RnCkeQXRpqRg9jtwdZHJBl9xUF3sPm90n4IPbOqlpR0Lm6T//ERW4wii1bFm5CU+OMI5
         TSyYIOMsrpIUONrGlGGzqH1xucCGSHpBtwt/gkoMMicLfwR3GjSc84LbFrXHdelQD7C+
         ZXnvVA0q/bReK4rcl+45r9xRd3qs+XBsm1lNG4lyFvJlGJeSLhBZuAFOa32I6b48VSQ0
         ClVA==
X-Forwarded-Encrypted: i=1; AKwUvBxbNKkZly0Y8LqLTUNO57zy+ph5YLB5BgjG3lswNRBtDjavt8f0ZxJ94K2Wjxt4z72ZqAsWs6v0FvGmiQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJJGUZLXJsqmCVLbA/9hLc1H91ItwVgkduXcNN1hzj3EMhFiuwp
	74CHgW9NQSMDs9vg2udnr78wBP/X6gkqb0IZIORmCxR05iznQ+HVb5r7
X-Gm-Gg: AYBFou15TlDeIvijxmDRg+/CaHhwa08fEk6nTaRhqHj1MporFjVPIKzK9QFDuE0ECRn
	79QrzzvRTE2GmmrspT2CpbVi2Mzw3q2DcMAZ2rttlJu5dPBNS5RKvdphuDB/Y/0HEsgFrgeFu75
	pZWd3byt6eZRavBqlNp0Q+TuUDdiqsl86m6VNNIEHBAeTH6C25qdaZk8ehO6UWY+VePQwH9x7KW
	OG98u4zSju6Panv2SviSI7xvc5fK3Xh38nK/Vi9lrj8Mh6nJrhukahYZsIrhUxvy0R6pjcEzGtc
	cfZ3S68HsuMLqFnrXI+Pa5JCo4VL7dV4FvS5Hb2uOTBXL5Xe1qr4Trux3DjKoiGSvXnw+OpOVQr
	WMAVvHTn+Sv0guxfL35kMWOHm8m01ObddVoE51VICiTqnTA9unAtSiE5d9SvUF4RRPRapjmd3Ud
	qOMRaq81NI/IaAKEePiQDMWIV7oOvzCorai/e4VBoGmdSS1/c9CPz0TKu0ahS9WKohzNjiCMw9c
	FGdqcWrlEH90sJ1tgXeJdalcZyHykX6nrjtNsrBYBD8Z6Uzzfhjdp2CkbgQxAMX+MdKQu9PMY71
	vx3wDMmCakR+tDkpGM0IEhEXRx3Cm4lMtiU8Y5qec2+wubo4PmxLqhjY8PFTIeaUAIQQ/7uc
X-Received: by 2002:a05:600c:46cf:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4a1f8cb7ecemr44109325e9.24.1792514588519;
        Tue, 20 Oct 2026 09:43:08 -0700 (PDT)
Received: from p15v.lan ([217.169.3.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb864dacsm8742505e9.12.2026.10.20.09.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:43:08 -0700 (PDT)
From: Peter Morrow <pdmorrow@gmail.com>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	regressions@lists.linux.dev,
	Peter Morrow <pdmorrow@gmail.com>
Subject: [PATCH net] net/mlx4: always create the eth and ib auxiliary devices
Date: Tue, 20 Oct 2026 17:42:39 +0100
Message-ID: <20261020164239.3808903-1-pdmorrow@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Since commit 7d22b1cb9d84 ("mlx4: Connect the infiniband part to the
auxiliary bus"), mlx4_core creates the "ib" auxiliary device only for
an IB port or a device that advertises IBoE. Before it, each mlx4
interface was offered every device and decided in its own add callback.
mlx4_ib_add() accepted Ethernet ports without IBoE and registered them
for raw packet QPs only.

ConnectX-3 VFs on Azure have an Ethernet port and no IBoE, so since
v6.6 they get no RDMA device. DPDK's mlx4 PMD, which needs only raw
packet QPs, then cannot open them:

  net_mlx4: cannot access device, is mlx4_ib loaded?

Restore the old behaviour by creating both auxiliary devices for every
device and letting mlx4_en and mlx4_ib decide in probe, as their add
callbacks did. mlx4_ib_probe() returns -ENODEV when there are no usable
ports, and mlx4_en_probe() binds a device without Ethernet ports but
creates no netdevs, as mlx4_en_add() did.

Tested on 6.12.111 on an Azure VM with two ConnectX-3 VFs: each gets an
eth and an ib auxiliary device, and DPDK attaches both VFs and passes
traffic through them.

Fixes: 7d22b1cb9d84 ("mlx4: Connect the infiniband part to the auxiliary bus")
Closes: https://lore.kernel.org/r/20261014133951.3219055-1-pdmorrow@gmail.com
Suggested-by: Leon Romanovsky <leon@kernel.org>
Assisted-by: LLM
Signed-off-by: Peter Morrow <pdmorrow@gmail.com>
---
 drivers/net/ethernet/mellanox/mlx4/intf.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/intf.c b/drivers/net/ethernet/mellanox/mlx4/intf.c
index 82e467c..31860b4 100644
--- a/drivers/net/ethernet/mellanox/mlx4/intf.c
+++ b/drivers/net/ethernet/mellanox/mlx4/intf.c
@@ -43,23 +43,12 @@ static DEFINE_IDA(mlx4_adev_ida);
 
 static bool is_eth_supported(struct mlx4_dev *dev)
 {
-	for (int port = 1; port <= dev->caps.num_ports; port++)
-		if (dev->caps.port_type[port] == MLX4_PORT_TYPE_ETH)
-			return true;
-
-	return false;
+	return true;
 }
 
 static bool is_ib_supported(struct mlx4_dev *dev)
 {
-	for (int port = 1; port <= dev->caps.num_ports; port++)
-		if (dev->caps.port_type[port] == MLX4_PORT_TYPE_IB)
-			return true;
-
-	if (dev->caps.flags & MLX4_DEV_CAP_FLAG_IBOE)
-		return true;
-
-	return false;
+	return true;
 }
 
 static const struct mlx4_adev_device {
-- 
2.47.3

