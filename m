Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792839447;
	b=zzxC1772Bxgx9OoWhjR0ok7/f9vGhFWHBK46bQ594Wn0jfThwX5vEs1m4CUk4TVzYRGx
	 l/Y+xZ6cSAMzyluWocX5bdMiSgtYKT1ZYgU+2JkVBJtb5PXmTjG+CZwYPW9VvfQcHscv1
	 IucHqNMahOggHvYny57to1u+IyJ2O1TRX9kLrVozpIHo8Wv5oYQ/SqrXRCXA4oJR7t/ni
	 KuzYnL4KdXbrKFduhtu6nAEnn1rLqbuV+JlZ85DeLpjtq2crgyXHZoLDayiqWZPNIVh+X
	 acj/L5Vym7K5g/4iuXTk03wSaxZbyBdHyJPP40yVCIp3RcDfunWahNA9YzSQvi95QKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792839447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7CvZjphlLYyviRYRDAzTkF165UvtFroVZsLD8Snn5uo=;
	b=r5CjQDeOcCrLbyHmS7av/Vw67yp2CcvPNvOcHnnDClifnh9zILbKDNyRcRss71kH6EvR
	 xyX4nsOXXsHF39qJSbfiFiwVEUxQcwbpEB5qeMdloQ2nxJt3JshCuJM19BQGRGOy9Xw/+
	 yAzaAr8wp1aWzcyTByJ3FVV4LnFMPKRzyfFLvwRP+mW3dNPAQA5vFC0rBNWyaP3Xr2WTq
	 YSnT1rve3s/SwpKnV5OVEPam/2Jl9symrmx3YJ7blq5UdLqEtCzJTpD1wfq/hRvljvsR8
	 tKdna3XQG/71toK87Pglt+wPDZG6CktUvh31mTINWzLVHzpVhLPG6ir4aFPRJPfHq4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=frhm3YfV;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44195606A31E
	for <regressions@lists.linux.dev>; Sat, 24 Oct 2026 10:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44195606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=frhm3YfV
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso933826a91.3
        for <regressions@lists.linux.dev>; Sat, 24 Oct 2026 03:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792839447; x=1793444247; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CvZjphlLYyviRYRDAzTkF165UvtFroVZsLD8Snn5uo=;
        b=frhm3YfVfyAX0XYIyE3EaavpIdFKox+/hYFvRmxG/bxiIcEuQNJc9jskxSh52q173/
         L/FqYVb4A/s1odqNvS/M5AFRSANUlg9rHFjeMeZaP4+lK5xtQlI0Kr5D291/hU4yGBPT
         I0hrpCChKGrA1f0rJd/B2BWbrD1ffAXGMQB9RQXNrR5Te6CVGsyLiNAFkmWDEgnL+AXT
         B1MJpbJ+4mqjrIluMVOvUu3bcWhmAc36SaQZM90pI7AuVdFGHwLWq26x91yoT5yia//3
         gPoMzQFjeeO3IOv3R8x/I/5KY3dfgjP7hOCleFidrlQDlbpD+GO6HO3DXurGCpYS/XF0
         Vtfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792839447; x=1793444247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7CvZjphlLYyviRYRDAzTkF165UvtFroVZsLD8Snn5uo=;
        b=TneflEtnv3qbrd2+B726OibwkLMgHliikAYNXXmwm6zt4Frmbevb6Kv9JJE+oRNH8I
         KlfWYgwqdCiH0iLhvFQCCTutWaRRig482ch+mzLQ5gsIScVbvKWqiLAqWB3a8+hGmmpG
         Jv5/dZzGxq6X/xCPJr68Zef0XrO20q2ESZedZ1t4SZQJrPBltAjmSBlDP/L7Ko5hQm32
         eV2ycG5m7+xPl8keJzY5cw+7PEtUbUdRVNLQBc7bUXcWo2LljjIVr9nxEVPvV0BLUZdm
         DzWO8jrleEABruCzVuiwRO++kvZeRViakSZ6qyit12uKUSkBis2EyuRjGil2Oiplo1C+
         A4/g==
X-Forwarded-Encrypted: i=1; AKwUvBzQaONzOUZ8gCwlyJOegTxDps+czCfEU7ujvpfzbP1hA/mQpQlADB/Kr0xOfbTfGFBjdF4kZqiSO67yaQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIJr04l+GnTic5nD+Fv9npkGQBlhRKwdA2sUN2S0XfuJyQbBm9f
	vY2vsBJC6SPKHWL6WG+Wem1ToXM1e040/YiKJ0dAd21PuZ1W797K16ts
X-Gm-Gg: AYBFou34mx/BVBpGnzNFS10Aw1eBQ6walm0SyiSDPfymeXK7O5gN54OWan0KUnMJ78s
	dqbY3F1BDADndtdnGU2+WxexwqxxRJq3emQT2Kg5f/Rogwm+QB6c9NZbd6Pf7XJnNNu9pA3SZZS
	AU+PFl1D7jMHtsiEYgOU1emqPPWokSiagLBkBsmAxs3BPujWaxsakFrhe/rvb5PSHTFCTvOz8Ju
	D0Gvcu4HsnZIOqdmkL7OQrqMjVSy+POR20vwvDSqbPXD4jXO59Ka5JTrbsu1TAASjOBEq7XHlD4
	FWqS5hA9I3MM0UaNJzE4pAWURFJl+rJRMP1HMmELs3asX9eFuo/qrjHbNK4wAHWVvPkSl5j8KTb
	FY21S2ctLj3YJ840p5p2/tAS4MpLPXMpRPsjXkAaDGPVUxCDNrnH1YL1yXctvXi7WApRAnQsxRi
	TO0SC6JH4xRTR/c23sJUjn5Ta0gybPF0Znl0CHqVoeTiBiWPHYZrct9UjhqLsAfW9TqpaBYP4vU
	kvFzsXGmr2qKIjWN8cG/59Wo8fz1zeLVqGhYRgrNVZakHG1ynJWnTKyMFU6OXbcN9n9qgqTDJC2
	zG0oKXuQrPU8r/uwC6zobSbKTz6qrKoHpzsvQWFFZcJW6Nz8WEtTPmC9EABwNAOnmOLodRyJtMS
	s2dLVWNCWVk8sQ8GTADlkgw5bYSm8f4prXdzM8+7jTxLVmDh9czS+/HNzPcGamv3D29yn3+B4Ca
	oj+8asGpAUD1UUy1Oj66LXwNCtypUVmOzveRFTB2wCUOtKqAB9c8OhZtrF
X-Received: by 2002:a17:90b:4ad0:b0:3ab:d26b:c2e9 with SMTP id 98e67ed59e1d1-3adead26b38mr1613976a91.33.1792839446604;
        Sat, 24 Oct 2026 03:57:26 -0700 (PDT)
Received: from desktophank.localdomain (111-242-220-176.dynamic-ip.hinet.net. [111.242.220.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6946dsm2565666a91.4.2026.10.24.03.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:57:26 -0700 (PDT)
From: Ting-Han Hou <ue081723@gmail.com>
To: stable@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Frederic MARIE-JOSEPH <fredericmariejoseph@protonmail.com>,
	Wolfgang Walter <linux@stwm.de>,
	Bob Anderson <kernel@ametros.net>,
	Domenico Suppa <domenicosuppa@gmail.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-acpi@vger.kernel.org,
	regressions@lists.linux.dev,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Julien <julien82453@gmail.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 6.18.y 2/3] ACPI: scan: Avoid registering platform devices with resource overlaps
Date: Sat, 24 Oct 2026 18:57:09 +0800
Message-ID: <20261024105710.593-3-ue081723@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024105710.593-1-ue081723@gmail.com>
References: <2026102308-twisting-bazooka-12b5@gregkh>
 <20261024105710.593-1-ue081723@gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

commit f234fdaae1cad8c39265e7ca0a14633076ec7154 upstream.

If acpi_dev_get_resources() returns overlapping I/O or memory resources,
the subsequent registration of a platform device will fail with -EBUSY
due to a resource conflict.  This is reported to happen on Acer Aspire
ES1-572 [1].

Avoid that by adjusting resources returned by acpi_dev_get_resources()
to eliminate partial overlaps between them.

This has not been regarded as necessary before because putting
overlapping resources into the _CRS of one device is really pointless,
but now that the issue has been reported to actually happen in the
field, it needs to be done.

Fixes: ab06eb920401 ("ACPI: scan: Register platform devices for fixed event buttons")
Fixes: 48fe2cddc85c ("tpm_crb: Convert ACPI driver to a platform one")
Reported-by: Julien <julien82453@gmail.com>
Tested-by: Julien <julien82453@gmail.com>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Closes: https://lore.kernel.org/linux-integrity/CAJOGg3z6LJPDsdPNBxajgy8_wQxfhYBRxe4EiurZf3kPU5A5Bw@mail.gmail.com/ [1]
Cc: All applicable <stable@vger.kernel.org>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
[ rjw: Tweaked the new message ]
Link: https://patch.msgid.link/12955541.O9o76ZdvQC@rafael.j.wysocki
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
 drivers/acpi/acpi_platform.c | 39 ++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/acpi_platform.c b/drivers/acpi/acpi_platform.c
index 52c8d602f..abdd8893e 100644
--- a/drivers/acpi/acpi_platform.c
+++ b/drivers/acpi/acpi_platform.c
@@ -12,6 +12,7 @@
 #include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/ioport.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/dma-mapping.h>
@@ -71,6 +72,36 @@ static struct notifier_block acpi_platform_notifier = {
 	.notifier_call = acpi_platform_device_remove_notify,
 };
 
+static unsigned int acpi_platform_adjust_resources(struct acpi_device *adev,
+						   struct resource *new_res,
+						   struct resource *resources,
+						   unsigned int count)
+{
+	unsigned int i;
+
+	if (!(new_res->flags & (IORESOURCE_IO | IORESOURCE_MEM)))
+		return count;
+
+	for (i = 0; i < count; ) {
+		struct resource *res = &resources[i];
+
+		if (resource_type(new_res) != resource_type(res) ||
+		    !resource_union(new_res, res, new_res)) {
+			i++;
+			continue;
+		}
+
+		dev_info(&adev->dev, "%pR expanded due to overlap\n", new_res);
+		/*
+		 * Eliminate the previously processed resource that overlapped
+		 * with the new one because it is not necessary any more.
+		 */
+		memmove(res, res + 1, (--count - i) * sizeof(*res));
+	}
+
+	return count;
+}
+
 static void acpi_platform_fill_resource(struct acpi_device *adev,
 	const struct resource *src, struct resource *dest)
 {
@@ -151,10 +182,14 @@ struct platform_device *acpi_create_platform_device(struct acpi_device *adev,
 				return ERR_PTR(-ENOMEM);
 			}
 			count = 0;
-			list_for_each_entry(rentry, &resource_list, node)
+			list_for_each_entry(rentry, &resource_list, node) {
+				count = acpi_platform_adjust_resources(adev,
+								       rentry->res,
+								       resources,
+								       count);
 				acpi_platform_fill_resource(adev, rentry->res,
 							    &resources[count++]);
-
+			}
 			acpi_dev_free_resource_list(&resource_list);
 		}
 	}
-- 
2.53.0

