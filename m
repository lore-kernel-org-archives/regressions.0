Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89B52D8379
	for <regressions@lists.linux.dev>; Tue, 18 Aug 2026 00:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787014754; cv=none; b=KIFvE7PCjGaqcT5HUc7nq35DmR6/S3M1SMX3frlOtNfvSfa5lZzHEFEVeSYQjk217GkGpm8SFY1+2PlJNP/VECpaJ8EUKZpQ1MNbzGFBQCx978RQmZfEOcB3/Gxqtz3SDbIoMnhvVcYxfaEUAIKK9iapJW0P4UkIFXQ6vZc/+Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787014754; c=relaxed/simple;
	bh=SpgtNVpL80IXaM/v36htEhxbZXk0+L5sVWF7vfLC/4U=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=JGCMzMP6U5+nXGGmVFtrDDJkWHOJwIU2H6GyEHdCXaeY68Ey+JHaOW590oKVBWZ6EUv/pK1ZyyzmtrTHmAK0/9ySIv7TSuNIE7tYnNRiyVnIiVHHrX/MmJkNW8wG5w29BGjh0SB3qHDuZAsB4sVfB+21CSTnGyfscFDBrGA2kWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=A2krzCxV; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="A2krzCxV"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso2865026a12.1
        for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 17:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1787014752; x=1787619552; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xusppOlA9BoREb/dlE36FouxvOhY8wBfY2vDszYkSxo=;
        b=A2krzCxVB+4+gK2i7R4E5HyIsY/b56aOUMjacoX3n6PfOMI7rv5NBdEMUqD/2cU69L
         59KOMgtqv6krfARynvLzhuXwW40Fw+NYpQNbYo9Ep6OfcmecsNfGdtVSDocNY1zRwYRG
         uI59mNt8qZoTJzeqR5YBSRtUEwck8s3WHapvd+KDrf0QxjyFExmxzmMRTuQsZTK+mgqt
         DgLcwQoi3sg5d9gSDLewN7QT0aql116iVW5TVVInIVpd6q27Wu/k+ZiFAKtMXF9e/2z4
         TFdodLV9gGOXQudsnDg2VHYERnzVw1DKHhVZnuD2JAE8dWJ7jojz2rpcGurITn+EDghJ
         ZbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787014752; x=1787619552;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xusppOlA9BoREb/dlE36FouxvOhY8wBfY2vDszYkSxo=;
        b=V/8xvp3N9Xy3jsLnX+DNqJXYIHnwChgKySg6DeofFVk8FntdtHDeYlPo2fzLWFrfSF
         09f7N6hrr2u9iwEK6GmpWrC+LvjCVmuJeYqSc7VfvhOBpD8DTKKFzkwjhRLbdGUit7oK
         SXtOVAr2qXA9n1lCRuQhVVtkJziL97svfPDQPjKNKpNkWTw31CTVwzoq4y6RbCvUDl3N
         6jo8h3B72V27wHkNRdp6Dvod8Ya0Udt7NxFAyjtJbMUr/wKbh35/W8IJAF0ejhFLcJuk
         lMsvyi2+ogXPmV1uQvT8t6TdXk4H1kk3Do5hsyRAn4xjFTYydVedltrJk9emmytuEHtg
         6G2g==
X-Gm-Message-State: AOJu0YzdnqEtdqfM6xVncplSKGWYZzghDODKDQ/8HfzsCvQ5Dkv8HjHY
	U0JMvM3BVIo8U8+5s8dJQJ2kY6VqVm/9Y+2WUHLWZcA7dfN/0R/B9Wd1n1vL/WDqfJo=
X-Gm-Gg: AR+sD10aTdUJIQjjesP8e4ngTcA0XZw8I8ZlPwm24KPSLsAC8QGXMIoLbNEGPhh2hMV
	impmV075xDrmF45NtwN8nYLl2aM2UzsmZsWX1HEKkARUQadj9HW1Pb9g9uvum+Z6AXi9Mmi/pZt
	+rNCIdecx1DSLvuLsjv7BZpYrt+ZxJWv94EYZTw8oHdfJxHIGiIhujFWmlBGmux2dY8+MsMnwa2
	AJiaJAZdafm7Kj91tTWi0f2Uuuojt7XLnnN9fuq9tIKerSptKjmzWzrBvIQiZUPgvtbHtOhTBuH
	s4LUHuSc5kXysJeLOLovbu68ufmeClTwSyIqSUnLHyqbJh4fRPQ9v+m+WiPr/TJ3wtrckVAsBx/
	BQe1LabemJGR6fnzhYQPjCZEqperfQYtu3sU9uO0Vc6Pt6YiV1iqcjX8KBtLk2Y5vQYRStVW60P
	0GO0UArgC780lEQ+a95XqEphzjd+bU0sdel6wi4C/P5XmJJrvOWk3a
X-Received: by 2002:a05:6a20:2591:b0:3c4:1916:9d3c with SMTP id adf61e73a8af0-3ccda9f72dbmr4904912637.15.1787014751649;
        Mon, 17 Aug 2026 17:59:11 -0700 (PDT)
Received: from 9a65d8f5b626 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267c388e26sm10564125eec.22.2026.08.17.17.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 17:59:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) in
 arch/arm/kernel/entry-common.o
 (/tmp/kci/linux/scripts/Makefile...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 18 Aug 2026 00:59:09 -0000
Message-ID: <178701474442.5156.12765087253678603047@kernelci.org>

New build issue found on mainline/master:

---
 in arch/arm/kernel/entry-common.o (/tmp/kci/linux/scripts/Makefile.build:435) [logspec:kbuild,kbuild.compiler]
---

Log excerpt:
=====================================================

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178701474442.5156.12765087253678603047@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:5d5ba40a9374919c6038ec3e50f54dbe70a37c03
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  ff68e5f557f69a08fdcfa4ce8b1b809d63bd4f45

# Builds where the incident occurred:

## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a838f2962f33761c0d6680b

#regzbot introduced: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f..ff68e5f557f69a08fdcfa4ce8b1b809d63bd4f45
#regzbot link: https://d.kernelci.org/i/maestro:5d5ba40a9374919c6038ec3e50f54dbe70a37c03

#kernelci issue maestro:5d5ba40a9374919c6038ec3e50f54dbe70a37c03

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
