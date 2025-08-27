Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E46225401
	for <regressions@lists.linux.dev>; Wed, 27 Aug 2025 06:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756275856; cv=none; b=tvEin38Ss5eByv5XUKUQfZD0+njEqTWXqZYBRDALTRkmIwrgkLRaakv9sN/vb2u3DzGAcpD05EVwXoC5bsLU5+Om2Sh/8YUAwAto+wR+tM8ErVN4TQCPW9rJcKfA+qJ4Fld3t3xzm7/k6wGz1D4kUwJkzMfeLm+i2xPkWoK/NvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756275856; c=relaxed/simple;
	bh=kVlyh+9zjWrWkE9IzWbt9j+Kdlbna7+U0ZjUEEug9Ws=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q+88EJ3ie3g7N2yw/9ObOzRYu22qTSVN5KktXcZD0DqNkRONXIhIx6zawTTCxVep/fus8f5zMnyigyITmmm3vAkw4hS1kdjkHgtYU0DbAjdFeXQdVzCMVL+AlXLJk+zohqDW0ZRHUswDG0DXnqxLWuTTP0vGLnnBxSGdPUMscHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbezmIaE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbezmIaE"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3c79f0a606eso2130205f8f.0
        for <regressions@lists.linux.dev>; Tue, 26 Aug 2025 23:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756275853; x=1756880653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MTffp2Une9psOpkE9avAK28pF5DJdZIHIrhlvCx9OY4=;
        b=cbezmIaEpCgbHsH8eawcWfZQhh/fYA8MZ5AxVkLDiVJMfOIyAxUfPJQnV1xGq+zH+R
         RcFO7K2Bb3W7rliSzQ1dhbOlSjwBt/sY5bwDg/Js/LMXvO6k84t5Z1otKEHY4hsGECgu
         6fKhqdC/vfBB5dShfJOfTH1QH5S2731vc+GmLKt4QrqGybzgAgaohm4q+VVFh3XEnciC
         9d0mdB71woV0n9S5YQZeS1SLHSlnpcFy5YXxis3pTRMqpIWOJz1cCmmoMwdEl//D6Zrx
         3LZidBblu5AXp+WEnoi4tRTrQnrhT6/bjGKuTsntbKWialYCNjnsnoa/aCC1Wvv0LhW3
         Lz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756275853; x=1756880653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTffp2Une9psOpkE9avAK28pF5DJdZIHIrhlvCx9OY4=;
        b=d5bNxAql7kGe2de1kY6RbwfDe+1Js03HPmhcZlui71yTmsq60JclqoqweIXKbUfqmy
         q7t+pQMXzwghQfSMxy0VTtwZYK29oJd16ummsNxUpMqBEiCesEISIYHKiJGa+K09V94C
         iLgpI+XiicUYa69KBo6z/K2tgbMFiDflVPeaZhJipe0ULu3oIuUUkSbGxDoP8ejzpUSi
         R92yQ1czdckob/ux2vidKiKaEJTsBTq8j6fPn0XOb/hMPuHZ+xWbC83v1/rviETvxj1u
         lUrb4+fqzY19Qbn2tPf6aQrmv42gZOPh6+mbwOgKf7mBOKCLMh62AbAbI1+OVRuz1FQb
         952Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqkzA6NsMeGxvya6RH/xjCkKDSbI4x9X6JE/rfECVuddWEr4GVYlpvJgWjKoJAqM4kue2GQLnBRUZSGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzL2gtWR8WJO7Yc74wG7ZWXV3m7jLcY8U/DkXEF72NkwMrDavUc
	WPi+msV4taj95/tr+HYc7YTO0RostGLVayB3ZEhvOBKobihG/A3m40sU
X-Gm-Gg: ASbGncvYNmZ86U3zDYxrjnfsJcp2X9T0go+NUb/4Bj5QmNvv3GQ7hFpSCLPn3lcg2E/
	tpZRdSZDbSIYgJNrptxmoO+iH6UTTQoEhYZZwciOW9SSynaCgtgy+wzuXahYp1FmQBwZIUXLvXz
	FOALKafJr3lA2lfZGGRPMDvvtlyAG7MjtuTjZNMEehnC/H0fBoGjLw09dKUz/L5vO4y50b5ofkV
	Unkq/gKWsOK1nCaJQuwbD1rXB+KRve53qsVBvU7RuvEJAvcMuK3k5MLoflqwCv2HgBWSw2Dlfh8
	3MQjcWUe9+odz5SwtnMo2DFkN0lcuBwIJROVGDyJQNSC3WQlmS9AXLaAwtZ01KyrpSWJSNLoEZY
	tVxgcInihVzqnTF8Ik/TIAxhdxw==
X-Google-Smtp-Source: AGHT+IHEgklavUSzLPlc+ZOoflTsrIRZ3Z3NKnpJ7OaHAYLP706fmxXS169Z9AHTmsJOGYiGuWM+EQ==
X-Received: by 2002:a05:6000:22c5:b0:3b8:d15e:ed35 with SMTP id ffacd0b85a97d-3c5daff6b01mr13806088f8f.23.1756275853378;
        Tue, 26 Aug 2025 23:24:13 -0700 (PDT)
Received: from oscar-xps.. ([45.128.133.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b66c383b1sm29749875e9.3.2025.08.26.23.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 23:24:12 -0700 (PDT)
From: Oscar Maes <oscmaes92@gmail.com>
To: netdev@vger.kernel.org,
	bacs@librecast.net,
	brett@librecast.net,
	kuba@kernel.org
Cc: davem@davemloft.net,
	dsahern@kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	Oscar Maes <oscmaes92@gmail.com>
Subject: [PATCH net v3 1/2] net: ipv4: fix regression in local-broadcast routes
Date: Wed, 27 Aug 2025 08:23:21 +0200
Message-Id: <20250827062322.4807-1-oscmaes92@gmail.com>
X-Mailer: git-send-email 2.39.5
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
Link to discussion:
https://lore.kernel.org/netdev/20250822165231.4353-4-bacs@librecast.net/

Thanks to Brett Sheffield for finding the regression and writing
the initial fix!

 net/ipv4/route.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index f639a2ae881a..baa43e5966b1 100644
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

