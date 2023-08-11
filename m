Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AE78468
	for <regressions@lists.linux.dev>; Fri, 11 Aug 2023 18:55:36 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4fe0e34f498so3694499e87.2
        for <regressions@lists.linux.dev>; Fri, 11 Aug 2023 11:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1691780134; x=1692384934;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uuRnK69MU6Lcim2KwchdBtj06ixdIXcvFeb8SD9Pua0=;
        b=at93fyhLm4FeeyPwKlH/o+Thsx8qR3KIIHdI6K3omhCqRquco97fhFl17IAleLjO/i
         R40+5iELDgIWEHpB2EtfKC8Aeb9BPbGtT8W1u0XZ9j0nRno2JvtDdcrJGQxFlib/S4lH
         SZjeNqBAAHxmIjV3NHtgvl2N79Zhl5ClacL9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691780134; x=1692384934;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uuRnK69MU6Lcim2KwchdBtj06ixdIXcvFeb8SD9Pua0=;
        b=PDqWAVuDAJXnwMjsnn0eIall6bMRQ1B3wgOTI9wuqiZ3AEx7DLTsDyVrzeOnolr1kV
         DtVXaiv6ajLbYtlgCqbdl/OM/H4PmyzwT12Zy5mJsb7mP/qQUdAAZDCRBlJp5WCU2sJw
         wf/0dkmS+ASr2lJnpj/zEfyG8d48cx5RpGmMTeI7THGdQwi78N3ziikdpjnECJIb3foO
         C3u+22+uYBJTNEBnzbGjigUSTxg5gpjtaQVbHtQIbDDxr/Mt//QluZe1kROlVuglFbvM
         WE/rWCgBAAfU4xBkZSO8Ow45YFXkdUy+JBaXxYQsJ7tnVyXUyJJWMeCXXW+PU/rB9rI2
         WKhQ==
X-Gm-Message-State: AOJu0YyfMe/5r70/Qhfm2+e3CeCgNAQVRe4XO3THCxSWoE8McWTYLnFz
	wr0EqXUdWU1ssDA1+UN+525DYyVXzeZ47LRPKSaL+HBP
X-Google-Smtp-Source: AGHT+IEyBgqtD7qa8AOBPYEELZUYjbLR217whVJ4lVCshzrZXe2tCd3dlbW+J0m7DBNtXfuIof66gg==
X-Received: by 2002:a05:6512:3b4:b0:4f6:d7b:2f19 with SMTP id v20-20020a05651203b400b004f60d7b2f19mr1621603lfp.24.1691780134394;
        Fri, 11 Aug 2023 11:55:34 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id g7-20020ac25387000000b004fe1448873asm820747lfh.27.2023.08.11.11.55.33
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Aug 2023 11:55:33 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4fe2de785e7so3702756e87.1
        for <regressions@lists.linux.dev>; Fri, 11 Aug 2023 11:55:33 -0700 (PDT)
X-Received: by 2002:a05:6512:10cd:b0:4fd:fef8:7a81 with SMTP id
 k13-20020a05651210cd00b004fdfef87a81mr2309540lfg.55.1691780133463; Fri, 11
 Aug 2023 11:55:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230710133836.4367-1-mail@eworm.de> <20230710142916.18162-1-mail@eworm.de>
 <20230710231315.4ef54679@leda.eworm.net> <bd0587e16d55ef38277ab1f6169909ae7cde3542.camel@kernel.org>
 <bb5580e93d244400c3330d7091bf64868aa2053f.camel@gmail.com>
 <0f272843a33a1706dbcbb2d84b02e3951ee60cbb.camel@kernel.org>
 <fdd5fd9ece045ebd1888672a75f157e64ade98fb.camel@gmail.com>
 <a588d1d3-12e0-b078-b6cc-b0a63c54ab37@leemhuis.info> <CUPW0XP1RFXI.162GZ78E46TBJ@suppilovahvero>
In-Reply-To: <CUPW0XP1RFXI.162GZ78E46TBJ@suppilovahvero>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Aug 2023 11:55:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=whRVp4h8uWOX1YO+Y99+44u4s=XxMK4v00B6F1mOfqPLg@mail.gmail.com>
Message-ID: <CAHk-=whRVp4h8uWOX1YO+Y99+44u4s=XxMK4v00B6F1mOfqPLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tpm/tpm_tis: Disable interrupts for Framework
 Laptop Intel 12th gen
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Lino Sanfilippo <LinoSanfilippo@gmx.de>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, Peter Huewe <peterhuewe@gmx.de>, 
	Christian Hesse <mail@eworm.de>, stable@vger.kernel.org, roubro1991@gmail.com, 
	Grundik <ggrundik@gmail.com>, Christian Hesse <list@eworm.de>, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Aug 2023 at 10:22, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> I was planning to send a PR to Linus with a quirk for MSI GS66 Stealth
> 11UG, and apparently this bug report would add two additional MSI
> entries. This is becoming quickly a maintenance hell.

Honestly, what would be the immediate effects of just not enabling the
TPM irq by default at all, and making it an explicit opt-in?

When a common solution is to just disable the TPM in the BIOS
entirely, and the end result is a working system, I really get the
teeling that this is all pain for very very little gain.

Would anybody even notice if we just disabled it by default and added
a "if you really want it, use 'tpm=irq' kernel command line"?

Hmm?

             Linus
