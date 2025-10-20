Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE90320CDF
	for <regressions@lists.linux.dev>; Mon, 20 Oct 2025 14:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760969842; cv=none; b=X+0bESvF9BpdtOUK4dQ37Gq++J9rGK0RnkODyod3UKWFxkOllypX5GP08YF4EH9xZayqoNfPrnuMi+r1S30aR5SpMsuSKA0wNxNxzo4+vmj5wxXyL+0TtBCPiOsUR3erIUTSB3JI5vOLKt5dDUq48nHDlI9DbyBklxYk1hjkEck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760969842; c=relaxed/simple;
	bh=GgaR0JF2DiNFcr+JLR+skAJBZe8ZfkbJM0uSeMUmHNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lquH2Czwfv5QQqo91tPFyaUaG7La953zlCoKq2H703vlkQgPZaUNl7qsxtzpNTq1T52aeV09neUFUuHoYYksoCZ/V6CweQyWxpwiIcLnIljG73eSPY2ZR/gjGnXsICvBujLDrePBj3soGVg2MYNDu3AvWr7TKtb2JmmH0Dr+DuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKJ+ZSGK; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKJ+ZSGK"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3381f041d7fso5811155a91.0
        for <regressions@lists.linux.dev>; Mon, 20 Oct 2025 07:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760969839; x=1761574639; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFGSwFSrgqDr9/3WMg/kXR+n60QLpJskpnlVbbXnq7E=;
        b=ZKJ+ZSGKUlu27+kLXmVTMP5gxa4IBV1AnS2NJr5oKeZv8HkxZi035JivvSIWb7oVEi
         xYfpW7glT6bOXDa8OIeFOJaERi7/epfo/RWsU6Vk4Hm02kj013i0CdvgQsLvh4w/+63U
         QSmgL433s4DKo1xn/dluqNe8BaMUNY8wvLiyCj3AMe60TCvIZYtrqysIJX+wy+fwW1qR
         Ssi92vEFhCMx1Z6BJTBn6H24g+cL+uRiYtbIOA+yvMXUQW1VVUZ+hwhnrIomyjssI0KD
         FNBfGT0G8JxhTDnJ9yK9De0SR02dXN4u8KEc1piO24cuG2Xd+S1JPwNH8IJ99mE2l03/
         U1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760969839; x=1761574639;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFGSwFSrgqDr9/3WMg/kXR+n60QLpJskpnlVbbXnq7E=;
        b=kQUBvPi0/63IAUfgiuOrb9RiU6tKeO+57H9kcsYF/5x4/DP7Ixb/x5yVWLzhgEhJxF
         +QxDkn9TqEn7sxn+jkrhwinAcG37bxstAKJpC/X+xvfsNb5w9ETZR6/3XZOeCnHFC1hx
         Q6iWUAuWHebaFEJQY3jrOAWLiNR9aQ74ZOtr/IjpVBSL0rceV5+Goy+1B0utcbZtmFaE
         DQ2JOxEPE9Tw1SCZksFXwHfO3GTyO/QQM8xzWmAW2vlBVfh7glqYBiYBZd/mAr68lC6h
         JRSYPAxD82A0si4uwz4yj3r0Tkzc9TpfC7FjrICUTOYhNc59OdMDnQ1M3jmNuLBOhv//
         1KOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCazLRd3RlrhP3z+pZiBYi56xl5ZsAIGShOzMX7yVaCw9uTcMXz94MQ1RUreeU4ZU8+eJorbXdf32ySQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAR+BFk94cy2GPrzRW4YI66g1Aqmwa308bC3mSLGVxtt3ZG8wl
	jdHyA6AHcd3dMxABxEj5I9HDcOa1fHr3OUH6up5uATYu8blG2RlVDUpS
X-Gm-Gg: ASbGnctObFMBUgj5G0O2VROB1YfzdE+bgZvXhckW6o0IF8C68pLqLvITIr+QeocHLev
	IC6tsw8QnrcLwNfVj/MY9NcUUpcemvmGgc1rDPJILgJMfduzu4fihHtXwwFpQ7iuPKITieShrBm
	69DNVDCLqfPLak+uNMQ9VlIeJsQNFr8zgKv43xdtGg5fuyQBR2p0f8rgyWKrqyUcp2BlNmKqUqd
	dtEoTADWmgM3ET+45izCwYZK/Co82J6ySFIzpmnUx8PF8XLKpX0NrY7Yf7rCnl41KJtJdDZCcdu
	kjWlwzFPMGfVoBw030QP6rlW32QSv41Lsd6XchJ+TATkKKaTN/TgGv/fqgOVa3VeioWUhFgRAjI
	TfDtmxa2LbyRjot8OSurC7ToD+/NDSfPkh3jH/HU+wCxabfJ3P8WPSWmQn2YKgwmK8LniRkl/NZ
	2rJrfGFtP7chxZJDEN3wF+ryWjhd5+TJ4=
X-Google-Smtp-Source: AGHT+IEGpqCj48hSlGvE39SucbX6Ouca5PqF+VzauRnJXVW7BvicaDLem8wj36fR99ehw835dYNneQ==
X-Received: by 2002:a17:90b:3c02:b0:33b:6bff:35fe with SMTP id 98e67ed59e1d1-33bc9d1c743mr18185739a91.16.1760969839288;
        Mon, 20 Oct 2025 07:17:19 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c0:fdb0:efbb:1413:f1d2:48d9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5de11601sm8126966a91.9.2025.10.20.07.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:17:18 -0700 (PDT)
Date: Mon, 20 Oct 2025 11:17:04 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com, u-kumar1@ti.com, 
	hnagalla@ti.com, jm@ti.com, d-gole@ti.com, b-padhi@ti.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Robert Nelson <robertcnelson@gmail.com>, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Logan Bristol <logan.bristol@utexas.edu>, Josua Mayer <josua@solid-run.com>, John Ma <jma@phytec.com>, 
	Nathan Morrisson <nmorrisson@phytec.com>, Garrett Giordano <ggiordano@phytec.com>, 
	Matt McKee <mmckee@phytec.com>, Wadim Egorov <w.egorov@phytec.de>, 
	Max Krummenacher <max.krummenacher@toradex.com>, Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, Diogo Ivo <diogo.ivo@siemens.com>, 
	Li Hua Qian <huaqian.li@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Baocheng Su <baocheng.su@siemens.com>, Benedikt Niedermayr <benedikt.niedermayr@siemens.com>, 
	regressions@lists.linux.dev
Subject: [REGRESSION] Suspend to RAM does not work anymore with
 k3-am62-ti-ipc-firmware.dtsi
Message-ID: <sid7gtg5vay5qgicsl6smnzwg5mnneoa35cempt5ddwjvedaio@hzsgcx6oo74l>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello all,

After commit 1d6161617c10 (“arm64: dts: ti: k3-am62-ti-ipc-firmware:
Refactor IPC cfg into new dtsi”), suspend-to-RAM stopped working on
AM62x.

When I originally tested that change, I did not test suspend-to-RAM
functionality, but our testing infrastructure caught this regression.

See the log below:

root@verdin-am62-15479173:~# cat /sys/class/remoteproc/remoteproc*/state
offline
offline
offline
root@verdin-am62-15479173:~# echo mem > /sys/power/state
[   37.798686] PM: suspend entry (deep)
[   37.805942] Filesystems sync: 0.003 seconds
[   37.811965] Freezing user space processes
[   37.819214] Freezing user space processes completed (elapsed 0.002 seconds)
[   37.826469] OOM killer disabled.
[   37.829721] Freezing remaining freezable tasks
[   37.835557] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[   37.843057] printk: Suspending console(s) (use no_console_suspend to debug)
[   37.953874] omap-mailbox 29000000.mailbox: fifo 5 has unexpected unread messages
[   37.953909] omap-mailbox 29000000.mailbox: PM: dpm_run_callback(): platform_pm_suspend returns -16
[   37.953941] omap-mailbox 29000000.mailbox: PM: failed to suspend: error -16
[   37.953967] PM: Some devices failed to suspend, or early wake event detected
[   37.973876] am65-cpsw-nuss 8000000.ethernet: set new flow-id-base 19
[   37.984655] am65-cpsw-nuss 8000000.ethernet end0: PHY [8000f00.mdio:00] driver [TI DP83867] (irq=353)
[   37.985655] am65-cpsw-nuss 8000000.ethernet end0: configuring for phy/rgmii-rxid link mode
[   38.009002] usb-conn-gpio connector: repeated role: device
[   38.013377] lt8912 1-0048: PM: dpm_run_callback(): lt8912_bridge_resume [lontium_lt8912b] returns -121
[   38.013420] lt8912 1-0048: PM: failed to resume async: error -121
[   38.153252] OOM killer enabled.
[   38.156422] Restarting tasks: Starting
[   38.163532] Restarting tasks: Done
[   38.167252] random: crng reseeded on system resumption
[   38.173031] PM: suspend exit

The omap-mailbox driver returns -EBUSY because it detects an unexpected
unread message on FIFO 5.  As I understand it, this FIFO corresponds to
the communication channel between the DM R5 and the Cortex-M4 cores.

DM R5 sends a message that is never consumed, since no firmware is
running on the M4 (the core is offline). This unhandled message prevents
the system from entering suspend.

This issue also appears on the downstream TI kernel, which I reported
earlier [1] (for reference).

The following patch resolves the problem:

diff --git a/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
index ea69fab9b52b..e07cf3290cc3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
@@ -26,11 +26,6 @@ mbox_m4_0: mbox-m4-0 {
                ti,mbox-rx = <0 0 0>;
                ti,mbox-tx = <1 0 0>;
        };
-
-       mbox_r5_0: mbox-r5-0 {
-               ti,mbox-rx = <2 0 0>;
-               ti,mbox-tx = <3 0 0>;
-       };
 };

 &mcu_m4fss {
@@ -45,7 +40,6 @@ &wkup_r5fss0 {
 };

 &wkup_r5fss0_core0 {
-       mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
        memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
                        <&wkup_r5fss0_core0_memory_region>;
        status = "okay";

Ultimately  this issue is related to the omap driver itself:

1. We should have a functionatlly to save and restore the messages into
the mailbox, instead of preveting it to go into suspend.

2. Or we could not check all 16 FIFOs if the kernel does not own them:

	for (fifo = 0; fifo < mdev->num_fifos; fifo++) {
		if (mbox_read_reg(mdev, MAILBOX_MSGSTATUS(fifo))) {
			dev_err(mdev->dev, "fifo %d has unexpected unread messages\n",
				fifo);
			return -EBUSY;
		}
	}

Setting the number of FIFOs to 4 in the device tree also resolves this
issue.

Do you have suggestions on how best to fix this in the driver, or should
we consider reverting the DTS change until suspend-to-RAM works again?

#regzbot introduced: 1d6161617c

[1] https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1557295/am62p-mailbox-channel-is-not-freed-during-r5-remoteproc-stop-call/6069413

Best regards,
Hiago.
