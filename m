Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D5372
	for <regressions@lists.linux.dev>; Tue, 15 Jun 2021 21:50:42 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id g4so512477pjk.0
        for <regressions@lists.linux.dev>; Tue, 15 Jun 2021 14:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kAd/yfjnZAJnZ1i9PxYoWIcrrD32M0xPaFynNraifo8=;
        b=TTsvJNuqQMhrf0yczwugM/OX3X5T887jaoeU16Dyq1hM7HpduS6R9dGOlaKseXfo5X
         MU6zYiDkXNoF+6j8/+NuvuGgRVPA4s6s7nQ/vD+qNtnI/fG/mSqUSJKfdQUSDDF6JSLH
         2Z/u+jmcGeMetKZkZO240THoxgYUber3JRYt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kAd/yfjnZAJnZ1i9PxYoWIcrrD32M0xPaFynNraifo8=;
        b=Muo69JNw7JRzuqQwZzJL7R8nnW1pRgANxsLs0jjtni+zell6qB/oF5YTpavJqDMBKE
         vkqmmtuHBW306O0F706cXw+XrnORi2KTr9OitYnLAAy42V7x125JzFzAJgM0TXJGpwZM
         yWPR9/am0sQzUt9RbiKzJQzsEV0lmQjJ34BhGSR/vZodLlPPNsEtjHMF+sIFE68lcYCJ
         J+LyJJzcx6v7SiUOinOuy4tvBN02WvAeivWxqwMc1skrIzsJZ5KtgH/SM3I7CMThGUQB
         Bg2wMasJ4Ty7AP6mTI+MV1DOpdknpIM8gG3/J/YLOInSQSGADLpXh1ZKUUK53noi3fMV
         DXvw==
X-Gm-Message-State: AOAM532dz2Fd+Q+MHLDn5oMRE+LlfZLx3YIwRgupUamIhr8TpuyLJeSO
	UdoH4kBJaOgRXcYEpiCR2nTioA==
X-Google-Smtp-Source: ABdhPJwA4Aam+DpKsfJ7yu4Vz9gKY1XlFRnMbj84CDb4K5smYJN0jRdOx199dU1dc1kdlB96istrpQ==
X-Received: by 2002:a17:90a:1a:: with SMTP id 26mr7076831pja.187.1623793841662;
        Tue, 15 Jun 2021 14:50:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a9sm119023pfo.69.2021.06.15.14.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 14:50:40 -0700 (PDT)
Date: Tue, 15 Jun 2021 14:50:39 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: youling 257 <youling257@gmail.com>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Andrea Righi <andrea.righi@canonical.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	stable <stable@vger.kernel.org>, regressions@lists.linux.dev,
	LSM List <linux-security-module@vger.kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	SElinux list <selinux@vger.kernel.org>
Subject: Re: [PATCH] proc: Track /proc/$pid/attr/ opener mm_struct
Message-ID: <202106151449.816D7DA682@keescook>
References: <20210608171221.276899-1-keescook@chromium.org>
 <20210614100234.12077-1-youling257@gmail.com>
 <202106140826.7912F27CD@keescook>
 <202106140941.7CE5AE64@keescook>
 <CAOzgRdZJeN6sQWP=Ou0H3bTrp+7ijKuJikG-f4eer5f1oVjrCQ@mail.gmail.com>
 <202106141503.B3144DFE@keescook>
 <CAOzgRdahaEjtk4jS5N=FQEDbsZVnB+-=xD+-WtV9zD9Tgbm0Hg@mail.gmail.com>
 <CAHk-=winAqy0sjgog9oEsjoBWOGJscFYEc3-=nvtzbyjTw_b+g@mail.gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=winAqy0sjgog9oEsjoBWOGJscFYEc3-=nvtzbyjTw_b+g@mail.gmail.com>

On Tue, Jun 15, 2021 at 11:19:04AM -0700, Linus Torvalds wrote:
> On Mon, Jun 14, 2021 at 6:55 PM youling 257 <youling257@gmail.com> wrote:
> >
> > if try to find problem on userspace, i used linux 5.13rc6 on old
> > android 7 cm14.1, not aosp android 11.
> > http://git.osdn.net/view?p=android-x86/system-core.git;a=blob;f=init/service.cpp;h=a5334f447fc2fc34453d2f6a37523bedccadc690;hb=refs/heads/cm-14.1-x86#l457
> >
> >  457         if (!seclabel_.empty()) {
> >  458             if (setexeccon(seclabel_.c_str()) < 0) {
> >  459                 ERROR("cannot setexeccon('%s'): %s\n",
> >  460                       seclabel_.c_str(), strerror(errno));
> >  461                 _exit(127);
> >  462             }
> >  463         }
> 
> I have no idea where the cm14.1 libraries are. Does anybody know where
> the matching source code for setexeccon() would be?
> 
> For me - obviously not on cm14.1 - all "setexeccon()" does is
> 
>    n = openat(AT_FDCWD, "/proc/thread-self/attr/exec", O_RDWR|O_CLOEXEC)
>    write(n, string, len)
>    close(n)
> 
> and if that fails, it would seem to indicate that proc_mem_open()
> failed. Which would be mm_access() failing. But I don't see how that
> can be the case, because mm_access() explicitly allows "mm ==
> current->mm" (which the above clearly should be).

Yeah, that was what I saw too.

> youling, can you double-check with the current -git tree? But as far
> as I can tell, my minimal patch is exactly the same as Kees' patch
> (just smaller and simpler).

FWIW, for that patch:

Acked-by: Kees Cook <keescook@chromium.org>
Cc: stable@vger.kernel.org

> 
> Kees, do you see anything?

No, I haven't been able to reproduce the failure. :(

-- 
Kees Cook
