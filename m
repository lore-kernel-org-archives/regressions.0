Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281E0171A0
	for <regressions@lists.linux.dev>; Thu, 27 Jul 2023 12:25:21 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bba48b0bd2so5263585ad.3
        for <regressions@lists.linux.dev>; Thu, 27 Jul 2023 05:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690460721; x=1691065521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q8w2BroilchUm0vlMoQZCfmeRkJCD+OaWa9ouggpUhE=;
        b=sUKo94Y7jEq4Of0ShNppcptl1bCqlql1WxhA77SDF4oX/ZTgGKfLfWXCaCclk5ezgF
         IwIjH2S43Zy/sx5UZtoNF5iKjTSYX8odQPEUystkwgkmBpEldUzi60HBj+/pBrvNg8dV
         Zm7KtORoej/Wgbexc9OE94Yo6fQQ1SCpL917giXDnCUVAywLCSczBhck4vxfCmwvdmJ0
         9UbEpmc3yaqkt5ZXzTu284KAd+rqgr2FZiwlpReZZBTVuv0OEQaZXcyvmZwf2K4yTgiy
         jfLFYZV4ciInNJuuHChpim0q45kwQNMJERFpjmYcP5WfkqyH4K43oQsFebb9TMPJo8Gc
         +v6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690460721; x=1691065521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8w2BroilchUm0vlMoQZCfmeRkJCD+OaWa9ouggpUhE=;
        b=gWV7B8NQQ/rbGLG41jwwQ8AxiRV8VmxfW/fwWEW2nvt5xWeZ2cufKpCg3IgnIUk6wA
         IxaT9ux5bAxOIPBCHZ1SSvIROJzT/vhvGJlxLEOtwveVWe1jPxzWTd7IXDmCYHP8ZACQ
         UIirMWrVGLvAwWU+bilkOTU5WxHClkIeCEVkBmNaMEyC8+yvUXIin29RDXifFGYr6W5z
         S2b7FyfCzhn+tekjFct2B/F7hD1pkwvsUo6lma9vskm3yWDt9R6VyBywnfUNeM3sg9jA
         LOFWnbNI/KhRGJLLkO6ZRvwe9zOXiuezswetfk9VCG4BH4gbkV/2INpOoep4UVC9xbW/
         K/uw==
X-Gm-Message-State: ABy/qLYe5Odvm7IBu1K4uSjJ06EsoQ2u7vZZK1VZS/k26ARb0gY7TQkD
	MvqKVwmikTXDMPf8/NTsIK8=
X-Google-Smtp-Source: APBJJlGnPll1D6uCbmYaFm6LhePlGO8cMGwnGGxYven5jT/I5hlWh+/MuAkBl8Oubp5VfczdMLBttA==
X-Received: by 2002:a17:903:182:b0:1bb:e74b:39ff with SMTP id z2-20020a170903018200b001bbe74b39ffmr148542plg.0.1690460721291;
        Thu, 27 Jul 2023 05:25:21 -0700 (PDT)
Received: from [192.168.1.121] ([65.129.146.152])
        by smtp.gmail.com with ESMTPSA id e16-20020a17090301d000b001bb381b8260sm1503595plh.100.2023.07.27.05.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 05:25:20 -0700 (PDT)
Message-ID: <f7e7b601-571f-bd2e-6410-a8a27e510c2f@gmail.com>
Date: Thu, 27 Jul 2023 06:25:19 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Scsi_bus_resume+0x0/0x90 returns -5 when resuming from s3 sleep
To: Damien Le Moal <dlemoal@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: regressions@lists.linux.dev, Mario Limonciello
 <mario.limonciello@amd.com>, Bart Van Assche <bvanassche@acm.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
References: <0e272abe-292d-d58f-cf80-55868e793abc@gmail.com>
 <6b66dd9a-8bd5-2882-9168-8e6e0848c454@leemhuis.info>
 <c70caa9e-164c-fee5-8f85-67f6d02373ab@kernel.org>
 <b0ed86e0-3e4a-d4d1-7b9d-c57f20538a80@gmail.com>
 <86435987-734e-c6c1-a857-1ba80da709fe@gmail.com>
 <48bc1736-5e4e-3a9b-3715-60509c333bb1@kernel.org>
Content-Language: en-US
From: TW <dalzot@gmail.com>
In-Reply-To: <48bc1736-5e4e-3a9b-3715-60509c333bb1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

It was all 1 patch but the first change had a formatting issue from the 
email format I guess. So I fixed that and the patch went through and 
looks like the drive error message has stopped. Still a little slow 
coming back but that error is gone at least.

Jul 27 05:05:05 rageworks systemd[1]: Starting System Suspend...
Jul 27 05:05:05 rageworks systemd-sleep[1624]: Entering sleep state 
'suspend'...
Jul 27 05:05:05 rageworks kernel: PM: suspend entry (deep)
Jul 27 05:05:05 rageworks kernel: Filesystems sync: 0.246 seconds
Jul 27 05:05:26 rageworks kernel: Freezing user space processes
Jul 27 05:05:26 rageworks kernel: Freezing user space processes 
completed (elapsed 0.001 seconds)
Jul 27 05:05:26 rageworks kernel: OOM killer disabled.
Jul 27 05:05:26 rageworks kernel: Freezing remaining freezable tasks
Jul 27 05:05:26 rageworks kernel: Freezing remaining freezable tasks 
completed (elapsed 0.000 seconds)
Jul 27 05:05:26 rageworks kernel: printk: Suspending console(s) (use 
no_console_suspend to debug)
Jul 27 05:05:26 rageworks kernel: serial 00:05: disabled
Jul 27 05:05:26 rageworks kernel: sd 9:0:0:0: [sdc] Synchronizing SCSI cache
Jul 27 05:05:26 rageworks kernel: sd 1:0:0:0: [sdb] Synchronizing SCSI cache
Jul 27 05:05:26 rageworks kernel: sd 0:0:0:0: [sda] Synchronizing SCSI cache
Jul 27 05:05:26 rageworks kernel: sd 9:0:0:0: [sdc] Stopping disk
Jul 27 05:05:26 rageworks kernel: sd 1:0:0:0: [sdb] Stopping disk
Jul 27 05:05:26 rageworks kernel: sd 0:0:0:0: [sda] Stopping disk
Jul 27 05:05:26 rageworks kernel: ACPI: PM: Preparing to enter system 
sleep state S3
Jul 27 05:05:26 rageworks kernel: ACPI: PM: Saving platform NVS memory
Jul 27 05:05:26 rageworks kernel: Disabling non-boot CPUs ...
Jul 27 05:05:26 rageworks kernel: smpboot: CPU 1 is now offline
Jul 27 05:05:26 rageworks kernel: smpboot: CPU 2 is now offline
Jul 27 05:05:26 rageworks kernel: smpboot: CPU 3 is now offline
Jul 27 05:05:26 rageworks kernel: ACPI: PM: Low-level resume complete
Jul 27 05:05:26 rageworks kernel: ACPI: PM: Restoring platform NVS memory
Jul 27 05:05:26 rageworks kernel: Enabling non-boot CPUs ...
Jul 27 05:05:26 rageworks kernel: smpboot: Booting Node 0 Processor 1 
APIC 0x1
Jul 27 05:05:26 rageworks kernel: CPU1 is up
Jul 27 05:05:26 rageworks kernel: smpboot: Booting Node 0 Processor 2 
APIC 0x2
Jul 27 05:05:26 rageworks kernel: CPU2 is up
Jul 27 05:05:26 rageworks kernel: smpboot: Booting Node 0 Processor 3 
APIC 0x3
Jul 27 05:05:26 rageworks kernel: CPU3 is up
Jul 27 05:05:26 rageworks kernel: ACPI: PM: Waking up from system sleep 
state S3
Jul 27 05:05:26 rageworks kernel: xhci_hcd 0000:02:00.0: xHC error in 
resume, USBSTS 0x401, Reinit
Jul 27 05:05:26 rageworks kernel: usb usb1: root hub lost power or was reset
Jul 27 05:05:26 rageworks kernel: usb usb2: root hub lost power or was reset
Jul 27 05:05:26 rageworks kernel: sd 0:0:0:0: [sda] Starting disk
Jul 27 05:05:26 rageworks kernel: sd 1:0:0:0: [sdb] Starting disk
Jul 27 05:05:26 rageworks kernel: sd 9:0:0:0: [sdc] Starting disk
Jul 27 05:05:26 rageworks kernel: serial 00:05: activated
Jul 27 05:05:26 rageworks kernel: ata6: SATA link down (SStatus 0 
SControl 330)
Jul 27 05:05:26 rageworks kernel: ata5: SATA link down (SStatus 0 
SControl 330)
Jul 27 05:05:26 rageworks kernel: ata9: SATA link down (SStatus 0 
SControl 300)
Jul 27 05:05:26 rageworks kernel: usb 1-10: reset full-speed USB device 
number 4 using xhci_hcd
Jul 27 05:05:26 rageworks kernel: usb 1-8: reset full-speed USB device 
number 3 using xhci_hcd
Jul 27 05:05:26 rageworks kernel: usb 1-7: reset full-speed USB device 
number 2 using xhci_hcd
Jul 27 05:05:26 rageworks kernel: OOM killer enabled.
Jul 27 05:05:26 rageworks kernel: Restarting tasks ... done.
Jul 27 05:05:26 rageworks kernel: random: crng reseeded on system resumption
Jul 27 05:05:26 rageworks kernel: PM: suspend exit


On 7/27/23 04:27, Damien Le Moal wrote:
> On 7/27/23 19:22, TW wrote:
>> I managed to fix the patch file, guess the formatting messed up a bit. So will
>> try with those patches installed.
> Just in case, patch fil attached to avoid formatting issues.
>
>
