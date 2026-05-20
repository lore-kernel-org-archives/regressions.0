Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8CD24E4A1
	for <regressions@lists.linux.dev>; Wed, 20 May 2026 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281949; cv=none; b=kzttU9D/M8rZ3tlHauJxBjsetSiTf1YVaAzgDpohfww6k2eYpWyv/os8lRF2YRmQtoP4P4OAG+cz9ixgMfTljyNuovC3gHJn5b1xWgHbIMVzRG0anrhIZzRMYevza7yt/dhZqmYtDS8n9oj9xaOmAK02sU/8gKeX1tjgv4aA9V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281949; c=relaxed/simple;
	bh=65RCTQjSqiH9OvgLpUr6Nvm6TMbutL/FAxsgSqjiKxE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=g0MHYbK3Z7vuNPs5oLRXaIVTHTnWTPPdhB9E6JCGldf1BGWT5yrhrYdy/S2ebemQfeLgqLnimEl6BXjoRZe66dpCphM340SagecGEO9Mi9iOlpRZLACzdYLxlsj485FkkfTun+P7a0G3ocxNCclzzJIOx6tsNHlyU5VjtdA259o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=GwOHMU1q; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="GwOHMU1q"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-13621cca8f5so187240c88.0
        for <regressions@lists.linux.dev>; Wed, 20 May 2026 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779281946; x=1779886746; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgr1ZYz07Uly84CvVDogKTgiacxKhqua82HkZPCO/LI=;
        b=GwOHMU1qalDlJq5b9BmJcOI1eapY02jnXMeqiM4oXboPmYbjNEjpIu3YEnV6I+eVQ3
         tPzCbxfJYSVt3Z31u+7fKHCKdR7b7YbhFXbUoyEzof4V93yV3L34PC1KB9oR+PX0m2I/
         bxze1xxv/V6ejKD1OPY9aK2eL750vRozwh+41eavIJ/M1S0rOL8SEVKnoDfd4Rvng+9A
         ZwCpgJSfRAyiANp1Wx8BluUmkrXZ7dvg21iVw+iCHBbZb4sUWppd1UAvu5MN8CSxHiD+
         ncuAiG8M0RLwqbTBcTQTZjGvmXT3LbgAwDKTv3wHgLk2ilYYeCEGwYi1iBV2zHtnavhf
         Iakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281946; x=1779886746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qgr1ZYz07Uly84CvVDogKTgiacxKhqua82HkZPCO/LI=;
        b=FpalJUQgzj1aL0QahEppuAYAJd6C7gzapVdKaDWBJipHLvY+kcy4zMtNWYyBTncHrm
         Q2KO0fPbCVQsa2C0O9GloD/VC9RvsITnLR24BYciv5yZ8oCDrtUt8v4GWYtm1v39vBvK
         cEDqFEOIuI8wqk2g39YycBwqaGLULNd9euYqI0V5uSoApLE99nFakmtw28UqU3Fe2wzW
         RzH8fEZXFZHQ5eTWJBFVWlQ7WvnwQrksnb2fI5M0647PIZt++aHxlzo1CtV4rs8qQkVx
         amukG8E7z4MPmTiPJOzAuKUwJrcylsz8I4fwZAbW3HAz6N+dTLj4susOB//YSYf4Lq4+
         A1fA==
X-Gm-Message-State: AOJu0YxHIRetXcxJzksB+3qQe506q6DY+BXrKgexExeB6eH+MiNs/jAb
	Tm7xC4I1EK5xq8XRkkJY5rhK8AlrTZpwYYj0Pb24rb+WmMPUDIa6nOznxPRFeLn73aU=
X-Gm-Gg: Acq92OETkQnbom7zfQE/oqxfb+rUOM9biMR2NTq02UfY/QEJjmG9Z0TRmGiCEGbvY9+
	0JgrQ2oGYrd3m58JA+PhYpjez/Oili2viwy32+53UKFZbz36K7MtnyewC9W9yOiomitFN5smmDL
	vFcxEgD6DzAjK8dFnd9E9nFgeeGNi5DWSj8jtu71Ystly1+l/ftVDcRCh81GP+WPiG2dgddPlWC
	4dhQ95wfRXgoQ6FASV0NYOrLhZW1spG4yCjEj6kDzCKWQwCyZXdxa5e9UEw9fJwqcpkBO81oVc0
	8gIZ3eK+D8aTWcdHJqMmUkUYXxMo5E9KiJTrwUjR9mMoOX6UBoIVvgkvLcIv1PSFXaGueyZMVrj
	6HDXhAQJ7cTRAocfXJyB1wIAAz977V55tRy0kogKx9yXOwRl9eFXy/h1I1gYxI+mXFG4LCCKkoO
	9PvpXH6hj1EpIKXVaNdxMSrGRo360=
X-Received: by 2002:a05:7022:6993:b0:134:df7f:910d with SMTP id a92af1059eb24-1350451e077mr9875479c88.7.1779281945853;
        Wed, 20 May 2026 05:59:05 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdce9fasm21886223c88.4.2026.05.20.05.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) stack frame size (2104) exceeds
 limit (2048)
 in 'dml31_ModeSupport...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 20 May 2026 12:59:04 -0000
Message-ID: <177928194404.3268.18401290607331979680@330cfa3079ca>





Hello,

New build issue found on next/master:

---
 stack frame size (2104) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:504ac30a3bdad797a2185cd52e1b61acb0439072
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  687da68900cd1a46549f7d9430c7d40346cb86a0
- tags: next-20260520

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3800:6: error: stack frame size (2104) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
 3800 | void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
      |      ^
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a0daa38744d1c1da0287568


#kernelci issue maestro:504ac30a3bdad797a2185cd52e1b61acb0439072

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
