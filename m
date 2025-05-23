Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C840F225405
	for <regressions@lists.linux.dev>; Fri, 23 May 2025 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748002572; cv=none; b=UfPJYhjdNyxjhRG3t5Ys2UXW5B2l7VhXsKKtf0DikeXyYcFcvFvLbOVSChHg7fWggF+i5/00aArYkrYsTpzv53PlGhKMo9HwhMycOOpbDsjcxNIog1lIa8jxoDmvdAR31Rh2tuspqkfOujQem9KaNctz+KkN6Mbv7Ypz0qfX34A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748002572; c=relaxed/simple;
	bh=EgDWebAmLIsMgY7vDv9DECCxG0h/SjOmQ/R1MVSCVoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAgnEtfEbaOvMy4x5ra90J4WtUFp8Xz4wNGtRIdaFsPs7r7wixTxE/tHPRx4R3QcBd7mfbuWt/1vXVtgKeFl3fsQPSBEAI0deYC4P6e4HCbeizSLgCv+UNvonfO3DJE1e2aw0KXJB7CtwLe8FPHPVTocYI9kvbSmcKsQ9AVXemI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x9mtMET0; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x9mtMET0"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5e1b40f68so1071639185a.1
        for <regressions@lists.linux.dev>; Fri, 23 May 2025 05:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748002568; x=1748607368; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V8BApzo+tcGxUQ4qyRc5kFvmPIaCYVT6klZyuYrkTWg=;
        b=x9mtMET0/Ujiu34AdVS+E3wnkHVWv9vL7Q4n2uVCfRsato5dVEpDW3MNw3FZ2mjet4
         01VDL9mivWMYfVNb4EVwVNEpiuYlNgZnJ4r5EYzcFXtRwGE3Fw+3vBZwyqExAsUrqgm3
         iuf9Erya8Fd95S1voVarqUaYZJ5C9YpuB5Y9HfFfdzUVQ7gb+di/erxpxWBImBxcMeJs
         /aDVBmfQP0YYGr6Ra8vwAGMCWkeRBuerK14ME7QC1ksplIGBIQ8foYyJKnjC3NYVpdEP
         rKes5E3BIBplTYVbsiSnVZj+p7Jt6NPbbaDJ/xyAXFNmzNSpwZtREOxckhdkA5qZrn7a
         Tpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748002568; x=1748607368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8BApzo+tcGxUQ4qyRc5kFvmPIaCYVT6klZyuYrkTWg=;
        b=UlrzobMsNxKAxew1GMLleb18s8Bp0EUOws7ZR9mSdzsNgXnPgDnYxV/U1JFGtOAwWN
         o6NlY1lwJ8UqxTQUfjlPdbusIC58wXE1ZGWGqZA9OqhpZ33yTaeRn/D6U2ozf27bqlSt
         GgsHcyU0kAlof+Scg6U3Iqif2gpqbAZ/PSe8rVmOBCZ3hNK8DLMp4PqOIJGGJif0CqvP
         DvefpQ7lYPDzR8huVT3h6YIAS0X/l/K9Ngv5HyNybG346PwJZRrcrTxAvJYuLQiDMOuj
         3pfC7av+Z7Meh5e2R8QjJkYENjxt+F6jJKkTIFQU/5/BzSwRqSekb6poCqfTeTLVRppf
         RY7A==
X-Forwarded-Encrypted: i=1; AJvYcCWsVXSQ6EoN5xeHsOFbmQD0C6v4v+QXy1CWS74HKb600Y2LKWMM1Ka47rfmtgOWKgF0ytQLLUirIDWiqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzbu8Qv94ybXT4bYqKueiar1i48nhQy9ZquRWQsxFNmwP5U4BRQ
	UE56DKudDdRoWvdmpXSZW8+o0v3uHu0TVATQvbp12owK4ihSsYWCERkHEZTAiHJHbfGe1U7muBb
	VswRI/uKd1bp8GmRvzit0nXvu6O6LcIjefBEBVgBePQ==
X-Gm-Gg: ASbGncvaGuLHj/dtMyQQlNEAP3FczVIWOivu5a+BPxF5eL2Z4fvUZ+20X53RAx1SK9n
	UbZ+nttDca6CF3zDPydHHj+4OAzms47BQ15mw4mvwBV1sbgIBx+6d4jVRW4BHHOMa8uuFWmATdb
	dRxbMaAFC8zEgY92jG77JqGX1C73Jh+PZG/Hn2rmN6QijEZxq+SRIY+OU386+/+GM=
X-Google-Smtp-Source: AGHT+IFI9cZTC1Lw+RkjnHQgJAawN/JkLsHsZMeuSEx0h5hDWONvffxErgEONGaLu2y1YUsI+OSBxtKp0HDD02GjIeA=
X-Received: by 2002:a05:620a:45a7:b0:7c5:6410:3a6 with SMTP id
 af79cd13be357-7cee31badcdmr357640685a.27.1748002568177; Fri, 23 May 2025
 05:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYsZPSJ55FQ9Le9rLQMVHaHyE5kU66xqiPnz6mmfhvPfbQ@mail.gmail.com>
 <70d46cd3-80f4-4f5e-b0fc-fa2a6f284404@app.fastmail.com>
In-Reply-To: <70d46cd3-80f4-4f5e-b0fc-fa2a6f284404@app.fastmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 23 May 2025 17:45:56 +0530
X-Gm-Features: AX0GCFsCp7KO-IJd_ns8HQ1m2sgketC1fMATdiktIg7OhSVKCwGOqNM2CvlFqFs
Message-ID: <CA+G9fYs1FMx6Z23i8g-yM-cABvZ4yTmPhfpRs4R1LBoP7Cyo5Q@mail.gmail.com>
Subject: Re: mips gcc-12 malta_defconfig 'SOCK_COREDUMP' undeclared (first use
 in this function); did you mean 'SOCK_RDM'?
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-fsdevel@vger.kernel.org, linux-mips@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Thu, 22 May 2025 at 19:32, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, May 22, 2025, at 15:22, Naresh Kamboju wrote:
>
> > ## Build log
> > net/unix/af_unix.c: In function 'unix_find_bsd':
> > net/unix/af_unix.c:1152:21: error: 'SOCK_COREDUMP' undeclared (first
> > use in this function); did you mean 'SOCK_RDM'?
> >  1152 |         if (flags & SOCK_COREDUMP) {
>
> SOCK_COREDUMP should be defined outside of ARCH_HAS_SOCKET_TYPES.
> How about reducing the scope of that check like this?
>
>       Arnd
>

Thanks for sharing a quick fix patch.
This below patch is applied and build test pass.

Tested-by: Naresh Kamboju  <naresh.kamboju@linaro.org>


> diff --git a/arch/mips/include/asm/socket.h b/arch/mips/include/asm/socket.h
> index 4724a563c5bf..43a09f0dd3ff 100644
> --- a/arch/mips/include/asm/socket.h
> +++ b/arch/mips/include/asm/socket.h
> @@ -36,15 +36,6 @@ enum sock_type {
>         SOCK_PACKET     = 10,
>  };
>
> -#define SOCK_MAX (SOCK_PACKET + 1)
> -/* Mask which covers at least up to SOCK_MASK-1.  The
> - *  * remaining bits are used as flags. */
> -#define SOCK_TYPE_MASK 0xf
> -
> -/* Flags for socket, socketpair, paccept */
> -#define SOCK_CLOEXEC   O_CLOEXEC
> -#define SOCK_NONBLOCK  O_NONBLOCK
> -
>  #define ARCH_HAS_SOCKET_TYPES 1
>
>  #endif /* _ASM_SOCKET_H */
> diff --git a/include/linux/net.h b/include/linux/net.h
> index 139c85d0f2ea..f60fff91e1df 100644
> --- a/include/linux/net.h
> +++ b/include/linux/net.h
> @@ -70,6 +70,7 @@ enum sock_type {
>         SOCK_DCCP       = 6,
>         SOCK_PACKET     = 10,
>  };
> +#endif /* ARCH_HAS_SOCKET_TYPES */
>
>  #define SOCK_MAX (SOCK_PACKET + 1)
>  /* Mask which covers at least up to SOCK_MASK-1.  The
> @@ -83,8 +84,6 @@ enum sock_type {
>  #endif
>  #define SOCK_COREDUMP  O_NOCTTY
>
> -#endif /* ARCH_HAS_SOCKET_TYPES */
> -
>  /**
>   * enum sock_shutdown_cmd - Shutdown types
>   * @SHUT_RD: shutdown receptions
>
>
