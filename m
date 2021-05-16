Received: from mail-m17638.qiye.163.com (mail-m17638.qiye.163.com [59.111.176.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A73F2FB5;
	Sun, 16 May 2021 16:42:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [58.199.17.113])
	by mail-m17638.qiye.163.com (Hmail) with ESMTPA id F33BF1C0456;
	Mon, 17 May 2021 00:35:34 +0800 (CST)
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
Subject: [PATCH v2 0/2] Add support for NanoPi R1S H5
Date: Mon, 17 May 2021 00:35:21 +0800
Message-Id: <20210516163523.9484-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210511081823.mmcrliomwtetcirx@gilmour>
References: <20210511081823.mmcrliomwtetcirx@gilmour>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
	oVCBIfWUFZQx8ZGFZDSkxDSxhISUpOHhlVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
	hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OjI6AQw5Cj8KMzYLCAlCAwwY
	EggwCglVSlVKTUlKSkNJQkhOTUtOVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWU5D
	VUpCQlVKTFVKSkhZV1kIAVlBSkNPSTcG
X-HM-Tid: 0a79760870eed993kuwsf33bf1c0456
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>

I'm very sorry for the compilation error caused by the patches I sent
before, now fixed it.

Changes from v2:
* Added missing header file in the dts.
* Collected acked-by.

Chukun Pan (2):
  arm64: dts: allwinner: h5: Add NanoPi R1S H5 support
  dt-bindings: arm: Add NanoPi R1S H5

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts | 195 ++++++++++++++++++
 3 files changed, 201 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts

-- 
2.17.1

