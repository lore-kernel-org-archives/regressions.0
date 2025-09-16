Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B5B328582
	for <regressions@lists.linux.dev>; Tue, 16 Sep 2025 16:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758040012; cv=none; b=STkQxceLHzlBz0ghmsJPEgf5LkC/7ZrCpXtS21RC0x8TdFkD8HDlOXEPg0udTJhN1zhKrmHu5bl2xMLnZ/+vT+VL1UmKZUrjChE9Vi/oBD/d67jW/yCwTV3bCzJtuBbNmnmIsxZv1ZbwAp0MfoMPJJaD8L/Ee+jKO2fhTe52k1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758040012; c=relaxed/simple;
	bh=PxBeY2ICmRxL7V6JGWbT7z+W48PkV2S3brfnG0Ta/Sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qKQpbbJv/tdWefA5FDYBTBEFawbEJou5DBywq4LGltPrszCkahlCRiz372diUehlT8/J3MT5Jzuhh/sR8AcYvkfxciJcoM7mf4wW/QJXx28M4iH0e8+j28XDUVc+/dDdxkMFfjAtnzbB2ElM0gk+2c+0bM4d5oA54sTVtjeJjBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BhOYNq7l; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BhOYNq7l"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77b2e3169dcso626225b3a.2
        for <regressions@lists.linux.dev>; Tue, 16 Sep 2025 09:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758040010; x=1758644810; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s4w1twc2Jux9/iX+9+EawZxCflWASdrv9dd1/gUc0LA=;
        b=BhOYNq7lpN5rhx+syU7GRjYaKY7KW6/7bvPz8bXphkTuluSV6zJo6rC0yrWyBgVlGm
         7e8MRbM4UQ+3wqVc8uD3N8V3QS48+A2ySeSg2mT8s54XRL4pAykKOcsBP+eJkUca7+t7
         prcGWxZEM8Iy3yVJOCL5/+Gz0zFiNbWydWI1DJjnUsFDn35YLBB1M2+j+jfAIo4Em9Yd
         XUwGHkVg5vDFAN3q2sJ2LaUVEsaCsS43mCoh5IiAHk55v2ibPm1Ood86GpGSDiP+OXgw
         zpjBxWZJAP69jcT6MNpwJeonOhwLZHVENO23GFlrBCESlNxZZR/ztCkYHMRVg7xVQYHP
         07vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758040010; x=1758644810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4w1twc2Jux9/iX+9+EawZxCflWASdrv9dd1/gUc0LA=;
        b=f0czBw3zaiusnzfCPR4nH94znuSrxAaLph4eEOflBj/AOdYxgX397fAqpPgvwHL+69
         JoQmL8s+48N/JCsvhF1Cczmus+Wd023HzVmzQqMmqNoQLnv4iq3rGajiTL3E3Cl0n7Xa
         VNYShQh3sbf/Ox6HDnlD8cV9I9oHNEjzZ0FwYcXl4C7EIbpx4Uvo0OEyaHX5X29iRsWb
         v47/6rJwV+Rnvr6YsTJGDp7gdSsIWQ7RvQKDD6mEROO1atpwNtxCTwhyRTiNlflp1Vs7
         egAhXd4VNV6ectBLUm+Lna5FI1ASP4lZQesJ2VVCPhVnGel9qLn1r7VUnYfycimQecsQ
         lL+g==
X-Forwarded-Encrypted: i=1; AJvYcCXyZ7gd0ulX0qtSnoZfVSlswQ3zB3eCvdSjYcCmV9kFoGlR/AZzfq14m5l9EiHVJhC/Wr2OOWJmf4r9Lw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJYbLFEZDtgt2zsi/HsoAWAwxLoKtYTy22Cox2brA7JE6RVNjc
	qhpLrLB2JIgOTGPPtZPII2sZlZQO2exa4CCVd/Iw/2lumIftoLGlvDZtdBumnIlTgCQ1e9Fd/5L
	gHNbuoGEBEGEvCFn4GcC8q/9AWz6JAZx/9mU3tthRBQ==
X-Gm-Gg: ASbGncvPE4IL0v9mH0+ZNJJ2Ht7msWHgU3Z7GPOhMbDD5Dw3xlf8ISmUIru4z/6xsvL
	RkvYwvXXVgEGaWa/WGdX0G+wHakRMUlYcEmCT5VGAXI6bvMxsYJ0KwsYC41ZC29uVcHsyNOM8rP
	UGTLtv3c84jXieHwRUoXoujV2vlvB1svPPsyc2nTAD8FIal5ZKqEuty+Ac4/L/PKcIF8RGF/IOT
	vQOuHblOtmAin2kmjcWKF4R5dfD42MOOGngwAqCru77UN9l///f+r06MSXNWtZSRBb8cJI=
X-Google-Smtp-Source: AGHT+IHuTUY+Teyoa1eWvti9PIr/otK14LfkQmbXX52ZUETrjjVY6olQ+9HFTHWNNqsEYSy8wzDykuGz9e1hPuCuCPc=
X-Received: by 2002:a05:6a20:c28a:b0:262:4378:9df2 with SMTP id
 adf61e73a8af0-26243789f89mr10527030637.44.1758040009637; Tue, 16 Sep 2025
 09:26:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtT7HNBM2XBbePeZ-Fw+ig7SJ+JE_NpQ1VuHR_TvAjX2w@mail.gmail.com>
In-Reply-To: <CA+G9fYtT7HNBM2XBbePeZ-Fw+ig7SJ+JE_NpQ1VuHR_TvAjX2w@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 16 Sep 2025 21:56:38 +0530
X-Gm-Features: AS18NWDfejtlQ9zlS_9kzf9pQW6YsiN2lV16eZmPLVxyOpZY0K_VUANrsx-p3cc
Message-ID: <CA+G9fYs4JB0ngq+aryXHVQSq-f05cb4agCfyM9zN0SgprQf0_A@mail.gmail.com>
Subject: Re: next-20250915: error[E0425]: cannot find function
 `atomic_read_acquire` in crate `bindings`
To: rust-for-linux@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Sept 2025 at 11:17, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The following build warnings / errors noticed on the arm arm64 and x86_64
> with rust config build on the Linux next-20250915 tag.
>
> First seen on next-20250915
> Good: next-20250912
> Bad: next-20250915
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> * arm, build
>   - rustclang-lkftconfig-kselftest
>   - rustgcc-lkftconfig-kselftest
>
> * arm64, build
>   - rustclang-lkftconfig-kselftest
>   - rustgcc-lkftconfig-kselftest
>
> * x86_64, build
>   - rustgcc-lkftconfig-kselftest
>   - rustclang-nightly-lkftconfig-kselftest
>
> Build regression: next-20250915: error[E0425]: cannot find function
> `atomic_read_acquire` in crate `bindings`

Anders bisected this build regressions and found,

# first bad commit:
 [eb57133305f61b612252382d0c1478bba7f57b67]
 rust: sync: Add basic atomic operation mapping framework

>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Build log
> error[E0425]: cannot find function `atomic_read_acquire` in crate `bindings`
>    --> rust/kernel/sync/atomic/internal.rs:124:37
>     |
> 124 |                   $unsafe { bindings::[< $ctype _ $func >]($($c_arg,)*) }
>     |                                       ^^^^^^^^^^^^^^^^^^^^ not
> found in `bindings`
> ...
> 201 | / declare_and_impl_atomic_methods!(
> 202 | |     /// Basic atomic operations
> 203 | |     pub trait AtomicBasicOps {
> 204 | |         /// Atomic read (load).
> ...   |
> 216 | | );
>     | |_- in this macro invocation
>     |
>     = note: this error originates in the macro `impl_atomic_method`
> which comes from the expansion of the macro
> `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z
> macro-backtrace for more info)
> error: aborting due to 34 previous errors
>
> For more information about this error, try `rustc --explain E0425`.
> make[3]: *** [rust/Makefile:553: rust/kernel.o] Error 1
>
>
> ## Source
> * Kernel version: 6.17.0-rc6
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git describe: 6.17.0-rc6-next-20250915
> * Git commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
> * Architectures: arm, arm64 and x86_64
> * Toolchains: gcc (Debian 15.2.0-3) 15.2.0
> * Kconfigs: rust config
>
> ## Build
> * Build log: https://qa-reports.linaro.org/api/testruns/29894207/log_file/
> * Build details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20250915/build/rustgcc-lkftconfig-kselftest/
> * Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/32l4UDzp0FMtS73JeG3kWpcoQrm
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UDzp0FMtS73JeG3kWpcoQrm/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UDzp0FMtS73JeG3kWpcoQrm/config
>
> --
> Linaro LKFT

- Naresh
