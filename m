Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BA13BAD93
	for <regressions@lists.linux.dev>; Sat, 10 Oct 2026 16:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648347; cv=none; b=Wn5VSTIjdFpV2+neK51h/tu1GmPWrd8E78Bqvlg/2Raf9m0lJA2m7+XBIHbHoH3a6MziSkwTRg1A/I0dUXN6QRllD6NFQVAcJYYVV6i79XmJSsI+h5zEK876IfPXwJmuUaCB9VKEHbVoCLBx6ii7WfJ1IpZn6m1mxLu7oxYwa2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648347; c=relaxed/simple;
	bh=wQdw3JX5ndOoXhyPVmXBmiwk8XrKSyi0L/4mIulB9as=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z1WOxlwnCsHD5RqqBDfduaQW3XowFlZffakTkIg+FI7wfqqkrQRtZI5AKVW1uphPOX4dw6CO2VACV8tJULoDP8CtX1RGdB49+5Ma1Ie97mpJ2g5SciUpZ7QdLsdrhgywH/mK00SatYfpArJ5m1OEDBNa9D++to7eueYhieonX78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=COMtQ1FV; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="COMtQ1FV"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4j27qh3mJCzKpBP;
	Sat, 10 Oct 2026 18:05:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1791648336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uwp+j9u+zh5eUsQg83XhstHrX5D3CdZnHuilk3mN0x8=;
	b=COMtQ1FVIh2OqB1txY1PZGAAQiViicQht6rFqveq0FSIXqFB4pLXV4T8RXgJK28jgx16DT
	jMn9ZPgxyaI7vFV2sejvkx4SopKd0T858fwopBO3nQQIoC001NHtAZoQBhiOCw+pJVjLfo
	Wsthygxu36NzaEahKOYK0pCkP+ck/5jn1Zuyg+QYUiX0zMYzATttwC9pgzLNbHLk2GMyOf
	3xVVwgNqQvo6Jb1Js5zYqJQpVVl+5I2wKDWJ1PumdEO7l5ip2+uGFBlFxwliQn+h0256qd
	Sgwt7yALJD7wLbJAAYnhM9pvhpIxyQnsJOryUws81Ygbjh2mHYUEwlaflfvUAw==
From: Alexander Gruhlke <gruhlke@mailbox.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Lukas Wunner <lukas@wunner.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	Hui Wang <hui.wang@canonical.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Alexander Gruhlke <gruhlke@mailbox.org>
Subject: [PATCH 0/2] PCI: Wait after FLR for devices that don't honor Immediate Readiness
Date: Sat, 10 Oct 2026 18:05:27 +0200
Message-ID: <20261010160529.27974-1-gruhlke@mailbox.org>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ybsihy8n4km8gma9g6uey4ijs7z8zyos
X-MBO-RS-ID: bcd52fdcef416b7adae

Since v7.2, VFIO passthrough of a Samsung 990 PRO NVMe [144d:a80c] fails
on the second VM start (QEMU: "invalid PCI interrupt pin 255"), and the
device is inaccessible until reboot.  Reverting 10baa9b4df40 ("PCI: Drop
unnecessary retries when restoring BARs") fixes it.

The drive advertises Immediate Readiness, so pcie_flr() doesn't wait,
but it returns ~0 for 1-7 ms after every FLR.  The config restore is
lost, and vfio-pci then saves and later restores an all-ones config
space.  The Root Port has RRS Software Visibility enabled, and the drive
returns ~0 rather than RRS, so pci_dev_wait() wouldn't catch it either.
That is the same problem as the open d591f6804e7e regression with the
Intel [8086:0a54], hence patch 1.

Tested on v7.2.9 (Ryzen 9 7950X, X670E): with the series, three VM
starts in a row work and pci_dev_wait() reports "ready 1ms" to "ready
7ms after FLR".  Applies to pci/next.

Another user reports the same with a 990 EVO Plus [144d:a80d]:
https://bbs.archlinux.org/viewtopic.php?id=314833

#regzbot introduced: 10baa9b4df40

Alexander Gruhlke (2):
  PCI: Don't treat ~0 as ready in pci_dev_wait() with RRS SV
  PCI: Wait for readiness after FLR even with Immediate Readiness

 drivers/pci/pci.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

-- 
2.56.0

