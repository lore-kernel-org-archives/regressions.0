Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A4471
	for <regressions@lists.linux.dev>; Wed, 16 Jun 2021 05:15:27 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id u11so1257750oiv.1
        for <regressions@lists.linux.dev>; Tue, 15 Jun 2021 22:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=akhpjntg7HyXXTFsNY4Qr1MazMZPbD3dXpnqhhn5BUY=;
        b=LYTslNfz90SayNkSwh+aMWF4VQJQfLD+hSYDcZuM7HPJ9fi6vsX5kN8yRX5fmjBMsC
         e9qtWGnSxLM0WnXEWU/THFM7nC2hkJrVe0Pxxw62WN/ostoSetbupq2FktWYhE2ymDwF
         AB99NvDbGvE0TdekPuhafC1GsceSJBp8yDVeti+lyXu8gwi6885Nt44RcZ4gK/SoGD/I
         sVT2hIs3ax8c5IsZmjaXE0udFsWpFY4BVcIer0n0PyyYqwf/NlKS7AbaFsPQlZQChu87
         O2Ji38ENQAU6PAbYtiyq6F1Cpx/ePJxY2i78VD+3UXbcFQgkIRAih6XLD1QUuMWfNwRL
         x0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=akhpjntg7HyXXTFsNY4Qr1MazMZPbD3dXpnqhhn5BUY=;
        b=aP8RnysMJm1UrsrcqUP1Yt04/gxuYED8MpdoY0HxWCHkphUZyyaxKDPyzC6IR4TYQ4
         KweRtJz4aiEX8fUqK5kKBaNFSiVDTejnhQNNIKnlJ4RzdmHedOuHbuw3gHJT4mEJsBE7
         h6FlYXlzHOCqD/MrkuN/CC0+PsrR16hRPkBK4CL8ZoBstVqDfqVzPgMh7hdFcg8dZVlM
         3HPWkvSF0bu4D+k92yKqkEWA0odthaWigtkS4+0pJ3gaUI3oKQGUZgWwvlSUfu9d0Y4L
         vhx+/ZVQ0KVIAP+0C6UrE9SoCRS6HgvwWCgeD55V7AAXDGFCN5Z3f7EjRU2pUhdWu54b
         mOmg==
X-Gm-Message-State: AOAM530Qy4sYzXDtBOQSbUNt8BvfLDnnj5LPvC4oJuNCoGD1d9sZ2T/E
	uNlxA7/qF3pxlecvF9Tk7INDVOloQN9SyOxME3M=
X-Google-Smtp-Source: ABdhPJz97d0gBuc+KpSED/behXJGVK0sxSohj7YjwUIIBCTpxjpt91hF8NiKTiW2ylqBXwIj0lB3qMZ6IzVGmAZC4Qs=
X-Received: by 2002:aca:ab15:: with SMTP id u21mr5811888oie.50.1623820526635;
 Tue, 15 Jun 2021 22:15:26 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a9d:f03:0:0:0:0:0 with HTTP; Tue, 15 Jun 2021 22:15:25 -0700 (PDT)
In-Reply-To: <CAHk-=winAqy0sjgog9oEsjoBWOGJscFYEc3-=nvtzbyjTw_b+g@mail.gmail.com>
References: <20210608171221.276899-1-keescook@chromium.org>
 <20210614100234.12077-1-youling257@gmail.com> <202106140826.7912F27CD@keescook>
 <202106140941.7CE5AE64@keescook> <CAOzgRdZJeN6sQWP=Ou0H3bTrp+7ijKuJikG-f4eer5f1oVjrCQ@mail.gmail.com>
 <202106141503.B3144DFE@keescook> <CAOzgRdahaEjtk4jS5N=FQEDbsZVnB+-=xD+-WtV9zD9Tgbm0Hg@mail.gmail.com>
 <CAHk-=winAqy0sjgog9oEsjoBWOGJscFYEc3-=nvtzbyjTw_b+g@mail.gmail.com>
From: youling 257 <youling257@gmail.com>
Date: Wed, 16 Jun 2021 13:15:25 +0800
Message-ID: <CAOzgRdazu1TjP0+2ttnrQq5JzymcPog0z52YvsUCZAnFKvufDQ@mail.gmail.com>
Subject: Re: [PATCH] proc: Track /proc/$pid/attr/ opener mm_struct
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>, Christian Brauner <christian.brauner@ubuntu.com>, 
	Andrea Righi <andrea.righi@canonical.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, 
	regressions@lists.linux.dev, LSM List <linux-security-module@vger.kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

I test "proc: only require mm_struct for writing" fixed my cm14.1 problem.

2021-06-16 2:19 GMT+08:00, Linus Torvalds <torvalds@linux-foundation.org>:
> On Mon, Jun 14, 2021 at 6:55 PM youling 257 <youling257@gmail.com> wrote:
>>
>> if try to find problem on userspace, i used linux 5.13rc6 on old
>> android 7 cm14.1, not aosp android 11.
>> http://git.osdn.net/view?p=android-x86/system-core.git;a=blob;f=init/service.cpp;h=a5334f447fc2fc34453d2f6a37523bedccadc690;hb=refs/heads/cm-14.1-x86#l457
>>
>>  457         if (!seclabel_.empty()) {
>>  458             if (setexeccon(seclabel_.c_str()) < 0) {
>>  459                 ERROR("cannot setexeccon('%s'): %s\n",
>>  460                       seclabel_.c_str(), strerror(errno));
>>  461                 _exit(127);
>>  462             }
>>  463         }
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
>
> youling, can you double-check with the current -git tree? But as far
> as I can tell, my minimal patch is exactly the same as Kees' patch
> (just smaller and simpler).
>
> Kees, do you see anything?
>
>            Linus
>
