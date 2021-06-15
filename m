Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485C1173
	for <regressions@lists.linux.dev>; Tue, 15 Jun 2021 01:55:37 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id 7-20020a9d0d070000b0290439abcef697so7328894oti.2
        for <regressions@lists.linux.dev>; Mon, 14 Jun 2021 18:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=brCiM+F9mGjut7Dannz5jBzKbs3SodWAdjrUja4GsqQ=;
        b=HEnAn1olYigaQNwMq7Pg7M9qQXgha1+G3M8Te9QROcv+UPfHbzA+pyQiY/uyUplDho
         syI/EJ0aS5ILxHohmJkYvgPeUXUvFw0UJ+48gj22wbC9kvUQClmfmZLzrrJbqUr54NI0
         XIPfavRvfpItyC7jNpihhrsAwdizq3bVqYy7pjJaGlXxf3djw8Jxhaht1pwkyi2g4zHJ
         FBd13UJ9//BjvbwrXSxXwhNaY/NP7dlPuCEN+qXeWFvbgTzpKowrQL5FWyqdTsKjKqa6
         /fQvn05zs7IeWE/WtYl+/6FFwsh8P8pcdZxWFaHG//HqMHlmCCUOI3OY9ukreN48hS1s
         4Y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=brCiM+F9mGjut7Dannz5jBzKbs3SodWAdjrUja4GsqQ=;
        b=p7zLTKQCs/jzIxYTJOTsayWGH27Toy0/sNENMzofPdj5Q6w9soI/O55D0DKnortuUA
         P98wQbPHlIY8YqsfS4/WVf3xst2Y+y4PrNmuoGrv1r2FejaGxvuU4+nSZTxBatMqhROQ
         ChhU+Dps58QxrC2hePjZ2il6QublKhwLwVvmkOkqj8L9JkK7nMeGCP6OSUeL0h0xsxJC
         OmXK2l85x3+vDkyLY4MAGN/5TQ0CMorXyk3bOcmI6FKlfmT53rZV3lMgvKI1pITcNN8g
         BAfb1HLcrULySIJ30J+hRYBVbqgre10yvgXEsaDkktkqSYW3SWAn4QIhCGgo5g4aufWe
         p14A==
X-Gm-Message-State: AOAM5308f6Ya+C02zgGdP3ne/DAbqfnGTV9w8fApF68uI8Uad4EGqaIo
	ZSfy3vZrpfUovuS0yrna/HoW98Y/0sxcSLYzLNU=
X-Google-Smtp-Source: ABdhPJyUqha2rTwXMjRmWbkZlGSaerkycxLOhzZXfvz9QhQZI+3ohv8S/fa3vJSq4wM88YAm4nAw8FYUi/yX/sKJTsg=
X-Received: by 2002:a9d:730a:: with SMTP id e10mr13703661otk.97.1623722136501;
 Mon, 14 Jun 2021 18:55:36 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a9d:f03:0:0:0:0:0 with HTTP; Mon, 14 Jun 2021 18:55:35 -0700 (PDT)
In-Reply-To: <202106141503.B3144DFE@keescook>
References: <20210608171221.276899-1-keescook@chromium.org>
 <20210614100234.12077-1-youling257@gmail.com> <202106140826.7912F27CD@keescook>
 <202106140941.7CE5AE64@keescook> <CAOzgRdZJeN6sQWP=Ou0H3bTrp+7ijKuJikG-f4eer5f1oVjrCQ@mail.gmail.com>
 <202106141503.B3144DFE@keescook>
From: youling 257 <youling257@gmail.com>
Date: Tue, 15 Jun 2021 09:55:35 +0800
Message-ID: <CAOzgRdahaEjtk4jS5N=FQEDbsZVnB+-=xD+-WtV9zD9Tgbm0Hg@mail.gmail.com>
Subject: Re: [PATCH] proc: Track /proc/$pid/attr/ opener mm_struct
To: Kees Cook <keescook@chromium.org>
Cc: torvalds@linux-foundation.org, christian.brauner@ubuntu.com, 
	andrea.righi@canonical.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, regressions@lists.linux.dev, 
	linux-security-module@vger.kernel.org, Paul Moore <paul@paul-moore.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

if try to find problem on userspace, i used linux 5.13rc6 on old
android 7 cm14.1, not aosp android 11.
http://git.osdn.net/view?p=android-x86/system-core.git;a=blob;f=init/service.cpp;h=a5334f447fc2fc34453d2f6a37523bedccadc690;hb=refs/heads/cm-14.1-x86#l457

 457         if (!seclabel_.empty()) {
 458             if (setexeccon(seclabel_.c_str()) < 0) {
 459                 ERROR("cannot setexeccon('%s'): %s\n",
 460                       seclabel_.c_str(), strerror(errno));
 461                 _exit(127);
 462             }
 463         }

2021-06-15 6:50 GMT+08:00, Kees Cook <keescook@chromium.org>:
> On Tue, Jun 15, 2021 at 02:46:19AM +0800, youling 257 wrote:
>> I test this patch cause "init: cannot setexeccon(u:r:ueventd:s0)
>> operation not permitted.
>> init ctrl_write_limited.
>
> Thanks for testing!
>
> This appears to come from here:
> https://github.com/aosp-mirror/platform_system_core/blob/master/init/service.cpp#L242
>
>
> In setexeccon(), I see (pid=0, attr="exec"):
>
>         fd = openattr(pid, attr, O_RDWR | O_CLOEXEC);
> ...
>                         ret = write(fd, context2, strlen(context2) + 1);
> ...
>         close(fd);
>
>
> and openattr() is doing:
> ...
>                 rc = asprintf(&path, "/proc/thread-self/attr/%s", attr);
>                 if (rc < 0)
>                         return -1;
>                 fd = open(path, flags | O_CLOEXEC);
> ...
>
> I'm not sure how the above could fail. (mm_access() always allows
> introspection...)
>
> The only way I can understand the check failing is if a process did:
>
> open, exec, write
>
> But setexeccon() is not doing anything between the open and the write...
>
> I will keep looking...
>
> -Kees
>
> --
> Kees Cook
>
