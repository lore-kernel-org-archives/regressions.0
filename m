Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B802F27
	for <regressions@lists.linux.dev>; Thu,  5 Jan 2023 14:36:38 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id a30so9829945pfr.6
        for <regressions@lists.linux.dev>; Thu, 05 Jan 2023 06:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FBneq5lt5MOzMjewVE4OSFgwS9aqC54CXzL7Ey/uWbo=;
        b=D0J+pYxxg/nL6w72HzCmO9Ju7tFJr4HZGEtqpo9TfMRjcP1AmxD4BLEjDniCvxM3h6
         gTn90rVDA3LHWD+a30UHcObPY+SaSgjvTrTAABZ2VI3Bz0dnaOeLF0J2GHQpl5/4Nrzh
         +81yW445LEssZAeIdPgqdLgB50qWVNDkiGB8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBneq5lt5MOzMjewVE4OSFgwS9aqC54CXzL7Ey/uWbo=;
        b=laxUYaxOo4UxHUvu03kaDvUBVzwY2ZxkaVj5H0yo0P1+A0FKorERjUNH23V1VvUJho
         y2sNrHfdI2tuG2j95Q9cKuMEs1eJflol8Cb6RAz/MBAdhU+LYTdIXoj8VDR0x4dd6uWX
         FlBX/GAW4M3Lfm9RgmnItnfk4RFzgMn4eHscyqfC4njzXU7Uc4q5IF1SAaaW8niiRsYw
         ++wOHsbRBaFoKh4GwCLmiL+hZEt15NtLryRu8eZGySbji+Dbw7KYR6+gVsIGg0wXSo56
         k5IUy+ZBhgyuofCXtkMrjTOtUiKXQ0Zse7MKChnv8MbZVboPbimCXVm4jLxhGPVaRT34
         MXNw==
X-Gm-Message-State: AFqh2ko4ROaw1yR0HbastpqotOlG7r9IGBxeZB5tTuoBTD1+IwUJmyMm
	7QVSa6B5019mIPf7Uvz7+cE6TBpcI970NN1sycE=
X-Google-Smtp-Source: AMrXdXus9TQM14sHyoqrnaN1NhpxmzEV+8ATWiW9+LxPiAUMZ+UYIFXXFwM0IA1DVX/GK5Om8+wIXg==
X-Received: by 2002:a62:1554:0:b0:581:7d45:799f with SMTP id 81-20020a621554000000b005817d45799fmr30826326pfv.9.1672929398104;
        Thu, 05 Jan 2023 06:36:38 -0800 (PST)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com. [209.85.214.182])
        by smtp.gmail.com with ESMTPSA id r25-20020aa79639000000b00574ab0e053bsm17552619pfg.187.2023.01.05.06.36.37
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 06:36:37 -0800 (PST)
Received: by mail-pl1-f182.google.com with SMTP id d15so39522025pls.6
        for <regressions@lists.linux.dev>; Thu, 05 Jan 2023 06:36:37 -0800 (PST)
X-Received: by 2002:a17:902:f682:b0:186:9cf4:e53b with SMTP id
 l2-20020a170902f68200b001869cf4e53bmr2678978plg.50.1672929396954; Thu, 05 Jan
 2023 06:36:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <trinity-bd6bf7f8-5dbc-42fc-891b-8bfc802a1a2c-1672136902605@3c-app-gmx-bap27>
 <24ef21b2-d1db-1525-7d3f-2c978e73c25b@leemhuis.info> <CANiDSCunU4dqiDgNr2mz=MxD+wzTu6V2vZWqY+AC4DqQvwVh4w@mail.gmail.com>
 <752823ee-1aec-7536-095d-6a018e1dd909@leemhuis.info> <1cbfec6f-1f93-379e-608e-17a0d904834d@leemhuis.info>
In-Reply-To: <1cbfec6f-1f93-379e-608e-17a0d904834d@leemhuis.info>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 5 Jan 2023 15:36:25 +0100
X-Gmail-Original-Message-ID: <CANiDSCs4HQwX6PG-62yonO8Pfo+N5XZN2zv-bA7=zqMDG0Arwg@mail.gmail.com>
Message-ID: <CANiDSCs4HQwX6PG-62yonO8Pfo+N5XZN2zv-bA7=zqMDG0Arwg@mail.gmail.com>
Subject: Re: [BUG] 6.2-rc1 spi-mt65xx broken on mt7986
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Thorsten

On Thu, 5 Jan 2023 at 14:34, Linux kernel regression tracking
(#update) <regressions@leemhuis.info> wrote:
>
> On 05.01.23 13:59, Thorsten Leemhuis wrote:
> > On 05.01.23 13:40, Ricardo Ribalda wrote:
> >>
> >> I replied on my phone, so the mail came out in html and the list did
> >> not pick it up, then Frank also answered in html.
> >>
> >> I believe we are good with this:
> >> https://lore.kernel.org/all/Y7WOlkuLaLt1DdY+@sirena.org.uk/
> >
> > Ohh, that was the same issue? I had missed that (and it's pretty obvious
> > when I look at it now :-/ ). Sorry for the noise then, but these things
> > happen when dealing with so many different regressions.
> >

Absolutely no worries. Thanks again!

> >> Thanks for headsup anyway
> >
> > Many thx for clarifying!
> >
> > #regzbot fix: spi: mediatek: Enable irq when pdata is ready
>
> Sigh, seem I'm too stupid for proper copy'n'paste today and want to fix
> it up now; sorry for the noise:
>
> #regzbot fix: spi: mediatek: Enable irq before the spi registration
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> That page also explains what to do if mails like this annoy you.
>
> >> On Thu, 5 Jan 2023 at 13:21, Thorsten Leemhuis
> >> <regressions@leemhuis.info> wrote:
> >>>
> >>> [CCing the regression mailing list, as it should be in the loop:
> >>> https://docs.kernel.org/admin-guide/reporting-regressions.html]
> >>>
> >>> On 27.12.22 11:28, Frank Wunderlich wrote:
> >>>> Hi,
> >>>>
> >>>> the following commit breaks SPIM-NOR on mt7986:
> >>>>
> >>>> c6f7874687f7 2022-11-28 spi: mediatek: Enable irq when pdata is ready
> >>>
> >>> Ricardo, do you have this report on your radar? Just wondering, as it
> >>> was posted a week ago and didn't even get a single reply afaics. This of
> >>> course can happen at this time of the year, but I thought a quick status
> >>> inquiry wouldn't hurt.
> >>>
> >>>>> [    2.145931] pc : mtk_spi_can_dma+0x0/0x34
> >>>>> [    2.155212] lr : mtk_spi_interrupt+0x74/0x360
> >>>>>
> >>>>> [    2.091801] mtk-spi 1100a000.spi: spi-mem transfer timeout
> >>>>> [    2.097310] spi-nor: probe of spi0.0 failed with error -110
> >>>>> [    2.102930] Unable to handle kernel read from unreadable memory at virtual address 0000000000000010
> >>>>
> >>>> after reverting the commit, no trace happens and nor is recognized on my board
> >>>
> >>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> >>> --
> >>> Everything you wanna know about Linux kernel regression tracking:
> >>> https://linux-regtracking.leemhuis.info/about/#tldr
> >>> If I did something stupid, please tell me, as explained on that page.
> >>>
> >>> #regzbot poke
> >>
> >>
> >>



-- 
Ricardo Ribalda
