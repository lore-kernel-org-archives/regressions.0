Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F361851
	for <regressions@lists.linux.dev>; Sat,  8 Jul 2023 17:30:02 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b701e41cd3so48821601fa.3
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 10:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688837400; x=1691429400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KYD6jlXBis0p+PBTKlv8qzvLQ1gqj2dZYI23tZfDs+4=;
        b=CSzNPlU1kR8cYUJ1EXSM7fBhpOr+a+NxIBR3Iu+dCCykDC9mtI0vFLA+pRbeWKuX7Y
         bFQMJI06XxkvFOsQBv9ts9wnUgVEqLuV691z36dpExwBo6SJ8ePRyqGAPLZvKSH+j3AW
         pHAr8YbSYylnmLDnOcMAv/VN41v6ReVBkuY70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688837400; x=1691429400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYD6jlXBis0p+PBTKlv8qzvLQ1gqj2dZYI23tZfDs+4=;
        b=W1CasRGzcxL8vYvnVf35S+3HKWVhlLeF8vzqNaVUsRe5Wsl2xxFXg16NU9AuFL3qIg
         SlRkmDt2ZfhwJwbc0ncqesQ9/ygO18e5Cz3KLogY/AATqto4kWGdH43+asHSHH8yLcgv
         yR7fQufAm5ly7EUS8nwK/RuPLj3Q2sfMnP6TqXSTT2ztbwYLNByQAl8baHnvtZ5OTJ8o
         p7IJSB5L1ImcapgHugPH4PxX9C2GkkldNH49GX4OoNmiTFsU84nyqLApyV9Ge/AUhCTv
         8YmX4x721/fMbRLXa+4eMh9jAkvUjJrc0ZeJgyNAF0X1mp9fzNOG3YFgCxIeUXAsHC3j
         E5uw==
X-Gm-Message-State: ABy/qLbk2Z+8tDZ/IKqcCwPjlDlcpzdwxTo75v8lwpLc4MmpisHxenF1
	TcASn86YqVacry52UkeFZdH/VlvVHo0awuFWkknFAw==
X-Google-Smtp-Source: APBJJlF6SYBCH1pkvCFJqLUxmxHUyZyITjTnHMwxiLIuaXuLgZUARo0Nhu4mFTZhBJdwjHKW1c4Odw==
X-Received: by 2002:a2e:99d2:0:b0:2b6:e0b0:ce04 with SMTP id l18-20020a2e99d2000000b002b6e0b0ce04mr5785292ljj.17.1688837400615;
        Sat, 08 Jul 2023 10:30:00 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id r11-20020a17090638cb00b00992b510089asm3740070ejd.84.2023.07.08.10.29.59
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 10:29:59 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51d7f4c1cfeso3885371a12.0
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 10:29:59 -0700 (PDT)
X-Received: by 2002:aa7:cc8d:0:b0:51b:e4b4:8bb0 with SMTP id
 p13-20020aa7cc8d000000b0051be4b48bb0mr5997528edt.2.1688837399295; Sat, 08 Jul
 2023 10:29:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info> <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
 <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
 <2023070359-evasive-regroup-f3b8@gregkh> <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
 <2023070453-plod-swipe-cfbf@gregkh> <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
 <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
 <2023070509-undertow-pulverize-5adc@gregkh> <7668c45a-70b1-dc2f-d0f5-c0e76ec17145@leemhuis.info>
 <20230705084906.22eee41e6e72da588fce5a48@linux-foundation.org> <df1d7d39-56f3-699c-0d0f-fcc8774f182e@leemhuis.info>
In-Reply-To: <df1d7d39-56f3-699c-0d0f-fcc8774f182e@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 Jul 2023 10:29:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=whKd05V49AbZGF=inYmhU6H_yNvvw1grWyhQfQ=9+5-VQ@mail.gmail.com>
Message-ID: <CAHk-=whKd05V49AbZGF=inYmhU6H_yNvvw1grWyhQfQ=9+5-VQ@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Jacob Young <jacobly.alt@gmail.com>, 
	Laurent Dufour <ldufour@linux.ibm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, 
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Jul 2023 at 04:35, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> The plan since early this week is to mark CONFIG_PER_VMA_LOCK as broken;
> latest patch that does this is this one afaics:

Bah.

Both marking it as broken and the pending fix seems excessive.

Why isn't the trivial fix just to say "yes, fork() gets the mmap_lock
for writing for a reason, and that reason is that it acts kind of like
mprotect()".

And then just do what those functions do.

IOW, why isn't the fix just to do

  --- a/kernel/fork.c
  +++ b/kernel/fork.c
  @@ -686,6 +686,7 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
        for_each_vma(old_vmi, mpnt) {
                struct file *file;

  +             vma_start_write(mpnt);
                if (mpnt->vm_flags & VM_DONTCOPY) {
                        vm_stat_account(mm, mpnt->vm_flags, -vma_pages(mpnt));
                        continue;

and be done with this? Yes, we could move it down a bit more, ignoring
the VM_DONTCOPY vma's, but they are so uncommon as to not matter, so
who cares?

              Linus
