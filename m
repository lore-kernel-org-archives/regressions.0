Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F8430DECB
	for <regressions@lists.linux.dev>; Sat, 21 Feb 2026 20:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771707546; cv=none; b=UdVFoKT1yCmHcB7K8wMG0w9lKQRysnFu6bHLvJxVHzZlIL2gfSvSZ6AXhS07eoUtwwg3eNC9zCZX9qP5ABcjSyU2geCZGhOOJ67nrHhvbCByVgRbatVqjoYHz34dYL3DxGSgCReO6uWg891YFXA6r8gPTItiQNc2tpYKfSMmCRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771707546; c=relaxed/simple;
	bh=aeTGIjEzNc99y8trZursE686wetDzbvkl8LeOCC1U6U=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=QnogWb9LYN6Ga/Jmrh3juf4YjIDeW6pHfgGIzruUhpqLkFcBx92RuO6xmL0C/bg19Pa0snOUnx8V3L8BYL/as5mEKWwNVZuLhdeWCMVPOSg6D371c+rg/blB93PbfGEQHmR66Q4G0/GQ88koNTk25D5RKYtjocZ4kMjq8tuVgH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=O9tYH9fu; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="O9tYH9fu"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-12713e56abdso2196441c88.1
        for <regressions@lists.linux.dev>; Sat, 21 Feb 2026 12:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1771707544; x=1772312344; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGcCI2z2XBByvwc6aTs28BafIWYbYpMUP1hO8ljDvb4=;
        b=O9tYH9fu+vij+e2AHPz+ncrOd99OOxvt3SX2XOsaHWOqbdq/jC2zN8ALTW/e8vf6GD
         JAR5kWEKW6kEpxVetUVF0Y3YTN0jPCw8odUgCyXCCAvN4yAtYnrVA4RasBPLkI9Zw+gR
         50MpjVdar1pRYmj48HTdC035OMwymONhLlk9kOXm4sSwjE3gBLE5kCjhpY03T6TMN82u
         d6DuAsvk3vbGHEzm1NFlQ/fcFVRoth1IQT7+a8fLG0JVIsR95mcaVy3TXK4vUxnp7FdR
         PExLOLEKa/Ve0D7o7U3MqttwutWlZf/SFdubcwsf8HddW5KKSXMRK5VEpaxKWP708gii
         WMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771707544; x=1772312344;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WGcCI2z2XBByvwc6aTs28BafIWYbYpMUP1hO8ljDvb4=;
        b=GL1fwYk8WhEvn77Rwb1fdZjS1fDdnppZwcB4bzlJJIjaaBzWDKuPuxYdsVayOXdmgy
         aDUYpGh+bQ6WEOMw3ufL7GE6VAU+1CRuIXiNpMcy0AXbmb0djz3OX3to2a4VxhUkHmot
         7PAek3QahwEMdPoTnETd5ocMOJzFZpIuAfiH+qszfICbOUewS61dgs/v6RUAbDIR4OT5
         rKzbbI+IF6uN6z7u5NnVRnMzET3YG6v+6fGLwYdXUby0toDG5j5/vsTfw4s2DhzZKtr2
         Zy1F3nBNPgDLQY2T0HM+h9TzQiRzF53Y4KzSXHY7hawz42z5mHBilV2/7qDqqsrKEKPk
         /DSQ==
X-Gm-Message-State: AOJu0YzY8Qiy5QshQmBveK/X99RBflHu/2nH/DWLn7Eyqd/rMvhKyO/Q
	0AVkj4k1ubHrdZ9OQlBPxEfBNWT2fYhkMucj+yj8xLWBvt3UDrM9CUIjl3gxvlxiwqc=
X-Gm-Gg: AZuq6aIyXJsif/u+1cjpBwwPCelhBOXt0zDzmhVi6JdGdmVKnidAjjA1ORNBautTw6X
	W+8vSxkGm0IuBvFQT943R9m7TjUzavHZHvETlfJbaPRteSfdXGg44j0tGGS/AJ+qRZf3SoEdyMm
	0RCbBZld9SfOBeKibKIsJPQUCf5ZO8p1qbTRB+JJbHls0a4yMmLpLme+1iuQWgO+K9eOKe01Gpb
	K2cDW64lMWNRckTObOqxo0y6niEfBgggvwugNUtJB2MByMWInXel6kcrPIWXiPfTA74t4SQXjSY
	4JHL0cGn09jvRLPrQuBRcHbwjez0JOM+SKTC4vYlVpQiDZ7fiG/MTvkILk8HzzrTdEIbLTTHpD2
	U5cIxE966uhpcAQCujfsn27fzDEnfi2916PmVDGcKN5CVivFWZugd8FHB0kphQVMtdbihb8tXZp
	qAhbg9XzArEqiKehm+
X-Received: by 2002:a05:7022:6889:b0:119:e569:f872 with SMTP id a92af1059eb24-1276aba2cacmr1750824c88.15.1771707544400;
        Sat, 21 Feb 2026 12:59:04 -0800 (PST)
Received: from d14e337afe00 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7ad65sm2817257c88.11.2026.02.21.12.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 12:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build)
 arch/arm/boot/compressed/../../../../lib/xz/xz_dec_bcj.c:594:25: e...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 21 Feb 2026 20:59:03 -0000
Message-ID: <177170754298.1117.6665845589908782156@d14e337afe00>





Hello,

New build issue found on mainline/master:

---
 arch/arm/boot/compressed/../../../../lib/xz/xz_dec_bcj.c:594:25: error: call to undeclared function 'kmalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration] in arch/arm/boot/compressed/decompress.o (arch/arm/boot/compressed/decompress.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:6a6248140e63e694b08834f5a95875ba2ac39162
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  8934827db5403eae57d4537114a9ff88b0a8460f


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
In file included from arch/arm/boot/compressed/decompress.c:56:
In file included from arch/arm/boot/compressed/../../../../lib/decompress_unxz.c:243:
arch/arm/boot/compressed/../../../../lib/xz/xz_dec_bcj.c:594:25: error: call to undeclared function 'kmalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  594 |         struct xz_dec_bcj *s = kmalloc_obj(*s, GFP_KERNEL);
      |                                ^
arch/arm/boot/compressed/../../../../lib/xz/xz_dec_bcj.c:594:41: error: use of undeclared identifier 'GFP_KERNEL'
  594 |         struct xz_dec_bcj *s = kmalloc_obj(*s, GFP_KERNEL);
      |                                                ^~~~~~~~~~
6 errors generated.

=====================================================


# Builds where the incident occurred:

## aspeed_g5_defconfig on (arm):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-arm-mainline-aspeed_g5-699a15a81f24bb69462d0f35/.config
- dashboard: https://d.kernelci.org/build/maestro:699a15a81f24bb69462d0f35


#kernelci issue maestro:6a6248140e63e694b08834f5a95875ba2ac39162

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
