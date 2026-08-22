Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B43F3CC330
	for <regressions@lists.linux.dev>; Sat, 22 Aug 2026 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787407960; cv=none; b=BX/1aWJvWKRgJgGzveYLCDhEhMr0CjU6gHJM0y/c+jtEOmL00ZM2B1v5HGLaJAEjcewkCYHhGnnsqUzzM0lAyNwBx7u+/I6vghEk8VPk2Bp92xc1CkjjF9TrSQ1a5DHQfXWFcuuvGeiNHAjwWO26IH+auyVl0qdFCpqNB+tTq1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787407960; c=relaxed/simple;
	bh=a/Zen0w90tMij5iqhPeoVzR8LiXYaB3RDaflEiW67OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bpWN2WAMPn9qPLhdDqv+uWTnsZKMJGfyAUvL8TN/QVF3Spp9L9vlbL61M2HW5m0zAEPAQGfeyh25ehaQTSLyBEVOsrjEPnIOaCL3RMRNmO5+kssVW3D5IsQgujsRhb5pKB3SL+/ojCu4FuCcSswkee8hRstI9UKMGN/VmrnBrMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rvnOGQI9; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rvnOGQI9"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2074710751so355139666b.1
        for <regressions@lists.linux.dev>; Sat, 22 Aug 2026 07:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787407957; x=1788012757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rtlvMLrP2jUPQduDljPzGOvdFkacvebUJpx+3lFSi1E=;
        b=rvnOGQI9RU3p4ebzgDkMuzhxLlMfgK9V+bN5kqHHbaPwoGnd2RK7FJfTRXV/Ve1U6z
         iMo/qm00A+MdXS4E/RIVtgHwnsR+IvV7e2q13szIr0B2GHPHg/tftFHtEpAybPgW0LSx
         Bqfk6eBLtKjSM/PU9N5/HgjeLVtDUKy2zCzR6fJrH/JqahQm3udP4AQXtRLrypVJQkt7
         KoY3Uu83GJp//Zr633ChlXTXprilQvpepmW163kmyPR9JfytNGU5hu26ICaUIgaYVSKZ
         SqfE8Ng6/zEnDs+puIHaf1tk5M6BbxjPGGHhd4aSrLe7YS/DgoOb1crOBpRnOnlNAUko
         H8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787407957; x=1788012757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rtlvMLrP2jUPQduDljPzGOvdFkacvebUJpx+3lFSi1E=;
        b=eN/bl0nOxWkLSccBAtExO9B5TliranhoOWqrwg/TNEjhv/ro1EB/WyxRh59YPJszxX
         iKou4sDSTDwJge2M1gc9NPWVNkcgHmOYi/pvq6+yt/rz/4DcaA80k3zUbzO6+exlsNTt
         R2BQodUD1jSBjHJO1C8gtNXusYz9baNy5cB7yLBSUfJjvjcYndYkY8/IoIdHQktkD6P3
         xu8WrUfLZJZ3IpIA/M4YLoaDwLIVw6zVLDHn5101ycYRI4q30xaFZBUzZzRv4+Bxz0QG
         nxjYnqS+ud6T3gjYHtfJA+5GVqE7LZYcvNW3ztHKr3ElxX6ezsTQZNzsyXtWOpemAZZM
         pKMA==
X-Forwarded-Encrypted: i=1; AHgh+Rqs0UdLc8SDGJ48mG/V7zrgJGLEdzzyCpLxkCf6yYy4Ne0k5SerrzpA58gQk+YYr9yPpO7Erzw4NOp7Kg==@lists.linux.dev
X-Gm-Message-State: AFuF++kA8xAPwL3XhN8sICQ/eDjJQwYzyAPz+AiSwMPZg3N/cmDIspIN
	KkzOPIgmv/ibUIhpZVqse4KAEOuQodPS2H5x0rEVWo4yDl1PlS82sToW
X-Gm-Gg: AR+sD12i3rSQDkAm43DvG3UVrZu4u7BoxL3/uEEEipNfpzyAPAwFUheVZ8Nyvx/6qrm
	uJtqyY5bXidabhYth448nbhKSTCZaDqg1YoE/I6TSvkJueqAQscDJ3en+IilE3qPA4c4Mo4a0kb
	YB2eBCMWukwC7YOfI7oSU1ryyN6Q1oWCVnccTOcmO+2Lts18pRl3uv0b195Zh7nXBe/e3XJLHGr
	bJzG9oiB0/cNt9Aqb2DC8fz4IujNsHlquzSxo3gWOc40eznb7D8r5sn1LIa3RYQLVBETGUg2MZ2
	YiVlkqychwb1higE0hsWXcTQ3fPe0WV3xnehQVARgU71LmnRdWihkXjak6FYAoO4cZ8GIjpG22O
	8KREemtmDSpGfqar0WCd94ut/TjMsK0v96mS1iBDqq3/P6QNt1oE8kkZnUjqeBW9jlXLLxWypXk
	AECWbxrAjBS7i5wv5S8TJiJv6tHiikDyc/THxfZdCPvqZSlfxDLaGAzuloJcHAfR79lmIoieQEF
	d7vqr6uoR2W6XHMs67xu/0g/cf67+lx2HcIOKbrNfQQLZOAUmXy2PbGF7f+L1WWkS4tGRPqI8nD
	K1jGQv+BIm1eB4i50w==
X-Received: by 2002:a17:907:d78a:b0:c20:899:b8bc with SMTP id a640c23a62f3a-c2491c836e7mr564736266b.6.1787407957178;
        Sat, 22 Aug 2026 07:12:37 -0700 (PDT)
Received: from bobo (d163-170.icpnet.pl. [109.173.163.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496734bfcsm340625266b.43.2026.08.22.07.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 07:12:36 -0700 (PDT)
From: Kamil Serwus <kserwus@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Alexej Sidorenko <alexej@sidorenko.cz>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kamil Serwus <kserwus@gmail.com>
Subject: [RFC PATCH 2/2] Bluetooth: btrtl: drop the blanket RTL8761B extended scan quirk
Date: Sat, 22 Aug 2026 16:11:15 +0200
Message-ID: <20260822141115.58815-3-kserwus@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822141115.58815-1-kserwus@gmail.com>
References: <20260822141115.58815-1-kserwus@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 5ead2063611ae5 ("Bluetooth: btrtl: fix RTL8761B/BU broken LE
extended scan") sets HCI_QUIRK_BROKEN_EXT_SCAN for every CHIP_ID_8761B.
It was validated on one dongle, USB 0bda:a728, and it regresses others
that share the chip id but not the firmware bug.

On USB 0bda:8771 (fw 0xdfc6d922) extended scan works flawlessly, while
the legacy scan-disable command the quirk forces makes the controller
stop answering entirely:

  Bluetooth: hci0: command 0x200c tx timeout
  Bluetooth: hci0: Opcode 0x200c failed: -110
  Bluetooth: hci0: Unable to disable scanning: -110
  Bluetooth: hci0: Resetting usb device.

btusb then resets the device, it re-enumerates (hci0 -> hci1 -> hci2)
and every connected BLE device is dropped - here a Kensington SlimBlade
Pro trackball and a Keychron Q8 Max keyboard. Linux 7.1.x, without the
quirk, drives the same dongle with the same firmware for hours without a
single scan error.

Nothing in btrtl can tell the two apart: same project_id, same
ic_id_table entry, same rtl8761bu_fw.bin. They differ only by USB id,
which btrtl_set_quirks() cannot see, and both take their driver_info
from the same generic Realtek entry in btusb's quirks_table, so
driver_info cannot separate them either.

With the previous patch the 0bda:a728 dongle recognises itself on its
first rejected extended scan, so the static guess is no longer needed.

Fixes: 5ead2063611ae ("Bluetooth: btrtl: fix RTL8761B/BU broken LE extended scan")
Signed-off-by: Kamil Serwus <kserwus@gmail.com>
---
 drivers/bluetooth/btrtl.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
index 7f54d2d2d..03fa9409e 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -1343,19 +1343,6 @@ void btrtl_set_quirks(struct hci_dev *hdev, struct btrtl_device_info *btrtl_dev)
 	if (!btrtl_dev->ic_info)
 		return;
 
-	switch (btrtl_dev->project_id) {
-	case CHIP_ID_8761B:
-		/* RTL8761B/BU reports HCI version 5.1 but does not support
-		 * the LE Extended Scan commands (Opcode 0x2042), causing
-		 * repeated -EBUSY failures when BlueZ attempts extended
-		 * scanning while a connection is active.
-		 */
-		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_EXT_SCAN);
-		break;
-	default:
-		break;
-	}
-
 	switch (btrtl_dev->ic_info->lmp_subver) {
 	case RTL_ROM_LMP_8703B:
 		/* 8723CS reports two pages for local ext features,
-- 
2.55.0

