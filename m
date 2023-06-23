Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA55134C4
	for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 21:52:46 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-51d7d0dbec8so133901a12.2
        for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 14:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1687557164; x=1690149164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=crikR62VHTobwaAaRBUscQ/y18KPE823gSw9fzpdAYI=;
        b=hvYlpE3k1JZ4vv1b0ppc8Er5V1Ib2OHQJCxNdIzLazPaMVt8MjuPGba+9ag5LRx0M1
         cc8vQBrT1DPCm935R9Ez2RIvaiJON02JUGU0U6boUW3jyLWveL47gwIsPwTFR5llvPyB
         WhsIHYXeM6U3JNV3FB5nOkJ3W2FGDGahhPk3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687557164; x=1690149164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crikR62VHTobwaAaRBUscQ/y18KPE823gSw9fzpdAYI=;
        b=PYNgINllIIL6pf/yrQqcQRPUlCul6oGM3JKd4FFWgjNxEpZZmsdOnlhkqbsoBrg/XK
         y5KGfYEMAxgETscZEW/2PokLCiIjPSE495S4adZVJ1nwEURWHmkZJN7NZNTBjCUwK/hS
         W2cEElhxvysk3U+3Wpf2opO8ORl9LNjXR18B7R2qAtxUeNodwU+ob8+Oljo6tm69qx4A
         vrGiwdmcRIPdGG68mBy/W2sR9vKoeTgksR1AcuQdgnruw6gd2sq12jdwYspYEo3FXXiC
         G1fzi9FsRdo27+aMU1o9a0Lst2kktCmTihxt4uTc8bzOov+9H5NzkSHuI1cvgSCBoBsV
         hqOA==
X-Gm-Message-State: AC+VfDzczrkPHAIXuqH9gVruzQsk6LmbcEXOpLRz6t/M3l5mvRtFpKy4
	9v0SEH08+TZHE8AKaUF4BxBPCXsiwkM0egXZgjNUag==
X-Google-Smtp-Source: ACHHUZ4gWW0S6rkR2HaP5rbtfJ+aZN/1LK4hbrzwHlh63P6JIHsa4B6WdIiHROoKqgOitmeEK+RRFw==
X-Received: by 2002:a05:6402:456:b0:50b:c693:70af with SMTP id p22-20020a056402045600b0050bc69370afmr14883065edw.2.1687557163984;
        Fri, 23 Jun 2023 14:52:43 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id f2-20020a056402004200b0051bde3e1e48sm3720104edu.96.2023.06.23.14.52.43
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 14:52:43 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51d7d0dbec8so133886a12.2
        for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 14:52:43 -0700 (PDT)
X-Received: by 2002:aa7:c859:0:b0:50b:c085:1991 with SMTP id
 g25-20020aa7c859000000b0050bc0851991mr13780235edt.19.1687557162976; Fri, 23
 Jun 2023 14:52:42 -0700 (PDT)
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
 <CAHk-=wiiFHLSDe3JSSMm5EezpXXMFxYH=RwFLEbgsCKLjg4qqQ@mail.gmail.com> <CAHmME9oC6Kq5qeoSmY5CdDrbGnkcp9sy-9ESXdpRtM8x1_6Hwg@mail.gmail.com>
In-Reply-To: <CAHmME9oC6Kq5qeoSmY5CdDrbGnkcp9sy-9ESXdpRtM8x1_6Hwg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Jun 2023 14:52:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjKtHwJBeUiJL_1HFJKWja120w-6qaLx1FS5p9QE0PfSw@mail.gmail.com>
Message-ID: <CAHk-=wjKtHwJBeUiJL_1HFJKWja120w-6qaLx1FS5p9QE0PfSw@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, regressions@leemhuis.info, 
	Andrew Lunn <andrew@lunn.ch>, Linux Stable <stable@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Sami Korkalainen <sami.korkalainen@proton.me>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Jun 2023 at 13:31, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> We always have to write when using so that we don't credit the same
> seed twice, so it's gotta be used at a stage when SetVariable is
> somewhat working.

This code isn't even the code that "uses" the alleged entropy from
that EFI variable in the first place. That's the code in
efi_random_get_seed() in the EFI boot sequence, and appends it to the
bootup randomness buffers.

And that code already seems to clear the EFI variable (or seems to
append to it).

So this argument seems to be complete garbage - we absolutely do not
have to write it, and your patch already just wrote it in the wrong
place anyway.

Don't make excuses. That code caused boot failures, it was all done in
the wrong place, and at entirely the wrong time.

                  Linus
