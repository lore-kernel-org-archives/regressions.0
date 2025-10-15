Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8111DDA09
	for <regressions@lists.linux.dev>; Wed, 15 Oct 2025 05:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760504513; cv=none; b=Dfd9GA657Ur/IMHE/cqIYHeQY3bLYlLXISTN1WrPtN6e9CkkNnB2+4CY3zTOZrNhe9+/LMehg8VhdIE93HFuOubO3qt9epbHANGnk6DKBwU8sXFn5q0ioVfAvqckngh4UnGkwUjvbGBdMkkNKCl70XevTenw0o9NMhHyhAOWCSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760504513; c=relaxed/simple;
	bh=lyvdSWoiGKpaGPp3oOT892/RaHh9ujQ0BGQiS6Nf1bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fsSU9ASNStqklnlz6JwzoOozyGtstimcktq+pC3v79p6Tf2XBaRy0oJ0efsm0Aiz3QtdZNwBPWTrEXxNJByubPa63ud+RxUYmz6USz2vhf4sQarTsuUl/Oi4UkqiHRarPG/HZVNphsw8fe7Hv8eMTPxseQkTRi3SQXR+kP2OQqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiUEGd4l; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiUEGd4l"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e52279279so43374495e9.3
        for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 22:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760504510; x=1761109310; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEp4eeoKWn3GVgLvyD/HVnCI9sTnqOsvCePziXrO91A=;
        b=PiUEGd4lJvC+vEmMf+Td/cD/YexNtacElcZnPgXq+eT6lJwmMmGCgtXmWsyu2HcBU/
         8WxbkiFxVRAkJp6NsESILcaOjYfBilFA7CPiUYnUIgyzZxTkfDgSeDIItYA8rvSekzjW
         j5q8Ti+i4rOlX8+My2bH6EsO6xSW+zI/rThN/xD5w8GA5RmB3e0rEAQcdffZM8FXL2se
         Eu35HxyV239aeW9WgFLbVcFCeY8tIjgLizUbBCTse4bhb+gUUm1NPOZ70HN9P7cWkIqn
         uZyb/ongetGYXNCuDFw3RxuKZ/qyO+YUUn9UZH7Av4/E8gMmYGv1vX4Ae+0RPkj9hwgw
         Qq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760504510; x=1761109310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEp4eeoKWn3GVgLvyD/HVnCI9sTnqOsvCePziXrO91A=;
        b=YxOhJjbUrEWU+KANi4MaQg+xIW7IDaNtg/ysMbZQxUo0fEV9+sLB9iYnc0JwRqxn1D
         FeoFoRin383rTy77P2x7jGvaUEed2syPUi+Phqa55nm8fSoM5pLzViROlSAWjeulI3aZ
         Xj1SLIAxZcllj5aoWBqBaQC8CAFTozesX2uYiqVr/A6I+JdsAai4OceaP+It4pvd/BOc
         xg/2BeelD8JaoI2NC6AMGhETlhrDEAypua/xT2GWv5Sgqah/mk9rL4eerT/44hVAvHdY
         QFxB9D/7E4y0GZlfqqnj30+9ACKBJ8iPsrx3tu1WgUdu7upaiGVsQrsi1yErK7qIHypY
         XZyw==
X-Forwarded-Encrypted: i=1; AJvYcCUllK+W4Ddyvr1siG5hCxPEZynWLpTa1wvKwhLShLneJHLBz2rSwFrbIu1Io6oxEgbfZNFTVGsxwc2Ugg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuhDTx4KNyRXp3GhE1DV3XSzHPV9Gagwn8ZeImZLyXPi01/VCc
	Ssuegv78a+tnuThPRzBPgEdDRL9/0ACLEske1QT4LoSxloy65MJPNS9g
X-Gm-Gg: ASbGncvjefmmmy1yq2UaktuzkdjNtQvqYEDL/foEqFJ3XTjsu/mzFhJt7XGNwRsW9KJ
	RLt1DMNL0rI+sde1ivy6mZ7ApeJRXbooUx8vJSZebSbW8KjqPtytZC/24RACy0l6cIDgNKOF95m
	mCHjim6pBenRGjZKdeWimu9Q3mM5VQHUVe49S/MOTUV9vinzIRorzM7SSBskpzRqFlVeIcNZ0sb
	q2qzA41iSy8GVxbrVx1VWqMlOnJfHrHgkcquyi3oLyM4QitaSaY98NodeXiByFluo2aVRiuu1AY
	qq7jZ86Rio0jo7fMGpFvMNhoeMMpzyZHPeTmqxc0BMr6dHltrkMjsgbtkLGho+m4o0/bRA9U06H
	LedIMF/vU+kp5XQHU24gyLQxQQcV5c10zNssi2p+yaPk=
X-Google-Smtp-Source: AGHT+IGbf0Ob87ZowTliThcINxazpXz9BmMRxdDHEBAcrtmy2gwZxe7jNR3wRz4zV2fmJvReZS6B2g==
X-Received: by 2002:a05:600c:3f1b:b0:46e:1a14:a81b with SMTP id 5b1f17b1804b1-46fa9b17e09mr180188875e9.36.1760504509427;
        Tue, 14 Oct 2025 22:01:49 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426f6773726sm1241599f8f.49.2025.10.14.22.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 22:01:48 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: tiwai@suse.de
Cc: Dell.Client.Kernel@dell.com,
	amadeuszx.slawinski@linux.intel.com,
	baojun.xu@ti.com,
	bo.liu@senarytech.com,
	cezary.rojewski@intel.com,
	kai.vehmanen@linux.intel.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	regressions@lists.linux.dev,
	rf@opensource.cirrus.com,
	safinaskar@gmail.com
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA: hda: Move controller drivers into sound/hda/controllers directory)
Date: Wed, 15 Oct 2025 08:01:42 +0300
Message-ID: <20251015050144.3922-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <875xci81dt.wl-tiwai@suse.de>
References: <875xci81dt.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Oct 14, 2025 at 9:04 AM Takashi Iwai <tiwai@suse.de> wrote:
> The oft-seen "regression" reports for 6.17 were rather the incorrect

Okay, I did another test. I tested pre-culprit kernel
( 146355ee880e6d15ba12e2baf5be70e5efe07796 )
and culprit kernel
( 2d9223d2d64cb5216859ced6cc33fb3b04e5f98f ).

Here is config used for pre-culprit kernel:
https://zerobin.net/?41f6e4dd438b4671#cZc42NliA0eUaXz03w17ZOJcIVNW8FCMZ9f8lQhdmkM=
And here is config used for culprit kernel:
https://zerobin.net/?c1ba4914bf3f0852#DBGkXE/9LgBc1Q+T4tWrePa0EGsJ8oBoaviaMvE3VRI=

As you can see, they are same, they differ in order only. Here is diff:

$ diff -u /boot/config-6.16.0-rc4-preculp /boot/config-6.16.0-rc4-culp
--- /boot/config-6.16.0-rc4-preculp     2025-10-15 07:45:14.096152974 +0300
+++ /boot/config-6.16.0-rc4-culp        2025-10-15 07:48:42.585031860 +0300
@@ -4794,8 +4794,6 @@
 # HD-Audio
 #
 CONFIG_SND_HDA_GENERIC_LEDS=y
-CONFIG_SND_HDA_INTEL=m
-# CONFIG_SND_HDA_ACPI is not set
 CONFIG_SND_HDA_SCODEC_COMPONENT=m
 # CONFIG_SND_HDA_SCODEC_CS35L41_I2C is not set
 # CONFIG_SND_HDA_SCODEC_CS35L41_SPI is not set
@@ -4832,6 +4830,8 @@
 CONFIG_SND_HDA_POWER_SAVE_DEFAULT=10
 # CONFIG_SND_HDA_CTL_DEV_ID is not set
 CONFIG_SND_HDA_PREALLOC_SIZE=2048
+CONFIG_SND_HDA_INTEL=m
+# CONFIG_SND_HDA_ACPI is not set
 CONFIG_SND_HDA_CORE=m
 CONFIG_SND_HDA_DSP_LOADER=y
 CONFIG_SND_HDA_COMPONENT=y

And yet audio works in preculprit and doesn't work in culprit.
So it seems like an actual bug.


-- 
Askar Safin
