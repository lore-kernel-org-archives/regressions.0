Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9B632D0CC
	for <regressions@lists.linux.dev>; Mon, 15 Dec 2025 23:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765843146; cv=none; b=D5KnlBHYcgPxpExniLKkC0ujgmhatXMnbXeCPB5XVNttCrqS/JVRkVcHCzyWFlJrZPNZ1WQFJekRM9rxzUPZtYkwKDFMWZ3AJKqCvtoxyQ8hU5PeTQiC8+LX8NkqB3CFCYdLpwO+uE0/Z120RawyI4ZoYLLU0Avw1daVtHpDvBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765843146; c=relaxed/simple;
	bh=2ET3KuZ6rFu/kJsctJVg1vQrfoym60yOnRCX2c1aPm0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=eAsLsf0+XkfjukhXE3cEVtTXOi1N4OVmFUQ1aw8S5jKorCXTlgPVh+tVqjNubxVuDaPk4epIvxZ+h/PXIgKyUrNwleeG7IMPJ4UWdEuM7yPx7ldzHUrfIoqL2XPFgvsjMYJprrWZS8GKr4kilPdaCoDQvgkzc11u322qr/vlAK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=z4zv6uNl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="z4zv6uNl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0c20ee83dso23097335ad.2
        for <regressions@lists.linux.dev>; Mon, 15 Dec 2025 15:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1765843144; x=1766447944; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmfAdh2fh0N8FmAqG7oVO1gG6isOT3BiqzvgRJn/wsY=;
        b=z4zv6uNlVJvgh0kM1gAnrX/q8hc4rXtDEr715lMIUBU0h9WK9UR7L1m1s1elPgWkbl
         ggMGXG55ZJrj0fn+Dbtn1ELP2tkRKVZvBP7Wm+eAk+atH0NgN+/RBQl99F2TITeIIuT9
         Xv+NViiRDQqNujEkDJVrhELIuSPZRUp4U6yYHkyzmGuHnDLvFcIKiVv11miP0M9w4qGP
         GSX1ah7Dc4EjDCZ1UHymGpZnlGvAND13HgzCVH4S9OZlzojx1V6JRbcu1J+utdfS3chJ
         k7h6EMcgoiIrKItH7UP7YI1WSfFiqRymY4zaqlZi5A/jn7BHMcYMp88RBeezuXTpCufu
         2UVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765843144; x=1766447944;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KmfAdh2fh0N8FmAqG7oVO1gG6isOT3BiqzvgRJn/wsY=;
        b=GmWOX3XMgIG684k9On1toaV5AuYruimdXfh050lwjmmwqc4CgFy6FnemGQGSOdUI0G
         paxr2yes7lhKw0dsFd1DHgGLuay8Z6MmR/WejhlUVkpCm8Zo2ZNfeT66ktSr6758BVEd
         t7Zyfq6EoTWB8TdgEbZvt9O8z38MeX3H3uqJhMlZCHAblvbQL++7d0Gmf7ic3kMxmXh5
         mKMB6vqvEy/K1c4pN5DyFapTQ3gJ0tGdtveHpxVyxMFIH9+dm9/jo89vE/cTeNdNSI26
         UrxvAIKbcF+rMS/a43XPVx1SaCyD53yyawWHp9UFYtVXRS0xOw+Mcc/QxFoVpPYNDG5w
         MV8w==
X-Gm-Message-State: AOJu0Yy5cS+KNeSap+MvaZXY3zZduZExJNAEi5vNMfecbD1ErlNbwk/4
	hrdJ4tMjx1UTzHQzXnO6pu2rB4+ydovyTEgYt053JiQ1z+vwVEFWR8+Z0lQPNq/iRxk=
X-Gm-Gg: AY/fxX6ON0G55HgMsqhgIJ/R6qW2TRQLCV0fWQef6ArI5rghSaVN34joj1cwMP0Vsxr
	/44mcHcWsadCnj+TjVtbGKdSjGzgXQQrEaosSuDSZcB4mXKO6pcTXbs4FNbYbyFF5zfFcBGe/9o
	hut533NVNF/QXPjEjqFA2Av2a/v9js3DR+P/J/fiEnQtdIrsoq06EtPI3fbDYrI7w1lHcO5q+Zd
	lwH1me4qdzx5M1CTBnU0Oy1SWROjbanu9Mt04zIf5BxVzKyb4p1qIDKyq5+LYvJ9dDMv7/sCTEV
	79r+YnC7yePRY/2MZMbLmcJIbAzD+kIVchpVqfMeiRf7cZrao2wULESvixvlTv4Axd8kbRi3eb0
	2/5giYxbgEBP3p+PDSEK9FKELw26zpYto+pDOg7oENXk+PXMe15wpvpm/l/7hMFFL0G6LDt0CZU
	dR4+cP
X-Google-Smtp-Source: AGHT+IFqv5CDUbEPLsvtcfoqXFR8jX2ihixN26s3jK6NE/gUSHLjb+2D7z6Y5KmSBlrBYwrFpmuzLQ==
X-Received: by 2002:a05:701b:2808:b0:119:e56c:189f with SMTP id a92af1059eb24-11f34ac184emr9255293c88.7.1765843144002;
        Mon, 15 Dec 2025 15:59:04 -0800 (PST)
Received: from 77bfb67944a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e153e7esm39590559c88.0.2025.12.15.15.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 15:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/pending-fixes: (build) error: unknown warning
 option
 '-Wno-suggest-attribute=format'; did...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 15 Dec 2025 23:59:03 -0000
Message-ID: <176584314280.2550.10885082269394184097@77bfb67944a2>





Hello,

New build issue found on next/pending-fixes:

---
 error: unknown warning option '-Wno-suggest-attribute=format'; did you mean '-Wno-property-attribute-mismatch'? [-Werror,-Wunknown-warning-option] in kernel/bpf/helpers.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:32e32983183c2c586f588a4a3a7cda83311d5be9
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  326785a1dd4cea4065390fb99b0249781c9912bf


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
  CC      kernel/bpf/helpers.o
error: unknown warning option '-Wno-suggest-attribute=format'; did you mean '-Wno-property-attribute-mismatch'? [-Werror,-Wunknown-warning-option]

=====================================================


# Builds where the incident occurred:

## defconfig on (arm64):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-arm64-mainline-694097d2cbfd84c3cdba292d/.config
- dashboard: https://d.kernelci.org/build/maestro:694097d2cbfd84c3cdba292d


#kernelci issue maestro:32e32983183c2c586f588a4a3a7cda83311d5be9

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
