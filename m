Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140312FB2
	for <regressions@lists.linux.dev>; Tue, 15 Jun 2021 18:19:23 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id bp38so28590561lfb.0
        for <regressions@lists.linux.dev>; Tue, 15 Jun 2021 11:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Av+6lPQlyv+Sn6WN/JAS+BG6bGNrpjaP5opx8sV0nnc=;
        b=WQuQwtCiT/eoKl6qV5lHYx4lH+0EDr7+nOJYQ1h6yvBunl0woPiervNHkI2DWuHNMS
         q2DNf1dI8WkF30DAo2o970Na/Exs7H+KKRGluFxJ9QUdoPaAT85CHvggye+xAbjL8yy7
         H4ASmIp9BBpePbCJfnUYj3imRXf4Pc4Dds7lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Av+6lPQlyv+Sn6WN/JAS+BG6bGNrpjaP5opx8sV0nnc=;
        b=PNqX8MtqoAGvHCX9EG7/LR5gf2sOtKYhmb52yfuTUTknI8OG6etoAbGZ5DxD4gUlPI
         IE+ClkzBHtupfqABPuquPtC6AMBhDl4em400LjQbR55rON6A8CaXSMmJkdn29ecbVuSC
         Sp1T9YU9nFs2/rMPsEI6T/7csAmhKFs2P1Mgc2vVCnlYl9cEU3lpssNCzDNRWMZaipXJ
         FXoRb+rhRrxB25lzO2rAA18+zp2syEUWL+YJzZlIWygNTZKLHyOULUFMMdWjJ9zr6iSp
         Yn09MJKlNchwPHMGEIgAk8FV564vMoQDOWyUFvH89JDVTAQYnb23F3XwXNOUzJOBJDAz
         DUrA==
X-Gm-Message-State: AOAM531W7IiEZW9iHM+UwZD5M+a1Q8lkPsC5XU3OV7H/Qv8rLGFpdx4D
	iMgT0Axn8PTVsaWnX+jItrA+gLSvHMfcXbkS
X-Google-Smtp-Source: ABdhPJybLNaPLJ6boSqibYV9rlG8FN17HqmL308/3+thKsaC/e4TIou5RtUBWfUfxQ1ctmREpLTJjg==
X-Received: by 2002:a05:6512:926:: with SMTP id f6mr514756lft.552.1623781161915;
        Tue, 15 Jun 2021 11:19:21 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id f14sm2253204ljk.42.2021.06.15.11.19.20
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 11:19:21 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id m21so28442552lfg.13
        for <regressions@lists.linux.dev>; Tue, 15 Jun 2021 11:19:20 -0700 (PDT)
X-Received: by 2002:a05:6512:374b:: with SMTP id a11mr468018lfs.377.1623781160087;
 Tue, 15 Jun 2021 11:19:20 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210608171221.276899-1-keescook@chromium.org>
 <20210614100234.12077-1-youling257@gmail.com> <202106140826.7912F27CD@keescook>
 <202106140941.7CE5AE64@keescook> <CAOzgRdZJeN6sQWP=Ou0H3bTrp+7ijKuJikG-f4eer5f1oVjrCQ@mail.gmail.com>
 <202106141503.B3144DFE@keescook> <CAOzgRdahaEjtk4jS5N=FQEDbsZVnB+-=xD+-WtV9zD9Tgbm0Hg@mail.gmail.com>
In-Reply-To: <CAOzgRdahaEjtk4jS5N=FQEDbsZVnB+-=xD+-WtV9zD9Tgbm0Hg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Jun 2021 11:19:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=winAqy0sjgog9oEsjoBWOGJscFYEc3-=nvtzbyjTw_b+g@mail.gmail.com>
Message-ID: <CAHk-=winAqy0sjgog9oEsjoBWOGJscFYEc3-=nvtzbyjTw_b+g@mail.gmail.com>
Subject: Re: [PATCH] proc: Track /proc/$pid/attr/ opener mm_struct
To: youling 257 <youling257@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Christian Brauner <christian.brauner@ubuntu.com>, 
	Andrea Righi <andrea.righi@canonical.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, 
	regressions@lists.linux.dev, LSM List <linux-security-module@vger.kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 14, 2021 at 6:55 PM youling 257 <youling257@gmail.com> wrote:
>
> if try to find problem on userspace, i used linux 5.13rc6 on old
> android 7 cm14.1, not aosp android 11.
> http://git.osdn.net/view?p=android-x86/system-core.git;a=blob;f=init/service.cpp;h=a5334f447fc2fc34453d2f6a37523bedccadc690;hb=refs/heads/cm-14.1-x86#l457
>
>  457         if (!seclabel_.empty()) {
>  458             if (setexeccon(seclabel_.c_str()) < 0) {
>  459                 ERROR("cannot setexeccon('%s'): %s\n",
>  460                       seclabel_.c_str(), strerror(errno));
>  461                 _exit(127);
>  462             }
>  463         }

I have no idea where the cm14.1 libraries are. Does anybody know where
the matching source code for setexeccon() would be?

For me - obviously not on cm14.1 - all "setexeccon()" does is

   n = openat(AT_FDCWD, "/proc/thread-self/attr/exec", O_RDWR|O_CLOEXEC)
   write(n, string, len)
   close(n)

and if that fails, it would seem to indicate that proc_mem_open()
failed. Which would be mm_access() failing. But I don't see how that
can be the case, because mm_access() explicitly allows "mm ==
current->mm" (which the above clearly should be).

youling, can you double-check with the current -git tree? But as far
as I can tell, my minimal patch is exactly the same as Kees' patch
(just smaller and simpler).

Kees, do you see anything?

           Linus
