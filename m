Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794792253;
	b=Jg4dwFQ25VfSxXTRAATR5JsU2vP6gJjLHZlZmDBZfigXep+hPI2na2otNDs7/FO4DcS4
	 O/rnqiNTLoyrln9oFZ2m9gPDWhLsfO+0p+Xbao7CTfTqQaGoeN3g+MFlcJ+LODyo88g2E
	 Y+2l14Q90fSMvbFh4/7FrvB/sv5dnMclwCY8mNgW8P9yBS/xr/bR+NidU94Jj3kMWqJ3w
	 R8dNXhS+p/9+WS8XRsWkkiBpRJIIw3FJnQTK33dOniGcBKp2o8ozMJRb3l2aeKHC60yVB
	 R2p0S5UxuINiiZy9hdxMR3bKoxsbXBPOwxHAd59BFkSUqAphkT2Q+14xiLsf3gzsc1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=r7vL0qrifdEMu6hnfiQ4kzrLVyL8oBEHcc38n/hRip4=;
	b=VASYPGzi9ePQAaiUOToNQOhQqF7SdS1x2AizyPB7XT540Z9Q0gu+GXWzkcJ5L4A599jp
	 CE+c1dRkCVv34NSX+U622IjtpV77CjMDT+IEWD8IkrkAFs/n2ql06q0L2K+nG0IzeEx2l
	 X/A2idDF+9FhTIGaNcyUKVBGOp/lgSWnCJtFgofP9jPXoUf2K8YBTS3GpM5ZKjymz3fgT
	 VroJ4XBYHIFxNmXa8V2b/ONoL9vnt6GjIlXZFbv74yRoyMuwQ41hwb1bZ6YOwIi6LR2ho
	 t446pCjEZGvTijhjfiaXXwy1o+Y9jvZ6UcOfWYiKFmlazEEmOcRiO9DXnc+LPKaRYuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MmJhfxxr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D653606A329
	for <regressions@lists.linux.dev>; Mon, 16 Nov 2026 01:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D653606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MmJhfxxr
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so18227955e9.2
        for <regressions@lists.linux.dev>; Sun, 15 Nov 2026 17:24:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794792252; cv=none;
        d=google.com; s=arc-20260327;
        b=DVhAsX/htRE+1IdSo1WiV/v+9itC2sjtfusPx3emUagHOycA8J/Et0X+AZ4/aZ30rR
         cyF+ohxCUNhBWqkb1ai01UDh4dJ2i7OOoCG/9HtsrKboE06G3KAiLDEjNvY6mKH8lzGa
         amC1lDtwsHAiqaqnfp+A1zHKDIr0G3ypRHQprJJZWuSHEnLOrCQjxxi6CQwWAHIR6/aQ
         S2MOPGGDChAEtx1pGaigj3UabtRjbwbMIpl65ECcHFETIE71MgXNjTSvbrDuXjCtkgqA
         9Xoes5LSu7vA1W44Bixf0R+lmhqfJBalAFhrjgZLxNnemjBS98f6HThRYMO88GJDot79
         Bz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=r7vL0qrifdEMu6hnfiQ4kzrLVyL8oBEHcc38n/hRip4=;
        fh=XvF9rh4Je17lOT/IUdT1xY9s1PkLJdX1pgiLelEZP4A=;
        b=C5P3Qs14JeWmvSJrDvcKmKjyI5W+4ITRDhiVOpyKRBVvqSdY/qOVu5tgzeKElA/Hbm
         cSc0tvH2pybSyKC9i4+3fLSqXkC3TWQ4sxpgGSwoergd1Wq0s02KoGCvUfA8n//sKfqm
         3qEOMGJNgmk2begsWIZb+x8LtoEuwe4Be8nipl/VVI4yhMJK6+sKtAnzy4dgYYTRXJC0
         FF7VfeJenKUkEe/GpeXiSSvdAF4lpm3FF0YGVJo8WdnEfU2WJ6PvpWQDdanysHvlZmsm
         FBfdC9IcePjgZ9NzvZT0FIfMaFNCzH9cJBsOcfTa/Vq8KMJNQ/sdxlgHCltCYv7QeuOE
         fBag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794792252; x=1795397052; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7vL0qrifdEMu6hnfiQ4kzrLVyL8oBEHcc38n/hRip4=;
        b=MmJhfxxrwuOJQirSVJV3Oo9ZlhqqaL0yLIMAd87dMEQs2ebXjKsNISGERyMhFHa6fz
         ntgjfBL2qVFO6yDYhkygpw/61QlqUlhgFgv/njWt1a7E7fVDJbT+1gMKy/eSq2ObAG0o
         kbdFWIrNXTJIy4kURETInQRhc7MGURYgssqeVbcdh2SZNxi/qIND5Gz0QtKqfwtwvk7v
         ZBbhB/zYy8dfOQiXBcwzqTCnlZfpx9Kj6uJtDaWc4BVIgQ8zCAv2DddRaqp46i4fZBIE
         gC8qH04P2gq4V/vcFPECb95JsfGh0EKkFo5gu8oMPBl8MvHomkda0zkZM9Eq5jeuOGkU
         W4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794792252; x=1795397052;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r7vL0qrifdEMu6hnfiQ4kzrLVyL8oBEHcc38n/hRip4=;
        b=vNJRLjE/Ch4nCvqCgG4QKSYHdTYl0Ovjajf+0hln9QPqKogRvU7hWDzzJ0L76BI9px
         CmFqnSnDKkQYCGveRlT863VUcq0dAI5KSWaNqzHcxqRC3meq3i3Wk5HVVebPU5eMOtBU
         fA83BWM8TGLfuLy0JoKX4WhjcW4M7zXbhUPYGiOpehPbiSl7ld0/1+6f613ekE8+hYQp
         t4CfnHDwtSXKGnMBYAbdccD8fi+J4Wr3R0SXlIcYJzBH96RLaY3R4LbMpcgB3hwMyZ1M
         R7HIwobCt7KAOAo9DHt60cOwC0kVQ+ae6YcYZQ3cDKBjr4ANJsy+/02XY0q8M51LATQS
         AUeQ==
X-Forwarded-Encrypted: i=1; AL+hErE9WjnVl1l7NutEe+rGYXEEFoxztFdAcWXT1pBa7rK98fhCjhc8scnfS0hHpxZ4Jl9jFEiST9a9Gh8l+g==@lists.linux.dev
X-Gm-Message-State: APuU4Z/eSbHCNdQA5p4Ranp0ixALwhE0lHDcVCJmvzVKhu+XRCm7l+T6
	LJe7WhwlMi4dqSpm3nvbxcVuAx086Qm9r1rpO7wZjmkQ3I5gK2gT1SeenU9B9TkqHeqrQGb9PRT
	m4E9M22Fw/ME+fOzlPwM9WGwHFJYj/3g=
X-Gm-Gg: AYBFou2Wx5xMF/zm+fFxz8do5A4DMq8Txm/UhTcnxQfFG8awWoqeqltTl8XMWRyKFh/
	VD4+liuGzHqvw27Gj62hhqS5Lz5A7imZtJfZy5OWNILwPjdkC6jM/HxgUx0BxJYE2TsL5acUIty
	5PKhEKobtTZnLSd/mpb/NYiOyfeyds8JgfATLrKsQEk72v38tbSaX6BXqXUQGrKq284SHN5Y/Nn
	RUpUHm2+PHP5RCak70x31bHxsK+e4h+fnGWEw9VPsZB0OSpsVJM1ZOaLmF7Q0HDJJFdpv9r5SkJ
	xKsYqPqZfgBFU9dfdyn8lOmLmAf+h04EMPUJ1/t88qLxIPe5fsUAZh1LoJHbioxXB739ZbZOHz6
	bK0Fr2mDgxBjToawLjArkK+/3xl80ZX3ngH0v
X-Received: by 2002:a05:600c:3f18:b0:4bb:6ac0:6dc0 with SMTP id
 5b1f17b1804b1-4bb6ac06e5dmr57112905e9.29.1794792251495; Sun, 15 Nov 2026
 17:24:11 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: william <assassinshalo29@gmail.com>
Date: Sun, 15 Nov 2026 20:24:00 -0500
X-Gm-Features: AclHuK-vjL1wmMPjBQCKuN5LdAtAqjLjQE_NAzaw7x4qYE1TjyXWc0GBGd6bI1U
Message-ID: <CAFjFWEjt+DPJ_gM1uTBZ_NoV6-3mi57ArjZ_Qdah2DqY-GCD1w@mail.gmail.com>
Subject: [REGRESSION] ALSA: hda/realtek: no speaker sound on Lenovo Legion
 16IRX9H since f2293e7b2ddd (PCI SSID 17aa:3842 shared with ThinkBook X G2 IAH)
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de, evgeny@devduty.com, stable@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,
Commit f2293e7b2ddd ("ALSA: hda/realtek: Enable all four speaker amps on Lenovo
ThinkBook X G2 IAH", Cc: stable) matches the laptop by PCI SSID
17aa:3842, on the
assumption that this SSID had no quirk entry. The Lenovo Legion 16IRX9H (83DE)
has the same PCI SSID, so its internal speakers are silent on kernels that carry
this commit. Headphones work.
Hardware
Lenovo Legion 16IRX9H, product 83DE, BIOS N2CN32WW
Codec: Realtek ALC287, codec SSID 17aa:38cd, PCI SSID 17aa:3842
Amplifier: ACPI TIAS2781:00 (i2c-TIAS2781:00 on i2c_designware.2),
driver snd_hda_scodec_tas2781_i2c
Kernels
Works: 7.2.10-200.nobara.fc44, 7.1.6-1-cachyos (live ISO)
Fails: 7.3.4-201.nobara.fc44, 7.3.4-1-cachyos
The 3842 entry is absent from v7.2 and v7.3, present in v7.3.4, and still
present in v7.4-rc1 and master as of 2026-11-15 (checked via the GitHub mirror).
Analysis
snd_hda_pick_fixup() walks the table and matches PCI-SSID entries before the
codec-SSID fallback. Before the commit, 17aa:3842 had no entry, so this machine
fell through to the existing codec-SSID entry
SND_PCI_QUIRK(0x17aa, 0x38cd, "Y790 VECO DUAL", ALC287_FIXUP_TAS2781_I2C),
which works. With the commit, the 3842 entry wins and chains to
cs35l41_fixup_i2c_four(), so the codec master waits for four CS35L41 components
that do not exist on this machine.
Evidence on 7.3.4
dmesg: "ALC287: picked fixup for PCI SSID 17aa:3842"; no "bound i2c-TIAS2781:00"
line (on 7.2.10 that line is present).
/sys/kernel/debug/device_component/hdaudioC0D0: master "not bound",
four entries "(unknown) not registered".
With dyndbg, after "echo 1 > /sys/class/sound/hwC0D0/reconfig":
hdaudioC0D0: trying to bring up adev
hdaudioC0D0: Looking for component 0
hdaudioC0D0: master has incomplete components
After unbinding/binding i2c-TIAS2781:00, tas2781-hda logs "adding component"
but the master still reports incomplete components.
Workaround confirmed
Booting with snd_hda_intel.model=17aa:38cd (alias SSID, handled first by the
picker) gives:
ALC287: picked fixup for alias SSID 17aa:38cd
bound i2c-TIAS2781:00 (ops tas2781_hda_comp_ops [snd_hda_scodec_tas2781_i2c])
and the speakers work.
Possible direction
Since both laptops share the PCI SSID, the ThinkBook entry cannot be fixed by
PCI SSID alone. One option is a codec-SSID entry for this machine placed before
the 0x3842 line, e.g.
HDA_CODEC_QUIRK(0x17aa, 0x38cd, "Legion 16IRX9H / Y790 VECO DUAL",
ALC287_FIXUP_TAS2781_I2C),
I have not compiled or tested a patch, only the model= alias above. I am happy
to test patches on this hardware.
Separate observation
After the workaround, speakers still stopped after some idle time. It went away
with snd_hda_intel power_save=0 power_save_controller=N and keeping
i2c-TIAS2781:00 power/control at "on". I applied both at once, so I do not know
which is required. This looks unrelated to the regression above.

I'd really appreciate it if the issue is fixed, as I'm now having the
same problem when the laptop is turned on after being suspended for a
while, and I haven't been able to solve it.
Thanks,
William
