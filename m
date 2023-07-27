Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F107174D0
	for <regressions@lists.linux.dev>; Thu, 27 Jul 2023 14:25:40 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-686f38692b3so678864b3a.2
        for <regressions@lists.linux.dev>; Thu, 27 Jul 2023 07:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690467940; x=1691072740;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFMO1LpHpHTTpjvXoIkQLvxqJltg6buZb3Tzblg91ck=;
        b=r+VDv71c7Nfr8/pVFNsHnVqWMG9Ui5kjeJEEjRHuSgTa5iyOdZ+rsPkla6ehaAlraq
         n2lywEMxethBwJi2lAltm1JyJiLLM5YbfRsVNaGuC4i2FcSe312S8ZPO8uL0vQ987zKF
         i0fN98OmAVhkVHLz8YCDg3tVp0VYPo5p2xGv6n+qbp0GieDG9ZlXdTNcg4S3TEKdArMx
         z/dzyhNFF2tiWWNnG661HpyGRJr6wfS0yb5lA4FeohkSVdA6ZmPbmHebDBJY/QS5c8Tp
         Z4z6tN7LbFo8HjxFQbD44tbJ3CPg+s+gT3uvg1FbGVQTuxMB1ytzBY86lKe2rvB+eThS
         4H/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690467940; x=1691072740;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XFMO1LpHpHTTpjvXoIkQLvxqJltg6buZb3Tzblg91ck=;
        b=HIAujp/qbYeugFl0RIKNAGuNp+h41btlS5bls4er8k7KC47TwoX6b4k6toGxKcbggh
         pzAnOlz/SbZ0xcFT60PIhmBpcCQUwrAav5iEcB4B2YoxjG3lpRKts1ZzEXBYy01Pa04Y
         Q6AwZ4JAnGs6oyVYRUZ5gRu3qcVPX5Kd5wxC009Ghg/yKa38BqzmDv7XhSLWmBdA4qgR
         4FYpV5RSCBr8M7e3veX8yd/XHAdhmBR6fkHKAa/9YhGTtvQ0wZGdanKfrHCi6Tausxuu
         vrXFWMFt+7CeVQBeSYTZsRHsiOVS2KWSGE4OgQdxTsNH4d3ZJvJe/YBF2hGZ/ltH9lLu
         bKOg==
X-Gm-Message-State: ABy/qLbAZp3BfD0U4UNHLqgK0dGKv4bIHj87lV3P9BIHPvM/t/Fi1CBm
	U/sTiiCVO8MAg1qNrpezgKg=
X-Google-Smtp-Source: APBJJlGxStoO7JfUzyQebiraBQzpo6zbBGztVdjJa29qXmyLgC700MfykmnzQyFKsrP1eYgXr2r0yA==
X-Received: by 2002:a05:6a21:3d87:b0:12f:382d:2a37 with SMTP id bj7-20020a056a213d8700b0012f382d2a37mr5925845pzc.15.1690467939679;
        Thu, 27 Jul 2023 07:25:39 -0700 (PDT)
Received: from [192.168.0.104] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id i22-20020aa787d6000000b00682669dc19bsm1535555pfo.201.2023.07.27.07.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 07:24:41 -0700 (PDT)
Message-ID: <107f05b8-0104-501c-130c-4f89f3f8a628@gmail.com>
Date: Thu, 27 Jul 2023 21:24:15 +0700
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
