Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5585F34FF79
	for <regressions@lists.linux.dev>; Sat, 22 Aug 2026 14:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787407945; cv=none; b=BOIAutawgnUzm4UJgczqsj5sCL619S/POB1bvfq7uq3PB5M2c72lzfBSsyrJChCk66TLqZs+t+xiEN57BGRASaAdm0o/Zq213il1xIODIybKCI4skpvzc8u44Od1egoF3gjtIEY5SyU/OTB2YkHCAId9GNdLNgKvMHETTI7uq3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787407945; c=relaxed/simple;
	bh=xDOQfxPkBNbbsOuEBrPL5Ba9mbUc5B/HErZUMyRz/Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VInoYOmHNQgPd9gLFzi5jEyiTUq/sfqBvxGb910M9WicekhTax5AWZWZafAxF63ob7QSMt7Rw3a5TD+nkxzpk5l0vJCZYLvvCoWufiWCAZk8ilrtpQVfUtZcPa7KCq+xh6pioGqVG0XVXigJTraCelEymElbT3jyEvU2Hu24fiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edKCnQo3; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edKCnQo3"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso5081002a12.0
        for <regressions@lists.linux.dev>; Sat, 22 Aug 2026 07:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787407940; x=1788012740; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lzl656Kc/WnTsoNCqMH4D8QoNvmFwpgPRUVtnsAcOfI=;
        b=edKCnQo3vCF0fyUoL9rn+JWjfWy/BPpbTuxNjqFvyvN+/vN5MqjlQ4TRSxAXGB7R89
         CTGNfVY4/Um/rzdC+yAgozRCzu4f08HG3uw1NeVct2f0/rl31/9AzNh2+UEP7z810dHr
         2pcvdkJ39m1JsVsXsIo2ssJfm0X1hYNExobmd3pqWICl5AR8suTpUDmvfE0UZ6mNilPb
         EIbqVb56w8PhMbDfINT/hWembb6/8bbCFvyhwgq3Y0N71/YZ4Hk0Llx5V4oca9vVtaYW
         SCXauJeY3SIK+zl/wNKiT4RcgtJxeWAuvoqPXFWT4pqjLzNdh9d9+DPKGVgMqnrQHUB+
         z0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787407940; x=1788012740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lzl656Kc/WnTsoNCqMH4D8QoNvmFwpgPRUVtnsAcOfI=;
        b=KM0Q72nQZ+d8IhYX0KWC61qLdrirwcMydZGegkCRh8KZKY+wd7IzqhkpTvLpErTtQ0
         hJiO5N1YmpKo0IsxQ815N4cU5kjSbeXpI0/ZUe9PGom35Dmk6yRHUOwdZK2/8ZViAm1p
         t/d9CKdN56lp5tslTKG/TOpvHJtyivYhq/elCNA+Ec4fCA44kphHj5wHhP5IkYqYIET1
         EW5cN4T0hT41qpsYdd5R0cCILtGspQon6dQanx5SxNAXj27XPZfpWSAhGasVSEXtYb/Y
         oWyUhi0hC7op1Q1cEYIPJ2AVnZ0fc8unoSXmEte0l3pk6A2JpupubJeQVE0jSk/6FT2f
         LSbw==
X-Forwarded-Encrypted: i=1; AHgh+RpaMq4XYTRgwV9iJCs7C0pWptzYMUYPjbVvpLhejpwKruALn23s6kjBiKPoUG9Dsj/WcvQfPfHHGgxRpQ==@lists.linux.dev
X-Gm-Message-State: AFuF++k+2B9OGpZbyXjjGFezHzNhqL1PBcCCavLFwDZUAWPuBapPA8yl
	gA7dEKZDUEnMKD+9ysWof6/WpmDfalNMMdwyx+IHHXn6/ta8p5q5gxv3
X-Gm-Gg: AR+sD13uQpr54TUKggmwZPGAIGUh9q9Hbquf+bUVQzxihxV9SiJ4lq3MPL1aLD/yeCG
	CxbDoRyLOnS3e41txtWXgaJqC0o+ZLd2VL0bcqYy8B0bNxQCN0f1gKnvyfMK0n/7A8rkVk6dHeg
	0AKL9hyENziGkXsTmJWAY0SZ3uBhpQWyC6U4v8xH2Mw7r/dLaRSYFCKEfn15ud5DsPX8La0uF2z
	43jiBeK9iKTVX/xiPg34tDjtY12qMXcuzXEbYzmD6MRF1B61oBteI4lB+wZFBTSwBK9BiL0L1nn
	IGtrEkhytyJVIWkpMprk4KtOziVlGqRW7gRJ7faEh4eNS/lMDV7x0h0g6BQmWdtxbPqHiBEudRw
	1AJhRg++CbSafoZQux2O3dS4g2aZl2WyPd7eWzIyUUIWg/ilzOAASIAXjLf1nEY7EaVkDQw3gcu
	gPg/uiS630EEBChm5uLOZO9AwsLAB6iho5WppP2kFp3dmb66sBwS9+aglJeLBsZucLHaFIPK3Wr
	aifEkBAFArtOrZNhfIHmLMYrx9n3GptPxixQ+/PUn//seS6LrypMNbHduBIuv9NqKo/j97KId91
	e+epopfA758HA1chw3g=
X-Received: by 2002:a17:907:a88b:b0:c1c:2218:f317 with SMTP id a640c23a62f3a-c244d45ad2amr1712327066b.2.1787407940275;
        Sat, 22 Aug 2026 07:12:20 -0700 (PDT)
Received: from bobo (d163-170.icpnet.pl. [109.173.163.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496734bfcsm340625266b.43.2026.08.22.07.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 07:12:19 -0700 (PDT)
From: Kamil Serwus <kserwus@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Alexej Sidorenko <alexej@sidorenko.cz>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kamil Serwus <kserwus@gmail.com>
Subject: [RFC PATCH 0/2] Bluetooth: detect broken extended scan instead of guessing by chip id
Date: Sat, 22 Aug 2026 16:11:13 +0200
Message-ID: <20260822141115.58815-1-kserwus@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

commit 5ead2063611ae5 ("Bluetooth: btrtl: fix RTL8761B/BU broken LE
extended scan"), which landed in v7.2, regresses a different RTL8761BU
dongle than the one it was written for. This series reports that and
proposes a way out that should not need a new patch per dongle.

The regression
--------------

Hardware here is USB 0bda:8771, firmware 0xdfc6d922, ROM lmp_subver
0x8761 - an RTL8761BU, so CHIP_ID_8761B, so it gets the new quirk, which
makes use_ext_scan() false and moves scanning from LE Set Extended Scan
Enable (0x2042) to the legacy LE Set Scan Enable (0x200c).

This dongle is the opposite of the one the quirk was written for:
extended scan works flawlessly, but the firmware stops answering the
legacy scan-disable command about ten seconds into any scan:

  Bluetooth: hci0: command 0x200c tx timeout
  Bluetooth: hci0: Opcode 0x200c failed: -110
  Bluetooth: hci0: Unable to disable scanning: -110
  Bluetooth: hci0: disable scanning failed: -110
  Bluetooth: hci0: Resetting usb device.
  Bluetooth: hci0: start background scanning failed: -110
  usb 3-1: reset full-speed USB device number 2 using xhci_hcd

btusb resets the device, it re-enumerates (hci0 -> hci1 -> hci2 -> ...)
and every connected BLE device is dropped. With a Bluetooth keyboard and
trackball that leaves the machine with no input at all.

v7.1.7 drives the same dongle, with byte-identical linux-firmware and
identical CONFIG_BT_HCIBTUSB_*, for eleven hours and nine BLE HID
connects without a single scan error.

Why not just narrow the quirk
-----------------------------

Nothing available at setup time separates the two dongles:

  - same project_id (CHIP_ID_8761B)
  - same ic_id_table entry, IC_INFO(RTL_ROM_LMP_8761A, 0xb, 0xa, HCI_USB)
  - same firmware file, rtl_bt/rtl8761bu_fw.bin
  - both advertise the extended scan commands in commands[37]

They differ only by USB id, which btrtl_set_quirks() cannot see.
driver_info cannot carry it either: 0bda:a728 has no entry of its own, so
it falls to the generic Realtek entry in btusb's quirks_table -
USB_VENDOR_AND_INTERFACE_INFO(0x0bda, 0xe0, 0x01, 0x01) - which precedes
the per-device entries. usb_match_id() takes the first match and
0bda:8771 also presents e0/01/01, so the specific entry for it at
quirks_table:840 never applies.

What this series does instead
-----------------------------

The quirk is documented as being for controllers which "erroneously
claim to support extended scanning" - and one that claims support in
commands[37] and then answers Command Disallowed is saying so itself.
Patch 1 latches the quirk right where that command is issued; every
later scan uses the legacy commands. Patch 2 then drops the static
per-chip-id guess, which 0bda:a728 no longer needs. In this order the
series is bisectable: patch 1 alone changes nothing for anyone whose
quirk is already set at setup.

An affected controller pays one rejected scan round per power cycle
instead of a permanent stream of failures, and dongles nobody has owned
yet are handled without waiting for a patch.

The latch is sticky, as quirk_flags is never cleared, so it matters that
false positives are unlikely: hci_passive_scan_sync() always disables
scanning before starting it, so the controller is never asked to enable
a scan that is already running - the obvious legitimate source of
Command Disallowed.

Testing
-------

Built and running on v7.2 on the 0bda:8771 dongle. Extended scan is used,
the quirk is never set, no 0x200c and no controller resets, and a
keyboard plus a trackball stay connected across repeated LE scans - the
exact sequence that wedged the adapter within ten seconds before.

What I cannot test is the other half: I do not have a 0bda:a728, so the
err == -EBUSY path has never executed here. Alexej, does your dongle
still work with this series, and do you see the "extended scan rejected,
using legacy scan" warning once? Also, 0x2042 carries both the enable and
the disable, so I cannot tell from your report which call site returned
-EBUSY - knowing that would tell us whether a single rejected round is
really all it costs you.

Sending as RFC mainly because patch 1 sets the quirk at runtime, while
the existing comment says it is set before hci_register_dev or in
hdev->setup. I updated that comment, but if you would rather keep the
quirk strictly setup-time I am happy to respin as a USB-id match in
btusb.c instead - it just needs the quirks_table ordering sorted out
first.

#regzbot introduced: 5ead2063611ae56809b1b113ac44cef9547c81d7

Kamil Serwus (2):
  Bluetooth: hci_sync: latch broken ext scan on Command Disallowed
  Bluetooth: btrtl: drop the blanket RTL8761B extended scan quirk

 drivers/bluetooth/btrtl.c   | 13 -------------
 include/net/bluetooth/hci.h |  4 ++--
 net/bluetooth/hci_sync.c    | 15 +++++++++++++--
 3 files changed, 15 insertions(+), 17 deletions(-)


base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
-- 
2.55.0

