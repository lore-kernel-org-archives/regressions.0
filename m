Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAEE353A93
	for <regressions@lists.linux.dev>; Mon, 13 Jul 2026 18:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783967734; cv=none; b=mORUzlKIpPgLMGsZXePSDirHpYLVXxyqk6g1qHhh4BdF+8F7+IV3T/RBitxwpB4Jur/T1ClC1Y8dL075SstzBeuSiR3FmEhsspuPDcvj6ONC+c4Bi//ig7XT5HiyRFefBTqrPlGdBIqLDfFOxphmqLkzHaWo5fkaL0Tci8b2bbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783967734; c=relaxed/simple;
	bh=1nvoc3prO7MC5cWrITaRX5Z2IKkcfguUYoYngS3HgaQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:Subject:From:Content-Type; b=dsIkx1ZYTX+Rjo45Dj8oiuWzzYx/WhPWBkvUuvwMSdPG356KNn4RMdrI2fcJySn2ibaQDa8Dw2I+hGZXiD26xytLDkJ1VJwp4dkAdn5FSkIoQwtCuGZNSofJNeJWwEktqVL62hvI8HLIUicgZOYFNyiU/6XgzTPdks+BskTLCH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethicsbowl.ca; spf=pass smtp.mailfrom=ethicsbowl.ca; dkim=fail (0-bit key) header.d=ethicsbowl.ca header.i=@ethicsbowl.ca header.b=jebcWqsa reason="key not found in DNS"; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethicsbowl.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethicsbowl.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ethicsbowl.ca header.i=@ethicsbowl.ca header.b="jebcWqsa"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc891373e0so39795895ad.2
        for <regressions@lists.linux.dev>; Mon, 13 Jul 2026 11:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ethicsbowl.ca; s=google; t=1783967732; x=1784572532; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z5LhU8VY08zumCZgfACpSYa1j3Ing/19bKNqru9qpHM=;
        b=jebcWqsacld6iBLXkDfBDLiYvnXAr4vV+ASP0fWQcKgqC+b1HWkL9Z/cM9C4HLKV4J
         LTt+n4AXecV0iMTp2/BUgwRvneiYV1ahBtTVTbHwCwZnjC5HO0Tvn7ge5u+pfT0tH+zX
         OTbcylg0A6jQ5LEovFsWDnA8KSL1YpPRkbq66JJuob6gDq3Lhj/jUeoktsBXG+45jNTm
         vFbNRbm6y+0QpNFuYaMzDEIhEcZZeHfSFhscMM39DrSIiGklUXCMsVayRZJVTfJXoCJ3
         ca/HkecOZkRt8jWhEYRFhDIsMvIe4/jWDbQ7Kw6x8RwFDm376CMwVG+PgGig69ZxlVrW
         z+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783967732; x=1784572532;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5LhU8VY08zumCZgfACpSYa1j3Ing/19bKNqru9qpHM=;
        b=cFg0E9D4gZtCiccQAKZZ/mIvD6zH12UNbQxu756jgAU1QB+EiB3hxyJ4btSea+QmWe
         avICgsCycS08KWNNP6bVJheaqluPugbZ24LKicdqyZFRyGUGpqvaR1sx5raZViwnFx8m
         N17S9hmo+md+uHnvVdUtzxqqnkqWIO5I/SSRudkyybo5yA9b4UQiqEzhKDpaIz268txb
         45BLRKEJ8AnYgm0Hoak1shqCawzZW/NqM1JByGJhPMXA0UZI1w8FV4zpEOLvPGqH60b1
         iNanCVgqqv6LdRLUW4rey/n6OPiesqDVHM/fbbOyqjMaWb44Bz/7A4QpiQr0y5bF0o1S
         Xi9A==
X-Forwarded-Encrypted: i=1; AHgh+RruK3jV4VjOuf30ub3+Uh48n7ITmU0rnT/9vvDZanwjFDOekt/jPZM0L705EfZvAAJjxwOS0+HysBTLNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxU0Ch65eOb3SQWRNymLx8xzA3IwGXiARbTVgSUAn1tcgfBpyZY
	3OMf0HqEsgRoGhDU81mwFE/5QFjWv/x4aIwLNvo4+TeFBRjOiEHByTZ070sC9axh64HS3UGrkoY
	aHTPuaDltzg==
X-Gm-Gg: AfdE7cmMGfQsifeDP07DcLlrNPDV69A5L2laVa+xTFbsUPO52P5qtwpGXsFCkY9SJQt
	Gdvnr7lvA9LvBiKaSO7Y9grguq+H+uLLulvFkaRwXILpsJR7wxkAJMLPngl8ZtqG1Zdh9RdZ1zL
	Q0d1Sy8wc5O3SY5URiYS9bZEMIYpcVFPfOeEYQp24tD76ABir8ra05jS4SL2Yx6Q8+wF/CJ9OGt
	PlwOGHQ2ILk7CH/8nM/aML8u0/ThZojbLYUqWMRoWnf5r6mbG9a8chxZBDnVv+HPHAsSrT8yC2h
	23Jt8gaaZ42f1XqqcRzxZP8FRMYn31QMtz5TbR0jQB6CxM5WjgBRfmWtnaMgJUifRH86/ddpCF3
	uKpEzueQAAFk7HYnIbqNc9fCRyHkoJJL+r9GUTqcwcYg2WvRhL9u4AEQNsrH8XsIf8ym9HOgyF/
	oNd3gZq1HvCFdILKH+6Zkn2sttqkDvbuksYazBjEVWotiYSys3MwvwlURDNQM=
X-Received: by 2002:a17:903:120b:b0:2ca:52ce:6f74 with SMTP id d9443c01a7336-2ce9f01d374mr101337545ad.29.1783967731778;
        Mon, 13 Jul 2026 11:35:31 -0700 (PDT)
Received: from [142.232.93.124] (ip-142-232-93-124.ptr.bcit.ca. [142.232.93.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d59e51sm105146865ad.76.2026.07.13.11.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 11:35:31 -0700 (PDT)
Message-ID: <ae3f4f58-0326-45a2-bbee-b71ec44cd28a@ethicsbowl.ca>
Date: Mon, 13 Jul 2026 11:35:30 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: qby140326@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, regressions@lists.linux.dev
Subject: [REGRESSION] bitland-mifs-wmi: power-saver write is accepted but
 profile remains balanced on Redmi Book Pro 14 2022
Content-Language: en-US
From: Robert Munro <robert.munro@ethicsbowl.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

To: Mingyou Chen <qby140326@gmail.com>, Hans de Goede 
<hansg@kernel.org>, Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, regressions@lists.linux.dev
Subject: [REGRESSION] bitland-mifs-wmi: power-saver write is accepted 
but profile remains balanced on Redmi Book Pro 14 2022

Hello,

Linux 7.1's new bitland-mifs-wmi driver binds on my TIMI Redmi Book Pro 
14 2022 (TM2107) and exposes platform profiles, but selecting 
power-saver is silently ineffective. The userspace request returns 
success while the sysfs profile never leaves "balanced".

This reproduces without KDE:

     $ cat /sys/class/platform-profile/platform-profile-0/name
     bitland-mifs-wmi

     $ cat /sys/firmware/acpi/platform_profile_choices
     low-power balanced balanced-performance performance

     $ cat /sys/firmware/acpi/platform_profile
     balanced

     $ powerprofilesctl set power-saver
     $ echo $?
     0

     $ powerprofilesctl get
     balanced

     $ cat /sys/firmware/acpi/platform_profile
     balanced

     $ cat 
/sys/devices/system/cpu/cpufreq/policy0/energy_performance_preference
     balance_performance

I repeated the request while polling platform_profile every 50 ms. The 
only observed value was "balanced"; no transient "low-power" state 
appeared. The request completed in 162 ms with exit status 0. 
power-profiles-daemon also persisted Profile=balanced afterward. There 
were no relevant kernel or daemon log messages.

Expected result:

The advertised low-power profile is selected, platform_profile reads 
"low-power", and the AMD P-State EPP becomes power-oriented.

Actual result:

The operation reports success, but firmware, power-profiles-daemon, and 
all AMD CPU policies remain balanced.

System information:

     Distribution: CachyOS
     Kernel: 7.1.3-2-cachyos
     DMI vendor/product/board: TIMI / Redmi Book Pro 14 2022 / TM2107
     BIOS: TIMI RMARB4B0P1010, 2023-06-28
     CPU: AMD Ryzen 5 6600H with Radeon Graphics
     bitland_mifs_wmi srcversion: 0C0A58A1AE25437010C0B5E
     power-profiles-daemon: 0.30-3
     Power source during reproduction: AC online
     Active profile holds: none
     Other power managers (TLP, TuneD, auto-cpufreq): none

powerprofilesctl identifies both drivers:

     power-saver:
       CpuDriver: amd_pstate
       PlatformDriver: platform_profile

The kernel taint value is 512 because of an unrelated AMDGPU display 
warning during boot (dcn31_program_compbuf_size); bitland_mifs_wmi 
itself is not tainted and emitted no warning during reproduction.

This began after the 2026-06-24 update from Linux 7.0.12 to 7.1.1, which 
introduced bitland-mifs-wmi (dc1ec4fa86b2). Power Saver worked before 
that update. My installed 6.18 LTS kernel does not contain this driver, 
but I have not yet performed an LTS or vanilla-mainline A/B test, so I 
am explicitly reporting this as reproduced on a CachyOS kernel.


Regards,
Robert

Assisted-by: OpenAI Codex:GPT-5

Robert Munro
Director, Executive Team
robert.munro@ethicsbowl.ca <mailto:robert.munro@ethicsbowl.ca>
ethicsbowl.ca <https://ethicsbowl.ca>
Ethics Bowl Canada
