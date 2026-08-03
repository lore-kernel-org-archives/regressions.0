Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2694541D212
	for <regressions@lists.linux.dev>; Mon,  3 Aug 2026 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765311; cv=pass; b=h5HWze2lxmta73uVL9Kmo/Oky0mwitynU7d8oSZWUDbNTOkdbT2m2N2JFl3oKS7AHXBfbuYWHPNC6scTf5O5aMtvj4lkSHywsnuCosyzrno7VHRWWaxPpxrUjX1Qk8ha7cYh4TCTWdTBOlfPDSKNjYyfq/jQWCulwBxRSgDjrGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765311; c=relaxed/simple;
	bh=01VxCD9EHLva6kKIN8vbUyWSOxJtZeSP3AI/Q4UBcq4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=KkSDpIYt9sKO6Eszb7t1ReghSleoNrDqIMRFDSw8P/fVvpReX/AN4aWowtYYs9KO88MEheBJpwsyqos0s0qPgrCoXrfn2VnJ3w7Qbgs8vXJn17qMr8LEOCB5MeDK+crxWy6wD/vvjgELfkDARaTlckIF9mihVFhjuxC7qScSa+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gb3s6Np9; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gb3s6Np9"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-80c5cb9a888so35891157b3.3
        for <regressions@lists.linux.dev>; Mon, 03 Aug 2026 06:55:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785765309; cv=none;
        d=google.com; s=arc-20260327;
        b=MPg8Edeg8nw2RUup9zMz4tCXyvR5+CRlW3q+bWvOfS0Ed4fwbP3exEw7IhKGUeU1wc
         uy4IplOF3rlRpNMlitd+c3Hjc7FqnQUUz1ryDwp4a0kU6jjzFT0MAEo2zwvyqdTwuOSx
         oquEheNeJ5oQhCr2XMvw3QK2D1lWtdhYA7gVGH2H2TRb586C2xE5oq3f6CXs9175958S
         6tRmCwNkvMH5oTY6y6qY56PA9t76s/qVuAtDFIFft/KJ8o5JqzxN2X4sqehBVP0Hptzd
         gyxPE9eMBIt9igP+f7/aLMZgRYZv0+6+shbJnnte53I6GYv/OzYkVcSLm7E/Jlpx8huB
         8S2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=wbzWIdW8fZsXyI10pvq5o3wafEmAdRRb1ceQnwGi3BM=;
        fh=8K0CHhKzRCqQzhPrJCq2xVSaaSDCy0VX2mZl7040pBM=;
        b=A+OweQFmSCDstoklhw0yDdgAikvyvaTZZkoFB5z5NTn0BV5RdYi0f+aB0+KrHx/vnn
         WXyID5YFUCvj34FkopkjYhOl9h9nSy38DX+hepNPtB/t15XPqNfJCGnNw/8VFlDJ0RUG
         ctNZaTHMmmgXSTLKr76CmtvNTQrtUPSyxSThLCO8mJHuKXHI9r1Qp7h3eIsqQJh9vPb/
         mQ6FKdF0H0x176mQy45iXcVpSyzpnBdbvWEs8EWuD8e40Kly5z/ERWArXAPeGN1bOa3T
         yPOJpra16Nm1fBaqQpfA6VHN/U6E5+4Hf2FbzeJ177mjsq2BJHkF04O4Nh7QawnDq0z6
         ihVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785765309; x=1786370109; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wbzWIdW8fZsXyI10pvq5o3wafEmAdRRb1ceQnwGi3BM=;
        b=gb3s6Np9M+/kV/GsQU4IvGN7ohHTJlDyVL5haZmMpHA7cbSLoJNO1OCOF11jw/HOFF
         G8kfEsL6LJLUmFDmTb2BsHR5N6NG6BnoS2Zv973et1hJVuFSUmxqYHmSpZreWGMfUsb6
         Qg4061NrtSW1OPbsPAyT6LHBRHqgTE5eK4PL9L7IYauZIR9kEHyAgvALzj2ls8NNSc62
         Sg7nqafgpA3vfkaPZ1K/E1TbpAlswRmKngrqv/s+XkCMw+WflzMmPCZ29WMN7pfKYKMD
         JIu++s9mbz7seSgI1Xq7prIH7V7fmhQcsYyoOyl5WyaGYn7MdubPlEwEzM2o6hV/jaDD
         GJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785765309; x=1786370109;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wbzWIdW8fZsXyI10pvq5o3wafEmAdRRb1ceQnwGi3BM=;
        b=AOgLhGiGmaDLk9E128TXE5aqV+eLjk8IoJcgFfTGqN/eZDeju6vRuPhmangRzeorpX
         A5gUR+SNLOLDWvHL6C4gugQjFKMag3L/B/IT3JldBW/bqLPKJnVEhukVWaQ5ag8oz+2F
         96YxZoLhCYhCLsA2xyaE5Ot6/VBNu75oAMkH+WRJTWnmfPyMsku4gHGimr/Z2swYH9lg
         dVBSQXaBIDtSIOWlVF2fr6+/pjreMuv8C0zf/CYGmNti688H7w4qrGivG4ClPeUBqsJI
         kb0OcipqFVHZOWsQ6tOTsl9RQfuMVPVSZRF24phIkjirBA3u1AW06WhmSNUY2A0kP6MS
         ujQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQ7GCjxy7eqzh4TZzGhc9NyB572gsjGm5ydkn9mIUjNlQEKj21dXuD7V92cUs0kQsozBViZ1B3+H958A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQr97WrtarAaQ47F6ktcaGB6dVEj9q8JltAeJXRpj11k2QDeub
	AAFfRyFwYqLBh2/FdrP+MmgNhb2Fg4VCFxAle/ma4J46TRo3jvJL957u+JjZ+Pjwc9IcKBdo6yF
	8aKXlwYBgMCH2jsYv1kEwZSmvB96er+E=
X-Gm-Gg: AR+sD11lQcKSKHHGxBTR1HAZzlM8a+K/tHI2gMBFMR4/Torr51+ZTsFNGFfmbZo6Z3n
	VuYcDLfMtg2vjgldr4Ixki0eYu0/fhzCrAtNto++GC6rcGfBkenqEiRa/3NO4NlYV9F9wZgyEzL
	C0I3OZbNJbLul7ZA5jOnGAF7spV0V8unFAKGHAoEc+oFP9nL65CwdXvH4GKFARtlDY82nOy5x4B
	LTsx3AY8iJ6zJUDADFtU6CGjVkDwrLAvH88ctJWNqYEeWAohqwuilvKCyNCsyJFv0/Y50YgiPAe
	Fm0xLoO0IaRmXuBqC2WQMKj9eMHzhhDE96ND32qt0O//tdOuI+KCl9rOfTOz4yCdAJPc59zrlzU
	hjUR1
X-Received: by 2002:a05:690c:350a:b0:81e:8d95:3d32 with SMTP id
 00721157ae682-81fd49fec5dmr135575237b3.9.1785765308900; Mon, 03 Aug 2026
 06:55:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Slavik Dev <developer.slavik@gmail.com>
Date: Mon, 3 Aug 2026 16:54:58 +0300
X-Gm-Features: AUfX_mzPBSiPlF2WjoylmVIVyaUnX72awZOGWW6Btd5FopJJedrIcGHH8ISoEfM
Message-ID: <CAGQo=TJXef-QzbkFEpTcJ138j0k6WYnV4=tNY8Q7s3U7DUOY+Q@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] usb: hub: total system freeze after
 running adb
To: forestix@kcat.cc
Cc: mathias.nyman@linux.intel.com, gregkh@linuxfoundation.org, 
	stern@rowland.harvard.edu, heikki.krogerus@linux.intel.com, 
	stefan.eichenberger@toradex.com, pawell@cadence.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm hitting what appears to be the same regression, on the same xHCI
hardware as the original report. I spent months chasing this as a
hardware problem (RAM, PSU, BIOS) before the adb correlation
eventually led me to this thread. Earlier today I applied the
workaround discussed here (disabling USB runtime PM), and so far it
is holding up. Sharing my data in case it helps revive the
investigation -- until the workaround, this reproduced reliably for
me, up to several freezes per evening.

Hardware:
- AMD Ryzen 7 7700 (Raphael, display on iGPU), ASUS TUF GAMING B650-E
  WIFI, BIOS 3881 (AGESA 1.3.0.1b)
- The affected controller from the original report is present:
  0b:00.0 USB controller [1022:15b8] (AMD Raphael USB 2.0 xHCI)

Kernels (Linux Mint 22.3 / Ubuntu HWE builds):
- Freezes observed on 6.17.0-14/-19-generic and 6.14.0-37-generic
  (based on 6.14.11 + stable backports, built 2025-11-20).
- First freeze on 2026-03-10, shortly after kernel package updates;
  16 freezes total through 2026-08-03.

Correlation with adb:
- The last 4 freezes occurred 5, 12, 35 and 81 minutes after the adb
  server was started (using the once-per-boot "adb uses wireless
  extensions" kernel warning as the start marker in the journal).
- Earlier freezes also occurred with an Android phone plugged in while
  the adb server was NOT running -- including one freeze 2 seconds
  after unplugging the phone. Consistent with hub runtime
  suspend/resume transitions being the trigger rather than adb itself.

Freeze signature:
- Journal stops mid-second, no oops/panic, no MCE/WHEA, efi-pstore
  empty. nmi_watchdog=1 and hardlockup_panic=1 never fire.
- Notably: the chipset watchdog (sp5100_tco + systemd
  RuntimeWatchdogSec=30) DOES fire and resets the machine ~30 s after
  the hang, so the platform stays alive -- it is the kernel/CPUs that
  stop responding.

Ruled out on this machine:
- RAM: freezes identically with DDR5 at EXPO 6000, EXPO 5600 and
  JEDEC stock 4800.
- Pure load: 60 minutes of stress-ng (16 CPU workers + 16 GB VM
  workers, no adb running) survives without issues.
- Firmware: BIOS update 3223 -> 3881 (AGESA 1.3.0.1b) made no
  difference.

Side observation: in freezing sessions, Bluetooth (MT7922 on the same
bus as most devices) repeatedly logs "hci0: ACL packet for unknown
connection handle" before the freeze.

Workaround status:
- Running with runtime PM disabled for all USB devices
  (power/control=on via udev rule) since 2026-08-03. Reporting while
  it's fresh: the adb server has since been running continuously,
  already well past my longest previously observed time-to-freeze
  (81 min), and so far so good.
