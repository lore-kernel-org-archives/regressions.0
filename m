Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D0B391826
	for <regressions@lists.linux.dev>; Wed, 27 May 2026 14:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779891725; cv=pass; b=Z5U4NmG1J1fJZaR2hi5tShTmkFoQQT8/1TVRv7oFS9y4Doct/tgXHGKzchyQF6RVdOyv5OtlsGoHbU5H7T0zMbsL0pT6XJNA/6m0Wygum0A7BqxTsQofBov5I2hMd2Zh62pzqVEwQud8tNIKLzYuHpNX1p+dbbXF7WZiJ3v1+zU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779891725; c=relaxed/simple;
	bh=WcTlXfqRK5RW6BJC/bAhY3JoNVwWC/yTt3liQYXXDDc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CuHc9DKhNu92uAj5MgZCETrpXGh2IuBQH+9TqUBsLnHCr7Zh6FsSkhzVzPyNAztll+7c/225OaZIEpoPJUIOHkpnX9uKB0wmj140OcswaeORI0jk2g89ep7g/jyPn7UANzwG8iBuvP0FuyF4CwZNMkWbKRNyDfAJeKjiph11vpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rVy7Zb17; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rVy7Zb17"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bd2e8931915so2357185366b.1
        for <regressions@lists.linux.dev>; Wed, 27 May 2026 07:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779891723; cv=none;
        d=google.com; s=arc-20240605;
        b=hZQM+zWmSaSgUukKewlj9WeFhbCWkO514O+3oalzafeH3TFA87YTHEvmZH/k1h/cQA
         6+9V5A8wR3nRRXuESWwueuOudn/0lDXnKbZp3zGBPTyHUzz43XHDO/1vDqDk2zivTTtN
         NOIDvG9LziO+/ligxRs+Pl1jTL4vu02ULG6QvRrEy932LnFJngpxzxyf6ScGJUTUR5fY
         tJR9XwwqEvT8/BlYqnjIM5ZIZ9DKVoARy8aPHq7WwlJ9gQPRKhq8E5SlDdV/gR0/OFZA
         PLavL/bxZANOjI4Y6YJBxH4Z6UyZfEh9UL6qCcCswvm5yaehlsr2OoqCfWO29P8RzP2y
         WWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=9CzZZCAsqPbmn/gI5Pp7Effwu8mfteaHKh9x+3bqRV8=;
        fh=xJAbtg6WzK8VIgI1vhUgZbVBXGg2K1Kn7DohJedtoXI=;
        b=EobKQdatxjetEyV35FHi8VxXVhHkFwfBNmql4FnhvRpLfIBcQ+/9OPsVfJlL4f6s/x
         qCFpo17PZYgKSXk4Oxjx0OxlWo80FAbqFeCipbl1CWnS8RwxUEtcTgyfS3yWlC2d8KVp
         yBELRv+GXJ19BbbBfYk8xkNgeZ2kXVRJwDKFoDrQ3cEF6q/SmXXMdprXc5OSyNaX53jB
         A8AHwq+rC4JBD2lDBLgm9xHZsuETjxLgp9lw8fU+QYDX9/nMD0lMMvYN8qnipK9zHpPP
         WNRTVtsGuKlT+ODS/KMWLOzHAvSZPzcvV84ELd6JgJ48ZsPgVCmwde+4biMhbZhMfnRu
         5qJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779891722; x=1780496522; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9CzZZCAsqPbmn/gI5Pp7Effwu8mfteaHKh9x+3bqRV8=;
        b=rVy7Zb171ORCwmbNnHpg5KasMeVAaecw2TJsuC4/bcgpqAgeCiW9FHbeyKQD0t2Iep
         bIkQy1N8GUQ5Q2uTWNGx1oSE66E7OMEI9wLynUnc4oeU4F60CWmCcjgme2iuZcAM+k8r
         QOck2DOW+RZkgsOKMs82LbS5aWBz/w5Q2unsuhQzpivrT8P9LNpk0gH2MVuo9+LOsG5d
         kzwPZcwwYQLn5gPIjdEKgl6H8syvhx2EMvGKFPaoEd3paP8VSMvTTfOFsL+e2kGMNJ7u
         4wGpXJRuakvpE6KGjSbS5w6mnVL3+NOsPx5+62AX7n+oo7ZIaChhZw2SreWEHsqKQ37i
         GhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779891722; x=1780496522;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9CzZZCAsqPbmn/gI5Pp7Effwu8mfteaHKh9x+3bqRV8=;
        b=NsS1d4W/oT05nHsARTLJDDm1X4lATzBmhdRrSUNxMLVgrvkVKSBhCZ7UYg1jQHof0h
         yRxRVH4Nwu2UXZ+dhfl16ZwQWe746x7vzWKUWd2vC97aR1bgIcxfoHE466UcD7aTD2+v
         euVppY2iqKAkdp+va5NfnH6r8CET3kUPrpDHE+kdSQTKBhs2GU2a+9v5lSuB9N5EIWsk
         u89i9do0IG4C03Fkb5odsJqKzylhePRR4jqSbQM92exrwmSxJZWiMfnIFr/mjMEGtZJq
         bMUBV6VYOhMU1SWldwBCQ9prHxQwNvVYdpPdi/f5IbfjuVmC1MolPevuwctEcnEI0GRk
         KDQg==
X-Gm-Message-State: AOJu0Yxp2JHz9GTcfbXzQ31tQFuG3Hm0gRvVKXJ2Oimr0zJSLPyd58X4
	RGHx1O+CmxCxH6kzIyU025zjwwHIlTpO9mg3Cf+QgH2EhshlbNewXESNNOrIKIYJiNjRPwTtLJd
	LXJxMkNwzk5UvNf3eiQMDIgCJlGT6C2E=
X-Gm-Gg: Acq92OEbutwXzirspi5GCTdocTlwu70cUYAcINegI8Zt0Q5zAYpkPeLFOixBfCWeE1d
	tezIAIUKr0a28pJ2PWuV2WahN6cBQ+YJvxeu8kvz8ApMFmLCL6aH+4YXrM6aD39+ll/p4Mx0WbS
	UpM5baH5jL/AjUZ5NUFI0yabpTKHEbH7aDdIlF26Gq7b+h3zG+BAM8T+0s5ahDO0XKex70RuT3G
	7rZYchOGMJ/62oexk7joZo9XKNA18vvl14IfKLFJYLX5yeJdfK6T8ex3pqeFkZc/kzuUj7UCxMF
	i1axq0qEK0XMNvg5md5CWObxzobKV2chRy9/wL8SyRztViUu68i2oH4UuotWSe5+LDd3vP5UKei
	rlsNcWQEkUQnfrmu8nocEseo5dbt6qypvLfUSECWdvm7g9w==
X-Received: by 2002:a17:907:96a2:b0:be3:dfa6:3117 with SMTP id
 a640c23a62f3a-be3dfa63318mr287280866b.3.1779891722268; Wed, 27 May 2026
 07:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Mike Karcic <michael.karcic@gmail.com>
Date: Wed, 27 May 2026 10:21:51 -0400
X-Gm-Features: AVHnY4JMU58f0tW3VUtvrfWsoB9CpFh_PJZlZqsSlBulZc4gOKinzyQTx0qz0Pw
Message-ID: <CABfQdu8QYU8ox2LRCc+Q7sBUWFAZtSom7V93wsNhU1N2BJNXXQ@mail.gmail.com>
Subject: [REGRESSION] Speaker pop/chirp on Meteor Lake ALC287 (17aa:231e) --
 6.12.73 to 6.12.85
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tiwai@suse.de, sean@starlabs.systems
Content-Type: text/plain; charset="UTF-8"

Speaker pop/chirp regression on a Lenovo ThinkPad with Meteor Lake and
Realtek ALC287 (subsystem ID 17aa:231e). The chirp occurs on speaker
power state transitions when audio starts or stops. It is not present
on kernel 6.12.73 and is present on 6.12.85. A desktop with ALC897
(subsystem ID 1f660202) on kernel 6.19.14 is unaffected, so this is
codec/fixup-specific.

Tested on the same LMDE (Debian 13) installation with multiple kernels
selectable from GRUB. All userspace, firmware, and configuration are
identical between tests. Cold boot between kernel switches is required,
as warm reboot can carry codec register state forward. The kernel is
not tainted on any tested version.

Bisection results (Debian package versions):
  6.12.48  -- no chirp
  6.12.73  -- no chirp
  6.12.85  -- chirp present
  6.12.86  -- chirp present
  6.12.90  -- chirp present

Also broken: 6.19.14-101.fc44.x86_64 (Fedora/Aurora 44)

The regression window (6.12.73 to 6.12.85) includes two commits
targeting speaker pop on the Star Labs StarFighter (ALC233, SSID
7017:2014) that touch patch_realtek.c:

  1cb3c20688fc ("ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter")
  Fixes commit ("ALSA: hda/realtek: Sequence GPIO2 on Star Labs StarFighter")

These are quirk-gated to SSID 7017:2014 and should not run on
17aa:231e, but they are the most prominent sound changes in the
regression window. The actual culprit may be a different commit
in the 6.12.74-6.12.85 range. I was unable to narrow further as
Debian does not publish intermediate point-release packages.

I can build and test vanilla kernels for a proper bisection if
guided, and I can test proposed fixes.

Hardware:
  Lenovo ThinkPad, Meteor Lake
  Codec: Realtek ALC287
  Subsystem ID: 17aa:231e
  PCI: 0000:00:1f.3
  Machine driver: skl_hda_dsp_generic
  Codec fixup: "ALC287: picked fixup for PCI SSID 17aa:231e"

Unaffected hardware (same 6.19.14 kernel, no chirp):
  Desktop, Realtek ALC897, Subsystem ID: 1f660202

Controlled variables (identical across all tested 6.12 kernels):
  SOF firmware: 2.12.0.1 (firmware-sof-signed 2025.01-1)
  Topology: intel/sof-ace-tplg/sof-hda-generic-2ch.tplg
  Topology ABI: 3:29:1 (Kernel ABI: 3:23:1 on all tested)
  ALSA UCM: alsa-ucm-conf 1.2.14-1
  PipeWire: 1.4.2, WirePlumber: 0.5.8
  power_save: 10, hda_model: (null)
  Desktop: KDE Plasma 6 (Wayland)

Eliminated causes:
  - Topology files in sof-ipc4-tplg/ and sof-ace-tplg/ are
    byte-identical (confirmed via binary diff). Path irrelevant.
  - SOF firmware version (same 2.12.0.1 on all tested kernels).
  - Topology ABI mismatch (3:29:1 vs 3:23:1 present on working
    kernel too).
  - power_save (10 on all kernels).
  - PipeWire/WirePlumber (identical versions on all kernels).
  - Desktop environment (KDE on all; a KDE install triggered a
    kernel update which was the actual cause of the regression
    appearing).

dmesg (6.12.48, working):
  sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files for ipc type 1:
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:
intel/sof-ipc4/mtl/sof-mtl.ri
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path:
intel/sof-ipc4-lib/mtl
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:
intel/sof-ace-tplg/sof-hda-generic-2ch.tplg
  sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware version: 2.12.0.1
  sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:23:1
  snd_hda_codec_alc269 ehdaudio0D0: ALC287: picked fixup for PCI SSID 17aa:231e
  snd_hda_codec_alc269 ehdaudio0D0: autoconfig for ALC287: line_outs=1
(0x17/0x0/0x0/0x0/0x0) type:speaker

dmesg (6.19.14, affected):
  sof-audio-pci-intel-mtl 0000:00:1f.3: Digital mics found on Skylake+
platform, using SOF driver
  sof-audio-pci-intel-mtl 0000:00:1f.3: DSP detected with PCI
class/subclass/prog-if 0x040380
  sof-audio-pci-intel-mtl 0000:00:1f.3: hda codecs found, mask 5
  sof-audio-pci-intel-mtl 0000:00:1f.3: using HDA machine driver
skl_hda_dsp_generic now
  sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files for ipc type 1:
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:
intel/sof-ipc4/mtl/sof-mtl.ri
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path:
intel/sof-ipc4-lib/mtl
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:
intel/sof-ipc4-tplg/sof-hda-generic-2ch.tplg
  sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware version: 2.14.1.1
  sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:23:1
  snd_hda_codec_alc269 ehdaudio0D0: ALC287: picked fixup for PCI SSID 17aa:231e
  snd_hda_codec_alc269 ehdaudio0D0: autoconfig for ALC287: line_outs=1
(0x17/0x0/0x0/0x0/0x0) type:speaker

Note: The kernel is not tainted on any tested version.

-- 
Mike
