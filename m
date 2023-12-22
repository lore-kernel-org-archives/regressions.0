Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D2A35EE4
	for <regressions@lists.linux.dev>; Fri, 22 Dec 2023 23:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UK6P6Pz2"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-28c179bf45cso591801a91.1
        for <regressions@lists.linux.dev>; Fri, 22 Dec 2023 15:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703288643; x=1703893443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2FndYqF4JacU8fr/QFMFiLxqaWYLpyTNAQDkJcL8Ws=;
        b=UK6P6Pz2VAN6baOTt/joIYcIHkIPm4565JjJVkZI7wk8SYaLxIY9cXBAZ+dgATjFmP
         yab0KJjBSU4UFyp42IP4QhfrIjhl7YUVZlmhSQG7MWAex7ROaQ/S5U53kxpVdK2Bky8B
         iZe/i+ngw6FaB7PW3/7BvofIvuESumECODRedpYCriIEvgoL/c1WPC3ed2F/tGh0zXo3
         ramBuzn8cm+UCB8eqY7lQhWzTMnAAmfo6mBXa0fnHdRANcT7c5sIQVxgF8deFWpwPmLi
         mBmMAOCpRGoQp/LV2PNk1S9Ao4cj0OCsky/00e+0ZwRV75LyCG5nsSshGpNZS4QsqTCP
         tbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703288643; x=1703893443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2FndYqF4JacU8fr/QFMFiLxqaWYLpyTNAQDkJcL8Ws=;
        b=vai76BaUxL9lY3MHUM93A/wAnss8x9iV/M7xpK8rnmFpD8lSY9iXx8Do497zAu3v80
         6rFCrt50zR2gkL6hws6XaJ3HFAWgVZ0gAkSxvYq/PrnF51icHge4iMmvR8xS9TU3Ck2z
         I8phx2G5tD8I/XxbhSUbTrlVLJTNZvnTVhPCZItWBMg8y5Hp10y7xUn9ixbY8HCoic6F
         x3865NqWz+DfIAKeHZZFJVbFM0ZGm4+sjlXbEKwZAF4VmOo4EZMT4oEc/ARbDffsUANw
         E2LYIvQ0CYJc8pYWGfiOw9qTFbxYjmx+DDAH2+sWO1cqPFMKO3Gh/gTDlbozVSW5SrWs
         B6eQ==
X-Gm-Message-State: AOJu0Ywt8k00qCzY3qxiYAsAwVrQL3hQsQyHPeqS7Jjz3zQUuKCjXl5n
	bbdwgjDntT88+OEhdqYEIJE=
X-Google-Smtp-Source: AGHT+IHeR2KoMp2csOplwLZQeHOaF3yN1rH3e6Rhb3xbBEnPD2hZ8nqLPPqguA64P4E77fLaMA9gFQ==
X-Received: by 2002:a05:6a20:8407:b0:18f:97c:8a2d with SMTP id c7-20020a056a20840700b0018f097c8a2dmr2161275pzd.88.1703288642952;
        Fri, 22 Dec 2023 15:44:02 -0800 (PST)
Received: from xavier.lan ([2607:fa18:92fe:b835:c8f0:af87:712f:cf12])
        by smtp.gmail.com with ESMTPSA id a21-20020a62e215000000b006d98222b74esm2326427pfi.46.2023.12.22.15.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 15:44:02 -0800 (PST)
From: Alex Henrie <alexhenrie24@gmail.com>
To: dan@danm.net,
	davem@davemloft.net,
	dsahern@kernel.org,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	bagasdotme@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH net] net: ipv6/addrconf: clamp temporary address's preferred lifetime to public address's
Date: Fri, 22 Dec 2023 16:42:28 -0700
Message-ID: <20231222234237.44823-2-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222234237.44823-1-alexhenrie24@gmail.com>
References: <20231221231115.12402-1-dan@danm.net>
 <20231222234237.44823-1-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: 629df6701c8a ("net: ipv6/addrconf: clamp preferred_lft to the minimum required")
Reported-by: Dan Moulding <dan@danm.net>
Closes: https://lore.kernel.org/netdev/20231221231115.12402-1-dan@danm.net/
Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 net/ipv6/addrconf.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 2692a7b24c40..37141d3417fe 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -1337,7 +1337,7 @@ static int ipv6_create_tempaddr(struct inet6_ifaddr *ifp, bool block)
 	unsigned long tmp_tstamp, age;
 	unsigned long regen_advance;
 	unsigned long now = jiffies;
-	s32 cnf_temp_preferred_lft;
+	s32 cnf_temp_preferred_lft, if_public_preferred_lft;
 	struct inet6_ifaddr *ift;
 	struct ifa6_config cfg;
 	long max_desync_factor;
@@ -1394,11 +1394,13 @@ static int ipv6_create_tempaddr(struct inet6_ifaddr *ifp, bool block)
 		}
 	}
 
+	if_public_preferred_lft = ifp->prefered_lft;
+
 	memset(&cfg, 0, sizeof(cfg));
 	cfg.valid_lft = min_t(__u32, ifp->valid_lft,
 			      idev->cnf.temp_valid_lft + age);
 	cfg.preferred_lft = cnf_temp_preferred_lft + age - idev->desync_factor;
-	cfg.preferred_lft = min_t(__u32, ifp->prefered_lft, cfg.preferred_lft);
+	cfg.preferred_lft = min_t(__u32, if_public_preferred_lft, cfg.preferred_lft);
 	cfg.preferred_lft = min_t(__u32, cfg.valid_lft, cfg.preferred_lft);
 
 	cfg.plen = ifp->prefix_len;
@@ -1414,20 +1416,34 @@ static int ipv6_create_tempaddr(struct inet6_ifaddr *ifp, bool block)
 	 *     particular, an implementation must not create a temporary address
 	 *     with a zero Preferred Lifetime.
 	 *
-	 * Clamp the preferred lifetime to a minimum of regen_advance, unless
-	 * that would exceed valid_lft.
+	 *     ...
+	 *
+	 *     When creating a temporary address, the lifetime values MUST be
+	 *     derived from the corresponding prefix as follows:
+	 *
+	 *     ...
+	 *
+	 *     *  Its Preferred Lifetime is the lower of the Preferred Lifetime
+	 *        of the public address or TEMP_PREFERRED_LIFETIME -
+	 *        DESYNC_FACTOR.
+	 *
+	 * To comply with the RFC's requirements, clamp the preferred lifetime
+	 * to a minimum of regen_advance, unless that would exceed valid_lft or
+	 * ifp->prefered_lft.
 	 *
 	 * Use age calculation as in addrconf_verify to avoid unnecessary
 	 * temporary addresses being generated.
 	 */
 	age = (now - tmp_tstamp + ADDRCONF_TIMER_FUZZ_MINUS) / HZ;
-	if (cfg.preferred_lft <= regen_advance + age)
+	if (cfg.preferred_lft <= regen_advance + age) {
 		cfg.preferred_lft = regen_advance + age + 1;
-	if (cfg.preferred_lft > cfg.valid_lft) {
-		in6_ifa_put(ifp);
-		in6_dev_put(idev);
-		ret = -1;
-		goto out;
+		if (cfg.preferred_lft > cfg.valid_lft ||
+		    cfg.preferred_lft > if_public_preferred_lft) {
+			in6_ifa_put(ifp);
+			in6_dev_put(idev);
+			ret = -1;
+			goto out;
+		}
 	}
 
 	cfg.ifa_flags = IFA_F_TEMPORARY;
-- 
2.43.0

