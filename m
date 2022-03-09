Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C5D5107
	for <regressions@lists.linux.dev>; Wed,  9 Mar 2022 19:25:17 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id ay7so3684391oib.8
        for <regressions@lists.linux.dev>; Wed, 09 Mar 2022 11:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sZdhFaJEobLHUcXbgZ55Zl3n5c/STYpZoXh4bxvyXeo=;
        b=K51U7US/nV+BkVPmQJmjXEiv9gUhg6nSo1hKROyXZYMeYcrcBATR+1DdDO0+ZayScD
         TxGgiZCJDoAA75Plrcw5ly8nWEZBGWTWM0xSheapUbyXSF/xI3/rrPEYxyZVNiaHURW6
         KjlZNtHvOi41YlJktKdkgPhCMM7WJDRdUhtkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sZdhFaJEobLHUcXbgZ55Zl3n5c/STYpZoXh4bxvyXeo=;
        b=qw8izary8vUyumjYUZ69d56xtAbiXZLBDWGEWl4y+zjNhqzoBawSOkWH2RkCS/zBo/
         Bfz1tfRoaco8F3fj2xwethRKJXX6lldHrBVQrhosiuIDot7xnnP2MVFvkv1BXXV0/iaV
         QZoh8+OXRuaOyaeXMOY5qDAnoA03qMlCQ6ZHryjykFEtxgvUW95AxwCvl16gCCuOv7Er
         9jJyptyrogyzljm6ymerOPIK9ovsqHyEJSG66NlX+ezLQR2iauyTrinpaIefqiahTuyF
         fqWJYoCX9XFr5gb321bNDUmLFHLhgamBP6Hb7DuAxt+VpsqQUkq7tUS68KCR0PSsoy4e
         UmIQ==
X-Gm-Message-State: AOAM530Dss+1RCP0EutIOF//dsXDliFmPMWuUWyiAmzAzE1ljwscYM8q
	KWHA/8cUg3xGXYJtpbxWJOJCB7zUxkl1P6kHV5c=
X-Google-Smtp-Source: ABdhPJw+RKrsRlaiyPQSStxT3vgDMemQfhWTBTGg7TeaEn8ouyUZq8HU/aIlSougTSacnULiVwaP4w==
X-Received: by 2002:a05:6808:bd6:b0:2da:3794:a1a2 with SMTP id o22-20020a0568080bd600b002da3794a1a2mr724013oik.137.1646853915913;
        Wed, 09 Mar 2022 11:25:15 -0800 (PST)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com. [209.85.167.174])
        by smtp.gmail.com with ESMTPSA id l14-20020a4ac60e000000b002e0e75dcb82sm1370853ooq.12.2022.03.09.11.25.14
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 11:25:14 -0800 (PST)
Received: by mail-oi1-f174.google.com with SMTP id s207so3660539oie.11
        for <regressions@lists.linux.dev>; Wed, 09 Mar 2022 11:25:14 -0800 (PST)
X-Received: by 2002:a05:6808:2209:b0:2d5:1bb4:bb37 with SMTP id
 bd9-20020a056808220900b002d51bb4bb37mr710633oib.53.1646853913865; Wed, 09 Mar
 2022 11:25:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211217165552.746-1-manishc@marvell.com> <ea05bcab-fe72-4bc2-3337-460888b2c44e@molgen.mpg.de>
 <BY3PR18MB46129282EBA1F699583134A4AB0A9@BY3PR18MB4612.namprd18.prod.outlook.com>
 <e884cf16-3f98-e9a7-ce96-9028592246cc@molgen.mpg.de> <BY3PR18MB4612BC158A048053BAC7A30EAB0A9@BY3PR18MB4612.namprd18.prod.outlook.com>
In-Reply-To: <BY3PR18MB4612BC158A048053BAC7A30EAB0A9@BY3PR18MB4612.namprd18.prod.outlook.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Mar 2022 11:24:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjN22EeVLviARu=amf1+422U2iswCC6cz7cN8h+S9=-Jg@mail.gmail.com>
Message-ID: <CAHk-=wjN22EeVLviARu=amf1+422U2iswCC6cz7cN8h+S9=-Jg@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH v2 net-next 1/2] bnx2x: Utilize firmware 7.13.21.0
To: Manish Chopra <manishc@marvell.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, "kuba@kernel.org" <kuba@kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, Ariel Elior <aelior@marvell.com>, 
	Alok Prasad <palok@marvell.com>, Prabhakar Kushwaha <pkushwaha@marvell.com>, 
	"David S. Miller" <davem@davemloft.net>, Greg KH <gregkh@linuxfoundation.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"it+netdev@molgen.mpg.de" <it+netdev@molgen.mpg.de>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 9, 2022 at 11:22 AM Manish Chopra <manishc@marvell.com> wrote:
>
> This move was intentional, as follow up driver flow [bnx2x_compare_fw_ver()] needs to know which exact FW version (newer or older fw version which will be decided at run time now)
> the function is supposed to be run with in order to compare against already loaded FW on the adapter to decide on function probe/init failure (as opposed to earlier where driver was
> always stick to the one specific/fixed firmware version). So for that reason I chose the right place to invoke the bnx2x_init_firmware() during the probe early instead of later stage.

.. but since that fundamentally DOES NOT WORK, we'll clearly have to
revert that change.

Firmware loading cannot happen early in boot. End of story. You need
to delay firmware loading until the device is actually opened.

                                 Linus
