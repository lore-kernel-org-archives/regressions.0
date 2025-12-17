Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554B12222AC
	for <regressions@lists.linux.dev>; Wed, 17 Dec 2025 04:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765947546; cv=none; b=EY2/WWIOOMNPHMdKSPtzQgmQc4H+zrbxi2aDe8rdGTwRh57UadT+4nF5hn4fNEk9UAPO6FrdV8ZPDyaaHmn6j4VaXhG0MKiDX9qjK854vSACi8WMMLu2A+vDMQEBOAnnV6aSVyz0jhK4IwuQ91YcffDodc8KZ9nsSq7IXHv3nb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765947546; c=relaxed/simple;
	bh=TvVUk9RU3wMPojtGz9gI2F6Exdynrzhm5cNgKtmnXfU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Icv1LqTJSQiUokeuxAgOWje7dhv/qtzcCV4juKEs93VPLx5tuEtGuBe6vaPpndGrG4xUvbJTWk/anaeBNZdxMsf0etaJykjAg/2nvw/AQ8YJXmMs12MfcCxIteqoYL5J0DeowOAol/X4BQgymmMtwHhLGKQKOrD6kkHnI36cXLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=L/ZScDw7; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="L/ZScDw7"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a0a33d0585so34882385ad.1
        for <regressions@lists.linux.dev>; Tue, 16 Dec 2025 20:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1765947544; x=1766552344; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9c0+Re7+nmzL123Nd/18b1ozs1pAde1wA4JRu7yvR10=;
        b=L/ZScDw7wLHrB6k14SPjY63JKdKAUT+p8AY2PZkGT2xlmLDHF1eH6C9tSPbzMw06tD
         ROTdnSHMJg2J8NPyq3dy5WEqopWlX2muGAYZUNMQJCO5k1XlyOGnrjUylytORMdjawMb
         zRa/3iFiVcJRCEResKt0lNym6LV37lxOz/tajvtzzhng3ZUPRsGckwfK6LxOfFP5Q6Wf
         UUsW50zxFRcJHOyi3Ch4Yp1escdHANg2l+QgSx/fXGu+/ExeF2wh3fPltc+5QU/wX6Ry
         xYaKUpsfe3uPuY55c9tKEfq/kpDpxub4mwxODMHV2UrFNWw9bRgR1KQrMyjsphFFaTvL
         +Fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765947544; x=1766552344;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9c0+Re7+nmzL123Nd/18b1ozs1pAde1wA4JRu7yvR10=;
        b=EhEIk0kDIwGSSknUOy4Eq9xlhrLRN8xDpA7oahbs5lcYs1RKly1AGrIPg1XDfaO9Ow
         J0KrLCi5/HSyDDp3OYmdwt4jX/zUae4W5egrf2sqj+4rk6KC0+FMJ9sFDTvMo1x6AKD8
         dAkwCfJ/pYOJelB3QneVPYAvBHSsr+TLdTtowaUn40kp5fmusJff57FCyRuF2ymx54Az
         XB5yKhuxF8XJ5AFmnOMWhb5F6D5YHm35EB+TwgpnST+6vztQ/XXx3sewA4FPP6j/dMHX
         xrtmP90l1IZ7Ktaw0NZ89cNkGYRGTxBQvhiRaDnW8vy6xb3jcfCAxxqUZGDAEi+W+Jql
         FP2w==
X-Gm-Message-State: AOJu0YxN3deopPevpPggRTWzdTJyAeFLJBKS3oTpSi+zzDZuRjne94Vw
	+0uWA56afHXNB4tP8wNffGQQ9h1g6Prmo8+RCS2haHa03Js6q19O42zH2AOzL2u1jrY=
X-Gm-Gg: AY/fxX5i5kTHeYJzHqSPGkVEnJW6T8XgdvzhjYa9wbzlJ3O4UQ4j6yhiOpTZONyb5jI
	D51JhX60L7CQR9/vlq3XP5ZTLwZO/j1qHKuPBt/w/++47ShKH2CTsMStnZX2vhZTJlpeOy3FHQo
	oPQU8Zib0CL2lwXIrWpxg4fgnl6z1t2jFKmcLQkdtwA91a/a5cGDRTJXOSpPybzSNZhmBYfQQwp
	opn5EtZbwwUUYOv4Nh83cAmGMcEeNJSPkdnFsfcROrCBRE/jvAUbUneYosyiSq0A3/FnbybmgS1
	GBxlhRJ6RACNDfSPkgwG4x0cRlh+XSpEeDoCmxZNDDunHSdxDwj/WTlf585FE+POdvfi1m01MDl
	f+HIsFf2WJDeQ8iOF2F9KlbS60kPMZs0R/S4Fo09qzljnT0+MjmSIsafww1Q1iLVdrjwNYP4mbA
	wNC0K9
X-Google-Smtp-Source: AGHT+IH6VpFR/3Ntxcu6zNLF5hnaIJrCbf60OJ1jAgAjbnlyPmiP2yoJyGrEoCH3ka/KRdf6FkN4jA==
X-Received: by 2002:a05:701a:ca07:b0:11b:95fe:beed with SMTP id a92af1059eb24-11f34c10dd6mr11842918c88.38.1765947544454;
        Tue, 16 Dec 2025 20:59:04 -0800 (PST)
Received: from 77bfb67944a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e30b799sm58102698c88.17.2025.12.16.20.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 20:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?q?=5BREGRESSION=5D_next/master=3A_=28build=29_initialization_of_?=
 =?utf-8?q?=E2=80=98int_=28*=29=28void_*=29=E2=80=99_from_incompatible_point?=
 =?utf-8?q?er_type=2E=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 17 Dec 2025 04:59:03 -0000
Message-ID: <176594754327.3108.9546235188357594114@77bfb67944a2>





Hello,

New build issue found on next/master:

---
 initialization of ‘int (*)(void *)’ from incompatible pointer type ‘int (*)(void)’ [-Wincompatible-pointer-types] in drivers/irqchip/irq-riscv-aplic-main.o (drivers/irqchip/irq-riscv-aplic-main.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:c537d0d22aa608b88bb407d6e02b6a733d3f78cf
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  12b95d29eb979e5c4f4f31bb05817bc935c52050
- tags: next-20251217

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
drivers/irqchip/irq-riscv-aplic-main.c:111:20: error: initialization of ‘int (*)(void *)’ from incompatible pointer type ‘int (*)(void)’ [-Wincompatible-pointer-types]
  111 |         .suspend = aplic_syscore_suspend,
      |                    ^~~~~~~~~~~~~~~~~~~~~
drivers/irqchip/irq-riscv-aplic-main.c:111:20: note: (near initialization for ‘aplic_syscore_ops.suspend’)
drivers/irqchip/irq-riscv-aplic-main.c:112:19: error: initialization of ‘void (*)(void *)’ from incompatible pointer type ‘void (*)(void)’ [-Wincompatible-pointer-types]
  112 |         .resume = aplic_syscore_resume,
      |                   ^~~~~~~~~~~~~~~~~~~~
drivers/irqchip/irq-riscv-aplic-main.c:112:19: note: (near initialization for ‘aplic_syscore_ops.resume’)
drivers/irqchip/irq-riscv-aplic-main.c: In function ‘aplic_probe’:
drivers/irqchip/irq-riscv-aplic-main.c:375:17: error: implicit declaration of function ‘register_syscore_ops’; did you mean ‘register_syscore’? [-Wimplicit-function-declaration]
  375 |                 register_syscore_ops(&aplic_syscore_ops);
      |                 ^~~~~~~~~~~~~~~~~~~~
      |                 register_syscore

=====================================================


# Builds where the incident occurred:

## defconfig on (riscv):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-riscv-build-only-69422a0bcbfd84c3cdbdaaa0/.config
- dashboard: https://d.kernelci.org/build/maestro:69422a0bcbfd84c3cdbdaaa0


#kernelci issue maestro:c537d0d22aa608b88bb407d6e02b6a733d3f78cf

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
