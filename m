Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E81393DF2
	for <regressions@lists.linux.dev>; Tue, 26 Aug 2025 12:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756210706; cv=none; b=Da/rRcCPW+gdgl9sh1AJU0E8vP05G0xfCEUnpWuqnQjaf8/mvVPUhzba4pXCTtFhHNsTTT3iEOPPiPqCzdNwRexxsZIkyL6JGG+hXkV8cn+i7XctZ961TmWYP8ACY74i8MLs7Iud+2gt8y4VrLoMeHXcE7ripzyOxa8THiVuFTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756210706; c=relaxed/simple;
	bh=WNRFfbyB1JScy1/30FZa+Ntq9RVZSUi/ijHlpcIjNBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y3iH3AFJjiR147yq3M5X/KlRR6baEAus+ZHb4N2PZZKa0T3Ln2c2/SnZLXQgRCa8rdr3MCFoXaoDuRUcx8k744Dh1j64HY9sRnYjM01rc0Kh+iaf3nZ0jYkC+zOL+8Wv5eWgNbDX5Qg+WzwUQMQhrC5xEQNjNorKTxd+SRFGpao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvEwPzW3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvEwPzW3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b004954so43862245e9.0
        for <regressions@lists.linux.dev>; Tue, 26 Aug 2025 05:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756210702; x=1756815502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LChTYlNX7jpHHdvqfK7E+ehTE+2KqMA/oVeIigfrSAA=;
        b=dvEwPzW3bP5r/IJF4+nyqmSsoFRE2/TxvBct7S3hXKOLTfxpExbkGfpZTxb/wRhBAJ
         wQL8iEOoH47boqy/i72LQhH6bNLS72yU2FMpqZNVENRJqtwB6lq8PJlRvDn7gEVW4awK
         8Phof2i45jLRu1288bEfZkYpSVK0hclcCXgP/5f7t0zNSdutKc/aOXCyLeoIeciLR4Zx
         JmtIedPpVahUnw0oCgxmQbOkHd3yf1xoxAiEblYfya59tRXPty3gfMnh2Ox4gTYn29NF
         kp+PqMg4GxVf0j4TZMuCnBqnjtYFkfDpGyqNr4HBBV4PzdZjjbuJ8bPNOVUNOzk14j+4
         JE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756210702; x=1756815502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LChTYlNX7jpHHdvqfK7E+ehTE+2KqMA/oVeIigfrSAA=;
        b=XlKRIeF/DtRxj+OA67VSgyB25oK9Z0gak5vT5pjoH+XFlP+Y6y9GSx70oRvvIgIZE0
         apTakbKssvoFmeCLmAFQRStZfubuWoor6Ond1N/6K7j7VBU11eysPUkeo6jQSTzdSQMt
         v9Jq11Lnaii0ms5s6kIaWWPR9lGAWFb++ZJNYkXt59iXnhEVlVW4dFssD6VR/VJnyX+e
         A+eGOVoa1k3c4ae23Wmq55GQR1iKbviKO28+BXatjKRWcFjaTgedk1WATZrrwcRYdD2E
         a3r6R5iTOkMNX/TOJ4v2X7s69ndC+qxxJQ0yLTAsmfV1EDGUp3kwwkdIVl3UDqUhHszh
         N0+w==
X-Forwarded-Encrypted: i=1; AJvYcCX+aV0s2nW7qE7ZH57rmDl4GNnOxwFmQdMvPxxvM100/HNXQPAUrKLUeYBdO5rTpnftaJQ4J3zRSge7XA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9j79mStVe7fYpUjVZm00DYURS6tKQYofu48lxIG03z+fJEMUq
	NKggf5H7k0btf9k9VXff6yWYNoL6JnO/uWjuPcDWrTtpRme13iQ8weyk
X-Gm-Gg: ASbGncv/CVsSHrFQyxd//IAOzxZbvxje250ZYi2TUZi9g/Gf4x/86XgM4MjXoZFeBZB
	4c00kmZrQIKWk4ToI+ySCSydYzZQbrw+nGnrad6FqeWQESk5tqOBYnIYKTUT+rseRkG5dukKJdE
	lNeFu0sfmmoAnvNyKtLNqG9VwFQtqSwODKIKH+CZ92mMBuWe4ePVv4JQpz/fUhIRN+eZBdfDwUZ
	eWZScFkZRFJo2SrVq9Ku3CIOA8hD0ktkkBDaFj57r+4YoToeLSvbCzzZrcFGoj2E1zqyTSlUhbf
	SsKS4HgBDjkhx2k41IZAVyT+pE/GfU2BgS6BmY/VUxh72VrmHWCvbCnGX1TsHixJSwCGJiilLTg
	KuDu6j0RQCZjyzUt7t8/H5A==
X-Google-Smtp-Source: AGHT+IGDspJcry+lZbYtZeVg4+4kmcTBPmZuyilfg0+W2o8HlDsbRsJZkF4781x4cl6MBUZul/po1A==
X-Received: by 2002:a05:600c:3b2a:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-45b5179f3d1mr194717105e9.16.1756210702258;
        Tue, 26 Aug 2025 05:18:22 -0700 (PDT)
Received: from oscar-xps.. ([45.128.133.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5758a0bfsm149513675e9.20.2025.08.26.05.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 05:18:21 -0700 (PDT)
From: Oscar Maes <oscmaes92@gmail.com>
To: bacs@librecast.net,
	brett@librecast.net,
	kuba@kernel.org
Cc: davem@davemloft.net,
	dsahern@kernel.org,
	netdev@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	Oscar Maes <oscmaes92@gmail.com>
Subject: [PATCH net v2 1/2] net: ipv4: fix regression in local-broadcast routes
Date: Tue, 26 Aug 2025 14:17:49 +0200
Message-Id: <20250826121750.8451-1-oscmaes92@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250826121126-oscmaes92@gmail.com>
References: <20250826121126-oscmaes92@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9e30ecf23b1b ("net: ipv4: fix incorrect MTU in broadcast routes")
introduced a regression where local-broadcast packets would have their
gateway set in __mkroute_output, which was caused by fi = NULL being
removed.

Fix this by resetting the fib_info for local-broadcast packets. This
preserves the intended changes for directed-broadcast packets.

Cc: stable@vger.kernel.org
Fixes: 9e30ecf23b1b ("net: ipv4: fix incorrect MTU in broadcast routes")
Reported-by: Brett A C Sheffield <bacs@librecast.net>
Closes: https://lore.kernel.org/regressions/20250822165231.4353-4-bacs@librecast.net
Signed-off-by: Oscar Maes <oscmaes92@gmail.com>
---

Thanks to Brett Sheffield for finding the regression and writing
the initial fix!
---
 net/ipv4/route.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index 1f212b2ce4c6..24c898b7654f 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -2575,12 +2575,16 @@ static struct rtable *__mkroute_output(const struct fib_result *res,
 		    !netif_is_l3_master(dev_out))
 			return ERR_PTR(-EINVAL);
 
-	if (ipv4_is_lbcast(fl4->daddr))
+	if (ipv4_is_lbcast(fl4->daddr)) {
 		type = RTN_BROADCAST;
-	else if (ipv4_is_multicast(fl4->daddr))
+
+		/* reset fi to prevent gateway resolution */
+		fi = NULL;
+	} else if (ipv4_is_multicast(fl4->daddr)) {
 		type = RTN_MULTICAST;
-	else if (ipv4_is_zeronet(fl4->daddr))
+	} else if (ipv4_is_zeronet(fl4->daddr)) {
 		return ERR_PTR(-EINVAL);
+	}
 
 	if (dev_out->flags & IFF_LOOPBACK)
 		flags |= RTCF_LOCAL;
-- 
2.39.5

