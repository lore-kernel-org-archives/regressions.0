Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF7B23A8
	for <regressions@lists.linux.dev>; Sun,  4 Jun 2023 11:38:15 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-969f90d71d4so549818766b.3
        for <regressions@lists.linux.dev>; Sun, 04 Jun 2023 04:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685878694; x=1688470694;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rusAMMBSsBeXYA05kondalVZp5FCvnTK7F71ZNyoHA=;
        b=Hx+hqVphtxbMNEM4q6MqwH6e5HM2MEZhOZsLz7RcZBQ1fTsrGHwlYhiVzKhx4GcQ5l
         aGKT8ihhXJjnhkn7f7BNZEUpyP+ac5oaanUG+3aJWLSQ0akF+LnG6W84LffssMXa4awX
         gXcw23gxi740htLd7MPcS+ke9QtDdLYBpyRXITdHrdRqFxbgAkxAVXlaOwmnO9LPkUr8
         b7z/Uj9BAjcAf1mdw5tLla90XRMqO2DmPGIb4wd633YqhHQf7QC4P0AAEHZxK+axYihU
         JVMTkO+ZJJVbWcIV+g3JMQ6CepjW80oT69k5KhDCgNvVOyTcrtt9HRVYDJ4FGSP+FSEO
         N5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685878694; x=1688470694;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2rusAMMBSsBeXYA05kondalVZp5FCvnTK7F71ZNyoHA=;
        b=gkMU2vpKOCSH7w2oScrjGMQFsJYk+Ub+Oy3BUgoWfZIlG3fl0zGmtHefrGEnSr/6af
         vBR/y2HZIh6/kmWZGB0fVLZvgz2Ez2N4IiYmT2GZqXWaMm/o0IsAYLYT+d7RBOSAR2xp
         RNBycsFJHdFkU/tVXBHoz8oN6MGKy9EOJqYDmJw5ThmKFIy8fAH1+ODUWDRzZz4e1K2H
         teoREK9RNH/J2D7/pEUhlrst1S2bENXsLx+NpdnqrnBbJrJVuCVPx9rg7s7WKCSMe1eF
         yMRJlWHdI7jfDLjtU89l+3ouHLVRXCCNeDsWoskSi4BVFMJDzEdAqixW6DDQoPdarM4S
         UeSw==
X-Gm-Message-State: AC+VfDxV1uhYsegN4JP41ZDZnj6oOPUWZdH/wF2VaZ9gZmww6UCiqRU5
	+w+9biK+RwNko9XpbHp+cRXr1g==
X-Google-Smtp-Source: ACHHUZ4jFxPvDAEztjDERKQ4kdD7IgyPuWYCoXh2O0zZkoZdRwdA1z1k/JdpolPkyx0uECm1fBTKbQ==
X-Received: by 2002:a17:907:3f27:b0:94b:d57e:9d4b with SMTP id hq39-20020a1709073f2700b0094bd57e9d4bmr3848146ejc.2.1685878693835;
        Sun, 04 Jun 2023 04:38:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id g7-20020a1709063b0700b0097073f1ed84sm2947090ejf.4.2023.06.04.04.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 04:38:13 -0700 (PDT)
Message-ID: <3abd3693-ad87-9abf-a762-337076638fcc@linaro.org>
Date: Sun, 4 Jun 2023 13:38:10 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [REGRESSION][BISECT] perf/core: Remove pmu linear searching code
To: Ravi Bangoria <ravi.bangoria@amd.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: mark.rutland@arm.com, jolsa@kernel.org, irogers@google.com, bp@alien8.de,
 adrian.hunter@intel.com, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

#regzbot introduced: 9551fbb64d09

Bisect pointed to commit 9551fbb64d09 ("perf/core: Remove pmu linear
searching code") as first one where all hardware events are gone from
perf for ARMv7 Exynos5422 board.

Expected:
perf list | grep "Hardware event"
  branch-instructions OR branches                    [Hardware event]
  branch-misses                                      [Hardware event]
  bus-cycles                                         [Hardware event]
  cache-misses                                       [Hardware event]
  cache-references                                   [Hardware event]
  cpu-cycles OR cycles                               [Hardware event]
  instructions                                       [Hardware event]


Result:
empty, no hardware events

1. Arch ARM Linux
2. exynos_defconfig
3. Board:
   - Odroid HC1
     ARMv7, octa-core (Cortex-A7+A15), Exynos5422 SoC
     Systemd: v239

4. perf version 6.1.0


Best regards,
Krzysztof
