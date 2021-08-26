Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F12B3FCB
	for <regressions@lists.linux.dev>; Thu, 26 Aug 2021 15:25:14 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id q14so5710578wrp.3
        for <regressions@lists.linux.dev>; Thu, 26 Aug 2021 08:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=U0QqVHJil6l5G4MYVgLkmExnYXL2IJoOnCLaNmNVQZ4=;
        b=YrLaZGkZomL/VSUIB7k1uAoRcfuyNKijVQMEVfIkyLwLKsJ7OoEgXUUwhmAdOsGocG
         mGmJx3NbIIXqCrQGRljw64436tbdrUm4rvu0CoFFen5jpgl7EpofhsO63PJ/wlPptUwN
         +mp8oWVWvtOD69snQtOHyVJVqWQk0v2M9GklYJXZ4Rhbkj97WCDNEPNhOHBNdbrfc1IQ
         LYOroLdqo+nwZlDg9axMJuehHk7g2604sMuvagEjPp23LyQwAmBjKQ4sisW36t7B1stI
         Qm4npQuOBOptI1rXsPhWCW0QLJzDgFnRSrXKsf32dqgzcz+BPFq5Bzr0acXB/TMjr/Ad
         LCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=U0QqVHJil6l5G4MYVgLkmExnYXL2IJoOnCLaNmNVQZ4=;
        b=t6O4AO8HD8bIH05wF9QBihVCHGdZ0VCve9ojVrYc7uTkFAAOC2Xl42VoLt3lbwMh+I
         v8lVuER2Rqr33nDcx7LFrddZ5fSl05a4zMd/Zt5WJZXpJLXV1klOx7+er0oVZ34WvNV8
         kpT5tpbBzi9S/eZAvW7pbyip+HpqijA8KU/rr94sWxfEYTzG3XE6chSt1kRNjrFKKDpc
         4gxMNf+8XEPYcrysCNhZI9QzYKXUBYE9I7BR0jSYgYSw1qzP7mUXGx4i/yojK5E9EDUy
         r1B+XHEK7IhSmNFtaxlc71WQtbZmqnh6PwLKBE2ue25Adq6aLXhVJ7sMsr237NL1Ts2c
         0k/Q==
X-Gm-Message-State: AOAM530zEZWdEhvcLf9EOg3ltBYpY0ONCYxxhbLTq330iAm9ycY2/O0l
	VF3nYyGOcqCFn/+wdG2lfz8bhA==
X-Google-Smtp-Source: ABdhPJxbcNVgTFbEH3zqK0G/4/3/NvKSyvGjZ8B8oCpY+KSha7d1SV7BGFVW/u/w2JGU8AjtzDZMFA==
X-Received: by 2002:adf:dc0b:: with SMTP id t11mr4550735wri.259.1629991512717;
        Thu, 26 Aug 2021 08:25:12 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:edf4:979b:2385:1df8])
        by smtp.gmail.com with ESMTPSA id t11sm3263949wmi.23.2021.08.26.08.25.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Aug 2021 08:25:12 -0700 (PDT)
From: Loic Poulain <loic.poulain@linaro.org>
To: kuba@kernel.org,
	kvalo@codeaurora.org,
	davem@davemloft.net
Cc: netdev@vger.kernel.org,
	ath11k@lists.infradead.org,
	regressions@lists.linux.dev,
	hemantk@codeaurora.org,
	nschichan@freebox.fr,
	manivannan.sadhasivam@linaro.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] qrtr: mhi: Fix duplicate channel start
Date: Thu, 26 Aug 2021 17:36:03 +0200
Message-Id: <1629992163-6252-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>

commit ce78ffa3ef16 ("net: really fix the build...") handling a merge
conflict causes the mhi_prepare_for_transfer() function to be called
twice (with different flags), leading to QRTR probing issues.

Fixes: ce78ffa3ef16 ("net: really fix the build...")
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 net/qrtr/mhi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 1dc955c..deb8b03 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -83,11 +83,6 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	struct qrtr_mhi_dev *qdev;
 	int rc;
 
-	/* start channels */
-	rc = mhi_prepare_for_transfer(mhi_dev, 0);
-	if (rc)
-		return rc;
-
 	qdev = devm_kzalloc(&mhi_dev->dev, sizeof(*qdev), GFP_KERNEL);
 	if (!qdev)
 		return -ENOMEM;
-- 
2.7.4

