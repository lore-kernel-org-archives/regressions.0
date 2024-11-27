Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD721272A6
	for <regressions@lists.linux.dev>; Wed, 27 Nov 2024 08:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732694473; cv=none; b=lhWZjC0+1qKiaq88zNFPVHh0cDd6TxZcMd9HfXmHXp+RiN846FU6xDksPvmJIEi6x3zw2yFY1rZH17eFxdpBmAysttBpDTGD7xV/sAnYt9SoqQEYM296ePQBbFjDLm1ypGxrGIFtMSSztGujV0bVS2yTFUndl/PR+tipeOfAc0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732694473; c=relaxed/simple;
	bh=AbkDYsis4owsrh1UCJvHba4T0vyQ/Nv1EmYIBX04NUM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fqSAPvkmDg98x88WtBrcI8bplW/1KgdKRcmna47AUe78x1C4JiqIA0cgRZQHYb9EfHPK7gAvKUFnv6ffITyWUgzg4uhkBBwIi4X/MUdIJvSqVtMGpe0f8En7qBoAamiAxqR2AXgjzFisMt5P5FMGzqD8IOBFtU3RNJppFkEArYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h0xcV5Vp; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h0xcV5Vp"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3ea33a922afso1821657b6e.3
        for <regressions@lists.linux.dev>; Wed, 27 Nov 2024 00:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732694471; x=1733299271; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hYdfHihuwL6Ju6kDqZ75VBX+k7CPPQhvCWcMy8zyxAs=;
        b=h0xcV5VpC+RtXz+ZUbq+jTk4LIkOHq5qtEK8h0POK3ztfovHLyfox+4oJlxBLnjl83
         UqpeXH7EpNBnighw+rzBDgzuEZ+kcPxqZjbpNiGV1VrKW5CZUUITUUOXJSP7oy1uQKuK
         RJMe6mjdlIfcEUXOcj7aS3gQNROUbu1yd6InuFx9c6Atlpt3dSifYmrpf3y/ijdSKTUh
         NFz1mNTLP2bEMUHMeqarr8cgL6ZMKG94GUElVokqBJsoo3Rb/UYefjqSOD7R9SJ/kcSm
         g5Omq73rw/MSrRUIuGUrMx88FmRaKHvP4uG6ujv3xD1w8vhUQybXO3htEYW2NiOstEqV
         nbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732694471; x=1733299271;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hYdfHihuwL6Ju6kDqZ75VBX+k7CPPQhvCWcMy8zyxAs=;
        b=lN928AWkoLRKQsqltd/EClKHSIdO9qMFz8VCGY5B2gAhOwTRaX1yoMctqo40qpmWPf
         aJ2VdTYLc+gED9x5pTIgFlZK+ShR4JPM9sFRs6IL1e6NQ7risR9lVeCql9G3eF6tei4B
         nYcIhe63r6j13G3aySlm2KbqXWY4MQEAiBMtfNeSuRojcHz7JvBrKLyhDiINMGTUhxdQ
         D82ahHZFffSabYce0cDvVv1x6CvUJ9mBhP2ekdraS6XWH3NwUDPODj6yp4CtTU5zfuob
         yq81AaoymoORBHX2rxdNFq2h9IwdE+Jiq0yNy/app6eTQVlGVoZTS3S4M4LWx8Azu4la
         xuIA==
X-Forwarded-Encrypted: i=1; AJvYcCUmmPtp0fBDnbILtrncOySc9W3WOZe0LPs0CaW//O10EW46SfzdOekV2CuJOK4ZFHqjwoy0CpeO630Uew==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUieC85Codj51di332DFNKc/IGSho22V2mRaNp/wTN95NA3a8s
	f8cnmPwRIakpsg+SG4vB6BUMvRYxwZNjZn2BrN/jJkobJ02Vf2Gg9PK8w0CZw7Y0vJz7SnDaDal
	Ze4T5m64p6oSeM4XnMyVRMEDI7BrsxuZZe4IFlQ==
X-Gm-Gg: ASbGncul7rllktAvJv3tV9cVM+HvSepOL/UjCVQ4Sz3iqRokgbu5wL/lD3ESL17y1wT
	l83YH0d6walTZaAay6B1+VNvp7iWH6wZa
X-Google-Smtp-Source: AGHT+IEkxgFBqTgSvpO8yYB0IKDotz+aNBc7IBovLs4xngUKDxA0NRMInMSF3uQ1HnkNvQWdMO6Y8oP8iwyFQF4i8lk=
X-Received: by 2002:a05:6808:18a5:b0:3ea:5e04:23ef with SMTP id
 5614622812f47-3ea6dda02edmr1747674b6e.37.1732694471292; Wed, 27 Nov 2024
 00:01:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 27 Nov 2024 13:30:59 +0530
Message-ID: <CA+G9fYsF3x+ZXURQmgA1yQj-eiobr378HbodpJf4ncng7QYXmg@mail.gmail.com>
Subject: drivers/virtio/virtio_ring.c:1162:11: error: 'struct vring_virtqueue'
 has no member named 'premapped'
To: virtualization@lists.linux.dev, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, eperezma@redhat.com, 
	Sasha Levin <sashal@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

The following build errors were noticed for arm64, arm, x86_64 and riscv.

First seen on Sasha Linus-next 441d2975754ad94f3ce2e29f672824bc2dc5120c.
  Good: 07e98e730a08081b6d0b5c3a173b0487c36ed27f
  Bad:  441d2975754ad94f3ce2e29f672824bc2dc5120c

arm64, arm, riscv and x86_64:
  build:
    * clang-19-defconfig
    * gcc-13-defconfig
    * clang-19-lkftconfig
    * gcc-13-lkftconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build error:
---------
drivers/virtio/virtio_ring.c: In function '__vring_new_virtqueue_split':
drivers/virtio/virtio_ring.c:1162:11: error: 'struct vring_virtqueue'
has no member named 'premapped'
 1162 |         vq->premapped = false;
      |           ^~
drivers/virtio/virtio_ring.c:1163:11: error: 'struct vring_virtqueue'
has no member named 'do_unmap'
 1163 |         vq->do_unmap = vq->use_dma_api;
      |           ^~
make[5]: *** [scripts/Makefile.build:229: drivers/virtio/virtio_ring.o] Error 1

Build image:
-----------
- https://qa-reports.linaro.org/lkft/sashal-linus-next/build/v6.11-25212-gbe03d2e1a06f/testrun/26081256/suite/build/test/gcc-13-lkftconfig-rcutorture/log
- https://qa-reports.linaro.org/lkft/sashal-linus-next/build/v6.11-25212-gbe03d2e1a06f/testrun/26081256/suite/build/test/gcc-13-lkftconfig-rcutorture/history/
- https://qa-reports.linaro.org/lkft/sashal-linus-next/build/v6.11-25212-gbe03d2e1a06f/testrun/26081256/suite/build/test/gcc-13-defconfig/history/
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2pPghaTDWgXtaR5FXfFS4Ay3d4C/

$ git log --oneline
07e98e730a08081b6d0b5c3a173b0487c36ed27f..441d2975754ad94f3ce2e29f672824bc2dc5120c
 -- drivers/virtio/virtio_ring.c
   441d2975754ad Merge tag 'for_linus' of
https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into
linus-next
   a49c26f761d2b virtio: Make vring_new_virtqueue support packed vring

Steps to reproduce:
------------
- tuxsuite build \
    --git-repo https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git
\
    --git-sha be03d2e1a06f7bd4be131c48f1c5555e83470a4d \
    --target-arch arm64 \
    --toolchain gcc-13 \
    --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2pPghaTDWgXtaR5FXfFS4Ay3d4C/config

metadata:
----
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git
  git sha: ed9a4ad6e5bd3a443e81446476718abebee47e82
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2pPghaTDWgXtaR5FXfFS4Ay3d4C/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2pPghaTDWgXtaR5FXfFS4Ay3d4C/
  toolchain: gcc-13, clang-19 and clang-nightly
  config: defconfig, lkftconfig
  arch: arm64, arm, x86_64 and riscv

--
Linaro LKFT
https://lkft.linaro.org
