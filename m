Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E8139A
	for <regressions@lists.linux.dev>; Sun, 23 Oct 2022 19:07:22 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id c23so4625503qtw.8
        for <regressions@lists.linux.dev>; Sun, 23 Oct 2022 12:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vxuF9kYe8hiUZgthp1fPj2oasxNSqUYeuQAWi1KfdpI=;
        b=NGQfpHT1/lSNP/ctN/5db3V8w7tXM2IKMhuOdWc/+RU053BxefVqTN2izj/Gzyk3GF
         rMGF+0xkowpdEMxlP76WcJUeLIJX7ywVpwGrf57QMXHerM++oZKF3D9NHX0jypdYuN0M
         cI/mLYyPYDDSzJ6s5CHr9shiJpBgVNZsVnCOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxuF9kYe8hiUZgthp1fPj2oasxNSqUYeuQAWi1KfdpI=;
        b=1c6ehkNJv0+95lSefqcrsbxqT+WFmckHSCwDS844ZK5ACBl9thAKt29DahL7qz7T4n
         nGXmE5fh/L+S27enpEKGSUTpCzGcy4GSsHkhERpSKMf8OPiQQMlQBiq05EkmKoWDjZXE
         YN35sAXd02YQkv+j098h+rWJMHvpbd4GAdPA9vr6HYzhXDg9KDzcYXGNS0z92QGLPJ3q
         SMgtxrzkjYIMXqv3Nf8IpnEGvB7CtOPnrLNyfl4Iw6hfh/o6KkYUpcEK1jRVCnReWNuF
         5P9LqsOtW9M4e4i2XyO1ut1/ScO/A0v40K48F09nbh1L24li+rY0q5TJOgOcNgmS+wcc
         O3Xw==
X-Gm-Message-State: ACrzQf2hZ0K1ZuNztgMBgnAo/6VlqlEgp3HSo9srZaJXFOgdUEeJu8Cz
	D4d3wIgOCF4dztXYTI4CwyLuDdUdhsXctg==
X-Google-Smtp-Source: AMsMyM7yaTjKG0L3SiXMiQv2XIrpu7i+abtMvoArd0f7iiIlhTezUubN5WiOJHltAopERNWmerJVPQ==
X-Received: by 2002:ac8:5804:0:b0:39c:d63c:95b7 with SMTP id g4-20020ac85804000000b0039cd63c95b7mr24190261qtg.216.1666552041476;
        Sun, 23 Oct 2022 12:07:21 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id f24-20020ac84658000000b0039cbb50951asm11475446qto.24.2022.10.23.12.07.20
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 12:07:20 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id j130so8923532ybj.9
        for <regressions@lists.linux.dev>; Sun, 23 Oct 2022 12:07:20 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:6ca:9345:b2ee with SMTP id
 c4-20020a5b0984000000b006ca9345b2eemr7353445ybq.362.1666552040395; Sun, 23
 Oct 2022 12:07:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <166654892458.2211781.4685104302005471754@leemhuis.info>
In-Reply-To: <166654892458.2211781.4685104302005471754@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 23 Oct 2022 12:07:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj=S4zUePrFp-i-O7OL5pP+jHCWTWSmxzhdn7nqZJ9-qQ@mail.gmail.com>
Message-ID: <CAHk-=wj=S4zUePrFp-i-O7OL5pP+jHCWTWSmxzhdn7nqZJ9-qQ@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2022-10-23]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 23, 2022 at 11:22 AM Regzbot (on behalf of Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Hi Linus! Below is a slightly edited report from regzbot listing all
> regression from this cycle that the bot and I are currently aware of.

Thanks.

I'll fix up the obvious ones right away to not miss -rc2:

> [ *NEW* ] v6.1-rc1: Regression in notification of sethostname changes
> [ *NEW* ] Reboot failure on big endian mips systems

because that first one looks trivial, and the second one I don't want
to see *again* in an rc on Guenter's list of problems ;)

The others I will have to wait for maintainers for.

                Linus
