Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5422163
	for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 00:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzcqFI2s"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6b7f0170d7bso5851861b3a.2
        for <regressions@lists.linux.dev>; Tue, 21 Nov 2023 16:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700611616; x=1701216416; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xKwgkeAtzmkKnSz03T4DxgRKcvAVmHnZ/2Ynp93sTY=;
        b=kzcqFI2sq1apGfVbvcEEsUn/VIE8BdPIeshLwjOmQE21B8hV7OGmBI1KGdkuXITLv8
         13PtdjyafRBmRZ3saEQe+WCO1OfPdnV4fPh5L3g+2B5utKv+lfPnFZ1Qve0aYXAVuQy5
         W14Wf1RMzzXWPiBIS8uFXlOCMeAPaNcCaaVEfawkS+0gPRHAGspvIunEGhJzK/cl3mWX
         xZKXUI5bUDOhQmZ9dMBxI68S29gT3NmMbCMa9vxMb8NzRnEfMEZbpSV6muhDandObfx1
         57fPcs7oe6U+E+vtN2+OMz6BrDCDYeSWHq6Sdlppj+j1mDdgF/FoBIBUjtaLzXijE46k
         nK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700611616; x=1701216416;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/xKwgkeAtzmkKnSz03T4DxgRKcvAVmHnZ/2Ynp93sTY=;
        b=A0HRLXbYcnaCephMRfU+QuqwtJpvICKf1U2wTCGg+76dzXYq8veFmXlPi9zC/1soFk
         ru408pHTInPB0zrfYXx8UxgsJVB4adJ1Mg7eXAcocEnSUXy1iyJ+WW1vcpckzo070ad8
         yrMq0r3E3OGhvoWlaNa0tTDInQ9f5TuFRd08hPChqEiJ8geZc3TFL2GfD0iQNUmLkd62
         GyzXi2uNCT4qoRIPSLdNkb/sIJhVVFYEBfhaQ8uYlKoi/tGrCL90FHvI7HfLo1tA6tjH
         JOSDMApqAgB5tQFlubEcjazmEujahal/7ITv0L5fk9M6A+yfbNti0uJmjMfc9hgioRY6
         HeCg==
X-Gm-Message-State: AOJu0YxuRy5m7LqH/6MvP60iZ1UULnECOumGgphhyOH8Va2PWLEFun9p
	2K774y1E2gokv9gR4hK1DNI=
X-Google-Smtp-Source: AGHT+IGFvSNUofC0ROKmiE0mKp1xMZ8d51fhDYVhtQKX8ZN/1XWxm8S+k3uuwHWRUMjbRvHDmBVm9g==
X-Received: by 2002:a05:6a20:431d:b0:188:f3d:ea35 with SMTP id h29-20020a056a20431d00b001880f3dea35mr764739pzk.50.1700611615823;
        Tue, 21 Nov 2023 16:06:55 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id z14-20020aa7888e000000b006cb95c0fff4sm4424630pfe.71.2023.11.21.16.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 16:06:55 -0800 (PST)
Message-ID: <9057d7de-f2e0-44ba-bec7-8b0861b2a850@gmail.com>
Date: Wed, 22 Nov 2023 07:06:50 +0700
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
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Nouveau <nouveau@lists.freedesktop.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, River <shibedrill1@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Kernel 6.6.1 hangs on "loading initial ramdisk"
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> After upgrading from 6.5.9 to 6.6.1 on my Dell Latitude E6420 (Intel i5-2520M) with EndeavourOS, the boot process would hang at "loading initial ramdisk". The issue is present on the 6.6.1 release of both Linux and Linux-zen, but not the 6.5.9 release, which makes me think this is somehow upstream in the kernel, rather than to do with packaging. My current workaround is using the Linux LTS kernel.
> 
> I have been unable to consistently reproduce this bug. Between 50 and 30 percent of the time, the "loading initial ramdisk" will display, the disk activity indicator will turn off briefly and then resume blinking, and then the kernel boots as expected. The other 50 to 70 percent of the time, the boot stops at "loading initial ramdisk" and the disk activity indicator turns off, and does not resume blinking. The disk activity light is constantly flashing during normal system operation, so I know it's not secretly booting but not updating the display. I haven't been able to replicate this issue in QEMU. I have seen similar bugs that have been solved by disabling IOMMU, but this has not had any effect. Neither has disabling graphics drivers and modesetting. I have been able to reproduce it while using Nouveau, so I don't believe it has to do with Nvidia's proprietary drivers.
> 
> Examining dmesg and journalctl, there doesn't appear to be ANY logs from the failed boots. I don't believe the kernel even is started on these failed boots. Enabling GRUB debug messages (linux,loader,init,fs,device,disk,partition) shows that the hang occurs after GRUB attempts to start the loaded image- it's able to load the image into memory, but the boot stalls after "Starting image" with a hex address (presumably the start addr of the kernel).  
> 
> I've been trying to compile the kernel myself to see if I can solve the issue, or at least aid in reproduceability, but this is not easy or fast to do on a 2012 i5 processor. I'll update if I can successfully recompile the kernel and if it yields any information.  
> 
> Please let me know if I should provide any additional information. This is my first time filing a bug here.

See Bugzilla for the full thread and attached grub output.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: v6.5..v6.6 https://bugzilla.kernel.org/show_bug.cgi?id=218173
#regzbot title: initramfs loading hang on nouveau system (Dell Latitude E6420)

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218173

-- 
An old man doll... just what I always wanted! - Clara
