Received: from mail-oa2-f36.google.com (mail-oa2-f36.google.com [74.125.231.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF17E4E3237
	for <regressions@lists.linux.dev>; Fri,  2 Oct 2026 15:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953415; cv=pass; b=bP4OW5iqZWbFem4198mhTsPhM8QCCOfIcA7B/xNv2D2BDWoC0FxIp8GnUbKM0/PLCMMdeAAP65ft6q3IL74O8uAwW3ZbVTbQ1tEkbAXiANIjyYNSofnM5B61Dyg3JUjhzjfcm5oMegnYXbUNrAZC7amFKGjhLbCMpkEZ/HAdwpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953415; c=relaxed/simple;
	bh=MXyuGKEUfSfyI+2p8AQyIzhlojUOxHG3SgkwuZvXZfA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hfsR4CLsif7gEC2KQ8yz5f23TX1oWtAaFmr1mEzWtP1gQgasmCRD425PVaMkbZW7G8Es23T+uX485sh2FcVRz7Kt2NoN7aFNPZMjgObsHmcZhmBUCndhVa+FmsnShb7xMsofqJPT9/a8blExpMY/prJcXNsg5CISLyusGWinSi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=er73naIe; arc=pass smtp.client-ip=74.125.231.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="er73naIe"
Received: by mail-oa2-f36.google.com with SMTP id 586e51a60fabf-49dedadaa6dso10635fac.1
        for <regressions@lists.linux.dev>; Fri, 02 Oct 2026 08:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790953412; cv=none;
        d=google.com; s=arc-20260327;
        b=Lu79igVasK6CKa/hIwyZalK+F1SGaBjSeDslG8qrF6dt9ErikxC7qt32USBBgL5IMk
         QEIPZUbZQYThnJ63CpqOolHHBR26JhFo90BZOhoCJXhYN9RiuBtnfNlfSDvOSfTMpZsi
         utQ/c3jOHJtRevbUEdVomQgZC0pMhG8ah+yu06VlvD2a1z9Z0apFR5dpiWYJa3UI3Br8
         4P0CLAaHYfY7VOeG7e82uY+u0fKiWb74vrxtEc8ON/5KY/teBKnhlFyu2bFFTlJ3GBaP
         vmWVpuea1cMOE64OxmFBCqiwCJlh8H6zZ25UlebBcbizpw7YCdimCcWqFsv10ZEaKGMl
         bhbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8lTEaWqVn4XhZj9xrbkD7eCvnZ674Kwfjo0RvvsMlAU=;
        fh=JupO6TUcWMMfVoFKqUYxbTXu14024G7fPPUk/js9b1U=;
        b=gV6kcU1xIF52kBfvzLXPj6+wkb7SR1ohD2wc6jZ7sze8+tbcKUDCiXKfbwtgnMdoEQ
         kLe4DLKe6F0y09lsHs+/g3DXRpcmzeH+vp5K96aIYv6KTqaLNJAmV2Nn4QTaZ8uw7YoO
         BS8eQNGgaXjcijz7JmnM8V3TqDwZOmS6uEOSFkI4LHn2s0HMMo56hndcBx6S6ft6B2vw
         i8VS43vDzYbbCHZXfTUj1hkfmkZNjKysmTxAbHzXZcRrgLC1KWFPg4Bj3ExftRxJHkn/
         3CdxzmBNnmd3/NGpz8xC4JcahXTho2TgYkno//HaJpjjnG+aBZVcFyUNVbOIHOkQSTsX
         pwSA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790953412; x=1791558212; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8lTEaWqVn4XhZj9xrbkD7eCvnZ674Kwfjo0RvvsMlAU=;
        b=er73naIeKPK1ZlDRp/JVmjwf6tOyN0hMcP3M5kWPteadJ8WK4VcHxNpbgdlg8Kt/JE
         q0oafK2H6UI1Hy+yrI5wnPTFUnWHxbytvDUTYIjJqB1mx+WTcnm+I33S40CJyuqcyoTX
         9//N00/4Uv8lyt/Ram23vAYapYBKdhhKSqAP26Mu1yQO/5eBXp++FwKHs+5wzg1sXXT+
         +1hFoo++0YJiaDFAgYX6kpoteRqRoVjVP//M73C/9ZvqJsWw+4RSC0os/2n/ZlUKPbuV
         MRbefA2lJCeAszjBsgKmU7Qq/HKI7TMuk9oxpTblRZXtsSE0myvxPIy2rTsavkra9cVV
         xxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953412; x=1791558212;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8lTEaWqVn4XhZj9xrbkD7eCvnZ674Kwfjo0RvvsMlAU=;
        b=k4mmXrCeOsGsUEItQokq40QXTYq5t2k0v12Kx8K3SJUvm+zTBMaH0tiBY6LMHoNrLH
         h5Zb5NmVrfZ3q9RoBNhqeFhSuwUB4R7v9CskZpjo1j3G4ZlcuH2Bk+ngCyT4M+SYphof
         BMYZ3Oh+7hp2XRsCgS2nR3BJfHNKb4II3vDHTebYc7Zjt5RKbekIxRWGbNLTvgiKsU+X
         ek1hmAvaCrOLRP7r/b6OUcWVo+RbxRbr/T4hMgwSVgqbMNbcwBC7WwyKqmvjwB5mugcO
         wj6ZqFhM5H/5l+5vVInJmJKMATthS6JzCOSWuyHF1QSWzLQT7xUpxBsXQVTJoN1V6g+M
         h5hQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH8a4gwH797K74O7xiIJtii5sHyun9dkJztD9RS1Ckf8zzfJmKxEbr2UPs2FjHeg7OJQNXLeXNL2M4+A==@lists.linux.dev
X-Gm-Message-State: AFq9FYLzWpA2kiKn6lHTtju2QJm+aABE76YyjASHfmMjqWX2Z8RzKJvE
	WyFtHeGAtcp/3VBDbJk45kp7pkDzixsr93Q/frazmWeBVfDGjTAgOCRh7fqhhPpYQsngRgoI6vO
	ex6xIKiYByvdtHqosDHOlzFtu+dVsYoc=
X-Gm-Gg: AYBFou2NITaNcDDpkuiJmmKtK0+dze3O8nis75iSnYguPzrGsHKKoo3ICmTRCr0FsA5
	ovO0AgRQTIVPB14K5e2KRSscNoN+7yycAfpJdgVSD5oJUs9fzYzpvGpTbn7uuPoSN2g1lQoWq/C
	k9vt5UbE/MmgBGXcHExhz4RDgM7QtZNbqV5oTKI0FvEJBAJmfElvHCQrPYV2YfQsFBuaa2Q9XY6
	PNu46xtmg3CY7WB0Lffp0RNEPEwkrtw/XPz7bVG1aIx7qB2d1FnOeh9KzDqAyF5e+/gWbXZO62s
	r2zk6QsyvVkurBBjmHuK/HBLJb/CuDyKvNwP61lrxerdMKvY3zHJKydgS8wTagDL+c0/iXyMEdP
	hyRwDqAYXNQ==
X-Received: by 2002:a05:6870:8317:b0:48f:e3d4:d45c with SMTP id
 586e51a60fabf-49e15ecb7c3mr2560343fac.59.1790953412253; Fri, 02 Oct 2026
 08:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Andrej Scek <scek.andrej@gmail.com>
Date: Fri, 2 Oct 2026 17:03:21 +0200
X-Gm-Features: AclHuK9lgIwoonEzw54BF2CV4ZLaFO120r5yd1MlEhGJg1CKBsqg6KdWM4n_Kv8
Message-ID: <CADrS85612m-Hh-G4BJmOhy-y6r3Ni3kD8_GM-2QRBeWWEEZWuA@mail.gmail.com>
Subject: [REGRESSION] amd_sfh: accelerometer broken since 6.19 ("Event data
 for report 1 was too short (15 vs 14)")
To: linux-input@vger.kernel.org
Cc: Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, srinivas.pandruvada@linux.intel.com, 
	Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hardware:  Lenovo Yoga 7 14ARP8 (82YM), AMD Ryzen 7 7735U (Rembrandt),
BIOS LCCN18WW (2023-09-16)
Distro:    Fedora 43
Component: amd_sfh / hid-sensor-hub / hid_sensor_accel_3d

Working:   6.18.13-200.fc43, 6.18.16-200.fc43
Broken:    6.19.12-200.fc43, 7.2.8-100.fc43

Description:
Screen auto-rotation stopped working after updating from 6.18.16 to 6.19.12.
Since 6.19, every boot logs repeated warnings from the AMD Sensor Fusion Hub
accelerometer, and iio-sensor-proxy never receives usable orientation data.
Booting back into 6.18.16 restores rotation, with the same BIOS and userspace.

Kernel log on 6.19.12 / 7.2.8 (zero occurrences on 6.18.x):
  hid-sensor-hub 0020:1022:0001.0003: hidraw2: SENSOR HUB HID v0.00
Device [hid-amdsfh 1022:0001] on pcie_mp2_amd
  hid-sensor-hub 0020:1022:0001.0003: Event data for report 1 was too
short (15 vs 14)
  (repeats 13-86 times per boot, whenever the device is moved)

Occurrences per boot, from the journal:
  6.18.16: 0, 0, 0
  6.19.12: 13, 31, 21, 86, 70, 39, 19, 25, 74
  7.2.8:   12

monitor-sensor output:
  6.18.16: === Has accelerometer (orientation: normal, tilt: vertical)
  -> rotates correctly
  7.2.8:   === Has accelerometer (orientation: undefined, tilt:
vertical) -> never changes

Steps to reproduce:
1. Boot 6.19 or newer on this machine
2. Run monitor-sensor and rotate the device in tablet mode
3. Orientation stays "undefined"/unchanged; dmesg shows "Event data
for report 1 was too short (15 vs 14)"

Notes:
  - Not bisected yet. From a quick look at the git history,
drivers/hid/hid-core.c
    and drivers/hid/amd-sfh-hid/ have no changes between v6.18 and
v6.19; the only
    hid-sensor-hub change in that window is b3e5bcffda37 ("HID: hid-sensor-hub:
    Use pm_ptr instead of #ifdef CONFIG_PM"). So the cause may be elsewhere.
  - iio-sensor-proxy 3.8-1.fc43, GNOME Shell 49
  - Happy to test patches or bisect between v6.18 and v6.19.

Additional info:
- iio-sensor-proxy 3.8-1.fc43, GNOME Shell 49
- Happy to test patches or bisect between 6.18 and 6.19.

Fedora bug: https://bugzilla.redhat.com/show_bug.cgi?id=2545224

#regzbot introduced: v6.18..v6.19
