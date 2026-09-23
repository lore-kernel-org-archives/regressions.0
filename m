Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF0952189B
	for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 18:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187258; cv=none; b=YFBZKLkHIPJ/ghesRA4lDAKZDPmimN1MhzQObuL3479GyZD7V8zZP80mgaZYWOeSCTfF+Qd3O/5js2wKwpoFz4UvrrQE1+Os3I3VXcRcapJiniM9sSKCy7x87rsgxD2K9gaP/jFBWcOKdPMdPB3gd6hz+cgw+8VMH90SJuowBwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187258; c=relaxed/simple;
	bh=NoYTdwxwn+++VlSqYDmNkTbGe8sVLyF98wvRfV4aZr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LwH9bGp8m80e/Wwx1GNGVBo2NGbvrbsqPYKGiq2c3qt71hVBL2RTTOZuuAKg/9FQMa3HqGDJzCEXBfR0SpGGeClA2FdReTTbnt4QaK0xSSA5VttHktnk1ULTGKLmxOQXzuLGXqLMEAeLHYnAFvFwn1KTUvNv7z80z0blmOH87Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQ0EjUFu; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQ0EjUFu"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso1092255f8f.3
        for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 11:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790187244; x=1790792044; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fkORU3gh/MDLpHIFia2dyxO/HqIPBw2hOdFlH/z2RPg=;
        b=RQ0EjUFuOvVQlmnVdZu+6dqF6KZiGrxewu07WKDfSz4y5j6gnUDTE2PpS0S5Cy8KG8
         OL0IHRHbUvIuFKv0DJparhBlDBKCWLYGg1MYtxSMH75jSGpr55RuUJZKnSbz7G11SrP4
         2D4DhtYvRUp31uREwsxDfmFTqs2alMp6j8TXkpffeXTO5jD7hLhaYdoh6t8CiLg4aRQe
         vygSDYuo4ppB1BSXshLa7zbnhniXAoJ8kv7IQZKOleOh2RPhh8IsCBsUEGci5sl/XQRX
         in0ac8rVxOfNdAQ1kXJwRWlnD4cZuCWMt8vQN/+K5vpQoubnSV7nt7P6UeEjs439Imzu
         O/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790187244; x=1790792044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkORU3gh/MDLpHIFia2dyxO/HqIPBw2hOdFlH/z2RPg=;
        b=XhhJeH0DAeU8exOV3DY++pmznNScY6o4l96j91Aj5getG0sHK+abt4eEKokQ2uHTd5
         V11oh8WFrmuiDonFjIAaKTwjQgKAyRQEfGP2RVh5fWssIyO7gIVw5j9QWBnL+4OOvYwt
         ci8WWniU2V+aOz3s404xDOsXJv3HOJVVP5UAs2wmzBM+HUro6VdpC2flgkssLQCHZlpU
         JJSCx7cxb+WoJeLYBb2iHvyuPRopJfBK630g+/tt1P14izdMM9wgmp5/nqThOBrnBYoP
         Fk185+QJi3lRsxVdI17BkzXot5YQS1i/I6ucT0TRdhxSXFYde/z1GxJ4czOlUrMa0ehm
         2eKA==
X-Forwarded-Encrypted: i=1; AKwUvBwrLd0jDEZM2wAvaTo0qGDxLBSvDNj5pfVNULW9i4GA6ClVvkFrd+LEYzZUzL3XS0BbN8nfPviubiRWHw==@lists.linux.dev
X-Gm-Message-State: AFuF++m+xcX6tFc6FKOmP7mRNppluRmUmh6z1nZ9yws84AUnv3zfsJwn
	qJlw2PyFjc5khkrkwsQRa3TBkuWAzzUG+ZmyVfhYmXsSjCQ7oDPnd8i8
X-Gm-Gg: AYBFou13Ia9E2jMXUbbdaGH5EVaNtiQX1C6RTlKmlehrwBHdnEQd0inWgU0/lKD2ScU
	VY831JSfgn9/xNKzh4KRQGpryuQpy4rU57hKSaxVMnoQIw3kzB6vxCiR6+oiriuGb7aQmYXT/7+
	DgP8weS/b3BOWlpUrYQGy2ld9Y86RCmDhwCEAnsKVdzyt6suGguZRX+lF4GdYFeWm4EjY6xQ6Gn
	+08PoFPHRpWX1soi/NxaFbZOL/m8zlrYL+PsHosrnPLnzEa9/uc6DdzQHSkhgX6XVZeeCLKsZNr
	EsB6KYIWY+/OuarOJOIClSxO0iLYIAs0BcUta2/a1Vh555hFyIVi09hHrkURqftV6Yg97k5xBeo
	3xLq3hJiEl9R/VZi+7zu1t4QmOip14m2PIzUu6I8a29DLeA/8nXDXcO1rXTm869aiiz3JqmmGtU
	mjdNqUiq3co8F7izl9rWHpXnnZmlD13c0L+BTy359jwbY/Y0m/iaYAyiTOMlG50bkboZTcutgNe
	yzLBUhY7YBJ86+tmWdqGhMlZUlOa5CQ2j1riC2KHLAR
X-Received: by 2002:a5d:5d0c:0:b0:487:aff:9952 with SMTP id ffacd0b85a97d-4886706f69emr6125723f8f.16.1790187244370;
        Wed, 23 Sep 2026 11:14:04 -0700 (PDT)
Received: from cachyos-x8664 (213-225-11-125.nat.highway.a1.net. [213.225.11.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488684862a3sm8007107f8f.7.2026.09.23.11.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:14:03 -0700 (PDT)
From: Roman Stingler <roman.stingler@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Roman Stingler <roman.stingler@gmail.com>,
	Lovekesh Solanki <lovekeshsolanki00@gmail.com>,
	Erik Hakansson <erikhakan@gmail.com>,
	Filipe Lains <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH] HID: logitech-hidpp: do not overwrite the device's hi-res wheel mode
Date: Wed, 23 Sep 2026 20:11:29 +0200
Message-ID: <20260923181203.422097-1-roman.stingler@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi_res_scroll_enable() unconditionally puts HID++ 2.0 devices supporting
the HiRes Wheel feature (0x2121) into high-resolution mode on every
connect event.

On at least the MX Master 4 that mode is persistent state in the device.
With hid-logitech-hidpp unloaded, a mode set from userspace survives
switching the mouse off and on again. Writing it at connect therefore
destroys a setting the user configured, and does so on every probe --
cold boot, receiver replug or module reload -- so userspace cannot
reliably keep it either: it gets no indication that the mode it set has
been changed underneath it.

This became visible when Bolt receivers gained support in 7.3. Before
that these devices were driven by hid-generic, hid-logitech-hidpp never
bound to them, and nothing in the kernel wrote the setting.

0x2121 exposes getWheelMode alongside setWheelMode. Read the current
mode and scale vertical_wheel_counter.wheel_multiplier to match rather
than forcing high resolution: a device left in high-resolution mode
still gets its multiplier, and one the user configured for low
resolution is left alone.

Note this changes behaviour for devices sitting at a low-resolution
factory default -- the kernel will no longer switch those to
high-resolution scrolling.

Link: https://lore.kernel.org/all/20260920094508.39682-1-roman.stingler@gmail.com/
Signed-off-by: Roman Stingler <roman.stingler@gmail.com>
---
Lovekesh Solanki proposed an alternative in the report thread which
remembers the last mode seen from userspace. That fixes suspend/resume
but not the probe cases above, and he suggested sending this instead:
https://lore.kernel.org/all/arJs7GjCP3r4IaM-@eggarch/

Tested on 7.3-rc3 with an MX Master 4 (WPID B042) behind a Bolt
receiver, built as a module and loaded at boot:

                        stock   this patch
  suspend/resume          no        yes
  module reload           no        yes
  cold boot               no        yes

With the mouse left in high-resolution mode, a full module reload leaves
it in high resolution and the multiplier is fetched as before. I checked
that the mode is honoured; I did not instrument events per detent,
though that path is unchanged.

 drivers/hid/hid-logitech-hidpp.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 493763a12518..338477bfcaeb 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2044,6 +2044,7 @@ static int hidpp_hrs_set_highres_scrolling_mode(struct hidpp_device *hidpp,
 #define HIDPP_PAGE_HIRES_WHEEL		0x2121
 
 #define CMD_HIRES_WHEEL_GET_WHEEL_CAPABILITY	0x00
+#define CMD_HIRES_WHEEL_GET_WHEEL_MODE		0x10
 #define CMD_HIRES_WHEEL_SET_WHEEL_MODE		0x20
 
 static int hidpp_hrw_get_wheel_capability(struct hidpp_device *hidpp,
@@ -2072,12 +2073,10 @@ static int hidpp_hrw_get_wheel_capability(struct hidpp_device *hidpp,
 	return ret;
 }
 
-static int hidpp_hrw_set_wheel_mode(struct hidpp_device *hidpp, bool invert,
-	bool high_resolution, bool use_hidpp)
+static int hidpp_hrw_get_wheel_mode(struct hidpp_device *hidpp, u8 *mode)
 {
 	u8 feature_index;
 	int ret;
-	u8 params[1];
 	struct hidpp_report response;
 
 	ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_HIRES_WHEEL,
@@ -2085,13 +2084,14 @@ static int hidpp_hrw_set_wheel_mode(struct hidpp_device *hidpp, bool invert,
 	if (ret)
 		return ret;
 
-	params[0] = (invert          ? BIT(2) : 0) |
-		    (high_resolution ? BIT(1) : 0) |
-		    (use_hidpp       ? BIT(0) : 0);
+	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
+					  CMD_HIRES_WHEEL_GET_WHEEL_MODE,
+					  NULL, 0, &response);
+	if (ret)
+		return ret;
 
-	return hidpp_send_fap_command_sync(hidpp, feature_index,
-					   CMD_HIRES_WHEEL_SET_WHEEL_MODE,
-					   params, sizeof(params), &response);
+	*mode = response.fap.params[0];
+	return 0;
 }
 
 /* -------------------------------------------------------------------------- */
@@ -3910,8 +3910,16 @@ static int hi_res_scroll_enable(struct hidpp_device *hidpp)
 	u8 multiplier = 1;
 
 	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_HI_RES_WHEEL) {
-		ret = hidpp_hrw_set_wheel_mode(hidpp, false, true, false);
-		if (ret == 0)
+		u8 mode;
+
+		/*
+		 * The wheel mode is persistent state in the device, so read it
+		 * rather than overwriting it, and scale to match. A device
+		 * left in hi-res still gets the multiplier it needs; one the
+		 * user configured for low resolution is left alone.
+		 */
+		ret = hidpp_hrw_get_wheel_mode(hidpp, &mode);
+		if (ret == 0 && (mode & BIT(1)))
 			ret = hidpp_hrw_get_wheel_capability(hidpp, &multiplier);
 	} else if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_HI_RES_SCROLL) {
 		ret = hidpp_hrs_set_highres_scrolling_mode(hidpp, true,

base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.55.0

