Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43D11BF58
	for <regressions@lists.linux.dev>; Sat, 29 Mar 2025 18:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743274747; cv=none; b=TdXQ6j70RD0luk9cNzrcqQsyQP5NM2jykaORMi4cdA3z31pfGIoXAayj35/y7Z0KUencf//sW8g2LOHyQVXNwJYTFr1U0VCiwvvjElgm2mNAV5RkkDfh0E/qkIqCW4iWv1/Ak38VMh0ptyGJFIuS7gCduiTqBdZR7rjLL+iB7m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743274747; c=relaxed/simple;
	bh=ldbjPy3JEiU6jS65yyW9b4/6groro18QkvScwo5UDUQ=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=c0wrmhOD0DABrP1J/zNk0qNmyq7bSI5dya/5wybBAgA7BMJq3GtY5RvjSbCWbBqyrqZRJe5Ys4A9OccazfZCqy/NvHho8L7eXnNkEJlIe4MgPPL1yOADsJgS42nEM6ltgzOELYBsV6qAkvh1e3Zo82hFXz+AiuWiyCk9b8yqryk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=pgjYvtBq; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="pgjYvtBq"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6fee50bfea5so28965317b3.1
        for <regressions@lists.linux.dev>; Sat, 29 Mar 2025 11:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1743274744; x=1743879544; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPYp1tIDYUVmG1jKtZoKn7EM41zjGJk1MbWEUGYaSeM=;
        b=pgjYvtBqZWXsVfK5rE4tjCLl/IQukTopnf5VZNHdBLshEH1wRPe90HmA8wMdB0TJk8
         eZ124BCpvwFbKcsoBtcGn71NbbC3rI0UWWZgZV1Esttm/tpfEiLEBEzdv8BdlaWX5XxG
         cOm8sGrWzi03xtx7EhwtCscEhEwtUFT0ZhgqbXSJu3/9qyQDZF0CA1Yneb5r3M1erg0A
         9YeB73GFd3zzeqAIcCCIJDaKvvY+y7dn0en8X+FNfPJJsfuZsRpvBo/otS8Gg2Ja8RQo
         rYyI5coiaamrN+HMOmOLOZgw3ZpGuTtaj2Fs9cjk5FfAQYVY93SfHKLVE+5Ix36CZ8WA
         8VdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274744; x=1743879544;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPYp1tIDYUVmG1jKtZoKn7EM41zjGJk1MbWEUGYaSeM=;
        b=uPAz38O0L53zywNzDEmmGSXBh7Wr+eCoKfLfEWfO8dBV33vvuetU5BvQElA1EoeOgX
         r8C1DxYQhdEamrZw2xIZDYq26lMs2m31jhf7/uUMZRCO7IwVeVhkyiMCxTZy0c3QcmwY
         RqNYeSsX5APJ3JEmsrB9BT2HPIn+oVlpFfdiWbfr0ii4jwYrreGPYK6riB+6EEOqOOLe
         Lie2QSf5n6FNlXNYLLf2LErz9H/Ya6I9cL1viCs/PLCKKTQowrsnUct3ssmJpmdvyZ9G
         gRDkPsct6LFazGcVuPjQPnjQtXwhuOwGptKVQlTGTROMH+6JmNgkByr9sARDvoTAI1jH
         e9iQ==
X-Gm-Message-State: AOJu0YwVZ8GyBhV9DFfgHfhhH/DG5WrELVt2XjgZrT2fCSMFSbSV3XY1
	ClPyAZrNmKU/Y+oYKHv6pyQSjhX3A9xwqNT5RGUnyRSupw73C+qiRmoh3qPM7A7rz7grYzB3fZb
	pewW9TGiTWT4g50RD1px+cw5trJK/aSIYCScJ9A==
X-Gm-Gg: ASbGnctAaestVc57tN3OB2mu0EG3elRZRex+JQGPfCxlNUXuHSkfVHs9/iT2+5lbY4v
	fZIAO8QxL9QccFB0RGJrUVSBaV97XPSEzGhSkeQNNOVpi0XLlHzK0ja1kJc0HyUojr3A9/xPaaO
	NnaQfGEMPBrF06NTaRqfq9O5u2
X-Google-Smtp-Source: AGHT+IHRCY1XWJjPuIwEFpA58HAvAlRlxy+p79idAIlplfAZnBAgC94nP8kCccgPufZ882Cqed2gU6c7lHRjN4LKdWM=
X-Received: by 2002:a05:690c:d07:b0:6f9:a3c6:b2e4 with SMTP id
 00721157ae682-70257340a31mr53752647b3.37.1743274744700; Sat, 29 Mar 2025
 11:59:04 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Mar 2025 14:59:03 -0400
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Mar 2025 14:59:03 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Sat, 29 Mar 2025 14:59:03 -0400
X-Gm-Features: AQ5f1JqshpPHI2RUetUZN4KoLpAtStId52O1O-eQWRArheTMT4Vckcwdqk7cNC4
Message-ID: <CACo-S-3OLobbxyggYZhetEE_bfdBwZkUsAGqEoZ1eUkoUQFALg@mail.gmail.com>
Subject: [REGRESSION] mainline/master: (build) 'uuid/uuid.h' file not found in
 usr/include/cxl/features.hdrtest (...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com, 
	shreeya.patel@collabora.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on mainline/master:

---
 'uuid/uuid.h' file not found in usr/include/cxl/features.hdrtest
(usr/include/cxl/features.h) [logspec:kbuild,kbuild.compiler.fatal
error]
---

- dashboard: https://d.kernelci.org/i/maestro:6b8da43ff8bc6bf9d93cc9cf86c3c5b5c5ab20a2
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  092e335082f22880207384ad736729c67d784665


Log excerpt:
=====================================================
./usr/include/cxl/features.h:11:10: fatal error: 'uuid/uuid.h' file not found
   11 | #include <uuid/uuid.h>
      |          ^~~~~~~~~~~~~
1 error generated.

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig on (arm64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:67e83b7667593f2aa03e5956

## x86_64_defconfig+allmodconfig on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:67e83b9067593f2aa03e5977


#kernelci issue maestro:6b8da43ff8bc6bf9d93cc9cf86c3c5b5c5ab20a2

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
