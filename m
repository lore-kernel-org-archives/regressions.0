Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BDB134AF
	for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 15:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B543C433C9
	for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 15:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688054147;
	bh=92HydDe45AGDX9dynHzLshwuSsch3BNAxhqa/UjZaHk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n1Gx1IW1T7DfRPDNYIGrKB5opyPVLvykoJxu869egG9sn4CgC9VEzGfVLEFV2UUfZ
	 E8zf+2xHglgfT3FWnkRR8PCSoucSI6TDSZ1FxCi1BlVP23QRAfaGL6z4cLTcGup47S
	 VkE2ftnUwIA0gl1EbFqyb9CBp4Vxsuc2vTVRbSBr0trv521ipGyxgfvVyayYaXkGz3
	 UP4lCZN2HE8acuAgilCTKepbEnJdDD0QALeq2JK7+zbmgYylmMjgDB0mBdMvWKtiHL
	 kUWmCD7seioZSgT0nShaf9Gp4atKrHi4rCLYZikUC9jSt294+YsjNebA5rU6LMXekC
	 WBOU8iwG4HDqA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b6a662b9adso12845571fa.2
        for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 08:55:47 -0700 (PDT)
X-Gm-Message-State: ABy/qLYf8dP+sS7eI3SYotPErQzhuomboIvomkPE3eBjeZu1SYC6jG9z
	JDkoliwmQvLBkZ3JWha/quJm4Zlg1bzTyeHr8cM=
X-Google-Smtp-Source: APBJJlFP2ARHuv/abBCve1LufqNBizctsmLOu0T/pB9oPTFpA4Ooj/qis7utDLa2lKr8qhXIN0qAX/4DwKDi7FvO9zM=
X-Received: by 2002:a2e:980c:0:b0:2b6:9e83:73da with SMTP id
 a12-20020a2e980c000000b002b69e8373damr104154ljj.32.1688054145664; Thu, 29 Jun
 2023 08:55:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZJ2H5FWuo9oDMgPm@debian> <be9320b5-7613-be0f-ffcd-4b3041ea5836@huaweicloud.com>
 <13abe42f-2f5f-cbaf-21b8-baa4516963aa@leemhuis.info>
In-Reply-To: <13abe42f-2f5f-cbaf-21b8-baa4516963aa@leemhuis.info>
From: Song Liu <song@kernel.org>
Date: Thu, 29 Jun 2023 08:55:33 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4Wf+PLDCZ7JpHzVT81ubj1Y6MCyLm-BWcVmB1jRqYEGg@mail.gmail.com>
Message-ID: <CAPhsuW4Wf+PLDCZ7JpHzVT81ubj1Y6MCyLm-BWcVmB1jRqYEGg@mail.gmail.com>
Subject: Re: mainline build failure due to 8295efbe68c0 ("md/raid1-10: factor
 out a helper to submit normal write")
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Yu Kuai <yukuai1@huaweicloud.com>, 
	"Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Jens,

On Thu, Jun 29, 2023 at 7:10=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 29.06.23 15:56, Yu Kuai wrote:
> >
> > =E5=9C=A8 2023/06/29 21:32, Sudip Mukherjee (Codethink) =E5=86=99=E9=81=
=93:
> >> The latest mainline kernel branch fails to build x86_64, arm64 and arm
> >> allmodconfig
>
> Thx for the report.
>
> > Thanks for the testing, which branch are you testing?
> >
> > This problem is already fixed in latest mainline kernel:
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3Db5a99602b74bbfa655be509c615181dd95b0719e

Hi Jens,

The fix is in the for-6.5/block-late branch.

https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commi=
t/?h=3Dfor-6.5/block-late&id=3Db5a99602b74bbfa655be509c615181dd95b0719e

Would you send a pull request with it? Or would you prefer
some other solution for the issue?

AFAICT, it will fix clang build with RANDSTRUCT.

Thanks,
Song

>
> And thx for the reply. :-D
>
> FWIW, that fix afaics is still in -next and hasn't reached mainline yet.
> But I guess that will change within a few days.
>
> >> #regzbot introduced: 8295efbe68c080047e98d9c0eb5cb933b238a8cb
>
> #regzbot fix: b5a99602b74bbfa6
> #regzbot dup-of: https://lore.kernel.org/all/ZJ2M4yqnOCqqGWH0@debian/
> #regzbot ignore-activity
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
