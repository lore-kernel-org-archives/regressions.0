Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EC8168
	for <regressions@lists.linux.dev>; Fri, 17 Dec 2021 15:36:15 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id fo11so2726971qvb.4
        for <regressions@lists.linux.dev>; Fri, 17 Dec 2021 07:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2LwWlutyqD7nYHQDeBKlm46WqzAPw9nhQoOANdu3Uaw=;
        b=q8IUWkXLVm8YCthA9Y5eGFPWI3h1KYJ8ThNN5a++xPVUcxGdtmWWiaPE2yTvW5iKd3
         jlSramBjUPaGLM0nKipLU9eXOwGZKFL4c0NoogduBGdH8Oz8rwRmkWZ+orG6LPg2Mm1b
         D06/7ZShkX8JAutkIks8rVE8AcJu/on4ZdWMB5LHuAVFO4d4V4tdB8S0icRkLb97+H8i
         ShLNW1xByib/KQFWrSH6mYBvFs+qi1lIshIwHCDvUqkHn2gC0Sai26OCCgQmaW7dkSLk
         Mzo0Ak9uJ4cfeG6juFlrCn1C+wR94/PPsuy/BCSNumCHrY1gxAyFmYGXysd9twEPCtiZ
         uZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2LwWlutyqD7nYHQDeBKlm46WqzAPw9nhQoOANdu3Uaw=;
        b=ckH1jUzlMjJ2jEo2v9UyeLSHq1HlJbbRdp+lUyPq8oEEPPVglQzG95WXCwD1uxdNI6
         Wiw422jsL8qNnrpXnoRx7v+m8HzV0OXTtThOhxGD33AFu4JpRAKNwhM2Uvj+/zC64vbr
         Rn4NBZvYeoRKP99DyOC07hGSr5LAZekcmBLhdamVeXJW0SsTC+dgl+NZCGHGY3+ya5xQ
         MsI8kV2yYc59fVHHDHvfiSRmxKqyV+bb/hFb2z2ajOMXq1syvI0MRtqvbcmAAPzY+qqa
         +oB8GnaUQfNj+YB8jMzrF4/TMddgDshb23cl+fAXjbRrMnnLgwtxLXHBtjvsYG4nJo8i
         DjZQ==
X-Gm-Message-State: AOAM533s4V8G/T+aGTra18c734HAimoS8PQt9rlk2x8A1jl7q5itcIJ1
	/lKIxu0Df3xItRWuqeSW8V+MdCLcHKPkSA==
X-Google-Smtp-Source: ABdhPJyux52uQUndq+YCULd3pt1Vq6dc9/BDuceV3zj9qPUux3TNaYwH1G2ATvEgO+X5MI+MOXb8xQ==
X-Received: by 2002:a05:6214:3004:: with SMTP id ke4mr3120202qvb.48.1639755374470;
        Fri, 17 Dec 2021 07:36:14 -0800 (PST)
Received: from linux-af78.suse ([189.122.236.87])
        by smtp.gmail.com with ESMTPSA id w14sm5086438qkp.54.2021.12.17.07.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 07:36:14 -0800 (PST)
From: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
To: stable@vger.kernel.org,
	regressions@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Edmond Chung <edmondchung@google.com>,
	Andrew Chant <achant@google.com>,
	Will McVicker <willmcvicker@google.com>,
	Sergio Tanzilli <tanzilli@acmesystems.it>
Cc: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
Subject: [PATCH] gpio: Revert regression in sysfs-gpio (gpiolib.c)
Date: Fri, 17 Dec 2021 12:35:55 -0300
Message-Id: <20211217153555.9413-1-marcelo.jimenez@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some GPIO lines have stopped working after the patch
commit 2ab73c6d8323f ("gpio: Support GPIO controllers without pin-ranges")

And this has supposedly been fixed in the following patches
commit 89ad556b7f96a ("gpio: Avoid using pin ranges with !PINCTRL")
commit 6dbbf84603961 ("gpiolib: Don't free if pin ranges are not defined")

But an erratic behavior where some GPIO lines work while others do not work
has been introduced.

This patch reverts those changes so that the sysfs-gpio interface works
properly again.

Signed-off-by: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
---

Hi,

My system is ARM926EJ-S rev 5 (v5l) (AT91SAM9G25), the board is an ACME Systems Arietta.

The system used sysfs-gpio to manage a few gpio lines, and I have noticed that some have stopped working.

The test script is very simple:

	#! /bin/bash

	cd /sys/class/gpio/
	echo 24 > export 

	cd pioA24
	echo out > direction

	echo 0 > value
	cat value
	echo 1 > value
	cat value
	echo 0 > value
	cat value
	echo 1 > value
	cat value

	cd ..
	echo 24 > unexport

In a "good" kernel, this script outputs 0, 1, 0, 1. In a bad kernel, the output result is 1, 1, 1, 1. Also it must be possible to run this script twice without errors, that was the issue with the gpiochip_generic_free() call that had been addressed in another patch.

In my system PINCTRL is automatically selected by 
SOC_AT91SAM9 [=y] && ARCH_AT91 [=y] && ARCH_MULTI_V5 [=y]

So it is not an option to disable it to make it work.

Best regards,
Marcelo.


 drivers/gpio/gpiolib.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index af5bb8fedfea..ac69ec8fb37a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1804,11 +1804,6 @@ static inline void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gc)
  */
 int gpiochip_generic_request(struct gpio_chip *gc, unsigned offset)
 {
-#ifdef CONFIG_PINCTRL
-	if (list_empty(&gc->gpiodev->pin_ranges))
-		return 0;
-#endif
-
 	return pinctrl_gpio_request(gc->gpiodev->base + offset);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_request);
@@ -1820,11 +1815,6 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_request);
  */
 void gpiochip_generic_free(struct gpio_chip *gc, unsigned offset)
 {
-#ifdef CONFIG_PINCTRL
-	if (list_empty(&gc->gpiodev->pin_ranges))
-		return;
-#endif
-
 	pinctrl_gpio_free(gc->gpiodev->base + offset);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_free);
-- 
2.30.2

