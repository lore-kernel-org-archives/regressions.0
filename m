Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DCF361640
	for <regressions@lists.linux.dev>; Fri, 21 Aug 2026 21:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787349548; cv=none; b=fpYPy6kCC/Ea9gs0p0ywaqUbda3b0oyFEagEax7RJ1xlV+fk//fvA2JDd4uqof7+unu7ShDSHFbEnR6MyKIcFEREDfcjzrZUA8wQRJJYD74WnzeanMQd3/i4pvjB90fAhUUQaC5kfs7MjqBpMEhnTzMZCepStsshePQ7oS0jdPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787349548; c=relaxed/simple;
	bh=0CDoP9otbRXUTWbgpMqFnl8C6LSEjQYIsTNOGvTCH8U=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=qy4T4EM+0KlbGh3MQl2kyyVAesLppTNYMPwX4n7tRTvMDB8VntfZT7p2YN0ze2yrK4nFDjwjWroP4X0vhQzKdsHDLSOU7R9o0oLE9zka/QRBT1gXT+6cajvT6qwW4oC6wEFo+3whYslw/kxHuwatoDbwvn78Kl8tJ4FbLT1dbAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=B4fLUctx; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="B4fLUctx"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1706769a91.3
        for <regressions@lists.linux.dev>; Fri, 21 Aug 2026 14:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1787349546; x=1787954346; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WWEPDVbS09IAAU3vGVSvzfO1yiskEs3b5/nqJ6aL3Kc=;
        b=B4fLUctx9fvyEQ1qvz/VIyvEQAZltXySZEkNOijfO3UbfsH2hrzbhQyYXG2NPlLInj
         d44XklV5t9nYCYFrogfG1m6l5mmJzEn0ihwxFoqQXxB+9NUCCOi20UPA3E05SDZy9NU5
         ZTrukCKAZEpY6WyNAhSaEw6wzmE+1PfOpUGkZ3ERfNXOH6SW5cUGJhW3gJIhjHZ1OQay
         PXH1ABUWX8biO6ZUApf8WCif9Q2HXfBhJ1Qu3R9EahdYAW7VreDk4Y2xZ6Tax4KpylBt
         55dIJv/u3tu/coC3vx1tReK5Nm2rVrZCUusR4heTOfUhxeXwP3t48HLJWfw+ZdsGCM3n
         mT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787349546; x=1787954346;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWEPDVbS09IAAU3vGVSvzfO1yiskEs3b5/nqJ6aL3Kc=;
        b=lDHvsbE/5WIaqZw863G3cjAXPC3bKRhzFT8Bo5SgXBr85OYVd3EbijP5ROfSjhGRoS
         s9k45Sa3/HRTeWCXv3QSw6FF4hOl3Q1iUoaRXdCWHBVmfozZpA7kGLrO4KdhFtwdx5E+
         vcy1Mhdch11HhQJxPuSY7ORfdbIQBLcPPvLq+S8V3TWtv9w1B0t0UlOAyZPNwy0ZBArH
         SVzcic+K4Jvkig3mMehK8y6wyLinIP7KOE0xJzP+fxa5uEgDAlGP7mYkb5UW5lv99WcW
         I0X4xvZpm93kzb4mC+15r1egNxvADp5cy0xI9VJeRadGVnL4FMWiZxNac26sLHkxjz4m
         YTwA==
X-Gm-Message-State: AFuF++nSMUOCF25qjAeX2rzM1WBLxBOtn57rp8kufQE2a+B/cSz8W5mU
	+Z25CFEq7VGrAuz3UERjaUC7IVRcza3MT2iEtqAQLx4nOObSqSW773cfgSrD7jZt3YQ=
X-Gm-Gg: AR+sD13/PeBJvPPAGr7spY/UwQjZzvqWELWvwcUYFaBxKS5Cwt3nYTpp29HrQnTKJgY
	DdE5zMzrqByWfUqxsDhUF7N5hWi8kSbmPzYWvmASaQknnbhDMkbDX1NntCwWgxe9J5ySu/wEZiq
	53HtUsLtfmFXLeqTpZ0Xs1NzC1skh9otbkdDFQjtbLPzPEg3ZDMLNfC/zKXKzQ7s0hauw/+CeBp
	gor7jiKhvXV0fKmvjl5vxQcL3Ycs8FuztCO7uTSUzPZWR4yVmr9YeS+e5rgKi9JWnrE3c6CovOF
	uwN2TW/IkTWGA+LBK2zRMoJiIvpHXL7PSLEZPs1EhXtRBEu2jCGzI3mdBeCeeiVEx4tXeXnhWB9
	90YQtWRAz1UOrH8iHovq9J3HYUYv9K8J2rynpj1XXoIK7XmvGocWwipfEYeRbP0Qto4JrBrJQSd
	Qz1Bio6P7/ud3rPVe5NuY2buZR6S9/FPnQi+4xfwk+3PgIqnbH9BUV
X-Received: by 2002:a17:90b:3d87:b0:38f:837e:fc5d with SMTP id 98e67ed59e1d1-395c334050emr18006764a91.3.1787349545918;
        Fri, 21 Aug 2026 14:59:05 -0700 (PDT)
Received: from b455de3d9de8 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860ef75esm1273283c88.7.2026.08.21.14.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) format specifies type 'unsigned
 long'
 but the argument has type 's...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 21 Aug 2026 21:59:05 -0000
Message-ID: <178734954411.1392.5288442696836266032@kernelci.org>

New build issue found on mainline/master:

---
 format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Werror,-Wformat] in drivers/scsi/qla2xxx/qla_init.o (drivers/scsi/qla2xxx/qla_init.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/drivers/scsi/qla2xxx/qla_init.c:9274:8: error: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Werror,-Wformat]
 9272 |                             "TIM section too large (0x%x bytes, ring 0x%lx bytes).\n",
      |                                                                        ~~~
      |                                                                        %zx
 9273 |                             section_size,
 9274 |                             req->length * qla_req_entry_size(ha));
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178734954411.1392.5288442696836266032@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:9274a530ad4b4e77d62f06dda043eb5f78480880
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  2be02a7c996aa733bb36e29e07715621b0de9736

# Builds where the incident occurred:

## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a88aab962f33761c0ff06bd

#regzbot introduced: 531ed942bb0df04f6747983fecdedce76a22d07f..2be02a7c996aa733bb36e29e07715621b0de9736
#regzbot link: https://d.kernelci.org/i/maestro:9274a530ad4b4e77d62f06dda043eb5f78480880

#kernelci issue maestro:9274a530ad4b4e77d62f06dda043eb5f78480880

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
