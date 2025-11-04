Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101542DA765
	for <regressions@lists.linux.dev>; Tue,  4 Nov 2025 10:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762253948; cv=none; b=guAi4iIuNGI3Kt+S9RDrkKShbOo3TM1wFviT+tb9KryqRzF1m0EpUnXSH5Owr936tRrVSIUkf/5ND/VU0wATQZnL5eusZeYf17ZbpP98uttg2nN6hgym2fJq6fZaFJO4j+/l2KQwbpijAQkCElKdGDRCFlB+a/3re+TpZsFvCX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762253948; c=relaxed/simple;
	bh=b+246kCIKvKViZgcnKIa/bCv41vBI8eLjv6Ot7c0OWA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=olYKH/tF8N4nTjumfN8kStu3LUkRCMYJp8gXnCRlJLcxe4pmqFOS38v4NMS6nBkygIgEQpEnKKNsb1Y8T8toYB1ShRUMm5VxBoDmEkzCXi/PN0wlwZ6EpA9mBA3PEFo299EBuz3fGeNv3RPxDwF7PGwPXvqgySZ+IQmuLayA5zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=vTFgH0cU; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="vTFgH0cU"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so5047807b3a.2
        for <regressions@lists.linux.dev>; Tue, 04 Nov 2025 02:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1762253946; x=1762858746; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38YtYLLXIxSpGhW1o6dKhYtk6nEpigDTCqSUXy4bhvc=;
        b=vTFgH0cUdhP81oebgKf7HiwLP0GXIX+15nKBMkjF0RolrF2+q4Lc6sW2uIKPL2K8oQ
         IWsQJROxFkrJwS7poA7SGdISxrW5GImlzg/Jrx5mwo0YItXZ4Cv9hxVeyDZF23u3+FJd
         LL0HeeYya9OMykRiXC75hCeDTZms9mK00xfux1mosZLneIXvLOadxahkrucqjd9pvciS
         JRgt7XMg4HGDbYc9ta58vpHo0UIBWd3EwQnmQ7DOXcu6/KlQarcl0Ljnb8i0naYF/lWu
         4EZZfP2VKAEgN7gq5QIrTVzP0vQD2NlfNnCtyU0CWx7tZ9vI3+z2j+1NqYgLrMc3Lcod
         RTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762253946; x=1762858746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=38YtYLLXIxSpGhW1o6dKhYtk6nEpigDTCqSUXy4bhvc=;
        b=vtjkc1nJMLZG01nR9gzdxFrxa0x1eVDWMBDUexdQjAjxCH7rt163YWUgGdtW2SCA12
         /r0g1v1Z67SFZazTgummwJSvTTolgAd+Fj7+gpXB/Fdop6e2pCuKqoVGaSF9jDVJ90g7
         bwaomKpJbJB9ky4prlox2QloWJzJS8o+kLJGcV+068ATY104S79ZmvYOaCQd6d7gBHzZ
         GzKzfYFVsuD4zr3WYzSCwan6NSYVlkCtmV7b4IOaex5rXFBGo4yt3a2+cLuTFTbZ/DRN
         DVAGtwJ+NGIO3DR4IeALGA4GwtKabR48Sd+aB65bfQCvIoKz5f9UUIzP2Y7ezP7QtRFA
         V4Tw==
X-Gm-Message-State: AOJu0Yz3sqg4DsxseBVaGvLOvbj+dpZRA67Szd5oqyzlfuR2+GhHcQqx
	AkaEEZm8Pe3s8kYhTLO54Gww3UCzOzxZPd3zcE9rmzxWP9UWZKlV0LpEELh+QXDY8g5v7hIiJ0Y
	MLHnG
X-Gm-Gg: ASbGncuRldU06/HAH9ifgByz+GgzRBG4kGz7nLwzsZekddbfVm/buMgrK4hHFYRTOq4
	NSVgR/eEa0w+cJp6bd/4bG0jTQw3i5WEOKYncDe8TWOaZhlEUevDX3QFaPjDYYtXGw1iZVV1LeB
	9ydJvpDMMRaoMTdnVAMf+OGS7YSYZM63/wBe9qF/LZtldaRoGb9kfzCq0dG05wN+JNUvuiXEV+S
	12cobqjDtynXgAb+qWa+wDQ3K30RPFtZpARZPnfD8XwkmLWT/R1y4pCKrA7xnZqYqArDoadbCjQ
	AIvX/IdXwxvYiWoVUQ9fduBQr6YlnP8/qVV7wdrp6zxX2cTgjePitj3tO6GGhkp7UaK11WqAySx
	zB/Bm3gAi67mO6xWg90t79VyfsoR7c4kvCHJvuBjEBmHUSey5kWLlJ5EacqrGm/8WuKLxUA==
X-Google-Smtp-Source: AGHT+IEaCW8CR//NAOXHmykFLAmExRAqALUUcQz5Er/GWgJL6rRlZHEieutLRypaa4365FPi0ATBJA==
X-Received: by 2002:a05:6a00:9291:b0:7ad:11c9:d643 with SMTP id d2e1a72fcca58-7ad11c9d81amr2344243b3a.21.1762253946228;
        Tue, 04 Nov 2025 02:59:06 -0800 (PST)
Received: from efdf33580483 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd6a15af3sm2537224b3a.69.2025.11.04.02.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 02:59:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) call to undeclared function
 'topology_core_has_smt'; ISO C99 and l...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 04 Nov 2025 10:59:05 -0000
Message-ID: <176225394505.3644.7188826232555976435@efdf33580483>





Hello,

New build issue found on next/master:

---
 call to undeclared function 'topology_core_has_smt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration] in drivers/perf/arm_pmu.o (drivers/perf/arm_pmu.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:998dc5815603ae4cd3767a506a6f94b75d982ffc
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  17490bd0527f59d841168457b245581f314b5fa0
- tags: next-20251104


Log excerpt:
=====================================================
drivers/perf/arm_pmu.c:935:17: error: call to undeclared function 'topology_core_has_smt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  935 |         pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
      |                        ^
1 error generated.

=====================================================


# Builds where the incident occurred:

## aspeed_g5_defconfig on (arm):
- compiler: clang-17
- config: https://files.kernelci.org/kbuild-clang-17-arm-mainline-aspeed_g5-6909cacaf21f07610dca06ab/.config
- dashboard: https://d.kernelci.org/build/maestro:6909cacaf21f07610dca06ab

## multi_v5_defconfig on (arm):
- compiler: clang-17
- config: https://files.kernelci.org/kbuild-clang-17-arm-mainline-multi_v5-6909cacef21f07610dca06c7/.config
- dashboard: https://d.kernelci.org/build/maestro:6909cacef21f07610dca06c7


#kernelci issue maestro:998dc5815603ae4cd3767a506a6f94b75d982ffc

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
