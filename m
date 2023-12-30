Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACD7B647
	for <regressions@lists.linux.dev>; Sat, 30 Dec 2023 04:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DztHfLFJ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d3e6c86868so57156105ad.1
        for <regressions@lists.linux.dev>; Fri, 29 Dec 2023 20:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703910870; x=1704515670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZiDP3ACvLtUqSs7Pgb3eo8FrHgRUMknvmQ1/AAsrmw=;
        b=DztHfLFJgIkFBicTAhteyBbAS/D5PbUil90T2972UfBGs48aibJNwApngJsOsPvrz+
         FfKK/gY5FkiRrHC2bf6CIM17gKPIRW6scj1hWofVWa/otHIViGauuZfmXNFrQF+HFZvx
         HrHTZjFUVmrb+4/9ACG07JExHlsPsaiFi9gpKuG2Z8e9fBPFgDbxCBt0Q1gM8dxxOG+8
         5te505z8s/69r/MZp01Gzzhe0oX++GtMLWQFtNVItOB0WRAxlaf6eHeWS2zs0KLT9yXb
         vdgskrO4UbBi/WLaO63QXHODyGCwU/xzjeUHYz5jNVAbZBJ2IMwyThaPHJA4h9qgqTFg
         R1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703910870; x=1704515670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZiDP3ACvLtUqSs7Pgb3eo8FrHgRUMknvmQ1/AAsrmw=;
        b=FSiLUGgoG3rVZ48gtrbWD2TYDseFjbGCL2vepJH6xNJYIDYH9W5rcq09L+OqbzXW3K
         1mbWYrJ2Itw972IZc2VRjRn7gNXeD/dt1nadeJDtHePFnMrxy9iQ1bpa7F4kL3qwiPS9
         sv4aJkl5jA7uNkzMTU+lF0B+HLUmlpXbOTlpv6yWhukTFDB0IZyQAL+FGpEC/w3s0lRt
         T8IFaK1m1PTJkAfbsvhiDVb4pIiRmNyzFch11/tQ75XgtKYFB2S8mu1iY02ZMCtGjkso
         P9n8aUnazcBSUIED9dHu5olgQzaQRQqQiQwyYBFcRqIZOvQRS4e7bcXM1ef9x37jmNpH
         UKCg==
X-Gm-Message-State: AOJu0YwJ7dcwBh0F0kgZJzhU9dLnHDYoafdeHr8UHxe8QOGYlF2jrmnB
	DWQSPa5SuiXmK0ByEeeZ4ZU=
X-Google-Smtp-Source: AGHT+IGuavAbJwLeIzYAkuNbnPKrmlmWGepSfVDpwQ5zcqyAVuBjCcKaHrWUS0uRdkYiDHxjhkNYLQ==
X-Received: by 2002:a17:902:e541:b0:1d3:ac23:b511 with SMTP id n1-20020a170902e54100b001d3ac23b511mr16723590plf.54.1703910870306;
        Fri, 29 Dec 2023 20:34:30 -0800 (PST)
Received: from xavier.lan ([2607:fa18:9ffd:1:7a77:c7ef:1ba:cce8])
        by smtp.gmail.com with ESMTPSA id j1-20020a170902da8100b001cfc68aca48sm16374856plx.135.2023.12.29.20.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 20:34:29 -0800 (PST)
From: Alex Henrie <alexhenrie24@gmail.com>
To: netdev@vger.kernel.org,
	kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	dan@danm.net,
	bagasdotme@gmail.com,
	davem@davemloft.net,
	dsahern@kernel.org,
	edumazet@google.com,
	kuba@kernel.org,
	linux-pabeni@redhat.com,
	jikos@kernel.org
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH] Revert "net: ipv6/addrconf: clamp preferred_lft to the minimum required"
Date: Fri, 29 Dec 2023 21:32:44 -0700
Message-ID: <20231230043252.10530-1-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d2f328c6-b5b4-46d0-b087-c70e2460d28a@kernel.org>
References: <d2f328c6-b5b4-46d0-b087-c70e2460d28a@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit had a bug and might not have been the right approach anyway.

Fixes: 629df6701c8a ("net: ipv6/addrconf: clamp preferred_lft to the minimum required")
Fixes: ec575f885e3e ("Documentation: networking: explain what happens if temp_prefered_lft is too small or too large")
Reported-by: Dan Moulding <dan@danm.net>
Closes: https://lore.kernel.org/netdev/20231221231115.12402-1-dan@danm.net/
Link: https://lore.kernel.org/netdev/CAMMLpeTdYhd=7hhPi2Y7pwdPCgnnW5JYh-bu3hSc7im39uxnEA@mail.gmail.com/
Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 Documentation/networking/ip-sysctl.rst |  2 +-
 net/ipv6/addrconf.c                    | 18 +++++-------------
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 4dfe0d9a57bb..7afff42612e9 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -2511,7 +2511,7 @@ temp_valid_lft - INTEGER
 temp_prefered_lft - INTEGER
 	Preferred lifetime (in seconds) for temporary addresses. If
 	temp_prefered_lft is less than the minimum required lifetime (typically
-	5 seconds), the preferred lifetime is the minimum required. If
+	5 seconds), temporary addresses will not be created. If
 	temp_prefered_lft is greater than temp_valid_lft, the preferred lifetime
 	is temp_valid_lft.
 
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 2692a7b24c40..733ace18806c 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -1407,23 +1407,15 @@ static int ipv6_create_tempaddr(struct inet6_ifaddr *ifp, bool block)
 
 	write_unlock_bh(&idev->lock);
 
-	/* From RFC 4941:
-	 *
-	 *     A temporary address is created only if this calculated Preferred
-	 *     Lifetime is greater than REGEN_ADVANCE time units.  In
-	 *     particular, an implementation must not create a temporary address
-	 *     with a zero Preferred Lifetime.
-	 *
-	 * Clamp the preferred lifetime to a minimum of regen_advance, unless
-	 * that would exceed valid_lft.
-	 *
+	/* A temporary address is created only if this calculated Preferred
+	 * Lifetime is greater than REGEN_ADVANCE time units.  In particular,
+	 * an implementation must not create a temporary address with a zero
+	 * Preferred Lifetime.
 	 * Use age calculation as in addrconf_verify to avoid unnecessary
 	 * temporary addresses being generated.
 	 */
 	age = (now - tmp_tstamp + ADDRCONF_TIMER_FUZZ_MINUS) / HZ;
-	if (cfg.preferred_lft <= regen_advance + age)
-		cfg.preferred_lft = regen_advance + age + 1;
-	if (cfg.preferred_lft > cfg.valid_lft) {
+	if (cfg.preferred_lft <= regen_advance + age) {
 		in6_ifa_put(ifp);
 		in6_dev_put(idev);
 		ret = -1;
-- 
2.43.0

