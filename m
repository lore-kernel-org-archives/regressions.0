Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D668918B1C
	for <regressions@lists.linux.dev>; Fri, 26 May 2023 13:47:22 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-64d18d772bdso1153911b3a.3
        for <regressions@lists.linux.dev>; Fri, 26 May 2023 06:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685108842; x=1687700842;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TW6tTngWb25r/POiswswB/QyhpYIVptjKJqMAEVpQI=;
        b=piyIs9X8Ll5ISV/iWmt8KPgg0B7Tqe8eQT1TjmOyW1U1spGfaEnx6RVNxr8WFlmvzY
         iwfhG4jTstzaotQklI39xA3D8/fduc9M1sNCOuHpjeTayB1hoHDg038i4bKmc+w3QFTt
         0gQNSXptjrhT13Ya9vBaOpOYvudq89gi3n1vM4Dk0/VHwri3sYCD/ebivD1mSnA2jLga
         BlLh/iKtdJHCNtp3bRfyvJRhgGXmgu1GXBqdhOwcxqsPa05UUWtnoTuLp7n/EA395Kk7
         oqwqMtBB0IGl7ZrPUOx8ImIimXddQEYZ9giEYlRpuF3kpu9GhoQa+RwMTubagLy4GMi8
         6ADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685108842; x=1687700842;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9TW6tTngWb25r/POiswswB/QyhpYIVptjKJqMAEVpQI=;
        b=P+xudMZESwCkThWn9o0/RCYDO5TMij1rXHC5Lki0rO+sM+wklRtRiVRG1sdySv6YrV
         /wEbKyNXaOz6Kmwe8A3FUSew63xhYqwib2l3y9aDquuXfVvXpG+eaAL2mXCgavPvWoIz
         HC16zVdSUNfMgPbE1J7LBECy7xUbSzugMf55T2pEdplCKC5iKR/PRIf/89ACC34ORb9A
         bvHe91bmrgVtr7+JfmGb3HEp2j2zSLyRFoJGwv14uEmpED1Wrv+UmsezNEh7hDbRswHG
         H5rjP9+8gU+qkMQACeRnBfqeao5oIUWorgkKBDkHg2uk4n0juiHduGuC69BhHnktHtL4
         7GfQ==
X-Gm-Message-State: AC+VfDxBg6sbo1/7gcb7B0dIRGx+FKDZlObmcssDM74cTkFQfwSh/3Gv
	d+xMxnv0/DakWXI8/Xr9WssXKqccDe0=
X-Google-Smtp-Source: ACHHUZ4K0GD+iAjkaF75NrVdiUroHsbTjcoay2+CJ/EytE3C7jNawfKrN4fA5I5u3rphgfmJhBAOLA==
X-Received: by 2002:a05:6a00:b93:b0:64b:205:dbf3 with SMTP id g19-20020a056a000b9300b0064b0205dbf3mr3785656pfj.34.1685108842119;
        Fri, 26 May 2023 06:47:22 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-61.three.co.id. [116.206.28.61])
        by smtp.gmail.com with ESMTPSA id j1-20020aa78001000000b006437c0edf9csm2881304pfi.16.2023.05.26.06.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 06:47:21 -0700 (PDT)
Message-ID: <288db372-9797-540f-e8bd-794a23648573@gmail.com>
Date: Fri, 26 May 2023 20:46:32 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Samsung SoC Support <linux-samsung-soc@vger.kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrew <quark@disroot.org>, Mika Westerberg
 <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Does not work backlight on Chromebook XE303C12 with Kernel
 version 6.3.4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> I did check it by flashlight. Even with all available backlights drivers compiled as modules it does not work. With Kernel version 5.15.106 backlight works fine.
> Kernels for Chomebook uses dtb files that have some backlight config set (used gpio), like exynos5250-snow-common.dtsi and dmesg of 6.3.4 gives some gpio warnings. Maybe cause in it.

See bugzilla for the full thread and attached dmesg & kernel config.

Anyway, I'm adding it to regzbot:

#regzbot introduced: v5.15..v6.3 https://bugzilla.kernel.org/show_bug.cgi?id=217489
#regzbot title: Chromebook XE303C12 backlight stopped working with gpio warnings

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217489

-- 
An old man doll... just what I always wanted! - Clara
