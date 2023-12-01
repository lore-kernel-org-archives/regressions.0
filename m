Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D6F8474
	for <regressions@lists.linux.dev>; Fri,  1 Dec 2023 00:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oo8ODZJY"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5c637e83915so597679a12.1
        for <regressions@lists.linux.dev>; Thu, 30 Nov 2023 16:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701390645; x=1701995445; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caGgQN2zt8grZs3U0xbayh8pbJ7WuHPF2boIZk41q/I=;
        b=Oo8ODZJYgqg5f6gwJe9pYQHWVkh6b3eKWalSjfIXx0n9Igqwc4hsPeMIZX3Ac+Nxl4
         CFVMfc1M1GheI6EV7tKmsP+/Hnm83L9XdAFdJs3NN3GM/WnA9x+VF/3DkB4+xsklk6eo
         l2nzqSUc5CahQte8QRvecvl+J0Ji1Gv+jhu3dDUnewMKqT0D1QWFUwvzm3bejQELrXjm
         E8QyZ9spO4cr4QVN8SEpvX7G/9GJljiTQykSFYksboIp2fYvSWmCzJlG8BeokzqcNPNm
         998DJX5hLRyf8AzbQ6QrSRGa7hmNUzml7vMAyt3KYgJQDGcMeyLuJUA2+Jw3EHV3s+nQ
         E58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701390645; x=1701995445;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=caGgQN2zt8grZs3U0xbayh8pbJ7WuHPF2boIZk41q/I=;
        b=cfipWVwDmzuk5/CY3nlmora3rQGMl16Gzt4TsrPXk2/nXmKZEoj2eUkKXiB9v1jgT8
         H+jQKyZWTW7jHfitfeuuZ6Pr8gobnOjIhX6KNsIPKcL0CYST7oIpscQL9foIhqDDSkYU
         YF9YRzvMO2dUvQmwOiApNxtjl2cPizkP30cZCn1HXuOmp5Lgay7pYFdM4HIRLlrWc3Fu
         sWXoGx5kRgxl8Zeo7tjm6QinClabQKTsC8liK/z/Sb1LhLlP55Om3ZjQnLzM9VYml14d
         b3iEP1usNUzAB3QxTLMHYLm4OTYHQl8LzQZT5VoJk5DRmK3IWsuUyDk3/2Pi1feUcX8a
         gPkQ==
X-Gm-Message-State: AOJu0YxGrCCKYBuxfVGug33VpZGgSUrxkiez334SKOO9Z6PDxTP/adJu
	PHXhoaNMwT4LeS/Kg6fRVWs=
X-Google-Smtp-Source: AGHT+IGavLSgfLIFqgzeRpJJkSpkkqVUuQDRKrB/Bufnp+gm00i5dOUOGGZIZ3Pf4HupAYvGp4kBGg==
X-Received: by 2002:a17:90a:62cb:b0:286:4827:807d with SMTP id k11-20020a17090a62cb00b002864827807dmr3313646pjs.23.1701390645269;
        Thu, 30 Nov 2023 16:30:45 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id c12-20020a17090a020c00b0028089fdce19sm2092716pjc.52.2023.11.30.16.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 16:30:44 -0800 (PST)
Message-ID: <8da256ea-b069-44f0-9cc2-93482c2f5eec@gmail.com>
Date: Fri, 1 Dec 2023 07:30:40 +0700
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
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>
Cc: Wayne Lin <wayne.lin@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Oliver Schmidt <oliver@luced.de>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Thinkpad X13 AMD: Problems with external monitor wake up after
 suspend
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Since kernel version 6.1.57 I have problems with external monitor wakeup after suspend on Thinkpad X13 AMD Gen2 Notebook.
> 
> Notebook is in docking station with closed lid. Suspend & Resume. The external monitor gets no signal. After randomly typing Ctrl+Alt+Fn for switchung consoles, the monitor at some point gets signal and is usable again.
> 
> It worked with kernel 6.1.56.
> 
> I managed to compile a 6.1.57 kernel and also a 6.1.64 kernel by reverting the changes from commit ec5fa9 "drm/amd/display: Adjust the MST resume flow" (https://github.com/torvalds/linux/commit/ec5fa9fcdeca69edf7dab5ca3b2e0ceb1c08fe9a?diff=split&w=1?diff=split&w=1) and with this suspend & resume worked like before without any problems.
> 
> I reported this also to the Manjaro's support forum, since I tried this on Manjaro Linux (https://forum.manjaro.org/t/problems-with-external-monitor-wake-up-after-suspend/151840).

See Bugzilla for the full thread.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: ec5fa9fcdeca69 https://bugzilla.kernel.org/show_bug.cgi?id=218211
#regzbot title: MST resume flow adjustment breaks external monitor wakeup after suspend on Thinkpad X13
#regzbot link: https://forum.manjaro.org/t/problems-with-external-monitor-wake-up-after-suspend/151840

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218211

-- 
An old man doll... just what I always wanted! - Clara
