Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D9221255A
	for <regressions@lists.linux.dev>; Sun, 15 Mar 2026 11:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773575711; cv=none; b=JOS9xUUGL/T1wprBSeFodIa30nwFCW8FWfzMLzFLZobYPyDxGVEQek+N0iw8WG8ooFqXmUF1ro4vrKpXvuJbhdIHkpQFIsOlQ+J/qO8MUG9ujUSjGVrVOvAb9rXwSM23XLAEacFRTEuvNeGL4uIECR2tTWE40H+VfHdBoTdB/Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773575711; c=relaxed/simple;
	bh=bcZKlzzXwwY0EJtmDoUOqgBEwQ5NCQTilsLXeIa/wss=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=e50JtZ8M7BZHqyWnPxidqt8gdFC4EdD9jnQEcIGWK5dGGUUVv6AmkqpNHraVof1uSGucmVDf0oRtKpqEK1IU+S3URubpst/wIwQ/p+hCR0OGl1y4WRhYBEP2ApMix5P9wtF+ZSuNHd4x9CejJVmb00mr97yp505FaAfk1Zf+Wyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6ZqkHLw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6ZqkHLw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so43323805e9.1
        for <regressions@lists.linux.dev>; Sun, 15 Mar 2026 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773575708; x=1774180508; darn=lists.linux.dev;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDKnJT0wYCQGOysz22h2bC3jeqtbf0HHcGTBrmEn6hA=;
        b=J6ZqkHLwflfWCrBQC/Sw6LI1Vu7YwnoJXieXkEva42V5uX/tNqdGNHx321AD9bqjZK
         uqPYCIVD6cyxW7MWrC/CyzE/reMG5U0q//BUWx4xKLjBVooSL8mmbZcTqQAJzdWJ3WFY
         bzlXO+bi99bf35qpYtSkyTDR5BNS8dJfywJ5jKXIibLAaCkhB+grWhfdcawZuJZG/nO5
         Gauaz+M2ujhYD3ITqpYJyn0TVn5wpPaDTKu3oXg071r4W9Fo/5KfH5BOq3ETB9Rm0scu
         XXWtoOEuBd2cPdljC4KQksjYqIDhO1qVzAXyVBGPLRnhYc17Xdx9h6gsK2CF28VlMLIa
         JHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773575708; x=1774180508;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vDKnJT0wYCQGOysz22h2bC3jeqtbf0HHcGTBrmEn6hA=;
        b=kvDGGd6Q3IMVBE5tN/y1bzZLSzf15PePu5AHQA+w5Wcm9fOXvAZbWyTWNhn4LrWQjp
         8KUNG94or23fxRjta9O0Tj/Q4YYaAo0g79Ir5rj44rAiLpyDekvFuwKwXH189hHfTEoQ
         zUL+F6gj/FMaDBmnWCC0xlqOKSj73ha1bzmaRgIAQX0GAaN4K/4/hxdenMlFXqD9Hcij
         N1zPSUaiBKP89r7bbve5x1z1C4J2zTjzDDGCXuxv2zzTaukzLxKzzZ7et7lubQ+KSq19
         d2nTWCJjsusVBsgUg5m/XVVjDeoloJYgkfrw82ag3LghTgXVhbZY6ItB5DcdcpiI1eJG
         E/cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaAw5H17wluzo/zD7DNOpyTcBOpS/oxtnr1aMi1Kk0dgObbBOcYPjwpYRj+/pTTo70PmrqH611jB/HsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ0L+RFc55wjc5Ut5u7c81fX7pT3Myli0PdaDzeqCi0tSWgr2i
	aW30281SLYY2ojQcjRnN4O9okwqpZ+BAe0V0hdvy8HCouinelxn8phIU
X-Gm-Gg: ATEYQzyx0UZ13DjEgRobEdaabLMC9A8a8ctzULF1GdezMxJqTWqvEB0xEbcUFqtZYLF
	/9jukVzZAu9B0kX1RHXKQQZeh+0pA2FQkalQNDawEdO7/rbw2xG8HD6gIVvblQjqGDyUsF39Ijj
	H6dg1TMuUrxNt8ksiYqRGn1wWf/M54HFyLSmk2yIqLH1Sm8LyQSTNZDmfPFYuCYxxveWrkQmUNR
	MGvRbSN2NjweV3kACVqTKy/1IGf4lGAlr1JrQpfH6C2pnyhvsMp3Sm0UvUS38qwn7hXCG+cGTyR
	ITZHBjhZ449DiZ/Mf3uLGE3drdb+RjAnV8MW/GHS8ds745Kq3Cr+KZmIcdqs/c4yrWr9yzArsWw
	HyglkD3zbSNmBFFI0GnRexwmvDy5VURj+DDF412gaL2XCqAD5AV8aXioCO87SCDMytl29TfSCK/
	AaYX6MYwAzMWpqxyTzesQnOezexT+hAzdhsoJtJ/DEE0y79uynhfNU10NV4bUeNBkgQHHERFX8s
	nR/9aebWQnn1FlavkfOEhJfAl2UNSFWx6LpT21j8M+x53BcBP3oZn5o
X-Received: by 2002:a05:600c:1388:b0:485:3a03:cee1 with SMTP id 5b1f17b1804b1-48556711f7fmr153392075e9.33.1773575708365;
        Sun, 15 Mar 2026 04:55:08 -0700 (PDT)
Received: from smtpclient.apple (dynamic-2a00-1028-83a2-5386-5c13-9ccd-a54b-eed2.ipv6.o2.cz. [2a00:1028:83a2:5386:5c13:9ccd:a54b:eed2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b6756e4sm401505845e9.15.2026.03.15.04.55.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Mar 2026 04:55:08 -0700 (PDT)
From: =?utf-8?Q?Michal_Babi=C4=8Dka?= <michal.babka@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.21\))
Subject: [BUG] Apple Mac mini 2018 + Thunderbolt 3 eGPU: PCI bridge window /
 BAR allocation failure prevents NVIDIA and AMD GPUs from initializing 
Message-Id: <FCEB17D3-3DC5-49C8-8C56-8051C875E2F9@gmail.com>
Date: Sun, 15 Mar 2026 12:54:56 +0100
Cc: linux-usb@vger.kernel.org,
 linux-acpi@vger.kernel.org,
 regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
To: linux-pci@vger.kernel.org
X-Mailer: Apple Mail (2.3864.400.21)

Subject: Apple Mac mini 2018 + Thunderbolt 3 eGPU: PCI bridge window / =
BAR allocation failure prevents NVIDIA and AMD GPUs from initializing

Hardware / platform:
- Host: Apple Mac mini 2018
- Connection: Thunderbolt 3
- eGPU enclosure: Razer Core X Chroma
- Tested GPUs:
  - NVIDIA Quadro P400
  - NVIDIA Quadro P4000
  - AMD Radeon Vega 64

Linux distributions / kernels tested:
- Ubuntu-based systems
- Zorin OS 18 Pro
- Multiple kernels tested, including 6.12.x and 6.17.x

Problem summary:
On Apple Mac mini 2018, an external GPU connected through Thunderbolt 3 =
in a Razer Core X Chroma enclosure is detected and enumerates on the PCI =
bus, but GPU initialization fails because PCI bridge windows / BAR =
resources are not assigned correctly.

This is reproducible across different Linux installations and with GPUs =
from different vendors, which strongly suggests a =
platform/topology-level PCIe resource allocation problem rather than a =
bug in one specific GPU driver.

Observed behavior:
- The Thunderbolt enclosure is detected correctly.
- boltctl shows the enclosure as connected / authorized.
- The GPU appears in lspci.
- The kernel loads the vendor driver module.
- GPU initialization then fails.

For NVIDIA, nvidia-smi reports:
  "NVIDIA-SMI has failed because it couldn't communicate with the NVIDIA =
driver."

Relevant NVIDIA kernel messages include:
- "BAR 1 [mem size 0x10000000 64bit pref]: can't assign; no space"
- "BAR 3 [mem size 0x02000000 64bit pref]: can't assign; no space"
- "This PCI I/O region assigned to your NVIDIA device is invalid"
- "BAR1 is 0M @ 0x0"
- "RmInitAdapter failed"
- in some attempts also:
  "fallen off the bus and is not responding to commands"

With NVIDIA Quadro P4000, the same general failure pattern was observed:
- the GPU is detected on the PCI bus,
- the NVIDIA kernel module loads,
- initialization fails,
- and the logs again point to invalid / missing BAR assignments and =
resource allocation problems behind the Thunderbolt PCIe bridge =
hierarchy.

For nouveau, the failure is visible as BAR/resource allocation failure =
as well, for example:
- "bar: one-time init failed, -12"
- "init failed with -12"
- "Device allocation failed: -12"

With AMD Radeon Vega 64 installed in the same enclosure on the same =
host, the same fundamental problem occurs:
- the enclosure is detected,
- the GPU enumerates,
- initialization fails,
- and the overall behavior indicates the same lower-level PCI resource / =
bridge window allocation issue.

This strongly suggests the issue is not NVIDIA-specific.

Thunderbolt state:
boltctl reports the Razer Core X Chroma enclosure as =
connected/authorized correctly, for example:
- type: peripheral
- generation: Thunderbolt 3
- status: authorized
- rx speed: 40 Gb/s
- tx speed: 40 Gb/s

Important conclusion:
Thunderbolt authorization itself appears to work.
PCI enumeration also works.
The failure happens later, at PCI resource assignment / bridge window =
sizing / BAR allocation time.

Key dmesg patterns observed:
- multiple "can't assign; no space" messages for PCI bridges and BARs
- BAR1 / BAR3 of the GPU not assigned
- bridge windows under the Thunderbolt hierarchy not large enough
- reassignment attempts that still leave required windows unassigned or =
invalid
- vendor driver subsequently failing device initialization

Examples of affected topology in logs:
- 0000:00:01.1
- 0000:05:00.0
- 0000:06:01.0
- 0000:0b:00.0
- in other boots, the same problem may appear under a different BDF =
address after Thunderbolt re-enumeration

Representative log excerpts:
- pci 0000:0b:00.0: BAR 1 [mem size 0x10000000 64bit pref]: can't =
assign; no space
- pci 0000:0b:00.0: BAR 3 [mem size 0x02000000 64bit pref]: can't =
assign; no space
- pci 0000:06:01.0: bridge window [mem size 0x10000000]: can't assign; =
no space
- pci 0000:05:00.0: bridge window [mem size 0x20200000]: can't assign; =
no space
- NVRM: BAR1 is 0M @ 0x0
- NVRM: RmInitAdapter failed
- NVRM: The NVIDIA GPU ... has fallen off the bus and is not responding =
to commands
- nouveau ... Device allocation failed: -12

Kernel command line options already tested:
The following boot parameters were tested in various combinations:
- pci=3Drealloc=3Don
- pci=3Dhpbussize=3D0x33,hpmemsize=3D256M,hpiosize=3D2M
- pcie_aspm=3Doff
- pci=3Dnommconf
- pci=3Dnoaer

These mitigations did not resolve the issue.

Why this looks platform/topology specific:
- The same Thunderbolt eGPU enclosure is recognized correctly.
- The same failure pattern appears with NVIDIA Quadro P400, NVIDIA =
Quadro P4000, and AMD Radeon Vega 64.
- The common denominator is Apple Mac mini 2018 + Thunderbolt PCIe =
topology under Linux.
- The failure mode is centered around PCI bridge window sizing / BAR =
placement, not around one vendor-specific driver alone.

Expected behavior:
The Thunderbolt eGPU should receive valid PCI bridge windows and valid =
BAR assignments so that the GPU driver can initialize the device =
successfully.

Actual behavior:
The GPU is visible on the bus, but bridge windows and BAR resources are =
not fully assigned, which leaves the device unusable and prevents the =
driver from completing initialization.

Request:
Please investigate PCI resource allocation / bridge window sizing for =
Thunderbolt eGPU topologies on Apple Mac mini 2018 under Linux, =
especially where large GPU BARs must be assigned behind multiple =
Thunderbolt / PCIe bridges.

Cross-vendor reproducibility on the same enclosure and same host =
strongly suggests that the root cause is in PCIe/Thunderbolt resource =
allocation on this platform rather than in a specific NVIDIA or AMD =
driver.=
