Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ABCC2C6
	for <regressions@lists.linux.dev>; Wed, 28 Jun 2023 14:06:33 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b8303cd32aso11113975ad.2
        for <regressions@lists.linux.dev>; Wed, 28 Jun 2023 07:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687961193; x=1690553193;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3BkDK05241Wak+mm9YscMVNm89SWiJwn3V52UthfcY=;
        b=ZOXHBpjyf+Vv9nCWYMngb0aLLIb04YHicJdy+dd7g/pI7h8Nuas58L+U96kQzDip+z
         EixEkcSGm5ShYnfXRguksXVRezjciTromRJQsg/W2DdffJzx8ybw5KFjQx8RAwRRSA+f
         Np5wDP+mf26mYMjHq4gFoF+zAU5SbA2WkADfDvjEqKSnV/vGY8jNnLYYG3wmKK4GeiF3
         vR/NRJnDjWkHepVjzWdUPwGqVJ/bNFvgA1VJMfSocZnxtgoeFmdcQ5aABxVQdIEiTd9N
         LshqRaTFd0bm051b/uljpTJD3MRSU0j31aEYHXM3jnU0Vyi6S4mg9/mluX7rKijT0dC5
         SYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961193; x=1690553193;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j3BkDK05241Wak+mm9YscMVNm89SWiJwn3V52UthfcY=;
        b=Uun2Up9EABy9Tfw6dRS71Q0/PWjyOpTuWzvCMYKfi2Up+vDrJbh+w4ySXVqBu4sTrR
         ROcFc7DAFjCbKhx8g3il7sR2mRhs/JTU4D6BGCpt1oU4UK25dKtTz9kbnL0PYlICYNNC
         wb/toZiM0MiDXDcx+1tTmboaF5/nq4UV5vt0ChIJVsg6t168T5hYBKbYwUAFD3IV3ABE
         mGbSojoCZeT7GdudiRDDFnszrgJ7CCh6Y9lSIQG9HsDmYELNix2tdEN0HGIkg6/Q5zML
         cTQ626M16BNDNI8WZ6399Z/g26X7iyHAw3iq2Mcc/jtu/VBQ+Zd7WVWL2mhHhCcNZWXz
         auDw==
X-Gm-Message-State: AC+VfDzM1tQHK9UpPvWLR0qhbPslYKF4fbisf/swbV1dsJsicBd2sil9
	kDU/t9qOU8m0YJM7LCn+Zoo=
X-Google-Smtp-Source: ACHHUZ4G5B13ogdRQDNY1fe0TTeMCA5uMAxuIijkt1rxDchefc9P14S00VFh229EU8HzgmZlRHU61A==
X-Received: by 2002:a17:903:41cf:b0:1a1:b3bb:cd5b with SMTP id u15-20020a17090341cf00b001a1b3bbcd5bmr13962320ple.62.1687961192736;
        Wed, 28 Jun 2023 07:06:32 -0700 (PDT)
Received: from [192.168.0.103] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id u8-20020a170902e80800b001b8025b32cesm5512359plg.131.2023.06.28.07.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 07:06:32 -0700 (PDT)
Message-ID: <4d9fb4a9-6c48-600c-f625-8ef66208090a@gmail.com>
Date: Wed, 28 Jun 2023 21:06:22 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Borislav Petkov <bp@alien8.de>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: commit 9df9d2f0471b causes boot failure in pre-rc1 6.5 kernel
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Since yesterday my builds of the https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git no longer boot with a black screen immediately upon booting. Today I finished git bisecting the issue and arrived at the following:
> 
> 9df9d2f0471b4c4702670380b8d8a45b40b23a7d is the first bad commit
> commit 9df9d2f0471b4c4702670380b8d8a45b40b23a7d
> Author: Thomas Gleixner <tglx@linutronix.de>
> Date:   Wed Jun 14 01:39:39 2023 +0200
> 
>     init: Invoke arch_cpu_finalize_init() earlier
>     
>     X86 is reworking the boot process so that initializations which are not
>     required during early boot can be moved into the late boot process and out
>     of the fragile and restricted initial boot phase.
>     
>     arch_cpu_finalize_init() is the obvious place to do such initializations,
>     but arch_cpu_finalize_init() is invoked too late in start_kernel() e.g. for
>     initializing the FPU completely. fork_init() requires that the FPU is
>     initialized as the size of task_struct on X86 depends on the size of the
>     required FPU register buffer.
>     
>     Fortunately none of the init calls between calibrate_delay() and
>     arch_cpu_finalize_init() is relevant for the functionality of
>     arch_cpu_finalize_init().
>     
>     Invoke it right after calibrate_delay() where everything which is relevant
>     for arch_cpu_finalize_init() has been set up already.
>     
>     No functional change intended.
>     
>     Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>     Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
>     Link: https://lore.kernel.org/r/20230613224545.612182854@linutronix.de
> 
>  init/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Since it might be relevant, my CPU is Intel Core i5-12400 with UEFI from december 2022 and the compiler is gcc (Gentoo Hardened 13.1.1_p20230527 p3) 13.1.1 20230527. If additional information such as the kernel configuration is required, let me know.

See Bugzilla for the full thread.

The reporter can't provide requested dmesg due to this is early
boot failure, unfortunately.

Nevertheless, this regression has already been taken care of on
Bugzilla, but to ensure it is tracked and doesn't get fallen through
cracks unnoticed, I'm adding it to regzbot:

#regzbot introduced: 9df9d2f0471b https://bugzilla.kernel.org/show_bug.cgi?id=217602
#regzbot title: early arch_cpu_finalize_init() cause immediate boot failure

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217602

-- 
An old man doll... just what I always wanted! - Clara
