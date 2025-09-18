Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ECB298CA4
	for <regressions@lists.linux.dev>; Thu, 18 Sep 2025 18:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758220532; cv=none; b=liD+3K0JSYjDx6/EkJBGNgIEN3nGB8heSbwdHxtKSC4Xt7p0BCamyBfauMY442bunLr5/IDyiDA2cZFVVbMVUKvyHWtkkF1MsJG67aMaYmPwtZPGzNgAQ8xJyDO+bcMpr5wFaT1FZ1GpiRNv8JyV8lE9JS1T+fBgmVyA3wJIfmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758220532; c=relaxed/simple;
	bh=7JWrZqhhxtwxsKzUS484cYA9BE4S3MG4+Hm4TzvixgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TIkp4nBKWjIGRidFBABpf5sn9eqWR24HogLUOmSNhO1Ykym0/rPTloHR6jKhJTDhMxSwBKDUCz6bFSw+i6FQbOUrCri16lIi/VAr4Qvpzlk2+Fa4oBuR9fl//b8uz4d5d4EYV2lT2cLRr0bK4OF1aoAwnLSw9wDkIklZ5sHK1PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrHweXBS; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrHweXBS"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b2350899a40so123015266b.3
        for <regressions@lists.linux.dev>; Thu, 18 Sep 2025 11:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758220529; x=1758825329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DF8mdGy7rQ30a9eWz48AP7z4kPvyfSZCRABtJwRlC0=;
        b=SrHweXBSQvDPFkACCn3sUAPQEZX6nlJ7G0/5zy0G/po5u2RuiSgkNYx/ixq15XMhcW
         iElg8eZe6MN7LYX5Khxx4kLmXdw+PH33vL3/tnKGuO7M+J7mWAuSEN2ataH0Rri/Lurf
         iucW/Bmr7L6Pi6Jj06/gIjgjycvIg8wov0m4xD4z7RrOYsKPzzAmwH/kfQSRw5TNoRvc
         SQr9diKq+eZWv/tS/gOjzVZfDGrg0FrtiWTNx24TuI3EKZImTnHArxWdtTr8YO/1tIRP
         JRbU4b2x364mA6dvl3xG0zO4kP7mhd/yRc5jpRJE339VZZkGtFnybdXEr7D0iXyI0FZ4
         R0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758220529; x=1758825329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DF8mdGy7rQ30a9eWz48AP7z4kPvyfSZCRABtJwRlC0=;
        b=TRt2rZy8tYeiNbvEHCgnVpWUKoORbvGpc9pRSPGM4DUcWHwuixfjvOiuLsttoMqinM
         v+rnzhd/LvUnbtUNnjbOVZ7/1nnKvNlSC9xOJbVKK/I5o8iZgjnhK8srgDR/jhnRtZ5g
         b0rAeo+d3I6x+VcZJxjatKhk1kXIrnOigEmp1fOcvAYImp5t0yJNr32GXG9+WqQoYXpq
         dGhXnA37Zqa8omS63LQZL2V7FNBs14aUt8/y91qo3+0KKaIvh28L0+bUp45aN0RoPOrd
         EQ5x115jOEowOdw5++xxr0KEZ9p5wYwjNDloyQ1r7tv7DimYjAheZT0LYlJejrgocIL3
         l5RA==
X-Forwarded-Encrypted: i=1; AJvYcCXXROL4jVlEvo6gYrX53OBqKcpHMnePJ2c8PllNQzWa5cTS8uNG5s+E3KAeoT8/UYONR+ZwZM2Lws1wnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZq9sb+n6Oh763K63j79mAJCFhYuR/UWCDi8VpyFza7VqmRebi
	YX0zWsXw65Er6TgqGSv8Z0Bj9d4OB4rE9XGJPwnTixVfl9UZ1LnpqQfg
X-Gm-Gg: ASbGncszUgBL3sIFb77v52zdjjUpjqps+PNi48cHKaq6Bi8t8qCx1xtQqjSizZYaPCD
	HqpFKwqpMQBsHcWErR3UhoQKvtyuv26HFXUruBQCYNiC1VdY8vR5TeDjnFlXXnFevw9P7zIqs29
	A2R7IuQDe/Kl3MTkSa/XYBXk08+YjL4FgvBND8BwcZuqSi6HsIBmKApaYGlsU64TXcmSxwRVpIU
	AZ6DSyCT8lu/+A7eIkxmqXcCD8zJyQqpsYeFbAcTgF6PEMKWbNJM/BtFomo58F7QVpABPnoXVy7
	DZSO1fUPPUbqHBL5iCTSDdXJyEinc8PA4FgefnV3z3ZM6LpWSEU/2es8pFO0pht0F/AJooyNBSs
	wLgmGBmLDFpxndX39S1Q/jsF9U3tYsM7ZK7KY2Nc=
X-Google-Smtp-Source: AGHT+IG+2F9Tdqn75yCUehgh0hWjS/B3B6NaTXRMxweuRMKUwCI/DRvlIaiDT/f+5WUUCMePXP8wBQ==
X-Received: by 2002:a17:907:728f:b0:b04:9468:4a21 with SMTP id a640c23a62f3a-b24ee6ef486mr25159666b.14.1758220528565;
        Thu, 18 Sep 2025 11:35:28 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b1fcfe88d97sm245887466b.58.2025.09.18.11.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 11:35:28 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: Dell.Client.Kernel@dell.com,
	bartosz.golaszewski@linaro.org,
	benjamin.tissoires@redhat.com,
	dmitry.torokhov@gmail.com,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	regressions@lists.linux.dev,
	rrangel@chromium.org,
	safinaskar@zohomail.com,
	superm1@kernel.org,
	wse@tuxedocomputers.com
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own from suspend
Date: Thu, 18 Sep 2025 21:33:36 +0300
Message-ID: <20250918183336.5633-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aKyDB7h7cUBOLbiJ@smile.fi.intel.com>
References: <aKyDB7h7cUBOLbiJ@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andy Shevchenko:
> In other words we need to enable debug of the pin control subsystem and see
> what it will print in dmesg.

You mean I should enable CONFIG_DEBUG_PINCTRL? Okay, I did this.

So, today I tested everything on fresh kernel, 6.17.0-rc6, without any
patches.

My config is: https://zerobin.net/?ebecc538f6caa22b#88c2k08G8+cZoMjgU9N/WYy28qQjyBW+/H78ygujZxY=
It was generated from Debian config using localmodconfig.
I added few tweaks, in particular I enabled CONFIG_DEBUG_PINCTRL.

# cat /proc/cmdline 
BOOT_IMAGE=/@rootfs/boot/vmlinuz-6.17.0-rc6 root=UUID=015793d4-ad51-4da7-844b-fcc3bcb13a0b ro rootflags=subvol=@rootfs log_buf_len=4M ignore_loglevel

I run this script:
https://zerobin.net/?327f3aa3ef7ce845#Ycu017J9YbRga8uGaCKRzsH7J/lB8D4RudpwTll5lbo=

This script runs "rtcwake -s 6 -m mem" multiple times. Sometimes my laptop wakes on timer (because of rtcwake),
and sometimes it wakes up too early on its own (and this is a bug).

My script did suspend 7 times:

# dmesg | grep s2idle
[  117.934504] PM: suspend entry (s2idle)
[  127.141741] PM: suspend entry (s2idle)
[  131.299554] PM: suspend entry (s2idle)
[  140.034802] PM: suspend entry (s2idle)
[  144.592260] PM: suspend entry (s2idle)
[  154.038621] PM: suspend entry (s2idle)
[  163.034299] PM: suspend entry (s2idle)

Out of them my laptop woke up on timer 4 times and on its own (i. e. due to bug) 3 times:

# dmesg | grep 'woke up'
[  126.087936] will-wake: attempt 0: woke up in time
[  130.248820] will-wake: attempt 1: woke up early
[  138.988770] will-wake: attempt 2: woke up in time
[  143.545973] will-wake: attempt 3: woke up early
[  152.993654] will-wake: attempt 4: woke up in time
[  161.988956] will-wake: attempt 5: woke up in time
[  166.329080] will-wake: attempt 6: woke up early

Here is full output of "dmesg --level=debug+":
https://zerobin.net/?f704a2d56603f4ec#SRrzc2mt2FNNqcltx/ULmtLZRdRH9frdgoODU03AXwE=

/proc/interrupts:
https://zerobin.net/?b7ba5047ca84ab29#TjMUjkAdhpIuKbnvPpuYyNWa/ilA/ciGKwwSbx6KRFc=

# head -n 1000 /sys/class/dmi/id/*
==> /sys/class/dmi/id/bios_date <==
07/15/2025

==> /sys/class/dmi/id/bios_release <==
1.23

==> /sys/class/dmi/id/bios_vendor <==
Dell Inc.

==> /sys/class/dmi/id/bios_version <==
1.23.6

==> /sys/class/dmi/id/board_asset_tag <==


==> /sys/class/dmi/id/board_name <==
0C6JVW

==> /sys/class/dmi/id/board_serial <==
/JNLHW44/VNCMV0046P029A/

==> /sys/class/dmi/id/board_vendor <==
Dell Inc.

==> /sys/class/dmi/id/board_version <==
A00

==> /sys/class/dmi/id/chassis_asset_tag <==


==> /sys/class/dmi/id/chassis_serial <==
JNLHW44

==> /sys/class/dmi/id/chassis_type <==
10

==> /sys/class/dmi/id/chassis_vendor <==
Dell Inc.

==> /sys/class/dmi/id/chassis_version <==


==> /sys/class/dmi/id/ec_firmware_release <==
1.18

==> /sys/class/dmi/id/modalias <==
dmi:bvnDellInc.:bvr1.23.6:bd07/15/2025:br1.23:efr1.18:svnDellInc.:pnPrecision7780:pvr:rvnDellInc.:rn0C6JVW:rvrA00:cvnDellInc.:ct10:cvr:sku0C42:

==> /sys/class/dmi/id/power <==
head: error reading '/sys/class/dmi/id/power': Is a directory

==> /sys/class/dmi/id/product_family <==
Precision

==> /sys/class/dmi/id/product_name <==
Precision 7780

==> /sys/class/dmi/id/product_serial <==
JNLHW44

==> /sys/class/dmi/id/product_sku <==
0C42

==> /sys/class/dmi/id/product_uuid <==
4c4c4544-004e-4c10-8048-cac04f573434

==> /sys/class/dmi/id/product_version <==


==> /sys/class/dmi/id/subsystem <==
head: error reading '/sys/class/dmi/id/subsystem': Is a directory

==> /sys/class/dmi/id/sys_vendor <==
Dell Inc.

==> /sys/class/dmi/id/uevent <==
MODALIAS=dmi:bvnDellInc.:bvr1.23.6:bd07/15/2025:br1.23:efr1.18:svnDellInc.:pnPrecision7780:pvr:rvnDellInc.:rn0C6JVW:rvrA00:cvnDellInc.:ct10:cvr:sku0C42:


Output of dmidecode:
https://zerobin.net/?e7783ba3bd93c895#EAVgKSZQrn0aGC6t9a/RKeZpp1/9TAYlDhHMh2lcpfQ=

-- 
Askar Safin
