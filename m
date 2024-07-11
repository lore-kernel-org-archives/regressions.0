Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F204014C5B3
	for <regressions@lists.linux.dev>; Thu, 11 Jul 2024 20:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720730240; cv=none; b=mqUzMGJs8Kxr00XduyFbgQpRy9x51Mc9RXMyLWRHgYXHnoselt5i2JpgGgU+cT/6S8UoypKYuiXUEPpTnaqQGWrSK1LsFJWoA+qUJQ2WG+kZKnCS1tGvuWrXfYD1Cx1EqlOdOz2yiBrXbURVD+xA4sEuvr7pwHgTPGTq3KMv6rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720730240; c=relaxed/simple;
	bh=ifVsO/BE+qnlPLrx1hI36429uKdXpygJkc87odKt5Vg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=KQukWEKSutcZ2sSVB294I35Tl6oj/CgrhHbBKlHex/c4LKLXPuJURRkwhJX7Kq+6S76uoPLQkjQV7hHq7agjP+7Dggt0/l2Fju5Lf4LRIQ4lqLYeLJaHSrrZSBFT8ffiNvLPbHApKHSO7ZDlJMPjBoZANnbtpHqcguIwQXntqt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schmorgal.com; spf=pass smtp.mailfrom=schmorgal.com; dkim=pass (1024-bit key) header.d=schmorgal.com header.i=@schmorgal.com header.b=Wn+/Y5UX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schmorgal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schmorgal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=schmorgal.com header.i=@schmorgal.com header.b="Wn+/Y5UX"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fb129e6a3eso1288825ad.2
        for <regressions@lists.linux.dev>; Thu, 11 Jul 2024 13:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google; t=1720730238; x=1721335038; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQm2wVcFVV2Ej/3DCwFpioRvEPP+XotE4XPlIbOYt9I=;
        b=Wn+/Y5UXAezUDolakjRi20IMStXcIlyKcz0bCaT2aqGYQstgBkQkVMp/zbvdmJN/LW
         wU9AQwkxTLfZmzPmVUh4MpXc9Ie29Hs0lRptdfqWyF961UUw1OPljBOyAFIm8XLbYoD9
         6PViPoQcc+7vglEcpZHzhO7zBs41soLXBgI00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720730238; x=1721335038;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PQm2wVcFVV2Ej/3DCwFpioRvEPP+XotE4XPlIbOYt9I=;
        b=camTOYEXyimda7O092aNHmAE7tkAUQYa1qG5EbPfq9BMyZUBfjjQmNaoYv4GcvilrH
         oHNWGAW5nXx3OHW3jA0XDk6YTDfRe563Hcc35vTbSpFcOpIX/L7H+s3mR83Xiq4YZ1aJ
         VTGYKKWgWPQc8URJ66tzmyytthwTcbyGT52wuZ85CDg1IU3NkI0pfI7QebogkPTttj3t
         VIH7hHoQo/oOyCDSuAnmFtGBk9nn4OetDLjNPKIIDQxBmNfS6BfBoiTbWMndHWyO31sM
         buMQl4rGyV1c86lOdNDGjTGyRS0n7a9Hu/YF+iANV/NCcM6GcylLjV4iae01mj6QxXEJ
         k0gw==
X-Forwarded-Encrypted: i=1; AJvYcCUsRobXC5zHWFhvrl5uevdHqwSIkdnlA82gxUPOhEigOtY18Zgrse6c2sZyDIiXMmtWPV+D8Xs/yxLKXyYNlSRZdoS03Hv+uvbSDJU=
X-Gm-Message-State: AOJu0YwVKy0dj0INiIIE+HOyY4D0ymeAJjV+Pl3gyrbHZO2jsXVhSeYQ
	1i65SPkvaKF8Oty9m7CMFYXuw/e0k1BkVv3Lgz67DgpMMBuiX4t3WjxUnXOgL/Tj3ZvdZnxxloQ
	43ls=
X-Google-Smtp-Source: AGHT+IFxDT1MFtFyDgFQOw+HdKxecmIIfRF0jLmAo+tw80ob7sxgjLLFO1MjXqjSb7A2ok1PhNUK1w==
X-Received: by 2002:a17:902:e546:b0:1fa:ab4a:fb02 with SMTP id d9443c01a7336-1fbdc389e10mr36455985ad.0.1720730238082;
        Thu, 11 Jul 2024 13:37:18 -0700 (PDT)
Received: from [192.168.1.33] ([50.120.71.169])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-1fbb6a12cdbsm54481135ad.48.2024.07.11.13.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 13:37:17 -0700 (PDT)
Message-ID: <bd9cb3c7-90e8-435d-bc28-0e38fee58977@schmorgal.com>
Date: Thu, 11 Jul 2024 13:37:15 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Doug Brown <doug@schmorgal.com>
Subject: [REGRESSION] drm/vmwgfx shows green Xv instead of actual video
 (bisected I think)
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have discovered a problem in vmwgfx that caused Xv playback to break
between v6.3 and v6.4-rc1. In v6.3, inside of an Ubuntu 24.04 VMware VM
with 3D acceleration disabled, I can run the following GStreamer command
("sudo apt install gstreamer1.0-tools" if you don't already have it):

gst-launch-1.0 videotestsrc ! 
video/x-raw,format=YV12,width=640,height=480 ! xvimagesink

And it works fine, showing a test pattern.

In v6.4-rc1 and all the way up to a build I just made today of Linus's
latest master branch and also including Zack's latest patchset [1]:

Linux doug-Ubuntu-MATE-2404 6.10.0-rc7+ #55 SMP PREEMPT_DYNAMIC Thu Jul
11 12:46:06 PDT 2024 x86_64 x86_64 x86_64 GNU/Linux

...if I run the same command, the GStreamer window shows up containing
solid green rather than the test pattern.

I believe I have bisected the problem to commit:

39985eea5a6d ("drm/vmwgfx: Abstract placement selection")

However, the bisect process was complicated because two earlier commits
temporarily broke vmwgfx so I had to undo them during bisection, which
also required some conflict resolution:

180253782038 ("drm/ttm: stop allocating dummy resources during BO 
creation") and
f87c1f0b7b79 ("drm/ttm: prevent moving of pinned BOs")

Note that if you have gstreamer1.0-vaapi installed, you should
temporarily remove it first before testing because there is a separate
Xorg bug that causes Xorg to crash when you run the above command if
gstreamer1.0-vaapi is installed.

I'm happy to do any further testing as needed. I've reproduced this
problem across several different machines and distros. A fully-updated
Arch Linux is also affected.

As a side note, that same gst-launch-1.0 command is also currently
broken with 3D acceleration enabled, but that's a separate issue in mesa
that I've submitted a patch for [2].

Thanks,
Doug

[1] 
https://lore.kernel.org/all/20240702021254.1610188-1-zack.rusin@broadcom.com/#t
[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30116

#regzbot introduced: v6.3..v6.4-rc1
