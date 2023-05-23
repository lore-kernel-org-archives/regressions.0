Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055341F934
	for <regressions@lists.linux.dev>; Tue, 23 May 2023 19:44:23 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4ec8eca56cfso362556e87.0
        for <regressions@lists.linux.dev>; Tue, 23 May 2023 12:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684871062; x=1687463062;
        h=mime-version:user-agent:message-id:date:references:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Mfj/60mjyD73Y0fwFda1Tha6oubsygP6ts2VrhNkbc=;
        b=mYOikAlfCj8worvBWIhVLd6IXm/AHFx9xelX9M0uFZAKcUGtiVvLjoTagbJOS0MGTv
         b4KiXjOhYsZHxLGcUDg54qZrfuRgAvTmcj7aC2/C3lZVJKzwfewXBs/9StTWrd5wVMI9
         Isy6lf4/KTrF4cz6DTCJ/p73/mVMGf9CehVA493Ao+jKUU46V2rK/MDi0zQRlIwAS9QW
         9Jo81+hXYHPm7Tqxw7R9292qmhpuYi1LBE0HgDWIzbITFu4K5wF8rZoktD3f9taX90iu
         VqP1qSrwLPxobYOuQy2k+yAFmedLdmWjcZbX+TGopoanGfiSYMl6n8bbfr4y5hrbkK3w
         lgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684871062; x=1687463062;
        h=mime-version:user-agent:message-id:date:references:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Mfj/60mjyD73Y0fwFda1Tha6oubsygP6ts2VrhNkbc=;
        b=IjnWLR92ciDcVidCeGD017tuWaXy4EoLHIo8nXW0ODaj8ufHFS9Yk/fv+uUxVKswDR
         W19stm7Ka7lvq7J7yA/NdqXe/ZAc4eU9m5IV4Q/DZ0GWHnzIxkcmwdYYa2BPh7sa6F0w
         /S6wQNoUGokvjLu6ZRdFNoJ23Lfzt+h778Wgora2VvZbfSf8+kX1ClUGwbV5q65P8RP3
         ykZpCLHy5FQKtUMqLfRFrr9bIIVTV6EDh4iJ6Vhj2kfC0R+zJLLAPr+jfCiGHTLT2dPd
         zh3ZMvBkxAFISETCRv142cVbNq3UdDdb06Jf9HiDnSFnRFORA+H1Nrp7/Lcy/BNbREuv
         Wnmg==
X-Gm-Message-State: AC+VfDwAlMH5el1HN2pik8NdmwAn7L1JK8WvreubQ4oAyYdTTo4dJqbb
	OkA7MuxQgHcI/t/V5OPOiec=
X-Google-Smtp-Source: ACHHUZ5MPAkzkzsCp7ND/Vdo4WvJjlw8QV8CUBLYf0Th5rgBo7prOVhC6h9KOFMXYft75h0WgClnlw==
X-Received: by 2002:ac2:532b:0:b0:4f3:895f:f3f8 with SMTP id f11-20020ac2532b000000b004f3895ff3f8mr4455650lfh.16.1684871061529;
        Tue, 23 May 2023 12:44:21 -0700 (PDT)
Received: from osv.localdomain ([89.175.180.246])
        by smtp.gmail.com with ESMTPSA id t15-20020ac243af000000b004f121c8beddsm1445346lfl.124.2023.05.23.12.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 12:44:20 -0700 (PDT)
From: Sergey Organov <sorganov@gmail.com>
To: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,  Linux regressions mailing list
 <regressions@lists.linux.dev>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
  Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,  Stefan
 Wahren
 <stefan.wahren@chargebyte.com>,  linux-serial@vger.kernel.org,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  NXP Linux Team <linux-imx@nxp.com>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Shawn Guo
 <shawnguo@kernel.org>,  Jiri Slaby <jirislaby@kernel.org>,  Tomasz
 =?utf-8?Q?Mo=C5=84?=
 <tomasz.mon@camlingroup.com>,  Linux ARM
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: Regression: serial: imx: overrun errors on debug UART
References: <2c29454b-9369-4360-8eb4-c151f59460cb@i2se.com>
	<d660e3cf-5686-d989-3b59-efe83ec9d590@linux.intel.com>
	<CAOMZO5A+GujiQY-UT3Q-8o0AKujJb_4kY+5L4x1e07ovGfo31w@mail.gmail.com>
	<9e22f237-f3ee-0415-9e6b-89a137769b8f@i2se.com>
	<5d59dec6-9f6f-7b20-1221-f57c94b29cca@i2se.com>
	<20230325151100.mskydt3hwbnspqp4@pengutronix.de>
	<cb16ddb7-f22f-d637-8670-bccc77add0af@i2se.com>
	<87mt3ynsa7.fsf@osv.gnss.ru>
	<d5009984-d2eb-0343-5bb4-df8a7f526121@i2se.com>
	<87sfcy8ncu.fsf@osv.gnss.ru>
	<534ac8db-ae8f-1ea3-9aa9-2105db7f7a52@i2se.com>
	<203ce87f-2898-eb10-2f8c-f237859d75e6@leemhuis.info>
Date: Tue, 23 May 2023 22:44:19 +0300
Message-ID: <87ttw2vnn0.fsf@osv.gnss.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Linux regression tracking (Thorsten Leemhuis)"
<regressions@leemhuis.info> writes:

> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> for once, to make this easily accessible to everyone.
>
> Stefan, was this regression ever solved? It doesn't look like it, but
> maybe I'm missing something.
>
> If it wasn't solved: what needs to be done to get this rolling again?

Hi Thorsten,

Not Stefan, but as far as I can tell, the problem is that on Stefan's
build the kernel has rather large periods of interrupts being disabled,
so any attempt to decrease IRQs frequency from UART by raising FIFO IRQ
threshold causes "regression" that manifests itself as missing
characters on receive. I'm not sure if it's tuning FIFO level that is in
fact a regression in this case.

Solving this would need to identify the cause of interrupts being
disabled for prolonged times, and nobody volunteered to investigate this
further. One suspect, the Linux serial console, has been likely excluded
already though, as not actually being in use for printk() output.

-- 
Sergey Organov
