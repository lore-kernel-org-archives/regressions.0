Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D9423D7D3
	for <regressions@lists.linux.dev>; Wed,  1 Oct 2025 03:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759291147; cv=none; b=SgB4IMhwFfUNwCr7ECg8cFHIZ5cTTBG1EFKauQKVlZeX7AJPudulRBVf+5hdqUgmofMB9XZZu3zPPzCgh4S9W6bhcnOj92gWj/uaTVVFV5LNnkRQy/ykzI0orS4sw0SPfg/Emjdky+46lCioxrGLrFjaEOHTBTeQeiaJ/us9zK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759291147; c=relaxed/simple;
	bh=Rl5Xadtor1PTfyr/gyhQZTB9+PlfN+xdMlhi57St+JM=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Bc/x2MgtaY6KzpUfpgxVabgj9NKN53D/uBQMAPZbB+zzSDBFJn4eEctXGLcAgynkzpSUBQbARpHouNnK0gzeAmlq/xAFHEVofaQgyEaSJeBQiYHhHfJ3fBer38OfFPUiORpzN7mskXay8/1kercYCPG1uHC+PO9YVx9wzVm/DHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ZNspc/zH; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ZNspc/zH"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b593def09e3so3264453a12.2
        for <regressions@lists.linux.dev>; Tue, 30 Sep 2025 20:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1759291145; x=1759895945; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfwxcOZy//fHUKHkLLnQ3TPRM9+rtW/noMD58akZIu8=;
        b=ZNspc/zHpd/cvZCyuZaT2jRC8Z+4ZCi41mcvyZdA7ywz1gjs7+6Lz5shVKyG0U0Fzg
         v4HozFm/LuQ2bWzSzDCKP1+Cuuq4g4ocR6KsHrY3F/BAKdsQwXDHLKBLi+XlpggH5uPu
         Ubv2cz1WP+cqEdBA/55uf7UgxPTNF8qGdfy34METIL3hlmevPNu0jZk9tN04a/wd0yTf
         ZxyA0zXe2anbmcGgYVbNBIwpKkQi7XBzi8RKaWKiiKQR+lRoJoK8YxIcBLYMlEFFsfen
         nsD1cTV/Mf6JQs6MrkpDDGgxlZP3jnldEaMu2I/B4sKde7cMcuNtFn/2WNY79zdzIZb2
         znVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759291145; x=1759895945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mfwxcOZy//fHUKHkLLnQ3TPRM9+rtW/noMD58akZIu8=;
        b=ImO7ZRH4UlV0n+F8ikuIqXu4NAi8lpy+yWXqjogqwbODclyiCTbVnQJg9ThWPL6ZZR
         hF1JxZEs1N4hlOzKKUs96xZn2drR+jb7a2kBsoM7saHdTixiXZEshcloFrXPxKJUOIG1
         wpzizyK4X/qHOjkEbxME9YqyDLXEqx/ZJAS2u8+uz957nSuBzuoV3jfHRfT6jMM8oaNP
         /OtLWBrzW8W46/QwQTlRAexOIqpSHTC/YquxlyYNCUaIidcyISTQbVCAHsNipQ2zw7aV
         ZE23ZbIXwfE/3sCCKJHX6mnfS9hlKXNuxfq1alzQ4p56tqjoB/8FXyNsTND81j2icMTz
         bRkg==
X-Gm-Message-State: AOJu0YyS5pjSovE0hKovH8ukbagX5C3vUcEBbdwE+SQyfWPmJQrKICdP
	o95arm93y1SiFMCjSh4oVkbkRZg68Ie9IoaYmX/ooUm97gk0mbFXtqga4iux3LG+ojY=
X-Gm-Gg: ASbGncvFmy+r5iAzTwwpnaTGOdklzVT9F+FI5NXZgj/dyE+btPBy6G0VQhltIWXvQsE
	mGYcQNuLIiaAKyiNEMXo2BA/HO3AdzhsACqAOFzy2Rv7KBU+VENlWIwAlOUbuQSJVWe5d7oKG+I
	E8VxR3TvXP6OvA8YAUKNumDuEGSYJkMtdwNNrZzH2gr4FAE/8R6KM5n8Em7vG61We+Q6oYZ02qs
	b67+jrSoqKjh5SyqODEjQKQP6+yqN3QJA/GIX4xJzs25DAwB51mI1mSFzkhMUNpRjJSS8E4axAP
	g/jKEOP0WrmjcWe+ErWKrLR9FtHb/G7uq/0VpSZMkRlktY8DuViVAp3+SzGWK2WxDW6fDZbf2bm
	CSvCfwnb2CHOh+8a13TbnbaMpOO2TMVLEj1GqXPrJ
X-Google-Smtp-Source: AGHT+IHjn1LVDDM925xoQke9x6D5+fncAQvD9bfjaK3na4N2utQTxHKAVQguAMZRQjdsrhjHCEHxqA==
X-Received: by 2002:a17:902:f70b:b0:275:f932:8636 with SMTP id d9443c01a7336-28e7f31113dmr22853335ad.38.1759291145363;
        Tue, 30 Sep 2025 20:59:05 -0700 (PDT)
Received: from 425547dfa489 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66f305bsm172043815ad.32.2025.09.30.20.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 20:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) ../../kselftest.h:108:8: error:
 unknown
 type name 'bool' in /tmp/k...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 01 Oct 2025 03:59:03 -0000
Message-ID: <175929114342.139.374888475653608411@425547dfa489>





Hello,

New build issue found on mainline/master:

---
 ../../kselftest.h:108:8: error: unknown type name 'bool' in /tmp/kci/linux/tools/testing/selftests/arm64/fp/za-fork (/tmp/kci/linux/tools/testing/selftests/arm64/fp/za-fork.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:0c1b99f5ae52b9d098e7282cd69875d2632a3337
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  4b81e2eb9e4db8f6094c077d0c8b27c264901c1b



Log excerpt:
=====================================================
	-static -ffreestanding -Wall za-fork.c /tmp/kci/linux/tools/testing/selftests/arm64/fp/za-fork-asm.o -o /tmp/kci/linux/tools/testing/selftests/arm64/fp/za-fork
In file included from za-fork.c:12:
../../kselftest.h:108:8: error: unknown type name 'bool'
  108 | static bool ksft_debug_enabled;
      |        ^
1 error generated.

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig on (arm64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:68dc7b96841b167e8d370e93


#kernelci issue maestro:0c1b99f5ae52b9d098e7282cd69875d2632a3337

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
