Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401470;
	b=wPzAbiFvO/xjtJKdmH7DJ9kPszPn6AWZVQuZwu5/BejqYsmXGCSLpt57OdtgApfVK2w5
	 pvZvUehF73+nzC+RbeSShjkBkVnCvEvxnO774caHysJlozfRavWnQ5BKJUSGj8LPuUGGD
	 RF1YkhBIfzqr9jR9g/42yAX40Jdqh8+3qHWJw1vyuaxA7Z7/M2p6aYw5hTerBTg6YiC3t
	 EiTZQvadaZuttqHq/LLOqP5VVd31a0gxgfMrCqV1iW70r6DvyBi8Z79uxNVxve2ga3E+6
	 azJLoQT4N8L5EvXGk3iRGo6kKsWezLNTjkOm4iDCNda3KxHCwzW29TLA+aC7uObS7qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Uapr75yZLj7Tv4B9SqUwtXKVvOOX4yQmtXhP7eAjMSc=;
	b=FbYqSg8bgUrJ/oaxraIXrTvPg/bnZgbGojRA6++iOgKanVa/2ZNRZBWDSbRDhzpLPkEb
	 0jcpkIRlSbhbTYfCcH3Vwa3EVVI5YnN+Omav6BJY+PFGkkPXy0Gj0Tj+E+07svYtnhyH9
	 uI4LAJwfyPJUiN9wIBKY1dAhnOSOlGmK6JPACKmmVDwBvKC3N8TlaUIA6aCdgYk7zZGJA
	 Fww1Ro2pfUvImFzjOGj9FQ1/AprIOaXPHgF5w4ujnUILelrZPW1dekluzzh5YzACAlVAj
	 hAgsL7mF3RQqGT3teAufVvtt330pSU9N40fPlD2tgJ2oyktnjohB/Xjn7sxBJJ1K3wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvgECdGD;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC29606A327
	for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 12:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC29606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvgECdGD
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so23235395e9.2
        for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 04:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794401468; x=1795006268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uapr75yZLj7Tv4B9SqUwtXKVvOOX4yQmtXhP7eAjMSc=;
        b=tvgECdGDYnU2vCFi9g4Fzs98/Z0VgDevVDIH9g3EnMPPsrXlFCS9ElV4unJvShO5rP
         bmV3mxX36cunVvvthq+qAHu9VMUjPr7zu5h5dD6vf62nAwJadnBXXGXrXDJWlbMPUbQh
         CF55n3j22wIpB2eMYrTxeEamx+DAbQMRq/shqJl6W7fg7b9t+aGhwtZGcJTlORSt1VX7
         o0ASIuV0MDfdwtGNCiHiqC6357OQcNpoTgoGVb32jq1PaLpjv07nSubdFaIbMjfYY+rd
         HFasgsjTBomj/EgvEzEb1KiCiZW/86VeEvA+engVZUXOdACk6JzzUxTMstgI3i5QAkXo
         Vgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401468; x=1795006268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uapr75yZLj7Tv4B9SqUwtXKVvOOX4yQmtXhP7eAjMSc=;
        b=ZEamOf4wW07Yg/pdxgCxOiE0km176OacKkdS6Z/7VI5fY2koIOdlLjmE1DdVdSVnGM
         t3Xi7lsfQ1jf55+mSuvqPL84V0q3b0bDFtvoGXsAttHHPWKspv0cxKhnCqND4TdrGQe0
         iKfNxrawN+1h/zol5KTBEppSuvH58eHOY7S9pQD5/LikTiYF01ONGwJ/FTYCP8NOL26m
         WjBPfVMU9KlUbq4SPYUdCOJhwYOu2bmxeCIYbtiCLQlIx2dAamcqmZbHYVTtC/uP53fj
         QgNluNq5b2u0vcOshcoiLe7Zui5qzaKVVNPApHcaUCGSszk7cNMSHJWaRqR0Kw4zqjPR
         RupQ==
X-Forwarded-Encrypted: i=1; AL+hErHqRUtpEUujgxJMGLtqIw/bhdjBH6lX/WspjTLVkcHc/36BxZbFiv4UhEZ/ysg4FOx77lT4+zPdg+0t8g==@lists.linux.dev
X-Gm-Message-State: APuU4Z+hw13hejUYThTeSeLU7T6fhO9IBDJpTtXBif8PXJ0iSmFHSh5K
	jtNCE27c8GZnjXYNSdUZR7suo1czLFUHx0YqTw04OXpYkRtAtwO8tL9X
X-Gm-Gg: AYBFou1nHrXfOB7YRp3O09klFVO7agIAHzfzd+eh8tyb3EnJMnPCYqFqmZomc21XCZQ
	bMsqQQMfe6CdTNdNlc2OlGB7dbwE/GC0o9e8pd6MCV3hKoE7WFlValLqINa2ONJPenl0JWJNyU5
	c+KHkOQc139DPoJlgTpuTjy0H+vdN77k4HRGxnT1ZLWOa0YBcNRsxxSuQisxAYD6DVnMrO+q9OJ
	jhE/4cZVZ3edlX6ds22WB5LcoKkSAp6iwInD1s6G0z1B+JNNKv7VyVVFtBL2PHr76owPOGsQr8O
	F+JzdFQK4vwPgPB3MRykhhBXORL6WFQmqrv0WKImKMu6QTpofNAkebNRz6c7bYfWoT6dS1/0Hiu
	iUz9icMOZ+oUggUEnRkTIz8PKv6WF3flfT3jla5xRwq+RUvnMKdAC3EHc1P/OoQ85GnBeP+K+25
	UZaURG2ShmOlSyI3s/mLLoIVD28LSMHVK93yeqZ5wq7zUVt8dcEWeUpW8s8G9H7hk/HA/QzM8G4
	W9trxqjcduOYV3uql2UVAM9nM9kec039KRHQw7g5MxIP1nzdhDAphsCNA/7QnNz36woF2NxJki2
	oGFx1xIE5fO8C4YvNaNSigkz83Pl9VSowdc=
X-Received: by 2002:a05:600c:3f08:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ba0937820cmr39696135e9.22.1794401467873;
        Wed, 11 Nov 2026 04:51:07 -0800 (PST)
Received: from redmibook ([143.246.42.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba09517bc7sm39028095e9.3.2026.11.11.04.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:51:05 -0800 (PST)
From: Oleg Rybalov <rybalov.oleg.dev@gmail.com>
To: qby140326@gmail.com
Cc: platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	regressions@leemhuis.info,
	regressions@lists.linux.dev,
	shlyapugin@gmail.com,
	Musaev Ibragim <atomicus.xyz@gmail.com>,
	Oleg Rybalov <rybalov.oleg.dev@gmail.com>
Subject: [RFC PATCH] platform/x86: bitland-mifs-wmi: Add Redmi Book Pro 15 2023 (TM2209) quirk
Date: Wed, 11 Nov 2026 15:48:49 +0300
Message-ID: <20261111124849.11309-1-rybalov.oleg.dev@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <49e43ccd-fa28-44a0-9e8d-554868d0585e@gmail.com>
References: <49e43ccd-fa28-44a0-9e8d-554868d0585e@gmail.com>
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

On TM2209 the power mode is the STNM byte in EC RAM. Fn+K rotates it
in EV20 and the EC0._Q24 handler then applies the matching SoC limits
with HPTC. SystemPerMode does not affect STNM, so changing the platform
profile had no effect on power.

Read the mode from STNM and, on set, write STNM and evaluate EC0.HPTC
as the Fn+K handler does. HPTC returns AE_AML_BUFFER_LIMIT because SVRP
declares its ALIB buffer one byte longer than its data; the limits are
already sent at that point, so treat it as success.

The board reports DMI_SYS_VENDOR "XIAOMI" with TM2209 in
DMI_BOARD_NAME, returns the WMI return code at the end of the buffer
and charges over USB-C only.

Signed-off-by: Oleg Rybalov <rybalov.oleg.dev@gmail.com>
---
Based on v15 of "Merge redmi-wmi into bitland-mifs-wmi":
https://lore.kernel.org/r/20261028112742.674847-1-qby140326@gmail.com

Tested on BIOS RMAPH5B0P0909 only.

 drivers/platform/x86/bitland-mifs-wmi.c | 83 ++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index a431d3fef..b63b139a6 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -21,6 +21,7 @@
 #include <linux/input-event-codes.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
@@ -99,6 +100,10 @@ struct bitland_mifs_quirks {
 
 	bool return_code_at_end;
 	bool skip_ac_type_check;
+
+	const char *ec_mode_field;
+	const char *ec_mode_apply;
+	phys_addr_t ec_mode_addr;
 };
 
 static const struct bitland_profile_entry default_profile_entries[] = {
@@ -113,7 +118,30 @@ static const struct bitland_mifs_quirks default_quirks = {
 	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
 };
 
+static const struct bitland_profile_entry tm2209_profile_entries[] = {
+	{ PLATFORM_PROFILE_LOW_POWER,   2 },
+	{ PLATFORM_PROFILE_BALANCED,    1 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 3 },
+};
+
+static const struct bitland_mifs_quirks tm2209_quirks = {
+	.profile_entries = tm2209_profile_entries,
+	.num_profile_entries = ARRAY_SIZE(tm2209_profile_entries),
+	.return_code_at_end = true,
+	.skip_ac_type_check = true,
+	.ec_mode_field = "\\_SB.PCI0.LPC0.EC0.STNM",
+	.ec_mode_apply = "\\_SB.PCI0.LPC0.EC0.HPTC",
+	.ec_mode_addr = 0xFE0B0300 + 0x7E,
+};
+
 static const struct dmi_system_id bitland_mifs_dmi_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2209"),
+		},
+		.driver_data = (void *)&tm2209_quirks,
+	},
 	{}
 };
 
@@ -271,6 +299,48 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 	return 0;
 }
 
+static int bitland_ec_mode_get(const struct bitland_mifs_quirks *quirks, u8 *val)
+{
+	unsigned long long v;
+	acpi_status status;
+
+	status = acpi_evaluate_integer(NULL, (acpi_string)quirks->ec_mode_field,
+				       NULL, &v);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	*val = v;
+	return 0;
+}
+
+static int bitland_ec_mode_set(const struct bitland_mifs_quirks *quirks, u8 val)
+{
+	void __iomem *addr;
+	acpi_status status;
+	u32 glk;
+
+	addr = ioremap(quirks->ec_mode_addr, 1);
+	if (!addr)
+		return -ENOMEM;
+
+	status = acpi_acquire_global_lock(1000, &glk);
+	if (ACPI_FAILURE(status)) {
+		iounmap(addr);
+		return -EBUSY;
+	}
+	writeb(val, addr);
+	acpi_release_global_lock(glk);
+	iounmap(addr);
+
+	status = acpi_execute_simple_method(NULL, (char *)quirks->ec_mode_apply, val);
+	if (status == AE_AML_BUFFER_LIMIT)
+		return 0;
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+
 static int laptop_profile_get(struct device *dev,
 			      enum platform_profile_option *profile)
 {
@@ -282,14 +352,20 @@ static int laptop_profile_get(struct device *dev,
 	};
 	struct bitland_mifs_output_head_rc result;
 	size_t i;
+	u8 val;
 	int ret;
 
-	ret = bitland_mifs_wmi_call(data, &input, &result);
+	if (quirks->ec_mode_field) {
+		ret = bitland_ec_mode_get(quirks, &val);
+	} else {
+		ret = bitland_mifs_wmi_call(data, &input, &result);
+		val = result.data[0];
+	}
 	if (ret)
 		return ret;
 
 	for (i = 0; i < quirks->num_profile_entries; i++) {
-		if (quirks->profile_entries[i].wmi_val == result.data[0]) {
+		if (quirks->profile_entries[i].wmi_val == val) {
 			*profile = quirks->profile_entries[i].profile;
 			return 0;
 		}
@@ -350,6 +426,9 @@ static int laptop_profile_set(struct device *dev,
 	for (i = 0; i < quirks->num_profile_entries; i++) {
 		if (quirks->profile_entries[i].profile == profile &&
 		    !quirks->profile_entries[i].no_set) {
+			if (quirks->ec_mode_addr)
+				return bitland_ec_mode_set(quirks,
+							   quirks->profile_entries[i].wmi_val);
 			input.payload[0] = quirks->profile_entries[i].wmi_val;
 			return bitland_mifs_wmi_call(data, &input, NULL);
 		}
-- 
2.56.0

