Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CC6311C1E
	for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 13:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760450348; cv=none; b=gER/UGdXTi8yeTgoCAH0wxreh4ki5i24erlQJpZtr5iCHNle71qAoe7596aN/XbnrNq2VKoX2zcNrDn2dFbVMJ8TQ098MlEPQ8lYps8u2Fnrr0hQ5LQVZgbZk7bfqQu8TVMnzMz+JI/m6MkT5xz/eMonK5HP79WgVxEy7bE/hzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760450348; c=relaxed/simple;
	bh=lkROTrodmbJSenAHhGyFx9tlNI/DtQVmO3ov5vNaSOw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=WMWg5YDU/nqc2rgEgVqShHTZBwxRpHTCEv/oBCLSlqAXMNXAGcdALdDqLKlxv42crwH1RNYQ3q20rJ+SRxMCWn+HtkkYlcD6lcy5pg4cuytJJSw6GGDAZL3YT69iyermwwLP8zMdlEVi1R3IrxSD2yv76FtN9WA1WfrFjCgJ/vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=m2AHnyjc; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="m2AHnyjc"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-27d3540a43fso51857895ad.3
        for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1760450345; x=1761055145; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjDMkAdvYR8QDIHBBK4om/FkCI8uG8FuR3An+D9afrc=;
        b=m2AHnyjcZEaY4v9oH6+ns2yVta2HUfMZH71HpbryiVDNTXLRdH37d9rY18CYi5fNM6
         VJP2Xc/w/huVi2tSs6ZkVxC5zt/03UXCYtONjm4gITxzjyJJZc6JF5JyFyvjH8lXglQz
         oXMMxkrMtA4NhA/Qb8szQF1QsEFH+pij17yYmqpIC8r0f954+c4jaI2CT05itW6eylcE
         ukxgF/ii3xCe2gz0O7WaGDAF7HSJs9Ut4cLgVy3I+RP2By54H0Ascl5la03htYC+l0aw
         bLdFmMM34r8Rgqg8i4JF+cOAlJKP8urSANGua3X4RuJ8MV/OZMgSm3+LlpnF0KHFxIEd
         u37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760450345; x=1761055145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yjDMkAdvYR8QDIHBBK4om/FkCI8uG8FuR3An+D9afrc=;
        b=GcSBvDJEcazwPYnc8qz2uqG6jhAj83mpVU5/xMzFoUfm1ELcZ62B9Bgqr44zjEmzzG
         BM2OpDI6Z6BiSwQFr3nZSpUdvUUXbWn9OoFZ2ieQ8scYPd++bitda2ontGUSdPyKe9Kx
         IBFuiljfqaMt6ZWscLa/AITKhNiUPS13u7wz1yK7zi0DX/iHsChjCh84Y37xpIo75CjD
         hZMo0wusU3CWHCaifHjGCNhX4YcpWPiElsfA7wRQG1gzTS9IcV4NbhTxWxZJSlsDh7eG
         IWY/PRE3hLvhbkOQUj82dlvqpBlroeBtPZXHcZ1+uQlJtuiuLm2DGB1R1IaLdI6rz++1
         g/TA==
X-Gm-Message-State: AOJu0YwVJOXGxF1mLfbiVPaFmehHKz7AYE7M2Q3tZNZim23Gp93EJNZv
	dHmBa+ONIxVy8QeXQ8vWdzujQvF/55gpOatvGG1BilvWb7s6WTFiRoZe6FQ0Eytdylk=
X-Gm-Gg: ASbGncv3GwgPPyx0PEwbvb6G3c6Ps9yTtrtWEj3xDSJeQABChqaeCjjs7+Je1esXdrK
	EPCY17aDUdQR5kV8F04te+coFE4qmqtD+4nu32uhHNH3hpH5L6d6giGfwz9kJSiFzlnMezmmYCV
	SR6ln8LtdAE6q7jqT2zzA2fcMYFi4WBe+ekfJyWpsbDE++07KOyuCso1Btv9Z9pfe8NaM/IK8CZ
	1N2Yv/RHUQc8SyzBnSYyQk108nbFVEwy83hrwBodyVkcFtuzM/WZilb6IRuKwuq9iCyTryOShTV
	U2yRh0GLHH/MuESJHXFgVd8qjg+lUoHosusWHcOsrGnPLx6xAVgxShTaGknK8+LjSjC/cG5VLiT
	pXVxjY4aRRgt44FVCEU70FgXCJQ0AshN10ID/fPJzyklfU/xkH8+3qJZx
X-Google-Smtp-Source: AGHT+IHKzaxS6OOgrxr6QVGgtKNaoeHtnl0XB/OBdOYkzQrDQ8GVUCdJHn166jkKWPW3xC8+VHh/Vw==
X-Received: by 2002:a17:903:2381:b0:28e:7ab2:811c with SMTP id d9443c01a7336-290272e4bc1mr334054785ad.45.1760450345071;
        Tue, 14 Oct 2025 06:59:05 -0700 (PDT)
Received: from 15dd6324cc71 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f8f9e0sm165414065ad.120.2025.10.14.06.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 06:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) undefined reference to
 `devm_backlight_device_register' in vmlinux...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 14 Oct 2025 13:59:04 -0000
Message-ID: <176045034384.1788.868853922191153052@15dd6324cc71>





Hello,

New build issue found on next/master:

---
 undefined reference to `devm_backlight_device_register' in vmlinux.unstripped (drivers/gpu/drm/panel/panel-visionox-rm69299.c) [logspec:kbuild,kbuild.compiler.linker_error]
---

- dashboard: https://d.kernelci.org/i/maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  13863a59e410cab46d26751941980dc8f088b9b3
- tags: next-20251014


Log excerpt:
=====================================================
  LD      .tmp_vmlinux1
aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
aarch64-linux-gnu-ld: drivers/gpu/drm/panel/panel-visionox-rm69299.o: in function `visionox_rm69299_create_backlight':
/tmp/kci/linux/drivers/gpu/drm/panel/panel-visionox-rm69299.c:343: undefined reference to `devm_backlight_device_register'

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+CONFIG_ARM64_16K_PAGES=y on (arm64):
- compiler: gcc-12
- config: https://files.kernelci.org/kbuild-gcc-12-arm64-16k_pages-68ee4f14a6dc7c71db9fda21/.config
- dashboard: https://d.kernelci.org/build/maestro:68ee4f14a6dc7c71db9fda21

## defconfig+arm64-chromebook+CONFIG_ARM64_64K_PAGES=y on (arm64):
- compiler: gcc-12
- config: https://files.kernelci.org/kbuild-gcc-12-arm64-64k_pages-68ee4f17a6dc7c71db9fda24/.config
- dashboard: https://d.kernelci.org/build/maestro:68ee4f17a6dc7c71db9fda24

## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y+debug+kselftest+tinyconfig on (arm64):
- compiler: gcc-12
- config: https://files.kernelci.org/kbuild-gcc-12-arm64-mainline-big_endian-68ee4f32a6dc7c71db9fda39/.config
- dashboard: https://d.kernelci.org/build/maestro:68ee4f32a6dc7c71db9fda39

## defconfig+arm64-chromebook+CONFIG_RANDOMIZE_BASE=y on (arm64):
- compiler: gcc-12
- config: https://files.kernelci.org/kbuild-gcc-12-arm64-randomize-68ee4f1fa6dc7c71db9fda2a/.config
- dashboard: https://d.kernelci.org/build/maestro:68ee4f1fa6dc7c71db9fda2a

## defconfig+arm64-chromebook+kcidebug+lab-setup on (arm64):
- compiler: gcc-12
- config: https://files.kernelci.org/kbuild-gcc-12-arm64-chromebook-kcidebug-68ee4f2ba6dc7c71db9fda33/.config
- dashboard: https://d.kernelci.org/build/maestro:68ee4f2ba6dc7c71db9fda33

## defconfig+arm64-chromebook+kselftest on (arm64):
- compiler: gcc-12
- config: https://files.kernelci.org/kbuild-gcc-12-arm64-kselftest-16k_pages-68ee4f23a6dc7c71db9fda2d/.config
- dashboard: https://d.kernelci.org/build/maestro:68ee4f23a6dc7c71db9fda2d

## defconfig+arm64-chromebook+preempt_rt on (arm64):
- compiler: gcc-12
- config: https://files.kernelci.org/kbuild-gcc-12-arm64-preempt_rt_chromebook-68ee4f3aa6dc7c71db9fda3f/.config
- dashboard: https://d.kernelci.org/build/maestro:68ee4f3aa6dc7c71db9fda3f


#kernelci issue maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
