Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFB71FFC69
	for <regressions@lists.linux.dev>; Tue,  4 Mar 2025 12:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741090778; cv=none; b=gAXlOTbouZK+gydXu9w9xvYWeBL7BfEvRLC6UHa23XFWM1+WFgXlIGEZUP+CugkZmuVqMZNZczamcfJ0i2+GGHCsO1AVO5IBS0PSBhesoOVNa9b+rPV9/J6AK+lEmjK6MCLz2T0791/FoLsDbU75k52Z7iqWx9MSt7vThqDcSjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741090778; c=relaxed/simple;
	bh=Me7RUF9jNqR49PkTZIT3moS2Agi2d4qrptxk/c4WvYY=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=qJJ/LfiPnWng4qTloPMdh7mmpdtG/kzp++hO4GMQ+DHDN5DpnG5DLwhKvG0GrAG+RE3jxKz89rtiAHPgOx+EdUUOiMvhd1dXc/fqSdWmuQ+Pl1jjJRH+X0WSgQhtNfgC3WX1VqwDkri9WISJuwkDAQavXMgSqBKGhR7mJBcjFh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ra93goQp; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ra93goQp"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e60b81c29c5so2826434276.1
        for <regressions@lists.linux.dev>; Tue, 04 Mar 2025 04:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1741090776; x=1741695576; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIkLlhVZ89l4NhIoe9CRlYEgoQsPwPSkdoFjmdqdIVI=;
        b=ra93goQp28G2DXQgDJeYDO1wyHA9KVd6zXuFUDgh8WmQKut7+mX1iWjootvG7pzYYp
         ude9TadbNohqGa9QfPe+yI85IInW6tFLhuN+Z9t4MD8F5skzy8MrX/Twu51qmJjZSjTY
         XheCXF8zjZEGjJj12pIPyfXRgV1EN12OaYRd4nil1vqnj3/BeM9JR8bsCRrEbTJf0rGy
         LEIHcTFXl/k8DBzxt2Iyno7OUvkm/U+KNbY2WHkZJoGEYQB9Li+BqFUypzlh5YvqngZY
         e9ixYtbb40dzmSDhWVTR60XFw5LLz7Tgt5003lSjbaWcid4ZN1JUpTr81EZN353+YNmX
         CZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090776; x=1741695576;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIkLlhVZ89l4NhIoe9CRlYEgoQsPwPSkdoFjmdqdIVI=;
        b=RBnxeBTb9XDUBAnWM6Hq9Tr8vPrtCMe0EE6w1hKdbmHCPKBkLvH5RMTwwo70fLX2fd
         1W8lD1qgtQhTF+6soo6XffFxt22E3LSAR6fZRaiAGOdPnEbWURe0KKrC2hjh3bVi54Tb
         A8Ajw6XmdvdHczW76ONHAqvfxTIDO8608iQMJpjTWOPKuSH4F/4eamxDhQ/lNCWzr1kK
         tZashgZmV9DqTPv+Kw42YZL2yXq1Si32+2M9pkIMm6qUolo/e5s3PL/FSM5yqPvTJepy
         e3pl9+FRbS0lgTMr3KbNDlIj2nRIgnkoF7Y1OTY0K+xcBZGoOZxo7jp8PXJA5zLBtAKa
         DdCw==
X-Gm-Message-State: AOJu0Yy/xvKJFEVl3d+L6IOgj8Xa/sYyNLETC94vSiWnpdK5yTydVDnt
	8esWUDxuZXsMy3fCiXI8jAN3jHY+bAEiEBbcKPMOw0ahDHmyrX1QLuf1Uo/EMffsGztydmWY3Sg
	M6/GgDX5pqRo/Rp5iEV9sFzxcO1PovkawGnv1aw==
X-Gm-Gg: ASbGnctVI/GSW+b83v0hfkBwF3EvqcnkukJMm66WAn/I6zk0njag9hkrk0nb56QPGX5
	gMp7VWZRY5oxb324GwdnqW8oc0Lfm6YwaDJU+8lWEk4tp6T6xpbOz/C74MGDMpSfrgdipSsCsjj
	wpGkdYx/MW9gyVBOocjn6NXnc3mXi9zTQPlU6v/jF2GdTx1i4V+lFRMvMttzs=
X-Google-Smtp-Source: AGHT+IEalhlmWiT+l9+99tlye+rB/RhhCgGC3eYVpYE2GPre9dlqSgQ4NlqPhUcuRUnegnZin7bBTG95xPAnfNYxYDY=
X-Received: by 2002:a05:6902:2a46:b0:e58:cb:70f0 with SMTP id
 3f1490d57ef6-e610c34f00cmr3397564276.6.1741090776194; Tue, 04 Mar 2025
 04:19:36 -0800 (PST)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Mar 2025 04:19:35 -0800
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Mar 2025 04:19:35 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Tue, 4 Mar 2025 04:19:35 -0800
X-Gm-Features: AQ5f1JoNHlYHF2FvaNmZMYpuQh306k1WdvdIbg9Pcw3b-yJ92eyQax8zQDVU7O0
Message-ID: <CACo-S-0YG-i=gUJ9377ue6s3Gfx=iNGdgWbGHaTu9RiSsmfh1w@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) "chacha_crypt_generic"
 [crypto/chacha_generic.ko] undefined! "poly...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on next/master:

---
 "chacha_crypt_generic" [crypto/chacha_generic.ko] undefined!
"poly1305_final_generic" [crypto/poly1305_generic.ko] undefined!
"poly1305_core_blocks" [crypto/poly1305_generic.ko] undefined!
"poly1305_core_setkey" [crypto/poly1305_generic.ko] undefined! in
Module.symvers (scripts/Makefile.modpost:147)
[logspec:kbuild,kbuild.modpost]
---

- dashboard: https://d.kernelci.org/issue/maestro:9653e7551029033f176546e63613ae2c0fda7b47
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  20d5c66e1810e6e8805ec0d01373afb2dba9f51a


Log excerpt:
=====================================================
ERROR: modpost: "chacha_crypt_generic" [crypto/chacha_generic.ko] undefined!
ERROR: modpost: "poly1305_final_generic" [crypto/poly1305_generic.ko] undefined!
ERROR: modpost: "poly1305_core_blocks" [crypto/poly1305_generic.ko] undefined!
ERROR: modpost: "poly1305_core_setkey" [crypto/poly1305_generic.ko] undefined!

=====================================================


# Builds where the incident occurred:

## multi_v7_defconfig+kselftest on (arm):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:67c6d5be678f180aea2ba709


#kernelci issue maestro:9653e7551029033f176546e63613ae2c0fda7b47

Reported-by: kernelci.org bot <bot@kernelci.org>


--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
