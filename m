Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988B64457D5
	for <regressions@lists.linux.dev>; Tue,  1 Sep 2026 19:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292096; cv=none; b=UJlB5Yv7zKCtyd0Nq6sm2WnCZvNqSQq36UVZXqG9dLKNtsWH8MUMK0Ug4HaTWDa/40Cn3ZyKwR/lqJZ0u9UF5ewOM6+iv+CiVG25Mjqk/PUxSDVlbtJ31Rlkbjz8pl+lSUKNU4hKbNivAG4rjexNCGhrfJry97FfVZ3CmXQtiD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292096; c=relaxed/simple;
	bh=sPC3Ah28TihUij+uD/N02WrVG3dZzALQlVZpFtjEf+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVVn8BPF3OzHJt0UC/8+Cs330iEhg3D5kt68tVabM/uAQPiCtie6jJz2pnSjoKGzC16ddQp6g5N8FtWMH9aF98+mBT6N5Gw33CITpUMkLiaf4yYdhWWDxTBTPKJbZJr+UCy4BRj65xyGj9yImY+nueewq+gErEe0eXmYwc4IC8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/mHLf2S; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/mHLf2S"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so1750915e9.3
        for <regressions@lists.linux.dev>; Tue, 01 Sep 2026 12:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788292093; x=1788896893; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=omAAgGNiYBPCrHMFPlQIFcFCi6bz3SF78ujtnlnWU9s=;
        b=c/mHLf2SyB/9ahTts5Kc/C2jNSpRwqF3iW5FYkNDnTpEscU3GHRaShUhCKb+GqKhfm
         43txW9MyvzlIJGfA7fcvxpeEdMz7S9FTW3uFMBFF3pkjtunyg/VBRVLGUqbLykjgGpPK
         pzNmej1abGBDWomQaHlCHy3M02d8vRBgiS8HCN6DT7dU2NhAM42Loc1ZgICpDLs0hxi8
         ThFX9Tck1i6wn/KGw7tAVhiV/r4jA1pcP2zAgK+8zQFnM/Jsj/SjkrmjGkFHpZtgmdl/
         Y1Pqwh27gQjrAyqdg1CHxr7SYHm0NDVWlHlnHPwy7x14iIpa/U+DZpPGZnv4NraTERkT
         xEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788292093; x=1788896893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=omAAgGNiYBPCrHMFPlQIFcFCi6bz3SF78ujtnlnWU9s=;
        b=Vdc5JUcvYZ+amrx4yjghqM/+QB1q0n/wnlbwUfItd8vitNjGFqTU6morW5ztjRwmqE
         5JE0egomcNcoa8XzIpindpNcG0R/SA+VEfeUgtdQSiCVVvzSNcBUQV69aw49XrgzYKwX
         HWCWIbJkhtRxxXZoDBDK/bUR3BVxo1Epe6OblURkbVaQgLWPRiEe1ZR+KORwuOr1Lfya
         yFucuqWPTZySaAWFfJaJ3ik7yVmsEmoVDovITRFYphr9u6lOesoxBi8oWkqWhCyDKcHe
         meAc2NY1VAmLrJuEKd3AeN8bPrBpyD7Plt3DAH5zCMec8IvOVYl2g+EFV8IuOT/vBw93
         I7hQ==
X-Forwarded-Encrypted: i=1; AHgh+Rria4zy9ZhMVbtzwF+Vq+y0FxPKQBq1z1jQnBxAXvdG2V5g+lYd9ECIit4GbNf7dqPc7ZRGnXJ0Mmg5cg==@lists.linux.dev
X-Gm-Message-State: AFuF++mtEg6QuQi5iq1j2oB7T6UnGoyCRT55nvLmovwnQq3htLi9Irle
	o8UWsCtyrUzVqQsavWvLOjyNTHYfkF6cOWr/rnM+S4LkQsUH+JJWCfk=
X-Gm-Gg: AR+sD12Kr5o/JSMNl7o/E5PxuPydxGmwBHCQDcVZS5SQrRqi0rzlbjyBAd/unlHIXWM
	VjnAyMvYzDNEhR7FCqQBPQClFnhr+qut6pZDcX8LloeIrIluZk06NGI5ql4rUMoOh5DxTkOC8U9
	v2+CNEZvmYobQlas9Z+yDPp85MfOksxDK59RkqfdJnj0h0JLxpIpKp03uCxuDmG2b8Bvx6UV/p2
	LibRd/1k7+mJ24Ht35E1bl1b/LYsXqH2P5QiC+N9TUth69A8TAl8MsKjlgr9HXWYckqWA+huGpF
	5t3tdBoc5pF9Atz35o8GMQRReWM4HjcCJ00f/LfhJofB/QRTY2h8yUm845tvVxd4T7uUjqycXK/
	PiicfHLBjAe8by/iFlMhcmWCoaEeM7LxJuZsciyjw+vK6XSKDWVJHSBXD18AqDwmYKUC06Im20p
	wkpjos46nywTHp06+5SO/515ejZHv2bNpCNlIutQmB9BtPlePDHnTPAFb2dS812784GQt8oAXyw
	zDbukpMTWwdAsXahkBXJ0xYnOU4wcvungUWr+neB/OiUB45eCXnl28AjJ3gZjMBth8da8G2ww==
X-Received: by 2002:a05:600c:a012:b0:49c:d818:8764 with SMTP id 5b1f17b1804b1-49cd81887aemr267991585e9.11.1788292092338;
        Tue, 01 Sep 2026 12:48:12 -0700 (PDT)
Received: from chateau ([148.69.202.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72b5bsm1166896f8f.4.2026.09.01.12.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:48:10 -0700 (PDT)
From: Sergey Zagursky <gvozdoder@gmail.com>
To: miguel.vadillo@intel.com,
	sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION 7.1 -> 7.2] media: ipu-bridge: IVSC camera broken by c6b1b34b5090 ("media: pci: intel: Add CVS support for IPU bridge driver")
Date: Tue,  1 Sep 2026 20:43:54 +0100
Message-ID: <20260901194526.6369-1-gvozdoder@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

the internal camera on my Dell XPS 16 9640 (Meteor Lake, IPU6 + IVSC)
stopped working when going from 7.1.6 to 7.2. It is still broken in
7.2.2 and, from code inspection, in 7.3-rc1.

#regzbot introduced: c6b1b34b509032c7e7cef9efc63cab55c2ad309e

Hardware
--------

  Dell XPS 16 9640, BIOS 1.4.1 (04/22/2024), board 029TJ2
  Intel Core Ultra 9 185H (Meteor Lake)
  IPU6: 00:05.0 Multimedia controller [8086:7d19] (rev 04)
  Sensor: OVTI02C1 (ov02c10) behind IVSC
  IVSC ACPI device: INTC10CF:00, path \_SB_.PC00.SPFD.CVFD
  Transport: INTC10D0:00 (\_SB_.PC00.SPFD) on LJCA USB bridge (8086:0b63)

  Good: 7.1.6
  Bad:  7.2, 7.2.2 (CachyOS builds, but the relevant code is unmodified
        mainline; ov02c10 / ivsc-csi / ivsc-ace / intel-ipu6 /
        intel-ipu6-isys / mei-vsc-hw all have identical srcversion in
        7.1.6 and 7.2.2 -- only ipu-bridge and mei-vsc changed)

Symptom
-------

No sensor subdevice is ever created:

  $ cam -l
  [..] INFO Camera camera_manager.cpp:340 libcamera v0.7.2
  [..] INFO SimplePipeline simple.cpp:1911 No sensor found for /dev/media0
  Available cameras:
  (none)

  $ ls /dev/v4l-subdev*
  (none)

  $ media-ctl -d /dev/media0 -p | grep -E '^- entity' | grep -v Capture
  - entity 193: Intel IPU6 CSI2 0 (9 pads, 8 links, 0 routes)
  - entity 203: Intel IPU6 CSI2 1 (9 pads, 8 links, 0 routes)
  [.. CSI2 2..5, no sensor entity ..]

  $ ls /sys/bus/i2c/drivers/ov02c10/
  bind  module  uevent  unbind          # no bound device

  $ ls /sys/bus/acpi/devices/OVTI02C1:00/
  cid  hid  modalias  path  power  status  subsystem  uevent  uid
                                           # status=15, no physical_node

dmesg (loglevel=3 on the console, taken from the journal):

  intel-ipu6 0000:00:05.0: Found supported sensor OVTI02C1:00
  intel-ipu6 0000:00:05.0: Connected 1 cameras
  intel-ipu6 0000:00:05.0: IPU6-v4[7d19] hardware version 6
  intel_vsc intel_vsc: silicon stepping version is 0:2
  ivsc_csi intel_vsc-92335fcf-3203-4472-af93-7b4453ac29da: mei-csi probed
      without device fwnode!

Note that ipu-bridge reports success ("Connected 1 cameras"), so nothing
is retried afterwards.

Analysis
--------

c6b1b34b5090 added two fallbacks to ipu_bridge_get_ivsc_csi_dev():

	/* IVSC device on platform bus */
	dev = bus_find_device(&platform_bus_type, NULL, adev,
			      ipu_bridge_match_ivsc_dev);
	if (dev) {
		snprintf(name, sizeof(name), "%s-%pUl", dev_name(dev), &uuid);
		csi_dev = device_find_child_by_name(dev, name);
		put_device(dev);
		return csi_dev;
	}

  -	return NULL;
  +	/* Try to locate CVS device on the I2C bus */
  +	csi_dev = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
  +	if (csi_dev)
  +		return csi_dev;
  +
  +	/* Fallback to platform bus for CVS device */
  +	return bus_find_device_by_acpi_dev(&platform_bus_type, adev);

The fallbacks are intended for CVS (INTC10DE/INTC10E0/INTC10E1), but they
are reached for every entry of ivsc_acpi_ids[], including the IVSC IDs
INTC1059/INTC1095/INTC100A/INTC10CF.

On this machine the IVSC ACPI device INTC10CF:00 has two physical nodes:

  /sys/bus/acpi/devices/INTC10CF:00/physical_node
      -> /sys/devices/platform/INTC10CF:00     (bare ACPI platform device,
                                                no driver bound)
  /sys/bus/acpi/devices/INTC10CF:00/physical_node1
      -> /sys/devices/platform/intel_vsc       (the real IVSC device created
                                                by mei_vsc, parent of the
                                                mei-csi client)

and they appear in this order relative to the IPU6 probe:

  07:59:29.297  platform INTC10CF:00 created (ACPI scan)
  07:59:41      intel-ipu6 probe -> ipu_bridge_init()
  07:59:42.391  platform intel_vsc created (mei_vsc, after the LJCA USB
                bridge and its SPI controller have come up)

So at ipu_bridge_init() time:

  1. bus_find_device(&platform_bus_type, .., ipu_bridge_match_ivsc_dev)
     returns NULL, because the match requires dev_name() == "intel_vsc"
     and that device does not exist yet.
  2. bus_find_device_by_acpi_dev(&i2c_bus_type, adev) returns NULL.
  3. the new bus_find_device_by_acpi_dev(&platform_bus_type, adev) matches
     the bare INTC10CF:00 platform device and returns it.

sensor->csi_dev is therefore the wrong device, and

	static int ipu_bridge_instantiate_ivsc(struct ipu_sensor *sensor)
	{
		...
		set_secondary_fwnode(sensor->csi_dev, fwnode);
	}

attaches the IVSC software node to the bare platform device instead of the
mei-csi client (intel_vsc-92335fcf-...). ipu_bridge_check_ivsc_dev() then
returns 0, ipu-bridge reports "Connected 1 cameras", and the probe is not
retried.

When ivsc_csi probes at 07:59:52 it finds no fwnode ("mei-csi probed
without device fwnode!"), so the CSI-2 link is never described. The sensor
ACPI device OVTI02C1:00 has a _DEP on INTC10CF, which is honoured
(acpi_honor_dep_ids[] in drivers/acpi/scan.c), so it is never enumerated,
no i2c client is created, ov02c10 never probes, no v4l2 subdev is
registered, and libcamera finds no sensor.

Before c6b1b34b5090, step 3 did not exist: csi_dev stayed NULL,
ipu_bridge_check_ivsc_dev() returned -ENODEV, ipu_bridge_init() failed and
the probe was retried later, by which time platform/intel_vsc existed and
the correct mei-csi child was found. That is why 7.1.6 works.

The commit message says the patch was tested on a Dell XPS 13 9350 with
IPU7 and CVS; the IVSC path does not appear to have been covered.

I could not find a fix for this in v7.3-rc1 -- the ipu-bridge changes there
are additions (Himax HM1092, NVL/IPU8 IDs, DMI quirks) rather than changes
to this lookup. I have not booted v7.3-rc1, so that part is from reading
the code only.

Happy to test any patch or to collect further debug output.

Disclosure of tool-generated content
------------------------------------

Per Documentation/process/generated-content.rst: this report was produced
with the help of an AI coding assistant (Claude Code). I asked it to find
out why the camera stopped working after a distro update. It gathered the
sysfs/journal/media-ctl state shown above from the affected machine,
compared module srcversions between 7.1.6 and 7.2.2 to narrow down what
changed, and located c6b1b34b5090 and the code path described in the
Analysis section. The wording of this mail is largely its output; I have
reviewed it and can reproduce and defend every claim in it on my machine.

No reproducer beyond "boot the affected machine" exists. I have built and
booted a patched kernel on the affected machine; the fix is posted as a
reply to this mail.

Assisted-by: Claude Code:claude-opus-5

Thanks,
