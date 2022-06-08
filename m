Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618367C
	for <regressions@lists.linux.dev>; Wed,  8 Jun 2022 06:54:30 +0000 (UTC)
Received: from mail-oi1-f179.google.com ([209.85.167.179]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Ml6Zo-1nKJEF3qOa-00lXM8 for <regressions@lists.linux.dev>; Wed, 08 Jun 2022
 08:54:28 +0200
Received: by mail-oi1-f179.google.com with SMTP id s8so21671729oib.6
        for <regressions@lists.linux.dev>; Tue, 07 Jun 2022 23:54:27 -0700 (PDT)
X-Gm-Message-State: AOAM531VTgiuevcZVi2M9QGiUdZP/iwhi0IvS5aOUU4BIoTxWuqhiHYG
	3C23830IA0hUXixs01tunmV704IdK3bQrJHLcX0=
X-Google-Smtp-Source: ABdhPJxtc+XXcM8lboPd0HxoO4C4pSgZz+o+2cydLY3T5VirSX+BmYIrJ5qFsX5R6uVftrDQIMIjbwfJ9FBTtFXxwBI=
X-Received: by 2002:a05:6808:1a2a:b0:32e:a1bd:368c with SMTP id
 bk42-20020a0568081a2a00b0032ea1bd368cmr1534573oib.155.1654671266622; Tue, 07
 Jun 2022 23:54:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYts-KH-R5EkBpz2u6H_Cx6YTXus1JKJS6yBxGhb0O2qQQ@mail.gmail.com>
 <CAK8P3a3QKWxqGore3+_DJnWo7bJgvDhkZjtkyg5EUg4_D=mE2w@mail.gmail.com> <Yp3L0JgLpk+s54Lw@FVFF77S0Q05N>
In-Reply-To: <Yp3L0JgLpk+s54Lw@FVFF77S0Q05N>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jun 2022 08:54:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3X0UwQiVNZqvGmSKi8BX6zg=k07+9Q3rDGqHVkc8Hdsg@mail.gmail.com>
Message-ID: <CAK8P3a3X0UwQiVNZqvGmSKi8BX6zg=k07+9Q3rDGqHVkc8Hdsg@mail.gmail.com>
Subject: Re: gcc-12: build errors: arch/arm64/kernel/setup.c:225:56: warning:
 array subscript -1 is outside array bounds of 'char[]' [-Warray-bounds]
To: Mark Rutland <mark.rutland@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	John Donnelly <john.p.donnelly@oracle.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Hildenbrand <david@redhat.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:hRy8A44cKt4EKG+atdziHlSNHtstPLhvCG2I2pNxlWycSK/HvIy
 3gAs1vaN+P3ArCJNlh10eb9cOEqN0f0fN2Mv1utCNWg+1CfKuO2K4x1FQVcF83iwcuvnSmf
 JhBqs6pgbGrz91HAfYxbKjBmz0KYB/n4MdIX1Y7HdifXLvafY2bjSTCU+vdTw7NMD+mlRXr
 X/IuYzIptcyyTQBHnuE0Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PgXAPc4MzS0=:l2R5asAnIhufKY4P4lbo5O
 tCSTTUX026H7rmDVWULTJC0ZyoMzSFIHfF18hhQdxIbDYAa/IoBjw4LaJOqZPgfNJ80gaRWcl
 xraU3FwgXFf/s/E2Qq3oHeErTKnGme0vhng7Sa52OURYd/J6uI2KoIKy+3flpNdu466MhUanq
 SHdHjjObQToKghdOPr1Es9LBrQNa63vvIxmeNxtK7NnMFBcB1qGPdnAP1zRMOowS3avZrKIq9
 X85ECrj1Bzntico90irASKEG+G4iVZEeHK3AFLNm1rgNGZkuch3Lqmf1GUz1zsY/fW+cJlWNx
 40Qe1WDl7kzAzrpACYoXmj8nznET6XO+B3d8pga6r66FeohsXTuteUL7UgxJXP0SSxuWYGrWR
 9CoUGAwKQJItaM4KNjxpVSfhMDpd/FXNLiZIAnbISleW7qX8eZYCrXlSJ2gOoa8vaycFpw+Eo
 pnOCaFynejNaPt8ZXqyxbO/MA8MXgt8L4E4996IO1JIIhKl2q4U9kFpprl0Yo/Sc84iBdGz9I
 ngGmHa0kQt8g+o/n87VgYCoc7BmrPmQ7ICukWBrEcQa8o1Ai//PZTCVD/pe/6d0xQYnszm6Ci
 kTID5Tn35eYnucFRj+elBsS4uPt31UQC3ix/m9NE1vT5XtB0XG/o95DKGAbh1nDMjTOQ3CDly
 rH5lmgcD8GzTvzwN3GxbkjBiTR7S8Z1uCTYYC2pJ1qjFpaX+Z8G4kyhwoJHsyj7KS4HW8THmB
 lrILnDndCeIeiaCubf28PUQgZMNsW37Gi4lkYA==

On Mon, Jun 6, 2022 at 11:41 AM Mark Rutland <mark.rutland@arm.com> wrote:
> On Fri, Jun 03, 2022 at 09:40:07AM +0200, Arnd Bergmann wrote:
>
>         #define va_init_begin() RELOC_HIDE((unsigned long)__init_begin)
>
> ... which'd be a pain, but at least it'd solve this generally.
>
> > I think the easy fix would be to reword this line to
> >
> >        kernel_code.end     = __pa_symbol(__init_begin) - 1;
> >
>
> I agree that'd work for the __pa_symbol() cases.
>
> For consistency it might be worth using RELOC_HIDE(), e.g.
>
>         kernel_code.end     = __pa_symbol(RELOC_HIDE(__init_begin)) - 1);
>asm-gener
> ... which IIUC should do the trick.
>

I see we have similar logic on each architecture, and they probably
all have the same
issue now, so maybe we can just do a helper function in include/linux/ioport.h
(which has all the struct resource logic) that can be called like

resource_set_pa(&kernel_code, _stext, __init_begin);
resource_set_pa(&kernel_data, _sdata, _end);

      Arnd
