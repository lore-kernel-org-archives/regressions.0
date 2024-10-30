Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1440D17579
	for <regressions@lists.linux.dev>; Wed, 30 Oct 2024 13:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730294597; cv=none; b=kKnapsq8KtgrVC20OAdwW7xtVJ4cnk6C7g9gD+u6Ku8zbu7IxeaU8LHm0Xxe+Nb14pjskIGvsZE1zMIA4lhe966beI/q2vEhUHDYEEbCub7nLA3BQaY3A83jYxxWKaxhTxcLWX+h+9W10GD7Axk//+ZKW3j5KSwOiQsEPO8RitI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730294597; c=relaxed/simple;
	bh=UZdTEXmqadkkHt28rG2dAdukNK3vdNFsyhUL7P/hmVU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ulUytpE2Mah4bdZANJijuXnXJQayGhA8Y074SkauwvERnSOHtLizMdd5oo5C+JixGUHQOvvZE9+EtfVIR3PNgGf6WH8M9EwjIZpjbo55BcoLxF9/1XoYszVWKjyizGeY74tIkZXMkBgmnRvuTR/+URAncRj99yLFytCaVhfYgT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kj9Gy6uX; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kj9Gy6uX"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-84fd057a973so1724679241.3
        for <regressions@lists.linux.dev>; Wed, 30 Oct 2024 06:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730294593; x=1730899393; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xqOd1GRqoUCqzf3wqicTqRcRpHE5Pp00F4b9OuTbBLs=;
        b=kj9Gy6uX2Ybrlzv0eX6odzOZ+LhPtdQXiTuCw8Z1JK7ZC6dXPyVBSdONmkugCBvkDv
         o9QdQ4W9UIuZPB4cyjPdYfMhHpKpgx0ct5Ry+CFlqJUVks0eMXUpw5gfrAItUdnZPZWc
         DV5Q6yF2enxfwW92yigF6dYpg7t8EI2x95lQcJCLMlaBVVb80bVcEGqK26MKKLsJ98C0
         /sBa/zhpKQNosmeyb9wN7n9zIXeMqSze2Uqh9q82fkt2GEFFFDl38TkqtpEfRTUcV8xX
         cWolDqfpgAKnHxkEQhMXUXvyy0DiCLaXTaFvydBMxzZIWa6Oh0T9bGm+W7ydZ/pWeijI
         GgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730294593; x=1730899393;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xqOd1GRqoUCqzf3wqicTqRcRpHE5Pp00F4b9OuTbBLs=;
        b=mTFiktJSiU+YXLbHWgLuZ/hnsMk/Mk+QjKncuJAEqQGB3qMici5sg7hQjNA2Xat8bH
         O5cvsp1eMDJqIr/Y5oSX9LmKmu1NWFpwLeDXaBTURov2NdLAsgOE/BSqSztQDdSJcSQw
         91858ibHIkARCxJH7F/MsRRng+XbYychIo7arWmhx85f8PVZlIh01rToSE93SWsil0rl
         mr5VP+7bGa2ZvfjA9htdv7azVLB1tYf9ccR8hLYIAkWO7ebp5HgItkA7LijXVJotxR26
         RMPGeWGu571mE5wzZ9c6DBplip6aX9/gwH2Qp4YLMf6zp229Mo/PYpCloQaywxHA3ES6
         z0Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWE0yHZMOBBxRfxhIz3kV/JVoWIgGF9U5645Rwpwe3ciHyGvRHlG7sSLyx7OBbHpkztdo5LMPyPCxmpgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yza5DdNYJ2vnZUVWaPky46WvssbrI6MGcVr8+T+bmfexBysE5xQ
	8+JORFwsIiXB0AXs9NPUNWQiHkBsmYokjkOt30tc0lwdqC+GcCM5xEzvIr7UaGmbHn76xRGtpfS
	F4Bo2d0tQ32OqArC90jVTSpu8gGSUdUrpi7XyMA==
X-Google-Smtp-Source: AGHT+IH+WumONmNdzunnvczfZxAebXCyl/J6gvEjlXtHtquei4NUDtL+2W3YfXhmxPl83u3TC15QF98lawvQNCJ4xU4=
X-Received: by 2002:a05:6122:1697:b0:50d:3ec1:1534 with SMTP id
 71dfb90a1353d-51015071471mr13246416e0c.7.1730294592926; Wed, 30 Oct 2024
 06:23:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 30 Oct 2024 18:53:01 +0530
Message-ID: <CA+G9fYvvNm-aYodLaAwwTjEGtX0YxR-1R14FOA5aHKt0sSVsYg@mail.gmail.com>
Subject: next-20241028: gcc-8-defconfig : ERROR: modpost: "__aeabi_uldivmod"
 [drivers/media/dvb-frontends/cxd2841er.ko] undefined!
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org
Cc: Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The arm builds failed with gcc-8 on Linux next-20241028
and builds pass with gcc-13.

First seen on Linux next-20241028 tag.
  Good: next-20241025
  Bad:  next-20241028

arm:
  build:
    * gcc-8-imx_v6_v7_defconfig
    * gcc-8-defconfig
    * gcc-8-omap2plus_defconfig
    * gcc-8-davinci_all_defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
ERROR: modpost: "__aeabi_uldivmod"
[drivers/media/dvb-frontends/cxd2841er.ko] undefined!
make[3]: *** [/builds/linux/scripts/Makefile.modpost:145:
Module.symvers] Error 1
make[3]: Target '__modpost' not remade because of errors.

Build image:
-----------
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/build.log

Steps to reproduce:
------------
   - tuxmake --runtime podman --target-arch arm --toolchain gcc-8
--kconfig defconfig

metadata:
----
  git describe: next-20241030
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: 86e3904dcdc7e70e3257fc1de294a1b75f3d8d04
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/
  toolchain: gcc-8
  config: defconfig
  arch: arm

--
Linaro LKFT
https://lkft.linaro.org
