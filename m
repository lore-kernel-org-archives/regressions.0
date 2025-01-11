Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC1C1AB6FF
	for <regressions@lists.linux.dev>; Sat, 11 Jan 2025 18:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736621991; cv=none; b=fColBYT2WKi6tCjFfyyh0Pdf0i0Ax5svdLiKuWt25aLevlnCF4Ocamk3aqcyj6wYB2LGCLtVPHb1i3M1wZTxiGEa+ntyrTw+74Ck1pS5k99xzBVT31AyYO5QtXdUVCePp9rsWtkALAAvpfvpIrxOKc95WLjd6vM6LginnhR4gDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736621991; c=relaxed/simple;
	bh=oX5yPNdl+nQlEHEz0LVIlKvTWgYDyu44Yx/Y3chKZus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEeA4HLJikWFUZqLXI2uFL0Qb7J+deGnIAEabr4+u2QNh9AcODtn3kw5YkHwqBfYBYcoNwYvrLnpY6NYTc39wZFeZIjI80fl84/Ynf0bZ9QfsGvJTHdeCi0ny2e5JKKgjA2Y4SXyFNrhNrUVDYiunjK6XpB0sCVQr1Bh+UV0CBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMGE9DMa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMGE9DMa"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43622267b2eso33281165e9.0
        for <regressions@lists.linux.dev>; Sat, 11 Jan 2025 10:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736621988; x=1737226788; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L3DgohbenACHXn6wOW4eU9gM7Gu7Z7kDdY29V2QFR8Y=;
        b=bMGE9DMa2mvrxnCiW1VYqreNTjnAfoImc56Iy/O0gUqQBaDrFtxu4RGkvliWPX1/Pp
         W2sxcSB13iz/JS797jpzl6KYkgN0aUkEhNDVfg8d3vN2XPdr5K56pdpc2VIRfXAqD+mB
         KG5kjjrXhQ/WrdITFk6V4TGD9zBxGzaO4QyHdKsmCVr1u/pCLuIj7Gm+frihgOryZlzx
         JooLeKby9JwF3V3Y38LeMkwmAQ+kKhSSLSrHjLRsNNKSbknuANR8mtxxBupTJWkLCHZX
         B2ohc2C9OMAtUz49wE+MTNdJ4qtrzd2/irkW/40mn3YQ4Uepf0eKb0Tax4QeMBEE6ImC
         zHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736621988; x=1737226788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3DgohbenACHXn6wOW4eU9gM7Gu7Z7kDdY29V2QFR8Y=;
        b=FdUWtR8SyVqcFBCHF5HoTxMRIje1kjup3OL6a8AGFcPvcjG6KPXnc2upDDuJDlcpW8
         VL26C8NE6cEs7cZYQrdMWk8fRRVurNs1CxjdjBFufktuND9DkdIZGos2JW4tFJV6dkUd
         Qubxi/66ulaG0CfNQgNMz/GUzlMgHskRj3z0gDmLroVoMJ3pd1zHi+NCRhMYMJioAWD0
         MKtH3xzteQtqPF+9hl6ENxS6oCJ4qzmkpRB7AJeiw13NoCxI+E2TrgVjwlOZL/qT+qRB
         LIHZdzTQj1seve4aSk2OyICYOL7S6nTnv5UaNKhuv7BkJVQBK+NHVOZY+ZqPO03wR8zv
         SQ+g==
X-Forwarded-Encrypted: i=1; AJvYcCUwAWE4kmcvzFby8wpnIh4LvCQqNyAKU2Q9QGwWZpODDQsLVWyMwo8wtccumHhrmAAifWy5MIl+jNe4UA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGkRIx/i7xZXPvdnO6uxRSsRRPDxvA3lCfpjlmL13sq/0OLudX
	WfaueCOhdXE9xBakNJLPPcY8cdngLfoUqDKRC/bp9dCvmFpBrf97
X-Gm-Gg: ASbGnctL/P3Ji3TEGivsWAXKFkKJ94Cq07HFETW1rRmUsTUBuqnJ8If0Sl+byk6KzVe
	FLr0vIKnoigczbJGlRGJQksMATgfTW5V3EM7s4qR+39QOGO5ysZuidWNTTC7xKoA5fCZU1aL5eJ
	3cDzFvQ0uJrC0WuIoWoydYcQCdw30EZ14oo7oM6nBSrmB0kKceAe3RznI66E/ikddfRv948wG+N
	O/2J5OajqibzW6KFfKPn18q6TBDZ10eVr7ZI7zjlchanKyKk1Hadz0ccjiogZUhig==
X-Google-Smtp-Source: AGHT+IEPA1ZIEy2BVvJIreSvtc7pK5EpKKeAI+bCNXKQkeEEBtMKu5+tlqaQ1Ywp2IM9xt0CHUsflQ==
X-Received: by 2002:a05:600c:348c:b0:436:ed33:1535 with SMTP id 5b1f17b1804b1-436ed3316a4mr93947005e9.12.1736621987670;
        Sat, 11 Jan 2025 10:59:47 -0800 (PST)
Received: from debian.local ([83.105.230.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e6263fsm92372725e9.39.2025.01.11.10.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:59:47 -0800 (PST)
Date: Sat, 11 Jan 2025 18:59:45 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	amd-gfx@lists.freedesktop.org, alex.hung@amd.com,
	regressions@lists.linux.dev, lenb@kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2] ACPI: video: Fix random crashes due to bad kfree
Message-ID: <Z4K_oQL7eA9Owkbs@debian.local>
References: <Z2yQvTyg_MWwrlj3@debian.local>
 <b98f2fa5-fbe8-4958-bf20-fa5d28c5a38b@math.uni-bielefeld.de>
 <Z2yw_eJwR5ih1Npr@debian.local>
 <CAJZ5v0i=ap+w4QZ8f2DsaHY6D=XUEuSNjyQ-2_=DGOLfZjdn+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0i=ap+w4QZ8f2DsaHY6D=XUEuSNjyQ-2_=DGOLfZjdn+w@mail.gmail.com>

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
EDID data, and correctly freeing the acpi_buffer pointer.

The only other caller of acpi_video_get_edid is nouveau_acpi_edid:
remove the extraneous kmemdup here as the EDID data is now copied in
acpi_video_device_EDID.

Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
Fixes: c6a837088bed ("drm/amd/display: Fetch the EDID from _DDC if available for eDP")
---
Changes in v2:
	- check kmemdup() return value
	- move buffer management into acpi_video_device_EDID()
	- return actual length value of buffer
---
 drivers/acpi/acpi_video.c              | 50 ++++++++++++++------------
 drivers/gpu/drm/nouveau/nouveau_acpi.c |  2 +-
 2 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index 8274a17872ed..3c627bdf2d1b 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -610,16 +610,29 @@ acpi_video_device_lcd_get_level_current(struct acpi_video_device *device,
 	return 0;
 }
 
+/*
+ *  Arg:
+ *	device	: video output device (LCD, CRT, ..)
+ *	edid    : address for returned EDID pointer
+ *	length  : _DDC length to request (must be a multiple of 128)
+ *
+ *  Return Value:
+ *	Length of EDID (positive value) or error (negative value)
+ *
+ *  Get EDID from ACPI _DDC. On success, a pointer to the EDID data is written
+ *  to the edid address, and the length of the EDID is returned. The caller is
+ *  responsible for freeing the edid pointer.
+ */
+
 static int
-acpi_video_device_EDID(struct acpi_video_device *device,
-		       union acpi_object **edid, int length)
+acpi_video_device_EDID(struct acpi_video_device *device, void **edid, int length)
 {
-	int status;
+	acpi_status status;
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
 	union acpi_object *obj;
 	union acpi_object arg0 = { ACPI_TYPE_INTEGER };
 	struct acpi_object_list args = { 1, &arg0 };
-
+	int ret;
 
 	*edid = NULL;
 
@@ -636,16 +649,17 @@ acpi_video_device_EDID(struct acpi_video_device *device,
 
 	obj = buffer.pointer;
 
-	if (obj && obj->type == ACPI_TYPE_BUFFER)
-		*edid = obj;
-	else {
+	if (obj && obj->type == ACPI_TYPE_BUFFER) {
+		*edid = kmemdup(obj->buffer.pointer, obj->buffer.length, GFP_KERNEL);
+		ret = *edid ? obj->buffer.length : -ENOMEM;
+	} else {
 		acpi_handle_debug(device->dev->handle,
 				 "Invalid _DDC data for length %d\n", length);
-		status = -EFAULT;
-		kfree(obj);
+		ret = -EFAULT;
 	}
 
-	return status;
+	kfree(obj);
+	return ret;
 }
 
 /* bus */
@@ -1435,9 +1449,7 @@ int acpi_video_get_edid(struct acpi_device *device, int type, int device_id,
 {
 	struct acpi_video_bus *video;
 	struct acpi_video_device *video_device;
-	union acpi_object *buffer = NULL;
-	acpi_status status;
-	int i, length;
+	int i, length, ret;
 
 	if (!device || !acpi_driver_data(device))
 		return -EINVAL;
@@ -1477,16 +1489,10 @@ int acpi_video_get_edid(struct acpi_device *device, int type, int device_id,
 		}
 
 		for (length = 512; length > 0; length -= 128) {
-			status = acpi_video_device_EDID(video_device, &buffer,
-							length);
-			if (ACPI_SUCCESS(status))
-				break;
+			ret = acpi_video_device_EDID(video_device, edid, length);
+			if (ret > 0)
+				return ret;
 		}
-		if (!length)
-			continue;
-
-		*edid = buffer->buffer.pointer;
-		return length;
 	}
 
 	return -ENODEV;
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

