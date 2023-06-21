Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B11519BDA
	for <regressions@lists.linux.dev>; Wed, 21 Jun 2023 17:56:27 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b46cad2fd9so65539931fa.1
        for <regressions@lists.linux.dev>; Wed, 21 Jun 2023 10:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1687370185; x=1689962185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HJx3UsV77JuxwQCPSbmxcEQXpPRNKRvV07UCaJ+HfVc=;
        b=Wu1t92qowZqWEvU6vL86VubsGqP7ZiAe/0yKh2Uo9hUyr1+KNt9u6pUnLcAKyY9sR3
         ZWqTIWSpQrQGDvrvDmroUqarj53N10HlPjmpnyNFTM4KOXVZjfx0KI1A5gH8ViE7rkJX
         aqd6C4KxMse+GkQ8ySISEvR5g1UzEvcnK79zE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687370185; x=1689962185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJx3UsV77JuxwQCPSbmxcEQXpPRNKRvV07UCaJ+HfVc=;
        b=DDZiiGdc9tUJ1B05ZFT4JCrYkDe0aateJ8nuvUlZT/kN4b0rwkjze5eCX76+GuiiBI
         CYWKzYAU208/mgAQwERqG54NHvcKtWC9hItH1uQqT7UNDwMm7w7jaXqyK/uwYdiDqBzZ
         hImYJpdmLvCuvAvbBZcPaR2xDCbpe/fHoYcs34IH7lLiYnkOvpG9ag9qZi8Mk1k6ERqL
         HhNa1/k6/WTNmv65VPrfDWlLF+zNvXc4d12oFUV+Pt9CEav9XJyXrQxje45EiJn9+R7c
         fHt6GH0rNTPcPajmzd8hfZg0WthkgVS74G6OtMtEhSEPkA2WSF7SPUydIAQAOWvC7RnM
         U+eA==
X-Gm-Message-State: AC+VfDyV2ZwnT4Rmead5wAIVLcH7336OzIg0S5nKDSIuMFXZ7q6HjpZ4
	/BlYne14bK01ALIxC1ntmtzYCh39vtpkn/ZSDXiSuzhC
X-Google-Smtp-Source: ACHHUZ40gvzos8Uv89Aol30BKNzhkpg4YxhjLk3vnmzqu6T4GnnHTSA8MTG22vueBsvjiwAimJk4og==
X-Received: by 2002:a05:651c:1022:b0:2b4:636a:67f4 with SMTP id w2-20020a05651c102200b002b4636a67f4mr9243000ljm.20.1687370184948;
        Wed, 21 Jun 2023 10:56:24 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id g22-20020a2e9cd6000000b002a8c1462ecbsm967695ljj.137.2023.06.21.10.56.23
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 10:56:24 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f8777caaa1so4112253e87.3
        for <regressions@lists.linux.dev>; Wed, 21 Jun 2023 10:56:23 -0700 (PDT)
X-Received: by 2002:a19:f201:0:b0:4f7:42de:3a8f with SMTP id
 q1-20020a19f201000000b004f742de3a8fmr9024880lfh.56.1687370183631; Wed, 21 Jun
 2023 10:56:23 -0700 (PDT)
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
 <9517bb70-426c-0296-b426-f5b4f075f7c8@leemhuis.info>
In-Reply-To: <9517bb70-426c-0296-b426-f5b4f075f7c8@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 21 Jun 2023 10:56:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiK5oDqgt6=OHLiiAu4VmLy4qn8WQdhvFo+sm26r4UjHw@mail.gmail.com>
Message-ID: <CAHk-=wiK5oDqgt6=OHLiiAu4VmLy4qn8WQdhvFo+sm26r4UjHw@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Andrew Lunn <andrew@lunn.ch>, 
	Linux Stable <stable@vger.kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Sami Korkalainen <sami.korkalainen@proton.me>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Jun 2023 at 01:46, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Jason, in that case it seems this is something for you. For the initial
> report, see here:

I'll just revert it for now. Writing EFI variables has always been
fraught with danger - more so than just reading them - and this one
just looks horrible anyway.

Calling execute_with_initialized_rng() can end up having the callback
done under a spinlock with interrupts disabled, which is probably why
it then has that odd double indirection through a one-time work. And
in no situation should we start writing to EFI variables during early
subsystem initialization, I feel.

It also probably shouldn't use the "set_variable" function at all, but
the non-blocking one, and who knows if it should try to do some
serialization with efi/vars.c.

I think it would be better off done in user space, but if we can't
trust user space to do the right thing, at least do it much much
later.

               Linus
