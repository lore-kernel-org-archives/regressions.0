Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826FB63CE
	for <regressions@lists.linux.dev>; Thu,  5 Jan 2023 12:21:40 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pDPFZ-0000SS-Aa; Thu, 05 Jan 2023 13:21:37 +0100
Message-ID: <24ef21b2-d1db-1525-7d3f-2c978e73c25b@leemhuis.info>
Date: Thu, 5 Jan 2023 13:21:35 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [BUG] 6.2-rc1 spi-mt65xx broken on mt7986
To: Ricardo Ribalda <ribalda@chromium.org>
References: <trinity-bd6bf7f8-5dbc-42fc-891b-8bfc802a1a2c-1672136902605@3c-app-gmx-bap27>
Content-Language: en-US, de-DE
Cc: Frank Wunderlich <frank-w@public-files.de>,
 linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Brown <broonie@kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
In-Reply-To: <trinity-bd6bf7f8-5dbc-42fc-891b-8bfc802a1a2c-1672136902605@3c-app-gmx-bap27>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672921300;c630e468;
X-HE-SMSGID: 1pDPFZ-0000SS-Aa

[CCing the regression mailing list, as it should be in the loop:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

On 27.12.22 11:28, Frank Wunderlich wrote:
> Hi,
> 
> the following commit breaks SPIM-NOR on mt7986:
> 
> c6f7874687f7 2022-11-28 spi: mediatek: Enable irq when pdata is ready

Ricardo, do you have this report on your radar? Just wondering, as it
was posted a week ago and didn't even get a single reply afaics. This of
course can happen at this time of the year, but I thought a quick status
inquiry wouldn't hurt.

>> [    2.145931] pc : mtk_spi_can_dma+0x0/0x34
>> [    2.155212] lr : mtk_spi_interrupt+0x74/0x360
>>
>> [    2.091801] mtk-spi 1100a000.spi: spi-mem transfer timeout
>> [    2.097310] spi-nor: probe of spi0.0 failed with error -110
>> [    2.102930] Unable to handle kernel read from unreadable memory at virtual address 0000000000000010
> 
> after reverting the commit, no trace happens and nor is recognized on my board

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke
