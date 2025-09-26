Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B9F30BF7E
	for <regressions@lists.linux.dev>; Fri, 26 Sep 2025 16:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758905948; cv=none; b=ewoRcRfDIehZ4bsfmoM0zsCyjlM/RgnIYUXlWevSQ05PQiTlSArO/vT8xvboVTkt0gn/ZywjBRaIo731FSXorOdVRBedbvKDanTybZWfS3SDVDic30bXTHad5hR57+GRNf0J1iaUsu7t8xXHW21U72fF4J8DrI7lYsgCcVrtzIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758905948; c=relaxed/simple;
	bh=ZDbPNNwTc2xllQRq1upDRo55Uwg02Ak3IPmyPJuzBbA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=G9R1VWvNAuCZLQqMc2KDUIE2Nh5KcuIv7oqDIc6nwmdT/gskQKdE3C0Z6i74JZxurZtuisbGOy0XxItzib88MRKrnPd0CkpIxmN5AnLZXILZd2ksDG0OwRjhdF35cWeczD9Mv6G9sZd9UeDtd9jypwOBQW5QSQbDME3A4Koj754=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=N0GfR01z; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="N0GfR01z"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-269639879c3so23244205ad.2
        for <regressions@lists.linux.dev>; Fri, 26 Sep 2025 09:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758905946; x=1759510746; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9wF9E9YK/j++mNxViwWRBp72k3luVN6k0tCP2GBCao=;
        b=N0GfR01zwdCf8KIEoC0hx5h34HogsVYKTqKS+bXQAI6Hwwj447tLK7DKridmggaHvA
         CClFQ8whUXKe/Eey2IL4Tqocxgoyb6ZzRIWRxk5YcJhZvpz4MiciAo+cl+wVgZnKHnay
         cT9O1Lxqeeya3zrWsZ8J9NBC4fF81qlswUpMk2PHxrugh8GP6V1H7RmFZNRj7+GjJ7sB
         5N0PCWAGyEBOI1lCySM/7iIe9Fvwybn1E3fyaNkYIH9mHbhfLcpnJ52g/6IZtD9CubCX
         qWXWIXZ7TxjbIdZHv7RLb3LbLcafQmbimAv9/pF0AhQckLpH2EgN9JjUM4RATGtoEoAB
         kr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758905946; x=1759510746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P9wF9E9YK/j++mNxViwWRBp72k3luVN6k0tCP2GBCao=;
        b=iBek2AH3lXmrZg5qQlBrW5QC1DmdSpvUcLZG5KwpUt4D+KY/JLRcsfKeAF8OIsKNhe
         4xDREvxNL2xmRj3r7zATCKEnV4/vnu0B04S6yfjgelvYVrKfNE1grwjxp1zhNSm2gZXa
         re2EahUYPqgI1vmgQ+P7FG8JMjsI+VEbJi3je4OHwRc8b2s4rWuEwkS5IPwRt+qFXiNB
         QyDyVb80G3PHwJKtvGVOaku6eNZoScL2C9XJeNi2eFwhN52cx1CzwP1+R71oIPmXgvMX
         +f48ZUEJC+Dtd3Uyh4SGfYgoEZEp0DRmefZkx50l2UAhKn4BbbyGVxn/9zr3b8btEkC/
         9+uA==
X-Gm-Message-State: AOJu0YxFog3HtLyYPmqho8OMLP8JTzMBgED7C73rEcGYeDBfuFUyes0I
	t5hAX6ORsT4g9RNuREyqRADtVi28IFhOXsBGdPsu3/FfzEtMu6l5yTQgeh+zt138xTHIep0yt5I
	UcYgS+Tg=
X-Gm-Gg: ASbGncs47JCHPyEFyWFwOSni4uC4J6CDcMUfZJsr8Y5+yC+OY10mSk7qRdPwM1x6lnu
	ZcUyOv7uTUIC/y3atk7tYu8CF26g8C99q7y75PzGYkT4+jl34YoVPm3lcfu2MJ3bwvuIofMfAnt
	dbORpMBWFS1W80uuMbKvjFdvohmmcCuZ4loaD41XVpNi2Bdijkk6SqTrHt0lWxmUj0F7yILfu4c
	kSPcpjD3Zg+vKJG6F7ZoFq7c2Ua3e2nDdiyPc59y6ixXjo3WNbfKAjNd8q4B9Xdmo3N8FDQEVlf
	TuQVk2vDQYcmWWBIW6GpKj3VJVxr1jcxfz2MDmWVFlZpW7E9UOSw9PSYT+OelEAaOfJdRBAYTva
	ZoPAC4pkR/UmjOhuu
X-Google-Smtp-Source: AGHT+IGdKydcAVudfo8tRjb74df6pGgrnXhjaVHzSaErxWrZA+8R5urcxY7HAacsddXeHVITgfN0qA==
X-Received: by 2002:a17:903:3d10:b0:269:74bf:f19a with SMTP id d9443c01a7336-27ed49df3f7mr104309095ad.11.1758905945942;
        Fri, 26 Sep 2025 09:59:05 -0700 (PDT)
Received: from 1e895cdadf47 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6aca043sm57601085ad.138.2025.09.26.09.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 09:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) undefined reference to
 `pm_hibernation_mode_is_suspend' in vmlinux...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 26 Sep 2025 16:59:03 -0000
Message-ID: <175890594349.36.5014274970333071394@1e895cdadf47>





Hello,

New build issue found on next/master:

---
 undefined reference to `pm_hibernation_mode_is_suspend' in vmlinux.unstripped (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c) [logspec:kbuild,kbuild.compiler.linker_error]
---

- dashboard: https://d.kernelci.org/i/maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  262858079afde6d367ce3db183c74d8a43a0e83f
- tags: next-20250926


Log excerpt:
=====================================================
  LD      .tmp_vmlinux1
ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o: in function `amdgpu_pmops_thaw':
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2677: undefined reference to `pm_hibernation_mode_is_suspend'

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.6/x86_64/chromeos-amd-stoneyridge.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d6bd56aabea828fddae00b

## cros://chromeos-6.6/x86_64/chromeos-intel-pineview.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d6bd59aabea828fddae00e


#kernelci issue maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
