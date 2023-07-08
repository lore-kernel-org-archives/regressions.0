Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272E28BF4
	for <regressions@lists.linux.dev>; Sat,  8 Jul 2023 19:23:12 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b6b98ac328so46360181fa.0
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 12:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688844191; x=1691436191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=joV2BdE7YOFZ22mdVaTCQPGn7sLlO9d89m2/O8Ni8nw=;
        b=D3RX6rp3lCrrjPF+L3zCXesnJw5RyO+lgEbv0AAhuEyHVkjaQbhHCI3DJSL+JV1UdL
         FT8zki389vPUBvZczSd6HJ3nLMNQELFbQV4ZWqlDXDk5sgK6AKcyc1251+rXw9DHWw9+
         XZZ3PBzwHrnsMFfW4ooU7vEIixQouCLoustDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688844191; x=1691436191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=joV2BdE7YOFZ22mdVaTCQPGn7sLlO9d89m2/O8Ni8nw=;
        b=MxAoAX7Fq/2oZgB5rt6cH0XS1PEMOVfokDWolCLgYxf341Fzo/dh1zJflxFr4Xe/E8
         ze9VfRkt+BkPwXplZ9sm8FmqSCLewbbqQYFQe0O3wj2a/qOtPcaXzg5JbVpwnuWpUeZi
         RsKxfucqifK8OG/7L9nYt3lpRD6Bp4YhwFpdtf60m+29DX9Hl5M54d39CzWEYEh7l9uE
         rpfRvf7dStgL0QcvhPACOM+z8ZCmb+6ToqdpJJhkrBA/4wNToh40GUZNDPsEeW+jfWMG
         L3mx8cFH6mcOtL8BopdWugdUlU57TuAPW2tMXIvZ8hxmPiOFbPYaKwwpIr4IvERQZPNZ
         NAlg==
X-Gm-Message-State: ABy/qLYz/vxEmwgbPAnIMhlDMoLA3E/FE973rnHmjBxF33uAH8HBvt11
	j9B4UWcDIGGdX3CkeQzJ3ncyThEGL20Kts5oOyz2JQc0
X-Google-Smtp-Source: APBJJlHvske0S3srav5s9/EX80aGH3yMpCyTIzuZcIfCNGsB0xnIKHIlb3oCvedVEhdevO38+ASmaw==
X-Received: by 2002:a2e:9591:0:b0:2b4:7380:230 with SMTP id w17-20020a2e9591000000b002b473800230mr5865123ljh.13.1688844190771;
        Sat, 08 Jul 2023 12:23:10 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id q4-20020a170906a08400b0099307520b8csm3833962ejy.29.2023.07.08.12.23.10
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 12:23:10 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fbf1b82dc7so33673935e9.2
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 12:23:10 -0700 (PDT)
X-Received: by 2002:a5d:684c:0:b0:314:4915:689 with SMTP id
 o12-20020a5d684c000000b0031449150689mr7611320wrw.34.1688844189725; Sat, 08
 Jul 2023 12:23:09 -0700 (PDT)
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
 <20230705084906.22eee41e6e72da588fce5a48@linux-foundation.org>
 <df1d7d39-56f3-699c-0d0f-fcc8774f182e@leemhuis.info> <CAHk-=whKd05V49AbZGF=inYmhU6H_yNvvw1grWyhQfQ=9+5-VQ@mail.gmail.com>
 <20230708103936.4f6655cd0d8e8a0478509e25@linux-foundation.org>
 <CAHk-=wh498i3s+BgOF=pUOF=Qe_A0A16-mFcH2YGy+iZXvNChQ@mail.gmail.com>
 <CAJuCfpFLc1yoZm9uqRcmcwtFNGHYKyjxrc71tzXennpGB7QbYQ@mail.gmail.com>
 <CAHk-=wi-99-DyMOGywTbjRnRRC+XfpPm=r=pei4A=MEL0QDBXA@mail.gmail.com> <CAJuCfpHszCAc5hDdsxry+1xh3kz+=jsYdBCXKQez-Th9LESSZA@mail.gmail.com>
In-Reply-To: <CAJuCfpHszCAc5hDdsxry+1xh3kz+=jsYdBCXKQez-Th9LESSZA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 Jul 2023 12:22:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi=+qS+5v_7mVxKWUSOKaxzC2V8N7hyFVt1qTWGM_pmAQ@mail.gmail.com>
Message-ID: <CAHk-=wi=+qS+5v_7mVxKWUSOKaxzC2V8N7hyFVt1qTWGM_pmAQ@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Jacob Young <jacobly.alt@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, 
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Jul 2023 at 12:17, Suren Baghdasaryan <surenb@google.com> wrote:
>
> Do you want me to disable per-VMA locks by default as well?

No. I seriously believe that if the per-vma locking is so broken that
it needs to be disabled in a development kernel, we should just admit
failure, and revert it all.

And not in a "revert it for a later attempt" kind of way.

So it would be a "revert it because it added insurmountable problems
that we couldn't figure out" thing that implies *not* trying it again
in that form at all, and much soul-searching before somebody decides
that they have a more maintainable model for it all.

If stable decides that the fixes are not back-portable, and the whole
thing needs to be disabled for stable, that's one thing. But if we
decide that in mainline, it's a "this was a failure" thing.

           Linus
