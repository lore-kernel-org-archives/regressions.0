Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA9815A2
	for <regressions@lists.linux.dev>; Fri, 22 Jul 2022 07:18:35 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id tk8so7081021ejc.7
        for <regressions@lists.linux.dev>; Fri, 22 Jul 2022 00:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IKcHWhHLCbnuHvgLiKMwDvz81Pgdj8AXCEWxJOu/1dE=;
        b=sc2JUCYXDtkMU8ccXbzIM5u4hTQHKWEweOGwEP1DLnS7mV+uQZN3xKOOuiyntqa5zS
         Jm+3fqTrJniRxLPk3hcFbCLERc7GUUopb208cJIi90gIymCqQ3HoDU4CWvCt9OxUIYWc
         kfuPr1MeAwWzQEGzlCy8NfzW2U7y1R19BiDo7xhXtX/GsfxbxYGDcGuKxE/PEf1dfW3B
         wdhBcJP4HpzoZoiViVw7qBTM6Wy6xYrJ7WJgTnt1+XxFrHmlay8RAFJ05oRMSMMyHCmw
         JxEO7yYO4Ly0NnSm7PV+sFI7UiwskDwN38u+dHy9Bxqw1fCCLoHukvqDD0TIHtVI8234
         CTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IKcHWhHLCbnuHvgLiKMwDvz81Pgdj8AXCEWxJOu/1dE=;
        b=yrFdvEt2NRiUDN48W+KJm4sBdSrZcy4hLdtP9s37NO2YI9VkWSPyT+DUaKmE6F6zsB
         JRuHebQwcQt+PNf7mDfesxku02j38rA+dfHHzRQdSZCw0JJ2joGh4gXrWXlqQXyETSbY
         J6RgPySDMZ/VH1TeLKFb1wGUTZh/rc3qT3qlKiOlGP6MYXs3fK/Uid6KmObJ75Y9BGSV
         +RbNUomChZzxXAP2v/LBKlKLBU5wLo3itsmOJt8teq1EFKQ5N8timEWP+gxryMJSeYSm
         LlI0B1eDnDe8zdDzLgQvkIaTtrs/PTwlEO/4Ae80BPzpyRKgSAhFwiDTRNttgDWMtim+
         Ebow==
X-Gm-Message-State: AJIora915IWxT0FuGPoaDZHNBLu3/90RFnJPDkMuHXq0QJlnH8uUT1ul
	S0jzTocXEeEG1DoAUmqi9YGgOikaXsU4TlucASLZcQ==
X-Google-Smtp-Source: AGRyM1sa/4VkRblJLNUgVvrJHsqn5/Kg8T/Pt5KH3qWjYSsuyLK0p49NFzFHKCAKjc5leZV+Ciwd5XDbh6Bgs+1pwOk=
X-Received: by 2002:a17:906:2dd:b0:712:1293:3dd8 with SMTP id
 29-20020a17090602dd00b0071212933dd8mr2076705ejk.448.1658474314198; Fri, 22
 Jul 2022 00:18:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYsuUdyUUUa_Xcfzfnh+Y8c82LnjeHum31C2ancBdxswCQ@mail.gmail.com>
 <87zgh2y35y.wl-maz@kernel.org>
In-Reply-To: <87zgh2y35y.wl-maz@kernel.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 22 Jul 2022 12:48:22 +0530
Message-ID: <CA+G9fYtB=5iHqNiL+=dB0bHfmTiQYyKhbabep7z4-0ZOUBZiUA@mail.gmail.com>
Subject: Re: arm64: defconfig build failed on Linux next-20220721
To: Marc Zyngier <maz@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Aishwarya TCV <Aishwarya.TCV@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Jul 2022 at 19:32, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 21 Jul 2022 14:53:03 +0100,
> Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > arm64 defconfig build failed on Linux next-20220721 tag kernel.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Regressions found on arm64:
> >    - build-gcc-11-lkftconfig-64k_page_size
> >    - build-gcc-11-lkftconfig-rcutorture
> >    - build-gcc-11-lkftconfig-devicetree
> >    - build-gcc-11-lkftconfig
> >    - build-gcc-11-lkftconfig-debug
> >    - build-gcc-11-lkftconfig-armv8_features
> >    - build-gcc-11-lkftconfig-kselftest
> >    - build-gcc-11-lkftconfig-kunit
> >    - build-gcc-11-lkftconfig-libgpiod
> >    - build-gcc-11-lkftconfig-kasan
> >    - build-clang-12-lkftconfig
> >    - build-clang-14-lkftconfig
> >    - build-clang-13-lkftconfig
> >    - build-clang-nightly-lkftconfig
> >    - build-gcc-11-lkftconfig-debug-kmemleak
> >
> > make --silent --keep-going --jobs=8
> > O=/home/tuxbuild/.cache/tuxmake/builds/1/build
> > CROSS_COMPILE_COMPAT=arm-linux-gnueabihf- ARCH=arm64
> > CROSS_COMPILE=aarch64-linux-gnu- 'CC=sccache aarch64-linux-gnu-gcc'
> > 'HOSTCC=sccache gcc'
> > /builds/linux/arch/arm64/kernel/head.S: Assembler messages:
> > /builds/linux/arch/arm64/kernel/head.S:334: Error: immediate cannot be
> > moved by a single instruction
>
> See https://lore.kernel.org/r/20220721124244.903567-1-maz@kernel.org
> as a potential workaround.
>

I have tested this patch and the reported build problem has been fixed.

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

> Another solution would be to have Peter's patch in 5.19 but not in
> 5.20.

- Naresh
