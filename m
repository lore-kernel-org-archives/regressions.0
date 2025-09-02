Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540861CAA6C
	for <regressions@lists.linux.dev>; Tue,  2 Sep 2025 07:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756798228; cv=none; b=T3qQIUPFx8XXkYh8vQOAtncH5RPVT9CjxuASSM7i6E5LLlQqXO9yRCdS+dP/ykFRbnae8Z4OtypDIjT3BZavczZiu87YaOXYae8HD3oOEcYnA/814yBjuIvSigBnOpohYf9g5iYScvNMoD1J1a45XTSrbXK2XcTisY0KbIta94U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756798228; c=relaxed/simple;
	bh=6lFl9dPjmRTYDx+CpfGuVDgR/X9YMe5minGWPTR0f7k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jd5gmpKLLM2Y+lnBgXEty971eDOQQqmJthUsGdtOG1vyEJ44eE/3aThfi7WWkwAKPraP7jijCI8tULzDcCs5jtpvv9K39q0WNo6G7mcpd2Z8TQNsnyb4MNGa05LPHQnpm8MpQP4emrF1/EQl3YPi3VtUdJlqCQ+yJTyUI/eUyeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnxGJKsk; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnxGJKsk"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f68d7a98aso3398062e87.3
        for <regressions@lists.linux.dev>; Tue, 02 Sep 2025 00:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756798223; x=1757403023; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0jB3VEYTfpyq2xHIYY2lQr0Fn3bHWi6R5aEr8IPA5Y=;
        b=HnxGJKsk5LTCeINee1ZseyyCydb7cjMZIeTwkmTg1lnvjtU6kRuL2KHjryqRVV93Nm
         qRPydK67ARX6YMlQj5ytuXlEliR4q0niSzNdhoJil35A69jm/L4Wtc84Qlyhw4F3Wlfx
         esNRcrFsnC/TKz8Xw/sjpV7qwWWKbAGkuIL+uaJzj3jOjkImTvxl0Of7XKbjI/Ek2R9a
         HkoCGFHj+MQ4Ozmilk62wWmm49xngZIz7ZBrYfkloXzu4HPzC9c4mGPA8DAQdabFTa6V
         4WZjVDEx2wDOZruwDy5qiN3A3L6LWQVtfCbAwuHT1xQ+LZYZVbFUT404vAumD6KRs9co
         Kc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756798223; x=1757403023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0jB3VEYTfpyq2xHIYY2lQr0Fn3bHWi6R5aEr8IPA5Y=;
        b=DEIN6b9tU+DazLsWjRWB6gpz28xn4v+viyYuEG5bwc/mZp0TXefKW6qE18ajbD31L9
         978NNaLwS41hQJs6CC81HPOSzZU4nIPsdYRK3dGsibvZALLHJn3ca2HESYPxIeCQvyMI
         6xc9FTwBQBsu91aXX2NHIrwS4K8SYL7xUjLMsPLvolOrm327/U+XfqWY5G6B+YzZQIpi
         ftQdMqan8i5F1VygRVXxJTV8VXrzXW8Z8ZkQKNH6CuKmL6z465GQWIIm0j+yOXg430ye
         unZtqdVJvlZnG/ZDF0iaa8wL49rzkC7Vab8kLerqfCMAyaZuOSpMKwTDioavximNWXM6
         /hQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSI5VoNzhAz49TpiITvk4OCUBZVbWITpdDUxN4RieOam1ewq0n9S27c8KAp19mfgXvyB5XGrbUeQKr1w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5bF8U1ZlFNvkbhmSS0ts0w5UGe2X5kr2FVioi/Bq5VLw2J3K/
	QDS61Jd451DT/hrMBJo1Vu+byDkcJyI+OJe8cq5GIzly+ZaGlj1Zj+HK
X-Gm-Gg: ASbGncvVDc/lCc1rpjLtw8jKvr3SPGCozmgd0BjZu04j+UmaDNsIGUrqGatTX+m19cj
	yxBHNNWLXIGPslzIwmIxH7eO3aHiYlPaTL10e9ndA++v+Myw0GT06EZV0/qMiTX6A5dxvO24Imn
	QW56jvY2PltDJ1WAYQ5LRiYjeurlImkuxcR20x+2+5lX84N/ChddJyv/EezJoPCu41gFex5gIJN
	CQzDnOUIOVL7DV/jz6F6ZjVkK7tPhkL7+DlJnt7C2TJDbhHRzU1xQRe08VPIuP0NGdwKntdu4z7
	1GquaKvHXQF7NERzYrizn8BgNW1mR0tx+PzMLQQF62HW3jaNxUrCgm3dkSPh+Zt5ppixpfxw71F
	//AQM1+8KOG9c5jJGtMw871tzyzBAGvoyWhp0uSbFM0g9Sw==
X-Google-Smtp-Source: AGHT+IEWt9xLa/lW4Z2IgsvRs7xgmPRe947bvzcKipdb44i4HmmTpqxjUyWqGAice/Yqb7gSCy1u+A==
X-Received: by 2002:a05:6512:151a:20b0:560:84b0:2def with SMTP id 2adb3069b0e04-56084b03203mr158032e87.56.1756798222936;
        Tue, 02 Sep 2025 00:30:22 -0700 (PDT)
Received: from foxbook (bey208.neoplus.adsl.tpnet.pl. [83.28.36.208])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f508fb9esm2774801fa.56.2025.09.02.00.30.21
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 02 Sep 2025 00:30:22 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:30:17 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: David Wang <00107082@163.com>, WeitaoWang-oc@zhaoxin.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 surenb@google.com, kent.overstreet@linux.dev
Subject: [PATCH] usb: xhci: Fix xhci_free_virt_devices_depth_first()
Message-ID: <20250902093017.13d6c666.michal.pecio@gmail.com>
In-Reply-To: <f9476552-a6dc-4f1c-91da-b15c8f0d9844@linux.intel.com>
References: <20250829181354.4450-1-00107082@163.com>
	<20250830114828.3dd8ed56.michal.pecio@gmail.com>
	<5051e27a.2ba3.198fa7b5f31.Coremail.00107082@163.com>
	<f9476552-a6dc-4f1c-91da-b15c8f0d9844@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Reusing 'vdev' for iteration caused a recent commit to malfunction
uexpectedly, resulting in a reported memory leak and potential UAF
if devices are freed in bad order. Using a second variable solves
this problem, and maybe others later.

HCS_MAX_SLOTS(xhci->hcs_params1) is the highest possible slot_id,
so change the iteration range to include it. Currently this doesn't
seem to cause problems because the only caller begins with freeing
the topmost slot_id, but it breaks documented functionality.

Reported-by: David Wang <00107082@163.com>
Closes: https://lore.kernel.org/linux-usb/20250829181354.4450-1-00107082@163.com/
Fixes: 2eb03376151b ("usb: xhci: Fix slot_id resource race conflict")
Fixes: ee8665e28e8d ("xhci: free xhci virtual devices with leaf nodes first")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-mem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index eed5926b200e..db7dc70c37e5 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -932,7 +932,7 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev,
  */
 static void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_id)
 {
-	struct xhci_virt_device *vdev;
+	struct xhci_virt_device *vdev, *vdev_i;
 	struct list_head *tt_list_head;
 	struct xhci_tt_bw_info *tt_info, *next;
 	int i;
@@ -951,9 +951,9 @@ static void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_i
 		/* is this a hub device that added a tt_info to the tts list */
 		if (tt_info->slot_id == slot_id) {
 			/* are any devices using this tt_info? */
-			for (i = 1; i < HCS_MAX_SLOTS(xhci->hcs_params1); i++) {
-				vdev = xhci->devs[i];
-				if (vdev && (vdev->tt_info == tt_info))
+			for (i = 1; i <= HCS_MAX_SLOTS(xhci->hcs_params1); i++) {
+				vdev_i = xhci->devs[i];
+				if (vdev_i && (vdev_i->tt_info == tt_info))
 					xhci_free_virt_devices_depth_first(
 						xhci, i);
 			}
-- 
2.48.1
