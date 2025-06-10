Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED95C28C024
	for <regressions@lists.linux.dev>; Tue, 10 Jun 2025 10:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551145; cv=none; b=BDgGMqMEAtD/fJRAtPem8nULO53i77+MiUWfo7aDXI4WLncjQ5a1toT0VVowM/BbXXSfwh3yA61linPWhsP80Hu16yfvESlXl/OFWR3B9jkdFlmg+wF9mkCWaErZcOaC/6LlPffNobrZF7reBmjLLGHGTeHf7RBUnSuPGfqHXkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551145; c=relaxed/simple;
	bh=oHV889pk9/dbexLINzXMTXrUu3qmaDgybAAQrKHQt4s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=g6mphfiXsJr1ce2aNsdYfdxYC/4Txkb3jesQnZhV5ghjNgddE6Cqm6ZoiI214RyMLXAAS8HfPzKLQeWBG0ppVP9ENOpRna03+bsAu2cChOQgHTrMuOQY/bhpMq7iHCpAN8TqPvFboV5oarucVXLd16mz1oaZBcfk7UoB+HMlFlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vgo3Uwkb; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vgo3Uwkb"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5290be1aedcso4166373e0c.1
        for <regressions@lists.linux.dev>; Tue, 10 Jun 2025 03:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749551143; x=1750155943; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/KbPqIjq6A0gP5OwcTzAJtKToDqxED7lTQn+3ShWhu4=;
        b=Vgo3UwkbZOoitV7ckRGP0arb2dTfNyBkP3TrmP4a3N7xC9ty88w2987SNweQSTweWO
         WCzD+jdVOMdLqyZEYvJp4+U32mE8TBNSShaHas3r79c9R8Q/OYePx8hZzlucvX7Bt76F
         EJ8D6RdWh8c1S8rCQUm0WICKQIuAEH0AXjDYgfBsS3Fyksu2Kh1UZiKfl2dBSZqvxjgh
         8FDAbjIya4f541jD0kJzvaXBaNYh/EJRc2H4iS8AtdTNuiTKHm+q3wof8UyteQPVc/yY
         Ha3NKr9ChloRKZcC7vUq2pZUrcF7EwPSAmLSZaBhC5wNKYSyJNeQYTN7rJWbW4rF+qTS
         A7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749551143; x=1750155943;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/KbPqIjq6A0gP5OwcTzAJtKToDqxED7lTQn+3ShWhu4=;
        b=EqPZOLCshBSZTcSJQFKR6umQyM9eBI8swFYkOU3VuKbZp/7OjCzynxjDkFvNYDqr8S
         5PtdtB90OLRO1ufCLnPf/bPGTxLkuJr/m/YP1KMRi6E1TPB4sl96+QDJ7FZoDKxDwXtm
         EdrcuwuiBJuwsFknUb3ouVmV3XPtX94ZmFWkCoe/AtOZ4ffXEP7p6hfm3xVfpfMH3vZL
         fi72VW8u5Lckv3urEq/B+ITdK+Aym3JENx5Lc4PmLK3iYXeN81jtqzmyBC4aLsaJ8IKN
         Td2xm3pmUqrIxxfVq4ndgLDYX85xfgknml7xcvWgR1WzVcJTQ2azUZkxjvPgwPBbAHqO
         3XTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDvwjXXME6y4p4a3kryX94yLuQ/2wOYRGq0IMs1bL7X0E5UKZOqnwvEIpHKKNQMzEUlH3MZcChHHno2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzN9Q5KZFToUBaY+TAI27q8EiCZk6YY9OdZE6wkZ438GnpuihhH
	iBmNfdiVoYgzqfA9+pBwIUNZ6hq3GoZyzrEq5l+aaqQAhduAAmCoGx4aiJdizMxzSM27Rjpr4pg
	ROcQMZltIjSqwjTT89Vav41WFlMJ8aNk7EMNmLWOilg==
X-Gm-Gg: ASbGncvjdUGCoJ5TnkTShwv8sxjZfgyjf9vpzRJeW277JhvurmcJNFkBDeRyPjQL0sE
	AzrrfJZo5OU3WJgZFr3wYW6o5xPbVi07s596X2qgr2RL68zVQ1zxEyi+MLejdyBIdKesksrB2WN
	NqQ4Q1GiuyxXcxi6h2dV3DyS5+s9PhvfO7V42ydZ1UeVoRoQEQughovo393V6rKmzm2WYLox+2h
	YgRjJspWNRnQM8=
X-Google-Smtp-Source: AGHT+IHshLTe8OuH7+ip/8ueWp0i74zRNPn5hHiiSdvdI8UuOJ6eD1FAplWjvLZQZJWIGjYXeSMeV/zYAYuInU3pbBs=
X-Received: by 2002:a05:6122:640c:10b0:530:2c65:5bb8 with SMTP id
 71dfb90a1353d-531131187b5mr1514506e0c.1.1749551142776; Tue, 10 Jun 2025
 03:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 10 Jun 2025 15:55:31 +0530
X-Gm-Features: AX0GCFuPO70Fr5H2aOlLeOzXniiVZlpD36FORRmiAmu3qpXvFghQfZN4JyKcc9A
Message-ID: <CA+G9fYuppX5LeRjOAZWsYRCs76PVbnv-TN_RrszhDsk=KregyA@mail.gmail.com>
Subject: next-20250610: arm64 No rule to make target rockchip rk3399-rockpro64-screen.dtso
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Regressions <regressions@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Peter Robinson <pbrobinson@gmail.com>, krzk+dt@kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Regression while building arm64 with the Linux next-20250610
the following dtb build errors noticed.

Regressions found on arm64 builds
- dtb build error

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

First seen on the next-20250610
Good: next-20250606
Bad:  next-20250610

Anders bisected this to,
# first bad commit:
  [49760b9f60528393cca3ea35c4d0719f84215a48]
  arm64: dts: rockchip: add overlay for RockPro64 screen

Build regression: arm64 No rule to make target rockchip
rk3399-rockpro64-screen.dtso

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build error
*** No rule to make target
'arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso', needed by
'__dtbs_install'.

## Source
* Kernel version: 6.16.0-rc1
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha:  b27cc623e01be9de1580eaa913508b237a7a9673
* git describe: next-20250610
* Toolchains: gcc-8, gcc-13, clang-20
* Config: defconfig
* Architecture: arm64

## Build details
* Build warning:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgmzjEl7VszYE9/build.log
* Build link:  https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgmzjEl7VszYE9/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgmzjEl7VszYE9/config

## Steps to reproduce
 - tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
--kconfig defconfig

--
Linaro LKFT
https://lkft.linaro.org
