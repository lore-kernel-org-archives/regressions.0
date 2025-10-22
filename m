Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04A42ECE96
	for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 06:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761114601; cv=none; b=uEv+ZUwWMWt2KMtiyvGPNvNCQ0etCbtqQu9lvsvvL35CWuoa8zJF+ihXua7O1iluAKxHxq5HtN9acHXWOO+tlWDgJNrILTWZb0GsxloDp9/xIIoMJK8id6VONSRb264GPsEuMG/FsRk2/dvO8dHqdcOL0orTGGyOsf7uzx3M0jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761114601; c=relaxed/simple;
	bh=pxi12w+zJvC4kZodhK0Ij6Jx0cFF+FxyL/tgy3imtgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9E8yRp9JnBmdDbWhbI/99LuDZotD7upZsBP2TnJHV7MttHSjewttufyjCLrfiMd/2By6v1rmbp8IqX4aa7wZpQJuEH9wRsJX6F28OaL1eGHQptVZYODNt1Ub31dYGUo7JMEYZjfQm6aB6vBTdKxItgV4Y75WXlGtstgVB5pF9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEEV7HNQ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEEV7HNQ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-77f67ba775aso8415987b3a.3
        for <regressions@lists.linux.dev>; Tue, 21 Oct 2025 23:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761114599; x=1761719399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRyE8t6dhAXyClNR4lT1jQASjbYPHXa83JC4TjDmfbk=;
        b=FEEV7HNQBFQHufoYgReYZZPmsTZwfBBOHcV84hJhQYEdSnR1ZnDuQ2ady5AERIn8a9
         GNtuPvz2VTfPyLMXHPNPvnhcnHt5R8fSQoy+LdsbMXPFR2FBGJlbASpmCmixAseGeXwr
         4d0JIdbP6wpgq+fzXBzkJtsLQOa/ocxVdAhq9T+1MmBQb0PMJWa05SHGFm58Jh9ey6B5
         eKzUaI6BISDRts491Unt57HpAVuO5mRWX40i4+NK5OwcRIbKEMVHsLKyNVtWJUWQ/CIS
         yM4dbCAdXIaoeMF9yHPBiwWUyGDc96g7CnFC4sHNBToktK5VcwHHx3UKptkA498kljfk
         hsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761114599; x=1761719399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRyE8t6dhAXyClNR4lT1jQASjbYPHXa83JC4TjDmfbk=;
        b=OElNqsyqpWVwJW1+d3W5gGGwxXS9tILxgl+zgaiHW9eU1fVCk/DYBpaELNM1yQ4Ota
         OQjlTR2JFFqvYcyU1CUZvx84K9vv9dfZ4j8HqHBc6oT6esVyRNKAmiX3dWartR5/Jazj
         RznykicNtUBCmswaapjcCAQNWhjwUR3jL9J37rV46nInv7sX7yAiK7pEzgSQnuz8JVo2
         4eaid7yZOKXTg5tZu4uaXFU98ToGIqIqiUB6D5NJN2MV5Fe+b+g+gnt5kgjKq0VrZ+21
         P2SI4SyjekWu7xgQldvXh8zpyqSruBYxdb/5MZoOxwGixF2Zekwjf/mKcDfGn6BFKJvQ
         LleQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhDZ1FaS74GPqSyUhPMYvc6AKgst0CmstCMCV9BK4/UNY5h8sqTub/a33OoTtDObR1QKHAJpThCbeMNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWSEw7ivYa9HkyW65hASQ7s8oDmVZyLSZxhOwb2UWS40FfRV5i
	pCDhV8bsaR4LEFzZV7qnr1cM5wKr9533GhYGTjMP3ToIVqnfiI2hWKiU
X-Gm-Gg: ASbGncvuI6XoEed+2iGbdMRVu//3mOs//P7dO2LSbxqgUkgdVO0pC0oAsFiqyymlL/i
	/s+q76QPNCmcUdkCBbJayB2AYDumJ/L7NTbl45GXRH6nK7cJF3l7wAOZCZ/Gk8a2r3hk7fvIgx1
	gGqXl5fSYE1LSOuFNAMvQmMLSE7kxm7zDP0MX8XNI/9xy98Yc2KK4xkOHnafscNPiCS38NOqxjH
	tRw2/5gR2ZQQmvcZ6ratL8auYg+khTf+yZHq4HIod6/4o/JG2gBDDVDV1wni3If6wmIKmdPouH2
	z3QizW1XGkmLBtraTev+NQML4qlEujZsWOJ4OHplGn8HFggsTihPfKiNdbg9Fz/Nlx4oF9htnDs
	Ssn36lyOmIehQW0KSrFDlpMcaqIczwOVSzPzSB5/7PmvkYgDKHfs9BWy2r0dSZfePL7ds3Paz2X
	xcTfTnGPO0A/5siARmeP/eivUQfWoG3dI=
X-Google-Smtp-Source: AGHT+IHCdWM1S/FVwbPmHY3O4OmTAtweU3JQt3Ila1Kmd/ZSXIEyZnlKVzKCFjwGH+txrzbmUlsmmA==
X-Received: by 2002:a05:6a00:84a:b0:78c:985b:8d3b with SMTP id d2e1a72fcca58-7a220b29d75mr20156837b3a.23.1761114599073;
        Tue, 21 Oct 2025 23:29:59 -0700 (PDT)
Received: from server.. ([103.251.57.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23011ec97sm13408435b3a.67.2025.10.21.23.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:29:58 -0700 (PDT)
From: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
To: naresh.kamboju@linaro.org,
	broonie@kernel.org
Cc: anders.roxell@linaro.org,
	arnd@arndb.de,
	benjamin.copeland@linaro.org,
	bp@alien8.de,
	dan.carpenter@linaro.org,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	lkft-triage@lists.linaro.org,
	mingo@redhat.com,
	reddybalavignesh9979@gmail.com,
	regressions@lists.linux.dev,
	richard.weiyang@gmail.com,
	shuah@kernel.org,
	surenb@google.com,
	tglx@linutronix.de,
	x86@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH] selftests/x86: Add selftests include path for kselftest.h after centralization
Date: Wed, 22 Oct 2025 11:59:48 +0530
Message-ID: <20251022062948.162852-1-reddybalavignesh9979@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CA+G9fYvKjQcCBMfXA-z2YuL2L+3Qd-pJjEUDX8PDdz2-EEQd=Q@mail.gmail.com>
References: <CA+G9fYvKjQcCBMfXA-z2YuL2L+3Qd-pJjEUDX8PDdz2-EEQd=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous change centralizing kselftest.h include path in lib.mk
caused x86 selftests to fail, as x86 Makefile overwrites CFLAGS using
":=", dropping the include path added in lib.mk. Therefore, helpers.h
could not find kselftest.h during compilation.

Fix this by adding the tools/testing/sefltest to CFLAGS in x86 Makefile.

Fixes: 4d89827dfb27 ("selftests: complete kselftest include centralization")
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/lkml/CA+G9fYvKjQcCBMfXA-z2YuL2L+3Qd-pJjEUDX8PDdz2-EEQd=Q@mail.gmail.com/T/#m83fd330231287fc9d6c921155bee16c591db7360

Signed-off-by: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
---
 tools/testing/selftests/x86/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 83148875a12c..434065215d12 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -36,6 +36,7 @@ BINARIES_32 := $(patsubst %,$(OUTPUT)/%,$(BINARIES_32))
 BINARIES_64 := $(patsubst %,$(OUTPUT)/%,$(BINARIES_64))
 
 CFLAGS := -O2 -g -std=gnu99 -pthread -Wall $(KHDR_INCLUDES)
+CFLAGS += -I $(top_srcdir)/tools/testing/selftests/
 
 # call32_from_64 in thunks.S uses absolute addresses.
 ifeq ($(CAN_BUILD_WITH_NOPIE),1)
-- 
2.43.0

