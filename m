Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72DE3DBD71
	for <regressions@lists.linux.dev>; Thu,  9 Apr 2026 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775757547; cv=none; b=ZU2rQr06l2xiJDlsYx/HP1hVo2nbdvd/YY9MDVxGZMyqlrBOJq1Unexca8RgblQUGozAmFd25rKQmki0zsT23418T0QQC6tf1u/YxKOtLULPBWzEVdgM8UgZVKvZcRE5uxT+Id+AJkKwGPi9QXijR6UMajYTZ8P3VsGXR527VFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775757547; c=relaxed/simple;
	bh=5bT8iQ83x4f61jVgp7+jbX7dMQomoQswiUTAqppeUfk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=joWDHkhMe8tdPGGxQUu7SAcdKcZK07KUWUPZgRhKUcushg39E/62MecgxUxxCEw6Ep6eKgAii8qFKMAOvxEsJItL5HlspxdBbKddIQ/iQDvDFBvP3eKMIkRZgonhZMdfGMeG++uSP2uSJogtAF6lxGuZ6ZqXL9Pz2YnFHSwilJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=E9SUO2fy; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="E9SUO2fy"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c156c4a9efso1732649eec.1
        for <regressions@lists.linux.dev>; Thu, 09 Apr 2026 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775757545; x=1776362345; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uj4f+XEQfXlciZ5DZoE30+GE6CPx+KcrDN6kKeQ8GTk=;
        b=E9SUO2fy0ei1SgsWvi8MD3vJvliqRo9QXxYZb5sGnXULOWYNhL146LvCPGxcMvUrnM
         8PkluCfhuvbkBXLEPnk3CqIiazz9/OoDsmNI2fR7qAH0rCFdlQ1Z9XMNc76ebyI2pb1N
         yfiRqRGwr0vGMIQiY/J6urd3G8GMcFgHd2r0GMLlHCv1k0SC8wDYaskMwAN/4RI0I+Zb
         DFkR9YyIvz8LlIKH+DBto+8BGIGRg1Dhpspw4/ALlwg4F/EA2BwbMKYU2XSaX9PG1XTM
         kSmsv4/cvOzLydo4xjEdB5QPG4FoHoEk98p67fg6KXRam9/Sg9IJCyqLuK0P8rPrD7Or
         sQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775757545; x=1776362345;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uj4f+XEQfXlciZ5DZoE30+GE6CPx+KcrDN6kKeQ8GTk=;
        b=pHgJ0lPWOonXmramfva3p+RF7YZzc6BgExnGkLnshkbTPG0hDRdMOJzPlqXGumHJ9g
         xIFtMi3wz7x604sgjFj4t14tW7M1q7UG7pRbWvHK5q8Gc6VBwA5HW3UwmdfLjO5ls0pG
         xGtwINNF+1CwQbr/q5THLqLuZ9OsVRzxb2pMr6WK22s/lNYDdYuq2754cq1JiYXvh3iP
         Op161uERXtD9L4jFM37hJg6FZLOQg6YHg7UeS3FJ9GJTAGL9o10oBe/a3Hb66jXruJdI
         WrK34waxkrKR9yb0PRl98gx6MuQSzvCTxFPXrGI52qbFC4o8R5RcYyshC3NL/+LxnBUs
         ktdA==
X-Gm-Message-State: AOJu0YwZmVj2B2P9kHsuIH79ik6SNBZzP6hhDD2OrElN97TE/UwevYag
	LWel1JAT/hd92YpfjahRV1EFVgEX2j7Cvaa+eWWOedMpmosGjz5ETaXbDvwDJxsoKS1TqMnndju
	1UIj9
X-Gm-Gg: AeBDieuRSDsHS5s0F4BA6/Bcsbou5sjKiWYg543TeHaYWx7RbplgA55ebNywYsf1rn+
	HBjyoZXy3VIAgyYvuyx9u9Akg4zzn9x1gl/sP5dqpu8YJ8YRl15QKixABZviWfzVf314BWRf/ex
	9VNqrHDnTvyQo3ASzWycORt2gRLnzwSdPLJvjqJvYTsCaff7g6J6WQMIdbnyNQfUZ8R1jp6MzVN
	8iTUX0hCFtQ67xGY2BJ453ZMeHHgMAYtoD03ti8Za8vUz4g3c3xjPejrfDZxTAsWy4uvwaxlJKY
	VoNXB3l3UAXtQMtB0wHEutCrc6zp6WrFyVz2a6XGqWfjpss7xwrDtPmHpV8WdB5tB4djfUF6y86
	QIs1e9RXMdgbPLb0vTexd+zoWhm3QvnQCU1STrvZMJ1GoQXa/1sAeBECEgJ441ux9KkYjDyRlsl
	pS+MCgEjXAPcwr0tcI
X-Received: by 2002:a05:7300:7c09:b0:2d4:532e:7e37 with SMTP id 5a478bee46e88-2d589a9850fmr28103eec.29.1775757544903;
        Thu, 09 Apr 2026 10:59:04 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd2a4esm771098eec.16.2026.04.09.10.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 10:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in testcases/gcs_write_fault
 (Makefile:31)
 [logspec:kbuild,kbuild....
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 09 Apr 2026 17:59:03 -0000
Message-ID: <177575754349.3392.7097741727041803278@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 in testcases/gcs_write_fault (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:837688a95afbb9b44863d912ece5498d99b9fa72
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  3fa7d958829eb9bc3b469ed07f11de3d2804ef71
- tags: next-20260409

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+preempt_rt on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69d7c39d86a2e63970e628c4


#kernelci issue maestro:837688a95afbb9b44863d912ece5498d99b9fa72

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
