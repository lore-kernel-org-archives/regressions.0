Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E1F353EF3
	for <regressions@lists.linux.dev>; Wed, 28 Jan 2026 12:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605149; cv=none; b=D3NfTgnAYkPdkTHmCkf5pMhHoqG/XmmQKg4QFLhAC+hpG6NEj6vuo4QP6/Xuo1wzTuTcVfiK7+Qi89C0W9r6GSS/5C80YQpcZuG0bxk6nGpcEcDs+PA8IhQhuLBb9fJXZsbssP0dtEstXPdiJ1YL+xZRQN2/T55bwsbvpzIrZvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605149; c=relaxed/simple;
	bh=hYTN6x2CzNg+OcWx9A7f7Mclg6facCaDFJJF7F0Gy8M=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=L2+Xk8gtrqrhxewCKxzdbIHmmYV3Gl7AtScMrKQ+JI7APnDjSoc9xb6aYM4gF9OH/2++vkDr/teaUYe8TyHLPFNoD7txGB+fSv8Znp3v66ek7wTLu5ToQgS/PRHyeLUPt+Jr93+Lbb07xst0y/nPhXa+dZB9kwcTbvF5he+KYTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=C9KKbl10; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="C9KKbl10"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-124a635476fso2222781c88.0
        for <regressions@lists.linux.dev>; Wed, 28 Jan 2026 04:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769605146; x=1770209946; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCggTXK7JIKSfBDUO+yl+DUgOLIMqwfFmjiwcYlX4qk=;
        b=C9KKbl10iwy1LRqhmq6uoxUnTH6iux8h/hHk+u+Fx+dH25sC3wl4aJpw83c3SePAS7
         +0Y2Q2Zl+jaKfOEdC5HBLg84Ip2llWmJDCh25wxr+Q/jg7FB/2Cbq5ntpPa8hdCcTy+O
         rnTSOLMcAQARwO7qyNigCLptmkbTa8dhJ5JPrOnEFC6nPOZ9LqTeckLHnW/bxMOPNoLh
         x7PryG32dmSVZ5w3if4YIXA7VHlYkSH9rEXb8RxTSF1lZcsMl5iMe6F2PpHJWcenI+hx
         2jpQx6I6OP6Df48O2tOYR+14JYWUHLooVuKabmG7gEsK5VwWsUjLWCHsnnR3L/rkuT5l
         yjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605146; x=1770209946;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mCggTXK7JIKSfBDUO+yl+DUgOLIMqwfFmjiwcYlX4qk=;
        b=s9ndV0YsZj5t8MTj4K0DLxhe6TIBEdM55FsweuxyUC/38kdeyfvVxgsrlf1Uq/sn7n
         MIZWmAKs8zisRaxO+ZT0Ss4IQPkmC+tc0BrBSQZyQoNHvFaqd/U1oluSABEIqpVjEzvu
         LLU7CCDcC4EqqyygOt1RScxPT5zXtFmOQQlyTMmo0p7HF+NlI+QIu+06H7lHP0dLKpGj
         Fsd22qneUfFXYekBuqC0Pm4xodQvlLM988osrsokZqIsohk1ZdgXn53OWo0eZgAMMEAj
         0wg7HXD/SlFhuxaAkqwI31U5zFj2Dz+E2eiPWyQTxE3vos5VgaiymCcqFYoZI8vPuwAP
         MN+A==
X-Gm-Message-State: AOJu0YwG7v6bs2Xkm3tpnTROgaMqHYBCEmZqv/tOFfFWxif4mCfvNu7l
	2ltcCysM4iqpVGhhCLphlrwZxEz75aMnENXG8Ni/E/2Ps4gnxbFlYbDzxT291fXcyqQ=
X-Gm-Gg: AZuq6aKle+j907HFsX/e3+c1cDrwhsuOm/YJJpLbps2KDNu1uqwPrBxCkE6QmqUTKKW
	MOuOoVgNC8iKDJm1FLkP/J2HE+vhAd/DRkb3EKzH2udGKzZ/SPT0zT/oBooIkv5WgGoR8TSyP49
	tiUmwDQ4t+M1aop1qz6QlJF6l8MA9fIHQrI6VtrlEf+0aa7ArfjNj4fP4LZB+9wHe8i9+zBRN7D
	U70Fw7JF7CWnQr4Rlwu/q58uQGX6emP2Y5RcOMGwSTC7q/BPhYIroYboE0lTz9ABuWJLbPRi7e4
	1fNl6KKaCCo1mRXxP0dPc0yy55sHzklD5bnDHXnWAsDA0HoFrm1/+jBd9+RBMwAzlLF95KeQCI9
	Bsfw3pw9Z2oKTFZenqNoHNrBAWtRn8JJBJe3e6b4uZmqNIqKkmpMFvPVWouETwgMTy5BUld99KL
	TR4Fnv
X-Received: by 2002:a05:7022:e2a:b0:123:2ee9:d1b3 with SMTP id a92af1059eb24-124a008b0f3mr3025787c88.2.1769605145521;
        Wed, 28 Jan 2026 04:59:05 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ef3b3sm2450605eec.12.2026.01.28.04.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:59:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIG5leHQvcGVuZGluZy1maXhlczogKGJ1aWxkKSAuL2luY2x1?=
 =?utf-8?b?ZGUvbGludXgvY21hLmg6NjM6MTM6IGVycm9yOiDigJhjbWFfc2tpcF9kdF9kZWZh?=
 =?utf-8?b?dWx0X3Jlc2VydmVkXy4uLg==?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 28 Jan 2026 12:59:04 -0000
Message-ID: <176960514428.3654.593941965169897463@22d5995788c3>





Hello,

New build issue found on next/pending-fixes:

---
 ./include/linux/cma.h:63:13: error: ‘cma_skip_dt_default_reserved_mem’ defined but not used [-Werror=unused-function] in mm/mm_init.o (mm/mm_init.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:8254f44be28c555bd563efce1a70336059fca879
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  0fd19300e770b50ad9fc43026f5e148e185ddae1


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
In file included from mm/mm_init.c:29:
./include/linux/cma.h:63:13: error: ‘cma_skip_dt_default_reserved_mem’ defined but not used [-Werror=unused-function]
   63 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  CC      security/selinux/netnode.o
  CC      security/selinux/netport.o
  CC      crypto/hmac.o
cc1: all warnings being treated as errors

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.12/arm64/chromiumos-mediatek.flavour.config+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-chromeos-mediatek-6979fba71908a6300d9b7134/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fba71908a6300d9b7134

## cros://chromeos-6.12/arm64/chromiumos-qualcomm.flavour.config+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-chromeos-qualcomm-6979fbab1908a6300d9b7137/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fbab1908a6300d9b7137

## cros://chromeos-6.12/x86_64/chromeos-intel-pineview.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-chromeos-intel-6979fbb31908a6300d9b713d/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fbb31908a6300d9b713d

## defconfig+kcidebug+x86-board on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-kcidebug-6979fb8e1908a6300d9b711e/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fb8e1908a6300d9b711e

## defconfig+preempt_rt on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-preempt_rt-6979fb9a1908a6300d9b7128/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fb9a1908a6300d9b7128

## defconfig+preempt_rt+x86-board on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-preempt_rt_x86_board-6979fb9e1908a6300d9b712b/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fb9e1908a6300d9b712b

## i386_defconfig on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-i386-6979fb641908a6300d9b7100/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fb641908a6300d9b7100

## x86_64_defconfig+kselftest on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-build-only-6979fb891908a6300d9b711b/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fb891908a6300d9b711b

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-next-6979fb911908a6300d9b7121/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fb911908a6300d9b7121

## x86_64_defconfig+lab-setup+x86-board+kselftest on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-6979fb851908a6300d9b7118/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fb851908a6300d9b7118


#kernelci issue maestro:8254f44be28c555bd563efce1a70336059fca879

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
