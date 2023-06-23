Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612CEA93B
	for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 19:01:41 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so168146a12.0
        for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 12:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1687546899; x=1690138899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m6G2sMv4B2au2OlpHw9YOutXro+13UpPpl7VGbAiI6o=;
        b=H1pwdE1MDp9wneWqtC/6GOU+4gyEqtvTodhu5Uanw4hSCppklI4iDtmFDu5IkzCFn4
         HwUlKWOpKWeJc6VCyko6aBa7bWBHE3DtahiGbPwdnF3ixu1kb35J6bxuDO/K0pcOQz13
         CEeilCJIiYOyWI8NNjn2iANhybatXa3fumxf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687546899; x=1690138899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6G2sMv4B2au2OlpHw9YOutXro+13UpPpl7VGbAiI6o=;
        b=AKMqgQnxpxG0GD9GeWYq1OPPIQV3rKqGGpYxSfi/z5OtLoTkM85GQqMDJEVVr254JU
         rI9PRx4BlhIvHVyrQWVd8a35JKirQyRE2kql4jX5qChchIlpCUD/v+2Fcjmt2hI/+4cJ
         wvft5S/aoHortylh1JVwuaMgYfyE8HC25CecWYdFXE114p4iFFmmgrQK5vWHa7FyqVzx
         qBRR5MxzKmC8AUb9v4Ey1/xWuESlZxs6INVdHU/2ttS/lRQKTIL9azcbZbgXZmTWssuU
         +cU7M/R7QBXE3jy/3kJd+RsUT0d/i1CnSWQfrctRytw6WetNB/xs+CFJtkNEGd3lmv0I
         +rbQ==
X-Gm-Message-State: AC+VfDxsu1lQDl8LG5g5gEN2CtookO23dCcgXrFJdabgVnH04ALeyO6Y
	1VyrToLCZCQbQeQyhTbU8jNkbbgjh78nSR86zbj0cya+
X-Google-Smtp-Source: ACHHUZ6FCr7NSJlagslG5TTrjHv0BJwCkvgbbVdX0WTGb21PgYapUlfXbvwHNg3NcZhm3u5S2f7R1g==
X-Received: by 2002:a05:6402:28f:b0:51b:df39:1f0d with SMTP id l15-20020a056402028f00b0051bdf391f0dmr7355191edv.20.1687546899138;
        Fri, 23 Jun 2023 12:01:39 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id n21-20020a056402515500b005187d2ba7c1sm5469424edd.91.2023.06.23.12.01.37
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 12:01:38 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so3746605a12.0
        for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 12:01:37 -0700 (PDT)
X-Received: by 2002:aa7:d706:0:b0:51b:daa6:a215 with SMTP id
 t6-20020aa7d706000000b0051bdaa6a215mr8076731edq.13.1687546897711; Fri, 23 Jun
 2023 12:01:37 -0700 (PDT)
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
 <CzNbNfn7R2cqLMD6_jp11Dku0OoXYJhx2AMfk8JXeQVP2EGdt7tqeYD4HH0COhp2o_yj5kN6Ao7oObSelRi8yiz-5ltbQ2xtjBvplvgcZjo=@proton.me>
 <CAMj1kXGb+RfMQeOui8uzXBFRchfWhpnEsxOo84Y-LLBqk=z5Uw@mail.gmail.com>
In-Reply-To: <CAMj1kXGb+RfMQeOui8uzXBFRchfWhpnEsxOo84Y-LLBqk=z5Uw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Jun 2023 12:01:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgdH_UtN=PPrb6XV3GogHPMPVYnSgLLAL2d2pM2rru4RQ@mail.gmail.com>
Message-ID: <CAHk-=wgdH_UtN=PPrb6XV3GogHPMPVYnSgLLAL2d2pM2rru4RQ@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Sami Korkalainen <sami.korkalainen@proton.me>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	regressions@leemhuis.info, Andrew Lunn <andrew@lunn.ch>, 
	Linux Stable <stable@vger.kernel.org>, Linux Regressions <regressions@lists.linux.dev>, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Jun 2023 at 11:39, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Fri, 23 Jun 2023 at 20:20, Sami Korkalainen
> <sami.korkalainen@proton.me> wrote:
> >
>
> Please don't send me encrypted emails.

Heh. That must be protonmail doing some crazy stuff based on
recipient. Here's Sami's email on the lists:

   https://lore.kernel.org/all/CzNbNfn7R2cqLMD6_jp11Dku0OoXYJhx2AMfk8JXeQVP2EGdt7tqeYD4HH0COhp2o_yj5kN6Ao7oObSelRi8yiz-5ltbQ2xtjBvplvgcZjo=@proton.me/

(and it's what I got too). No encryption anywhere, just the message ID
from hell.

So for some reason protonmail decided that *you* are special, and
singled you out for their super sekrit encryption. Presumably because
Sami has your pgp key.

                  Linus
