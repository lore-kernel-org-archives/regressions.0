Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.58.8.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145011;
	b=ruoPxAmeg7iAy2pE4UsN2WRjv1wkW1ZPPbiA/voU1hO+tJyI6OY9DdnVykmtePU9398G
	 qw7z/t/vnxQ90XaMX3qMyxbKutSvo/EvI2mgYcQJHguOQw54EF8sHNgJhNSaCHdmfukL1
	 u0cj7qT4VjzPIZ+vMqHMNx+kgRUgBliJ2nHC5+Sjl7s7ME9EAmh2wKPAvz3eoRaVMUATo
	 oJF7zE/nk6dDPp06avATFbqMIXkNaQ/kECwYkqO2gyQ5OV66Nefbr5QB/iHnDqtzeZFKv
	 9jHuTyt56JrfJ0GJc5KpArY5HsDD8udH95zK6COyHhR9WGquboHGgTe1pc2fM5p+Mjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145011;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ksfeohUu2MOYYJCfG6rnR7jwX7L3AOvI7nh2YtUJ5tw=;
	b=FlpJJ+3tdl2O2q4OoF1emWyYjkWQEzbUmCeVkf/JUIODDNqfmZbGJhnjCq8Odgcd/+FE
	 xY4TCzJWZckOfC6BpmvH7MuYhqVkhglXnMh9+UsHxlLvk0FbL/CSEelG8xZZ6Ta9OaoLe
	 +aoocT0GSxRx3PSOx4u05n9kxW4yHUadPEdM8/+LU4YoU1UU3UmK1xUT55mlcOf7rO9Sx
	 kNlGjJ/jkfZtRGYf21nSApbDlOZ2l12pFQ4a4bhxFjtnZbPX2OCLWLW5o/Z2inkqBR651
	 2KcwGc0tsrsuNFvRNqECgRfwKxgqQB0VeFfS6HGpC5YpAexBASEwJjkJtMy4RtoiTpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wagner-flo.de;
	spf=pass smtp.mailfrom=wagner-flo.de;
	dkim=pass header.d=wagner-flo.de header.i=@wagner-flo.de header.a=rsa-sha256 header.s=fuldigor header.b=jLbol+X8;
	arc=none smtp.remote-ip=89.58.8.210
Received: from fuldigor.wagner-flo.de (fuldigor.wagner-flo.de [89.58.8.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80A2606A31C
	for <regressions@lists.linux.dev>; Sun,  8 Nov 2026 13:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E80A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wagner-flo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wagner-flo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=wagner-flo.de header.i=@wagner-flo.de header.a=rsa-sha256 header.s=fuldigor header.b=jLbol+X8
Received: from teclador (p4fe8fa45.dip0.t-ipconnect.de [79.232.250.69])
	by fuldigor.wagner-flo.de (Postfix) with ESMTPSA id 18E401EC71;
	Sun, 08 Nov 2026 14:36:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=wagner-flo.de;
	s=fuldigor; t=1794145002;
	bh=cj56BryqCAaDQKgw9207kfTg1TbElKjmb1l6QWsloKc=;
	h=Date:From:To:Cc:Subject;
	b=jLbol+X8vCXSJ2EJ+GmuF2GI6LhU+cZEnobAw0gz2/sBvI56oQ/Y/EAJQtvKtAS7Q
	 xJ+o014/q2dYMWace55zO8CN1tocQb7hqhXc+v+lFozb+u25b895p5d+EBLGyXNxX4
	 B2FBbfOQDNTw5nmSwV2t2lQm/Qiwj/6vPsmBDsGE=
Date: Sun, 8 Nov 2026 14:36:40 +0100
From: Florian Wagner <florian@wagner-flo.de>
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, linux-acpi@vger.kernel.org,
 rafael@kernel.org, sashal@kernel.org
Subject: [REGRESSION 6.18.y] ACPI: button: lid events lost since 6.18.57,
 please backport a004b8f0d3bc
Message-ID: <20261108143640.6252e6a8@teclador>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-unknown-linux-gnu)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hey there,

Claude did most of the work on this one, but it looks valid from the
point of view of my (very little) kernel dev experience.

Please backport the following upstream commit to 6.18.y:

  a004b8f0d3bc ("ACPI: button: Enable wakeup GPEs for ACPI buttons at
  probe time")

It fixes a regression that 6.18.y picked up in 6.18.57 and that is
still present in 6.18.62.

Background: 6.18.57 received 52d864019636 ("ACPI: button: Convert the
driver to a platform one") as a dependency of fe80251152fe ("ACPI:
button: Fix ACPI GPE handler leak during removal"), together with
57c31e6d620f ("ACPI: scan: Use acpi_setup_gpe_for_wake() for
buttons"), which fixes the former. Since 57c31e6d620f, button wakeup
GPEs that have handler methods are no longer enabled at runtime.
Upstream fixed this in v7.1 with a004b8f0d3bc, but that commit is
tagged "Cc: stable # 7.0+", so it was never picked up for 6.18.y,
even though 6.18.y now carries the commit it fixes.

Symptoms on my laptop (FUJITSU LIFEBOOK U9311, BIOS 2.54) with the Void
Linux kernel packages:

- 6.18.52: lid works, acpid receives "button/lid LID close/open".
- 6.18.62: the "Lid Switch" input device (PNP0C0D:00) emits no SW_LID
  events at all (evtest shows nothing), so closing the lid does not
  suspend the machine. /proc/acpi/button/lid/LID/state still toggles
  correctly, and closing the lid wakes the machine from a manually
  triggered suspend, which suggests the GPE is only armed for wakeup.
- On 6.18.62, GPE 0x24 shows "disabled" in
  /sys/firmware/acpi/interrupts/ while it is "enabled" on 6.18.52.
  Writing "enable" to it restores lid events.

Backport note: a004b8f0d3bc applies to 6.18.60 and 6.18.62 with
offsets, but does not build as is, because struct acpi_button has no
"dev" member in 6.18.y. Using &button->pdev->dev in the two dev_dbg()
calls is sufficient. With that change, drivers/acpi/button.o and
drivers/acpi/acpica/evxfgpe.o build cleanly with W=1 on 6.18.62. The
adjusted patch is attached for reference.

I sadly haven't had the time to build a patched kernel to actually test
this.

Thanks,
Florian Wagner

#regzbot introduced: v6.18.52..v6.18.60
