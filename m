Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ABE13E6B8
	for <regressions@lists.linux.dev>; Wed,  3 Apr 2024 08:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712131845; cv=none; b=iBITQWJQIdlX5t5VJ4GJNitL57hz5reViUIxMdxwMij/ZoLZRtg2VLPAZTp9bGKRN01cbXxnFi8KSPu8cgGsS6czxbQeNm0+E0Z7zgT4Tyj0kZyDzb3eUDjirxJn9GPH2X/+SMCUMpOE42ouIwvuxZglj3frKO8LSxDYcC8RYEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712131845; c=relaxed/simple;
	bh=JQej1iAsVr2TqEOU6xUOK3SA6orz4U3TJduit2FBqSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FCjVYMah+qf2hA6Grgd1C0rKoQJDPkm++/sA4jMT/1ArD3KNBbVKMVd66UqwlE79MYfTh9/9P/vXBOMMxOM7y8vXDqbGGeLL29AVtUWzl9kmY9rCVjNUnCfRHEu0SCRDrUbItgzJzGpvkAVGSiosyD96lB+auZaoQSmht/5Q530=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com; spf=pass smtp.mailfrom=isovalent.com; dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b=gHX1xTda; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isovalent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b="gHX1xTda"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d82713f473so32805501fa.3
        for <regressions@lists.linux.dev>; Wed, 03 Apr 2024 01:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1712131842; x=1712736642; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqLYHHBoVd2DZSBiZsMfamZXMWNtMZVCVqKJsSa6oQo=;
        b=gHX1xTdaupDMe+OVM90wt8OXa91a/qfZ32m968Qi4sS8JhsOpKSHbSvSGOsQpp453C
         yY8y1v391zh8iWzzaamL6LQs49Wto0OlPZuFU1Zihg2sRYqMcfDRKilYpcqZXmuchtoV
         4zoocw1graWK6MZOV8HD8F76gwi1rdXigCKOS0/uI9KUG2ePF7NQzbZ3OmE2Lwxzsi10
         mKmkm3WU90/DYZyzUPlPwEAOYe4836kZyezz7dOmff/JeUICs4nwQoXwA7XppE3nrJyL
         32ooR2mXzE3eG8Nh3BqoUvxday8VtLN6dLPyppsBAvEjDkxiEU0B9zeJPoMVX9aNsTDJ
         G09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131842; x=1712736642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqLYHHBoVd2DZSBiZsMfamZXMWNtMZVCVqKJsSa6oQo=;
        b=aNJW76ulR9gRDejD8JuWxjrfFSwblbrX7xlUpW/cvAG0cbIESByvQn7hZmSZAji4nF
         Nk3CxEfG6rHBmm3/oC5JFHHDbeHNB63K7RdJ1XMRwadhedF2DJvXF9pnS7zL6QD36/IM
         fRFhClRRaj4NT72Iy99fImrO7hVNmMHLR4I+zEzh7f8OCEfkcn0zbzm7xlX3cYIo0DtZ
         oJ8m+2MRRLfqH9cxvXl05dcJPSgFauRL0/PnRG6bB9700jJNFXj/oeP5Fg/qTEhLtzjC
         arprezIXIlZ0vOGoLjzekFH6Xm3o2bsUG2TfLNnq3qTFuOxeNCXqWH1gt5TN+6RXet7D
         /nkA==
X-Forwarded-Encrypted: i=1; AJvYcCVCjBScu6d/BJ0LE14eirHOk6aThe5749eThpxc/OdyemUwV9k+DN+RPGrCMrAE9pxi+QjgWOQWQJQ8TFNlviFmqpxTs8WDjDyoOVU=
X-Gm-Message-State: AOJu0Yy+snM9/qj/gq7S6z6lQzoxDEd4uYIuSpYcEjKDf03CxLwilHH7
	r9dpCoQ9dQgk7e+6cRdpG0ofbeT8dHjoxEv8gsfxotqV9uxIgg3BImgnC6ubTv0Yje5SM+6hBuJ
	Mbm79D8v4s7p2ly40c/4bQx/Lby7vR3BvPTEW7w==
X-Google-Smtp-Source: AGHT+IHPLv/xQnUbFIUE+E5TYWgeyNX14zVo3bYPItcgeCHpJd9YtvoRLtdQKSVHg9o25tQy5l1Xqdog/FZOgL7D2E4=
X-Received: by 2002:a05:651c:503:b0:2d8:2766:d66b with SMTP id
 o3-20020a05651c050300b002d82766d66bmr3707003ljp.3.1712131842238; Wed, 03 Apr
 2024 01:10:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtsoP51f-oP_Sp5MOq-Ffv8La2RztNpwvE6+R1VtFiLrw@mail.gmail.com>
In-Reply-To: <CA+G9fYtsoP51f-oP_Sp5MOq-Ffv8La2RztNpwvE6+R1VtFiLrw@mail.gmail.com>
From: Anton Protopopov <aspsk@isovalent.com>
Date: Wed, 3 Apr 2024 10:10:31 +0200
Message-ID: <CAPyNcWeu+bzyQg9S3wDb43jbfk95Su5XcSRFPzUbS2ofZ=+5Fg@mail.gmail.com>
Subject: Re: include/linux/build_bug.h:78:41: error: static assertion failed:
 "struct bpf_fib_lookup size check"
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, David Ahern <dsahern@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, aleksander.lobakin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2024 at 10:03=E2=80=AFAM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> The arm footbridge_defconfig failed with gcc-13 and gcc-8 on Linux next
> starting from next-20240328..next-20240402.
>
> arm:
>   build:
>     * gcc-8-footbridge_defconfig - Failed
>     * gcc-13-footbridge_defconfig - Failed
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> In file included from include/linux/bitfield.h:10,
>                  from arch/arm/include/asm/ptrace.h:13,
>                  from arch/arm/include/asm/processor.h:14,
>                  from include/linux/prefetch.h:15,
>                  from arch/arm/include/asm/atomic.h:12,
>                  from include/linux/atomic.h:7,
>                  from net/core/filter.c:20:
> include/linux/build_bug.h:78:41: error: static assertion failed:
> "struct bpf_fib_lookup size check"
>    78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>       |                                         ^~~~~~~~~~~~~~

Thanks, I will take a look today

> Steps to reproduce:
> ------
> # tuxmake --runtime podman --target-arch arm --toolchain gcc-13
> --kconfig footbridge_defconfig
>
> Links:
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-202404=
02/testrun/23264362/suite/build/test/gcc-13-footbridge_defconfig/details/
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2eWtBPKv1yM8gfZ=
JC8GkEkxN2j8/
>
> --
> Linaro LKFT
> https://lkft.linaro.org
