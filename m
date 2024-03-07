Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD731130E58
	for <regressions@lists.linux.dev>; Thu,  7 Mar 2024 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709835065; cv=none; b=HWEiBgb39nqv5inw+nu5wAWvbzh8NOS+2qS4EjxJp6AdayQVVv5KdaTyX5iQUehlj6PlBoWp5zGssTOLAn+2JyFAm8f0OMDswH796swlUIAqYDXBrbWipC810/U4/vTYX3T4U/IVgsqKcAUCZR7W4YrRTC6XWdWFAKmjJMf/H20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709835065; c=relaxed/simple;
	bh=MSwk9m019bovxBPCFdmGUUb8kDN6rZIsMVLwz+Lo3KI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fi928kKvMip19ruXhlnGgU7g9ITWd+Cr6udXOsZom28kvMbWW3LRCcYza9V8MnX6DyBqTd2353vlTLdS+1BSYu3jP8TLsSEzjcg+QXKarr1YcQsmcS96QinGDOLyQQAAdcq50YkknKgNJTwgTalG2l2ChvJe7Qg5gMVyUHr3ylA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bauoyTdo; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bauoyTdo"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33e162b1b71so1120885f8f.1
        for <regressions@lists.linux.dev>; Thu, 07 Mar 2024 10:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709835062; x=1710439862; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B3GonG82DcjzScY2yqMLOVofBvS+BK6hBFT8370W7ZQ=;
        b=bauoyTdo+N4+8qFs/pKJ20hCttFL1wmkfVzVhKrnUGsK376VcddfXvflKY5JW1lS9V
         nCFg7pbW4mwWjl+2JO9wG8yOpgZQQbH2mnsAZdYhGyNXMMZMUTjIjzJx7Cy+evmIqIFX
         vXKecULPLsnuzELOJRk7xM16tx4di2bEb2gcnv2ydhUh/4EGn7okEo9C2b+zN+ENBgxh
         9uIdEuSCfOsoESrpY/AyhdbZfU9VIm5zbi3LcRj1bQJEJ+XZ98rZVf7oj4eT4JwfhsdF
         /YT10+LPUxWSqACSw1dY4TC/zAvi3161oAKsGClut9b2afBYMD6ruWz238C3F59N46vG
         XHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709835062; x=1710439862;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3GonG82DcjzScY2yqMLOVofBvS+BK6hBFT8370W7ZQ=;
        b=JlTgwwdtGr4e7AHgoYRxTYpwCNgDjZwEqCYgkk1sfKiaSYhvtxnH1WX2QPVCq87Qm1
         TzqcwRolDv2mv9X5emjB7sftJfVd46uyCEx+jQChMaIY541Q86zLSq+kxtj50aSC+vJj
         ecu8UHYVeN235EBwDMFL8hZyIPgej85GKeG7OSdFvrYGGGxt21FeZp67qZTggieLPv3g
         Re1HAVjjOIIttkz5/wYuYgql7RxcTNJ5jRDwGq9jl3JyDNm76xo59BlB6JWMA/qukDAX
         ehcW2udL+h/TaSkzDir/1shOOw0+RjjOG849r5kYY8KmxRFjo2npcwK72rjXN+3zZiZs
         Spdg==
X-Gm-Message-State: AOJu0Yw0/70DgtWCFC/+Sf4oUJqmnGWSnEndwH3JstHCyz9/1Bo+fWfP
	xXciYtxwhF6R0W6yf5md4hSZ1cH72qUqlpzgK5CFOhsD5XOn2+VC
X-Google-Smtp-Source: AGHT+IF0OwFl5zKGvGii6CJizfdF6zUHaQgO96P530PxCEXtJzaQP+3NzpQhGqobAA0HanUBSJEtEQ==
X-Received: by 2002:a5d:5f48:0:b0:33d:215a:1914 with SMTP id cm8-20020a5d5f48000000b0033d215a1914mr16966076wrb.38.1709835061847;
        Thu, 07 Mar 2024 10:11:01 -0800 (PST)
Received: from debian.local (80-44-66-160.dynamic.dsl.as9105.com. [80.44.66.160])
        by smtp.gmail.com with ESMTPSA id v9-20020adfedc9000000b0033e712b1d9bsm713020wro.77.2024.03.07.10.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 10:11:00 -0800 (PST)
Date: Thu, 7 Mar 2024 18:10:58 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: linux@leemhuis.info
Cc: regressions@lists.linux.dev, trivial@kernel.org
Subject: [PATCH] Fix typo in reporting-regressions.rst
Message-ID: <ZeoDMtLGIHvbavW2@debian.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Append a ':' character to the first usage of "#regzbot introduced".

According to the regzbot documentation, the ':' suffix is the correct
format, and, even if not strictly necessary, it is good to be
consistent.

Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
---
 Documentation/admin-guide/reporting-regressions.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/reporting-regressions.rst b/Documentation/admin-guide/reporting-regressions.rst
index d8adccdae23f..76b246ecf21b 100644
--- a/Documentation/admin-guide/reporting-regressions.rst
+++ b/Documentation/admin-guide/reporting-regressions.rst
@@ -31,7 +31,7 @@ The important bits (aka "TL;DR")
    Linux kernel regression tracking bot "regzbot" track the issue by specifying
    when the regression started like this::
 
-       #regzbot introduced v5.13..v5.14-rc1
+       #regzbot introduced: v5.13..v5.14-rc1
 
 
 All the details on Linux kernel regressions relevant for users
-- 
2.39.2

