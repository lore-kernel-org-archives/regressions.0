Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E373D0AB
	for <regressions@lists.linux.dev>; Tue, 19 Dec 2023 21:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RQgLvztx"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-67f296ecb2dso935486d6.0
        for <regressions@lists.linux.dev>; Tue, 19 Dec 2023 13:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703020446; x=1703625246; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=efdDlqQgem1GV68sY9Evu8RPx7CsBPJfCZoB2vl3zCQ=;
        b=RQgLvztxcC1+QmjLWxCO/ZPblXtVrJMg93n5VaVGv7kId5qlSm4yQZb88kPTq6SO1d
         EFjoOM+1Qoil9oxwNjhlvNb88I1x95dSMu4Jsf7wtEJh1k+yv+GGTDXlc3So3YpFpvWC
         Q4X4z2N9Waf2rNQOjD49v48NhgBf4g3UfguD1276n5hVPuvFqr+NpKR/JljiZuoWIK4L
         urjwvjN9g0WejnthXx7VeIPGKKIToaiq4j5qGe9SiC/ogG6ddZiEXhp/pcgzDaC75fKK
         sQ4T76A3QddUATHCfxrOr+MotymKF4pFM69tQHMyzmaj1Kn9r+TUBOyD3x3CDCqpocn7
         vWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703020446; x=1703625246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efdDlqQgem1GV68sY9Evu8RPx7CsBPJfCZoB2vl3zCQ=;
        b=wB1lg0Iy8Tr6WjiWe3TgWwvwTzy89RL38qYeIt6ymFz49+eswpVV4ldq9RM+NEZdy5
         s7G7nhj0Gpr+ABSYInvmCTUvvOyVYTzLoIupXES27zKUg52PpQdYwVbFi2rAhD+nGkXL
         k/JWBl8QxuZkdnvqq4BQz9EpvBC1dwIVV1qZxWxvZUTzTfx6/6fIE4oGUyojU9DCM2Li
         70Lvu4FIdUET2+EExsvLtpqt4ektk7WhXFDXYJ/Pn8Q4uQ6JFy+ygLzHy4Noq4o0kYGh
         TBvaYrIz+KTQXzXpJejqYJ8MhAS4TaftVxD/7LsOZ7r9IhWWjhrv4dm5Jmq0MRku2H9i
         C3jQ==
X-Gm-Message-State: AOJu0Yx19IE1mqm4tLh++TNSdwK7RvqX3od3JFqWs9XZBdRZ2YNfkMga
	ROSMf2YrdQuQpBSw6btsSmNdRECMZF7j76J8cOTStelt6jlzuQ==
X-Google-Smtp-Source: AGHT+IFobik1ylGwXr3iv3I5WAIKPqAnQhbfTy4ui2FkXLbr3sE8gKMG08pMKsxnMbUs2hiaAA4Q9JwpDHtcFlEsqrw=
X-Received: by 2002:ad4:5ae9:0:b0:67a:a72d:fbc1 with SMTP id
 c9-20020ad45ae9000000b0067aa72dfbc1mr2384711qvh.63.1703020446393; Tue, 19 Dec
 2023 13:14:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvq+wdDhTjR2YkULF-_-nQNPGzCeOON-08EbVyidj-J6w@mail.gmail.com>
 <CADYN=9+0stxkNLkqcbodZD879r8DACT1M-3QyZrt4JsrAi0E1Q@mail.gmail.com> <20231219204821.vok7nch6knn2bhgo@moria.home.lan>
In-Reply-To: <20231219204821.vok7nch6knn2bhgo@moria.home.lan>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 19 Dec 2023 22:13:55 +0100
Message-ID: <CADYN=9+9xi8k5PxuHKaux-=-zRGei5xUfr+gJYTQWD13HD34sA@mail.gmail.com>
Subject: Re: arch/parisc/mm/init.c:534:29: error: invalid application of
 'sizeof' to incomplete type 'struct shmid64_ds'
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-parisc <linux-parisc@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Dec 2023 at 21:48, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>

[...]

> > Revering this patch made it build.
>
> Thanks, I've applied the following fixup:

That fixed it.

> commit ab6400d24d17e5248cbb0db37a56745554e6b6a5
> Author: Kent Overstreet <kent.overstreet@linux.dev>
> Date:   Tue Dec 19 15:47:45 2023 -0500
>
>     fixup! shm: Slim down dependencies
>

Tested-by: Anders Roxell <anders.roxell@linaro.org>

> diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
> index a2a3e89f2d9a..f876af56e13f 100644
> --- a/arch/parisc/mm/init.c
> +++ b/arch/parisc/mm/init.c
> @@ -33,6 +33,7 @@
>  #include <asm/msgbuf.h>
>  #include <asm/sparsemem.h>
>  #include <asm/asm-offsets.h>
> +#include <asm/shmbuf.h>
>
>  extern int  data_start;
>  extern void parisc_kernel_start(void); /* Kernel entry point in head.S */
