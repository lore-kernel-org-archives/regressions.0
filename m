Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7005C33D0
	for <regressions@lists.linux.dev>; Thu,  5 Jan 2023 12:40:57 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id 18so13028229pfx.7
        for <regressions@lists.linux.dev>; Thu, 05 Jan 2023 04:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LnXaK3HYfg+sF+zo9OjEmDlKFzBQ2X9tvLZNIaK2n9w=;
        b=WqOPsqXX2ewSvH7B48+QZ9gexACaAIPSTW6samQrhGDk3ReNr+z1v8Q0NBGukBAtx1
         a0oOxDFOoEU+ckgoMN8keKHg34F/H5sp1CUAo5gmiuDGQ3//P639SAyGMgd8WqrDuoD3
         vpJjb/Vi5r74Fdr7/ULMEpelUSHr1SzrCOdgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnXaK3HYfg+sF+zo9OjEmDlKFzBQ2X9tvLZNIaK2n9w=;
        b=KodZbXE9THuq/nDm8eA9Ug7xUfUBot1GX5xpgmrQckTptOMwcfR1ouc3geTIwbLzoJ
         5NrUhS/opXXe9ed7CX2UWJTlDqdqyTYcGTDUhy1f8iFbVg8Y8cAtjtXZIh/ZjmEa+zBX
         MFsc835LJmPLNEU6ZbSG00SNofcT/eEqBlykbcchGLYr1O+lz6OpE3u7n5wSagJomBFI
         on4nmlFSYtO+5YEaGa+jP7U6kMWDEgzitFoSda3kMTjEbA1aJ075bn9DbZHyHzeWqQjr
         XFK5kZHf8grkGkprm2LiYuelbfhOt15sxA6H8PhfjMYleo8iMLW0gn3goOJ87VySQboV
         Zh4A==
X-Gm-Message-State: AFqh2krrz3InUzFHVylWN8qf3jtPhKZQWG5RoboVw+KjOYGR1IhmBiuy
	qHHxewcDtb5cLjKBhbzrch4/RlLlv38/ew4q43E=
X-Google-Smtp-Source: AMrXdXsrr1KLaJvHv5Dx/5WrxA55sXd6xWCA4yR6/EfHKDECMGmBOyJCRU24CQq0IQIGErtjaH9/cw==
X-Received: by 2002:aa7:921a:0:b0:576:de1:cd32 with SMTP id 26-20020aa7921a000000b005760de1cd32mr55708343pfo.0.1672922456540;
        Thu, 05 Jan 2023 04:40:56 -0800 (PST)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com. [209.85.210.170])
        by smtp.gmail.com with ESMTPSA id i68-20020a626d47000000b0056b4c5dde61sm24984902pfc.98.2023.01.05.04.40.55
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 04:40:55 -0800 (PST)
Received: by mail-pf1-f170.google.com with SMTP id a184so14438959pfa.9
        for <regressions@lists.linux.dev>; Thu, 05 Jan 2023 04:40:55 -0800 (PST)
X-Received: by 2002:a63:1709:0:b0:48c:8cc5:1b73 with SMTP id
 x9-20020a631709000000b0048c8cc51b73mr3002833pgl.520.1672922455058; Thu, 05
 Jan 2023 04:40:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <trinity-bd6bf7f8-5dbc-42fc-891b-8bfc802a1a2c-1672136902605@3c-app-gmx-bap27>
 <24ef21b2-d1db-1525-7d3f-2c978e73c25b@leemhuis.info>
In-Reply-To: <24ef21b2-d1db-1525-7d3f-2c978e73c25b@leemhuis.info>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 5 Jan 2023 13:40:43 +0100
X-Gmail-Original-Message-ID: <CANiDSCunU4dqiDgNr2mz=MxD+wzTu6V2vZWqY+AC4DqQvwVh4w@mail.gmail.com>
Message-ID: <CANiDSCunU4dqiDgNr2mz=MxD+wzTu6V2vZWqY+AC4DqQvwVh4w@mail.gmail.com>
Subject: Re: [BUG] 6.2-rc1 spi-mt65xx broken on mt7986
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Thorsten

I replied on my phone, so the mail came out in html and the list did
not pick it up, then Frank also answered in html.

I believe we are good with this:
https://lore.kernel.org/all/Y7WOlkuLaLt1DdY+@sirena.org.uk/

Thanks for headsup anyway

Regards!

On Thu, 5 Jan 2023 at 13:21, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> [CCing the regression mailing list, as it should be in the loop:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>
> On 27.12.22 11:28, Frank Wunderlich wrote:
> > Hi,
> >
> > the following commit breaks SPIM-NOR on mt7986:
> >
> > c6f7874687f7 2022-11-28 spi: mediatek: Enable irq when pdata is ready
>
> Ricardo, do you have this report on your radar? Just wondering, as it
> was posted a week ago and didn't even get a single reply afaics. This of
> course can happen at this time of the year, but I thought a quick status
> inquiry wouldn't hurt.
>
> >> [    2.145931] pc : mtk_spi_can_dma+0x0/0x34
> >> [    2.155212] lr : mtk_spi_interrupt+0x74/0x360
> >>
> >> [    2.091801] mtk-spi 1100a000.spi: spi-mem transfer timeout
> >> [    2.097310] spi-nor: probe of spi0.0 failed with error -110
> >> [    2.102930] Unable to handle kernel read from unreadable memory at virtual address 0000000000000010
> >
> > after reverting the commit, no trace happens and nor is recognized on my board
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot poke



-- 
Ricardo Ribalda
