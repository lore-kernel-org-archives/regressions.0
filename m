Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9879C174D0
	for <regressions@lists.linux.dev>; Thu, 27 Jul 2023 14:26:02 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1b9c5e07c1bso8124905ad.2
        for <regressions@lists.linux.dev>; Thu, 27 Jul 2023 07:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690467962; x=1691072762;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFMO1LpHpHTTpjvXoIkQLvxqJltg6buZb3Tzblg91ck=;
        b=MaZvF8Qim2Oq1nIyqGdO4FJQxdZorbsfXUJlaR53K9/TP1T7038u4XZHzqtZ5unfBM
         uKzK5krZrVq3c4h1GdVHU85R6LYeAuJrX5JP/zkbQ08rXdDW9EQuU6/bxVMg+BrGKUup
         exjBoaN8AarvJEo4Xos+A5roE7hPZGWUCdhMCyibdXRuJUp9lRr7d+HpNEK8o1X8zAxS
         5kKD+RhS5xCSiBdoKKgkAFV/B7q2qEA7ITa5m8nUjPpc7Y2TDKYR1jOuwxmAdaRvH/xt
         bxC/o1hOKERlC94dlmE7MI1dwWdid4xLKEwpnfSr+Cy7ZBNCvYmhKzWBY44lv41bK/In
         wcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690467962; x=1691072762;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XFMO1LpHpHTTpjvXoIkQLvxqJltg6buZb3Tzblg91ck=;
        b=FxazGzpR94JJED9Ns5XsbWYr56QSgQwdkLvxyCkKJH0TVze45DuN5dJoeYj9aJ/UNY
         cTX9gBgpGnMiBCNigHcnAEJi5RhjJFpwdux1cisgyxSWn4Vhlxw2Qabyubkw2GGvFPv/
         dLVOuVWwZNhPA2IZl8VZobrCuCKaizeJT2r58vvK+bF4uUkT5xeknLuxGHWKOsf7M9iy
         CVVRLCMt7JJpGd3euzW/Ou2j1ZAFMg+AVdVeEWZgTDPt6X+FIbiofwrTc933mOAikKfs
         Ma1L3Pv2hOCDiKyXOm+DD7wO/ChVESh18DZvvN2cLkQ122VOv7QCcLwcIbHT7tllREJ9
         FBGg==
X-Gm-Message-State: ABy/qLabIs39B5As7k8fX2mIPZ4Hf8DwsIHchvGJHrsNHoLaSwEroCvr
	0qpkI5ITawoxaSzQiCUa3b8=
X-Google-Smtp-Source: APBJJlF45DgEelrUemTQ+/4kCPrQ589VcmGqcljrAJydFH+FItKbkhADQItR3jvjmifXaQD254ZdxQ==
X-Received: by 2002:a17:902:d2c4:b0:1bb:14e7:4fdf with SMTP id n4-20020a170902d2c400b001bb14e74fdfmr6697186plc.22.1690467961804;
        Thu, 27 Jul 2023 07:26:01 -0700 (PDT)
Received: from [192.168.0.104] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id l20-20020a170903005400b001bba7aab822sm1722425pla.5.2023.07.27.07.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 07:25:40 -0700 (PDT)
Message-ID: <4aaf1d3d-2ab7-2d3a-f597-a1741bf699d6@gmail.com>
Date: Thu, 27 Jul 2023 21:25:19 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Goran <goran.brkuljan@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Power Management <linux-pm@vger.kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: XPS 17 9730 runs significantly warmer on Kernel 6.5-rc3 compared
 to Kernel 6.4.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> On my new XPS 17 9730 laptop, I recently installed the Kernel 6.5-rc3. I noticed, however, that during its operation, the laptop was getting significantly warmer than before. I did some analysis using the 'stress' tool to measure and compare the difference in CPU temperatures between Kernel 6.4.3 and Kernel 6.5-rc3. Here are my results:
> 
> OS: Ubuntu 23.10
> CPU: i7-13700H
> 
> kernel 6.4.3:
>                                                                                                                                                                                         
> Initial CPU temperature:
> coretemp-isa-0000
> Core 0:        +47.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 4:        +45.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 8:        +46.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 12:       +46.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 16:       +45.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 20:       +44.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 24:       +44.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 25:       +44.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 26:       +44.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 27:       +44.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 28:       +45.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 29:       +45.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 30:       +45.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 31:       +45.0°C  (high = +100.0°C, crit = +100.0°C)
> Stressing CPU for 30 seconds...
> stress: info: [4858] dispatching hogs: 14 cpu, 0 io, 0 vm, 0 hdd
> stress: info: [4858] successful run completed in 30s
> CPU temperature immediately after stress test:
> coretemp-isa-0000
> Core 0:        +67.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 4:        +76.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 8:        +69.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 12:       +77.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 16:       +69.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 20:       +76.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 24:       +68.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 25:       +68.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 26:       +68.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 27:       +68.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 28:       +71.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 29:       +71.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 30:       +71.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 31:       +71.0°C  (high = +100.0°C, crit = +100.0°C)
> Test ended at: Tue Jul 25 01:10:16 PM CEST 2023
> 
> 
> kernel 6.5-rc-3:
> 
> Initial CPU temperature:
> coretemp-isa-0000
> Core 0:        +46.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 4:        +46.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 8:        +46.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 12:       +46.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 16:       +44.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 20:       +44.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 24:       +45.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 25:       +45.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 26:       +45.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 27:       +45.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 28:       +45.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 29:       +45.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 30:       +45.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 31:       +45.0°C  (high = +100.0°C, crit = +100.0°C)
> Stressing CPU for 30 seconds...
> stress: info: [11146] dispatching hogs: 14 cpu, 0 io, 0 vm, 0 hdd
> stress: info: [11146] successful run completed in 30s
> CPU temperature immediately after stress test:
> coretemp-isa-0000
> Core 0:        +84.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 4:        +97.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 8:        +87.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 12:      +100.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 16:       +86.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 20:       +99.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 24:       +83.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 25:       +83.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 26:       +83.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 27:       +83.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 28:       +89.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 29:       +89.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 30:       +89.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 31:       +89.0°C  (high = +100.0°C, crit = +100.0°C)
> Test ended at: Tue Jul 25 01:05:42 PM CEST 2023
> 
> I tested few times with different setup and CPU temp on 6.5-rc3 is always higher especially when stressing with fewer cores.

See Bugzilla for the full thread.

Goran: On Tuesday, I asked you to perform bisection. Any update on it?

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: v6.4..v6.5-rc3 https://bugzilla.kernel.org/show_bug.cgi?id=217703
#regzbot title: significant temperature increase on XPS 17 9730

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217703

-- 
An old man doll... just what I always wanted! - Clara
