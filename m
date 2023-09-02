Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B7F33E3
	for <regressions@lists.linux.dev>; Sat,  2 Sep 2023 09:52:07 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-64f4043dd38so2114446d6.1
        for <regressions@lists.linux.dev>; Sat, 02 Sep 2023 02:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693648327; x=1694253127; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjdWtHgsDTB4R4Jq1soVJcM9QWTddW8JRmrExPBXbIU=;
        b=GW8a20QY8yZeYF1jQVJb8vLwAOkNm7wvVMUR6dpXvWjzpZJNygKdLL4j9jAT2zDM/5
         WT/Zloc0yi9NQbvoUoytV9BhFJmy5qoThpPtO3sM1jSyL812qtVjK1Sd3cNvY7KcbBoq
         8lZw/Z8dmw5bT5ooSGgDQ3Y2Z4+UczavbXUoA3BwWTFjJbM/jGoSSg14X1KrbeoaJIvi
         lo75JoIC2gx9zVnuEth9ZVNeGETXXTIHKcdab2uZmUV6NPAaom+H5UiWQoIxgJ5G1yo8
         lbPrTNs0Tq4ADO71G+bd9Sd8G2zVIkJ2EMDe53iK3a2OaNEDVWp+CiPoDk9Uwnrs4vdA
         rtrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693648327; x=1694253127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjdWtHgsDTB4R4Jq1soVJcM9QWTddW8JRmrExPBXbIU=;
        b=dAt2El90NObC0l9uqm2NeCMBMN9S6jUf0EVjUNyKHwVar5t/noL5aWt/XJHO4dMh4S
         iasEazpSDCaOkZYXJD6swbbZ99FxJX6AahcRMS8VC/LCoB2HUJsUrzU8c3YItJI8/5EC
         RdodLlg4AJe/nMDmpmxLRGwv0urQZvUsaarl8zGzwD2j5XgB9HRLL1bYhiaHqBMt3pk1
         y7EsocxYzCfdLqShgQrbNsa7hYhD3W9I7EvPeeI/ZtHbnkXVJsFtJzyIKjZ1lholQ6dH
         ewS+Lw7d9SverT0RC+r9ED649MJ6a9Z/VAljM5A/PAseuGt1iLbXAM6vy/l/6/qwuQUC
         wmww==
X-Gm-Message-State: AOJu0YxdJRpc7qRTTCgjdMLrp5QChD5K5MXCvS6qRzedjQOJH7k+L07A
	1kiMgNdQdczkYexJiOJDAOkbUnkyCEieyqasEEw=
X-Google-Smtp-Source: AGHT+IE3L2Pns1+lhVfe9SzdXHBx2qDiPbdxS5Iukb3V4eViqvyqRuX63PI3CMe4Qyd/74RfpRpqlmOCsBaldezjBWU=
X-Received: by 2002:a05:6214:f2e:b0:63c:7427:e7e9 with SMTP id
 iw14-20020a0562140f2e00b0063c7427e7e9mr5628283qvb.6.1693648326776; Sat, 02
 Sep 2023 02:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsNi8Tiv5zUPNXr6UJw6qV1VdaBEfGqEAMkkXE3QPvZuAQ@mail.gmail.com>
 <3548ca67-ce58-3bc6-fef5-348b98d7678b@google.com> <CABXGCsOyamBvQ=Y-M9HQBTfEDfaRwGqzXqayBm7L259Q+t+gJQ@mail.gmail.com>
 <98eb1ba4-5bd3-ee7-1a88-47b054dc938@google.com> <CABXGCsOPcu8R9rpdihNR5r822FAHBZ42wBa5XUa5RDVierD_tg@mail.gmail.com>
 <5e4d50d4-978-ce54-e1ae-40f7117dbf3d@google.com>
In-Reply-To: <5e4d50d4-978-ce54-e1ae-40f7117dbf3d@google.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sat, 2 Sep 2023 14:51:55 +0500
Message-ID: <CABXGCsOM0j7ME4iUDbf5fpLMxZicXHwT9aBGWXCNWUVSPUO0Sw@mail.gmail.com>
Subject: Re: 6.6/regression/bisected - after commit a349d72fd9efc87c8fd1d16d3164752d84a7275b
 system stopped booting
To: Hugh Dickins <hughd@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 2, 2023 at 3:48=E2=80=AFAM Hugh Dickins <hughd@google.com> wrot=
e:
> That was very disappointing: I found it hard to explain, but was thinking
> of sending you a similar patch, doing the same check on all your 32 CPUs =
-
> maybe the stall being on CPU 0 in your photo was accidental.
>
> But now I think I have the shameful answer (which studying your dmesg,
> and the 82328 jiffies at 86 seconds in your photo, did help me towards).
>
> That mm/pagewalk fix I put into 6.5 has a grievous oversight (and a
> video of your failing 6.6 bootup would likely have shown a WARN_ON_ONCE
> from the underflow in __rcu_read_unlock()).
>
> Please revert the debug patch I sent yesterday (or earlier today), please
> try booting with this one on top of a349d72fd9ef; and if that's successfu=
l,
> then please go back to your original Rawhide tree and apply this on top o=
f
> that, to confirm that boots to a working system too - thanks.
>
> With my apologies,
>
> [PATCH] mm/pagewalk: fix bootstopping regression from extra pte_unmap()
>
> [ Commit message yet to be written: it's actually something to go to
> 6.5 stable, to correct i386 CONFIG_HIGHPTE there - though we know of
> no case where it is actually hit. ]
>
> Signed-off-by: Hugh Dickins <hughd@google.com>
> ---
>  mm/pagewalk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index 2022333805d3..9e7d0276c38a 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -58,7 +58,7 @@ static int walk_pte_range(pmd_t *pmd, unsigned long add=
r, unsigned long end,
>                         pte =3D pte_offset_map(pmd, addr);
>                 if (pte) {
>                         err =3D walk_pte_range_inner(pte, addr, end, walk=
);
> -                       if (walk->mm !=3D &init_mm)
> +                       if (walk->mm !=3D &init_mm && addr < TASK_SIZE)
>                                 pte_unmap(pte);
>                 }
>         } else {
> --
> 2.35.3

Great, this is the right patch.
Both build a349d72fd9ef and latest in Rawhide (now it is 99d99825fc07)
works fine after applying this patch.
So thank you a lot.
Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

--=20
Best Regards,
Mike Gavrilov.
