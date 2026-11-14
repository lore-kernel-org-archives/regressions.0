Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794639422;
	b=XBxMEJjQK7+9p6SB2en/lnZH9H817OakzUCAv2j169sP8rzRiPd5NNcGO/rCSicsQQek
	 Vz5iMlrRIZkngWHynHDh57eSwfPQuIB5RN9ncyegzEMrOUkE9OyONJowGv6K6yJbsZ3aA
	 6z8d9AFFYaPGprXkDTFGCw5JkHIE9bYjm1XwoyPAUw10u6TB0vuo13wRZmaQf+hmW6IJu
	 aWNqeuTTxijCB8PPX8I0rD4f4kRtpnQDvsj6L7ZyAv+W+h7X8AA9VNyuQ1om4dN5hC4UO
	 YrG/VdVMcdGkrHRhLalL1kxa9t41qBTDIYduhaQVdSqkmrxV6YvchXiijaod5Ed6xiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794639422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=svEXNKANMptFL+nn+FJmTq7DF0aaAVsVt5sHrxZKFpg=;
	b=FDFIkTyC3ZuNieeCBjxWaqmxG4A407280HW9DU34YgJibjE378DZcQhQZAscoYhSY5kW
	 YwgHBx+79fqxTOXaktlfbW0bQzF138XHt85qMb364mIXD+qdJ3Hl9jifgY9WORyp56U8b
	 U9qklK5wI9rTglvUntd/0tY1tqhRclNxAs6W4OBsCpvzKQbBEMh8y34Ufr8AOkkFe9quF
	 gHWqejbHM2u5O1EI4xKxZhdffxDtIFe6ilJxuv65FkZnsnG+T5i639ToGEVD+qXIQ+oWL
	 JTi5+yGqKWyGpM2owZOcEk4SbJjMcPGDsvZVxom32CaF2KO6s9ATTL3DP5hLafDo4CQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UYdiydcY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64008606A327
	for <regressions@lists.linux.dev>; Sat, 14 Nov 2026 06:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64008606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UYdiydcY
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9495e8ae23aso99140985a.2
        for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 22:57:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794639421; cv=none;
        d=google.com; s=arc-20260327;
        b=IOGG2mOrxT1yFf3/tuveRPnvm7riqMvvXq5c80+LOe4txookQ+kQohUAo1GE57gMIo
         XICKMWFdTI6LWAoqh36+Rs7/Q3FZxSFjMW3oBLOCD8xAt7an0WX6zaYxZXD+XYOYgcHr
         +c03AYUr5zQ/91fTYi5NV0tSLArd2LC8actVH/N7dHQuML2LAqgCkk2O6H6mRs8rqOLm
         G9yu2jjmvSasKmgP3z6/N9RKaT4dGen2hZHNNt3xotO6ATMFwVBwZ7PgowzV2fdqNxW0
         dy5MMZS9R3kR5ayfWJtJMnHvDV3MpDVEMBDJALJNwzcjO62NpM1BTraV1woCrrjkTvez
         9GWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=svEXNKANMptFL+nn+FJmTq7DF0aaAVsVt5sHrxZKFpg=;
        fh=ktILtpnh8AXB+huSjgLqwIZrOXtEysOZDtRPFQjY1eI=;
        b=N7ogaMuS67mEtiXlUCnCWosB14x0R6nwNF+HtepyNi+TaOsYE2IcsfHGBf4glUmHHO
         rbrsyIBWaI2skLbVXvxe6GxH/txeBdZqCFxrFgkKdRBCEMgw3CqqcyBBhteLigEXRHgt
         8wWWIKJayasKbm94pf0Vpw14CB+nEaT0TGmxK6cdqBFrw6C+9+ngWWvQCWq71VcTJ8N8
         S4xd708zhGRrxSQ93VeWlV1GolOoiNWOaJDNEOmIZcT0xmvDuIjHK1egPCiLmfxw22sw
         6r6Znk+q6RVy0g5lVDq5lSZBO/EfFI88UM1tDjxqTVQqXrB0difKCxkhLPquPnwZej7s
         Kkow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794639421; x=1795244221; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=svEXNKANMptFL+nn+FJmTq7DF0aaAVsVt5sHrxZKFpg=;
        b=UYdiydcYuh4OQOJigYGsqGYiNVn32qdk4LxDqVZ5CGTmaqXaaR4xhYY1cT6BwO4XzA
         hS3h4lGcbJ2j6cCyrF/TS0Kt/IwhdMGUseue0tHDp0KWZzb93iJSgcYKlXC6B90krxw+
         THd2x4xAwYrEF9tndo0K1tzwx2HEX4oIVc57F9LtJryGSD9L3m4CRgWVygDakKtnE8/K
         /xTOHQb8DQ7QOd/pq9pWt3iXBQIfgSeYkkwKx9D0qrVuS83AL4fpptxEkpefLZtvgw2o
         s0kcaSpxXjg+lrQxH4IiJc5p8WUdJ7yeDVSaDf5xGFCXVJEXINsvDlnpggplMnxZihRm
         mjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794639421; x=1795244221;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=svEXNKANMptFL+nn+FJmTq7DF0aaAVsVt5sHrxZKFpg=;
        b=W42hKzyRoD3KImQwWbRYKZ2q31PZdtdUpWilQ74pNVEJbXqcplnYTrx5FTmXdhUasQ
         WtFeUW9Q6C6jUbIRQVKI9Ym/2G062VeiXZfJjMkttkOOpTQCfIOz2sgQKyl4Mq/UdCsA
         DBD81ahQXSRcujSSNn6UX/dwClD+XrEM4Cr2EyJ3uyQk4Y5U/OwQFCpCfEt+6AYEa5JJ
         goCOrhX9CdXJK0HWp/D8E5yPjrh9gCcmXHxaHjLmfZhKRP6xGyO5RErXgCknbdan9JBD
         OajF0NpXfIs/KND85P14hyoJ21EfVX13QCjXMp7bubvLmpEE8D8JNszgGg4fztsXgq3a
         UQMg==
X-Gm-Message-State: APuU4Z+tFpZrvKc5qe5vOTJ9R+z304fXPEy/AFoQ7BH/SqmzLCFs+LW0
	qPldN4uc8Z091O4LhsrEWL0YYhbZ8u2swpi0BdgbUf/rwpkOasG9SQhXYQQ2XdWGve+0psLp7xO
	kN6VQHSDAxDCJr8gVvTWWBgTK8lCWPW0=
X-Gm-Gg: AYBFou2w8ggD7Ek23LuZzvjB6rhiOUfucufbhIhxNoe8MK66LTOKiLYIm3b4z0PTP3S
	M48te0HQJZaqcdZEq/OplEKO3KThPAYOKkcKCNtolNuMuxoXY3ff+N9Z1EwoYF1Ie8wfvrtw2tB
	sR4/RDo56NrGUDhcq2BBhw2pDPndXuDmeykHLWW0y70AtKIhyD8fuLW5C7XpLYpwvsTxg02SOLd
	SxDYaOJezoGkJi7xiTUx4Y8bILt4lWLWlKpZr6KCwzr/yq82xDxg9IRPjzh+s1BQhsDFijQ2sl2
	5GQgZecZPYGDYOfv5Z+ci+XfoofmBDujSl3DTn04g2V1VYn0D6zJvzuIDeqQ/dIHHPiqGnYc8H+
	gKlY1CpnxG9OhElKCsy4OC0yhENhKe7fRMnu0WXmBQmf+PmISp0XMZTPuhPTvmL/XBmgQQ7w=
X-Received: by 2002:a05:620a:8908:b0:93f:47fa:b722 with SMTP id
 af79cd13be357-9494bb858b5mr741838185a.13.1794639421226; Fri, 13 Nov 2026
 22:57:01 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Ali Lin <alexlin901107@gmail.com>
Date: Sat, 14 Nov 2026 14:56:50 +0800
X-Gm-Features: AclHuK_n550RFKQmfilUV4kBLWS5ExtF1OorDlMXfULnnkZLu6xhclh-jCwQLTA
Message-ID: <CAMX8SmaXHh-dzH2n6pRhQr8q=iN=Ui7T3TC42e35LBUjvMaH1Q@mail.gmail.com>
Subject: [REGRESSION] HID: Corsair K70 RAPIDFIRE interface 1 times out on
 Linux 7.3.4
To: linux-input@vger.kernel.org
Cc: regressions@lists.linux.dev, jikos@kernel.org, bentiss@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I would like to report a possible Linux HID regression affecting the
Corsair Gaming K70 RAPIDFIRE keyboard (USB ID 1b1c:1b3a).

On Linux 7.3.4-arch1-1, the keyboard works for normal typing, but the
Num Lock, Caps Lock, and Scroll Lock indicator LEDs do not function
correctly after boot.

Unplugging and reconnecting the keyboard restores normal operation.

The problem was not observed when booting Linux 6.18.63-2-lts on the
same machine.

System information:

- Distribution: Arch Linux
- Architecture: x86_64
- CPU: Intel Core i5-8500
- Motherboard: ASUS PRIME H310M-K
- BIOS: 3204 (2023-12-14)
- Keyboard: Corsair Gaming K70 RAPIDFIRE
- USB ID: 1b1c:1b3a
- Device revision: 3.08
- USB speed: Full Speed (12 Mbps)
- USB host controller: xhci_hcd

Test results:

Linux 7.3.4-arch1-1:

- HID initialization timeout reproduced on two separate boots.
- Normal keyboard input continues to work.
- Lock indicator LEDs do not function correctly until the keyboard is
reconnected.
- USB interface 1 fails to bind to usbhid.

Linux 6.18.63-2-lts:

- One successful boot observed.
- Keyboard input and Lock indicator LEDs work normally.
- Both keyboard HID interfaces initialize successfully.
- No corresponding HID initialization timeout was observed.

Relevant kernel messages on Linux 7.3.4:

[   36.929377] usbhid 1-4:1.1: can't add hid device: -110
[   36.930405] usbhid 1-4:1.1: probe with driver usbhid failed with error -110

The USB topology on the affected kernel shows:

Port 004, If 0: Driver=usbhid
Port 004, If 1: Driver=[none]

Additionally, the USB descriptor collection for interface 1 reports:

bInterfaceNumber 1
wDescriptorLength 29
Warning: can't get report descriptor, LIBUSB_ERROR_TIMEOUT

Additional observations:

On Linux 7.3.4, the HID timeout occurs approximately 36.9 seconds
after kernel startup. Subsequent USB devices are enumerated shortly
afterward.

On Linux 6.18.63 LTS, the keyboard HID interfaces initialize at
approximately 1.3 seconds.

During one boot with Linux 7.3.4, systemd-udevd also displayed a
stop-job delay in the initramfs shutdown phase. The system eventually
booted successfully.

I have not determined whether the delayed USB enumeration and udev
stop-job observation share the same underlying cause.

Steps to reproduce:

1. Connect the Corsair K70 RAPIDFIRE directly to a motherboard USB port.
2. Boot Arch Linux using kernel 7.3.4-arch1-1.
3. Observe that normal keyboard input works, but the Lock indicator
LEDs do not function correctly.
4. Check the kernel log for the usbhid interface 1 timeout.
5. Unplug and reconnect the keyboard.
6. Observe that the Lock LEDs function normally after reconnection.

Diagnostic logs:

https://gist.github.com/Alexlin7/65e0705265c7c369d83f9d4a7515faed

The Gist includes:

- Linux 7.3.4 kernel boot log
- Linux 6.18.63 LTS kernel boot log
- USB topology
- Corsair K70 USB descriptors

The exact kernel version or commit introducing the issue has not yet
been identified.

The affected computer is located at my family home, and I do not have
regular physical access to it. I can perform additional tests when I
next have access to the machine, although hardware testing responses
may be delayed.

Thanks.
Weibo Lin

#regzbot introduced: v6.18..v7.3.4
