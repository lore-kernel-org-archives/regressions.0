Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867073451C1
	for <regressions@lists.linux.dev>; Mon,  3 Aug 2026 22:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795989; cv=none; b=Wh8A/Z9zlmYqsRrAIVYW4yO4yyXzIb5Ubvrqe2Xic88JMfPx95E9Sl4V15iBV8L7TWMBdX4ycuPII4ZEsSYFZ17YQn4qDMnJrmjBXL6JxHeCvmrQF7xugn8qO8qayq75IU2Do3c7H/tEgH90c7z5mdYIuz6Es2Ll7F05wws7IBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795989; c=relaxed/simple;
	bh=L26H4R8gykJzn2cppPi5p7TIPzSS9wI8HHyNAiF6V9k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YqrOzmYc8HkX6irCQ4T+VEZiFtXadHGDhbr+PiFWKOhTatH48yu5GLPgmskH3expaC0Vb+SIdobGyhm9hfnaNcRWx1CmeGVTuN4D639LcQO6BiLuF7tqTwYgpaA7F1ZCwHMdU3lATo0LCZ/+fq7XAgM4Wet5gPYpNpWdFw+KMN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVFpPAOG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVFpPAOG"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-496b7622a83so17158185e9.2
        for <regressions@lists.linux.dev>; Mon, 03 Aug 2026 15:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795986; x=1786400786; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kw2hpVX/Drh43dQcP6P18Jwi9h9do6TMzF5RgAgXlME=;
        b=aVFpPAOGQSTHz3t3DfulSufQ6k1WJ4Z4iaZhIaxAXTaiRrT7aXecWOJTwXfNBEKbFB
         bwmw7GqUJCWsfnqgUSAr/wrCCJ2HMBx4471i6MPA1AGwRjQtnOcVkUHxkbjRFD4hlvSp
         x2jpDyOqlPZFuta8sxo0zFGldmmhToiCrEuYHpFMLo+xMH0zNfTlMpFSIoY4i4whS7PB
         OG5HkWDHa4oeg65XMqbKWY6mkyp4bAKTEKwnIEqkP+Fto/DxOFhr0yGbIUhXZ2e+h6Ls
         QK0MNsvEsHuVmsYBiA5d3dKFsmzjZ4O2Wj+VTMsqF/UodyPIj2Fo1fLjSVMm8PzoVzCf
         EJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795986; x=1786400786;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kw2hpVX/Drh43dQcP6P18Jwi9h9do6TMzF5RgAgXlME=;
        b=Rpr4dvY2NTQ2cBMhnA0KQ2/YQWWSUD8w/3a8melCIdv3nupb4ZCX1wRmyyOHDiJxE1
         czsqElaHvOQUQdFXva7zJh5DMGXk2LDcph5z67iD5VPGHWPJtlNb0f/H/XxBUDQGSwvM
         Ne7Y1h0vOwAUG6aKiCtXstN/3v17pFw/ZHGKx6DSZqGZhm69J+dcUR6hAuTvbcc1fjwb
         C7RoAq4Hm5g9lmIVrntUXnDJwuWo3sYZxJyIOgmHrp8T9/UMN3KbRQRtd1V7qyMHfSBl
         l7OBO3xYF9028w0mTbzUp5JDghhvAu53tM2usH+5NWKpLvkypPdlBJsDg4rhmiYbEzVR
         gf/A==
X-Forwarded-Encrypted: i=1; AHgh+RqRL83WUelm4LsBVM/v6SoSQ7FhaRlrZWq6rp4Mv66d44ZEp4UBq3SauJ/p/get6Ma0wQd7hLFPeXYxSA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9X96b59Ow3qp4Y3y52j3O36QBcwbryOUlNZAvB/yvpRQvijyr
	GB9UbqcbLQn0Aa1hiN/u/ijHPZCwtnmkxM3qIuFPuYNMfrnOICYpn4t1
X-Gm-Gg: AR+sD12z1yfN3AHXhLF5DrNbm0rl2nFMKRfsYPoyS+2nj/hlPYRA5rxgc2Z5SOJf1uA
	C0VuRv7GInVfDfZDK8NE5e7uPIq1rqog78McVnB+pTAdtb15/LLqE7/AsiR06KENoTj2Jmsi7L6
	b/TM5cSXhU/tgUws6XfvLR2+m3YfsehAqptIEBzzo6tdOVy2RPGBYmwAVdJKt62QmMBDmi1zgmn
	OoEiCxathOkfOnUUU77ozVIsUPDk1aQJtcLzOME1fER1RojX+agnD+lmWegmSboUXhQPozZ+SiI
	XQbwiUkM34ZTaT5PB4KcXGmOIvoLeoH9JwciCeyIDG356N3EggLX5l5kL4mAp+41/s/gHmBhdRP
	LIt0JY+QiOld3hWQJbR2dFJlzOvNPBAl2YImsIIHqQkcHjYCNRpRx6128yC/NzoFmtHAjb00VZi
	3bJBiz+HSNy3yIjgog24sjmcVlMCxMq5/G3T/L6L5DU5w/yamUdDNG2GQy7j7JTaKjqifu00wG
X-Received: by 2002:a05:600d:644d:10b0:493:bb6b:5bb5 with SMTP id 5b1f17b1804b1-4980c672d64mr214538005e9.13.1785795985713;
        Mon, 03 Aug 2026 15:26:25 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b85be7sm325733345e9.2.2026.08.03.15.26.24
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 03 Aug 2026 15:26:25 -0700 (PDT)
Date: Tue, 4 Aug 2026 00:26:21 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Slavik Dev <developer.slavik@gmail.com>
Cc: forestix@kcat.cc, mathias.nyman@linux.intel.com,
 gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
 heikki.krogerus@linux.intel.com, stefan.eichenberger@toradex.com,
 pawell@cadence.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev, Mario
 Limonciello <mario.limonciello@amd.com>
Subject: Re: [REGRESSION][BISECTED] usb: hub: total system freeze after
 running adb
Message-ID: <20260804002621.7a8a5647.michal.pecio@gmail.com>
In-Reply-To: <CAGQo=TJXef-QzbkFEpTcJ138j0k6WYnV4=tNY8Q7s3U7DUOY+Q@mail.gmail.com>
References: <CAGQo=TJXef-QzbkFEpTcJ138j0k6WYnV4=tNY8Q7s3U7DUOY+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Aug 2026 16:54:58 +0300, Slavik Dev wrote:
> Hi,
> 
> I'm hitting what appears to be the same regression, on the same xHCI
> hardware as the original report.

Hi,

I got your email from linux-usb with no working reference to the
original thread, I presume you mean this one:

https://lore.kernel.org/regressions/qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net/

And it appears that this (later) bugzilla issue was another dupe,
which fact had been overlooked at the time:

https://bugzilla.kernel.org/show_bug.cgi?id=221103

> Earlier today I applied the workaround discussed here (disabling USB
> runtime PM), and so far it is holding up.

Slightly simpler workaround is described in bugzilla comment 16
and it should work for you too if it's the same bug.

In comment 26 there is a reference to another bug affecting AMD
hardware power management, where some success has been achieved.
AFAIK no one tried if those patches would work for the ADB issue.

Somebody has apparently bisected this to the commit below.
Failing the above, does reverting the commit work for you?

commit 8f5b7e2bec1c36578fdaa74a6951833541103e27
2025-06-11 14:24:41 +0300
usb: hub: fix detection of high tier USB3 devices behind suspended hubs

> Hardware:
> - AMD Ryzen 7 7700 (Raphael, display on iGPU), ASUS TUF GAMING B650-E
>   WIFI, BIOS 3881 (AGESA 1.3.0.1b)
> - The affected controller from the original report is present:
>   0b:00.0 USB controller [1022:15b8] (AMD Raphael USB 2.0 xHCI)
> 
> Kernels (Linux Mint 22.3 / Ubuntu HWE builds):
> - Freezes observed on 6.17.0-14/-19-generic and 6.14.0-37-generic
>   (based on 6.14.11 + stable backports, built 2025-11-20).
> - First freeze on 2026-03-10, shortly after kernel package updates;
>   16 freezes total through 2026-08-03.
> 
> Correlation with adb:
> - The last 4 freezes occurred 5, 12, 35 and 81 minutes after the adb
>   server was started (using the once-per-boot "adb uses wireless
>   extensions" kernel warning as the start marker in the journal).
> - Earlier freezes also occurred with an Android phone plugged in while
>   the adb server was NOT running -- including one freeze 2 seconds
>   after unplugging the phone. Consistent with hub runtime
>   suspend/resume transitions being the trigger rather than adb itself.
> 
> Freeze signature:
> - Journal stops mid-second, no oops/panic, no MCE/WHEA, efi-pstore
>   empty. nmi_watchdog=1 and hardlockup_panic=1 never fire.
> - Notably: the chipset watchdog (sp5100_tco + systemd
>   RuntimeWatchdogSec=30) DOES fire and resets the machine ~30 s after
>   the hang, so the platform stays alive -- it is the kernel/CPUs that
>   stop responding.
> 
> Ruled out on this machine:
> - RAM: freezes identically with DDR5 at EXPO 6000, EXPO 5600 and
>   JEDEC stock 4800.
> - Pure load: 60 minutes of stress-ng (16 CPU workers + 16 GB VM
>   workers, no adb running) survives without issues.
> - Firmware: BIOS update 3223 -> 3881 (AGESA 1.3.0.1b) made no
>   difference.
> 
> Side observation: in freezing sessions, Bluetooth (MT7922 on the same
> bus as most devices) repeatedly logs "hci0: ACL packet for unknown
> connection handle" before the freeze.
> 
> Workaround status:
> - Running with runtime PM disabled for all USB devices
>   (power/control=on via udev rule) since 2026-08-03. Reporting while
>   it's fresh: the adb server has since been running continuously,
>   already well past my longest previously observed time-to-freeze
>   (81 min), and so far so good.
