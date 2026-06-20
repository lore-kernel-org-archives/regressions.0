Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEDC22F01
	for <regressions@lists.linux.dev>; Sat, 20 Jun 2026 08:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781943367; cv=none; b=XIiyGZiHUDK1HwzBgq9BUicFm47ePLDipXGbSYq50/H4TAmYkXyNDcG4R0/Pl12HxSxUF5mxasN6xugPiEcEd5r0sCDVOV/496GL3VVsanOlZm1nteoITBkBNUu2+l+gsm1f9gQlL8x5j2ur578HdvB3nXkwR/ME3BVFWefBExA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781943367; c=relaxed/simple;
	bh=T5jLWa3cmqsyOdLoK6FcBNZRxPn0cU1pIFFuE2hbvJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RRI/7AMkcAC0/KNCG/FlbBeE+Gdzc+QtmTdFgZIbVP/i23aOrdYZitKZRY+GT51NEwJZua1XzQ1OQ0aZotDCcJXqtcxtMqz5F0LM3f3s5t0povO6w0kYVR5nbKWnb9bvZ+bracMQQiKFlnD2ajUr1JlMzhp4JkzpE5vXlrHuMHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=WBIEnEkw; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="WBIEnEkw"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 28B3E277EB;
	Sat, 20 Jun 2026 10:16:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBmrkSeSLklJ; Sat, 20 Jun 2026 10:16:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781943363; bh=T5jLWa3cmqsyOdLoK6FcBNZRxPn0cU1pIFFuE2hbvJ8=;
	h=From:To:Cc:Subject:Date;
	b=WBIEnEkwzAC3cOimZLCV8e7TJDdXI8ry2E4CupI9NSSKtAegV63rYBgYcM3GR7YVl
	 4X/Kp+JbpV7hiEs3vi8wqbJ14AaFBr6qnmOsaUT4ISJbhpF4ZeurYM4PUnNKufSuXS
	 vRa42OsUSuSf3kTyvny2mYYjZ0phEfd6gzvImv8GisCN3L5G3TnbpNhlOv1QTRBVnd
	 5Rpvg7OJeM/gjuphfbxUjuJNana9XUcjCGtA+GP+cXGGniMRuMLIYROn/l/LeB+j0r
	 G5UelO708VmCCl9D7PVywxAXSmEaC5S+tSnkcgUCV5YXPnF7oJo9N2hVu584gSQVXI
	 5LlyOSE4r7ABQ==
From: Marco Scardovi <scardracs@disroot.org>
To: moravec@ukf.sk
Cc: rafael@kernel.org,
	pavel@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	crecklin@redhat.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@leemhuis.info,
	regressions@lists.linux.dev,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 0/1] x86/power: only verify usable RAM regions during hibernation E820 check
Date: Sat, 20 Jun 2026 10:15:47 +0200
Message-ID: <20260620081548.14143-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch addresses a hibernation resume regression on some UEFI platforms (such
as the HP OmniBook X Flip) where resume from hibernation fails with the error:
"Hibernate inconsistent memory map detected!"

The issue is triggered because the UEFI firmware or bootloader (like GRUB) makes
non-deterministic allocations or shifts ACPI/reserved memory regions across boots.
This changes the CRC32 checksum computed over the entire E820 table, even if the
usable system RAM layout remains completely identical and safe to restore.

We fix this by restricting the E820 map CRC32 calculation to only include entries
of type E820_TYPE_RAM. This maintains the check for system RAM safety while
preventing false-positive mismatches due to dynamic shifts in reserved and ACPI ranges.

Marco Scardovi (1):
  x86/power: only verify usable RAM regions during hibernation E820
    check

 arch/x86/power/hibernate.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

-- 
2.54.0

