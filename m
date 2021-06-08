Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC662F80
	for <regressions@lists.linux.dev>; Tue,  8 Jun 2021 16:39:22 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id r16so8681775ljk.9
        for <regressions@lists.linux.dev>; Tue, 08 Jun 2021 09:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CmdQdp/zgXTF3zIyVUeUoC6+djLwn882c7UtAjVpM/w=;
        b=FQcer1igaZicV1rJoqXt0UpfZQqBqFRw6oKv9uMoQRsZW+3v9222+IaMcMZ2KWi+wb
         dy2SKt3X9cK8BZ2JJKS+pEuzyxMFP+N2WWXI5fmoqCetHO0LlGKp1zuPsuau1G2D75/K
         9vScanSlNH869f/8fVtFEz/wFMNyJrST1pQrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CmdQdp/zgXTF3zIyVUeUoC6+djLwn882c7UtAjVpM/w=;
        b=ML+V0zFQyUe18pfXua0rFq4JYi++Knw2gi36cbZFsDHTuDZvLSpFEsI1nqt5TKAFC/
         QhkSuaKdsJN4o6rfmlxW94efx2E0gTr8qWuCnM8pMq0pkR51lDJG+8fQ5elO2wg7gnsg
         Dz4AePQbJ/3thdPsz8uYK7yLNZFKDvj8aUMgGa2J9a95C1729EQ7ROxcZN//kwjL5Hn3
         FlS8mWNHs0mkF+wjYXFqjm3geiyJJgueQIfvJL/aNP15ZcJ8+CxII46LJ72stgUiLjsI
         Kj7AJ4BwtG4rjeKAxevJcGnmbJdzR34Vl+095kLd/aMcdPElqCWNANpRHhdOdS69JNvX
         gMdA==
X-Gm-Message-State: AOAM532HX9vRJPzTXK35ey1HIUulWioNY3lnKBGIWezKe89M3HyTQp7m
	JjoO8FPv3mUhL/3qGUSlwNbLcOTqPeEMb2Ki7+U=
X-Google-Smtp-Source: ABdhPJx+PMZ9wcredHSR/NAXB/FRo4mbUiQhglv2MCytEiRYH1EITX8UsCgkEv5EdkfRPWn6S/LWtg==
X-Received: by 2002:a2e:1319:: with SMTP id 25mr19163137ljt.200.1623170360287;
        Tue, 08 Jun 2021 09:39:20 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id u13sm19372lfq.201.2021.06.08.09.39.19
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 09:39:19 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id d2so23688016ljj.11
        for <regressions@lists.linux.dev>; Tue, 08 Jun 2021 09:39:19 -0700 (PDT)
X-Received: by 2002:a2e:c52:: with SMTP id o18mr18723758ljd.411.1623170359342;
 Tue, 08 Jun 2021 09:39:19 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210607142245.eikvyeacqwwu6dn3@wittgenstein> <202106071621.C11535A@keescook>
 <CAHk-=wg8Bqjf8vxythgN9EV-XTttf7GXeus14kDkVZuUwLibrw@mail.gmail.com>
 <202106071856.5D68C05638@keescook> <20210608115928.5ocvtyoekxa2a6vw@wittgenstein>
In-Reply-To: <20210608115928.5ocvtyoekxa2a6vw@wittgenstein>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 8 Jun 2021 09:39:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg93iejO6zMZpXTnszrjdr=-iKjuC4q_LsGtNsuhfTCHg@mail.gmail.com>
Message-ID: <CAHk-=wg93iejO6zMZpXTnszrjdr=-iKjuC4q_LsGtNsuhfTCHg@mail.gmail.com>
Subject: Re: Regression when writing to /proc/<pid>/attr/
To: Christian Brauner <christian.brauner@ubuntu.com>
Cc: Kees Cook <keescook@chromium.org>, regressions@lists.linux.dev, 
	Andrea Righi <andrea.righi@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 8, 2021 at 4:59 AM Christian Brauner
<christian.brauner@ubuntu.com> wrote:
>
> Hm, but doesn't the mm check have the same problem? It's not checking
> the mm of the opener against the mm of the writer. To stay with the
> example in this thread, it's checking the mm of the <attached process>
> at open time against the mm of the <attached process> at write time if I
> read this correctly.

Yes and no. It is checking that the mm of the target still matches,
but what you don't see in the patch (because it was pre-existing) is
that it also checks that the target is "current".

So it does effectively check that current hasn't execve'd. So ack on
the patch from me.

Of course, we could _also_ allow a cross-execve() write if the creds
remain the same, but I think this "hasn't execve'd" is the better
check (and was what the original cred check patch basically aimed to
do anyway).

           Linus
