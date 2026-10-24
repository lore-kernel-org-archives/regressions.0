Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792839439;
	b=QSvK5DbonjdoOLQEd2kP/y+0RW9foa07IU5NO/pb6b8OH66AXBddjiOUVKTY3696KsOM
	 TmssQd1rW4FqqLd/cUdEzu3FEGqVRYPkrlAYNDuYpk69m+UbhsuS1S5zwyy/DB8vR7j3R
	 SZpAcGwQ0QSexSimF9UMHN8PxZPHV7vsN9m2vA0OgxlPrgR4+293GQL47joHj1h/QrmKW
	 4wYHQuwh14qrWPi8Lh5nJeLCq5smBE4QtCb3Shsw9jgJgr+N9OjZuM8gQ46zALRjSCsXs
	 ER/FGrTOWcG8OqlTYJUFWaHItFN6IZJmqcVLcvNuuldhWETxO8lq9QpkQJD9OFo6ukg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792839439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RqkEm5pNimkHco66marb1ivKFJSwESRUnmku7Km2PgE=;
	b=YxrfA+AN4qipC8VyWKGJFol6fI3rZ5efR94yaiffhdtAfeqLEhEl11ukTiVvC5x4eKPt
	 bzzJh04u/EnZi41YXqDLuNoyevpzJ8DlUFgpArdVOAldX8tBkrpDnYClmB+xNlG7blN5F
	 s79l/FqhflKHjKXzejlSP0NJFN0FjAx5nXYMrqqYoLuL3o4B0ZGKwkgDDjKEw4fcZixM+
	 ikoB6bzpPmX5WxipQlZi0/9H4VE/680O9KdNsw1YrBPAAUzWdjRLm2jLCOqQG2Yljc4we
	 K2U6jOEDU8YOOuvBmn4ydDtTUS0Le03AGJluViI8mQ8cgy4Rl/g7bhEf70EAGJNoqaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GWKfQh9i;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEC6606A31A
	for <regressions@lists.linux.dev>; Sat, 24 Oct 2026 10:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CEC6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GWKfQh9i
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso624156a12.0
        for <regressions@lists.linux.dev>; Sat, 24 Oct 2026 03:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792839438; x=1793444238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqkEm5pNimkHco66marb1ivKFJSwESRUnmku7Km2PgE=;
        b=GWKfQh9i8rsJO1hEgVUMFfsrGQdgHfW1B3IU7Je4FQA0+VgY5bFtYh+qUj+IGUXuO3
         wZxoHsSCyjp3IRgW/sMeiFGoU5ePndVtjUZfEGGxXKj6h+rnCa/yRMaSW0+lvcCh/SPJ
         CR+319mLQ5fUm1hDPoAjt/5gIuWwfCulqO6BaGB5orvlVBOvoaH5kq9uEBs3ZUAoRmWz
         5oBOzzZnsP1kWMSrHOOKQeBydUBqwAA55Gyec+c5QzO5gF0KEJK7QROrs3vmqCIcVGDE
         WMjX4BKiJBlL+MFlF4gAp56xiky9eYCgogqUsCKhwjD434C9uCRu5+29myCtAZXnovBa
         UkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792839438; x=1793444238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RqkEm5pNimkHco66marb1ivKFJSwESRUnmku7Km2PgE=;
        b=l7bGRoA6jiloxcv7MMsZMzF3gBZMfoqEXmlMRhas4QUr+3Dx+iaUAov6zU8fi9J2Nt
         31G8p8ECJcZx1WSJ/eKIKfKb/br88FcjhNks5HSP+dihqXyiPKGp3wZXiOu58wQqaghs
         FUhsPyDR24UkUxTkQq71PTS7J2pf4KCdZ/ST05C83w26Fgu47nCZI/TwPCC+YcV366xN
         CisNZ+7FL9in9O+hqvy0np18BjxD9xz73zMGxYcKrD+gXjcRJsujABHBsg4kWxuIkKEv
         0u+6YP62EXKihkmmA+JepFQUiKq967CQ/tfmolZGEkN6R4N9GeB4QrNSXOGc9sRkafaO
         m5DQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9PRa1K9Aov8VgInZuazMZfg9nK7JCYo3yWw7UGM8Lpn2Fvj+sow4jhld8XFINiLX8wZWDBLIz5hZe9Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYJBFEcsLbIOasMVCK1m6yV015roU4iUPtgNoYvl+CExzzILx8uF
	zBkhQmfAyd+UUgcY9/av2G+xJGN/Sk0Gc4imsJmb8WZI0YI2kd+jxeup
X-Gm-Gg: AYBFou21SqGwNzaFiZYJ0pPJPfylB+aylm2gHY65vZ6jt9g7z9sUym2d+rr4BuJj52V
	WRa4Hq0CxYeA3I7PhFV0PZGeK9TvDE3IJ45djcJn5YYIXTDmenZl+yT0SZ9kmjVKT/1IYFog/+P
	bFcXHzIOrrtJzi17p06hDgpI8xyJIpu+K9hriCKXaCWRr43SRL/zJ6rpBJLB7jWEOfRwJGjuk6V
	WAV6vZQVuZ2qLzUWNsDx3tLQ416MMwCzAkD1llF+U9TpM+Son6HcETvWDlf4aOCLGnlvyNnJXRs
	iCfM4Yw5xd8gf7UtL/yC97Tu0eJcUS8I/3v2sjInJcNcbQoLDlcGETIOvVrj1hbAKNimyxbzqV/
	fbNiGb1SacWoeUz1iQvzfc3IuXzZeJmzBELG0hsaOUykc9pKdxil34U6C+Cnov9pvQFKtoGri4G
	Ml1TPW1QhgQetEUkK1b0xZK/bitHq2hbtVVK1n8lzRGwkozu9g8akPAWcdvs3ZJrF0AtKWt2TG4
	YB1tfotS22ybklnjOvl9QebbtgUxLuZr3w4Ish1ht7m74mc2Cz/LVtdJ8Y6KN/pKnSZbBGB/mrU
	+IXDzD1tTl4nkpR+tehOr4MHISrIaxmC1kZyHFkAFXAPEtVcJnh7kFokPMpI6YB8w+qglJnAAGD
	k86dEZFX9rMmY4yLpq2H6W+Syr3O9ksaQwHuHCxzoUzArQgFOoVMwp+o/qph6MV3T5u3uIcYpO2
	tqZCaVoldWBAFEIyiHcZGPfM7A9CuY//WpJYwGm2MiwFfdiYuCS3SqQp/0o8WrdlOR1TYsWrwzO
	LKXnQ==
X-Received: by 2002:a17:90b:2547:b0:3ad:25f6:1dd0 with SMTP id 98e67ed59e1d1-3adea9daa54mr1556925a91.11.1792839437806;
        Sat, 24 Oct 2026 03:57:17 -0700 (PDT)
Received: from desktophank.localdomain (111-242-220-176.dynamic-ip.hinet.net. [111.242.220.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6946dsm2565666a91.4.2026.10.24.03.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:57:17 -0700 (PDT)
From: Ting-Han Hou <ue081723@gmail.com>
To: stable@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Frederic MARIE-JOSEPH <fredericmariejoseph@protonmail.com>,
	Wolfgang Walter <linux@stwm.de>,
	Bob Anderson <kernel@ametros.net>,
	Domenico Suppa <domenicosuppa@gmail.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-acpi@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH 6.18.y 0/3] ACPI: scan: fix the fixed event power button since 6.18.57
Date: Sat, 24 Oct 2026 18:57:07 +0800
Message-ID: <20261024105710.593-1-ue081723@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026102308-twisting-bazooka-12b5@gregkh>
References: <2026102308-twisting-bazooka-12b5@gregkh>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since 6.18.57, the ACPI power button is not bound to any driver when it
is a fixed event device (LNXPWRBN), so ACPI power-off requests are
ignored. This was reported for QEMU guests by Wolfgang Walter [1] and
Frederic MARIE-JOSEPH [2], and for Dell servers (power button and iDRAC
graceful shutdown) by Bob Anderson [1]. The ASRock H310CM-HDV report on
linux-acpi [3] (ff_pwr_btn "STS invalid") may be the same problem.

6.18.57 got 52d864019636 ("ACPI: button: Convert the driver to a
platform one") as a dependency of fe80251152fe ("ACPI: button: Fix ACPI
GPE handler leak during removal"), but not ab06eb920401 ("ACPI: scan:
Register platform devices for fixed event buttons"), so fixed event
buttons have no platform device to bind to. Bob found that
ab06eb920401 fixes it, Wolfgang confirmed that, and Sasha queued it for
6.18 [1]. 6.18.59-rc1 also converts the tiny power button driver to a
platform one, so with CONFIG_ACPI_TINY_POWER_BUTTON=y the fixed event
power button stops working in 6.18.59-rc1 as well (it still works in
6.18.58).

ab06eb920401 was then dropped from the 6.18 queue together with its two
upstream follow-up fixes (stable-queue c4d7fb7346 "drop acpi patches"),
with a FAILED report for f234fdaae1ca. With the three patches as they
were queued, drivers/acpi/acpi_platform.c does not build on 6.18.y:

  drivers/acpi/acpi_platform.c:92:21: error: implicit declaration of function '__resource_contains_unbound' [-Wimplicit-function-declaration]

__resource_contains_unbound() comes from edfaa81d5da5 ("resource: Add
__resource_contains_unbound() for internal contains checks"), which is
not in 6.18.y, so patch 3 uses resource_contains() instead; the note in
that patch explains why this is equivalent here. Patches 1 and 2 are
clean cherry-picks. aef7792cddca, which also has
"Fixes: ab06eb920401", only rewords a debug message and is not
included.

The series applies to both v6.18.58 and the current 6.18 queue
(6.18.59-rc1).

Testing: x86_64, QEMU q35 with KVM, an initramfs whose init waits for
the power button and then powers off, and QMP system_powerdown sent
after boot:

                                        without series   with series
  6.18.58,     CONFIG_ACPI_BUTTON=y     ignored          KEY_POWER, off in 0.5s
  6.18.59-rc1, CONFIG_ACPI_BUTTON=y     ignored          KEY_POWER, off in 0.5s
  6.18.59-rc1, ACPI_TINY_POWER_BUTTON   ignored          signal 38 to init, off in 0.5s
  6.18.58,     ACPI_TINY_POWER_BUTTON   works (still an ACPI driver there)

"ignored" means there is no "Power Button" input device, LNXPWRBN:00
has no physical node, and nothing happens until init gives up after 40
seconds. With the series, LNXPWRBN:00 gets a platform device bound to
acpi-button (or acpi-tiny-power-button), and the only new kernel
messages during boot are "input: Power Button as
/devices/platform/LNXPWRBN:00/input/input0" and "ACPI: button: Power
Button [PWRF]". A KASAN + PROVE_LOCKING + DEBUG_ATOMIC_SLEEP +
DEBUG_LIST build of 6.18.59-rc1 with the series boots and powers off
without splats, and there are no new W=1 or sparse warnings in
drivers/acpi/acpi_platform.c and drivers/acpi/scan.c.

Not tested: real hardware, and machines whose _CRS has overlapping
resources (the case patches 2 and 3 are about).

Tool use: most of this work was done with an LLM coding assistant
(Claude Code with Claude Opus 5.5). It found the regression reports and
the dropped queue patches while going through recent stable FAILED
mails, rebuilt 6.18.59-rc1 from stable-queue (its tree matches
linux-stable-rc), made the resource_contains() change in patch 3 and
wrote the notes in patches 1 and 3, wrote the test initramfs and
scripts, ran the builds and QEMU tests listed above, and drafted this
cover letter. Patches 1 and 2 are unmodified upstream code. I reviewed
the series and the test results before sending.

[1] https://lore.kernel.org/all/5fe757e7aa54c38df3525d313598db99@stwm.de/
[2] https://lore.kernel.org/all/20261022162655.231431-1-fredericmariejoseph@protonmail.com/
[3] https://lore.kernel.org/all/CADP5X9+xCTkxXZO1dcTodrwsfW=piV41c5f_zaOq6KsrxD0Hhw@mail.gmail.com/

Rafael J. Wysocki (3):
  ACPI: scan: Register platform devices for fixed event buttons
  ACPI: scan: Avoid registering platform devices with resource overlaps
  ACPI: scan: Do not combine resources that overlap completely

 drivers/acpi/acpi_platform.c | 79 ++++++++++++++++++++++++++++--------
 drivers/acpi/scan.c          |  4 ++
 2 files changed, 66 insertions(+), 17 deletions(-)


base-commit: 2926d88bb7fc4608fd942453d929c39e4e5ec006
-- 
2.53.0

