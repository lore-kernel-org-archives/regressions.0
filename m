Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB3633DEE7
	for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 11:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761134231; cv=none; b=WhFi5HIPXRwKn5UwYA73tv1tytOeie4wyWOQWf2V5MJ+HTl1alsJ8NWnfuV4EYR7+To5jqFwNtu5xAbrsfRJxS2c8hMBZNtMqTbExXX99PAT/mKAj/kaunqCJq+xWlovfvpLKwonFfF4gMVYGilJz0zlkf3Rucptf8UNcR4Skl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761134231; c=relaxed/simple;
	bh=URTqzJkAAJFoQOPycXd7kEr7wppHxat1qLacnS1FCiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sqDhVFMhVdAMjSsmYVHLeQLcqGWE2Gn+sCrFBzp4nxB2uK4SdkcE9oHUZrnANdUwmwsbsCNf+RM9LMwLU4QT9jmrx4lYsIp9JOzL2GA9t2YAI1yesHAS+Zvg70sbJhGEDR5bxmuXRu9W/ZBrBrkTwM1mc1IM2Vj1PcCsKimNkvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iSUPNw3w; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iSUPNw3w"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3307de086d8so5614730a91.2
        for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 04:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761134229; x=1761739029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WzfUG+BqfKD/coIQsN8R1l6DNO8bGUEyk6UsV4mKerM=;
        b=iSUPNw3wQKTipuaBEYmkiVLn9ttlXr/NQ6ptn9cIfjo5LP1/zwdhOB034dCSvKkY3E
         BPqc8JD0imlZPHso42Xyy5van5/oFVKjZfbWIlYQRM2J+iAbDnj/82radOjx8H9dAjjz
         WBi3GeO7WHtQq01jiWnDNtuY4rpEusoxFoGG08Su8c9aYKuBdwNEbmdXLztBegzZrKj5
         WnpdFH0GngWehUOxfCimsPelfpX208QqVdvA2upwNdOtYKg7UkuwcK6OV3dTjGQC7m0c
         ZQFuIuBlrT17ZLG1PaxFio+9XMeWYK3a1H4zFjUa36FaQkmcBPYPLNKT8yZMV5mAF6xB
         st9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134229; x=1761739029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzfUG+BqfKD/coIQsN8R1l6DNO8bGUEyk6UsV4mKerM=;
        b=ilFSOUHfZgX7BnRToi8po6f+t08txL5PuZIefNeajuYjZ1ACx4cshiCq9QGs0xhFC3
         2YTrZcuFo3D/FnVeHU+yA8hRnxzHYLHfHwjrF0C6UBXaP8OFJJt21ycPg51zQALaLdfi
         WGSBoOJW16M3/pYxMOSDF4Eq6B+Tem+IhBhTjSU+bgvUHtgKHfVgAtPF6rhExFShLLZl
         qoKI9XM4YYbaRxnm3SPJ4B0tVFawSJQbuEZOFxGMU+6vQ37nKljbxdA+/EVcIohngU6E
         vRvLoIer5iA9c2PVs2wGtlI2Oq9tSr6BcclNwB7VvskXJPEKi0SopyqrEZtE0XtU2U8l
         J9LQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5kCS3TlSX/irI0wZwQHeMZ7+b8QiHpEiJSMnNPz930cLnt1WZaZ7U6nku0NGsjrrqND3qGi+//jfuKA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn9xnGj9duZdIGiBNjwsuNlh8+tg7b+Ac/cVKbGZJUn4r/Uhzj
	96mKW53wflSQSWnhwQdm0V9oBMVXNTXeEi7X3zvkoaivfYacxD3Fu1OdmfCNby8sFo4=
X-Gm-Gg: ASbGncvAmb6LtFCnEXyFfXRZAxnlUY2QB5ut6xeRldtxEPRyGyumN5Irb+DQyjC0Am6
	8FMqmF2jtfKqqHFg+4XOT2ZWREbg0H0+jb67cXeOgdqhLWo70hpz9zEKEgA0FpCsV0JI6Hzh0Ju
	NJ03+o/XklZQTvpPhUN4XoAbTy18DamQyC9Sn2wV1LPDWz2pCUdSuYFtOOpvZRFFFbZVxrhK6KT
	qJl3uj7Yw56jyw6b2Lo89PHblXjZPAaTq6KcFQur9wu9D1cfhOJigRaSdoZ900CC5P+Tq2JMHMf
	ykvd3hkWSO0WTES3c6x0YxwHYJ+OVJTA1oJgR+zZD7uzdsMYtGTnnA6DBCEKkvWUCstAMZNitBZ
	svCAliO+UPq/eLVh56CJ0QL+XU4skioeGvSHfWYrHtVG16r8f97vz9aMcc99LS33n83gkz2f1kA
	fytxkH22ogyRfK4vxTt7glWl216vwBL1u3EIn2Eu7HwD9u3jj5vUkFsQiTnQ==
X-Google-Smtp-Source: AGHT+IEubD0OvI6uVVM+gnAPZHbQP3Rz7U+Y/YydXiR4UWw4SnGLju39L4qJ5sYEmZqdZYH8YZdr7g==
X-Received: by 2002:a17:90b:1dc6:b0:339:a4ef:c8b1 with SMTP id 98e67ed59e1d1-33bcf8f7802mr26421431a91.22.1761134229471;
        Wed, 22 Oct 2025 04:57:09 -0700 (PDT)
Received: from localhost ([2405:201:c00c:2854:21a:7bd8:378:3750])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e22428b1esm2401348a91.22.2025.10.22.04.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:57:08 -0700 (PDT)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: ltp@lists.linux.it
Cc: lkft@linaro.org,
	lkft-triage@linaro.org,
	arnd@kernel.org,
	dan.carpenter@linaro.org,
	pvorel@suse.cz,
	jack@suse.cz,
	brauner@kernel.org,
	chrubis@suse.cz,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	lkft-triage@lists.linaro.org,
	regressions@lists.linux.dev,
	aalbersh@kernel.org,
	arnd@arndb.de,
	viro@zeniv.linux.org.uk,
	anders.roxell@linaro.org,
	benjamin.copeland@linaro.org,
	andrea.cervesato@suse.com,
	Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: [PATCH] ioctl_pidfd05: accept both EINVAL and ENOTTY as valid errors
Date: Wed, 22 Oct 2025 17:27:04 +0530
Message-ID: <20251022115704.46936-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Latest kernels return ENOTTY instead of EINVAL when invoking
ioctl(pidfd, PIDFD_GET_INFO_SHORT, info_invalid).  Update the test to
accept both EINVAL and ENOTTY as valid errors to ensure compatibility
across different kernel versions.

Link: https://lore.kernel.org/all/CA+G9fYtUp3Bk-5biynickO5U98CKKN1nkE7ooxJHp7dT1g3rxw@mail.gmail.com
Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
---
 .../kernel/syscalls/ioctl/ioctl_pidfd05.c     | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c b/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
index d20c6f074..ec92240a1 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
@@ -4,7 +4,7 @@
  */
 
 /*\
- * Verify that ioctl() raises an EINVAL error when PIDFD_GET_INFO is used. This
+ * Verify that ioctl() raises an EINVAL or ENOTTY error when PIDFD_GET_INFO is used. This
  * happens when:
  *
  * - info parameter is NULL
@@ -14,6 +14,7 @@
 #include "tst_test.h"
 #include "lapi/pidfd.h"
 #include "lapi/sched.h"
+#include <errno.h>
 #include "ioctl_pidfd.h"
 
 struct pidfd_info_invalid {
@@ -43,7 +44,22 @@ static void run(void)
 		exit(0);
 
 	TST_EXP_FAIL(ioctl(pidfd, PIDFD_GET_INFO, NULL), EINVAL);
-	TST_EXP_FAIL(ioctl(pidfd, PIDFD_GET_INFO_SHORT, info_invalid), EINVAL);
+	/* Expect ioctl to fail; accept either EINVAL or ENOTTY */
+	TEST(ioctl(pidfd, PIDFD_GET_INFO_SHORT, info_invalid));
+	if (TEST_RETURN == -1) {
+		if (TEST_ERRNO == EINVAL || TEST_ERRNO == ENOTTY) {
+			tst_res(TPASS,
+				"ioctl(PIDFD_GET_INFO_SHORT) failed as expected with %s",
+				tst_strerrno(TEST_ERRNO));
+		} else {
+			tst_res(TFAIL,
+				"Unexpected errno: %s (expected EINVAL or ENOTTY)",
+				tst_strerrno(TEST_ERRNO));
+		}
+	} else {
+		tst_res(TFAIL, "ioctl(PIDFD_GET_INFO_SHORT) unexpectedly succeeded");
+	}
+
 
 	SAFE_CLOSE(pidfd);
 }
-- 
2.43.0

