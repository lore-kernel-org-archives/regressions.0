Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4430927A11A
	for <regressions@lists.linux.dev>; Mon, 25 Aug 2025 06:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756102177; cv=none; b=GlX0sXOvdE7efKd9eEvSmxoHljWsSQlZdJntAuR3uiBvR2PQ2OnCjobL6Fh5O6qz1b7XFiScIs5H4iAHdMg2ZWGPPjt1yCJayGfNaGDUWuE4VRnFRDGl7bYhDFkwOtkj6ToS0DMP29L3bip4ccWjAxOEqMWEWKX/uGuzqdlaKD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756102177; c=relaxed/simple;
	bh=GCvqI9LIIcr7RmgcrjbPhHIv6c68uYZzl5LroXdpD94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ag0YrkWTJd+WS1rGlf3BIJoVjaXEDAF+mSOTArvm0VBbiJ0C/00ByCvrvkOJVveAAHn+fZ1/3YDfM1nO9ulvH15Ol8HbChGSwV8LsMjUINJCqRucbUDfLWvCERfz6Sfp+pEa3npP+3f/B0WvR6K2aSnHqXIrG+cc4Z2iHnnmQ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFEVdqcb; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFEVdqcb"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c763484ccdso855135f8f.0
        for <regressions@lists.linux.dev>; Sun, 24 Aug 2025 23:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756102173; x=1756706973; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJflyOH2olAF4o2o2OC784zNhJJjVPpCQxbeLhg+070=;
        b=iFEVdqcb9CUEdG+8ciXwlYcLhrFFV6zz1QZ3RwimWHvsMgxprcb/BPIaUgQXB7+vBy
         CCEljSJcVMbMk5OrBZNgQGdqEls2gPQ7+QbnsSe/n7xzWX4YzpRStJrs+If/pTRd7SF0
         p/pPFdNjm4gL25fucvmRi1cOo0mnOwHoulEoz2b/TPgKIRvY2RdsKih/RnIHWQVw1AfC
         t7M6ctrhtr85qR+4bbcqS4/Dg830dHbt+QJuCvl9HAvXtULXbNmNsD3ajaCSKAj3ep3T
         hsCeJVoBBABChJBzdb+vqMeWXB7r03rfeFKm1GaS4nbiyPsIHXwlW+BghiOCRSF6Hi5O
         +pOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756102173; x=1756706973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJflyOH2olAF4o2o2OC784zNhJJjVPpCQxbeLhg+070=;
        b=hLEP6RAqdUCO4Vy/zV10erQ/WeS9SaXuFoK5hwW+wu66RTxzybtZ7WuAtHhuhH2Vd5
         51FqWoD0biOh7cnzSuTm+dW3tlrGw8dmVqKyUsFmDt/uBUr5cTTgeDdkfiGgcKc+U/hq
         IpKKZbxyRsnuo1MT0S7RGJ2ZzK6EZ3Z08rAm06dYgkbOYXUOyVpcU5GTKrEw/zHhfAzW
         L0IrTNJd3taaGwfwxWgXQMGAhq/JuIkd7p+zWSd/15YeEdMHHKOijBoRos3VoMuofous
         3wo2/8f3sYTAtEOUzKyfrhJxFs2vGYYl938/cK0MJXd6rZYXohe+8JuWOn0KLubFCGZM
         cioA==
X-Forwarded-Encrypted: i=1; AJvYcCWfRGp0vLYHkkRNG2COKFstKh7vmvVlF6SZegPqaYwNVqevRCxRoA+4KwkMkPTXdKVT2XM3TkmMW0BiCA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBWC9A1EymAGDrOGJcphgYDBtPaGCTbbyGWoYmTZEqo3WJGTGq
	YEKuNtukCyWW6vUQNmYrcGFwxXdG1u+jINeOKeIMmBwvbrk9mJJirbjn
X-Gm-Gg: ASbGncseQDE/oW5flR6gapJbZawn9eCEeKgaxVURGuNnxhcGzGTIGOcZyjTmA9mQPXD
	xounhBLy97UNVFu+l7FUcQI1W7Ujw7Co4jZOTjKNsGN2UocIqxyiHmDK/Rt7OYn2Vrqmo4Efd0v
	PxB+Uaa7YgwqdSsgcA9P/4dLazN0QCJTeroNLW9C8xSuj9baNp0DH5ZhnKxFNeKt4jOZxyD3w33
	LXxllkTTNZJYAltyd8C7T544YMkTjVwgyB3IPXBpOfbg/72BinzoaeOEDcWQ5kZLXEJDnYVFrtg
	ZfZbHOIO7kTxajEMjnl5HCaQBau6uHd8fau0PyLBqD1JwOI4lqyJ3LIXR+bIGMQYPB/6gblqQcL
	HcSRiGu5dT63n34UEKAqybw==
X-Google-Smtp-Source: AGHT+IHk9OUQ90jg7LRzgDU//gkduX/UvzafGmuDf940gqmXNFg932t9Yqo3ZGaSy7X1C72aV9dTKw==
X-Received: by 2002:a05:6000:2f83:b0:3c8:2667:4e25 with SMTP id ffacd0b85a97d-3c826675498mr4204272f8f.31.1756102173243;
        Sun, 24 Aug 2025 23:09:33 -0700 (PDT)
Received: from oscar-xps.. ([45.128.133.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5759274asm94690775e9.23.2025.08.24.23.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:09:30 -0700 (PDT)
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
Subject: [PATCH net 1/2] net: ipv4: fix regression in local-broadcast routes
Date: Mon, 25 Aug 2025 08:09:17 +0200
Message-Id: <20250825060918.4799-1-oscmaes92@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250825060229-oscmaes92@gmail.com>
References: <20250825060229-oscmaes92@gmail.com>
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

Fix this by resetting the fib_info for local-broadcast packets.

Fixes: 9e30ecf23b1b ("net: ipv4: fix incorrect MTU in broadcast routes")
Reported-by: Brett A C Sheffield <bacs@librecast.net>
Closes: https://lore.kernel.org/regressions/20250822165231.4353-4-bacs@librecast.net
Signed-off-by: Oscar Maes <oscmaes92@gmail.com>
---
 net/ipv4/route.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index f639a2ae881a..98d237e3ec04 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -2575,9 +2575,12 @@ static struct rtable *__mkroute_output(const struct fib_result *res,
 		    !netif_is_l3_master(dev_out))
 			return ERR_PTR(-EINVAL);
 
-	if (ipv4_is_lbcast(fl4->daddr))
+	if (ipv4_is_lbcast(fl4->daddr)) {
 		type = RTN_BROADCAST;
-	else if (ipv4_is_multicast(fl4->daddr))
+
+		/* reset fi to prevent gateway resolution */
+		fi = NULL;
+	} else if (ipv4_is_multicast(fl4->daddr))
 		type = RTN_MULTICAST;
 	else if (ipv4_is_zeronet(fl4->daddr))
 		return ERR_PTR(-EINVAL);
-- 
2.39.5

