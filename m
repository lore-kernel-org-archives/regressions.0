Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A656129
	for <regressions@lists.linux.dev>; Wed, 10 May 2023 08:27:04 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-64395e2a715so6879219b3a.3
        for <regressions@lists.linux.dev>; Wed, 10 May 2023 01:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683707224; x=1686299224;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGI6Lm0AtHzSQXtW9u+HWh/q47GLCgh6RMnfXKjtk10=;
        b=YnwK0D3uKISsnbmkLu/Sz2qEaUpF/rrJT6uvrOoLYwds3FdiFRlmjeK476qnd3MGE9
         AJdtQgkElfru8rnQ2nKkw1UTf/5MfGgd9GnsCVqvHrkuD+Emyu2IBMWaIJmUVRi5RxG4
         sMisuF/kJ4orfSI6BK56uzDEOAjgthG/g/oY/TWl+MN49yBtsIIca3n8+bwT67POXErD
         embuMk0HH8YV1SA0WHY4yqOoYeh4r5EBo24AxQcTR65mDc6KIrAC0MvG6pQ9pXRD57PT
         F/hWGRPfhJP6LE/bSa6zVUUxJ/pd7L/60Lw1VYq80XAovRMRZz+kJ7zuqngQnWOr6snr
         iYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683707224; x=1686299224;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fGI6Lm0AtHzSQXtW9u+HWh/q47GLCgh6RMnfXKjtk10=;
        b=UF0QgAYSxl3A/W6M+IQZQoBbZgARH0UFTwyAe1aEEwnX2IDHLNziqCo2GEwqHnSYtG
         Ffxs/k+YIf3HTzqZVKUiJoyeaZzUoqZnWleDih1Rg0YqrfFZbyOoD+ox7ESHmyY3C4bW
         pW2wfnT9q6d0ztH27aRtXkjtSWDcs4zdwOOZ3Ztrp/HX5mwCKhMZTpYj5gqpAHTK3kNd
         vNMuX1SW3jdsFsXiFaeLbb/29XcS4a+mKD5UHEmsGwKa/Zssio2G58ID2RiYSeuMzwt9
         jn+nMuUEjj/6c6+r6QkaX4dUYe7dsF3ApilRGDrBEpITMeIaL9mC+2CunbsjMkhy+Ln+
         NQjg==
X-Gm-Message-State: AC+VfDwOKJu0hBtQkJtqQw7uAZRBOvyOUYVqfKYTvdOMoT1bWjINNndD
	sIDCoRmGtSmzuXLJgfKB7gw=
X-Google-Smtp-Source: ACHHUZ7G4coGPv/o20Pt3xAf2wqBDv9uLRjifxHDFgKM8gjudvDiKaJ8QVkC6VJLFijHhAiDaiMFGg==
X-Received: by 2002:a05:6a20:6a14:b0:d9:250:665c with SMTP id p20-20020a056a206a1400b000d90250665cmr20275025pzk.15.1683707224082;
        Wed, 10 May 2023 01:27:04 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-68.three.co.id. [180.214.233.68])
        by smtp.gmail.com with ESMTPSA id p15-20020a63fe0f000000b00514256c05c2sm2671485pgh.7.2023.05.10.01.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 01:27:03 -0700 (PDT)
Message-ID: <c2168e4f-4d47-0d5d-a1b7-d237f0760df8@gmail.com>
Date: Wed, 10 May 2023 15:26:56 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Le Ma <le.ma@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, "Jiadong.Zhu" <Jiadong.Zhu@amd.com>,
 Yang Wang <KevinYang.Wang@amd.com>, Candice Li <candice.li@amd.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
Cc: "Azamat S. Kalimoulline" <turtle@bazon.ru>,
 max <kernel-ODwfxu5zp4@maxxor.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Kernel 5.11 crashes when it boots, it produces black screen.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I noticed a regression report on Bugzilla ([1]). As many developers don't
have a look on it, I decided to forward it by email. See the report
for the full thread.

Quoting from the report:

>  Azamat S. Kalimoulline 2021-04-06 15:45:08 UTC
> 
> Same as in https://bugzilla.kernel.org/show_bug.cgi?id=212133, but not StoneyRidge related. I have same issue in 5.11.9 kernel, but on Renoir architecture. I have AMD Ryzen 5 PRO 4650U with Radeon Graphics. Same stuck on loading initial ramdisk. modprobe.blacklist=amdgpu 3` didn't help to boot. Same stuck. Also iommu=off and acpi=off too. 5.10.26 boots fine. I boot via efi and I have no option boot without it.

Azamat, can you try reproducing this issue on latest mainline?

Anyway, let me add this regression to regzbot:

#regzbot introduced: v5.10..v5.11 https://bugzilla.kernel.org/show_bug.cgi?id=212579
#regzbot title: Booting kernel on AMD Ryzen 5 PRO stucks in loading initrd

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=212579

-- 
An old man doll... just what I always wanted! - Clara
