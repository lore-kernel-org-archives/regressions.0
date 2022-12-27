Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B1323AF
	for <regressions@lists.linux.dev>; Tue, 27 Dec 2022 14:29:52 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pAAxi-0003rR-3J; Tue, 27 Dec 2022 15:29:50 +0100
Message-ID: <b76fca16-9a7a-e8a7-6d4a-36fd88ea15ac@leemhuis.info>
Date: Tue, 27 Dec 2022 15:29:49 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [BUG] 6.2-rc1 spi-mt65xx broken on mt7986 #forregzbot
Content-Language: en-US, de-DE
To: linux-mediatek@lists.infradead.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <trinity-bd6bf7f8-5dbc-42fc-891b-8bfc802a1a2c-1672136902605@3c-app-gmx-bap27>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <trinity-bd6bf7f8-5dbc-42fc-891b-8bfc802a1a2c-1672136902605@3c-app-gmx-bap27>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672151392;cb02a5ba;
X-HE-SMSGID: 1pAAxi-0003rR-3J

[Note: this mail contains only information for Linux kernel regression
tracking. Mails like these contain '#forregzbot' in the subject to make
then easy to spot and filter out. The author also tried to remove most
or all individuals from the list of recipients to spare them the hassle.]

On 27.12.22 11:28, Frank Wunderlich wrote:
> Hi,
> 
> the following commit breaks SPIM-NOR on mt7986:
> 
> c6f7874687f7 2022-11-28 spi: mediatek: Enable irq when pdata is ready
> 
>> [    2.145931] pc : mtk_spi_can_dma+0x0/0x34
>> [    2.155212] lr : mtk_spi_interrupt+0x74/0x360
>>
>> [    2.091801] mtk-spi 1100a000.spi: spi-mem transfer timeout
>> [    2.097310] spi-nor: probe of spi0.0 failed with error -110
>> [    2.102930] Unable to handle kernel read from unreadable memory at virtual address 0000000000000010
> 
> after reverting the commit, no trace happens and nor is recognized on my board
> 

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced c6f7874687f7
#regzbot title spi: spi-mt65xx broken on mt7986
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
