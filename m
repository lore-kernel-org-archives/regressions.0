Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C33341AD9
	for <regressions@lists.linux.dev>; Thu, 21 Aug 2025 13:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783812; cv=none; b=SxiUuDJVX6UW1vrsik1DCWkGfFPKy1aSesZzah6B9G1ZplbPLycxv/KXP3vmuyLUb1NHI8RWf1sEdOtzQZjUEu7w50Kv5oUoNgRilfYcChORcI7w97UrR9qq+VwYVta8k25+azQMGBSEaTkvmyat3zvY3nAeTIIKEPXx3cr6J+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783812; c=relaxed/simple;
	bh=kDR7IcPzIqy9bbYLH2uEiJyNApziIC+MQ80BckAIB5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I1CfRRb4GOaEwA0c4S9NtAKuQgm6mvCrkOtZtSTq2rne5UYfZaIu+xt8DvOfW16HHlXte/EJ7qk5wlXbqIfKoEFzdzo5ZyCLZSpnooDxslx487GNsLLY/7lmXZy4aP0xE2y2fdDBvY259KkNWmns4nMcbN4NzZYF7JXESP4yqXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r9VZGL/w; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r9VZGL/w"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2445826fd9dso11673275ad.3
        for <regressions@lists.linux.dev>; Thu, 21 Aug 2025 06:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755783810; x=1756388610; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4TKKxJUqDz6CrlAYZ9i2quMno6mJSPy8hdIxNc2ssT8=;
        b=r9VZGL/w4O6TxqAzj0bOs4SLICc3ayk749I5mTt1yErilDiBydbqub0ciOGFLlEPA4
         ebdjtd3mSfse3iTSPp0mEVQtWmnbt3/01vcjl3Cpo/u03M4izBx+g3hJH5olobgIpcEO
         EXQ/O6yC7F0LHSJeFYFqW+O6zRcJRg9/J8gv/LQmpYIIAu7hh1jga9qlgLy6hvSgYmDP
         n5UdhuWrIqxkvMqIgqNGZ+2uHJEas0ra+cWGW8KeiNts+vvnNCp9ujuDALhuEPwT1+rj
         5coRVqVtr0A/lWrx0yWYOu/caGmSyQCYuTM7dQKQvD6KKhKfzHLTVwMLS4/bGVHQiuEP
         yGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783810; x=1756388610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TKKxJUqDz6CrlAYZ9i2quMno6mJSPy8hdIxNc2ssT8=;
        b=lsMFsg7LCgQ1lviSyshvOhhL0ih975/vdrTiGdMIiBgOWXL6UmWBnSVwdTElYUaUS9
         ocT/0VVUVg4HTrED3eScZYjyYNzSTIzupKvZgK4bk0Zzdy1Zs6NxIypAt6avWgkf1i8I
         RWCSRjGIhYH26rTGTe1wDdwZghL+o4MQrbMjVB7iXuiutnkt6j2NLT1PpznTGopPabtU
         FqiOFEkv45RX+ScbmBn0du+/c2wcdEMRHekCcNc+SKdx7Dnpxhc4Ik32TguvtZJKh2U7
         2EgSvtOe64MkOwVLgFYI9ZDw/llbz9KhYdCBmbz2khj0Bju64XKwaHJWZ5LKByD8kGVA
         lU+g==
X-Forwarded-Encrypted: i=1; AJvYcCUPY6baE9dphS+GwYUt56Ef/CwUruJ8kpRcwblkW25Oqk333dfQe8yABaUpe8G1JFFbZjkmHzu6X+TiBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwragRwxOf2/c7timvZ7aWWtSHgcctE+bM5mBjkrc+fe4rMyQpj
	NGhyeBJnh9cwobacOSZ8ikiM4J22Ek/el18TpVWnjNPkd2GlbFGidAp985tpirhm/ZDcPzpVfyR
	QDSH4TB0Eg7S2ln6ZzQw6KYR1pDi2RJNN53bq8bl70Q==
X-Gm-Gg: ASbGncumEBw8HKWuC2Bow0b6SBTEcVu76b5A1POArMVpmnAUP7K68Y99MHg4P1IOEZM
	QYHEmNd8F6To5Y6fN2LsnSs0DKbVA/rtTkmWSz30/q/nmM6NzCBRtnza8WeTlcpI1n0blC1xIyr
	INuycJGg7ZMbXvqLlfgr6LLvYVUtRMDSmdBsZ8wUhcD08CP1qBUqdd+TkU3tDMGj6rD5I5116Y1
	cwpT8CyX7cexk7qz1XXrREbc9RfiWGUjYKUdYDFXNs4VI3KM0g=
X-Google-Smtp-Source: AGHT+IELgByc3NnsMiO4ohlSNnw7P3I9l1WOk61YcazCJ1eLTSo0Jd6s6qKsge3KcqTIkNDOkvcx67/Y6od2fhS10yk=
X-Received: by 2002:a17:902:d584:b0:23f:c760:fdf0 with SMTP id
 d9443c01a7336-245fedc8c92mr33954055ad.45.1755783810391; Thu, 21 Aug 2025
 06:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYthMAr3w=U_GmbLPgMb7xNdjbqmxYWF0iUEuJzxnw3dxg@mail.gmail.com>
In-Reply-To: <CA+G9fYthMAr3w=U_GmbLPgMb7xNdjbqmxYWF0iUEuJzxnw3dxg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 21 Aug 2025 19:13:18 +0530
X-Gm-Features: Ac12FXweVlItcIxXxm0jYGOpeOdEH-mXExl8DfwFQGTW8B_Dt-4zHZjVzLsg8Gc
Message-ID: <CA+G9fYvkpmqGr6wjBNHY=dRp71PLCoi2341JxOudi60yqaeUdg@mail.gmail.com>
Subject: Re: next-20250821 cacheflush.h:61:3: error: incompatible pointer
 types passing 'memdesc_flags_t *' to parameter of type 'volatile unsigned
 long *' [-Werror,-Wincompatible-pointer-types]
To: open list <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Anders Roxell <anders.roxell@linaro.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Arnd Bergmann <arnd@arndb.de>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Aug 2025 at 16:26, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The following build warnings / errors noticed with mips defconfig with
> clang-20 and gcc-12 toolchains.
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> Build regression: next-20250821 cacheflush.h:61:3: error: incompatible
> pointer types passing 'memdesc_flags_t *' to parameter of type
> 'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]

Anders bisected and found this,

# first bad commit:
   [30f45bf18d55a411f576afe48d50e78a2eef7e23]
    mm: introduce memdesc_flags_t

>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> * mips, build
>   - clang-nightly-allnoconfig
>   - clang-nightly-defconfig
>   - clang-nightly-lkftconfig-hardening
>   - clang-nightly-lkftconfig-lto-full
>   - clang-nightly-lkftconfig-lto-thing
>   - clang-nightly-tinyconfig
>   - gcc-12-allnoconfig
>   - gcc-12-ath79_defconfig
>   - gcc-12-bcm47xx_defconfig
>   - gcc-12-bcm63xx_defconfig
>   - gcc-12-cavium_octeon_defconfig
>   - gcc-12-defconfig
>   - gcc-12-malta_defconfig
>   - gcc-12-rt305x_defconfig
>   - gcc-12-tinyconfig
>   - gcc-13-lkftconfig-hardening
>   - gcc-8-allnoconfig
>   - gcc-8-ath79_defconfig
>   - gcc-8-bcm47xx_defconfig
>   - gcc-8-bcm63xx_defconfig
>   - gcc-8-cavium_octeon_defconfig
>   - gcc-8-defconfig
>   - gcc-8-lkftconfig-hardening
>   - gcc-8-malta_defconfig
>   - gcc-8-rt305x_defconfig
>   - gcc-8-tinyconfig
>
>
> ## Build error mips
> In file included from include/linux/cacheflush.h:5:
> arch/mips/include/asm/cacheflush.h:61:3: error: incompatible pointer
> types passing 'memdesc_flags_t *' to parameter of type 'volatile
> unsigned long *' [-Werror,-Wincompatible-pointer-types]
>    61 |                 folio_set_dcache_dirty(folio);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/mips/include/asm/cacheflush.h:42:27: note: expanded from macro
> 'folio_set_dcache_dirty'
>    42 |         set_bit(PG_dcache_dirty, &(folio)->flags)
>       |                                  ^~~~~~~~~~~~~~~
> arch/mips/include/asm/bitops.h:89:70: note: passing argument to
> parameter 'addr' here
>    89 | static inline void set_bit(unsigned long nr, volatile unsigned
> long *addr)
>       |                                                                      ^
>
> In file included from include/linux/cacheflush.h:5:
> arch/mips/include/asm/cacheflush.h:70:3: error: incompatible pointer
> types passing 'memdesc_flags_t *' to parameter of type 'volatile
> unsigned long *' [-Werror,-Wincompatible-pointer-types]
>    70 |                 folio_set_dcache_dirty(page_folio(page));
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/mips/include/asm/cacheflush.h:42:27: note: expanded from macro
> 'folio_set_dcache_dirty'
>    42 |         set_bit(PG_dcache_dirty, &(folio)->flags)
>       |                                  ^~~~~~~~~~~~~~~
> arch/mips/include/asm/bitops.h:89:70: note: passing argument to
> parameter 'addr' here
>    89 | static inline void set_bit(unsigned long nr, volatile unsigned
> long *addr)
>       |                                                                      ^
> 2 errors generated.
>
> ## Source
> * Kernel version: 6.17.0-rc2
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git describe: next-20250821
> * Git commit: 7fa4d8dc380fbd81a9d702a855c50690c9c6442c
> * Architectures: mips
> * Toolchains: clang-20 gcc-12
> * Kconfigs: defconfig
>
> ## Build
> * Build log: https://qa-reports.linaro.org/api/testruns/29616797/log_file/
> * Build details mips:
> https://regressions.linaro.org/lkft/linux-next-master/next-20250821/build/clang-nightly-defconfig/
> * Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/31aRYnoYJbpEW0zZyTGvO2w7OCn
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31aRYnoYJbpEW0zZyTGvO2w7OCn/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/31aRYnoYJbpEW0zZyTGvO2w7OCn/config
>
> --
> Linaro LKFT
> https://lkft.linaro.org

- Naresh
