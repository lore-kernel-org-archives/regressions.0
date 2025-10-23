Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ABF3093A8
	for <regressions@lists.linux.dev>; Thu, 23 Oct 2025 16:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761237848; cv=none; b=tuHfiFN6vLQpU2PiGubhKGxNL4sNoN1PewzvJW1i7vBwXY8UzRFzPFLrdiXRQNo02VF+kSYm8kYrSkoOeGuN1KeV+34ZKJtUX5JmPqBkcuspX9LZZNvpqTQPQAfOTkfUfNgcIgkYiROmw/Zx9rg92dXOeDnTKtrqnXt1A1wC5NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761237848; c=relaxed/simple;
	bh=8fIX7biSbEZ4B4b77XL+f4TS9/Jp/xnQ/nE2WkTPmO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W5GmCoNDfdLsnsFnCElDdoqCeKj49Qx62ocsP/dVyqblAEx4lQ4sz1jRQHjuKNNlW6BKue161xZsSO8ZI097SGaj7/M0VouZyuNPnjMFMMWKzj0Ybq32SjKxsza/2WWhLvVKAF9gWQos7OvKjOfXGOYdSaeG+5tCRWIDcCEQ6lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZOeGkGqJ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZOeGkGqJ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b6cf257f325so929945a12.2
        for <regressions@lists.linux.dev>; Thu, 23 Oct 2025 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761237846; x=1761842646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WBSNSnNcjQaKaCnCJuZwnw3e0fnN82ayIMOAkE29L9Y=;
        b=ZOeGkGqJ6/WF+2fzsoA2HCGzaZgD1bDCb1B/6y2C/MUG0JDrW0TGYVl2L6iYuo0fm0
         kD0Avdjb6hzql4LogDaA6el5WuLx31Wr1UzICmQvSuV8KB6okuxARd3U35gVQYji5vM3
         dsYhEVCoJej3abc7VvszkAR9FmIttsTrouZGxySoQBOB+yRZEq6D44qIDCMpvGyclLBp
         Ec+6peGClYCjZebwWh09ic+aK4tT5BYpNfFoOUJHLCRoNxWBPiTcZ5uLNfkRmcIblS5k
         JJTnm4EamI0YSuXnxVTqI2avLiF0e7bMTVZqEVmk3y1RFpDiAiXDD99CN+F2HRlDAQp4
         5iMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761237846; x=1761842646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBSNSnNcjQaKaCnCJuZwnw3e0fnN82ayIMOAkE29L9Y=;
        b=TSTMJaZCD+uU0e79+huTxXPTGKohV3FV0h6Ed3VA/GoN5r+GU6oiOyrYpKJqinR3nX
         ilic4s+FIdCHC6+Ht+3IM31aUcByNZBuGpFAWMuRQ2Ur5/bSx27K41a1rB/k0uRewfn+
         PppvHYCltfZNBmPGi3h+tc0lSF8O/9HaoPl9LezKhmPQNhQUNhAVPsSstjfkR10Gs5pK
         z+DmraqAgO1LzyGqf6zLK+36d9BWkddeIWLBrAmT8Ty3KlPhVcqmEwIJE52wCcnuVocb
         6slKqfj2Y6i5cFnWtYu9gcsFd8UesWKWxLSFRUwN9TnBUqOxmcFAPm4tz2Bu7f5T6TS7
         xuvA==
X-Forwarded-Encrypted: i=1; AJvYcCV45Ws+8cd4SnxMX3uukyxY7tOdS59lactqA2Z8pW4vMfmBGnorldlVUT+Z8n3UN7A/KrJD7353vtpBRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZKYyL6xxDmuop7mIsVVJW3kOo4aG2mBwSj0xeO25ftBKOG/IO
	4hQ+EA7V4hO2j1Wp0OXEywXbIaBayMWBXZjsgqOzUr5jQlP0x6NJ8gcOPVsLjGqR+zE=
X-Gm-Gg: ASbGncv19Ad+VVv8S1BL+7QrZsLe1M9JXzvqQg15mh11VPBgy/ORBxZQNOcFw1/0uvn
	1PeKTa/nEMew0CG7hmpAxsPn7WJrS7Tu16rZICE6tNRnolo/OpGrHfiIaMCL9TwSiekb2rzpSpC
	YTXvuEgdoi/41Pigey438vN3/C4bxVb1X8x32iA7OboSlYDpoo0ZnRiW0PvzHDvrM88tRe88l8x
	hKHnETaJtT0bQkKH6sIRlnnuk8JosbNlQgaIH0VrJNiX6yZPvTG5YTvN52Bkte5y460g+LibIBV
	um4WMq2+5A3yjQD9whW0ILLXzccEJ00qKHp3Hbcm+5WLgZ+3vTz7Vxr1KpMoXvqLnPr2zeslERc
	fZrm/2Mh9fVUaWz4qIA5YEp6iaZAF+vfRzf35Hcy/nrdtg/6PRAC+w8WHzfJCkBT16BYwyGu2J0
	X3Ep6bGsI4zEcr06WX0yKcR6pnx2D0JQJtuEHaYLJnKcoOdDL+mw==
X-Google-Smtp-Source: AGHT+IE4pFFH1ySU5m3ad6i6VUzfPRs66wcF55zEy8vDarPljKErMuGfeUnYnh7PBCKkJQkt4U7EUg==
X-Received: by 2002:a17:902:cec2:b0:282:eea8:764d with SMTP id d9443c01a7336-2946552521emr61649525ad.35.1761237845759;
        Thu, 23 Oct 2025 09:44:05 -0700 (PDT)
Received: from localhost ([2405:201:c00c:2854:d184:69e6:58bf:965c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946de0c894sm28713685ad.47.2025.10.23.09.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 09:44:04 -0700 (PDT)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: ltp@lists.linux.it
Cc: lkft@linaro.org,
	arnd@kernel.org,
	dan.carpenter@linaro.org,
	pvorel@suse.cz,
	jack@suse.cz,
	brauner@kernel.org,
	chrubis@suse.cz,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	regressions@lists.linux.dev,
	aalbersh@kernel.org,
	arnd@arndb.de,
	viro@zeniv.linux.org.uk,
	anders.roxell@linaro.org,
	benjamin.copeland@linaro.org,
	andrea.cervesato@suse.com,
	lkft-triage@lists.linaro.org,
	Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: [PATCH v2] ioctl_pidfd05: accept both EINVAL and ENOTTY as valid errors
Date: Thu, 23 Oct 2025 22:14:01 +0530
Message-ID: <20251023164401.302967-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer kernels (since ~v6.18-rc1) return ENOTTY instead of EINVAL when
invoking ioctl(pidfd, PIDFD_GET_INFO_SHORT, info_invalid). Update the
test to accept both EINVAL and ENOTTY as valid errors to ensure
compatibility across different kernel versions.

Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
---
 testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c b/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
index d20c6f074..744f7def4 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
@@ -4,8 +4,8 @@
  */
 
 /*\
- * Verify that ioctl() raises an EINVAL error when PIDFD_GET_INFO is used. This
- * happens when:
+ * Verify that ioctl() raises an EINVAL or ENOTTY (since ~v6.18-rc1) error when
+ * PIDFD_GET_INFO is used. This happens when:
  *
  * - info parameter is NULL
  * - info parameter is providing the wrong size
@@ -14,6 +14,7 @@
 #include "tst_test.h"
 #include "lapi/pidfd.h"
 #include "lapi/sched.h"
+#include <errno.h>
 #include "ioctl_pidfd.h"
 
 struct pidfd_info_invalid {
@@ -43,7 +44,12 @@ static void run(void)
 		exit(0);
 
 	TST_EXP_FAIL(ioctl(pidfd, PIDFD_GET_INFO, NULL), EINVAL);
-	TST_EXP_FAIL(ioctl(pidfd, PIDFD_GET_INFO_SHORT, info_invalid), EINVAL);
+
+	/* Expect ioctl to fail; accept either EINVAL or ENOTTY (~v6.18-rc1) */
+	int exp_errnos[] = {EINVAL, ENOTTY};
+
+	TST_EXP_FAIL_ARR(ioctl(pidfd, PIDFD_GET_INFO_SHORT, info_invalid),
+			exp_errnos, ARRAY_SIZE(exp_errnos));
 
 	SAFE_CLOSE(pidfd);
 }
-- 
2.43.0

