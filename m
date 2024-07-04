Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0381A4F30
	for <regressions@lists.linux.dev>; Thu,  4 Jul 2024 08:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720083143; cv=none; b=jYunZp/Eects3BVBXl1GZSkVTLOH/jd1qDTklI5+aDXRazGTeb1TSVsSBuvYH7Tf9ZN+2IIvRIz2OrWWYG6lOdlPegP0t2DZ2G7VqLuVPjbAdpYzsFE0DJUL/dLFZSt+T4LcO97sp5yNmLN+t1QKf/EJsUV1iIg9ASPHyCXtTyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720083143; c=relaxed/simple;
	bh=msMUHdwmfo/xfcbLPfmoqnDcJZxTp37M9X1aU/HHt64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RXSTrhLWRJuEAJAD2HIvVglovzZjzmaXHvI8iq5SNEJKKnllJrciufN9cls2+Bwm5tk+z1J3qkH2Y9rccWQ+y3aTAvDXRb5mZqPRhIm/BZpFQTn+aYHbi2oLGV8lIM+QO2kmBjjFNJwT5fwQCGEVEOKYXjTgseZdUg5j+FcOHq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QPbRpJ4U; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QPbRpJ4U"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-424ad289949so2479285e9.2
        for <regressions@lists.linux.dev>; Thu, 04 Jul 2024 01:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720083140; x=1720687940; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=owtkn1JZViROHRyq0OPRHeVCIxCBljvpg/PQP6ulIbQ=;
        b=QPbRpJ4Ufx7Uu/9x4bEHECvq2xh5sxMjz4aoXzs19Y57DyzkIx5r0LVo4e9J7LDV/w
         1gRTxZxkDc1qE8ucn0U/Ihzk9jMPgsGMEyK/iOqZ3LK8/4v7odMPn3PE99HDEBzOT5vk
         eND9X8IatVZKbGrP9Oz5SRV8M7FtYn8kSsCJWxCRHzmc3sd8mJqzxf8RKhMiJQHJwrFh
         f5I4xoFOzp/qxtDAzkjy+uqeFIV81Wm8n0LLFmFxBS4C3so4p5kkEZTXqGFhV8fmCbqm
         QF7wt3OWOzUznwVIuDlIKLEnUa26/1EeBUfSxJW8fzqUA81r30+qTNm2h9QLq6Fl6GT8
         xihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720083140; x=1720687940;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=owtkn1JZViROHRyq0OPRHeVCIxCBljvpg/PQP6ulIbQ=;
        b=iSW8J+iLFxwbJFoDSXrzCT0JOic+E3+bmgyZ/ITUu4H9Hm3Sz5p5INxvBxMUMzgpCn
         wRhpS7utb1VuY45L3bjt7UGm4YhRVWknfgivrMU9KpHVBvCrXaHPP9FeSM0+Mzypraik
         SdxpYbNq7I8dWT34QA/vYmUa/cVmrh09dzHzOeQOP/IOr7cgkWThpwYZxneS/3yTTpE+
         yskRshxI3I1rYxtz2bAnlNtpYtJvB5ZU2+0UtM/YcL7/BtSDkQezJJ6nvNwUtxmvmQ6S
         Xv+WJSeub80bKSRuYAWGIsflyD0EeDQ8WMPFa2tLDlLizmcotOsyLfqcCphOr086/bP4
         Xqtw==
X-Forwarded-Encrypted: i=1; AJvYcCWHbTVJlN5WYdcRBHP7NnPXzhKKhTCP1dPthPqxspis+BblDiMu0JF8P91oXgQEubC7eaQO/J5yELoiwWNQESsYWRtIRGQF3D0PZiM=
X-Gm-Message-State: AOJu0YxwibN8Tkg0eAzz0F3eBVw6tm+KKlI8JpVxVjFDX/ek8mD1Ta0E
	wzxyD2eAizjqSohRZRtPnWA/tGcPVqYHl/c2Ed1jsEelHbnyVg/1xJjtrdnNwVQ=
X-Google-Smtp-Source: AGHT+IEKfbZg35nXOhYy2lKG9e+Vhb3VIC97OxLgHXyJIZPolH1wsLGFTnb4R/XR/J0+8n9tMHcb1Q==
X-Received: by 2002:a05:600c:6a99:b0:425:68a3:f6e0 with SMTP id 5b1f17b1804b1-4264a3d692cmr7479305e9.9.1720083139646;
        Thu, 04 Jul 2024 01:52:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f23f9sm14773225e9.26.2024.07.04.01.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 01:52:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 04 Jul 2024 10:52:08 +0200
Subject: [PATCH] power: supply: core: return -EAGAIN on uninitialized read
 temp
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-topic-sm8x50-upstream-fix-battmgr-temp-tz-warn-v1-1-9d66d6f6efde@linaro.org>
X-B4-Tracking: v=1; b=H4sIALdihmYC/x2NQQqDMBAAvyJ77kIiNpF+pfQQ7ap7SAybtZWKf
 2/wODDMHFBImAo8mgOEPlx4TRXsrYFxCWkm5HdlaE3bGW861DXziCX2+93glosKhYgT7zgE1Tg
 LKsWM+sNvkITGe+tc7yxNA9RoFqruNXy+zvMPK2zxZYAAAAA=
To: Sebastian Reichel <sre@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Rhyland Klein <rklein@nvidia.com>, 
 Anton Vorontsov <cbouatmailru@gmail.com>, Jenny TC <jenny.tc@intel.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-arm-msm@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 regressions@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2198;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=msMUHdwmfo/xfcbLPfmoqnDcJZxTp37M9X1aU/HHt64=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmhmLC3GIAm/IY+flJvbi3VHvb6P9YrFTIq0uMMYEf
 VBSh9ySJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZoZiwgAKCRB33NvayMhJ0U1JD/
 9NO+kScylVLDMfeKXVFP+OUUlVeTPI9AZGbf4DxR5mqKt9zgrQngmQKMv53XR0PkQOHa+VliOslQvV
 vRazmjM5Sr72dd2yMPruHs9hvLCCNB63+W0yU7V13js59lgzuUnOAQs7o/zsqwMHxPPGbkYlmIFHqk
 e6kx+8WM50gNAI7DW1z223hpYE8ed8O9qGOXHIsoNIJHESwi5/6JG4BdwQNXBwm9IovnmMBVVn0Y4e
 pKS8mgFUjxeKuFvQUvXNDQhWmX4eS3vZ5IhJJQV/54hxCdgfQufaaHpuFfcQBxfFWRyA5MZxZewn6t
 DGWSqeeXgjeMu314yqJpA1QTPD8LyKrH+nhfhF0PLuYLpHKgxMhmGnqCpt6/AhQDgXhCvhEy6IuCK2
 onrhCBv4pzj1d+8SGtkL8HHjlBAXaYcVphHtGrCbkRTWMcx98CRMQy8jWkDD7SVnuuV+OTZXPbdthB
 S2q6hfV63oB3XYgqk1jjGpn2/TMd2G5jR0q8QZhm8stzYHpQvnlfqDMwQYxeENL6kMm/Rptrj3nScF
 KA/79i3M97SGCKlS0lBAh7v918HYanXAKbYtdbW9R6DipWUodg6XMwjzt/XFll4+PmQB+XSrYvY78T
 Sz2sJ0qbQR69BYcNwe91BPT2wnE7qCpdCMHF24eJyr7ltLXsnlfztNsn7Tkw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

If the thermal core tries to update the temperature from an
uninitialized power supply, it will swawn the following warning:
thermal thermal_zoneXX: failed to read out thermal zone (-19)

But reading from an uninitialized power supply should not be
considered as a fatal error, but the thermal core expects
the -EAGAIN error to be returned in this particular case.

So convert -ENODEV as -EAGAIN to express the fact that reading
temperature from an uninitialized power supply shouldn't be
a fatal error, but should indicate to the thermal zone it should
retry later.

It notably removes such messages on Qualcomm platforms using the
qcom_battmgr driver spawning warnings until the aDSP firmware
gets up and the battery manager reports valid data.

Link: https://lore.kernel.org/all/2ed4c630-204a-4f80-a37f-f2ca838eb455@linaro.org/
Fixes: 5bc28b93a36e ("power_supply: power_supply_read_temp only if use_cnt > 0")
Fixes: 3be330bf8860 ("power_supply: Register battery as a thermal zone")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/power/supply/power_supply_core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
index 8f6025acd10a..b38bff4dbfc7 100644
--- a/drivers/power/supply/power_supply_core.c
+++ b/drivers/power/supply/power_supply_core.c
@@ -1287,8 +1287,13 @@ static int power_supply_read_temp(struct thermal_zone_device *tzd,
 	WARN_ON(tzd == NULL);
 	psy = thermal_zone_device_priv(tzd);
 	ret = power_supply_get_property(psy, POWER_SUPPLY_PROP_TEMP, &val);
+	/*
+	 * The thermal core expects -EAGAIN as non-fatal error,
+	 * convert -ENODEV as -EAGAIN since -ENODEV is returned
+	 * when a power supply device isn't initialized
+	 */
 	if (ret)
-		return ret;
+		return ret == -ENODEV ? -EAGAIN : ret;
 
 	/* Convert tenths of degree Celsius to milli degree Celsius. */
 	*temp = val.intval * 100;

---
base-commit: 82e4255305c554b0bb18b7ccf2db86041b4c8b6e
change-id: 20240704-topic-sm8x50-upstream-fix-battmgr-temp-tz-warn-077166861efb

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

