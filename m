Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADFA24677D
	for <regressions@lists.linux.dev>; Thu, 23 Oct 2025 05:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761199147; cv=none; b=SFTnbuLaSR+4cPV/WFjGEqZqxQV5qtavpAy2XvSirtX72uivJNuZ4lWJHEo8hn8XL496ttORilC77LMNlshUFY+xJHqhy1M00AMIv4GmP2hOUV7Z5yy6u5k0UwQ6I6dKsbJ/vJKJ23sz0Gr2Rn/SMkHyq8ffIugy4rchXXkRnxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761199147; c=relaxed/simple;
	bh=6qVv0hqjVVa2EuvCRKEFgPgndZnPGApPEW0Q+ZDT7nQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=OiRxE3SDOnOjHEh7WDm7BMimehThIpXvieD8hhAVyDJ1FNZClBkpImaCRJE1vOdkG5a1MPw7HLpVsqL91NUT07ICN9zqXJvtfuCjraQyXLHi4QJEAbw0KOqhgQmC1WDakH6s+hdBoEECQ+xfewtwsE+Q7yGmfa/jA0D8rDWYHbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=kuKnHQqE; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="kuKnHQqE"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-33255011eafso482666a91.1
        for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 22:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1761199145; x=1761803945; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5c3ggub3azVi2UUDrzH85P1fZp3UlOHvzKmdXlEy0lI=;
        b=kuKnHQqE6Ys9QE+ou9tAVhYHVW0oY8BFx4HutQpoPeLr7h5fuEet0MsG0o5qg58ZoL
         VH2NSgC3QX66j2Qs1m61dqWP/T2NWbkb79wBcBI/lXz3CiRxxT5zYQb3psgjJ6CZ7KzX
         x+ukHiNvrecqXPYDTXzcN5szenl+RKR90lMlXXIsHxlkvRi9Cbgaf/75oLzAau59lvQR
         oM1hYuse87E/9l1Nh9Yfy0JWlsJJXARPES7aLZUC/xz2zl5tkbL8gSwbQdF2u0mgijS2
         ZefPwKIwFZr2USkoaMrqi4Tr+pulanwvea519t7697Y/3CAVFOVcntSUsOm73pplfY0U
         DqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761199145; x=1761803945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5c3ggub3azVi2UUDrzH85P1fZp3UlOHvzKmdXlEy0lI=;
        b=W+3JfASzmGW9ei9TlNPxwCjm9K7cCtXdTuCZ/Qgz1oc9ZdgBK1vz9tINkEJKFnDFyl
         34AKCjIx46Re7mmm0VtUQqILDL8yW/hgb4L2dmglY1LRO7kXUJl8daVkKZ2EIdXqGNEN
         tnNs27UfNMPiz0PNjvvsszVsikTl863ObtEdXRUERdck8X93n0xF4t7CSH3Bmw1KjPJo
         pCciV/nUfIIXfTSfYo4GpLubkz5GiHAXCtFV8ymGnxezgvYYpqrg4SF/WhpLIuIL3t7n
         4IPIOsT+Nh0Fh3/ZB/LlwQ2aiWvfl91xDqCeu5AF5HDxlEqLYmFj7tPlerUKh2TD+v3T
         rs6A==
X-Gm-Message-State: AOJu0YwViEdhuvdw+owUquiB/o7jQJS66XRamGFXjqVTTIIuxM112r7a
	WNSgr8A/27KH2T8YJ1bsZ3f8Zf0CGLUrTPIm85VwNcj1JEMXUEFlYxnSGn+a7NZCLFQ=
X-Gm-Gg: ASbGnctOEe+PZw/Xx6MP2cs/KRB3O0Rjce8AMelMmB0YDu6ag9ABK1nq80ZlnpKo6GG
	Co7gAeE4LvdKNe6IRsyob01l1WNsbTOxYIW4o/G7zYBUykL/J/6jbUXvYhGsfqHX3THPe4iA6wG
	jH6BXN66Lde+cHAhx25RgsEfvFCIsGnh/DLDpbA3VrFGzc8ZJ7rzPkXvaapQhexcuPgcJrhBDjs
	BEnHVgNstgtZ0hhT/JGuXLlfitBYPYqT72tYEmB75ur3pkcELNkuum9iq2hj+AxWNk5Erk6K95s
	vyiFu/Zy2lbHsrFT36uO5ChSRx5XtADuO2qyMXuzgGbI8lX8pMyNtWODX/hBOWy70D0WG3MpnB0
	GuRBPDOvxgyJfHazWaoIT6ejjeAUyZ7mZGueynG5yqkt73wbVnUxVuZd0nVVxcHaCSPHgPw==
X-Google-Smtp-Source: AGHT+IG56nXu1ZMDM659NRev5dAktSS/wI8ALooe+1OPqyY8UqZDIiJv2GB4aL3AChwewJKa4mMaEQ==
X-Received: by 2002:a17:90b:48c6:b0:32e:59ef:f403 with SMTP id 98e67ed59e1d1-33bcf8e95c3mr31820285a91.17.1761199145115;
        Wed, 22 Oct 2025 22:59:05 -0700 (PDT)
Received: from 15dd6324cc71 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb0144c55sm1167195a91.10.2025.10.22.22.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 22:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) cannot jump from this goto
 statement to its
 label in drivers/opp/o...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 23 Oct 2025 05:59:04 -0000
Message-ID: <176119914391.5792.9020817346274859760@15dd6324cc71>





Hello,

New build issue found on next/master:

---
 cannot jump from this goto statement to its label in drivers/opp/of.o (drivers/opp/of.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:992b985637471b20dfed6cb78dc938315a3ba8b6
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  efb26a23ed5f5dc3554886ab398f559dcb1de96b
- tags: next-20251023


Log excerpt:
=====================================================
drivers/opp/of.c:1545:3: error: cannot jump from this goto statement to its label
 1545 |                 goto register_em;
      |                 ^
drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
 1548 |         struct device_node *np __free(device_node) = of_node_get(dev->of_node);
      |                             ^
drivers/opp/of.c:1539:3: error: cannot jump from this goto statement to its label
 1539 |                 goto failed;
      |                 ^
drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
 1548 |         struct device_node *np __free(device_node) = of_node_get(dev->of_node);
      |                             ^
drivers/opp/of.c:1533:3: error: cannot jump from this goto statement to its label
 1533 |                 goto failed;
      |                 ^
drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
 1548 |         struct device_node *np __free(device_node) = of_node_get(dev->of_node);
      |                             ^
3 errors generated.

=====================================================


# Builds where the incident occurred:

## defconfig+CONFIG_ARM64_64K_PAGES=y on (arm64):
- compiler: clang-17
- config: https://files.kernelci.org/kbuild-clang-17-arm64-mainline-64K_PAGES-68f9a84f9533132a189903f3/.config
- dashboard: https://d.kernelci.org/build/maestro:68f9a84f9533132a189903f3

## multi_v5_defconfig on (arm):
- compiler: clang-17
- config: https://files.kernelci.org/kbuild-clang-17-arm-mainline-multi_v5-68f9a85f9533132a18990405/.config
- dashboard: https://d.kernelci.org/build/maestro:68f9a85f9533132a18990405


#kernelci issue maestro:992b985637471b20dfed6cb78dc938315a3ba8b6

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
