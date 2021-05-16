Received: from mail-m17638.qiye.163.com (mail-m17638.qiye.163.com [59.111.176.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182AE72;
	Sun, 16 May 2021 16:42:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [58.199.17.113])
	by mail-m17638.qiye.163.com (Hmail) with ESMTPA id 934D61C045B;
	Mon, 17 May 2021 00:35:36 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: maxime@cerno.tech
Cc: amadeus@jmu.edu.cn,
	devicetree@vger.kernel.org,
	jernej.skrabec@siol.net,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	lkft-triage@lists.linaro.org,
	naresh.kamboju@linaro.org,
	regressions@lists.linux.dev,
	robh+dt@kernel.org,
	wens@csie.org
Subject: [PATCH v2 2/2] dt-bindings: arm: Add NanoPi R1S H5
Date: Mon, 17 May 2021 00:35:23 +0800
Message-Id: <20210516163523.9484-3-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210516163523.9484-1-amadeus@jmu.edu.cn>
References: <20210511081823.mmcrliomwtetcirx@gilmour>
 <20210516163523.9484-1-amadeus@jmu.edu.cn>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
	oVCBIfWUFZQhpOS1YfShoeSU4ZTE4dH01VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
	hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nio6Czo*Fz8LETZWTQoiA0IY
	FCswFAJVSlVKTUlKSkNJQkhMSkhCVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWU5D
	VUpCQlVKTFVKSkhZV1kIAVlBSUlJTTcG
X-HM-Tid: 0a7976087722d993kuws934d61c045b
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>

Add the bindings for NanoPi R1S H5 board.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index ec8108483b49..889128acf49a 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -275,6 +275,11 @@ properties:
           - const: friendlyarm,nanopi-r1
           - const: allwinner,sun8i-h3
 
+      - description: FriendlyARM NanoPi R1S H5
+        items:
+          - const: friendlyarm,nanopi-r1s-h5
+          - const: allwinner,sun50i-h5
+
       - description: FriendlyARM ZeroPi
         items:
           - const: friendlyarm,zeropi
-- 
2.17.1

