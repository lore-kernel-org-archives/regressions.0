Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A5C7A
	for <regressions@lists.linux.dev>; Fri, 22 Apr 2022 14:17:40 +0000 (UTC)
Received: from [2a02:8108:963f:de38:6624:6d8d:f790:d5c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nhu6L-0002zq-Hd; Fri, 22 Apr 2022 16:17:37 +0200
Message-ID: <e4c9bb60-210d-243a-e225-6b3546c0b42b@leemhuis.info>
Date: Fri, 22 Apr 2022 16:17:36 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: Shreeya Patel <shreeya.patel@collabora.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 Mario Limonciello <mario.limonciello@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <s5ha6cdtglj.wl-tiwai@suse.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [REGRESSION] Missing IRQ via amd_gpio
In-Reply-To: <s5ha6cdtglj.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1650637060;6d48f13c;
X-HE-SMSGID: 1nhu6L-0002zq-Hd

Hi Takashi! Thx for CCing the regression list.

On 22.04.22 15:03, Takashi Iwai wrote:
> Hi,
> 
> we received a bug report for 5.17.3 kernel showing a new error:
> 
>  amd_gpio AMDI0030:00: Failed to translate GPIO pin 0x003D to IRQ, err -517
> 
> Not only an error message but in practice this leads to a missing IRQ
> assignment; the IRQ 27 is no longer assigned to amd_gpio driver.
> 
> As the error number (EPROBE_DEFER) indicates, this seems to be the
> side-effect of the recent fix, the upstream commit 5467801f1fcb
> ("gpio: Restrict usage of GPIO chip irq members before
> initialization").  As far as I understand, the problem is in
> acpi_gpiochip_request_interrupts() call that is called from
> gpiochip_add_irqchip() itself.  Since it's called before the
> initialized flag set, it always fails now.
> 
> Below is a temporary quick fix and it seems working.  But I'm not sure
> whether I overlooked something obvious...

A patch that afaics will fix this hopefully should get merged really
soon now:

https://lore.kernel.org/all/20220422131452.20757-1-mario.limonciello@amd.com/

See also v1:

https://lore.kernel.org/all/20220414025705.598-1-mario.limonciello@amd.com/

Ciao, Thorsten
