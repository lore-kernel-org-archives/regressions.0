Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743562101
	for <regressions@lists.linux.dev>; Sun,  2 Jul 2023 14:11:26 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-55ba895d457so12865a12.0
        for <regressions@lists.linux.dev>; Sun, 02 Jul 2023 07:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688307086; x=1690899086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ivs+q0bj7Qjxz2IiyBr82w8PQwpyo1fbvjPNqY7ooY=;
        b=CUwaDrb2T9ha5dPZ3V9rZp++iApzuUxp1qBYCNzDSosdkRYW6xDmU61B8d2TjF8jV1
         Z6hDLNIVgWIQEFbPTrXMwbexw8Hjzo6X2cI3VIfkbJdNPE9u8qvr5TNDxJ1Jr3bNmfiZ
         hq8yzLDHUGUodCSFAXYukebMlceqfXW7viUFU9f/joifL78AOmyOlI+QdPFZA/hkJpvt
         +41Fa+kGcPjfpHL8v1Lp9OoyDzLEoQEi8HIrOFNbs8lc2YitP7uwhm2SFeCAARPdXzWn
         AA5Qfu8tYii59oy2mJ8L9GODyZCB/EJQ6QeKiOE5PAgAqWeMvvbm6YQbGYeRqsAB24md
         LeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688307086; x=1690899086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ivs+q0bj7Qjxz2IiyBr82w8PQwpyo1fbvjPNqY7ooY=;
        b=PR/rhlu9kLZEqPTLjjaAAIWx6C7WYlkj+yv4INvNhU540skG6yg6StnIHuhQ3dcCa6
         9JoarMOvYOKCdkbVPhbuZMzxydRol7SqSBk1ktw4p6dv6u0jE5sReGuFZqDrOGUwPhg1
         owPJ7Ov/ueA8OVhhTuOod/6QYHv4n/Ap9e+3o6S47PwLI4KEQax1eRwgzfcqNsZyEGIy
         0W9USFRSOnVQb18VN53k+HJf5LX18GCsjj30roHC4tUkkrLyUONEH6KRSjFra1Pfd+ch
         xy5hGfwq+yAehk4k7aoBB8hKI+0znix5Cozy+uZXqWP1qq5GopR9qilt1e3YWLRuumNS
         M2/A==
X-Gm-Message-State: ABy/qLYV/jJldyiAx1HvctEzGm50UVA+t0nDNFc7Kus1FA4Lib8LYg0b
	T8E7Wes9eUEU2ZCLbdLb1Iw=
X-Google-Smtp-Source: APBJJlGvN2Usr+JzDs2tOPcsiSrDfp1sHI7MMhqo/KzQjMYzTVozbL/PHOEn8emK002vzeudgn6NhQ==
X-Received: by 2002:a05:6a20:6a0f:b0:119:5af7:7cef with SMTP id p15-20020a056a206a0f00b001195af77cefmr7833284pzk.56.1688307085745;
        Sun, 02 Jul 2023 07:11:25 -0700 (PDT)
Received: from [192.168.0.103] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id x48-20020a056a000bf000b0062cf75a9e6bsm1589746pfu.131.2023.07.02.07.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 07:11:25 -0700 (PDT)
Message-ID: <306e4057-5e40-f0c1-d06b-2adab0eee37d@gmail.com>
Date: Sun, 2 Jul 2023 21:11:15 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Memory corruption in multithreaded user space program while
 calling fork
Content-Language: en-US
To: Jacob Young <jacobly.alt@gmail.com>
Cc: Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Laurent Dufour <ldufour@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Memory Management <linux-mm@kvack.org>,
 Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <CALrpxLe2VagXEhsHPb9P4vJC97hkBYkLswFJB_jmhu1K+x_QhQ@mail.gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CALrpxLe2VagXEhsHPb9P4vJC97hkBYkLswFJB_jmhu1K+x_QhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/2/23 19:40, Jacob Young wrote:
>> Jacob: Can you repeat bisection please? Why did you skip VMA lock-based
> page fault commits in your bisection?
> 
> All skips were due to compile errors of the form:
> make[3]: 'install_headers' is up to date.
> In file included from ./include/linux/memcontrol.h:20,
>                  from ./include/linux/swap.h:9,
>                  from ./include/linux/suspend.h:5,
>                  from arch/x86/kernel/asm-offsets.c:14:
> ./include/linux/mm.h: In function ‘vma_try_start_write’:
> ./include/linux/mm.h:702:37: error: ‘struct vm_area_struct’ has no member named ‘vm_lock’
>   702 |         if (!down_write_trylock(&vma->vm_lock->lock))
>       |                                     ^~
> ./include/linux/mm.h:706:22: error: ‘struct vm_area_struct’ has no member named ‘vm_lock’
>   706 |         up_write(&vma->vm_lock->lock);
>       |                      ^~
> make[1]: *** [scripts/Makefile.build:114: arch/x86/kernel/asm-offsets.s] Error 1
> make: *** [Makefile:1286: prepare0] Error 2
> 

1. Please don't send HTML emails as mailing lists reject them.
2. Reply inline with appropriate context, rather than top-post reply.

-- 
An old man doll... just what I always wanted! - Clara

