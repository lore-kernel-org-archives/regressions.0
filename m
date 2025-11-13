Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523AB303CAF
	for <regressions@lists.linux.dev>; Thu, 13 Nov 2025 05:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763013548; cv=none; b=O0CjYaWFXCCqFI6gS149+RHxU8LhgkuKoMTOy31kb7NSucXiGWiIxD594z14lGy5/qgzHLybizQUT93oTg5g9bviutsnr28PiOeCfQEmifm6QluPzKtOUpB8AuCDEw7ttWllxf1667Urw3vYhOfTAY9AKYCnOdQcX81uo3UoYYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763013548; c=relaxed/simple;
	bh=wza4S8wUZt6+VKRKMSHQSY/xmDb6KgTRMG4CN4bMjk8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=SNIYr0QH51LOGtLH6bmCMkEKqmkdRaV4U39+2lzcWkD7srU1QanX/bOvbeVK/M7kdyJRvaYo7gCj7HG0Mg0pq1pqNLoctAjbtqN3ICX8CKe+QF5I590r3T+Kx9GZjv3BSpy+63Se9i09kcz2SrZTLJPkkeWJhwH0g9NH98emcSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Lw4N/JyN; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Lw4N/JyN"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b80fed1505so334235b3a.3
        for <regressions@lists.linux.dev>; Wed, 12 Nov 2025 21:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1763013544; x=1763618344; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXSAnbgxS7ZiviPCEiGua91bfUo0Z8jsM3ZVvQWxZtA=;
        b=Lw4N/JyNssZAOEyYqePp/JQfDd2AcqDmnfYm1aQyW0RVGjDxk8WVuBuy/FkKQxF9To
         nICoDu97K24Hr9GrwFf+eHKaqSPT4mFUjhrOYLjbM3qFY9TDWZT2AtVD2g+dNPq9wB17
         oMta0f84BaLmP+N+cO+2gdVXRybLiB+HVNdUCTfIrWg1MgSzpPHroNcqFum7D5eH7QPU
         UhS32ZA980LlLbDXRuNJznYfmEjvl1xTv68YjopzqzgGcLigFXi/8/PNv6onTWzNU3HF
         kW2xxpNLk5uMbV2HbUzh7QsKh2Ql+K6qjdO1UX2XrwQveO6KeYFKBOiOJqEv3LkQGDG/
         sZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763013544; x=1763618344;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HXSAnbgxS7ZiviPCEiGua91bfUo0Z8jsM3ZVvQWxZtA=;
        b=E7YqSyCRFq6v9vXzW/51qsz+fjPR9zB/oGmxWUmUhI2sN2w3p63UG1eLpSJvR8i64z
         p/SSsOreTWPp/LPxx0Tcqmzye3KisSVbknEuw+wxUGEZkACSoCQ/zJGkLPnifU2+KTLT
         7igkXf14tGQqht5rpeVIsqrQJbODatwOZt6i9vIYlyS55tDBACqaIZ76ZqTDvPkui63v
         SzhbtgbVpe4/YUZ89CnDSCaTnYvoe+CsVpUqzahN50m2gsh+ObU30SWhma0AiYDFZZTf
         tAH26FYCoI7j7uoXYYNdqUpTxvTOZ6yDQbCCYZeEO/DlkHwrdz9n57BY1ppcOZ/01PgQ
         6Azw==
X-Gm-Message-State: AOJu0Yx4hLlOLq/j9liNtOv+q1IJ5uqqVgRiGtJLtkqHnEwCepeLH326
	dG2tbNV/4SPbvIqxfED+0w6zV+pXftckPYJM4CIU3oScfxEa6NY/Hi4acDCrZkptUuY=
X-Gm-Gg: ASbGnctWq5tt3RM2E114cF+rO6cO21L3ukFGrlyFkD3rm+Nuvm+UYQCa4fTwNaL8Y9m
	/acXfJucvOtueEv6V0X6/VVf6AK/XVuclaDm4jKlm2vjoAzEk0M6/L3fYm85sChVIcf0I8ehUfW
	4ViyrdoHAv4PksmFvqkjHZQEMWxfO3VkrqjX0f21bk11/+zb3RfLPE+6lsozOslL0mCvAuKH8gQ
	mG8opQDbTLQc78OmzOUgzP2aeO4YEBLDkWCGBGwx/UeX+RndiSaxFFz5wz7LVnWG0J47L5BLh38
	kg8wufIrwGJdKnIZ2YCn2fNnYpjujZDb7Fuq9sFhF9q1nuB/+tsl9tvPa2oQ7kgCew4vh6QsfRS
	HhCg6km4cTZUhZkX149s8Qed+1xmYULxEeix0e5ZEpi2cjXNi+xLvKIvoP38YC9bSR8zxBQ==
X-Google-Smtp-Source: AGHT+IGAIGDGmRN+0TT3QqnmDki4IPkE/y/D1cfLRgVfuQUwWxfz2NefKHZpQqW5WR8HDWw/jdnx1g==
X-Received: by 2002:aa7:9f4a:0:b0:7b8:383d:8706 with SMTP id d2e1a72fcca58-7b8383d9ceemr4408363b3a.18.1763013544510;
        Wed, 12 Nov 2025 21:59:04 -0800 (PST)
Received: from efdf33580483 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92772e7f2sm932938b3a.57.2025.11.12.21.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 21:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) in ynl.o (Makefile:27)
 [logspec:kbuild,kbuild.compiler]
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 13 Nov 2025 05:59:03 -0000
Message-ID: <176301354315.447.16290763427581345433@efdf33580483>





Hello,

New build issue found on mainline/master:

---
 in ynl.o (Makefile:27) [logspec:kbuild,kbuild.compiler]
---

- dashboard: https://d.kernelci.org/i/maestro:cec1901dfbc548e17188aa1ee1d09a9b64810be0
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  6fa9041b7177f6771817b95e83f6df17b147c8c6



Log excerpt:
=====================================================
gcc -std=gnu11 -O2 -W -Wall -Wextra -Wno-unused-parameter -Wshadow   -c -MMD -c -o ynl.o ynl.c
make[5]: gcc: No such file or directory

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
- compiler: clang-17
- config: https://files.kernelci.org/kbuild-clang-17-arm-allmodconfig-69154d6e2fd2377ea99add3e/.config
- dashboard: https://d.kernelci.org/build/maestro:69154d6e2fd2377ea99add3e


#kernelci issue maestro:cec1901dfbc548e17188aa1ee1d09a9b64810be0

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
