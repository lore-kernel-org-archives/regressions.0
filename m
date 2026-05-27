Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0652238A73C
	for <regressions@lists.linux.dev>; Wed, 27 May 2026 19:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779911049; cv=pass; b=ANSCMpO6OGntXL4myIy6woU2FkiWyy9ZUzSp4Kcd0hpwSzMStNoPUKqeiw9PYa25vYJLvU6lFCH7rytdDnPf4sYoacPxQCU5/a/im0nu4p0kj/1fn9YYcAD1jB5Zc1I9eQjCJof4MFL9pwAFZEhtleoNaYtmZ3AYBhVWRN1pch8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779911049; c=relaxed/simple;
	bh=14VuuczbbbJJzvas9wgl1DbntX0aiuRCU3bNBOwDiiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2F407HIRbNzJjqBHpzJ3gD2kzqNBhN8XX2pyRxdRVPHus4xyMKsUHcQ3kFUf5PCVWHraK1iejnyKTSM2uElZklfPBE8Ns1BV1A3Xxyc6lGM8idSGLUKzpXLMYgDKhOghN8ITv+z6rWnfz9dTd6Ady1B7MEuTDXm4/k0wu9h7/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=FcKAOTaG; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="FcKAOTaG"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7bf0b47d2f1so106859187b3.3
        for <regressions@lists.linux.dev>; Wed, 27 May 2026 12:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779911046; cv=none;
        d=google.com; s=arc-20240605;
        b=cR1GFf9M6WrgZif8rXi8131OFfQ8DXtOtWeADIJjcq8US4DFsfV10r/Z3pocQ1uhsD
         5Ae+pDj3GEJ/bp7dP38EFX8/MM81aLZ7EHKzRUM0bBAKJF3JsVpbwdOLOwbhfnw/34pS
         D8K78cfwNiqpdQSZY2WGVE7D15fY4nLIf9ye9SOtd1x+Ovif7hWI5DB2I5II4Dd5+JAm
         8mvbre3AqHQqp1wZoiSR/8oEMk8o7HeTt6zi658bK4Nlfry4+8bpovMOh6DDIYvR2I0x
         a/fUDlnnIb33lO/WlQv/PKnGbr+OfuWMKm7/GWFuAi68zUgin6+498zxZ8fqvLSslvw3
         9gOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FX5Hf9gPxUMFpP1qebZLUIn5OeRCY5lA9+CMYbnXhBs=;
        fh=2n6zfsow8BoyQX7Cg0qh8tK1GeEeP+DpZr3zgFrsJ5A=;
        b=ULQzy+Hm4dDSD4hDcuD8qhCD/3abUQtwe/Kr8N1pyY2qGGZvkk94pbCzO98y4+8n2g
         WWKbA5jdN3PdEYWVedk3Z+XGwaKIDnJ9qsZWz1kf965hDzjAzNUSlRsyem49w6zcN4K+
         kLHkoARazgFK+ahdgCSM/BSoMIkW6qw3WJxlR0ktbjBeLAs3PBzbJ0nanSsIJ5CND6gO
         8nn83rgE2jEZ5qd+Eyi9UyZJFVrSgf3R2BA4YKSbTMiJYsArQpaUXW/EDZ2zkYJmA0/b
         J19dAeM0vivOW0XoHlC/MYmCq4KElFc9vrVaUkwSfUiekIPwtKPo85GisaaGR3BXaALr
         srDw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1779911046; x=1780515846; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FX5Hf9gPxUMFpP1qebZLUIn5OeRCY5lA9+CMYbnXhBs=;
        b=FcKAOTaGlLdMizjWt/IexSH0o97aq5/ZYLGX+TG4/8ak9bnUWKVmEPH7y60uWng5HZ
         zl3qPQnz1ywHaRb1sLkasgfQkPMw5ikfZ0/fL++ndRf9goh9IoYQVm0useMpj3ENmgaT
         EZ096kzBYB1tpCYxI7O8Rr+zIKE2Zie8bvwEdi6Ttj3cfiatUeWIv6igGaf9Jfp8vr6R
         /ofIqWAmYmPrmHbdjq0PNJj1A1Tj6el7M5DLe36JmrJOFn22hA6NoZjFArcEUcNYRJD2
         HPvyGHtpnvD757neOg57aIdLzGfkIA8ykdJY4k8c1sUc+k1L7ueGxNl1CPR0YeKZKy4H
         DbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779911046; x=1780515846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FX5Hf9gPxUMFpP1qebZLUIn5OeRCY5lA9+CMYbnXhBs=;
        b=q0BHSiQNnElCae3577KYcY/ZVQ51a3Ogkpomb7JiV2PIk+Io8LJS/az8Ue9Wux2vt+
         Ji31mpi55Jbv4b4ehJcrVfEyRlnHZY0Ivr397VtvfUhHaEXe6WJyFKyivOkWlZeGqGA+
         +99UNOO4SCwGB6dFG2kTQyUUTsL2xiIQFHXhqBVA4W12Uubgc3h60U9oUJDfo+alGXIj
         do4UAOGqokdl4o0tCtk+UKhRnGN9HtQaGfaf6Vf1E0nhcpblh3smb3LHEoEkMu9TG3UY
         g/lHuSPqqKjeHEYeGkm8a2Mk2Jz6HHfGY9i8SxO9dOwmGhlVbJGNQfxWFPurpyRVLXlE
         1hIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+ys2AjTQ9tx2jGYdp3LcJebuaU7vsS5Qrv/mBAFHOgtQOdV8TkuCezlxvr+CP/p8dPw+Utl68loH8Qg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMjVKqE4bShNJ42dnIUTOhQz/Umu2Z4LvO86B9RRoh5rD83CkN
	v93Iqga6qbzbzwQxmruh3u/Gq0A8YyPVDBgq8ft6GV0scwZTIErgLcGO6SEvvmzm+zhsD1bVa8b
	eIAJ40IxfHw9xa2+OedUMWhJMdkV9u9CNTWLEkKXw
X-Gm-Gg: Acq92OFKM+s712iZ7eHK3jDryKQlCkNALFs143bcJkNnGW90V+pO2ehuS1wFLWT2uKP
	qboIE+0Rh1TG9Fph3vpEbrcRhNTb2abySJE9GwL/aYNgtng7QmgWQZjzgvQiEJ+B+Q2iUDgLeKQ
	MndTrNOukMDXS9qKoj4EBeok4P06l/9X/crfLAwJR0ft6wvajjYNvhf9slgJiNhlBlY2uuO/4tA
	v4OK1iEsvRSblxodP2Cbdwm7aZz2HHSRqdinPOKY3BTzXomEK1VtzLBnPvY+cwEH3T2VuVX+fo7
	QkVaYGsxqasyefsTq6FSduNrCwzhL/MdmAPRk4AvciVPeiiI
X-Received: by 2002:a05:690c:67c5:b0:7db:f1b4:15e5 with SMTP id
 00721157ae682-7dbf1b41890mr21136197b3.4.1779911045555; Wed, 27 May 2026
 12:44:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <O6pYAi7yf23du9ivLsL0QqrnTmodj2lDTL7Wviv7I_nhjVtvllO7Y5Ban0TeTqrastb1RWhJtlkqrM3quLMWSriai-YjjGy312MTcEhxyWs=@protonmail.com>
In-Reply-To: <O6pYAi7yf23du9ivLsL0QqrnTmodj2lDTL7Wviv7I_nhjVtvllO7Y5Ban0TeTqrastb1RWhJtlkqrM3quLMWSriai-YjjGy312MTcEhxyWs=@protonmail.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 27 May 2026 20:43:54 +0100
X-Gm-Features: AVHnY4KcMXIIodDKjDBrd3BWymN4LQ43bArzZMANNcnK7-IF5wv-P0tsligTKF0
Message-ID: <CABtds-3GOyBr1H=c5aFV1uzfkhO3d1NHMPuon_cWDq0V=pFwUA@mail.gmail.com>
Subject: Re: [REGRESSION] Speaker pop/chirp on Meteor Lake ALC287 (17aa:231e)
 -- 6.12.73 to 6.12.85
To: Mike Karcic <mikekarcic@protonmail.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tiwai@suse.de" <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"

What about 630fbc6e870e? If so, 46c862f5419e looks relevant.

On Wed, 27 May 2026 at 15:25, Mike Karcic <mikekarcic@protonmail.com> wrote:
>
> Speaker pop/chirp regression on a Lenovo ThinkPad with Meteor Lake and
> Realtek ALC287 (subsystem ID 17aa:231e). The chirp occurs on speaker
> power state transitions when audio starts or stops. It is not present
> on kernel 6.12.73 and is present on 6.12.85. A desktop with ALC897
> (subsystem ID 1f660202) on kernel 6.19.14 is unaffected, so this is
> codec/fixup-specific.
>
> Tested on the same LMDE (Debian 13) installation with multiple kernels
> selectable from GRUB. All userspace, firmware, and configuration are
> identical between tests. Cold boot between kernel switches is required,
> as warm reboot can carry codec register state forward. The kernel is
> not tainted on any tested version.
>
> Bisection results (Debian package versions):
>   6.12.48  -- no chirp
>   6.12.73  -- no chirp
>   6.12.85  -- chirp present
>   6.12.86  -- chirp present
>   6.12.90  -- chirp present
>
> Also broken: 6.19.14-101.fc44.x86_64 (Fedora/Aurora 44)
>
> The regression window (6.12.73 to 6.12.85) includes two commits
> targeting speaker pop on the Star Labs StarFighter (ALC233, SSID
> 7017:2014) that touch patch_realtek.c:
>
>   1cb3c20688fc ("ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter")
>   Fixes commit ("ALSA: hda/realtek: Sequence GPIO2 on Star Labs StarFighter")
>
> These are quirk-gated to SSID 7017:2014 and should not run on
> 17aa:231e, but they are the most prominent sound changes in the
> regression window. The actual culprit may be a different commit
> in the 6.12.74-6.12.85 range. I was unable to narrow further as
> Debian does not publish intermediate point-release packages.
>
> I can build and test vanilla kernels for a proper bisection if
> guided, and I can test proposed fixes.
>
> Hardware:
>   Lenovo ThinkPad, Meteor Lake
>   Codec: Realtek ALC287
>   Subsystem ID: 17aa:231e
>   PCI: 0000:00:1f.3
>   Machine driver: skl_hda_dsp_generic
>   Codec fixup: "ALC287: picked fixup for PCI SSID 17aa:231e"
>
> Unaffected hardware (same 6.19.14 kernel, no chirp):
>   Desktop, Realtek ALC897, Subsystem ID: 1f660202
>
> Controlled variables (identical across all tested 6.12 kernels):
>   SOF firmware: 2.12.0.1 (firmware-sof-signed 2025.01-1)
>   Topology: intel/sof-ace-tplg/sof-hda-generic-2ch.tplg
>   Topology ABI: 3:29:1 (Kernel ABI: 3:23:1 on all tested)
>   ALSA UCM: alsa-ucm-conf 1.2.14-1
>   PipeWire: 1.4.2, WirePlumber: 0.5.8
>   power_save: 10, hda_model: (null)
>   Desktop: KDE Plasma 6 (Wayland)
>
> Eliminated causes:
>   - Topology files in sof-ipc4-tplg/ and sof-ace-tplg/ are
>     byte-identical (confirmed via binary diff). Path irrelevant.
>   - SOF firmware version (same 2.12.0.1 on all tested kernels).
>   - Topology ABI mismatch (3:29:1 vs 3:23:1 present on working
>     kernel too).
>   - power_save (10 on all kernels).
>   - PipeWire/WirePlumber (identical versions on all kernels).
>   - Desktop environment (KDE on all; a KDE install triggered a
>     kernel update which was the actual cause of the regression
>     appearing).
>
> dmesg (6.12.48, working):
>   sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files for ipc type 1:
>   sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/mtl/sof-mtl.ri
>   sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-lib/mtl
>   sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:     intel/sof-ace-tplg/sof-hda-generic-2ch.tplg
>   sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware version: 2.12.0.1
>   sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:23:1
>   snd_hda_codec_alc269 ehdaudio0D0: ALC287: picked fixup for PCI SSID 17aa:231e
>   snd_hda_codec_alc269 ehdaudio0D0: autoconfig for ALC287: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
>
> dmesg (6.19.14, affected):
>   sof-audio-pci-intel-mtl 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver
>   sof-audio-pci-intel-mtl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040380
>   sof-audio-pci-intel-mtl 0000:00:1f.3: hda codecs found, mask 5
>   sof-audio-pci-intel-mtl 0000:00:1f.3: using HDA machine driver skl_hda_dsp_generic now
>   sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files for ipc type 1:
>   sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/mtl/sof-mtl.ri
>   sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-lib/mtl
>   sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:     intel/sof-ipc4-tplg/sof-hda-generic-2ch.tplg
>   sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware version: 2.14.1.1
>   sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:23:1
>   snd_hda_codec_alc269 ehdaudio0D0: ALC287: picked fixup for PCI SSID 17aa:231e
>   snd_hda_codec_alc269 ehdaudio0D0: autoconfig for ALC287: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
>
> Note: The kernel is not tainted on any tested version.
