Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456BF10946
	for <regressions@lists.linux.dev>; Mon,  3 Jul 2023 18:27:32 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-579dd20b1c8so30209417b3.1
        for <regressions@lists.linux.dev>; Mon, 03 Jul 2023 11:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688408851; x=1691000851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0isKEjHX7MEXue9Pz1Ccur/ZC63GmueF0VlBtGm8EoI=;
        b=w1rSlYr2bJam65DS0lPRCw3JfxRfPJVIeGkLawuH0QVACpcv1cEbmN3yS/9d9Jhd2y
         gWuA/6yRdVojMzVcjWIoMQnCRFrBdHsUCri4YQmwmCGqvmVgnRUjcImEV42CF9p2HNUt
         RNIJjoJMpBM8Yqs72KNbG+Q7Vclm2QBRCgMhwvmKmKBAHfyzQgGK9V+bBOc5xngTKVY+
         R4t792TUWP12OJYQgjh6dTgC1nO4V6mOoZVzPzmVhbvkDRUxjx7H8hIFK+KllI/p1SSS
         NKySvyUZum+exg7sN4tpowuv7DwRGfJ+F1AbKfbFzZFthr0ez+mTc3XlVxhYkdNO0qgi
         O3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688408851; x=1691000851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0isKEjHX7MEXue9Pz1Ccur/ZC63GmueF0VlBtGm8EoI=;
        b=hbp/kQcg2ncrEryPFonTXAb46bSS/zC+w0iJ/RnT9VqkYXD0wx84nUB8eIsAOYarMF
         UgQR1C90wGoqyrh6YYLzPa6cFkwO593Pj3BEt9UTSlDoZQw8XQN9h5sN3Z4WDR22lvHi
         JH6vMip1VwhozC2VW9iyO5hE7n93a+mcfyj5feJX0PXDRPL91d+zmy9QTCb1ceCjiOGG
         kx9fkX8B7Ruh7M/buX7a0jPT202AEPmQ2OaMwNagujFVS3DX8JUeGrxTzLQz5dJge5KV
         TLxS8lPIp3O5whg/beYx1cJhu09zwwbKFD6c30p3DMDluheymUFxRFaTs3DO3cGWlJG/
         BrJw==
X-Gm-Message-State: ABy/qLYKF/aG//8U2wTZqh5Cl3cYZpcTPg1is9hH58ceOiMWZX3dI5i1
	M3CoNT+Q9DfZ+idFYhLH4bRM3/Md2DOq+b1AYDYEJ2hYTy8Q59g+FmGriA==
X-Google-Smtp-Source: APBJJlEcsiSJampqWvnjg3CAmKUIwmDnEsqWjNRvFLw+nAO0EpYIPr1eboqaZF2mndFRhRVNL+SZzDgLqiS3KzAbWO4=
X-Received: by 2002:a05:6902:603:b0:c40:e589:7c09 with SMTP id
 d3-20020a056902060300b00c40e5897c09mr9113458ybt.26.1688408850615; Mon, 03 Jul
 2023 11:27:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info> <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
In-Reply-To: <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 3 Jul 2023 11:27:19 -0700
Message-ID: <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jacob Young <jacobly.alt@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, 
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 3, 2023 at 11:08=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Mon, Jul 3, 2023 at 2:53=E2=80=AFAM Linux regression tracking (Thorste=
n
> Leemhuis) <regressions@leemhuis.info> wrote:
> >
> > On 02.07.23 14:27, Bagas Sanjaya wrote:
> > > I notice a regression report on Bugzilla [1]. Quoting from it:
> > >
> > >> After upgrading to kernel version 6.4.0 from 6.3.9, I noticed freque=
nt but random crashes in a user space program.  After a lot of reduction, I=
 have come up with the following reproducer program:
> > > [...]
> > >> After tuning the various parameters for my computer, exit code 2, wh=
ich indicates that memory corruption was detected, occurs approximately 99%=
 of the time.  Exit code 1, which occurs approximately 1% of the time, mean=
s it ran out of statically-allocated memory before reproducing the issue, a=
nd increasing the memory usage any more only leads to diminishing returns. =
 There is also something like a 0.1% chance that it segfaults due to memory=
 corruption elsewhere than in the statically-allocated buffer.
> > >>
> > >> With this reproducer in hand, I was able to perform the following bi=
section:
> > > [...]
> > >
> > > See Bugzilla for the full thread.
> >
> > Additional details from
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D217624#c5 :
> >
> > ```
> > I can confirm that v6.4 with 0bff0aaea03e2a3ed6bfa302155cca8a432a1829
> > reverted no longer causes any memory corruption with either my
> > reproducer or the original program.
> > ```
> >
> > FWIW: 0bff0aaea03 ("x86/mm: try VMA lock-based page fault handling
> > first") [merged for v6.4-rc1, authored by Suren Baghdasaryan [already C=
Ced]]
> >
> > That's the same commit that causes build problems with go:
> >
> > https://lore.kernel.org/all/dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel=
.org/
>
> Thanks! I'll investigate this later today. After discussing with
> Andrew, we would like to disable CONFIG_PER_VMA_LOCK by default until
> the issue is fixed. I'll post a patch shortly.

Posted at: https://lore.kernel.org/all/20230703182150.2193578-1-surenb@goog=
le.com/

>
> >
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat=
)
> > --
> > Everything you wanna know about Linux kernel regression tracking:
> > https://linux-regtracking.leemhuis.info/about/#tldr
> > If I did something stupid, please tell me, as explained on that page.
> >
> > #regzbot introduced: 0bff0aaea03e2a3
