Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE91A28E7
	for <regressions@lists.linux.dev>; Sun, 28 Aug 2022 18:41:46 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 2so7817544edx.2
        for <regressions@lists.linux.dev>; Sun, 28 Aug 2022 11:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=9gB7GKo4ZtOkdTHaCKeZUZH/SV1sRdPkXap+dCWBmo0=;
        b=aGoXvHIs4WqNoqTWcJQi0jqHCrwqxS4x9HKureOIIrnWBW2SSYLm2EIVGp4Nwtq6PG
         beJuYG7QqykOnmxg9mx7xbblUzyon9aqVcmedbOQk8H6rN1ZbwKSGIN14YL4p64NifX3
         af+UXxfhYQN9dYiiMTwXBZle8EN1cIHz4XP0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=9gB7GKo4ZtOkdTHaCKeZUZH/SV1sRdPkXap+dCWBmo0=;
        b=XIRnlzpgLFcNVRcTw44jnkq9zsbRFE7rJM4UybfEBJAv6G0C3Ef05zrz+g0HbIdN+k
         H6BXbCKdBtn2nuA2Ff2ZzHsNpC2QHh949EptCko52glC7em74yHqAHTwLO9DykShErbx
         PzaHaV2Ohu7Ml/7IQWBP1Zoo1hBICLekwOFNIbNdnbLeRjyN8MYOi1A5vm+1nfZ0TW01
         wXhJFFtFfSSXFDKuhkyvOS+2xyf3gZ9aKc1VLEUdhtgsbo4j5zVINqwdp8GDeBKS+RTp
         XJSUVWprnRxFkVHv6Pbbezc+zSCggHC6xLzoiatAL6wc/7MbTHuSRl6RXvfGD/Pt5WiK
         oUKg==
X-Gm-Message-State: ACgBeo1cN64JLeeogPPPUZlzrOaKhIltderrt8w+EAc9cJAdbMU9PMFE
	j+PW5IQ/S7SqbBWD6rbkVHrN+7rnuFDCt5Y9
X-Google-Smtp-Source: AA6agR7phEJ4c1rlBw07ohwrrfagoTRM4Mi6n/dC4mmiGoYFQVSCZNGYCBIpY3VoAEsLtuJxoYxHUA==
X-Received: by 2002:a05:6402:4305:b0:448:5b80:757a with SMTP id m5-20020a056402430500b004485b80757amr3046580edc.198.1661712104771;
        Sun, 28 Aug 2022 11:41:44 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b0071cbc7487e1sm3502909ejh.69.2022.08.28.11.41.44
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Aug 2022 11:41:44 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id bv25so677820wrb.10
        for <regressions@lists.linux.dev>; Sun, 28 Aug 2022 11:41:44 -0700 (PDT)
X-Received: by 2002:a5d:6248:0:b0:222:cd3b:94c8 with SMTP id
 m8-20020a5d6248000000b00222cd3b94c8mr4686216wrv.97.1661712103682; Sun, 28 Aug
 2022 11:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <166170992386.1651569.17504808724724706636@leemhuis.info>
In-Reply-To: <166170992386.1651569.17504808724724706636@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 28 Aug 2022 11:41:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjn-GVDLEN0F+WT0PWysqH7HMD+mBjKUr65DEhav47u3w@mail.gmail.com>
Message-ID: <CAHk-=wjn-GVDLEN0F+WT0PWysqH7HMD+mBjKUr65DEhav47u3w@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2022-08-28]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 28, 2022 at 11:23 AM Regzbot (on behalf of Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Not sure, maybe it would have been good if the following fix would have
> found the way into rc3, as it seems more than just one or two people
> already stumbled over the regression fixed by it:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?h=3Dmaster&id a8e0f6b01b14b2e28ba144e112c883f03a3db2
> https://lore.kernel.org/all/?q=C5=93bffc7*

Neither of those links are valid for me.

"a8e0f6b01b14b2e28ba144e112c883f03a3db2" doesn't exist in linux-next.
never mind that that isn't valid link syntax anyway.

The lore.kernel.org link is also just random noise.

So I'm not actually sure what you are trying to say...

           Linus
