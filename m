Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DEA1386D1
	for <regressions@lists.linux.dev>; Fri, 27 Sep 2024 14:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727446578; cv=none; b=qhJy4p3hUm8CUQMEteu63sqtIRSWAGVNDnIrug6pLQ1elAciyk4p7rp+gKtpVhbRcd9USy6H2ED3/m9/L7nxcySIFTCZhgd2pmh3kSqHJtVN7aWyQ2BHaE9Y6PXumKljeoWhhSGSPrrxTEfWofqx39f93jw6jgviYB3Pg9HvjQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727446578; c=relaxed/simple;
	bh=nFOjVQ+Q6pI+KtmxTBhIGG74BM7aRQGhqhPG57v7/cM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ns2n+gNacm2Z0dqx2SCKqbTlZ7bx5Jut8t7wKyqam174oAE5riGwIq6Rp1NvGeLvHyuUUnWUXOX47kdmNeg9afXIqz7ABagIotWMC+JUG82DeIaJKxWyQ6a8h0VGv5nry9WV9rCkBBLuc0AjrtotB1xvOlLLmKDNZCny+tmIqO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iIh7QEF3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iIh7QEF3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727446575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TFW1BIJrUCI5UKgWkQUSCNzAomMKqYJA8V/kv/ybMls=;
	b=iIh7QEF3erhshIF9GZ5k0pvcj6P92gDaBzIpECxCykXrIxRalQzfXbewlTTxVT1RwsP2/n
	6O719Mr7jSsTJFI5ImyotJAQEaqwt9qGJnYRUQdSe/7yO360SW+C36XkVIzipngufH5BXo
	sKqHY/HBC/P4wz8r+QsPZefKpha2oHw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-355-qLzXGBzjNPyoLCA1zTA_vw-1; Fri,
 27 Sep 2024 10:16:12 -0400
X-MC-Unique: qLzXGBzjNPyoLCA1zTA_vw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F1E5B18F36B2;
	Fri, 27 Sep 2024 14:16:09 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.213])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7EC843003E4D;
	Fri, 27 Sep 2024 14:16:07 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ben Mayo <benny1091@gmail.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Tamim Khan <tamim@fusetak.com>,
	linux-acpi@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH 1/4] ACPI: resource: Remove duplicate Asus E1504GAB IRQ override
Date: Fri, 27 Sep 2024 16:16:03 +0200
Message-ID: <20240927141606.66826-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Commit d2aaf1996504 ("ACPI: resource: Add DMI quirks for ASUS Vivobook
E1504GA and E1504GAB") does exactly what the subject says, adding DMI
matches for both the E1504GA and E1504GAB. But DMI_MATCH() does a substring
match, so checking for E1504GA will also match E1504GAB.

Drop the unnecessary E1504GAB entry since that is covered already by
the E1504GA entry.

Fixes: d2aaf1996504 ("ACPI: resource: Add DMI quirks for ASUS Vivobook E1504GA and E1504GAB")
Cc: Ben Mayo <benny1091@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/resource.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/acpi/resource.c b/drivers/acpi/resource.c
index 8a4726e2eb69..1ff251fd1901 100644
--- a/drivers/acpi/resource.c
+++ b/drivers/acpi/resource.c
@@ -511,19 +511,12 @@ static const struct dmi_system_id irq1_level_low_skip_override[] = {
 		},
 	},
 	{
-		/* Asus Vivobook E1504GA */
+		/* Asus Vivobook E1504GA* */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_BOARD_NAME, "E1504GA"),
 		},
 	},
-	{
-		/* Asus Vivobook E1504GAB */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_BOARD_NAME, "E1504GAB"),
-		},
-	},
 	{
 		/* Asus Vivobook Pro N6506MV */
 		.matches = {
-- 
2.46.0

