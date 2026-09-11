Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2243002DC
	for <regressions@lists.linux.dev>; Fri, 11 Sep 2026 23:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167886; cv=none; b=N8qj6zueh+311APEeclq4s2g/Tzuzrc/7TWXR2fK5gyOe4bVdw07v+FaWIZcSTLExQMmzT/T1s74Whes0mBEUJlmFQJTJ0jPBpBuoswRGtZrLWh5WxKJSeukP2q+Hz5NPYVRG6rVcGFY3OtARkxdktj/VlBqSgpWrmaZUgMVdt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167886; c=relaxed/simple;
	bh=MilgiLa5y6WKlM61+O+rwrJT2ivAd86UQMA+m/dTKQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RiAeoo0MhRA6wtWK88Wb2Mw5d3gUJqnlEX9kXoLwwiaZevk1G5oCZd54Dz5ob7M1xFYQABbimx30mcuL7L1JES4LACe+67r40TSx3pHI2SzADVqD5sA1PdCS6PSSr0xgB3m1dB0K5eaq5/ZDZngiEB/tlbi0bmhLccgDsLcEF50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=httpd.dev; spf=pass smtp.mailfrom=httpd.dev; dkim=pass (2048-bit key) header.d=httpd.dev header.i=@httpd.dev header.b=VjRhXw6P; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=httpd.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=httpd.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=httpd.dev header.i=@httpd.dev header.b="VjRhXw6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=httpd.dev;
	s=protonmail3; t=1789167873; x=1789427073;
	bh=ckvaN0kdUPktjhQkazaxzW6s6W7dSoTmLoITsYkdVYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VjRhXw6PAPbTHmaSG/Nf5VHc5J4tjQo93iwB1/H+qCbgeeRJn18qb1c9w6dynI18L
	 4pgH6wiNOsESOt5MJgWdpQLq68NpGv4CVTm9PNhwoCK9z2KgigoAQ2R+agycMGJ/Eq
	 2CmcpKt1FG3RW9+l1G9f9qnYgpOM5olrWa+bGQTMYVHyMUzh3hBfQwDldfQMqv1qTl
	 CDg19zJY6QyubeE5QmCJXOuqVh0KscE6+lzBxdfoWS4227pJgH20i7uSZCChpIejql
	 DRwOykJ/kEDX2Yk4nnlI3CgsRT/HiYB7cJ8PCF4zJ+AIDTlA7u1WBl+bMqF/pCsyJa
	 3IFF1em2eG4VQ==
X-Pm-Submission-Id: 4hhVVP5rxsz1DFFN
From: Angel J <iamanaws@httpd.dev>
To: linux-pci@vger.kernel.org,
	bhelgaas@google.com
Cc: herve.codina@bootlin.com,
	lizhi.hou@amd.com,
	andrea.porta@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	Angel J <iamanaws@httpd.dev>
Subject: [PATCH] PCI: of: Skip dynamic nodes for bridges without a subordinate bus
Date: Fri, 11 Sep 2026 16:04:20 -0700
Message-ID: <20260911230420.26244-1-iamanaws@httpd.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cFJoUZ6c5g5YbFCrwUnx6RlitHRl-0cS2fadDSFJNf9SgLreKutrmZj1r56hFh8ZUAbzvuCqBG4w9ZYAE8xAWP9HnLwbjMOBzac-iMnMMZc=@httpd.dev>
References: <cFJoUZ6c5g5YbFCrwUnx6RlitHRl-0cS2fadDSFJNf9SgLreKutrmZj1r56hFh8ZUAbzvuCqBG4w9ZYAE8xAWP9HnLwbjMOBzac-iMnMMZc=@httpd.dev>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A device can satisfy pci_is_bridge() without having a subordinate bus.
The dynamic OF helpers for bus-range and interrupt-map dereference
pdev->subordinate without checking it.

On a Dell XPS 8940, device 0000:00:00.0 [8086:4c43] has no subordinate
bus, and enabling CONFIG_PCI_DYNAMIC_OF_NODES causes an early boot hang.

Skip dynamic OF node creation for bridges without a subordinate bus.
This allows the machine to boot while preserving node creation for the
other bridges.

Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
Cc: stable@vger.kernel.org
Signed-off-by: Angel J <iamanaws@httpd.dev>
---
 drivers/pci/of.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index a51dff91b..971c79c2a 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -765,6 +765,10 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
 	if (!ppnode)
 		return;
 
+	/* Bridge properties require a subordinate bus. */
+	if (pci_is_bridge(pdev) && !pdev->subordinate)
+		return;
+
 	if (pci_is_bridge(pdev))
 		pci_type = "pci";
 	else
-- 
2.54.0

