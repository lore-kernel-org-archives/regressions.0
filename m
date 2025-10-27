Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8776E2E7BDD
	for <regressions@lists.linux.dev>; Mon, 27 Oct 2025 08:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761554301; cv=none; b=R4juyBaMoiKw4XncXv+IM7RaIBUyK9PY7P69/l4FxKSdIDvXYxpwqdqsAcuAXiVZhENvx0uAVcAjbyjTSwb8cDlcPumcDGq1dElPXejn0t4wEAz28SdMnkPvxuyhNeJ99iaC7byhCUK5wwGstgPgpwg/FKMeptLmEdc6I8UpLSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761554301; c=relaxed/simple;
	bh=OKTK5Td5unCJUm93N+oEqzBTazmSzfmhbDzWfGTIQoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p8vE0GMEiXB2sELbci8NGk76dUjG0yDmZ/WvRvKAjNT3HR3DNKA2j7VtksSkC9UieEAPvTKtlxu92FhLxsnEXRczdRLfJJXM/zoTg08ZvTfhGa/Hj5ibpYJ67ERdCYzp4FUTQfuyV/cwxacr8VKEM6sDSR6Wmo7PHeaWWGlbew8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B0tdKq+I; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0tdKq+I"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b6cf1a95273so3184983a12.1
        for <regressions@lists.linux.dev>; Mon, 27 Oct 2025 01:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761554299; x=1762159099; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MJP782NZwgmJ4qdpWQoW1rM/71H2DwiyXVLt9WngTyU=;
        b=B0tdKq+IMf/lNcAni1AuHfp/WNQopgbPjrLIcDJCRdfBNxP4OzBHO58EO4h34BTTA5
         nFIBOXYbErWCoLytH8U0PxeomogHu3uEbyekopGLr8c6yQyOmniQFczC78V8z80MOL4j
         hUOigbM0SU9FJuOxDiMRVCvV3gHkpctdyQDJgfkeBFqKr233FwdTaONwJMbG7AxW8ED9
         10FpgVI2oK4O9XD63qyre45XusIwij1m9gNnYFKQjvtQ+dPyDVxmr/ghXZWIJOsY8eTN
         ZAa/f78phNOa7G/WpL04ogQi+nbGlVPSSM5MS5FDzVOcn6h+0l2V1LbooCmq0ezJyTcH
         Sz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761554299; x=1762159099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJP782NZwgmJ4qdpWQoW1rM/71H2DwiyXVLt9WngTyU=;
        b=ciIvtGnFLQsnsBKIVLJnmb6I6rEA6y6q65j5GrMdIeSsR9kGyuC/hxhhSCe7bJ9xbR
         agrui4BR2cbwmAL5Ng1fgArbrmSNiVxOQReeYQcirG+/flLA9xQJ9RAFYH1gJNGCjutB
         +J6/njJaiYzBFGJOgJu3iuYTyb4hT4ztOhlbMT3j70EecwS6B7efnI7WceUV+minjZ32
         9rHJl46oOgVzvlGRX3CjV30M7WbNictVzH5u4NkpmR3M9u9Y2rJtSb1WN08dZVCbwvJa
         Ol9H5Dfmi0WhPulqosm+P0cnsTgUHr0CFa6Ad4vri1chZHEwsv28DFhl6CCW4FFfvEix
         BGxg==
X-Forwarded-Encrypted: i=1; AJvYcCWGWYEtiGi7ulsnycLdxtMzpNO/iDKKdBrlgtJrPQTjHvaBLMXFE4Lra8ZqfX7oo+GvhT+p9rrdzD62Zg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfpHRWIDccV6ASUau9AR8I+pses/U8G+XfiQDOAm+4JEOWMX2M
	eiqJFWHH9W8TJgPJpvPPLXLtbqQHHbWMQFfmI9RrQJhGvt3/xzhI2oKteNg4R1r31DXJ5i1KjFZ
	9S2ed+Uyguxs/yIV/mPYoES5uKCS9MZSmOKkpud6XFQ==
X-Gm-Gg: ASbGncvy0nSqaEo5Fha7FrtFyaJrcUMDAmPpRqr8aqsJKAzpxDpwvtIpjYRsjzTO9gG
	WYMbQBUOh0DksJvL43DT9o3SEVjB6PxIc154z/dbqpVwOvrobWVlscT3Xf6ek4x8dlSu9yfnn1D
	f5OX1WQGuAge0tBD0l6gXvWbQ5T0AH3cGdvUgDP4omsSVhBvin4Tvw6EVztEvVB3cmZjOyKl0Kd
	c/D5wAu7KlLt1h947g2MjBezpNHtk67RIOS/6tU0g8hagqqafrp32X654hbhE6uAJGhMhyB8UJF
	Nw2H5D/0+F6XIyolpdgBaw4fOpa9a1sRAybyT3HqRMB04DMfHzw=
X-Google-Smtp-Source: AGHT+IGlLaPRRc5ZN4TC96KOjDMG+YTLw6dssn/YPnBI0ecUO89EvzeEmDpxojyG/sc71/YMzaeujT8odPg9c/PnZjw=
X-Received: by 2002:a17:902:e543:b0:267:99bf:6724 with SMTP id
 d9443c01a7336-290caf830f9mr529461675ad.31.1761554298728; Mon, 27 Oct 2025
 01:38:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYs8fn5URQx2+s2oNxdUgZkSrdLC0P1tNBW_n-6BaBkK2Q@mail.gmail.com>
In-Reply-To: <CA+G9fYs8fn5URQx2+s2oNxdUgZkSrdLC0P1tNBW_n-6BaBkK2Q@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 27 Oct 2025 14:08:05 +0530
X-Gm-Features: AWmQ_bm5CgS-nclzvBmLtRcEbtaR0irloEuFZYR8DYix4Gy4NzP49gtmxQFKcU8
Message-ID: <CA+G9fYumAD1_G4UG2LDAPD3fRxN+WQnrm8tPx6pL8qF6wSOUrw@mail.gmail.com>
Subject: Re: next-20251027: backlight.c:59:39: error: implicit declaration of
 function 'of_find_node_by_name'; did you mean 'bus_find_device_by_name'?
To: Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, danielt@kernel.org, 
	Lee Jones <lee@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Oct 2025 at 13:43, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The following powerpc ppc6xx_defconfig build regressions noticed on the
> Linux next-20251027 tag with gcc-14 and gcc-8.
>
> * powerpc, build
>   - gcc-14-ppc6xx_defconfig
>   - gcc-8-ppc6xx_defconfig
>
> First seen on next-20251027
> Good: next-20251024
> Bad: next-20251027
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> Build regression: next-20251027: backlight.c:59:39: error: implicit
> declaration of function 'of_find_node_by_name'; did you mean
> 'bus_find_device_by_name'?
> Build regression: next-20251027: include/linux/math.h:167:43: error:
> first argument to '__builtin_choose_expr' not a constant
> Build regression: next-20251027: via-pmu-backlight.c:22:20: error:
> 'FB_BACKLIGHT_LEVELS' undeclared here (not in a function)
> Build regression: next-20251027: minmax.h:71:17: error: first argument
> to '__builtin_choose_expr' not a constant
> Build regression: next-20251027: compiler.h:168:17: error:
> '__UNIQUE_ID_x__286' undeclared (first use in this function); did you
> mean '__UNIQUE_ID_y__287'?

Anders bisected this down to,
# first bad commit:
   [243ce64b2b371cdf2cbc39c9422cb3047cab6de7]
   backlight: Do not include <linux/fb.h> in header file

>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Build error
> arch/powerpc/platforms/powermac/backlight.c: In function
> 'pmac_has_backlight_type':
> arch/powerpc/platforms/powermac/backlight.c:59:39: error: implicit
> declaration of function 'of_find_node_by_name'; did you mean
> 'bus_find_device_by_name'? [-Wimplicit-function-declaration]
>    59 |         struct device_node* bk_node =
> of_find_node_by_name(NULL, "backlight");
>       |                                       ^~~~~~~~~~~~~~~~~~~~
>       |                                       bus_find_device_by_name
> arch/powerpc/platforms/powermac/backlight.c:59:39: error:
> initialization of 'struct device_node *' from 'int' makes pointer from
> integer without a cast [-Wint-conversion]
> arch/powerpc/platforms/powermac/backlight.c:60:17: error: implicit
> declaration of function 'of_property_match_string'
> [-Wimplicit-function-declaration]
>    60 |         int i = of_property_match_string(bk_node,
> "backlight-control", type);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/platforms/powermac/backlight.c:62:9: error: implicit
> declaration of function 'of_node_put'
> [-Wimplicit-function-declaration]
>    62 |         of_node_put(bk_node);
>       |         ^~~~~~~~~~~
> drivers/macintosh/via-pmu-backlight.c:22:20: error:
> 'FB_BACKLIGHT_LEVELS' undeclared here (not in a function)
>    22 | static u8 bl_curve[FB_BACKLIGHT_LEVELS];
>       |                    ^~~~~~~~~~~~~~~~~~~
> In file included from <command-line>:
> drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_curve_lookup':
> include/linux/compiler.h:168:17: error: '__UNIQUE_ID_x__286'
> undeclared (first use in this function); did you mean
> '__UNIQUE_ID_y__287'?
>   168 |         __PASTE(__UNIQUE_ID_,                                   \
>       |                 ^~~~~~~~~~~~
> drivers/macintosh/via-pmu-backlight.c:45:23: note: in expansion of macro 'max'
>    45 |                 max = max((int)bl_curve[i], max);
>       |                       ^~~
> include/linux/minmax.h:71:17: error: first argument to
> '__builtin_choose_expr' not a constant
>    71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL,
> 1L)))(ux) >= 0)
>       |                 ^~~~~~~~~~~~~~~~~~~~~
> include/linux/compiler_types.h:577:23: note: in definition of macro
> '__compiletime_assert'
>   577 |                 if (!(condition))
>          \
>       |                       ^~~~~~~~~
> drivers/macintosh/via-pmu-backlight.c:45:23: note: in expansion of macro 'max'
>    45 |                 max = max((int)bl_curve[i], max);
>       |                       ^~~
> include/linux/minmax.h:71:17: error: first argument to
> '__builtin_choose_expr' not a constant
>    71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL,
> 1L)))(ux) >= 0)
>       |                 ^~~~~~~~~~~~~~~~~~~~~
> include/linux/compiler_types.h:577:23: note: in definition of macro
> '__compiletime_assert'
>   577 |                 if (!(condition))
>          \
>       |                       ^~~~~~~~~
> include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
>   112 | #define max(x, y)       __careful_cmp(max, x, y)
>       |                         ^~~~~~~~~~~~~
> drivers/macintosh/via-pmu-backlight.c:45:23: note: in expansion of macro 'max'
>    45 |                 max = max((int)bl_curve[i], max);
>       |                       ^~~
> In file included from include/linux/kernel.h:27,
>                  from arch/powerpc/include/asm/page.h:11,
>                  from arch/powerpc/include/asm/thread_info.h:13,
>                  from include/linux/thread_info.h:60,
>                  from arch/powerpc/include/asm/ptrace.h:342,
>                  from drivers/macintosh/via-pmu-backlight.c:11:
> include/linux/math.h:162:17: error: first argument to
> '__builtin_choose_expr' not a constant
>   162 |                 __builtin_choose_expr(
>          \
>       |                 ^~~~~~~~~~~~~~~~~~~~~
>
> drivers/macintosh/via-pmu-backlight.c: In function
> 'pmu_backlight_get_level_brightness':
> drivers/macintosh/via-pmu-backlight.c:63:38: error: 'FB_BACKLIGHT_MAX'
> undeclared (first use in this function); did you mean 'BACKLIGHT_RAW'?
>    63 |         pmulevel = bl_curve[level] * FB_BACKLIGHT_MAX / MAX_PMU_LEVEL;
>       |                                      ^~~~~~~~~~~~~~~~
>       |                                      BACKLIGHT_RAW
> drivers/macintosh/via-pmu-backlight.c:58:51: warning: parameter
> 'level' set but not used [-Wunused-but-set-parameter]
>    58 | static int pmu_backlight_get_level_brightness(int level)
>       |                                               ~~~~^~~~~
> drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_init':
> drivers/macintosh/via-pmu-backlight.c:144:17: error: implicit
> declaration of function 'of_machine_is_compatible'
> [-Wimplicit-function-declaration]
>   144 |                 of_machine_is_compatible("AAPL,3400/2400") ||
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/macintosh/via-pmu-backlight.c: At top level:
> drivers/macintosh/via-pmu-backlight.c:22:11: warning: 'bl_curve'
> defined but not used [-Wunused-variable]
>    22 | static u8 bl_curve[FB_BACKLIGHT_LEVELS];
>       |           ^~~~~~~~
> make[5]: *** [scripts/Makefile.build:287:
> drivers/macintosh/via-pmu-backlight.o] Error 1
> make[5]: Target 'drivers/macintosh/' not remade because of errors.
>
>
> ## Source
> * Kernel version: 6.18.0-rc2-next-20251027
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git describe: next-20251027
> * Git commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
> * Architectures: powerpc
> * Toolchains: gcc-14
> * Kconfigs: defconfig
>
> ## Build
> * Test log: https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrlb77LGOQQSoC8FHCiIEAZK/build.log
> * Test details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20251027/build/gcc-14-ppc6xx_defconfig/
> * Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/34dKrlb77LGOQQSoC8FHCiIEAZK
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrlb77LGOQQSoC8FHCiIEAZK/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrlb77LGOQQSoC8FHCiIEAZK/config
>
> --
> Linaro LKFT

- Naresh
