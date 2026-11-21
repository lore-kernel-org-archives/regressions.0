Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266841;
	b=vMUeyDPfoNTVVuSzJ0jpBSC1oUr82r2kROX3R8BBeDSshEpBcUtRrHxRxT85O3Zl0apx
	 94fNWJjMw5fr8KifhBFWVmXwMaUrO6SXe6jxJzvAT6aEVY1Gc50xAX+cImdBwduXyNgYk
	 /zRnC0K8AcyegDpg78fAcxSov2NUjJKB4bKOQpiI2METf6wGyvehCv7U9qFAzWtV56GsK
	 K4hQP2oFiAkZ4fhxGEd3t52kNIjtK6sTxeLTsVF52dUSU0Zgxe0kaS9Vw9YSZvuwPpYTs
	 5ZUMihJ2s8rOkF4LJxkdG29a4sh0YXGHkMhou20uKxq4METKxhWKZ0ST5rXZgEEBc4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3uk1V2g2BrgRRimIAVfUYX/6Cv+bp9NcizxCwFi/VHA=;
	b=iD20t8Ga0OUEDRyIr9A7UGcgW3KDRnU/Jrzzn8yVhlPnbhLrfCB2Ut9uWiHH6ctjNS9U
	 DZTaPF8yyBxo4S4ptOxcP2oGlXObq0OzH0zL5AgS4bSB5hjzol/zO4acP/DyGejUCNoEP
	 gGps/ddh/NYlfdI8Gr8WbgQJJTMjIdDAfvQJyZ9kVDqzNUcZCnNMM9XI9oRT7PSHwWYqd
	 mw9YHg8PzBwqm7V4jBo3GAPt51Kp8q+rjNfOB4Q4KabD0tAiaw2J3LSh4XJpUqw7CzgU0
	 CzaoNnfz06x2fGF2+FCgNnQlqR5Bv5Is98j7gsgOjEjMY4i0jhyTkPxaVHqOKre4ldg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p7hyPtmr;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3A2606A32A
	for <regressions@lists.linux.dev>; Sat, 21 Nov 2026 13:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A3A2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p7hyPtmr
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ee2ad94713so1278656e0c.0
        for <regressions@lists.linux.dev>; Sat, 21 Nov 2026 05:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795266840; x=1795871640; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3uk1V2g2BrgRRimIAVfUYX/6Cv+bp9NcizxCwFi/VHA=;
        b=p7hyPtmr7M3bwMQN4ikV9ZWxFzJ5VUWsJO341oubWstrgunBdvqDr2kLk6fYp3NCBY
         qxFs8su+ofPHr0Du3wUZbgdEbWPmePHa+e6bvduj1r+DyN3y5TPNqSX5nGYHV/GAkqDk
         vATMhi/teUA+CKPVwTHVyrk+I8tnuUNisxK9oRL38zEPXpIdL9M86YfzfM3JtG7VUY+S
         siDH/2jKoakyaEqZ0ngcnmK7JlEQqtshVijBSXdPbSU5jmc8U6l5u7qa/oLuTW/RCYHT
         e9FvEsiwfALvjY3HN+32BQQfYvCgSviJlD+sWMjIUpIbFuOUspmJYmKpKSfKZwRPf2Ge
         BeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266840; x=1795871640;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3uk1V2g2BrgRRimIAVfUYX/6Cv+bp9NcizxCwFi/VHA=;
        b=ZWHfINPjCK7O7n7THFEWYaQuFMjZ6IrZfgvKCJ4iq3nHbkU5uQpGrRAJvxx4kkVDu8
         M3exCF3okvUJ9B/BK6TuSdhVQcezb5Dd4gW5f2YtZxHEqrAqMHzh2IYCYwH3loGzaSOV
         EeQeOyTx/hl7fT4aZ9ti+lIj1/mpr1sZXnKSVbRDBlLLzxcgCzNyTek0h6VDSuLLB70w
         ehEO7RZvq+47TDh/Q5Y2p3ZYo8IjWtaYtLEkCY59JCCBcde8gOOL985JPz3qGvJxCkQt
         zNdec+jN3/KEJ8NrxPbMYQ8PuzOSY38vMZRu+QIa1MTbFTRf6H5Pq8mHx6mCGwaV02dz
         t6ug==
X-Forwarded-Encrypted: i=1; AL+hErEI2iPgHpOAfpZXRR3/0xe4HR2kNGw+UxflGXbZs8Xu4hfDmuufGKm8HPvyNMI8HFkWfkvTobv93qkUwQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9IXYOjlBophuSPZZyZm2aPBVnIqTUA1C8QwzorI6DZ1Ru9J9tU
	OAjKfgiNsBWikhtPMBVMSE1FehxsYVqOBGMfR4Y9+87xzLwG/8UUBkKF
X-Gm-Gg: AZFdTZdirIgSGhwLDYG8sDuwReMeqyeTYLD0EuNtXX5R+wsMFwFt2mjo6vw5ysXaT3q
	sLkMWgGpMQ17hLOBMdX+sSB6PlQsZbUh/jJAFNR8DS2xEGstr18lbMbC5gayT5HfjJTBkSOQhC/
	ElSMHBGPwVNCFrIkAPDU6oINViZGm4UTfIlOzaCkmTWee8zS/hMNNLstsQEYNT8rOM1tY5RdY60
	/fw3V4Pcld6dQrlGPj9e7U0tfY/32w3CTsKCCxY4ZEMIZEUAcSNq80kONdsUWVRMyHy7r0BH9j0
	sdLqLC83hurLgd6OskCwDmLUNaABmpvPZsslO3nRD+0m80NZTqo2YKI0Lby6scKyQBNZXTXDuNx
	DgW7O4AzxojlyCu7iFppC28D8O7VL9tbXClAjWqYmQuW9JR9VZMyrzthFM3ma5h/DmlA6NK0uUr
	7Kgcho+PzkOdverrbhsPuvh+7zkKDH/hNjKrImupAFNCb7fsmD0SNKs7DjF+QwsXrZiphFBMRK9
	RyDFUA49XmXYSBNs2B0RWYwFoCjBoVFOSMqJHIx4CJXY2hbSaC8W7J3E8oc7TbP7LnE6Ehu39YW
	6s005oCK3qkZmTf8ZTRp2yausuSWDkDq3n1b+ImEwnKaOpA=
X-Received: by 2002:a05:6122:4201:b0:5ee:a81:e77 with SMTP id 71dfb90a1353d-5ee8af0e023mr2950746e0c.6.1795266840149;
        Sat, 21 Nov 2026 05:14:00 -0800 (PST)
Received: from localhost ([2804:14d:5cd5:542e::1a7f])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6dfc0b22sm5702260241.6.2026.11.21.05.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:13:59 -0800 (PST)
From: "R. V. Lobato" <vieira.lobato@gmail.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, regressions@lists.linux.dev
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, Ilia Mirkin <imirkin@alum.mit.edu>, stable@vger.kernel.org, Sasha Levin <sashal@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [REGRESSION] nouveau: GM108 hangs at boot since "drm/nouveau/devinit/gf100-: try to avoid double-running vbios scripts" (6.18.64)
Date: Sat, 21 Nov 2026 10:13:50 -0300
Message-ID: <20261121101350.bab69dff11a2@gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

The 6.18.64 backport 15465d681517 ("drm/nouveau/devinit/gf100-: try
to avoid double-running vbios scripts", upstream 2139cb633d48, review
patch 426/686 <20261113153835.372076643@linuxfoundation.org>) breaks
nouveau on my GM108 laptop GPU. The machine hangs during boot.
6.18.63 works. Reverting only the gf100.c hunk of this commit on top
of 6.18.64 fixes it.

Hardware: HP Spectre x360 15-bl0XX, BIOS F.04, Intel HD 620 (i915,
drives the panel) + NVIDIA GM108M [GeForce 940MX] [10de:134d], no
display engine, runtime PM enabled.

On 6.18.64 the VRAM size is garbage and the boot stops shortly after:

  nouveau 0000:01:00.0: NVIDIA GM108 (1180d0a2)
  nouveau 0000:01:00.0: bios: version 82.08.62.00.15
  nouveau 0000:01:00.0: fb: -1159778304 MiB GDDR5
  nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 6013d4 [ PRIVRING ]
  nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10f65c [ PRIVRING ]
  nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 17e280 [ PRIVRING ]
  (no "drm: VRAM", no "Initialized nouveau"; the system hangs)

On 6.18.63 the same machine prints "fb: 2048 MiB GDDR5" and nouveau
initializes normally.

My reading of the cause: the new code in gf100_devinit_preinit() runs
the VGA CRTC check only when

  !(nvkm_devinit_disable(base) & (1ULL << NVKM_ENGINE_DISP))

The guard expects nvkm_devinit_disable() to return a mask of disabled
engines. In 6.18.64 it calls the void ->disable() hook, which disables
subdevs with nvkm_subdev_disable(), and then always returns 0. So the
guard is always true, also on boards without a display engine. On
GM108 the VGA CRTC reads hit the PRIVRING fault at 0x6013d4 and, I
infer, return a nonzero value (I did not log it), so post is set to
false, the VBIOS init scripts never run, and the memory controller is
left uninitialized.

nouveau.config=NvForcePost=1 lets the machine boot, but only fixes the
first init, because force_post is cleared after the first preinit.
On every runtime resume of the GPU the check skips devinit again:

  [   35.770421] nouveau 0000:01:00.0: Enabling HDA controller
  [   35.805652] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at 0000000000120000 engine 05 [BAR2] client 08 [HUB/HOST_CPU_NB] reason 02 [PTE] on channel -1 [007fd38000 unknown]
  [   35.806084] nouveau 0000:01:00.0: fifo: SCHED_ERROR 20 []
  ...
  [   75.453651] WARNING: CPU: 0 PID: 1081 at nvkm_runl_cgrp_get_cgid+0x79/0x110 [nouveau]

Counts per boot:

  kernel                        runtime resumes  fifo faults  SCHED_ERROR  WARNINGs
  6.18.63 (two boots)           25 / 30          0            0            0
  6.18.64 + NvForcePost=1       2                31           103381       39
  6.18.64 + gf100.c hunk revert 3                0            0            0

The revert I use (restores 6.18.63's gf100.c exactly):

--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
@@ -27,7 +27,6 @@
 #include <subdev/bios/init.h>
 #include <subdev/bios/pll.h>
 #include <subdev/clk/pll.h>
-#include <subdev/vga.h>
 
 int
 gf100_devinit_pll_set(struct nvkm_devinit *init, u32 type, u32 freq)
@@ -100,25 +99,6 @@
 	 * can use it as a reliable way to know whether we should run devinit.
 	 */
 	base->post = ((nvkm_rd32(device, 0x2240c) & BIT(1)) == 0);
-
-	/*
-	 * However some VBIOS init sequences miss this bit. So fall back to
-	 * the nv50 method of checking if the bit is not set. Running the
-	 * VBIOS multiple times may have detrimental effects.
-	 */
-	if (base->post) {
-		u64 disable = nvkm_devinit_disable(base);
-		/* magic to detect whether or not x86 vbios code has
-		 * executed the devinit scripts to initialise the
-		 * board. only works if there's a display engine.
-		 */
-		if (!(disable & (1ULL << NVKM_ENGINE_DISP))) {
-			if (nvkm_rdvgac(device, 0, 0x00) ||
-			    nvkm_rdvgac(device, 0, 0x1a)) {
-				base->post = false;
-			}
-		}
-	}
 }
 
 static const struct nvkm_devinit_func

A proper fix probably needs the guard to test whether the display
engine actually exists (for example nvkm_device_engine(device,
NVKM_ENGINE_DISP, 0) after ->disable() has run) instead of the return
value of nvkm_devinit_disable(). I have not tested that. I have only
tested 6.18.y; I can test patches on this machine.

#regzbot introduced: v6.18.63..v6.18.64

Thanks,
R. V. Lobato
