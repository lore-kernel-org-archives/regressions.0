Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70634D50C
	for <regressions@lists.linux.dev>; Tue,  5 Dec 2023 06:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hyHccleC"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-464a3734e49so192415137.0
        for <regressions@lists.linux.dev>; Mon, 04 Dec 2023 22:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701756127; x=1702360927; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MbGfZIumAG8MWScd3jekKM1BGoJdVx+w4q+lDBLye5g=;
        b=hyHccleCtzE3EzWPcnsOgYtfC6DudeNBimDrYt+RxxjqE6IcfuqDYxF3/RztC9m7wW
         rJQjBK/rtU7y2T6baWiXhiEPjA6YMjkz5mrHdPPHjH34Vv70mpaef+AXMsHHok1omHMW
         rwovwtyJgNHkIBZ65FP2DyJOO08X3gESsyQaO7qTCg8tHYUh5W0wS3kE4h0JRMnA+9pn
         yElb92YR1eHXo6poNSw4+1sQws3eBd2M4y1BDqrM6TD63IuQaGSptcZtPPwxGAiFeucD
         Ktj7m/9kiKiESftUJ5eMuleerZN2TyiFWvDU9KzLZvQMjfBC8ednf/15jUNJjVyIukGN
         gWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701756127; x=1702360927;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MbGfZIumAG8MWScd3jekKM1BGoJdVx+w4q+lDBLye5g=;
        b=qbfkeQ9X/EMH9/1Lt4NeSiCUrMrwEVJSj8E9QyHfMRBlU+Wpb45DtoRY6PrOPvcfk5
         +BVs0TpQP67wYxYDcQvq6ylNMQXl6u7WStiRJsfH1YWV7sOIRTEoLfi+UbThEdDT17QY
         x4NQYCW/PurC0IIRZasQZMi8Zdde7aA1ZYhJQZHhcE0PeMl667EVBVAfekAaYjHXhIE5
         ZJS0Zfq3fqsGho9mTwRpckASlgyUjIUuoHShCvpnK1DQ2iBixgrNnIvXxGbuxaD05QPS
         pkIqHM9qmqBZnCmi3Ju6WoFYIyvPpqzbRKdmv7eAebP3qeSVmILME9XNcNkQj/JrYnlL
         AFlQ==
X-Gm-Message-State: AOJu0Yx2MXR0X6+tnalx507L2Cz4EaSh2Ak8SldgtTlXraOZWY8s4PeE
	b/yqxWopfgM1UFhEauXi6/o1PX4oa+STYEWaE7W4nQ==
X-Google-Smtp-Source: AGHT+IHvKqnSwS1BLyzX1vMS4LTuVHrCtdDTFnS9dO+gsy1r9yKxz3zYlHv4rNjFqNOjx1gZc4Nxs2/fOzhwS4SJDXA=
X-Received: by 2002:a67:af18:0:b0:464:3c0a:fdd4 with SMTP id
 v24-20020a67af18000000b004643c0afdd4mr3333612vsl.2.1701756127145; Mon, 04 Dec
 2023 22:02:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 5 Dec 2023 11:31:55 +0530
Message-ID: <CA+G9fYvAUt8GyeGrb5UK8HZDVru6Ucu3BJyMQv0vkO3jYwOHHQ@mail.gmail.com>
Subject: mips-linux-gnu-ld: arch/mips/mm/cache.o: in function
 `cpu_cache_init': cache.c:(.text+0x4f8): undefined reference to `octeon_cache_init'
To: linux-mips@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	linux-mm <linux-mm@kvack.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Zi Yan <ziy@nvidia.com>, Mike Rapoport <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Following build errors reported on MIPS with gcc-8 while building
Linux next-20231205 tag.
But gcc-12 builds pass.

mips-linux-gnu-ld: arch/mips/mm/cache.o: in function `cpu_cache_init':
cache.c:(.text+0x4f8): undefined reference to `octeon_cache_init'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231205/testrun/21486880/suite/build/test/gcc-8-malta_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231205/testrun/21486880/suite/build/test/gcc-8-malta_defconfig/details/


--
Linaro LKFT
https://lkft.linaro.org
