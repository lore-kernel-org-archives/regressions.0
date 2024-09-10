Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60E018FDC5
	for <regressions@lists.linux.dev>; Tue, 10 Sep 2024 17:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990552; cv=none; b=doztA8OWoosnCrfg+hqw67Nz7egCAEyhIt79m6smfizQq/JKqIv3Cn6ioGjbBxPv3lJ39ck+7a0ciZFfx3br/MyRtPaZKIbE4b8rwCh5b+gLab6LHxht1kLYDMVUI5oATYaz5ijn5vaXe8miox8G6lEZ8NSDsXENW/MAsby0gdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990552; c=relaxed/simple;
	bh=8r6/Z7cYCZt0C2pPNRt5red4H6C/cN0pEDVkXGwQVxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPweYGxC9ndp/ReaN8E5RwdM5feq/ym/tibbynqwzfrrhGZtq5Uj4ZRheUB9EAHIRxz5n6jmW7bHMSEGT9mr4JREd+5HxEioAJMCI9YfmV13kWQVX+v61ZX0PJzR+xro7o9ceSUzzKtPHoq7TBFqHMj75LIW7Ojy4vaS6+wuvWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DXWRsVZl; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DXWRsVZl"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-717934728adso4230849b3a.2
        for <regressions@lists.linux.dev>; Tue, 10 Sep 2024 10:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725990549; x=1726595349; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XjTGqVxL/lXZ4Xq5oA9wMyb/w66vC8I8vd+hq2N9dLc=;
        b=DXWRsVZli6jZTn3l79l/HpUKxdRsBltvT7iAnEWsxA675Aztl6Ewciv+JcdfhPyOhd
         GCyeWi4goX71ylMzV98sqqZCbBkL9fHD68z0rA4XCfGCv7lMTVKb3Sf3Gdn2hB65wpzH
         JsGLmZy8AAH8AYvirrWzj9/q7yd0R2WxKYk80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990549; x=1726595349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjTGqVxL/lXZ4Xq5oA9wMyb/w66vC8I8vd+hq2N9dLc=;
        b=QKgAA8leQ7cFI91Qm3I17f9AuBgYM9jBCPRKEZo3lCYQN/vy8nx4ooUh0f2N+ZfkXs
         9ZPBnRgCxm0FuVMPzr+wXZBWgY86NjNXDhlDt87B4bQe7zKrdK8VlG6i+RbH/bdpe6eP
         VgENk61lVK5318AgjGREvBsJaRgQlA18e6+F1Fc/RrL1AQHV23CMn2WIArk8lA+gn+Vy
         /FjcKzYNdH7C+rdFNHm1U0Aqj3qo6/pJEerHTFdc7JixWin8AktgobWn5so2YANHmWgY
         lmEPsByjAfQOFHBh5fsus3qh2n697Ia4A06vAcs5aY7I9ScqNttr1LGepE6AgYdKUYvT
         wOdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSu+Aya+7jxaE6LPw6lTkzmPNgy0sIaog3hOFEvREZnoztPSLOBTOxavf+f5lDU7QIbTAOPrKmJfitiA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj7tYbdibzDzYGozvhbO7uVhVjPNz6dtEl+fyApocppqX7dbpk
	oWwfo0C0VkcUB0/rH2GLEzQQzfIpH3DI1IL3ezqUpqcI+K5xU9zlZBslaYy5IA==
X-Google-Smtp-Source: AGHT+IH7ewLbjt6vpK16Q9MSvs4t2UHHLsqVCiuJv68f8tihw1AECgjvOqgbtRKJbxklGND7j0FnJg==
X-Received: by 2002:a05:6a21:6481:b0:1cf:37bd:b553 with SMTP id adf61e73a8af0-1cf5e1ab920mr1717836637.46.1725990549167;
        Tue, 10 Sep 2024 10:49:09 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:a9f8:b780:a61c:6acb])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-20710f3229esm51179035ad.268.2024.09.10.10.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 10:49:08 -0700 (PDT)
Date: Tue, 10 Sep 2024 10:49:06 -0700
From: Brian Norris <briannorris@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Hugues Bruant <hugues.bruant@gmail.com>, stable@vger.kernel.org,
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [NOT A REGRESSION] firmware: framebuffer-coreboot: duplicate device
 name "simple-framebuffer.0"
Message-ID: <ZuCGkjoxKxpnhEh6@google.com>
References: <CALvjV29jozswRtmYxDur2TuEQ=1JSDrM+uWVHmghW3hG5Y9F+w@mail.gmail.com>
 <20240909080200.GAZt6reI9c98c9S_Xc@fat_crate.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909080200.GAZt6reI9c98c9S_Xc@fat_crate.local>

(Tweaking subject; this indeed isn't related to the regression at all)

Hi,

On Mon, Sep 09, 2024 at 10:02:00AM +0200, Borislav Petkov wrote:
> Looking at your log, the first warn is in framebuffer_coreboot. Some mess in
> the sysfs platform devices registration.
> 
> Adding the relevant people for that:
> 
> Aug 20 20:29:36 luna kernel: sysfs: cannot create duplicate filename '/bus/platform/devices/simple-framebuffer.0'
> Aug 20 20:29:36 luna kernel: CPU: 5 PID: 571 Comm: (udev-worker) Tainted: G           OE      6.10.6-arch1-1 #1 703d152c24f1971e36f16e505405e456fc9e23f8
> Aug 20 20:29:36 luna kernel: Hardware name: Purism Librem 14/Librem 14, BIOS 4.14-Purism-1 06/18/2021
> Aug 20 20:29:36 luna kernel: Call Trace:
> Aug 20 20:29:36 luna kernel:  <TASK>
> Aug 20 20:29:36 luna kernel:  dump_stack_lvl+0x5d/0x80
> Aug 20 20:29:36 luna kernel:  sysfs_warn_dup.cold+0x17/0x23
> Aug 20 20:29:36 luna kernel:  sysfs_do_create_link_sd+0xcf/0xe0
> Aug 20 20:29:36 luna kernel:  bus_add_device+0x6b/0x130
> Aug 20 20:29:36 luna kernel:  device_add+0x3b3/0x870
> Aug 20 20:29:36 luna kernel:  platform_device_add+0xed/0x250
> Aug 20 20:29:36 luna kernel:  platform_device_register_full+0xbb/0x140
> Aug 20 20:29:36 luna kernel:  platform_device_register_resndata.constprop.0+0x54/0x80 [framebuffer_coreboot a587d2fc243ebaa0205c3badd33442a004d284e0]
> Aug 20 20:29:36 luna kernel:  framebuffer_probe+0x165/0x1b0 [framebuffer_coreboot a587d2fc243ebaa0205c3badd33442a004d284e0]
> Aug 20 20:29:36 luna kernel:  really_probe+0xdb/0x340
> Aug 20 20:29:36 luna kernel:  ? pm_runtime_barrier+0x54/0x90
> Aug 20 20:29:36 luna kernel:  ? __pfx___driver_attach+0x10/0x10
> Aug 20 20:29:36 luna kernel:  __driver_probe_device+0x78/0x110
> Aug 20 20:29:36 luna kernel:  driver_probe_device+0x1f/0xa0
> Aug 20 20:29:36 luna kernel:  __driver_attach+0xba/0x1c0
> Aug 20 20:29:36 luna kernel:  bus_for_each_dev+0x8c/0xe0
> Aug 20 20:29:36 luna kernel:  bus_add_driver+0x112/0x1f0
> Aug 20 20:29:36 luna kernel:  driver_register+0x72/0xd0
> Aug 20 20:29:36 luna kernel:  ? __pfx_framebuffer_driver_init+0x10/0x10 [framebuffer_coreboot a587d2fc243ebaa0205c3badd33442a004d284e0]
> Aug 20 20:29:36 luna kernel:  do_one_initcall+0x58/0x310
> Aug 20 20:29:36 luna kernel:  do_init_module+0x60/0x220
> Aug 20 20:29:36 luna kernel:  init_module_from_file+0x89/0xe0
> Aug 20 20:29:36 luna kernel:  idempotent_init_module+0x121/0x320
> Aug 20 20:29:36 luna kernel:  __x64_sys_finit_module+0x5e/0xb0
> Aug 20 20:29:36 luna kernel:  do_syscall_64+0x82/0x190
> Aug 20 20:29:36 luna kernel:  ? __do_sys_newfstatat+0x3c/0x80
> Aug 20 20:29:36 luna kernel:  ? syscall_exit_to_user_mode+0x72/0x200
> Aug 20 20:29:36 luna kernel:  ? do_syscall_64+0x8e/0x190
> Aug 20 20:29:36 luna kernel:  ? do_sys_openat2+0x9c/0xe0
> Aug 20 20:29:36 luna kernel:  ? syscall_exit_to_user_mode+0x72/0x200
> Aug 20 20:29:36 luna kernel:  ? do_syscall_64+0x8e/0x190
> Aug 20 20:29:36 luna kernel:  ? clear_bhb_loop+0x25/0x80
> Aug 20 20:29:36 luna kernel:  ? clear_bhb_loop+0x25/0x80
> Aug 20 20:29:36 luna kernel:  ? clear_bhb_loop+0x25/0x80
> Aug 20 20:29:36 luna kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> Aug 20 20:29:36 luna kernel: RIP: 0033:0x7b1bee2f81fd

Looks like it might be a conflict with
drivers/firmware/sysfb_simplefb.c, which also uses the
"simple-framebuffer" name with a constant ID of 0. It's possible both
drivers should be switched to use PLATFORM_DEVID_AUTO? Or at least one
of them. Or they should use different base names.

I'm not really sure what the best option is (does anyone rely on or care
about the device naming?), and I don't actually use this driver. But
here's an untested diff to try if you'd really like. If you test it,
feel free to submit as a proper patch with my:

Signed-off-by: Brian Norris <briannorris@chromium.org>

diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index daadd71d8ddd..3f1b8f664c3f 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -62,7 +62,8 @@ static int framebuffer_probe(struct coreboot_device *dev)
 		return -EINVAL;
 
 	pdev = platform_device_register_resndata(&dev->dev,
-						 "simple-framebuffer", 0,
+						 "simple-framebuffer",
+						 PLATFORM_DEVID_AUTO,
 						 &res, 1, &pdata,
 						 sizeof(pdata));
 	if (IS_ERR(pdev))
