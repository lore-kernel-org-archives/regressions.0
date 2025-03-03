Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AF3217F33
	for <regressions@lists.linux.dev>; Mon,  3 Mar 2025 18:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741026438; cv=none; b=BOmuHKB4PaTDt9MMGXPzjZlHgP8CFkWDZgeyHYaAmJKtadwd6BvbOgSLDa0BxWZSPTbyKen1thmc60rqkhgchBSHWJsmwNOEAdSBYBbPJs9DkUcQk7DeHLeOi/JT6ZxmZOQxe/H7MkhbOjhIwRSzKbZcabuBqisoHY/4zEtZDjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741026438; c=relaxed/simple;
	bh=yTCOzk0GYDeJfXMqJLr4Eqi2ish8wp1sCHrh5tH9cFk=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=KrUix91I3+297hGUCvoRQicFnHArlPHIGg8jvwe01Z9JDxgngVM3HeNoGTROkQyC5OIddgMQTaTnXXi9TUNx3lrRTKu8t89pY/sC9Bvoc0f0DPKUqYAfa5E4aEMLl1Sj2ir1E3pcqp8TSRa9BHjNGvk3xjqz4RbnjT15q//X9Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=kQN8L67k; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="kQN8L67k"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6f666c94285so42380677b3.3
        for <regressions@lists.linux.dev>; Mon, 03 Mar 2025 10:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1741026435; x=1741631235; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMpi4cnk3ustbOITayzzrC+pW/YiRjC6btMW4QsfQDQ=;
        b=kQN8L67kxkYWzwlY142xKdYfNJPchtU7Pe3aFS6cVeQ0ZumWNe5YHygPphDEVyF4YG
         YcbUzP19EbS1bpnXXzCrObpCvqLRe34co9Dh7WFgtyZK+WFGkzkDmWVOiSB3oMxcofuT
         umWHCGY/bVUeYIE559Ef7BBwEJyViiuiS7qwQR9IAXB9J8P9eb3Osv4ObxehzmD5EC++
         /ap89zSrqbUiowB56T5q6DZRdcdrEvQXe4rLIDuEqG0p8SHu1DY79RAMsNm3JZ2gdW3z
         M4YMGfR0BHLFtGxsPUeKepdScQtkuyg/0u+SVMYZWmpPmrdZD+wRIcyZSIrUFMA9n0Q7
         fUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741026435; x=1741631235;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMpi4cnk3ustbOITayzzrC+pW/YiRjC6btMW4QsfQDQ=;
        b=G8tyT/pd4BZaZbWb9WS3m4JUKQ1dbXA511EoB6wgGyKiB0zqRWxUMkDDzS2YGcAgTX
         REZJKPmDQoQIouve1KA7Ee1WzisqQzukUrSvlmL87NcpGS4lscjRUzyrdjmkUS+FXzA3
         9M8oRjlStipiozkcTxLqWrFmwZDW8rclFxeY5eKXhTv2Kgmc+9LHD/xge3+BmyfvGsmR
         2kHVupFQnIRNuLu99SyXjMyVuhPEK7dLQNFIvT6h6y7MA6kgh2mom8E+3ODIqLCRBwpw
         e+qeun5A6vIWZKoWRK8V4oBvSsMXDwcz8HOgYHencruwqR8QAFwJdTBmRbiqOsngukdl
         d1bg==
X-Gm-Message-State: AOJu0YwqyC1B7BHXvvwEnrOXs16Mr0zXgns5kerlht9qeqxE48XHZuqG
	ybka6kFmEG3bNORY09Z/1OCogKSBkoG4c5DXKsxGTYeewsXjVsiv3O4GWhdqfQgMsFQOwkTrE0I
	zXSNTpJPWB8Dd+eshVMa+bQifh+RzuNm8zp9mX1n4aPoKgClwVo8=
X-Gm-Gg: ASbGncuNI8fwzKUWllvuv/KERzk7LQwvRNASZasUKD3nBxBWbuYzV4uxAM8ew+eYlCH
	O5zU+H5nZUocqZ/kvN0zemPmPwamvLhH3sBwhAmIfboS7wqztFWxdJoOzLPcZvKskDcjAOZINet
	fY+niVqMxo9yfOzAaKB1iixgtLFrAZLJjVxXR7bGAUbXW/WPOE9mpSBs4pDuk=
X-Google-Smtp-Source: AGHT+IELCNbrfn4j+aTi5n7FWvE2Cx5e6Fsg5oAIndZzKF0Gxk/jI8+7/1c6nMahi2gKgF11K9IVbenpZmSMjDMq0PU=
X-Received: by 2002:a05:690c:4b8c:b0:6fd:22fb:f21b with SMTP id
 00721157ae682-6fd4a08d05fmr199548587b3.18.1741026434725; Mon, 03 Mar 2025
 10:27:14 -0800 (PST)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 Mar 2025 10:27:12 -0800
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 Mar 2025 10:27:12 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Mon, 3 Mar 2025 10:27:12 -0800
X-Gm-Features: AQ5f1JpssQUSJzQSBJfa445SshQY3waNSQoudVxmgpX-3QlyLSAft-CjQOam-Hs
Message-ID: <CACo-S-0Vus12o8z=rn-JxWW-3p8_RYsskJjP95uzVL78tRdN3w@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) "poly1305_core_blocks"
 [crypto/poly1305_generic.ko] undefined! "po...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on next/master:

---
 "poly1305_core_blocks" [crypto/poly1305_generic.ko] undefined!
"poly1305_final_generic" [crypto/poly1305_generic.ko] undefined!
"poly1305_core_setkey" [crypto/poly1305_generic.ko] undefined! in
Module.symvers (scripts/Makefile.modpost:147)
[logspec:kbuild,kbuild.modpost]
---

- dashboard: https://d.kernelci.org/issue/maestro:ac78e5482b7258eb93382c5d396ecabbed2f2904
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d


Log excerpt:
=====================================================
ERROR: modpost: "poly1305_core_blocks" [crypto/poly1305_generic.ko] undefined!
ERROR: modpost: "poly1305_final_generic" [crypto/poly1305_generic.ko] undefined!
ERROR: modpost: "poly1305_core_setkey" [crypto/poly1305_generic.ko] undefined!

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+kselftest on (arm64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:67c571753218f15c74c37d99


#kernelci issue maestro:ac78e5482b7258eb93382c5d396ecabbed2f2904

Reported-by: kernelci.org bot <bot@kernelci.org>


--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
