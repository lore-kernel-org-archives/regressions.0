Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8858B101F2
	for <regressions@lists.linux.dev>; Tue, 16 Sep 2025 06:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758002606; cv=none; b=bILDIknwkPIxxrE8vNPH01mP45XxHaGJ2tuqI55I7mefES+NtUhftiwQRntwuxkzKtYQyhtpOgdg/HCa3QQ3BEwiH3MNrgfUTmK2Gnug3qB6j7W+DcYojvEklS+zQvDrq6MKR70xkXbOdkaFHT0z6zYOrtFmJBD9Tgm9dCL+fUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758002606; c=relaxed/simple;
	bh=yLz9txVwcnZbWd4ywhxn8K7GFJpnpjcbZ8DpqsNG4Sw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZhGJKns8H7XnOZ/U33dw7fLJL0OOvYRGenpNCTjtEDOAjMggYJ4qHLwj7kBhOcWUciFoNoVfLo25iTsTpwMhBWZiCSZkiBoUIaQ5qtHJg2MidAfZo8VgLZ0hzSzg70J6pkd6eoay/LM5pa1OoJY0KxhkHicsfKTtedxeS7+o86E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FBXA/Wxh; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FBXA/Wxh"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b54c86f3fdfso1401043a12.1
        for <regressions@lists.linux.dev>; Mon, 15 Sep 2025 23:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758002604; x=1758607404; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rOJIcs5drTzBTEY0tV1pMT9TX9JsWUffwaHGsiB/nGA=;
        b=FBXA/Wxhla4aCj17vPa1+x8nQR6HUaOzGr2AMEYGZnowhwsZPNhLXL1M/62Lj7HF0a
         U8D40Uh0oZrxZKlc98AI6c/TCqeUOlZIe7eUdm+yKRNOyCpCDKdZrkoSesGx3E1CHUV1
         5deIVWgK5WMqoQI2A1NOALQPrBMp/qEgBF+i7LUxRm0WBgnkpH/5D4QMCB6gFpKu1TaL
         aIXH5dASLdAr1naZGYUcokzuC1LBcHX9ZucslBSs2hLlrHlHtnm6uBlfZoJplrFIKYIq
         dD6hfP4Ed2ZKCPY2ctOzNKjLT1SObb2XYuLX3t/nsHLNu2ffqgOI/y4eXT51Ow2ytRnX
         3Biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758002604; x=1758607404;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rOJIcs5drTzBTEY0tV1pMT9TX9JsWUffwaHGsiB/nGA=;
        b=tfV50dzBdPVaWdl//0cmODNYKNSdWEj7PxqwDPEtQQJbG1SGHIjFEEfqIwqn0B34iy
         FxvLl0VT6F7jBYR4A74Br8FdrxsnwkHbFMHMNTv7lUDCUxaPypXvtlDwPrrazY6YNvuO
         Z7Zhmvay95a/tw+wWAy2krpa5takLAEFv+B5uSBwharq13/Dre8/zhslxidZh3c8/YkC
         4VUbg447PLl+gK5K8WA+a7eitDiYhr53yDwhj8FzNOtO/Dcr+dzCh8f+Csv9spUe7Fsd
         6gsugK7RrUewGB3IMBwjkystjYr9rh573oxvC5uODmqlKARk5tntXO5nG5dnytDgXDsr
         2SfA==
X-Forwarded-Encrypted: i=1; AJvYcCU1PyGMdbO3yskbeH8Z82pEkjQK+6daMqfaBSt9x3uOpWdrcrJ1JHYKr87o3nLbxYPMEJ9FPM5o0XbQhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDXFrQqHUrtqkHvG0B4pwjIJgSOE4/+3X5CEb9ZoERxjmsBAcz
	q/oL8lE8ce7NM44YtqcVvIAVb6uIe0a16mHZf4MXXHkn2oCvmpi+cnnTjQyNH8cIneYA8+eFMvm
	Aee/nfQQZj7b2eTk+tKDgqkfKNAiOsmut6ZhUBDmmXg==
X-Gm-Gg: ASbGnctVu5PfAbbwOJU7dCNEse3zr3CpzkEaVKgI9/hSVFHOdD5vAliYIrTutxLhvnx
	0/azUQ7ixPAQbNFKb0xWCaF2WTG3hUYvBLqPadNZUjbS0cEf9QEpNHwvoHuJLjQa+uIop7T4qC+
	Yxl8lSFeN+IHQOsN3fYBDCiwTSJVM2vTvSHVlhcN97IUkUUbQYZlQ0/Bd5DLR1amIfxRQQhTUOH
	AdwPiuSEprhjBw5TDyM7C0ujDapmAM9acog5xu7GRXE9wvH0LJQLYya9ilGlqxlvy9q800C
X-Google-Smtp-Source: AGHT+IFV325JIbcAfi1+4GJFDPX/Lf6OkNWpQhdHX1kwwf8lrDz1Wr7tESi3mLj2u4jharlYlnA+pRIIqSG0XyZXHl0=
X-Received: by 2002:a17:902:d2cd:b0:267:44e6:11d6 with SMTP id
 d9443c01a7336-267d1540ec7mr19417725ad.6.1758002603798; Mon, 15 Sep 2025
 23:03:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 16 Sep 2025 11:33:12 +0530
X-Gm-Features: AS18NWCGBnaNFEvWs2ru3e2aqzs-uznr7CWnwt9WJqflYhg3DElbi0V21AVd2FA
Message-ID: <CA+G9fYvH8d6pJRbHpOCMZFjgDCff3zcL_AsXL-nf5eB2smS8SA@mail.gmail.com>
Subject: next-20250915: powerpc: ERROR: modpost: "libie_fwlog_init"
 [drivers/net/ethernet/intel/ixgbe/ixgbe.ko] undefined!
To: open list <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, 
	intel-wired-lan@lists.osuosl.org, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Alok Tiwari <alok.a.tiwari@oracle.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, 
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>, Qiang Liu <liuqiang@kylinos.cn>, 
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors are noticed on the powerpc
with ppc6xx_defconfig build on the Linux next-20250915 tag.

First seen on next-20250915
Good: next-20250912
Bad: next-20250915

Regression Analysis:
- New regression? yes
- Reproducibility? yes

* powerpc, build
  - gcc-13-ppc6xx_defconfig
  - gcc-8-ppc6xx_defconfig

Build regression: next-20250915: powerpc: ERROR: modpost:
"libie_fwlog_init" [drivers/net/ethernet/intel/ixgbe/ixgbe.ko]
undefined!

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/swim3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in
drivers/net/ethernet/freescale/fec_mpc52xx_phy.o
ERROR: modpost: "libie_fwlog_init"
[drivers/net/ethernet/intel/ixgbe/ixgbe.ko] undefined!
ERROR: modpost: "libie_get_fwlog_data"
[drivers/net/ethernet/intel/ixgbe/ixgbe.ko] undefined!
ERROR: modpost: "libie_fwlog_deinit"
[drivers/net/ethernet/intel/ixgbe/ixgbe.ko] undefined!
make[3]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1

## Source
* Kernel version: 6.17.0-rc6
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc6-next-20250915
* Git commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
* Architectures: powerpc
* Toolchains: gcc-13 and gcc-8
* Kconfigs: ppc6xx_defconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29894450/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250915/build/gcc-13-ppc6xx_defconfig/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/32l4NthnSk7ehgpfv9NJaE6gjqk
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4NthnSk7ehgpfv9NJaE6gjqk/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4NthnSk7ehgpfv9NJaE6gjqk/config

--
Linaro LKFT
