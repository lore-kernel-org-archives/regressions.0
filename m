Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FEC24B28
	for <regressions@lists.linux.dev>; Fri, 27 Sep 2024 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727446586; cv=none; b=ccqc2yqAlwrZFSf5XgWgh17W+bnavhz6P2W6uucAWuPqVWiGRpT5Lh4MvKy0VF79qqf+NBEpCa+xR9JfD8p3RInA/cBMllC7wHozeU+TLTHnz0fvosJcWzGNLq7JRNcrJEKIMZbmDwGX0QlzKfTpQtaJE86TLes2p6vcPy31ryU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727446586; c=relaxed/simple;
	bh=lgnNlVYyaY1Gq35epLXc2xk3UmcREDNwbqplkuqtrxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OAXnINl4P6UgtgxQ1wJQfdWA7maNaGrF9X7dSct4meC8tTy6R2i1jHzajL3CSEn0JF3JFkc4Rw9849oEMGNEp5X6Zs09Np2+iqr9OCCwDqxH3Zt0rUO4GPG0eTs+IxKNH1GqN1lDxt0u++/qe1c+sefDiSP+aBo7DzbWWFHYMTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N3DDIyTx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N3DDIyTx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727446584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1nhcvv20+83wxqlmldyHBKA2HMfVVTDyvB5SLewi9B8=;
	b=N3DDIyTxPpNGLeli/a2fnMSOUxvacT/PBS27eTM1yIqWXL2EfYWiKa3qyhHfZfJqskN7m3
	WeGqUgk0loXTDZwL6XTBqPz7A6saNvIdJ85ADSxKrWZ58guRBIMQmE54nx/vn50/xBsTaz
	Iac7wcTTAtfpHe7DafLYu6VxnaGUO1U=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-250-_N-DxtUUMKCx3hI8arBe1Q-1; Fri,
 27 Sep 2024 10:16:19 -0400
X-MC-Unique: _N-DxtUUMKCx3hI8arBe1Q-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1193518B0960;
	Fri, 27 Sep 2024 14:16:18 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.213])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DD1A73003FD2;
	Fri, 27 Sep 2024 14:16:15 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ben Mayo <benny1091@gmail.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Tamim Khan <tamim@fusetak.com>,
	linux-acpi@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH 4/4] ACPI: resource: Add Asus ExpertBook B2502CVA to irq1_level_low_skip_override[]
Date: Fri, 27 Sep 2024 16:16:06 +0200
Message-ID: <20240927141606.66826-4-hdegoede@redhat.com>
In-Reply-To: <20240927141606.66826-1-hdegoede@redhat.com>
References: <20240927141606.66826-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Like other Asus ExpertBook models the B2502CVA has its keybopard IRQ (1)
described as ActiveLow in the DSDT, which the kernel overrides to EdgeHigh
which breaks the keyboard.

Add the B2502CVA to the irq1_level_low_skip_override[] quirk table to fix
this.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217760
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/resource.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/acpi/resource.c b/drivers/acpi/resource.c
index 8e672790ac51..3d74ebe9dbd8 100644
--- a/drivers/acpi/resource.c
+++ b/drivers/acpi/resource.c
@@ -510,6 +510,13 @@ static const struct dmi_system_id irq1_level_low_skip_override[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "B2502FBA"),
 		},
 	},
+	{
+		/* Asus ExpertBook B2502CVA */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_BOARD_NAME, "B2502CVA"),
+		},
+	},
 	{
 		/* Asus Vivobook Go E1404GA* */
 		.matches = {
-- 
2.46.0

