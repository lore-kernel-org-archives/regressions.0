Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5B52F21
	for <regressions@lists.linux.dev>; Sun,  5 Feb 2023 20:22:02 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id r3so108451edq.13
        for <regressions@lists.linux.dev>; Sun, 05 Feb 2023 12:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c7AMfEAIeR/+FfczDgCKveqbE3jvjS9AcYcv8gEH+jg=;
        b=AubkqDgfdmEzLss5anQ2QUuOJ23EmV0DleDD4TD4vdfeaSa4JriPsT5cPwkvHRzSAv
         v4dQ6yasKZndh/dM+ittZFX+QZ8d1faFJdhZGC/UZICZo1l1XEG5VJx3Y5Ck2DUfWEgZ
         DbpZxLVWAJSHD8LTivj+KOvEBNMGpvJ1NxwBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7AMfEAIeR/+FfczDgCKveqbE3jvjS9AcYcv8gEH+jg=;
        b=g5naYHNHGRad1JCb4Q6+Jw+4ITvi1HNXgi2BQF+ZIIyfTFSmmqsKbhyZmaKeN9YP0h
         kNlX63vjwqobd5qKVr7O0sAt4lQn4K1MSkoiu2HngHqehZrb/mW0bYfnGZkf/qagn3wJ
         BEk4+ZlaRc9A8QQYySDv4ETf5Cy4mvtfyY29cAGrirLAfR6Y88DrulvOLakaI1wrvt78
         8Ir2HEOGRwdFsPirfhB2JOR1bQS8ARGod98NlQt02tM0Dreli1j1i5ofiWHuV8xL7mCI
         HKc1SKYO710CBhr8PC8Kji9wKZUpzqM/sRIVhneLsBvl7ZkU4AioxLhat4bXEPmQYi8D
         47vg==
X-Gm-Message-State: AO0yUKVoTRZd8pnuhQPKb1E1QPOtt7/V0lFZfItGfpFs/DmflJW7ho4B
	S8FU/gMcF7D6IVGVxpaXiXOJq8+JdJtRmE2fnUc=
X-Google-Smtp-Source: AK7set/9GMxOaedUXWf//XVDC4lj7tOOY40OWbY2MwF69M1gHxmf1eRTVGdnVm2KLEQElmXkvVKkPA==
X-Received: by 2002:a50:8751:0:b0:4aa:a9ee:f126 with SMTP id 17-20020a508751000000b004aaa9eef126mr4240998edv.3.1675628520551;
        Sun, 05 Feb 2023 12:22:00 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id i26-20020a05640200da00b004a7e9ec2087sm4237515edu.76.2023.02.05.12.21.59
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 12:22:00 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id dr8so28804854ejc.12
        for <regressions@lists.linux.dev>; Sun, 05 Feb 2023 12:21:59 -0800 (PST)
X-Received: by 2002:a17:906:892:b0:87a:7098:ca09 with SMTP id
 n18-20020a170906089200b0087a7098ca09mr4393708eje.78.1675628519644; Sun, 05
 Feb 2023 12:21:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4fe9541e-4d4c-2b2a-f8c8-2d34a7284930@nerdbynature.de>
 <f22551ea-0694-2838-4a3f-f60d8d93fa64@leemhuis.info> <8f132803-f496-f33a-d2ab-b47fd5af0b88@nerdbynature.de>
 <0f441adb-f565-7a37-d9e5-3b14f6f7aea6@suse.com> <f02c49da-0377-97b9-9438-9e0ddbfbcc6d@nerdbynature.de>
 <CAHk-=wg1yXaX+Ut4uctf7x1WrZ4WW9hjSCr1VACwZtkZT9frFw@mail.gmail.com> <Y9+tDmLAlqg37TS+@zn.tnic>
In-Reply-To: <Y9+tDmLAlqg37TS+@zn.tnic>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 5 Feb 2023 12:21:42 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgC_MEFnnzUGN4q9pmhxV+eFV1Oo=W2j1J69YhJF5EDtw@mail.gmail.com>
Message-ID: <CAHk-=wgC_MEFnnzUGN4q9pmhxV+eFV1Oo=W2j1J69YhJF5EDtw@mail.gmail.com>
Subject: Re: External USB disks not recognized with v6.1.8 when using Xen
To: Borislav Petkov <bp@alien8.de>
Cc: Christian Kujau <lists@nerdbynature.de>, Juergen Gross <jgross@suse.com>, 
	Michael Kelley <mikelley@microsoft.com>, linux-kernel@vger.kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 5, 2023 at 5:20 AM Borislav Petkov <bp@alien8.de> wrote:
>
> @@ -53,7 +53,8 @@ static inline u8 mtrr_type_lookup(u64 addr,
>         /*
>          * Return no-MTRRs:
>          */
> -       return MTRR_TYPE_INVALID;
> +       *uniform = 1;
> +       return MTRR_TYPE_UNCACHABLE;

So this is the one I'd almost leave alone.

Because this is not a "there are no MTRR's" situation, this is a "I
haven't enabled CONFIG_MTRR, so I don't _know_ if there are any MTRR's
or not.

And returning MTRR_TYPE_UNCACHABLE will then disable things like
largepages etc, so this change would effectively mean that if
CONFIG_MTRR is off, it would turn off hugepage support too.

But maybe that was the only thing that cared, and we have:

> @@ -721,8 +721,9 @@ int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
>         u8 mtrr, uniform;
>
>         mtrr = mtrr_type_lookup(addr, addr + PUD_SIZE, &uniform);
> -       if ((mtrr != MTRR_TYPE_INVALID) && (!uniform) &&
> -           (mtrr != MTRR_TYPE_WRBACK))
> +       if (mtrr != MTRR_TYPE_UNCACHABLE &&
> +           mtrr != MTRR_TYPE_WRBACK &&
> +           !uniform)
>                 return 0;

Here you make up for it, but I don't actually understand why these
checks exist at all.

I *think* that what the check should do is just check for uniformity.

Why would the largepage code otherwise care?

Other MTRR types are explicitly fine, and I think things like the X
server might even want to do write-combining with large pages etc.

So I think the hugepage code should only do

     if (!uniform)
          return 0;

or there should be some explanation for why those types are special?

>> @@ -748,8 +749,9 @@ int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
>         u8 mtrr, uniform;
>
>         mtrr = mtrr_type_lookup(addr, addr + PMD_SIZE, &uniform);
> -       if ((mtrr != MTRR_TYPE_INVALID) && (!uniform) &&
> -           (mtrr != MTRR_TYPE_WRBACK)) {
> +       if (mtrr != MTRR_TYPE_UNCACHABLE &&
> +           mtrr != MTRR_TYPE_WRBACK &&
> +           !uniform) {

Same here.

Again, I *think* that the reason it used to do that "check two types"
thing is simply because "uniform" wasn't set correctly.

But I don't know.

                Linus
