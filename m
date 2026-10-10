Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675C026F289
	for <regressions@lists.linux.dev>; Sat, 10 Oct 2026 00:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791591935; cv=none; b=Isx7A9Nqh7Hlb6n0rXJ3WjTIBwpHvgI7XTwvbMrucHySBhvkPH+xRm2aYdlbqTJK/OK8AdzHZTLJORuloayKa3kuSmY/TpAVuic/tgpFrNMLMgXcWB46JdH4ajDKgq5IsEuT6mPfru4liQQhSxfIF7qoNSnO0m3hStzJVYc51a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791591935; c=relaxed/simple;
	bh=6E5xMLHAlQrYW0maMIibM2Q8a3PJVgHh0nCBXuCXQQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DTlpLlEbf+C+sgCqKJktZ7LgkMy5ZCfXhji91pam0POiK4N3tzCXVaiVigCnOBiZpkuvaJn12lXynpUXB873JVYmGccEeV/0ty+KcuzrFcWky/YJeGcPEppmurYZRxDCWZBVbb++b1BWVNe+I7WZ/7cZeB52PsBxPiAgq7PEL4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=shBCwmnR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="shBCwmnR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so2232985e9.1
        for <regressions@lists.linux.dev>; Fri, 09 Oct 2026 17:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791591932; x=1792196732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ovl0E8wRHRIqinvA+kiX8Yz9BHb5WrBi5TGPjnLTzBY=;
        b=shBCwmnRo0gexRIL9UPIGho9Y/36RjR6wX09ewxbBy46yIBgVkYsWyMZG9aJLLpAYM
         gyGMQjioXP2QBkFqckeW++XFuIVvgRkdXaMyKgpP3/MlstWqxv7C1iaVPoHGIT3+eh+L
         U0212/mH/mJ3BPKDYdiQLorKFn+yYXmDiCNduu7uSAsbDK/8tZtHeiTfPAYzH8d1cnDt
         hElwsINrJ/MJ38EQ+xaGuDysGXRz2Ha6Ih45T3ozYb5ZZ0H6kNg3ydS9axMwJ2icohQn
         wtoCj7iMXL1j0i+VwbpF86w+ZEhHBbWlwpTzOQZClMbgVGhpW6S4VcC8N/mqg/de6MoS
         XPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791591932; x=1792196732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovl0E8wRHRIqinvA+kiX8Yz9BHb5WrBi5TGPjnLTzBY=;
        b=yGMpTFaws9BWJZLlUcdFBBG3r3A3I8ZFXDgyO2JPv1JTzYJ4LX84KHJ86AWkGQSkPJ
         FPjvUuADAArG+haMn4Qs1fWfak1yLGoGbASAU6lpn9PRdw/sAAMymQUj68jkavsgzhgz
         IZj794HiRr4V7EFZZ8x2r+YVFnyr/SBFUEMJ0k5ttO34NjGg6WKBABpG63OSQsYaMEpV
         AiC/ay3Z8GX6sFSs4+3ZRuyopnkX7kvrXPvh/MU9R2V7SZT2mAvkomBf/OBmfRKiyuRH
         gi0HpKQ+9nhFkrU+OMHBKyeCFxMr9fPhMnL1y+s4UBe5HqgbES/49dCAP8EQpdup7z48
         fTpg==
X-Forwarded-Encrypted: i=1; AKwUvBxQJSYxYNRlzfoHEtN5vY5kSkrMn/AS+9dPV2+mCPrlQ2F/7xTSoGorjuRI/9e1lzWuzRqsLPj78ACKNg==@lists.linux.dev
X-Gm-Message-State: AFq9FYK5tnqFco23MrTlGn+viQBZNt3OnaeH3v+k/BdM2ZMj/qmyyT+f
	0JWOIGKN9l+KD2v8vtWJF1X5xW4+OrlRUFTkPMQQf2EXFIauqm4f3J3ABi8MFPU7
X-Gm-Gg: AYBFou2Zbnj4zfSOnhqgicLCtTxIb3GxyJrGC2vueWyl4LQHWtClmqC7KdN7gWKMRWY
	5jHz/iHZ6+LhOSRNdloRyimvms3Mugk/g5si4bSrs5b+eQiykqiPZhI7Am7452aMh9NI59SnjOd
	d7FVEp6Rg2s36w8PEZewG5CMDiST2l4BgO0eIEJgkOflgnn2BKVzKFmZWEsCIVGUqfIYqnWKC3K
	zS339m3kdBqqHzPqCTK6f5v0BHm69ZC5L3+cMO5iBqmuDlUqIAyFOLxv3m84MzlJv/pgJlOR6l+
	QqJOHsU1IBJ+NRmim6QOkVBZ0NL/VDMlgIU9wlA8Yxam2UkqE2916xe6GMEMtZTxjBxOb2uaR0w
	GHXZ+FYC5HrsHfr8NUCCYxyUVBX713YPwRn8FmV4ZSTr8eR8rWl1BjsOYk87h2JbNB8S7mLw64x
	Jdlw+sAY7z5p8pr65HJkD3EUUTACmBYLiWQ8tJLF88jovVKBnvBdb0UwKS1hThLviZ8kzCoIBif
	w35MBOGocX2AYcGQ5/VRNuW78sXWdIDNNbslSEzuQ==
X-Received: by 2002:a05:600c:3111:b0:4a1:811c:8069 with SMTP id 5b1f17b1804b1-4a18e49d640mr66951605e9.8.1791591932497;
        Fri, 09 Oct 2026 17:25:32 -0700 (PDT)
Received: from localhost.localdomain (diver-ua.la.net.ua. [176.36.105.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18ca4621fsm67003075e9.3.2026.10.09.17.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 17:25:32 -0700 (PDT)
From: Oleksii Kryvenko <diver.ua@gmail.com>
X-Google-Original-From: Oleksii Kryvenko <krivenko@itstep.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Oleksii Kryvenko <diver.ua@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	platform-driver-x86@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] thinkpad_acpi: probe deadlocks in hotkey_poll_setup() (next-20261008)
Date: Sat, 10 Oct 2026 03:20:24 +0300
Message-ID: <20261010002413.30007-1-krivenko@itstep.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksii Kryvenko <diver.ua@gmail.com>

Hi,

On next-20261008, thinkpad_acpi hangs in probe on my ThinkPad
X9-15 Gen 1 (CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y):

  INFO: task (udev-worker):537 blocked for more than 120 seconds.
   __mutex_lock.constprop.0+0x569/0xa30
   hotkey_poll_setup+0x50/0x110 [thinkpad_acpi]
   hotkey_inputdev_open+0x36/0x50 [thinkpad_acpi]
   input_open_device+0xa7/0x170
   kbd_connect+0x73/0x90
   input_attach_handler.isra.0+0x6f/0x90
   input_register_device.cold+0xd5/0x16f
   tpacpi_pdriver_probe+0x442/0x4a0 [thinkpad_acpi]
  INFO: task (udev-worker):537 is blocked on a mutex likely owned by task (udev-worker):537.

The input core calls ->open() with dev->mutex held, and since
d6479c25ecef ("platform/x86: thinkpad_acpi: Use
input_device_enabled()") hotkey_poll_setup() takes that same mutex
again.

input_mutex stays held too, so later input devices block. The
machine hangs on shutdown, and the sound card fails to register:

  sof_sdw sof_sdw: ASoC: failed to register soundcard -4

Going back to the lockless check fixes it for me:

--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -2542,10 +2542,9 @@

 	lockdep_assert_held(&hotkey_mutex);

-	guard(mutex)(&tpacpi_inputdev->mutex);
 	if (hotkey_poll_freq > 0 &&
 	    (poll_driver_mask ||
-	     (poll_user_mask && input_device_enabled(tpacpi_inputdev)))) {
+	     (poll_user_mask && READ_ONCE(tpacpi_inputdev->users) > 0))) {
 		if (!tpacpi_hotkey_task) {
 			tpacpi_hotkey_task = kthread_run(hotkey_kthread,
 					NULL, TPACPI_NVRAM_KTHREAD_NAME);

Happy to test a proper fix.

#regzbot introduced: d6479c25ecef

Thanks,
Oleksii
