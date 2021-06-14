Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1A172
	for <regressions@lists.linux.dev>; Mon, 14 Jun 2021 18:03:05 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id r5so22535070lfr.5
        for <regressions@lists.linux.dev>; Mon, 14 Jun 2021 11:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hth5OJx5DLnrqVkGsO9sFZaOxm24SUjgcf7q16vYO9k=;
        b=SYh2bWEUABHXqRB6ouYLMnFXIxkuBj3g9OGoJcjymr/uDkZ0b2ocpQIxY7OD3aoqry
         y/WDysWKakiopu5mag8D+4V2VdjD01blp+N5edF/BQ0EXgzT8QLbBsWXILbf7+h84XUb
         ftZIOw1NIhwgxMzRUzmXKeXGQC6u8yO//bp98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hth5OJx5DLnrqVkGsO9sFZaOxm24SUjgcf7q16vYO9k=;
        b=Guq3IpuVb+2W6B25gez6beEIwSP/YWq8jMQ3oTiNpzjmQt7T+wk8hzU1vT9//6SQvt
         eQHzt4FDaldOuB2nHmHBh+lvtyh8aF2NMTMx/RW9B3NKv1vfl+1ziwQaxvXXPJtXMOSo
         QEqrWi/V4RzCB+3mIE5qb5bfTLtoZwuVAn0QnnreVd+aghmHA8CrrPOEsvWzzpL/B48P
         5mXeLioG1WwgXbNAyu91IvX3L+18zclHjkJN2qTehTlLf8X1nlIiEONGLEXHaOnnw7JD
         B3HpXm7fMt8W6qaPXQJFFsEWCAhZDfXvEhwnmONzvh9PEgoeXiJPVur4ksY1lq+zG+wl
         1CEQ==
X-Gm-Message-State: AOAM531dAlO5BxVCPPJXUvmsLhh5fRbmku2sD0BASQnjCFpu86uJMln7
	wqNR+oRa0dfLWLQ/whrK1WpWLoB6Uqp4++DyLz4=
X-Google-Smtp-Source: ABdhPJzw91jYovQmL/ELmMdwNUkyHXfgw/qevqsnM2awO8vd3S9fDi39qhEDHszJouxHTx2XiTyYMQ==
X-Received: by 2002:a19:ad06:: with SMTP id t6mr12440524lfc.424.1623693783300;
        Mon, 14 Jun 2021 11:03:03 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id m3sm1548809lfg.241.2021.06.14.11.03.02
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 11:03:02 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id q20so7673240lfo.2
        for <regressions@lists.linux.dev>; Mon, 14 Jun 2021 11:03:02 -0700 (PDT)
X-Received: by 2002:a05:6512:3f82:: with SMTP id x2mr12358175lfa.421.1623693782157;
 Mon, 14 Jun 2021 11:03:02 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210608171221.276899-1-keescook@chromium.org>
 <20210614100234.12077-1-youling257@gmail.com> <202106140826.7912F27CD@keescook>
 <202106140941.7CE5AE64@keescook>
In-Reply-To: <202106140941.7CE5AE64@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Jun 2021 11:02:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=whLBq63v_h71YuBM2aNjCSBprkBEO3fevbWnkp8TDeh5g@mail.gmail.com>
Message-ID: <CAHk-=whLBq63v_h71YuBM2aNjCSBprkBEO3fevbWnkp8TDeh5g@mail.gmail.com>
Subject: Re: [PATCH] proc: Track /proc/$pid/attr/ opener mm_struct
To: Kees Cook <keescook@chromium.org>
Cc: youling257 <youling257@gmail.com>, Christian Brauner <christian.brauner@ubuntu.com>, 
	Andrea Righi <andrea.righi@canonical.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, 
	regressions@lists.linux.dev, LSM List <linux-security-module@vger.kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 14, 2021 at 9:45 AM Kees Cook <keescook@chromium.org> wrote:
>
>         /* A task may only write when it was the opener. */
> -       if (file->private_data != current->mm)
> +       if (!file->private_data || file->private_data != current->mm)

I don't think this is necessary.

If file->private_data is NULL, then the old test for private_data !=
current->mm will still work just fine.

Because if you can fool kernel threads to do the write for you, you
have bigger security issues than that test.

               Linus
