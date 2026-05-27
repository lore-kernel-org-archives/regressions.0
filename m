Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFE7413D96
	for <regressions@lists.linux.dev>; Wed, 27 May 2026 14:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779891943; cv=none; b=B8X4ixgWNP6e9Et86uXvPbY2XMMNJjT2dCz28tfISRNnU+AvAfABJX2/qI4DBNgKIfkazI8CKI9aYw7/Y/JRIE1p7q7JKnZ+tmj/m4xTxbpeoElTk+5B1RV/YARkEjjL42yKPGjIq0miwfkE1Ii4jz0GwxyPUCW2ip3V95SzFeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779891943; c=relaxed/simple;
	bh=IlgOu6xrPBhYrYI23sQNAMauo+PA/NjtRQd/dG2lkTs=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wlw7OWnkz/VPyVCvCQmXsYdcvjg0EjOFGOU0K+z2s8SikjXcrv3Nq2vXNI7XGhwSyfTd1e5fEij/zMhtQ+ZnRqHjAlLRiZHEZ3T50GeZ1nisbLnezFaPwyYjVE+CxE5eiDp5WrouQV0bRdUK3xZIQqaG1yUdJcoUA5bN3VxIhrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=e91tYMgM; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="e91tYMgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1779891926; x=1780151126;
	bh=GyV73PTYgpNpcT481vcJDYNK3HIZIfi/Inhd+Iv0V6w=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=e91tYMgMaAKxQKH3RZV3KLy7feofz6Hj51cNEe4x3XsctcJpj/S/TDGt2M8ZZ0+sr
	 LyMzxsbclOChgAGQ0OsT1+PeQLoPhRpHS9BD6dqKR77zFYqeY8W/YtrIexiLGwzaZX
	 WIOc82nsjojUi/yC5eOS0jADp1190Vjp9Z+dmSdPwuD+ntoF9CvkCIG84WD7skOWVv
	 iGPiftjIYNVziuLaExAe4ZuAfAoK7gAVtaxYTsIgZyj1PeXY0GFqvYGLI1eYvhlz29
	 TgjrppCD72xc2wLGLpyyjd9NqniwDeuW+/QVeJ+FwxKXteCEtQSIwvc8R+BUgA/3iK
	 kN15ZAMsxXnrg==
Date: Wed, 27 May 2026 14:25:22 +0000
To: "stable@vger.kernel.org" <stable@vger.kernel.org>
From: Mike Karcic <mikekarcic@protonmail.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tiwai@suse.de" <tiwai@suse.de>, "sean@starlabs.systems" <sean@starlabs.systems>
Subject: [REGRESSION] Speaker pop/chirp on Meteor Lake ALC287 (17aa:231e) -- 6.12.73 to 6.12.85
Message-ID: <O6pYAi7yf23du9ivLsL0QqrnTmodj2lDTL7Wviv7I_nhjVtvllO7Y5Ban0TeTqrastb1RWhJtlkqrM3quLMWSriai-YjjGy312MTcEhxyWs=@protonmail.com>
Feedback-ID: 22946815:user:proton
X-Pm-Message-ID: ac78335ef8d0016c6d3ca9ce8e876c7b91f605c8
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

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

  1cb3c20688fc ("ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighte=
r")
  Fixes commit ("ALSA: hda/realtek: Sequence GPIO2 on Star Labs StarFighter=
")

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
  sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files for ipc type 1=
:
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/=
mtl/sof-mtl.ri
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-=
lib/mtl
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:     intel/sof-ace-t=
plg/sof-hda-generic-2ch.tplg
  sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware version: 2.12.0.1
  sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:2=
3:1
  snd_hda_codec_alc269 ehdaudio0D0: ALC287: picked fixup for PCI SSID 17aa:=
231e
  snd_hda_codec_alc269 ehdaudio0D0: autoconfig for ALC287: line_outs=3D1 (0=
x17/0x0/0x0/0x0/0x0) type:speaker

dmesg (6.19.14, affected):
  sof-audio-pci-intel-mtl 0000:00:1f.3: Digital mics found on Skylake+ plat=
form, using SOF driver
  sof-audio-pci-intel-mtl 0000:00:1f.3: DSP detected with PCI class/subclas=
s/prog-if 0x040380
  sof-audio-pci-intel-mtl 0000:00:1f.3: hda codecs found, mask 5
  sof-audio-pci-intel-mtl 0000:00:1f.3: using HDA machine driver skl_hda_ds=
p_generic now
  sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files for ipc type 1=
:
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/=
mtl/sof-mtl.ri
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-=
lib/mtl
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:     intel/sof-ipc4-=
tplg/sof-hda-generic-2ch.tplg
  sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware version: 2.14.1.1
  sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:2=
3:1
  snd_hda_codec_alc269 ehdaudio0D0: ALC287: picked fixup for PCI SSID 17aa:=
231e
  snd_hda_codec_alc269 ehdaudio0D0: autoconfig for ALC287: line_outs=3D1 (0=
x17/0x0/0x0/0x0/0x0) type:speaker

Note: The kernel is not tainted on any tested version.
