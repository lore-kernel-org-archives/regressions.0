Received: from condef-06.nifty.com (condef-06.nifty.com [202.248.20.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8C72573
	for <regressions@lists.linux.dev>; Wed, 21 Dec 2022 15:45:23 +0000 (UTC)
Received: from conssluserg-05.nifty.com ([10.126.8.84])by condef-06.nifty.com with ESMTP id 2BLFdodF021674
	for <regressions@lists.linux.dev>; Thu, 22 Dec 2022 00:39:50 +0900
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45]) (authenticated)
	by conssluserg-05.nifty.com with ESMTP id 2BLFdaUB015306
	for <regressions@lists.linux.dev>; Thu, 22 Dec 2022 00:39:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 2BLFdaUB015306
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1671637177;
	bh=e5zLKGROubDNVvYxZKupYtEZfQJgPSYQABMW+J+3mDs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=xNtSKmCWEoxmpMGBvN9ieu4widdAifgZmD1YWGYQ8KRJs/UXoP2AYWa+854iilMPn
	 QYu/Px2/7KUS9YVG+3xRwH+D4vmYgnJjkj97LDPn2YF3K6OIMFjvPveM4SLnsnGayy
	 R44AClZ653RPjMLj7tfa7zHNgM2vOcZyoiOq9+uIwo2/cpkNr+sK1YvzgoifdsUFVO
	 vxG47DR6bDvj4ijZUuySzjmkash/lfjZc7US6fYP6tRakh3+IZ7uCk7ToIg+e7PEPZ
	 IkEOo/slEWPDzUeDIHpufADvgnjOitJY4xwgU2fdVi36/alpA+kveK54t0AXWb7+NZ
	 IHEij96gekoQA==
X-Nifty-SrcIP: [209.85.160.45]
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1447c7aa004so19540637fac.11
        for <regressions@lists.linux.dev>; Wed, 21 Dec 2022 07:39:37 -0800 (PST)
X-Gm-Message-State: AFqh2kryhwGV+U6C0cBXPkk5lHkzq2hsDz1Rp2XlPPyiIuFh1CwC9xln
	auDw8eHUYUZlOHhbL2eCqfuuHBBQ0vhwMynU5ps=
X-Google-Smtp-Source: AMrXdXu5wBUNkd6f+ZHBJHJAfJjzw4vVTST+099spBVLipN+anBHxC5siTmFSLQ2Jxj/8kubYP90fcs7i0BaTV1TKzk=
X-Received: by 2002:a05:6870:4c0e:b0:144:a2de:1075 with SMTP id
 pk14-20020a0568704c0e00b00144a2de1075mr113181oab.194.1671637176438; Wed, 21
 Dec 2022 07:39:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAABkxwuQoz1CTbyb57n0ZX65eSYiTonFCU8-LCQc=74D=xE=rA@mail.gmail.com>
 <26bd2928-9d62-32b3-4f9f-9dd9293cefeb@leemhuis.info>
In-Reply-To: <26bd2928-9d62-32b3-4f9f-9dd9293cefeb@leemhuis.info>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 22 Dec 2022 00:39:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ5VVRdrewtxrBdw561LL=yY8fdr=i1e7pp4DRht=r_Ww@mail.gmail.com>
Message-ID: <CAK7LNAQ5VVRdrewtxrBdw561LL=yY8fdr=i1e7pp4DRht=r_Ww@mail.gmail.com>
Subject: Re: BUG: arm64: missing build-id from vmlinux
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
        Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
        Dennis Gilmore <dennis@ausil.us>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 21, 2022 at 5:23 PM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Hi, this is your Linux kernel regression tracker. CCing the regression
> mailing list, as it should be in the loop for all regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html
>
> On 18.12.22 21:51, Dennis Gilmore wrote:
> > The changes in https://lore.kernel.org/linux-arm-kernel/166783716442.32724.935158280857906499.b4-ty@kernel.org/T/
> > result in vmlinux no longer having a build-id.
>
> FWIW, that's 994b7ac1697b ("arm64: remove special treatment for the link
> order of head.o") from Masahiro merged through Will this cycle.
>
> > At the least, this
> > causes rpm builds to fail. Reverting the patch does bring back a
> > build-id, but there may be a different way to fix the regression
>
> Makes me wonder if other distros or CIs relying on the build-id are
> broken, too.
>
> Anyway, the holiday season is upon us, hence I also wonder if it would
> be best to revert above change quickly and leave further debugging for 2023.
>
> Masahiro, Will, what's your option on this?


I do not understand why you rush into the revert so quickly.
We are before -rc1.
We have 7 weeks before the 6.2 release
(assuming we will have up to -rc7).

If we get -rc6 or -rc7 and we still do not
solve the issue, we should consider reverting it.



The problem is that the .notes section was
turned into PROGBITS.



$ aarch64-linux-gnu-readelf -S  vmlinux.good

   [ snip ]

  [ 7] .notes            NOTE             ffffffc0082c53a0  002d53a0
       0000000000000054  0000000000000000   A       0     0     4



$ aarch64-linux-gnu-readelf -S  vmlinux.bad

  [ snip ]

  [ 7] .notes            PROGBITS         ffffffc0082c5380  002d5380
       0000000000000054  0000000000000000   A       0     0     4




I just want to figure out why the linker transforms it this way.







>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>
> P.S.: As the Linux kernel's regression tracker I deal with a lot of
> reports and sometimes miss something important when writing mails like
> this. If that's the case here, don't hesitate to tell me in a public
> reply, it's in everyone's interest to set the public record straight.
>
> #regzbot ^introduced 994b7ac1697b
> #regzbot title arm64: missing build-id in vmlinux breaks at leas
> Fedora's kernel packaging
> #regzbot ignore-activity



-- 
Best Regards
Masahiro Yamada
