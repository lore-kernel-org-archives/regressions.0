Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91A42652A6
	for <regressions@lists.linux.dev>; Tue, 23 Sep 2025 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758621074; cv=none; b=MP3W6QkhWkZ9NZtLaL+2s8r3sxqCthFzQzNNY0E17rHWzLl3doCr2dAa97GkGvlwWXuS8WYQpXpQDiCMzyWBHVLAc1HpYAraRwQgpuUIsB9tKCAoOZxF+NeiQv+A2B/FyxMX7ocuWVdWXKUBm5HK5ZZv8O1MAjYHL/VQQ5jcfaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758621074; c=relaxed/simple;
	bh=aXu4O1FN+YVhKDNpeEOiwXtioblobCHbcZCuvieGJ5U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=vCpDw1E0wHMjc2b49/LpJ80zvTZQ0EMaX+3iqagokxLd4FUxk5iPCajvbSMSur9N3fnbR4P7JS5tNG3rBv0xwP0E4gcIAQuvVIA6OdA/QXKhdZIlLfpsYWp8EEfa0FhaKC0WBZK2APuY52iKl7osXJCo+N9HrcluN//VgQJSQxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jMXsFu7z; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jMXsFu7z"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-267f0fe72a1so37532145ad.2
        for <regressions@lists.linux.dev>; Tue, 23 Sep 2025 02:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758621072; x=1759225872; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ujUSntEdEB2Zj8RW3cXBNzPb5lb7mNEARj7gYfxpl6o=;
        b=jMXsFu7zAROP/mkxSe1CrBHTaC5uZVBfcy/kq+lx7Ig3RziM4YVRhfjN3kQwoWeuQS
         J5JyQt6pE87jBkneOESKrzGygYw2dkPoFBDlRd2Vawg7WU3SxsWbAQCqOx1T2DCoOBJ9
         JVnyk3r8eV+rzJ8881kD8AJHZXu/XtibJi8Tu5hf2Z3UmSrX8WyU90piVrW50dEoO17d
         ua3ZBqmVdUAbabvZ8oG/FOs9pqASLCyxUWU21xjcOYb4M25zWnFAzjN83hIoML3JZ/pU
         n5hffTqoX4OPfz+U2w7ZnThv0BnfCBzAKRWmCefJBlgX/WzqMD0JElfkUMfN7s55cflG
         7kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758621072; x=1759225872;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ujUSntEdEB2Zj8RW3cXBNzPb5lb7mNEARj7gYfxpl6o=;
        b=lKIfAeFwVnd6FvDO6lwzZa6IhDXR6tu4Irebyzz7PDOsoA06mUeSNc1GWDpizf+xer
         3dCi4AGxJJGRvewLqdOpRsQUbMy2huJfeDJT1kbcNTlGq4bim9KjzT2lPWT2Dndp3Ttp
         V67tCUhAugwedLpaI83bfiH0Oc7URaMGz6qdHYcXv2jW5Np5TFEdVNByszM2ST7H+UAc
         bwYs5mxtD5HsGXOQinamt3gLhMCtEpuYUSn1f8u28iWgNDMcSw/8XYsNQ26gijQfQ6U1
         79hrSWlgQ5kudAuAdH+YluDwWTBIjQGrORfktkuvqFvVNEd2liQtnY+d64eKpm/stE0x
         Dyng==
X-Forwarded-Encrypted: i=1; AJvYcCX1Q60rfPe1V0ivz4OyfO07G+ci1XiiwgiHdtO9mME+ym4tXcz+CWjOIR4FQYWiJdDyRbL61BOd9dbbVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxaW6hJ0/UUyupVxn56W8uRdwiUCnGJ+DVf1YldeTW2jvECVBTV
	0TEgwaXjoM8LcblsAKNmycQiNBrmZM5ftVbApGF7qTEZxDosQkFYjrhy/mu/YrECd9RujRWzDHR
	AWN3zimW8Jvbl361hgv3mCp1tND/Xc29CoZU+XKopoQ==
X-Gm-Gg: ASbGncu4qlGyQygQdCdlHmf/kOSmfofhSORLkJsLMBVBiIuuq+jeNPKdrBSsocPPTCB
	Nwn1sRfwbYcPMPPRty5JbHihson6dd2xpHqI94HCFFjuH1RSaC7YhH3EH7I3SgkADSkBL3jB4ed
	9mzlVExr3FuwUvoIRsatkvqRQJgztYyujpMtyKe3/lagyWkctRerBlRhG0cXYatLMWBB4ZYg602
	6KeaIBPj2UJK0ZpL8Sg9jP6myVviubxwAyAzFpAlg18DtFqW2g=
X-Google-Smtp-Source: AGHT+IFHus42Ak5ruWRhTAyg3xMfr+guDvkTkhHI6eHQ3GvPvUzkyf4uNtM2sp4MCW+8IQd4OjacMuEUwlCpUIFW7h0=
X-Received: by 2002:a17:902:ecc5:b0:264:c886:8188 with SMTP id
 d9443c01a7336-27cc2c98b42mr26887555ad.24.1758621071785; Tue, 23 Sep 2025
 02:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 23 Sep 2025 15:21:00 +0530
X-Gm-Features: AS18NWCTfgTcnoVtFJ38FtxMSy0NvoryOqAycB2FQR-fdtYRDlc0bdIbrsPkR5s
Message-ID: <CA+G9fYuZZUQq=7qPavXnHZtX9oQ=amfYVeYRZu3SHfD0ReD6nQ@mail.gmail.com>
Subject: next-20250922: xe_device_sysfs.c:300:25: error: label 'cleanup' used
 but not defined
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Lukasz Laguna <lukasz.laguna@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>, 
	Jonathan Cavitt <jonathan.cavitt@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The arm64 and x86_64 builds failed on the Linux next-20250922 tag build due
to following build warnings / errors with gcc and clang toolchain.

First seen on next-20250922
Good: next-20250919
Bad: next-20250922

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Test regression: next-20250922: xe_device_sysfs.c:300:25: error: label
'cleanup' used but not defined

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build error
drivers/gpu/drm/xe/xe_device_sysfs.c: In function 'xe_device_sysfs_init':
drivers/gpu/drm/xe/xe_device_sysfs.c:300:25: error: label 'cleanup'
used but not defined
  300 |                         goto cleanup;
      |                         ^~~~

## Source
* Kernel version: 6.17.0-rc7
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc6-next-20250922
* Git commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
* Architectures: arm64, x86_64
* Toolchains: gcc-13 and clang-20
* Kconfigs: allyesconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29968978/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250922/log-parser-build-gcc/gcc-compiler-drivers_gpu_drm_xe_xe_device_sysfs_c-error-label-cleanup-used-but-not-defined/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/333Idt9y0485dJThIiCgCMB7ehs
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/333Idt9y0485dJThIiCgCMB7ehs/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/333Idt9y0485dJThIiCgCMB7ehs/config

--
Linaro LKFT
