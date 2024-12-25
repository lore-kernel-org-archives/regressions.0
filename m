Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D3E17A5BD
	for <regressions@lists.linux.dev>; Wed, 25 Dec 2024 23:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735168197; cv=none; b=QXlJ3lOHi2zh95Ro+3WglSQJLxEOS1QasVwXGD//2cMNbb13ck7NGTro9T1ZkPGG7GuYOiMra+cWJLNbGCjg+kg/5XV/ayvyM4xmjB1NLQDc8sPJ4+kImh+hH0Xs4rf+cnshkCW1aOtun8IhNQ+xsCN3wRNyRXz1N3c9dVGl7YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735168197; c=relaxed/simple;
	bh=cXgffOIK+UGqcvAJB+/E8oSILbxrECit01h1rPWtz2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WyzhQuT1mGrCqOtFzxWDBgHktczGqXqvsrpKPFvSdPUuT7n5GjVkF8SXDPwDSuSyjEsIgK2FOetIHmxPyMoNQCuapMyX9ecxA/ZQaj7Hx5fTDyyRuVM6rk1XGr1nVLWgwgKsoLRxmsRqsNSTFUJdTxIMQZtrLiW/OhYba/qsSac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e50SzOj2; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e50SzOj2"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d27243ba8bso11663687a12.2
        for <regressions@lists.linux.dev>; Wed, 25 Dec 2024 15:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735168194; x=1735772994; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c9v+px78eG66InOEEBnkMK4cXXwgTr2T0JPbH4BNA8E=;
        b=e50SzOj28/SYxgGpfee7Sw6vpD6cPlOxEfNtDqwX2NFgaTXGI2+KBWMVw087ddzRFl
         21XEmBcB0vi6ZpAQRmjY2thULaLlZl7rEKmTo1w0p8fv5Xw/lOpjokCNYAkS0bsFHnZz
         r8dEH/H1tQOAZq5bwK/OND8840J3BdG/FouCObACmz696cwdCtikVIaidSdxPNS6vSpl
         7iz8a4WOZ7iRsQ6YOVA9jpswXOgVV2rclTaTAEhbhFraCojSQUCYK8KzfMkmwQ1oeCS3
         3Y/eba961D8/sDRwKyuD3LpybCQoSXPYDt2/MKioHSBoqz+eXjPHfAKlBKbxDj7YUCnR
         xBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735168194; x=1735772994;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9v+px78eG66InOEEBnkMK4cXXwgTr2T0JPbH4BNA8E=;
        b=EwP0RO5C97pxc+FgCPxz9116MEEL9iAcK9qwGykRrIsvKPr8k9lpHgudjMtvwarJcG
         vUwswK5mnncJSntjgAOc4phYfAx3/uz7PmuA862yMXHp1X2NR4ho5F5lsse+CvR7qZXu
         4CzEcuVlgGvXwyc4NUjqW2Y5pQGBCjSUWloypZes25dAuwL80g6vlXJ8I0o/4Sym+hsi
         XwQZ5Pno+98Re9v8zodQWf4vNUM9VfjBplwndjqHFviAnX7Hr0Zt8zn7M/78bLKsqcUS
         usQzidIjZXYvenYSkO56EhzMhDupYfdsy7HuTC86JJGcEG7BHGorbyfoR4jz9GNpbC2j
         9enw==
X-Forwarded-Encrypted: i=1; AJvYcCVU23Lo6mPhPCz4eDVSMdWNKTKUYKcW+QCRcSLcAa11YYu4SFgUnZy33ekDFzEB9oFvecnCBfRalFX4Tg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/tnXJkVDjwGumnlRdXsWCsjRCz7P+TQEjTJWg9B/GF1OnloVL
	O1up4d7raEWzx7/Klq1m5LB9r74WzUYK+49Tq7ZycKmgfkupMdkk
X-Gm-Gg: ASbGncspyluY6zhZhxhwXG23gDT/2//FB9qpF4HZZgiqKBjy1QNBJsgnAMwm+9LvFOn
	z1wMPGHeEwmCAZ3sf+u3dh6ijNYEQwj3tEwU0MhtY3SD6E22otVj4gND2K37BtLwshGr0NPAs92
	RtpaCQmPzDwZXqw5fpYbwXuUdxhW7CauZUJfHhuYYNLJlWp74pjTCkyGgl6myN0V6KoE1V8cTCF
	tUmX3VshP8o2PY5s9mO5N0S+tqhgDLcB+59w82g1xvolLz03/abEryGPDH9QR0=
X-Google-Smtp-Source: AGHT+IFmA+25Ix88Cs6aGxcufnGYvRlbbn3zhK/hJN7bbVC8PbiIb0lazhzgSE8YiH5F8BHuqE5i5g==
X-Received: by 2002:a05:6402:50d0:b0:5d1:1f1:a283 with SMTP id 4fb4d7f45d1cf-5d81dd849efmr17082749a12.4.1735168193836;
        Wed, 25 Dec 2024 15:09:53 -0800 (PST)
Received: from debian.local ([31.94.62.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80678c8dbsm8065745a12.40.2024.12.25.15.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2024 15:09:52 -0800 (PST)
Date: Wed, 25 Dec 2024 23:09:49 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org, alex.hung@amd.com,
	regressions@lists.linux.dev, tjakobi@math.uni-bielefeld.de,
	rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: Fix random crashes due to bad kfree
Message-ID: <Z2yQvTyg_MWwrlj3@debian.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit c6a837088bed ("drm/amd/display: Fetch the EDID from _DDC if
available for eDP") added function dm_helpers_probe_acpi_edid, which
fetches the EDID from the BIOS by calling acpi_video_get_edid.
acpi_video_get_edid returns a pointer to the EDID, but this pointer does
not originate from kmalloc - it is actually the internal "pointer" field
from an acpi_buffer struct (which did come from kmalloc).
dm_helpers_probe_acpi_edid then attempts to kfree the EDID pointer,
resulting in memory corruption which leads to random, intermittent
crashes (e.g. 4% of boots will fail with some Oops).

Fix this by allocating a new array (which can be safely freed) for the
EDID data in acpi_video_get_edid, and correctly freeing the acpi_buffer.

The only other caller of acpi_video_get_edid is nouveau_acpi_edid:
remove the extraneous kmemdup here as the EDID data is now copied in
acpi_video_get_edid.

Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
Fixes: c6a837088bed ("drm/amd/display: Fetch the EDID from _DDC if available for eDP")
---
 drivers/acpi/acpi_video.c              | 3 ++-
 drivers/gpu/drm/nouveau/nouveau_acpi.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index 8274a17872ed..151d1d534264 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -1485,7 +1485,8 @@ int acpi_video_get_edid(struct acpi_device *device, int type, int device_id,
 		if (!length)
 			continue;
 
-		*edid = buffer->buffer.pointer;
+		*edid = kmemdup(buffer->buffer.pointer, length, GFP_KERNEL);
+		kfree(buffer);
 		return length;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index 8f0c69aad248..21b56cc7605c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -384,7 +384,7 @@ nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector)
 	if (ret < 0)
 		return NULL;
 
-	return kmemdup(edid, EDID_LENGTH, GFP_KERNEL);
+	return edid;
 }
 
 bool nouveau_acpi_video_backlight_use_native(void)
-- 
2.39.5

