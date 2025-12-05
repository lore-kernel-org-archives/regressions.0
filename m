Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADCE2206A7
	for <regressions@lists.linux.dev>; Fri,  5 Dec 2025 04:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764907323; cv=none; b=LQsAk+uM1PmSvZuoL9h8GSWwuYknoZ4ucLxcNOskUCt/G9/GQeFNxmPoM2Nh7nywlW/IrDv/s3U5jov6x6+GAha23INAKVxFI2dW9P8f33D54Nbf8STQHpvooHAedK0ObUmHfyNsbgYqvC1J3vWqn8nu9K9x89C6ot5suijpUzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764907323; c=relaxed/simple;
	bh=pFzSwLOIY7gcuMiT2jqZdWntJgk8Vq0j1sPKw9ztY68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MHJgaySjKGDl76bmNj0syT/9TXRsJdrRqNjMwfEv/SGROkTMMkbNPc8fqevfKSGRJY62Mh7KTgtqUVJgjYG1fiAowhpc2Ocql2mlIm9iWUd5A4WzkRP1BTNSAG34BxWDyZckbT62j7AxFCXWWjdwnG/WqQJCB8nc2oC0DTh9BCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuiEkpll; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuiEkpll"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-597d712c0a7so1539845e87.0
        for <regressions@lists.linux.dev>; Thu, 04 Dec 2025 20:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764907318; x=1765512118; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TS03XI/NqHnaZdyjNXmpSaRmEsgm36XDq9ZRwSJmwYU=;
        b=kuiEkpllVglTx3ZOdFMYjOglru9MfsTyJFZxOFyg7EkNxKpPxbLRNFiYTqHLffbohB
         znUcMi0uF5Z293un1g4phzojhPcILPW1nd69Gl+T/Mg0CEN/kH1o99MJzmmsx42KVOG7
         TJWKdk2X7KWn4xIzK09CV4kLT7Lfqm9fqocmjOSjOeGyPJzpMcC+dAllPvzZsCXb8pDr
         YDqJSnQx9KwM9Pge2kIGlKTBgrq27n4IW+DHg7BI/uriXCREuJkTRgC7uJmVWEefXM9E
         fj7TUsPZn0dN+pVN2RbseN6AHENUss8xISP0XuyOAxH4+sLZ607Re+2YEc2vo50lvMnH
         TM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764907318; x=1765512118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TS03XI/NqHnaZdyjNXmpSaRmEsgm36XDq9ZRwSJmwYU=;
        b=W4C+tmrGlwXAh2gC98ilrobGduBOsFQLb2N9AHc408uE0O558UitfG3ij+JvkTiEwx
         xHSdyXhmrwJm2bRXy0AvJ2a0d3+PdslrjmH5ivkvzSILJ8EysLutFMmw8srElrcQ0NUj
         2PJtvTGM/zmGeCGQMX/NqvGBdh544Ap1vBZ05PMB1k7sLevBSD1NtqugZQu0bapQfMiz
         ywsPEkGljUBWT1ccmsLcwmGW5N6hCoG7iYjrwrEGLRusCKvP40sIBFBA2vr2WAhD2wdM
         Id0ZRSx3V+19PvS70OgzYo23J288Em2vH+ovf7DftwfB1otyymWEr7goYi53OtM3f4QN
         xU2A==
X-Forwarded-Encrypted: i=1; AJvYcCWfCasC6oPzafXuVmVHIgkguaL0NjayF3c7TD8nJ/Gol/K/X51viaQFg+ffxgiHFmdZZj3Q9P9+6cjtlA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwccGXI4M8FLA76/uGqQa2qeiQxyaCI+8VK3BvvXwE/vOa44DFU
	Vsy/e+66uTP9MdGKOWHHzzumb47APi2+mkj5DQFH6TziVx5AbtGyQvdQ
X-Gm-Gg: ASbGncvux7RkxaGrnYVpG8hhalGJ8TcuSLX6pRlFaPcSHKuUjYQs2cyP+xhZ+W3vNHk
	7yZhPzzJoeZQpU1yWtaKVKo40tH4AcCnBko+u/ovuRl7UTvxXbMK5QsmtI9+smuZn/iuPYYoPuj
	SGpnD3YO1mTENfELRwNU1L1vVAVg7uEzcOGPlAuxIF4v4akdsUjEndwtjIKbIbPkRs/Pkf2y0JU
	JKq8TaO7CuzXBG4f5fwJSfuz9tE/MNuJwJgPUYrld9zRuTO3HerhMjsekROluFSQnCBVhq9e0/V
	Igq7jaucFSD2boy1tkgS20DErhLHriaToDqUKNwq5a3zVZGqXKjXyNaWatRkQVpJ6g/A6hKx78i
	88y1R6OXitr1VU+GY+wSB/yDplskv4ZNhe7l9idODBGQhiafG5ZCTfFOQ+ViypAqFFxFbMW1tfW
	HNis7dz/vjrSz3ZEibz14=
X-Google-Smtp-Source: AGHT+IHN7KA3JaGcYZ1b5MDiLqZ7+5bt4dnsWETdVylDcRKkhYslMrpS+MPrq0JtQ1kOV8Bjuks7vw==
X-Received: by 2002:a05:6512:1090:b0:579:8bbb:d61b with SMTP id 2adb3069b0e04-597d3feec96mr3249945e87.46.1764907317846;
        Thu, 04 Dec 2025 20:01:57 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-597d7b24814sm1084405e87.40.2025.12.04.20.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 20:01:57 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: superm1@kernel.org
Cc: Dell.Client.Kernel@dell.com,
	andriy.shevchenko@linux.intel.com,
	bartosz.golaszewski@linaro.org,
	benjamin.tissoires@redhat.com,
	dmitry.torokhov@gmail.com,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	regressions@lists.linux.dev,
	rrangel@chromium.org,
	wse@tuxedocomputers.com
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own from suspend
Date: Fri,  5 Dec 2025 07:01:41 +0300
Message-ID: <20251205040141.1735580-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <f983382a-821c-40f0-a41e-ba9f47ae73c5@kernel.org>
References: <f983382a-821c-40f0-a41e-ba9f47ae73c5@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>:
> Random thought - is this happening specifically when the lid is closed 
> and you're applying "pressure" to cause the touchpad to click with the 
> lid closed?

No.

I already sent script, which calls rtcwake in a loop. This script reproduces
the bug. I don't touch anything when it is running.

> If that's not it, I would check if you have the latest firmware for the 
> touchpad.  Unfortunately this isn't something "commonly" flashable with 
> Linux like is the case with BIOS and other components.

I already downloaded "touchpad firmware update utility" and did run it
within Windows. So, yes, I have latest firmware.

> Maybe @DellClientKernel could provide some guidance.

Dell.Client.Kernel@dell.com was in CC all this time.

Also, I contacted support via web chat (and said my service tag, of course).
(My laptop comes with Ubuntu preinstalled.)
They said I have basic support only,
so they will not look into the issue too deeply. We had lengthy chat,
and in some moment they said that they will not debug OS-related issues.
I. e. if I want help with this bug, I should reproduce it without OS,
i. e. in BIOS setup utility. Of course, this is not possible, because
one cannot suspend BIOS setup utility.

I sent them link to this thread and said that the bug is probably in firmware.
But they seem to ignore this.

Also, they said I can send the laptop to them, they will try to fix it and
send it back. I don't want this.

> But yes; failing all that it's viable to make a quirk.  You can follow 
> any of the ones I've submitted for modeling how to do it.  Here's the 
> most recent one I've done.
> 
> https://github.com/torvalds/linux/commit/23800ad1265f10c2bc6f42154ce4d20e59f2900e

Thank you! I will write something like this:

+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Precision"),
+		},
+		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
+			.ignore_wake = "VEN_0488:00@355",
+		},

I will test it and then properly send (hopefully today or tomorrow).

-- 
Askar Safin
