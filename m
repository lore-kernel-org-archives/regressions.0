Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E12324C073
	for <regressions@lists.linux.dev>; Wed, 16 Apr 2025 23:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744847947; cv=none; b=a/ojRNXpOI82CjAbdt0arQgYLQcLlhuCwnc+xBQTa2XdWRMDTLPaFxsWH96tf0gD6+AswBKs7cVovQVFM+Zf8Ya0SP2f3NhwvNCk0dPNe+L8bzWdYoy4TRT3bva9EXfm+Bi2LantE/Nkr41cQzZ2EyYYfnMmp+GuuAgj7+C9dTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744847947; c=relaxed/simple;
	bh=IxyMCAVGLb+VMQdPVS4eo2pTQL1SdAOpMajEjBJpWx8=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=KrS3qDaLAhSxz3p65Cwn2cPzkMRHroFzJyTcuaJ+N1vMnjCS0vEDGwl8GLzjoOFO9o9ezH/uOG4D7xBA4mcc8Qg0FYaocHrLwZ+vr4VcodVAd48YXz91mukC3ll42P2jwZzs4eMOeahEm5sEG7FVVZ7qMnjp/3GVAtRL5VhpLOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=EhsFRiht; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="EhsFRiht"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ff37565232so1470417b3.3
        for <regressions@lists.linux.dev>; Wed, 16 Apr 2025 16:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1744847944; x=1745452744; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+b1aqwQ2Y/OxG7E7o/ALIGJlLuEtno0r9SHGcxmmBI=;
        b=EhsFRiht0q3j9pDy0QC7mX+xL14BaYKv3bTHCP8eckUiq2TFIFGDoGS8RCAC+nnsWo
         +W02610F4dImJKQckgYF6H4YnleZos6xV6iEJx08GiZX2Eck9xG19s/XQtCYS7KLlhKU
         o4EEToytBpKvw1A7iOchh9tMbi1gqNF8yGbPolhWNIWrEkE82E5pdqzjOlBWDPWlaYIw
         RUe+/1RYSVwd3GHOq7Dco6LE3ahY4lQciEPwmgA0zwPLxme5pH4EKvxlAzzt/Df3t1q1
         Kt0i0XzFaQT/Ffn/zggAA/ersX3opR7FEG+BLUclXH/f6zmy9iWQxITfFOurNd40k91d
         iRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744847944; x=1745452744;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+b1aqwQ2Y/OxG7E7o/ALIGJlLuEtno0r9SHGcxmmBI=;
        b=Q4Gmx0jLy2NWeta+ZOG8L30f/kMNgQ54IRtjNVMpLsoQ66EBr3YDaamdTJ4Z4dtMEs
         hpQ7aqGZuxj5DKaxw2FUoXC6sr5J6UFWL1FZDglzzEL3R9t1uCB163I74SRl/GX0nVWI
         M9pMjLo/2hxBfBbQCQLcBHHAr/vL6hupLQSNVFtzPb7AFIm2T+d3TLTunR+VdmqLNcE7
         BJlC/m665suW2zXg4SRDT/5YJcRdhQ6qqF1Oveb+FBL9MfDnMljQKiloDU5vm1ZQ+Nsd
         5yBTWClIABbr9kzDDggMIJYHCs5+1Wa3KwnXzgZu3FSttsMJsdsACrc+9/wajKxxuy5M
         1NHw==
X-Gm-Message-State: AOJu0YweZzLGvHIW7U3jeuoDttn/LcJ69PyD6JpPUwjBB3Gzhsi3DnGz
	KrsgZkaHgBGnRYslXtt/qsukPn7uCX6R+oYxBJfR3f8hClFFOy2+6HHRjgxgT2/CoS+6iU1ufPX
	E8ZIFcbiD+8E25iC7jK7pRPS8kgN+ohMOnTE+gQ==
X-Gm-Gg: ASbGncsoQiYDGzyFBXk0hboJabrmi1T3xeol7RbYLWV92Cp4tV2163gNLlc8mcS40YM
	qsRrIzkgJZfbbXkSpbW9ARcEVuff/nLsGXurM06+6mnlSsugCFnDUmMa46tBg0TLFVhl5hJ/gAj
	KQGFMN4+pl+vq7cGcgjT8p
X-Google-Smtp-Source: AGHT+IGzx/yLMNYMvfyYW57K34a7ylvNcXS7yBWj9hFCfvbOCtrEM7/nR9biT7nR2DYFQdg2yjsoPG/5uzRRTR/VPvY=
X-Received: by 2002:a05:690c:45c4:b0:6fd:33a5:59a with SMTP id
 00721157ae682-706b32d5540mr57056367b3.18.1744847944411; Wed, 16 Apr 2025
 16:59:04 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Apr 2025 16:59:03 -0700
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Apr 2025 16:59:02 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Wed, 16 Apr 2025 16:59:02 -0700
X-Gm-Features: ATxdqUFQEchVtPx99Fam3o33hzDSoj-ynhcyLrtPupBPBaPnTWpuPA7vGLHDKR4
Message-ID: <CACo-S-2ADOtt3ULnfxDuaxPL--8fnY5G9XisnF7fuXoK5fYmfw@mail.gmail.com>
Subject: [REGRESSION] mainline/master: (build) stack frame size (2336) exceeds
 limit (2048) in 'curve25519_generi...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com, 
	shreeya.patel@collabora.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on mainline/master:

---
 stack frame size (2336) exceeds limit (2048) in 'curve25519_generic'
[-Werror,-Wframe-larger-than] in lib/crypto/curve25519-hacl64.o
(lib/crypto/curve25519-hacl64.c)
[logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:3e57cb725c9d3e8acaf42a61e15b3c07c0e4ca60
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  c1336865c4c90fcc649df0435a7c86c30030a723


Log excerpt:
=====================================================
lib/crypto/curve25519-hacl64.c:757:6: error: stack frame size (2336)
exceeds limit (2048) in 'curve25519_generic'
[-Werror,-Wframe-larger-than]
  757 | void curve25519_generic(u8 mypublic[CURVE25519_KEY_SIZE],
      |      ^
1 error generated.

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig on (arm64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:6800200169241b2ece0d7670


#kernelci issue maestro:3e57cb725c9d3e8acaf42a61e15b3c07c0e4ca60

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
