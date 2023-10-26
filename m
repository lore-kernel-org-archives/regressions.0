Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCA8623
	for <regressions@lists.linux.dev>; Thu, 26 Oct 2023 07:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjJW9CAo"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6b20a48522fso564776b3a.1
        for <regressions@lists.linux.dev>; Thu, 26 Oct 2023 00:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698306914; x=1698911714; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLDn3rLpQ35tRtUSr/CuXLt9BSn773fceZFn4OOFRR8=;
        b=EjJW9CAorGXlDckey7QfgO+kDKYUHVgz9m22x6fnMVet2btJZwI34OQnO1BkiIgirt
         /OG5ulwsm8vCJvzT2EPEmFphUMo6BFqatfK0J6ncGPvjRbPRguE+r3L8Az0351irQpC7
         8b0IgRHQkQDgENTlbuc1WnmdkTO8XL7NqVPfgmFjF0zmycgAXWOU84ehJAfa/Vg/ClJt
         z3/ZU0Aef890rvISODQH/NFiV2jIKQ5Oo8iNpPXV4oca5yBZTd5iyro+20j17YilZINW
         NHObTABtOLKOqVaruC19Of6EZsnbIlGbpBBn7Ca2r57W3eq+mO9XJjflEj+VPOtbN5FJ
         F7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698306914; x=1698911714;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zLDn3rLpQ35tRtUSr/CuXLt9BSn773fceZFn4OOFRR8=;
        b=seA+nPRLdwsIVjw5pPbO0sHu6vdI7nk0vBrJI98O6efYELxL9jzWXCim1sq7M0VPEL
         54kVzLE4F9FuNY03SPfp7Qi/nOJ76EnwBw8tEpyRWIjiTXxe/u+eIBRa/2QFq9IIR98U
         gBYv9rrnt0dDhTl3fYN8xbuBeIykX/vusz1Qb2dB2kCFF3rr22Wed91I2dOFuoN14SGE
         OH6pOEvjJM6PcYraRV4D2cyOywa/z3LGkkqXcI24tns4vf49kg9kUv/6fVxNBourjRxP
         se+/g/2HYbW7aTUnehAm8JurTKimvM90fUK5ARqsSjUdG22bkEY2IanvTV4WC4DK7m8r
         gLzA==
X-Gm-Message-State: AOJu0Yzb8E/4+HzSDQeIkIA4ZQfWwKK2cRn9EvfIbwy28TbOonr3ZEKT
	16kyl15G42HD92+zzXtd6hE=
X-Google-Smtp-Source: AGHT+IFsmPB2JKiQfxfGDpbU5oyDS2xG9SNux9eGXY9adnwYHp3bUwV3tHeox/sA6l9jCk4TTmDykQ==
X-Received: by 2002:a05:6a00:1704:b0:6bd:8c4a:ab8f with SMTP id h4-20020a056a00170400b006bd8c4aab8fmr17763815pfc.2.1698306914133;
        Thu, 26 Oct 2023 00:55:14 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id e14-20020aa798ce000000b0069023d80e63sm10553519pfm.25.2023.10.26.00.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 00:55:13 -0700 (PDT)
Message-ID: <b5646db3-acff-45aa-baef-df3f660486fb@gmail.com>
Date: Thu, 26 Oct 2023 14:55:06 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Hardware Monitoring <linux-hwmon@vger.kernel.org>,
 Linux x86 Platform Drivers <platform-driver-x86@vger.kernel.org>
Cc: Tim Crawford <tcrawford@system76.com>, Jeremy Soller
 <jeremy@system76.com>, System76 Product Development
 <productdev@system76.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Johannes_Pen=C3=9Fel?= <johannes.penssel@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: sysfs: cannot create duplicate filename
 .../system76_acpi::kbd_backlight/color
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Loading the system76-acpi kernel module fails on linux 6.6-rc7. This does not seem to be an issue with system76-acpi itself, because reverting commit #5d36931f0fe51665c04f56c027613d22e6a03411, which is the only change made to this driver across the 6.6 development cycle, does not fix the issue. On 6.5.8, everything works fine. My hardware is a Clevo-based Alder Lake laptop running coreboot, roughly similar to the System76 Darter Pro 8.
> 
> backtrace:
> [  266.399036] sysfs: cannot create duplicate filename '/devices/LNXSYSTM:00/LNXSYBUS:00/17761776:00/leds/system76_acpi::kbd_backlight/color'
> [  266.399045] CPU: 1 PID: 2896 Comm: modprobe Not tainted 6.6.0-rc7 #1
> [  266.399050] Hardware name: Notebook NS5x_NS7xPU/NS5x_NS7xPU, BIOS Dasharo (coreboot+UEFI) v1.6.0 03/30/2023
> [  266.399053] Call Trace:
> [  266.399057]  <TASK>
> [  266.399063]  dump_stack_lvl+0x36/0x50
> [  266.399080]  sysfs_warn_dup+0x5a/0x70
> [  266.399088]  sysfs_add_file_mode_ns+0x11a/0x130
> [  266.399094]  internal_create_group+0x125/0x3b0
> [  266.399101]  internal_create_groups+0x42/0xa0
> [  266.399107]  device_add+0x5b1/0x8a0
> [  266.399113]  ? kstrdup+0x4c/0x70
> [  266.399119]  device_create_groups_vargs+0xce/0xf0
> [  266.399124]  device_create_with_groups+0x4b/0x70
> [  266.399129]  led_classdev_register_ext+0x1d2/0x470 [led_class]
> [  266.399149]  ? devm_led_classdev_register_ext+0x3a/0x90 [led_class]
> [  266.399162]  devm_led_classdev_register_ext+0x50/0x90 [led_class]
> [  266.399173]  system76_add+0x18b/0x460 [system76_acpi]
> [  266.399186]  acpi_device_probe+0x47/0x130
> [  266.399193]  really_probe+0x19b/0x3e0
> [  266.399199]  ? __pfx___driver_attach+0x10/0x10
> [  266.399205]  __driver_probe_device+0x78/0x160
> [  266.399211]  driver_probe_device+0x1f/0x90
> [  266.399217]  __driver_attach+0xd2/0x1c0
> [  266.399222]  bus_for_each_dev+0x85/0xd0
> [  266.399227]  bus_add_driver+0x116/0x220
> [  266.399233]  driver_register+0x59/0x100
> [  266.399242]  ? __pfx_system76_driver_init+0x10/0x10 [system76_acpi]
> [  266.399252]  do_one_initcall+0x5a/0x300
> [  266.399260]  do_init_module+0x60/0x240
> [  266.399267]  init_module_from_file+0x86/0xc0
> [  266.399275]  __x64_sys_finit_module+0x18a/0x350
> [  266.399282]  do_syscall_64+0x5d/0x90
> [  266.399289]  ? syscall_exit_to_user_mode+0x26/0x40
> [  266.399295]  ? do_syscall_64+0x6c/0x90
> [  266.399300]  ? do_syscall_64+0x6c/0x90
> [  266.399305]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> [  266.399314] RIP: 0033:0x7f5c11b38d7d
> [  266.399360] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 7b d0 0b 00 f7 d8 64 89 01 48
> [  266.399364] RSP: 002b:00007ffe30e15b88 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> [  266.399370] RAX: ffffffffffffffda RBX: 000055a8d48d6c10 RCX: 00007f5c11b38d7d
> [  266.399372] RDX: 0000000000000000 RSI: 000055a8d3077d8b RDI: 0000000000000003
> [  266.399375] RBP: 000055a8d3077d8b R08: 00007f5c11bf6b00 R09: 00007ffe30e15bd0
> [  266.399376] R10: 0000000000000050 R11: 0000000000000246 R12: 0000000000040000
> [  266.399378] R13: 000055a8d48d6c90 R14: 000055a8d48d6390 R15: 000055a8d48d7090
> [  266.399382]  </TASK>
> [  266.399410] System76 ACPI Driver: probe of 17761776:00 failed with error -17

See Bugzilla for the full thread and attached dmesg output.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: v6.5..v6.6-rc7 https://bugzilla.kernel.org/show_bug.cgi?id=218045

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218045

-- 
An old man doll... just what I always wanted! - Clara
