Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD83D2C9C
	for <regressions@lists.linux.dev>; Wed, 12 Jan 2022 13:22:54 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id o6so9968190edc.4
        for <regressions@lists.linux.dev>; Wed, 12 Jan 2022 05:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MfZ/bQyc8Ol4TQ5HaN2khWewBoM9cI1PUzi7/CIfS6I=;
        b=Lsipx6XKx1x6e4uetXaiE2GztJ4AGV6fzRo4TY2NE2SduXUPlNhdbeLCtufRKCwwnC
         0SPpqEeAGedRwJ5A3cFuz+Fx8X+/99cdT8FkqL59AenhPixEDypHH2cxR0hfPpkdJRWL
         3JvI6T/LyCTCLZuaDgcUBHouUXc9It24q4dlN1kjlwLfcM/g4EbP22GfPDk2rbn0ZnTE
         zMXyKDy7LqM19xT86V7+wYsIyDPRZtmoHpEpQZRX4lX8AWYnKPxnZagvhAeBzuBXUUDa
         DtwE0zSmSKkYjMLLWx73/IhVuQzZsYYgMYNR0qZzGhYW+nWTdsCOHzUDX6UNTX3VT46H
         Yt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MfZ/bQyc8Ol4TQ5HaN2khWewBoM9cI1PUzi7/CIfS6I=;
        b=Mg//jrfV3Q7IaAwArpr9pp8J1mQuQbZEaSO+7p8iC2bXZCvX52hoRsAjhust+nkuRi
         B1PtzcucmoScMkx8sMw9Zo1pg5MMX/WK7rtu4/Qi9VAli+dEr5tM5dh5ScOyiOcwk97/
         Dd0JeyJ2xsg2gZZGq9xIDzc+90EqMB482Iwouii48ZzDyx6ARLdjhCY+C6dQHOtDzxRT
         mQgwzUIUWSUfmaZahgjLoEnTbjWHsoiwjx5BlyASgNYMZ5kkAd0/odoUsZ0dpd1TYmSA
         HYaizdvFQ9pUYCaqUg55HSX02v89uESkhaVorZRO67tuAvzN9iRofrV0jm0+YrHxzpeD
         sNKQ==
X-Gm-Message-State: AOAM532Ilm5Og0ucrKTERuq3NmUjhPkCHXY5LsdhJIrRpvDsakocMs27
	0tkyFze+K8NOk9zzgYxqIMYmgDsHSQgyaIqHq9MJzw==
X-Google-Smtp-Source: ABdhPJz5Wrm0HbctZgKlE4IIfTnFY0GNvyi3qy++ibXIKY6TXHt+qWqe1wMvjNYh3xmQ1f9ikobQGUS2W1drqcKJSp4=
X-Received: by 2002:a17:907:3f92:: with SMTP id hr18mr7524933ejc.693.1641993772970;
 Wed, 12 Jan 2022 05:22:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYsMHhXJCgO-ykR0oO1kVdusGnthgj6ifxEKaGPHZJ-ZCw@mail.gmail.com>
 <20220112131837.igsjkkttqskw4eix@wittgenstein>
In-Reply-To: <20220112131837.igsjkkttqskw4eix@wittgenstein>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Wed, 12 Jan 2022 14:22:42 +0100
Message-ID: <CADYN=9Lvm-1etZS817eZK91NUyxkFBmsu=5-q_8Ei-1eV8DuZQ@mail.gmail.com>
Subject: Re: [next]: LTP: getxattr05.c:97: TFAIL: unshare(CLONE_NEWUSER)
 failed: ENOSPC (28)
To: Christian Brauner <christian.brauner@ubuntu.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	LTP List <ltp@lists.linux.it>, linux-fsdevel@vger.kernel.org, 
	regressions@lists.linux.dev, containers@lists.linux.dev, 
	Alexey Gladkov <legion@kernel.org>, Sven Schnelle <svens@linux.ibm.com>, 
	"Eric W. Biederman" <ebiederm@xmission.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Jan 2022 at 14:18, Christian Brauner
<christian.brauner@ubuntu.com> wrote:
>
> On Wed, Jan 12, 2022 at 05:15:37PM +0530, Naresh Kamboju wrote:
> > While testing LTP syscalls with Linux next 20220110 (and till date 20220112)
> > on x86_64, i386, arm and arm64 the following tests failed.
> >
> > tst_test.c:1365: TINFO: Timeout per run is 0h 15m 00s
> > getxattr05.c:87: TPASS: Got same data when acquiring the value of
> > system.posix_acl_access twice
> > getxattr05.c:97: TFAIL: unshare(CLONE_NEWUSER) failed: ENOSPC (28)
> > tst_test.c:391: TBROK: Invalid child (13545) exit value 1
> >
> > fanotify17.c:176: TINFO: Test #1: Global groups limit in privileged user ns
> > fanotify17.c:155: TFAIL: unshare(CLONE_NEWUSER) failed: ENOSPC (28)
> > tst_test.c:391: TBROK: Invalid child (14739) exit value 1
> >
> > sendto03.c:48: TBROK: unshare(268435456) failed: ENOSPC (28)
> >
> > setsockopt05.c:45: TBROK: unshare(268435456) failed: ENOSPC (28)
> >
> > strace output:
> > --------------
> > [pid   481] wait4(-1, 0x7fff52f5ae8c, 0, NULL) = -1 ECHILD (No child processes)
> > [pid   481] clone(child_stack=NULL,
> > flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD,
> > child_tidptr=0x7f3af0fa7a10) = 483
> > strace: Process 483 attached
> > [pid   481] wait4(-1,  <unfinished ...>
> > [pid   483] unshare(CLONE_NEWUSER)      = -1 ENOSPC (No space left on device)
>
> This looks like another regression in the ucount code. Reverting the
> following commit fixes it and makes the getxattr05 test work again:
>
> commit 0315b634f933b0f12cfa82660322f6186c1aa0f4
> Author: Alexey Gladkov <legion@kernel.org>
> Date:   Fri Dec 17 15:48:23 2021 +0100
>
>     ucounts: Split rlimit and ucount values and max values
>
>     Since the semantics of maximum rlimit values are different, it would be
>     better not to mix ucount and rlimit values. This will prevent the error
>     of using inc_count/dec_ucount for rlimit parameters.
>
>     This patch also renames the functions to emphasize the lack of
>     connection between rlimit and ucount.
>
>     v2:
>     - Fix the array-index-out-of-bounds that was found by the lkp project.
>
>     Reported-by: kernel test robot <oliver.sang@intel.com>
>     Signed-off-by: Alexey Gladkov <legion@kernel.org>
>     Link: https://lkml.kernel.org/r/73ea569042babda5cee2092423da85027ceb471f.1639752364.git.legion@kernel.org
>     Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
>
> The issue only surfaces if /proc/sys/user/max_user_namespaces is
> actually written to.

I did a git bisect and that pointed me to this patch too.

Cheers,
Anders
