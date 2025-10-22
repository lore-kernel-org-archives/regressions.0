Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB2634C9A3
	for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 15:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761145335; cv=none; b=AyqAUhbkQ+WfSYbhu5KguSyY2f4UqrqwKux42nT162Ta57fHLJCV0vkiE5DjeaQVyqGZ7w29K2fLOI4sPJV448R+l9lfAp8rkcUYm2RUwkIuj/sVlPrvbVNx5wRQUIWTStG/kIyPDlZI7Q5i0Rk6We/MObvv/drIh5aXVoC0qR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761145335; c=relaxed/simple;
	bh=hdYfR8VgCU1ZspHH5xOZyDRebDxd3yGnO9egZSHcGHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bP3Fpf0cZdBOlfkTXsxlbBqY2ZJFKvzVcrOgbPP4N9KxwssoI6vlhQO9lg8BltcPVuDla1P7eTAk0YCk1Y34dqFGXkb3+KTNiZTOFLIgh91MQ8IPvYfgA2s7RkGMCAexqxaZHQASGInfF0soozCwSSPUVhx9yuESHLJNSF53fg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IAwr8EYg; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IAwr8EYg"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-87bbee3ba76so2920476d6.1
        for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 08:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761145333; x=1761750133; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BnIAOSj9hN5H1aKf2wyJor6fNQ1bM8Ks2ytqG7kDK1w=;
        b=IAwr8EYgu8Tgh1Kj5g7NyVFKyyY6ZgFxbqUzfGTVJxof/dNHjrG1C+ZEMt6OdZWjpv
         c7KbJ4rc/uEHb9YF8RbNNi7C2DkJ3piMLyXMWt8f2sH15cLDLZsC6lAxSspYI92HZ7y+
         Y9cwHuRVZVlp+T9dvh1jpkDzh9DV26uoE8fA8q5qlBg+H0jMAAWltBNaiHgsAdQ7Blaz
         h+7QsDFDzfQsDvydtAHbdV2auIj6Tg7uBv3erH0XXJJXq7nkdZ+eFJxJuM3VLoK3+u2K
         8plggmJHknZuBBLVjyVN81YTJApnJrThIQSrAKdqSvyb0eXYyTdHn03hrQbhwHoYrkiO
         Nq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761145333; x=1761750133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnIAOSj9hN5H1aKf2wyJor6fNQ1bM8Ks2ytqG7kDK1w=;
        b=Rt/03uANmLDd+4qo5C4UZon5zpOWisLKwXdnBelaIfeyuLlxcg8ZcVhSyZ35RIZZle
         IXiCHO536Jm4Q/PUpbRqsLx57YYBpuoLCmvydfXvV8uqQMzcZBjouvFMoVJKDa6QHms7
         +QGBG+hMiaEEKt6E4nzdi5wHWZuczmE8uNNh3XaTSVMLFqJsMPTXM6HlSX3ldK3ZYy+1
         gLOb32ie3idBlEAVw9mB4/hk3cMZxlUJsNHaOc8qpbrFxhtl41/eRvSoi9fwpgl591jt
         dN8Ha1iGgrnC17rvZ3S+O9rCvsvIdCtgCzsJOgTWB1Va7NIk5+8uujgZM2qbfra24+/9
         hPMw==
X-Forwarded-Encrypted: i=1; AJvYcCUSNRY46X4eAs4qpcoyM8srQ7JTTAKGHhwU2GeyVSvkEwxWGfyF0jBHiYSANZ2+zAzwKxwTCHjT2pGbxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/v8oTyT+C8GW22JKbTnRsiact9E7ytfVz677YG8kznv33jAHD
	8Em2AbivwXiMduPH8FnrrJVNJJfwBP0HAVGu15TOjd1hAWhi9btBuW209jVhzAH6XaTdi3QwQsG
	VvnCnoPxZ3q7wp4vXkA+dgF5DjkhYBlDLl6vICdRzsA==
X-Gm-Gg: ASbGnctxQD1xFd7keG3Mo63t7UUKJKNdxN0YAq/qwn48ePJ6iArcIcHoWfgMwovrrrX
	P6/Syu2SwX7LL6hWkAt0QEoO1bODWPck39vVViwvQMmcJpWMoWVoquIY/stSi2doJ5VRhacPvOm
	4R/pD/g6X33TQkdF2t3rmQLCKVqSlRleT42T+7p1bZcqVWR+x3twA16GQ7StvwfwT4LMpEzD+De
	rFtl7io+fMYmSrcxhKUhC/pHVPSGLvfTRGBac9jMOcCTusr45caPrivOiaDQGkw5y3KQQ==
X-Google-Smtp-Source: AGHT+IHDNBWFGq/lO9UqX3OiuCVmV8mj/OamM0dXHm9H8/TY++90uwy4eHmeOOO7ME2KeAOXQVNRoq9F5JuwtjkDp/g=
X-Received: by 2002:a05:6214:19c6:b0:87d:f8d3:2456 with SMTP id
 6a1803df08f44-87df8d324a4mr21664096d6.2.1761145331914; Wed, 22 Oct 2025
 08:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvKjQcCBMfXA-z2YuL2L+3Qd-pJjEUDX8PDdz2-EEQd=Q@mail.gmail.com>
 <20251022062948.162852-1-reddybalavignesh9979@gmail.com>
In-Reply-To: <20251022062948.162852-1-reddybalavignesh9979@gmail.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Wed, 22 Oct 2025 17:02:00 +0200
X-Gm-Features: AS18NWDwE4wLtG7BZRqK8s-_yLrQzlCdiI_YRXplah4qDB6dhd-o_z_6gw0x-cw
Message-ID: <CADYN=9KxQaQMWNbwDSftj7kcBYHjAQPacE+z7AVRZwxPTpexYQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/x86: Add selftests include path for kselftest.h
 after centralization
To: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
Cc: naresh.kamboju@linaro.org, broonie@kernel.org, arnd@arndb.de, 
	benjamin.copeland@linaro.org, bp@alien8.de, dan.carpenter@linaro.org, 
	dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, lkft-triage@lists.linaro.org, 
	mingo@redhat.com, regressions@lists.linux.dev, richard.weiyang@gmail.com, 
	shuah@kernel.org, surenb@google.com, tglx@linutronix.de, x86@kernel.org, 
	linux-kernel-mentees@lists.linux.dev, 
	Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Oct 2025 at 08:29, Bala-Vignesh-Reddy
<reddybalavignesh9979@gmail.com> wrote:
>
> The previous change centralizing kselftest.h include path in lib.mk
> caused x86 selftests to fail, as x86 Makefile overwrites CFLAGS using
> ":=", dropping the include path added in lib.mk. Therefore, helpers.h
> could not find kselftest.h during compilation.
>
> Fix this by adding the tools/testing/sefltest to CFLAGS in x86 Makefile.
>
> Fixes: 4d89827dfb27 ("selftests: complete kselftest include centralization")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/lkml/CA+G9fYvKjQcCBMfXA-z2YuL2L+3Qd-pJjEUDX8PDdz2-EEQd=Q@mail.gmail.com/T/#m83fd330231287fc9d6c921155bee16c591db7360
>
> Signed-off-by: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>

Yes, works.

Tested-by: Anders Roxell <anders.roxell@linaro.org>


Cheers,
Anders

> ---
>  tools/testing/selftests/x86/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
> index 83148875a12c..434065215d12 100644
> --- a/tools/testing/selftests/x86/Makefile
> +++ b/tools/testing/selftests/x86/Makefile
> @@ -36,6 +36,7 @@ BINARIES_32 := $(patsubst %,$(OUTPUT)/%,$(BINARIES_32))
>  BINARIES_64 := $(patsubst %,$(OUTPUT)/%,$(BINARIES_64))
>
>  CFLAGS := -O2 -g -std=gnu99 -pthread -Wall $(KHDR_INCLUDES)
> +CFLAGS += -I $(top_srcdir)/tools/testing/selftests/
>
>  # call32_from_64 in thunks.S uses absolute addresses.
>  ifeq ($(CAN_BUILD_WITH_NOPIE),1)
> --
> 2.43.0
>
