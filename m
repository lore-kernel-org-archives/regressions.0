Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEED85A0ABB
	for <regressions@lists.linux.dev>; Thu, 10 Sep 2026 19:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069101; cv=pass; b=MC37d/Y7ROtv1+BoEl+WItV5CKrcHDr2zqb6MWB+ew8upBub5lOZ9geut6GSnRabRWh02/6P2M8TEK616yXw5A1NYZtR/o+AHuTZcfRJtOpjjqScZBhKWwR7a1/asYn65EEwhYduA0QNp+HVke9QsHYnGQmgPE9BMspoEBC/JY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069101; c=relaxed/simple;
	bh=QwfUjTsPcCrR+WsR07JjwB4oBCESRwvkyTXKa6tz6Ds=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BIKfaQAUV1UdjqV+9nVyf7ttFBV+2GzDhKDdX8p1eVglytZGsNAdOOekqxeXDfenhhqj2wWKMr+4coGJ7qIDD7ExCdvzJdjvxZZYAU1T3RRZ9D+ogvYYyHzjMnspHoCnpLH2enUy03Mzt+T2xXmMTFRcO1oGPylFmQrRyABsOPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MvqdncCE; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MvqdncCE"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c96c92c0980so174122a12.3
        for <regressions@lists.linux.dev>; Thu, 10 Sep 2026 12:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789069097; cv=none;
        d=google.com; s=arc-20260327;
        b=VRi6wPJdpgZwRZMbNu03Kbem4a6DcEBzdtZ6VcP7JACrEq/UX8DVDrgc3SQJkLbRiz
         X03ZWP/tXBH/dF3qFNPEn2OmVyge63L922Ci03uEVeFnEVTVF2Pg9lDAemHe8HmZY337
         Fda5dcYrnPCXNP+G2Gt3iNDM3WMLjOdKdhMjWKVWKHLnWGfFzzkb3mK0wU2OHbkIvoGi
         pda9EQNPTuHb/UdTgsDeWMLpv7QOs3ni8pLklhEgkXi+lVRJlZPy9dkGzcVgSe3Ezz63
         UjswO+bcvfpJUt6ps3p6KYBtY1gVdBNy3z49o4LrbhzNfrNE/4/K4sa+fTkBOMdt84eb
         ROMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=vZImdanCLbw+Wm7Sn8/G+c9FIIp9Rw6Fv9R7mMtLeo8=;
        fh=DBTjoQqzTX4AG4UDOPzmXTD0oGzjgBpPyRCmvhISxjY=;
        b=B8i6xAxZ7Nzl0T8OoVizLCqutlID4gD+BfX+S8T0EqOWkvlCqOgkXdPcVCUJU3VrRC
         aX2rXQ7TveG61nYiMCkuDZpxzXinhEDZPLcyDIB114bWkhOKSMJf8KYPBKrpKT+LR/is
         vGAWVwNztHTbekctx0KUpZF9wTSNE3bKNEDVUNXrpG6UsFPM0kjXG8C83SvmA2b3ofNA
         gl46ejuTcLDClAd7yG2TLH9pfLsVoqCGsoUJsh0rFxCcMEvlbIKtBsmlX3gaBVrPC20P
         7Gh85EhO/MM9hW45820EsYAE7ilMyhe9phQh9glKOGfgUYKrkK/U7QkHU39xIhgOiSbI
         xNHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789069097; x=1789673897; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZImdanCLbw+Wm7Sn8/G+c9FIIp9Rw6Fv9R7mMtLeo8=;
        b=MvqdncCEJ/i2f1XF6l1v+BorU+374ixLMlJsstyNrqif7iS+FZWoWC0Vk2LMPU0oaG
         ErL1BhuUckMthA4yFzmnrvDgJ7ojXnGkIrFXunbsuBpIsUlAG79HFBTRioAY5BB5lAR3
         fRO4/NaemgpWGeKoePNIiGkBnBvx9y9aVShhZjWJqkFKBfK6plvQYvC1QnvvwY51rlE8
         aVhRzFxTOdpZQ8PNto/aEo+dVR/x9yfezpEflMRBCB0Xdm0kaTSxdgfVbgJKbBINXFoa
         a2hSdoZlc4kCo0qFrJOQfsf7gt+QWHFESoksUnoZ06lM+uu8KKgAyQ/JASzuu3cWjHWk
         17+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789069097; x=1789673897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vZImdanCLbw+Wm7Sn8/G+c9FIIp9Rw6Fv9R7mMtLeo8=;
        b=kLlxJezquNcMRpCVHdR7PA3JCeJ2fWTTuuC7EVF8N43t4vRLMk8gA3Mf45oUa6WLcM
         VLu5bfEC/2j6Y8TmNXCEkowjrsjTaQEj1l6DCvOYmDoRKAH1I2k56sBaqmRjIE23zYpf
         xiQbwJlhsu8XwWVospmJcmLbhxbxZcBehc1IVqsqM1F5FrU6OhcsfJCbPUQEyhH77WGU
         cWrwekEjm95twvrCAd7KB0lIJ4ykIwzMxUpkTATpCBF39MmNSqJeOpQWcCAFOMqMWhxe
         GhrH7xOSUGLy+imAgKLDsfQZwOpX141JxCeb1ZreL9axsoBJ2kw+ozni44erWibrlgkx
         0bhg==
X-Forwarded-Encrypted: i=1; AKwUvBzFT0db6+hM1aUTIEbI7C0vnfkAkooANAONL1Q67OJcK/ChBinaCTVhPu1YcGE6eL1aaQM+aaEDe+HE+A==@lists.linux.dev
X-Gm-Message-State: AFuF++ktURdq9i5dErbv1KIZV7djuVlLg3RKV+SVkMcXUiXN8ySR5gRh
	vttqL4WLhr9AI/HOsKvZ0mQ9l4olW8O7nP/kYjec6bnaXJrZNhBo5eNbJS7qs39e1pSi2bU6iz6
	sS95RXwZnT0IBrgtQDtFYg0T2W1guiXc=
X-Gm-Gg: AYBFou3ugvuhEpILW1Q0aWIr4liXT6oC70B548a2ggMIMiaSY8k8JUluxpZeOOr9SO3
	VXFM5axozvdY3t/ALE3+3S8ixo5jOr7n4pPP2c4pJOf03FuXHwW27kb6wgVluaWS4pOiLO6W4dY
	S4fU+gy+QM8L/9QKT9alAQ8BjFKawFA1y/0qcdHrWtq/o6oh0npD0UMDf18N+ulMS5DePQKryqs
	MK903VCAkHXLSHoN0WSbZrw1scxacUnKHexPSpWmlSBknGU1eW5srqVTrDBoU1Fqs86tMT+hA9n
	nwS8ss8GHKibn3hyrTAX8Gs59FF8en/aSqATNITojrMFi82qjoTPeJs2WYUA2dH/kDHnlV0NbnL
	nrlHQ8HBD1qCGVILIILouUSpg9eVqdFDxQkdPq33TJsywEFXLe6G5/c9ItpwgljFY8RmiBIoy
X-Received: by 2002:a05:6a21:d8a:b0:3c2:dcdd:a85a with SMTP id
 adf61e73a8af0-3daed5d1834mr758790637.13.1789069096914; Thu, 10 Sep 2026
 12:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: David Lomas <david.s.lomas@gmail.com>
Date: Thu, 10 Sep 2026 20:37:40 +0100
X-Gm-Features: AcwNN1Xc0oKMxqTRsEswAamAg5ei2rtw2jhkZBD1Uxekf_h-Wb-VKxk2IgOYJQg
Message-ID: <CALjEBWRoqHa=833_dpDxaWpj-tAiAhLuLZBfRQkOkSGgGF5gQA@mail.gmail.com>
Subject: [REGRESSION] 7.2: restore from hibernation hangs while btusb boots
 Intel AX210 (8087:0032); 7.1 and 6.18 fine
To: linux-bluetooth@vger.kernel.org
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>, johan.hedberg@gmail.com, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

My first message here, hope this meets expectations=E2=80=94I had a bit of
help from you know who...

Since 7.2 my laptop hangs hard while resuming from hibernation, and
the hang goes away if btusb is not bound to the Bluetooth controller.

#regzbot introduced: v7.1..v7.2
#regzbot title: restore from hibernation hangs while btusb boots Intel
AX210 (8087:0032)

Hardware
  Dell XPS 13 9360 (BIOS 2.21.0, 2022-06-02), Kaby Lake, xHCI
8086:9d2f (Sunrise Point-LP).
  Wi-Fi/BT card is an Intel AX210
  Bluetooth controller is USB 8087:0032 on bus 1 port 3, driven by
btusb + btintel, firmware intel/ibt-0041-0041.sfi ("Firmware Version:
202-5.26", linux-firmware 20260810).

System
  systemd 261.2
  No BlueZ is installed: the controller is only ever set up by the
kernel's own HCI_AUTO_OFF path.
  Root on LUKS + btrfs, swapfile with resume_offset,
HibernateMode=3Dplatform, mkinitcpio busybox initramfs with the resume
hook (systemd-hibernate-resume is present in the initramfs).

Kernels (Arch Linux packages, unpatched apart from Arch's config)
  bad:  7.2.2.arch1-1, 7.2.4.arch1-2
  good: 7.1.4 to 7.1.10 (weeks of daily use), linux-lts 6.18.49 (12/12
cycles under the reproduction below)

Reproduction
  systemctl suspend-then-hibernate with HibernateDelaySec=3D2min, lid
open. After the timer wakes the machine from S3 it hibernates; power
on, unlock LUKS, the boot kernel loads the image and hands over. On
7.2.x the restored kernel then stops within a couple of seconds,
within the first three hibernate/restore cycles of a cold boot (it
happened on the first cycle twice, the second four times, the third
once, out of seven tests). Screen is black, backlight off, no
response. Nothing is written to the journal. With efi_pstore +
hung_task_panic=3D1 + softlockup_panic=3D1 + hardlockup_panic=3D1 armed and
a three-minute wait, no detector fires and nothing ends up in pstore.

  With no_console_suspend, a good cycle shows these lines on the console:

    [ 2043.009649] atkbd serio0: Failed to deactivate keyboard on isa0060/s=
erio0
    [ 2044.588080] Bluetooth: hci0: No support for _PRR ACPI method
    [ 2050.400042] Bluetooth: hci0: HCI reset during shutdown failed

  and eventually the desktop appears. On a bad cycle, I see these 2 lines:

    [ 2750.173700] atkbd serio0: Failed to deactivate keyboard on isa0060/s=
erio0
    [ 2750.959900] Bluetooth: hci0: No support for _PRR ACPI method

  and then a solid lockup.

Other info
  - /sys/power/disk =3D test_resume (write the image, read it back and
restore in-kernel, no power-off), each preceded by an S3 cycle: 8/8
successful on 7.2.4.
  - Fresh boot, `modprobe -r btusb` before the first cycle: 4/4 clean
restore. `modprobe btusb` again in the same boot: hang on the 2nd
cycle.
  - A systemd unit that unbinds the two btusb interfaces before
sleep.target and rebinds them after the thaw: 4/4 clean, Bluetooth
otherwise usable. This is my workaround for now.
  - Thermal-zone state (7.2 moved thermal zone resume earlier) was
tested and does not appear to be involved.
  - At every S3 wake on this machine btintel re-downloads the firmware
(~1.4 s); in suspend-then-hibernate the hibernate starts while that
download is still in progress.
  - Plain `systemctl hibernate` (no S3 first) has not hung in the few
tries I gave it.

Happy to provide full dmesg of a good cycle, try patches, or collect
anything else that helps.

Thanks,

David Lomas
