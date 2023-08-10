Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B288519BB3
	for <regressions@lists.linux.dev>; Thu, 10 Aug 2023 09:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691658019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SsptNuZqTu6x0xTH/oZR8xChOfduQk/JbRlb0DwTkYQ=;
	b=ZX9c6dsJFJi8BIhaxQYTBh22njSSyeINcpQVW4ZJHiYRalSC5yhdEmQA8lA0OhbkuGswn/
	3AXIvQLJnlhUqp8Q5y9z279EnIcLGQkvvB6M/5QwIoQaU7iZ4cfAcO7bqB7e0Okfm95keG
	Ru4bGOtOT+RFqWXqfl4o21iYncEfVOs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-7JQgaiAwMWGNi_sQ0z-wWw-1; Thu, 10 Aug 2023 05:00:14 -0400
X-MC-Unique: 7JQgaiAwMWGNi_sQ0z-wWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6DCF833941;
	Thu, 10 Aug 2023 09:00:13 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.110])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D14C2026D4B;
	Thu, 10 Aug 2023 09:00:12 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	August Wikerfors <git@augustwikerfors.se>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	stable@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH] ACPI: resource: Add IRQ override quirk for PCSpecialist Elimina Pro 16 M
Date: Thu, 10 Aug 2023 11:00:11 +0200
Message-ID: <20230810090011.104770-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

The PCSpecialist Elimina Pro 16 M laptop model is a Zen laptop which
needs to use the MADT IRQ settings override and which does not have
an INT_SRC_OVR entry for IRQ 1 in its MADT.

So this model needs a DMI quirk to enable the MADT IRQ settings override
to fix its keyboard not working.

Fixes: a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and quirks")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217394#c18
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: All applicable <stable@vger.kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/resource.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/acpi/resource.c b/drivers/acpi/resource.c
index 8e32dd5776f5..a4d9f149b48d 100644
--- a/drivers/acpi/resource.c
+++ b/drivers/acpi/resource.c
@@ -498,6 +498,17 @@ static const struct dmi_system_id maingear_laptop[] = {
 	{ }
 };
 
+static const struct dmi_system_id pcspecialist_laptop[] = {
+	{
+		.ident = "PCSpecialist Elimina Pro 16 M",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PCSpecialist"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Elimina Pro 16 M"),
+		},
+	},
+	{ }
+};
+
 static const struct dmi_system_id lg_laptop[] = {
 	{
 		.ident = "LG Electronics 17U70P",
@@ -523,6 +534,7 @@ static const struct irq_override_cmp override_table[] = {
 	{ asus_laptop, 1, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 0, false },
 	{ tongfang_gm_rg, 1, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW, 1, true },
 	{ maingear_laptop, 1, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW, 1, true },
+	{ pcspecialist_laptop, 1, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW, 1, true },
 	{ lg_laptop, 1, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 0, false },
 };
 
-- 
2.41.0

