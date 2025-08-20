Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B38623F417
	for <regressions@lists.linux.dev>; Wed, 20 Aug 2025 04:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755665947; cv=none; b=DxWsIGATzjCZYdMdx3+6VhYKjXolQ4zEodf3hR0GdRJEPQMM4u298wfqpLUTTB2KzzO6TYz7NDh4BUB8Y5LM6rGdS0Qq6msgoNC/yv9cg1LWkaeH3C9YsxN8USltz/or5FmpT0FoT4S3ajWIhxIzDT35t4LWu8BhMuhfARjRxVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755665947; c=relaxed/simple;
	bh=WUYaRARHPoTsc+YvcIogF4jFSzCJSoFP7BpyqoKoIDs=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=u+0RStGG6abvv7hYW9nz/mqifbDJ7RjKtHj65Pg2YIDR2zwrQOzWr6G6whtdqAaOLGADbRjtYAZR+cRP7GyWU4BSA2UO6qfSxgP4h6raL2bQmFotpkjP7q5bCHADgJoE1o30J8bHD2ZTxGmBFyCNJeWndPdI9OL+YzFpnVMP7ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=fwSqylsq; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="fwSqylsq"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e2e60433eso4592820b3a.0
        for <regressions@lists.linux.dev>; Tue, 19 Aug 2025 21:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755665945; x=1756270745; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tfSfoKsMXdz5GgfCAfo9Rn8Uanh9Sc5p+w5Pwiwef4=;
        b=fwSqylsqpv/kVcx6viUHpB2OusAnlouD0YTFFMTW0IIiM3SL39qp8ogU+6ukV8vPPp
         ld64/QNzgsAy2D47oXaZyu446TgzVAKfzOrmiMUrIjWZM99XSA+xan7lU4dz16jrTURF
         5JcllSbT3q2mqG1FK5xIyFL7IL0w8SLsOplygl72p0HS7b3feFkAAkEihJbnYyP96dXs
         11D7DqW28osBHQZ+IqrllSxXa1jqPXU8+lXzq6xbKW+0fjS9wIX7sNc5akE2VXAIOhY5
         9QoUwKchOjNzxt3H0doV+Ot6USSblv7dB1mqHuwKQBNpOmxJLwSDq2z/A1HcicUPbcc/
         0BqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755665945; x=1756270745;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4tfSfoKsMXdz5GgfCAfo9Rn8Uanh9Sc5p+w5Pwiwef4=;
        b=o/C5ZZsOkTxVN+hO7wqwFgfFagdzR8+tJyfNf4SyefB39CxsNBOIockQtmxruILvSN
         tTKpUvEDM57I//o4Z+q9OugJgVj4xEdpCUBriZo7xlRKv53CfnqoH7mrmv6MfW88qi4Y
         qcdaFhCBpOHptCHjuXUIRy66Yv/UQUOS5JkmMss33Q9PnlWHnYp+aAeSUrqcr2SdqPSq
         UzHFLaUlKADSH9K6H5r0Ka+zvLHcVsn9JAiAP1G6QfyDE3HvTkFl9b1lueH6VLqYlHQo
         757nZ8GeiWtwJeDBR5HBs0VAd/5SWo0nuxj19ogYLlm97nU4yBn+ZGWL/gDyl1n17c/2
         TrnQ==
X-Gm-Message-State: AOJu0Yzmj18kkNGHLTO5WHAbPwc13iNMh+dd448d+QiM69f/ccU/dqxl
	LicESngR5+rbJzY7c0GpWNrRNAsuqlkeBRXdZ9T2b5m+JsdL2LPZl6ISzTSGmYUfp5U=
X-Gm-Gg: ASbGnctqF8Sj1W0sHAcvCUm4IE8agryXjh5SoOA/IqH83qrDiUyA/L7Q4JVtoWWTFXd
	1+iENgB7Q1rdPoH46p9r981bq8AFTYX/CW0jAmV0psh/rxBcoefRO01Mw1wyqy+94Auovv+pwJw
	d2IRNTAG7Qi5aReHGK7c+X1Yeb5NC+74jX6kXw4vvT9wJlE11HMNl8NyFJbeko1YMkK5JhzXvPh
	Nxf6lgDK+u9dDd4ELG79v19S4q/c2mQcR4NHNEWqq+RZoG75h0/iLkxc3m2gY2mlUJ+rY5b8qk/
	VTRDQ05o5zEDzc0iVQQWkTPTkF1ahcf24w6s+m+OMVYgloyqaxP34Ro/tjujJTFovcjw7hNsPMl
	JJz68p15PFjx31TBtQdb+Z2/Am38=
X-Google-Smtp-Source: AGHT+IH5n2CWjcSZOn0HA3+8ZPCriEB/bYPKg3/1z8xPjtu8D49wLyKlFGTXw6QYWCr80KS1RxTIVw==
X-Received: by 2002:a05:6300:210d:b0:23f:f659:a0ef with SMTP id adf61e73a8af0-2431b884c06mr2444023637.25.1755665945324;
        Tue, 19 Aug 2025 21:59:05 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d13d2b8sm4108122b3a.46.2025.08.19.21.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 21:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIOKAmHBpbm11eF9nZW5l?=
 =?utf-8?b?cmljX2dldF9mdW5jdGlvbl9jb3VudOKAmSB1bmRlY2xhcmVkIGhlcmUgKG5vdCBp?=
 =?utf-8?b?biBhIGZ1bmMuLi4=?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 20 Aug 2025 04:59:04 -0000
Message-ID: <175566594376.96.14788012312958235521@16ad3c994827>





Hello,

New build issue found on next/master:

---
 ‘pinmux_generic_get_function_count’ undeclared here (not in a function); did you mean ‘pinmux_generic_free_functions’? in drivers/pinctrl/qcom/pinctrl-msm.o (drivers/pinctrl/qcom/pinctrl-msm.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:4466df3c987ba2945eca05fcb2f3c22e97d8636a
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  5303936d609e09665deda94eaedf26a0e5c3a087
- tags: next-20250820


Log excerpt:
=====================================================
drivers/pinctrl/qcom/pinctrl-msm.c:265:35: error: ‘pinmux_generic_get_function_count’ undeclared here (not in a function); did you mean ‘pinmux_generic_free_functions’?
  265 |         .get_functions_count    = pinmux_generic_get_function_count,
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                   pinmux_generic_free_functions
  CC      crypto/lskcipher.o
drivers/pinctrl/qcom/pinctrl-msm.c:266:35: error: ‘pinmux_generic_get_function_name’ undeclared here (not in a function); did you mean ‘pinmux_generic_free_functions’?
  266 |         .get_function_name      = pinmux_generic_get_function_name,
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                   pinmux_generic_free_functions
drivers/pinctrl/qcom/pinctrl-msm.c:267:35: error: ‘pinmux_generic_get_function_groups’ undeclared here (not in a function); did you mean ‘pinmux_generic_free_functions’?
  267 |         .get_function_groups    = pinmux_generic_get_function_groups,
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                   pinmux_generic_free_functions
drivers/pinctrl/qcom/pinctrl-msm.c: In function ‘msm_pinctrl_probe’:
drivers/pinctrl/qcom/pinctrl-msm.c:1587:23: error: implicit declaration of function ‘pinmux_generic_add_pinfunction’; did you mean ‘pinmux_generic_free_functions’? [-Werror=implicit-function-declaration]
 1587 |                 ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                       pinmux_generic_free_functions
cc1: all warnings being treated as errors

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.6/arm64/chromiumos-qualcomm.flavour.config+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68a55241233e484a3fa286f1


#kernelci issue maestro:4466df3c987ba2945eca05fcb2f3c22e97d8636a

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
