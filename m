Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3663FDC
	for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 23:03:03 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-988a5383fd4so219827566b.0
        for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 16:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1687561382; x=1690153382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p+C7fNiOBQEjssCfRMNQGT9j05BvDs3sSia5OG9zr5E=;
        b=QJwOmFqEKZHanUu4/h2PiiHFp9sY0V2RsZ/nikN45ZiF9oJKm26YOt3i6WaQwd/WVU
         JHSaOZeDwDhiY/fPZZt5d5+mG+nEFqCca0ylI3l6S2k6b9m2S+/pXJRoedejH59eFqc3
         cJgi+czUiEzyhFAk1wdDdh7t7xlFOlDGzniJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687561382; x=1690153382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+C7fNiOBQEjssCfRMNQGT9j05BvDs3sSia5OG9zr5E=;
        b=Dok0gSAW6BqVs7w6m8PdCzireEEdi7wfIsjppT0pkGkSo2yhJOJgY6pfgGjtdomkZW
         mD7gv4FDinhtPZzW4nfr65RAZSP96Wl77/5ceVo2jJWWSponFYwUiejtuXpusOjyd3eU
         QIsHqsZRvnEO3H9bE+JLfZzCH22icXn7qnAAM5isPqJvt2Tsrv80RnN8+HdOEoyGn2sc
         Y9BRTWmGpPF3P8NIVk4etB7KJUjxlC5KxV6LtRi9+YRD31nBShidk+txPmZ7HNasevsH
         znW08A+ND34Evn32Bh2K7pIM7TTWMeAQV08taqBEcQ8itUYEI1qAOz8L8D6xMW8/KtbL
         kX8A==
X-Gm-Message-State: AC+VfDzHxSOwHj901iMNTTEsJGaOSFX0q1pIiGu848p4+FzQzaBiwQSY
	JECYyicHJ/WjtkVwok7n9lXk1s16Noi7isxqlEKVjlBF
X-Google-Smtp-Source: ACHHUZ6PsTYDttkMJHDqQG7ErppVxu6lZ2sa5hvohfvPy4WUHHkuOB+dspcsBgQ9CdIdDwa9/mhASg==
X-Received: by 2002:a17:907:3f18:b0:986:38ab:ef99 with SMTP id hq24-20020a1709073f1800b0098638abef99mr23763443ejc.9.1687561381951;
        Fri, 23 Jun 2023 16:03:01 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id w10-20020a17090633ca00b00988b57d5146sm185094eja.5.2023.06.23.16.03.00
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 16:03:01 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51bdd6f187fso2154069a12.1
        for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 16:03:00 -0700 (PDT)
X-Received: by 2002:a05:6402:27cb:b0:514:94be:323c with SMTP id
 c11-20020a05640227cb00b0051494be323cmr22751054ede.10.1687561380662; Fri, 23
 Jun 2023 16:03:00 -0700 (PDT)
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
 <CAHk-=wiiFHLSDe3JSSMm5EezpXXMFxYH=RwFLEbgsCKLjg4qqQ@mail.gmail.com>
 <CAHmME9oC6Kq5qeoSmY5CdDrbGnkcp9sy-9ESXdpRtM8x1_6Hwg@mail.gmail.com>
 <CAHk-=wjKtHwJBeUiJL_1HFJKWja120w-6qaLx1FS5p9QE0PfSw@mail.gmail.com> <CAMj1kXF7aO1FPXeBFeLBe1-7j5hUjiTAXu-xV6oKFN8dRY3qDQ@mail.gmail.com>
In-Reply-To: <CAMj1kXF7aO1FPXeBFeLBe1-7j5hUjiTAXu-xV6oKFN8dRY3qDQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Jun 2023 16:02:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=whKF0S33EgXts++dpspdFAtkf_otRbV45x1Yt2+bDz0sQ@mail.gmail.com>
Message-ID: <CAHk-=whKF0S33EgXts++dpspdFAtkf_otRbV45x1Yt2+bDz0sQ@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, regressions@leemhuis.info, 
	Andrew Lunn <andrew@lunn.ch>, Linux Stable <stable@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Sami Korkalainen <sami.korkalainen@proton.me>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Jun 2023 at 15:55, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> With the revert applied, the kernel/EFI stub only consumes the
> variable and deletes it, but never creates it by itself, and so the
> code does nothing if the variable is never created in the first place.

Right.

But my *point* was that if we want to create it, we DAMN WELL DO NOT
WANT TO DO SO AT BOOT TIME.

Boot time is absolutely the worst possible time to do it.

We'd be much better off doing so at shutdown time, when we at least
have (a) maximal entropy and (b) failures are less critical.

Jason's argument against that was pure and utter BS.

Now, there are real arguments against shutdown time: it too is
horrible to debug. So shutdown is not exactly great either. It's
better than bootup, but it really would be better to do it at a point
where we can actually get reasonable results out if something goes
wrong. Which it clearly did.

              Linus
