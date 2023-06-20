Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D7B154B4
	for <regressions@lists.linux.dev>; Tue, 20 Jun 2023 15:34:20 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b4725e9917so41325161fa.2
        for <regressions@lists.linux.dev>; Tue, 20 Jun 2023 08:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687275258; x=1689867258;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G/KBk4MEJMYZgClXUS8ICwIAOz/V2ZoCxcaeujLubZ8=;
        b=XEwC7+ND5zwQ2LAeNDFA9tSf473qVu4kRiNFkwTSZ78Z8fi7a1MitrGcUHVA7piiFJ
         ZK0YdpO1D0qIWmJBUKd+C0TPiCIk1ZDxUqRUGt/ZSReinozj0faLE4L9lagNQKsaLE0h
         9B47vMvqJ7KjpV8BLDdIX3Y+8Nc2KbqAqraX+1/EZyVvLqh7P8lt2z9v34HIr3+096Ft
         fyAO9Nj3ZZxIRQaPIlL0WgOw17fxrBYoOLSxO/+nlrAxLbwniupaaPZujv2eMkhlNsVW
         vzxBD+nRreoMR1SrH0YqON/VYhT4yFHXSpFxfaNLxdZnRNAsSf/SJj9J9/gNRlQ5f6Bj
         b2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687275258; x=1689867258;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/KBk4MEJMYZgClXUS8ICwIAOz/V2ZoCxcaeujLubZ8=;
        b=i1aPbo8CNUtIu3bN0AXIIOEOroTy6o2GBMq/6Qmk14jy1/kYHceS9q3cudflxJ3NIj
         rx5q4zQE7iBcFcuq5heAHEOEGkz/kCLXO0+GutZCdJvF2zI4zev6u9PVbaEA1vmG/Mab
         g9LLpWjnmORV1SNZuY32dZsdH0FzTgTROt7GKpkpk75NW011liSgYR96bHJVCbyHI52z
         mulrQi4kUlgDAmXn8w6zpW/FTMo5uG2DvOzaD8qAP5NTm521fc85uvhQH2WevA0h4Rs0
         ftXVR09bcKJtzPyxC0S1o879WjoXLW12ZGFZnZP47Zji0+f+xmHPU0o40UXxvNKfFO7i
         IUmg==
X-Gm-Message-State: AC+VfDwNc+UluqAUav7L+l2Q/rsHunNxQ5dXn/dMmV/pECi7heDE8G7Z
	hsm/zhyCcGA02+p/IgXURco=
X-Google-Smtp-Source: ACHHUZ7yts7ERKqH2CeYz0vMGC3lU/Ml5zeYPU3j2KIJz+Ew7NtmPYqSfUlZqMiOxe87w/iN5TICjw==
X-Received: by 2002:a2e:9648:0:b0:2b5:7ecc:bb0d with SMTP id z8-20020a2e9648000000b002b57eccbb0dmr1506671ljh.47.1687275257882;
        Tue, 20 Jun 2023 08:34:17 -0700 (PDT)
Received: from osv.localdomain ([89.175.180.246])
        by smtp.gmail.com with ESMTPSA id h9-20020a2e9009000000b002b326e7e76csm453125ljg.64.2023.06.20.08.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:34:17 -0700 (PDT)
From: Sergey Organov <sorganov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,  Stefan
 Wahren <stefan.wahren@i2se.com>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
  Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,  Stefan
 Wahren
 <stefan.wahren@chargebyte.com>,  linux-serial@vger.kernel.org,  Sascha
 Hauer <s.hauer@pengutronix.de>,  NXP Linux Team <linux-imx@nxp.com>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Shawn Guo
 <shawnguo@kernel.org>,  Jiri Slaby <jirislaby@kernel.org>,  Tomasz
 =?utf-8?Q?Mo=C5=84?=
 <tomasz.mon@camlingroup.com>,  Linux ARM
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: Regression: serial: imx: overrun errors on debug UART
References: <20230325151100.mskydt3hwbnspqp4@pengutronix.de>
	<cb16ddb7-f22f-d637-8670-bccc77add0af@i2se.com>
	<87mt3ynsa7.fsf@osv.gnss.ru>
	<d5009984-d2eb-0343-5bb4-df8a7f526121@i2se.com>
	<87sfcy8ncu.fsf@osv.gnss.ru>
	<534ac8db-ae8f-1ea3-9aa9-2105db7f7a52@i2se.com>
	<203ce87f-2898-eb10-2f8c-f237859d75e6@leemhuis.info>
	<87ttw2vnn0.fsf@osv.gnss.ru>
	<d1b6209d-a174-406a-cc81-86b391940c0c@i2se.com>
	<3853881c-976f-dadc-b64b-4ffd8cc88cf0@leemhuis.info>
	<2023062046-jersey-facecloth-7a5d@gregkh>
Date: Tue, 20 Jun 2023 18:34:16 +0300
In-Reply-To: <2023062046-jersey-facecloth-7a5d@gregkh> (Greg Kroah-Hartman's
	message of "Tue, 20 Jun 2023 16:59:18 +0200")
Message-ID: <87r0q6407b.fsf@osv.gnss.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> On Tue, Jun 20, 2023 at 04:47:10PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 24.05.23 15:07, Stefan Wahren wrote:
>> > 
>> > Am 23.05.23 um 21:44 schrieb Sergey Organov:
>> >> "Linux regression tracking (Thorsten Leemhuis)"
>> >> <regressions@leemhuis.info> writes:
>> >>
>> >> Solving this would need to identify the cause of interrupts being
>> >> disabled for prolonged times, and nobody volunteered to investigate this
>> >> further. One suspect, the Linux serial console, has been likely excluded
>> >> already though, as not actually being in use for printk() output.
>> >>
>> > 
>> > I don't think that we can exclude the serial console as a whole, i never
>> > made such a observation. But at least we can exclude kernel logging on
>> > the debug UART.
>> 
>> Stefan, just wondering: was this ever addressed upstream? I assume it's
>> not, just wanted to be sure.
>> 
>> I'm a bit unsure what to do with this and consider asking Greg for
>> advice, as he applied the patch. On one hand it's *IMHO* clearly a
>> regression (but for the record,  some people involved in the discussion
>> claim it's not). OTOH the culprit was applied more than a year ago now,
>> so reverting it might cause more trouble than it's worth at this point,
>> as that could lead to regressions for other users.
>
> I'll be glad to revert this, but for some reason I thought that someone
> was working on a "real fix" here.  Stefan, is that not the case?

As far as I understand, the "real fix" is to be where interrupts are
being disabled for prolonged times in given specific kernel build, and
nobody is looking for that place.

In other words, I'm one who thinks the commit in question is not a
regression per se, so I'm not sure it should be reverted.

Thanks,
Sergey Organov
