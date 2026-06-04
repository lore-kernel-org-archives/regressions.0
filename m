Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41E44C9561
	for <regressions@lists.linux.dev>; Thu,  4 Jun 2026 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780595946; cv=none; b=m51JvP13VO2qgnv54qeZuZw3fdr1PPTfEGHRUQoaN3XvcfZ7apXTc2MvElBxV+Fqrb5kPtUUzgM1o2NIwtrJSPmuXYyVa+FVRxhDU4zFL9EgQ/WnSzLoZz8MspB4v657oWCMdiNc3zwOZvLL29u4SvjUTMjm0FOSm/tOAxIrt9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780595946; c=relaxed/simple;
	bh=nfK8RylvLKuEzFpYXFoSYWUzV/VO6lZO9BXznBVS5HE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=PTVwnlHMQdG1Prc38F7Mzh+8m/HVi4qGspufaMtb+V6BYvmb1lXwSobDkGm5JVMpvoLcdczEspSf/sjrHOyIKWDCaJnNmrlBTbBcdqrPlluUuPQh97rlU3s4gi1qRTq5hgTEns5r6/evzWARIbVVeaLj1DuShOew2FU5E70x1zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=KDI46Qav; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="KDI46Qav"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-137eed84fc6so2727398c88.0
        for <regressions@lists.linux.dev>; Thu, 04 Jun 2026 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1780595945; x=1781200745; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyEsaSsaYhlOCnUozjrxNOzw6jzmnNaVQY0+GszbH9k=;
        b=KDI46QavnVJhF9fq6+5Y3UohyhjhWwruBx9zsVjOsXgqw3NUQ4m3txJYM6KoMJHoWC
         7idopvPiU/apktmskYpOYDN4wz/NjH5wvCwJSOp5gZOlJMXXhjiO8Zgpw5cphbLjq2TH
         aG4BdZYgVToNDuJNr8VhR7zP5MEiKHlRtl+UnORXBV0J7xOHy6Ivq/653b0CMBl/DKgz
         srN+WAn0w6dc8q/4CCyqX/weKbK2LlxAGGtwDsAcKL6q1wgwVanJoJ00n3lSSe9D3BYl
         bNkbURiUFFHujB93ln8svd8TXSY7sgWwjmYm3DUjgEY3bWUhuzmIWDpMjroYoc6Dvd5d
         rTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780595945; x=1781200745;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SyEsaSsaYhlOCnUozjrxNOzw6jzmnNaVQY0+GszbH9k=;
        b=bkAr7450cCfotzKDAnylCQWxTbbtG0yBetM7tfY+58s4bdu9OiMnmanA2bh/tWWeLn
         ZFuHV2HHLKiW8szBa1Jcmvfa5aO5nXo30EpD7I93k+YAyRK08CuwzNXK9JjFxdet6hz3
         sfTPZ0/P37TFUgbpcnPLp2aO+Vy7Gkm7/1gM0VhTwyZxsdEw6xIy3zP0BO3qzxrFFXq1
         29ExiSQPX8HfJ0BFVwB63Am0KpTJvOnhWhT2jlEKwma69KZ5z0k5bKJ49ruk0IXxSZqu
         G77iljIS5SjMgRHkbwGRVcT2vd3eGXh5lozKPO9xIOyL6osn4dBDnAnfSANNT99u0ZI0
         M4WQ==
X-Gm-Message-State: AOJu0YxmQTsnUAsMGQfeFMjR/UDe7mo1A3f6eb9a1Q/B4GBRww/TtPOz
	YXRnkI3WIjpeo7PgR0F0KHJIy2SORLh+DeXA+rwIxrh8Yx3XQkQYj+kqW6i8XkqcNtU=
X-Gm-Gg: Acq92OEMsUesLf2jP6/bSBYG4xgBV2icb3/Z1FepcBWj9KOwNpC4fWfcOuAzDzmRtEh
	KIIzXVYDXSG1PDXIifjjORk9gDwcOm+e1JXsH5aynhXpYEFIHfmu3dsqYBoCQvsONlLGuGkosyk
	v1uP+eYNYBl3vra0m/lsnOwvaTl2ssr61wQk8KZAnelzumB90k2xDSFEQY98059UysPUCXOAlH2
	O9M0JLzfZ6poQpWocu0Ek3vwyX5i0LcEMS/KHRFiNfdCEvVMPI4aDt5OHZq5P3iZYEYofUnbhAS
	VoR/LFAk7/TqG7uaXgZNnGUSu/SaqlXiLyxR012hM+iYiCe68yUJmglPUvjmqJPMl+yKiaahl+T
	vvWr1IKjepsldKYXfdGAX3AJ7angeOHc4hdP/NHpTTJOmkieAs23pPUZ/xZJdPgvOgWugH7doBl
	WcPp/O4Yje9Xf3mLvWKJVF6dTNfgo=
X-Received: by 2002:a05:7022:62a3:b0:138:36f:4288 with SMTP id a92af1059eb24-138066d54e0mr72818c88.15.1780595944696;
        Thu, 04 Jun 2026 10:59:04 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539035sm4387471c88.11.2026.06.04.10.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 10:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) stack frame size (2088) exceeds
 limit (2048)
 in 'dml31_ModeSupport...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 04 Jun 2026 17:59:04 -0000
Message-ID: <178059594388.10259.8984887956034576074@330cfa3079ca>





Hello,

New build issue found on next/master:

---
 stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:96417cd30041ab8f3153128d0120c6cd70782d99
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  b99ae45861eccff1e1d8c7b05a13650be805d437
- tags: next-20260604

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3872:6: error: stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
 3872 | void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
      |      ^
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a21abf22cc72b6e94bf3c60


#kernelci issue maestro:96417cd30041ab8f3153128d0120c6cd70782d99

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
