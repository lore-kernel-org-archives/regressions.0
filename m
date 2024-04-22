Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A882053395
	for <regressions@lists.linux.dev>; Mon, 22 Apr 2024 08:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713774897; cv=none; b=OlyFuCflrplfjAihzeApPfW0hl3ye0/dVLCYnCFHgOop7d0B2b+k/9RHiAInb179uPK+qpGJniiWXMIaljaUYHt5yRu4tMYAS5lyMw0s1XkhXBTg5hParvNaQ+emoYWF+Ke73sB2OJ4/9pDAIldqNXvt7gv9Bprmq66ynUAxeWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713774897; c=relaxed/simple;
	bh=F3cTKTmerVbQ6uoJlKX+yppvxNK3d2MPp9LlpPWAt6I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=jda2Pl/DKSq0LzJ8OKPjjYAjNkxjhrJwWiuLjJDk5ko8LQhLnR1vWA4iMPIPHnWlHyJxCHjiox7iLIwWM9ezD9/yaoJ04efj6oelAguu6DPukKkjKjb/ZSllEc6kfHUu1rkMpOb3HnqonTUObz8Xr3dj1jqYisvdWAuzpjwjwzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YRaQ+uPx; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YRaQ+uPx"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4dac112e192so1186023e0c.1
        for <regressions@lists.linux.dev>; Mon, 22 Apr 2024 01:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713774894; x=1714379694; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cNMmD9gbVJ9AGa/GKEJtK6907l6CLFIHUYACTDbu5tQ=;
        b=YRaQ+uPx4IUcxHmSQvS0YpV8C0xmrPv+eim0c+H2DSdCcCOH4ByIqJKMeAVPV/JWIo
         ZlyVmm2ESZqiryhGCesAb106M9DcWoCA2gUeBNxhyaa8DXgrAMzmaf0GcqFG5Fck78CG
         HE5O4ZN0SO9XrOQQPdvcU4+oPmp478gDrOfhfJzo2W/UsxhJDj6ddLsqTtnCtnLtRG3o
         ghGtMIXDMPzyY5PtgVvteO/f2BXf8KawcstQUfeI2qJh8umOUzBDzAeAGXhvQYd7JQci
         Aa2X5BtcDkVlS84QoqG1MiLa7PQTOoHREcqMgvnn4/i/y3tfwt47V9DwBUFeEHBbjISw
         R4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713774894; x=1714379694;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cNMmD9gbVJ9AGa/GKEJtK6907l6CLFIHUYACTDbu5tQ=;
        b=aPpWrLbdVf1ulx6Vbb7YxAYsZRqWka5oQbh/o0V1QDsz0kxU7hGue+CFErvM1lUmTe
         XrlqeMOfarQbs1pca5HUazf0DMubrzF1dweyxJWRZKt05fiW6l9tm817d8l/hnikD+Ie
         qx9wDtpJYKzC/9hDN1a+fLHS7YMM01AIhoBcppBkAt0DAHzXR6ioRwBVyLiKBZGLjnjO
         zRv1pmLaqVFzh8wRNIUQ+ZK6Kxt7PCB7MMs3YIk1kD/j6ZmE1u3YmXKvP1HQ9xQMQvn+
         eVkCZPVTYohQXcwuSyzgy7eKWGSw+3Xc8OQiIPsDzOC2BWG68iYHLCbRAvK4jlsr4c1X
         bkQw==
X-Forwarded-Encrypted: i=1; AJvYcCVSQ3SrDIp8i9hmLxrgCnzaApZFFO0HIHx2irMybFLyFfOB+TK3Zybc1W2Oq1XzNTdmfHu/IDbcdrB7jYs+tqYh7BVqFp2sYTL5FGE=
X-Gm-Message-State: AOJu0YwvFzbTwxE65PGMJ3CFcjO24cMZgJ8NK0GeARt/DC9YiCc4xf2e
	oRqOr6PoQs86ksEvQ4NvD9LPsQWEOzgzKJV8gY+0bim2+3S1UBdmWaqIh1wgPvPaEnx80WUT3Md
	ge9VPrcD0jZmeTA0VQSlh7yz67WQr4Gma3/p5/Q==
X-Google-Smtp-Source: AGHT+IFGeTMhcnuzzh3TJqCna/pGicA0/DNk1zHO73mrweIwQNlKA/d49QB4S8rUgtCLEik6kgAcN8aB/1iN4sciE58=
X-Received: by 2002:a05:6122:7c8:b0:4c9:98f8:83db with SMTP id
 l8-20020a05612207c800b004c998f883dbmr10346379vkr.5.1713774894545; Mon, 22 Apr
 2024 01:34:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 22 Apr 2024 14:04:43 +0530
Message-ID: <CA+G9fYsCL5j-9JzqNH5X03kikL=O+BaCQQ8Ao3ADQvxDuZvqcg@mail.gmail.com>
Subject: gcc-8: arm64/kvm/pauth.: Error: unknown architectural extension `pauth'
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Marc Zyngier <maz@kernel.org>, joey.gouly@arm.com, Oliver Upton <oliver.upton@linux.dev>
Content-Type: text/plain; charset="UTF-8"

The arm64 defconfig build failed with gcc-8 and passed with gcc-13.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---
/tmp/ccSUNNZy.s: Assembler messages:
/tmp/ccSUNNZy.s:3159: Error: unknown architectural extension `pauth'
make[5]: *** [scripts/Makefile.build:244: arch/arm64/kvm/pauth.o] Error 1

Steps to reproduce:
---
# tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
--kconfig defconfig

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240422/testrun/23551634/suite/build/test/gcc-8-defconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240422/testrun/23551634/suite/build/test/gcc-8-defconfig/log
  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2fRe0ZWWmise7cetIz0aXdnq4jJ/

--
Linaro LKFT
https://lkft.linaro.org
