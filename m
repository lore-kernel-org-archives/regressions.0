Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906AE1C695
	for <regressions@lists.linux.dev>; Tue, 11 Mar 2025 13:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741700817; cv=none; b=GkPXUCla/QxlPaFKO5XqdyujMDFNl8GfoYRGXdQLcXZLc16XOGJcvcqU57WBxNyzoZ0ErlC+3jjgW5hNFakEKLnryFyNc/vXery2IRs8YqTjVcryEwXeYK9jl+C2A9B3zYWpVEsdHHvf6Bhh22Qkhhl3pAb2MtAKbluzUFGKRqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741700817; c=relaxed/simple;
	bh=sNcb4W2iFbHp7ej9qSKnunThejbqLLvEsoiVW0qFB+8=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=elLAzyDVzF7drZ7ezN7Y0DTsQ/xdCp1Y2el6xWULu37R7P6iDARsgpZ3PE3oBX8/NsgYqgq3T9ySgzgZadSy/foGWpXsbJEivh1IOu6+dKueueZ/UYOYWdceAp5yL/fDOmMG0OgBwXupRAPawI/xk2w7hvKnljHYlrEOz/xo4oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=k6GOlp7a; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="k6GOlp7a"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6febbd3b75cso44184417b3.0
        for <regressions@lists.linux.dev>; Tue, 11 Mar 2025 06:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1741700814; x=1742305614; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFvM6OxTFpIkKcYFFg8jpkPe3FpsXS4ZyRowpuPVS5U=;
        b=k6GOlp7a+ssP6obibeVcLGSRifb8HteMdmkW8FGOa51cVroxU66yymzkXRsV+LMo46
         uPNfZSixLMTl77YEYIzVzWKiEWGjExkXALiuXO7oQcqrj2TolWbkE3V9yIoZPNTUgPH9
         fPwFdR2fDjH7A3Ujkj1/ozPTDb+TMcHnF2layxJXZ9afAlw8rrSSVVhzGTZC8NgbATJs
         PsJxI602+6oN6TCL756boqBqvCCjlUdS+omaq5bKFFc/9pfdsKrpc4sHBRv5uQQObT5S
         x03PmXJX2cd4hLWisQkrs+vavbruDjDpN02bvjEzGfjbYyoYs+CBU0YhBimjEvnkdJke
         y/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741700814; x=1742305614;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFvM6OxTFpIkKcYFFg8jpkPe3FpsXS4ZyRowpuPVS5U=;
        b=VctKDTBLk8vMltdlICFI1RuKJbZstIwb7dDOUk1JkuaidaSl4wZ/JvuIUs4Oh2Ua1J
         6GvvFMGEA4+mlOOw/35Y2VugiBNdlmY1iJmLdmXLCxvnPZUWsBXfK0xbiu2O2kpGaViH
         oPTIEFdctOx89Y+Kse2qBDyNcSascKO8TTMRq7Vem1noooY9lCs4zANNskqWMa6ZIbj5
         WIKu46AxUz/CgSTar4CGnnNvHK/NI76pbJI6WKpMSDF6LTDaxpW5jR1YuLBROv7zBZb+
         hDXvSlbSVvcTNUVc7Duo6IhPJA6ZVxb2cD5VRoDQWCXfZPL9D3OEf623WSWWolPYdIZ1
         Vu/w==
X-Gm-Message-State: AOJu0YzdjbM0Pyrfy7HjQ9vOkLz0oi5/+P3HBIDcp58STrRoB2sNAyqH
	o/rPTDFQgB2zqRWAe0pqQ3EYtUPXO24sNCdPD1ArGfzwZNgSbYjL0J66OgyXauwVlnMjUpYrW8s
	CiaV4PNCXdAYOnXzCop/Ww28BtDl36J/U+b+p0A==
X-Gm-Gg: ASbGncvzQHVykCOMOEAAo1mVfVHEsK/8qdndYOjmpp49W7fMu7u3rtDl9HvuJ+f7jMV
	pxDPRALvR+5hy235bAoTjVptKQgn5+Wg09+N5nTtqFCqx+Hap4qfgkJVJ6cNu5N2q2c4zpUsYRh
	p6fehk7Qo4mZM96JPyljCdkQgbPBlzsBijPi4Nwk0BayqDUNa8i+MqkIlAEno=
X-Google-Smtp-Source: AGHT+IGaLIwj5rkuaiAwHNlv5+IrEzxM5/nlwWpOUrwsemFKd02StB4INMYtUT/Vbmm2KZ+KCWsxeaMYR2ZbnTMSSuw=
X-Received: by 2002:a05:690c:30e:b0:6f9:8436:3d2a with SMTP id
 00721157ae682-6febf3f7f61mr254465937b3.32.1741700814475; Tue, 11 Mar 2025
 06:46:54 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Mar 2025 13:46:52 +0000
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Mar 2025 13:46:52 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Tue, 11 Mar 2025 13:46:52 +0000
X-Gm-Features: AQ5f1JrWoH0C0SEA4RcEpY3C9JVE8OZKCHBXlKRgew50EC79S_211elGxaM0wrg
Message-ID: <CACo-S-0Pk_QZotN2f7hAJEo71Ma0MurbZ_zkkmS3V455ePcLUg@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) in drivers/watchdog/aspeed_wdt
 (drivers/watchdog/aspeed_wdt.c) [lo...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on next/master:

---
 in drivers/watchdog/aspeed_wdt (drivers/watchdog/aspeed_wdt.c)
[logspec:kbuild,kbuild.compiler]
---

- dashboard: https://d.kernelci.org/issue/maestro:aa83336568734d443df81bf8e155243a8ccbb304
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  eea255893718268e1ab852fb52f70c613d109b99


Log excerpt:
=====================================================
/tmp/kci/linux/drivers/watchdog/aspeed_wdt.c:257: undefined reference
to `__aeabi_uldivmod'

=====================================================


# Builds where the incident occurred:

## multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y on (arm):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:67d02892c5336ecbf36c6ece


#kernelci issue maestro:aa83336568734d443df81bf8e155243a8ccbb304

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
