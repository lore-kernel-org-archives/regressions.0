Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C90100B8
	for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 17:30:18 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f96d680399so1169443e87.0
        for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 10:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1687541416; x=1690133416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z6gsFnCOPQqveW3Pgec1BIN9/v1H+43jT4xHFsyYNnc=;
        b=BERNpO8qQGNhnCYAugF+kNw4MPYc9lKANuR4MRrypSPIOt8fvTrWA6XgyeUhw470Dl
         REbojEDBAG30qa46nRWCUwdLM1RF7FVveUyzA7c+z56wN2HnEaQgvEzg1Uii5qLbPt3P
         hw9PL5d6qBCkfRkzxcLRRz+fq/YQdnoSIi95Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687541416; x=1690133416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z6gsFnCOPQqveW3Pgec1BIN9/v1H+43jT4xHFsyYNnc=;
        b=O9Xq/3N1C/qP8wsX7Dza7OCMiSafiDn6EUTHF6PJ96qJU8QBKVpte6F4wA+du4hmP7
         QRwSbV3NLEBakfxpbYmDYgBcz0dqnrjnWerOcEs2KtaL7mDN6MmQGsyKePxPs/mh60bg
         3Ao3ZrV6WwIbjRh/kAXLmvFJ8LxaA2ZdmlsaXG5eCFRsQZO6uuoR7jjuuW2x6nzQQSmw
         /uQU9YPD/uSemRxTTzLe5CP0vBcjo4+9QNWyEpT6Tmw6pwXIM4qfGOR16iu7bLeDtgDt
         5zkj9yTOL5zt9tSDCIbF/DEjm3FW8HYw6hQ6L1rabUD2vjfl+5vrQa7cOSvdVMkxqhPG
         1nbg==
X-Gm-Message-State: AC+VfDy3zwnvAzmpxGmU7A4+eG3rf1EPSFEsMU+ixLVL4Z148h6KO6M8
	O/kZB2OS+QcDMP/KlJMb7w1OU317RSJEvqFCGBQNsnGA
X-Google-Smtp-Source: ACHHUZ6y+fgUGJ1ix4ZgO+oawzPpdYPT7c8hVvE8vlqFM40A9q+t7FtXFeSnGo2rwpwEkwkF7NvGFg==
X-Received: by 2002:ac2:5f86:0:b0:4f8:6577:f670 with SMTP id r6-20020ac25f86000000b004f86577f670mr13370077lfe.13.1687541415935;
        Fri, 23 Jun 2023 10:30:15 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id f6-20020ac251a6000000b004f768d70241sm1510550lfk.233.2023.06.23.10.30.15
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 10:30:15 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b466073e19so15112591fa.1
        for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 10:30:15 -0700 (PDT)
X-Received: by 2002:a2e:99da:0:b0:2b5:98dc:ffc2 with SMTP id
 l26-20020a2e99da000000b002b598dcffc2mr2530023ljj.52.1687541414839; Fri, 23
 Jun 2023 10:30:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <GQUnKz2al3yke5mB2i1kp3SzNHjK8vi6KJEh7rnLrOQ24OrlljeCyeWveLW9pICEmB9Qc8PKdNt3w1t_g3-Uvxq1l8Wj67PpoMeWDoH8PKk=@proton.me>
 <ZHFaFosKY24-L7tQ@debian.me> <NVN-hJsvHwaHe6R-y6XIYJp0FV7sCavgMjobFnseULT1wjgkOFNXbGBGT5iVjCfbtU7dW5xy2hIDoq0ASeNaXhvSY-g2Df4aHWVIMQ2c3TQ=@proton.me>
 <ZIcmpcEsTLXFaO0f@debian.me> <oEbkgJ-ImLxBDZDUTnIAGFWrRVnwBss3FOlalTpwrz83xWgESC9pcvNKiAVp9BzFgqZ0V-NIwzBZ7icKD8ynuIi_ZMtGt7URu3ftcSt16u4=@proton.me>
 <e2ca75ef-d779-4bad-84a5-a9f262dbe213@lunn.ch> <FNzHwp9-AyweVwIMndmih6VuBD0nsyRp3OM72bmOxpeYszF680jFPJjENIknT32FeaqfVBtVSQFw-5mgE3ZXeksVD8VCFbxwojxP3mSZ9DQ=@proton.me>
 <9517bb70-426c-0296-b426-f5b4f075f7c8@leemhuis.info> <CAHmME9p2ZLJUMq96vhkiSgvJkxP5BxE778MhY5Ou2WdxLVEJyg@mail.gmail.com>
 <CAMj1kXHGkJsgArabs_mbzR3Y83s48qmf_aqb50k1LV1Hi5iNgA@mail.gmail.com>
In-Reply-To: <CAMj1kXHGkJsgArabs_mbzR3Y83s48qmf_aqb50k1LV1Hi5iNgA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Jun 2023 10:29:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiiFHLSDe3JSSMm5EezpXXMFxYH=RwFLEbgsCKLjg4qqQ@mail.gmail.com>
Message-ID: <CAHk-=wiiFHLSDe3JSSMm5EezpXXMFxYH=RwFLEbgsCKLjg4qqQ@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, regressions@leemhuis.info, 
	Andrew Lunn <andrew@lunn.ch>, Linux Stable <stable@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Sami Korkalainen <sami.korkalainen@proton.me>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Jun 2023 at 06:55, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Setting the variable from user space is ultimately a better choice, I
> think.

Doing it from the kernel might still be an option, but I think it was
a huge mistake to do it *early*.

Early boot is fragile to begin with when not everything is set up, and
*much* harder to debug.

So not only are problems more likely to happen in the first place,
when they do happen they are a lot harder to figure out.

Maybe it would make more sense to write a new seed at kernel shutdown.
Not only do y ou presumably have a ton more entropy at that point, but
if things go sideways it's also less of a problem to have dead
machine.

Of course, shutdown is another really hard to debug situation, so not
optimal either.

               Linus
