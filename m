Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C075210EE
	for <regressions@lists.linux.dev>; Tue, 25 Jul 2023 00:14:38 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b9d80e33fbso28057285ad.0
        for <regressions@lists.linux.dev>; Mon, 24 Jul 2023 17:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690244078; x=1690848878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4CckHXTR2oTwWrbjeu6pJlCDtPBaFMqvBE18C7STfqU=;
        b=lN1xNoTZXCMBpicnSJL5Un1oNhkTziTlyyH5n9SFM3rVpf4GJ7XA0CSjoS7+HbhobB
         AO8QYTSwP7y55NP/nzetAhkD1nqdJDzvViTSfi0Rg3FCncnadyKjt4Ou2F3Dmqk6Px3K
         DQvI8r7HT/fUqqCD1mycqIn0cuyF2Pdnm93tjEDt3QGHoGp2/TyypBpX8hbsi9lhn9d8
         FrQmk6aZJuJLZy/7UARSxXSUfFtJnR053VZQfYfNCaKI7F9gJ4FovKHuy8e8RDVk+qo6
         kCp37A5seS9r1wa+J5nd/u4M2gz0ntcDSzDY9OavYEpQ+IYF3IV0e6mhCAFnrRyVs7nu
         l8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690244078; x=1690848878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CckHXTR2oTwWrbjeu6pJlCDtPBaFMqvBE18C7STfqU=;
        b=HqumDehd+hd5ny3hY19qjmPf1S0mZ4Tyl4yqG0f4KgaEu0Do1gXUBuw1DCZCEchNuH
         nuhbtccB7A0bnaxMmN7YOe7pZCtzkwMovwGRe4L+92ZUl/WywAaidKGAzjqkFkeBiFrX
         xveyXn0fpLp/hAkvp/k7GmlfeD8bUkFTmopHTN/deuPAIOftQVzbHUYCVSlpc8LMbYrM
         WnD9VqN9yTpjosv+lpsSPokdecg6QLcGt5r4IKN1tYLFepjKKiv1ts044ta2OOu51fVE
         S1J9ACkwKIDnsDfA6eNr1YDw8hJmgbLXphjDwng7St+bZNOt6/UiNAIviGOUupAufvQK
         wDnA==
X-Gm-Message-State: ABy/qLb6BrFk3/+1LD6AmE7mbFEeAIXelZtnv5aY3tDJQ+z/tnYpVA7L
	3Tk/RqyIx//LH0fPR1ko5owW0apIN9A=
X-Google-Smtp-Source: APBJJlHWAw1bYCjH+wGqKMn15WdxUnuXM/WDoBGN0PpuHzpmKiJBF3pNopEgRUoH4e+a39kvGPq7fw==
X-Received: by 2002:a17:902:db0f:b0:1bb:b2f7:e058 with SMTP id m15-20020a170902db0f00b001bbb2f7e058mr2253939plx.52.1690244077769;
        Mon, 24 Jul 2023 17:14:37 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9d8f:da31:e274:eeb5])
        by smtp.gmail.com with ESMTPSA id c9-20020a170902c1c900b001bb8be10a84sm5135174plc.304.2023.07.24.17.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 17:14:37 -0700 (PDT)
Date: Mon, 24 Jul 2023 17:14:34 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>,
	Verot <verot.wrongdoer713@simplelogin.com>,
	Linux Input Devices <linux-input@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Stable <stable@vger.kernel.org>
Subject: Re: Fwd: Kernel 6.4.4 breaks Elan Touchpad 1206
Message-ID: <ZL8T6ptGgYdF3D96@google.com>
References: <42bc8e02-5ee0-f1c8-610e-e16391e54ee2@gmail.com>
 <ZL8S2/Ujprk4KgzT@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZL8S2/Ujprk4KgzT@google.com>

On Mon, Jul 24, 2023 at 05:10:03PM -0700, Dmitry Torokhov wrote:
> On Tue, Jul 25, 2023 at 07:00:21AM +0700, Bagas Sanjaya wrote:
> > Hi,
> > 
> > I notice a regression report on Bugzilla [1]. Quoting from it:
> > 
> > > Description:
> > > When booting into Linux 6.4.4, system no longer recognizes touchpad input (confirmed with xinput). On the lts release, 6.1.39, the input is still recognized.
> > > 
> > > Additional info:
> > > * package version(s): Linux 6.4.4, 6.1.39
> > > * Device: ELAN1206:00 04F3:30F1 Touchpad
> > > 
> > > Steps to reproduce:
> > > - Install 6.4.4 with Elan Touchpad 1206
> > > - Reboot
> > > 
> > > The issue might be related to bisected commit id: 7b63a88bb62ba2ddf5fcd956be85fe46624628b9
> > > This is the only recent commit related to Elantech drivers I've noticed that may have broken the input.
> > 
> > See Bugzilla for the full thread:
> > 
> > To the reporter (Verot): Can you attach dmesg and lspci output?
> > 
> > Anyway, I'm adding this regression to be tracked by regzbot:
> > 
> > #regzbot introduced: 7b63a88bb62ba2 https://bugzilla.kernel.org/show_bug.cgi?id=217701
> > #regzbot title: OOB protocol access fix breaks Elan Touchpad 1206
> 
> Please don't as ELAN1206:00 04F3:30F1 looks like I2C-HID and not PS/2
> device that 7b63a88bb62ba2 would affect.

Also 7b63a88bb62ba2 is present in 6.1 since v6.1.34.

Thanks.

-- 
Dmitry
