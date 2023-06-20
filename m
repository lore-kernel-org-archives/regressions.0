Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45631DCC0
	for <regressions@lists.linux.dev>; Tue, 20 Jun 2023 16:30:38 +0000 (UTC)
Received: from [192.168.1.141] ([37.4.248.63]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mv3I0-1ptqNK0mzw-00r2Uk; Tue, 20 Jun 2023 18:30:06 +0200
Message-ID: <ce8ab025-cdc9-b3fc-7628-0ea2018d4561@i2se.com>
Date: Tue, 20 Jun 2023 18:30:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Regression: serial: imx: overrun errors on debug UART
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Sergey Organov <sorganov@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Stefan Wahren <stefan.wahren@chargebyte.com>, linux-serial@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 =?UTF-8?Q?Tomasz_Mo=c5=84?= <tomasz.mon@camlingroup.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20230325151100.mskydt3hwbnspqp4@pengutronix.de>
 <cb16ddb7-f22f-d637-8670-bccc77add0af@i2se.com> <87mt3ynsa7.fsf@osv.gnss.ru>
 <d5009984-d2eb-0343-5bb4-df8a7f526121@i2se.com> <87sfcy8ncu.fsf@osv.gnss.ru>
 <534ac8db-ae8f-1ea3-9aa9-2105db7f7a52@i2se.com>
 <203ce87f-2898-eb10-2f8c-f237859d75e6@leemhuis.info>
 <87ttw2vnn0.fsf@osv.gnss.ru> <d1b6209d-a174-406a-cc81-86b391940c0c@i2se.com>
 <3853881c-976f-dadc-b64b-4ffd8cc88cf0@leemhuis.info>
 <2023062046-jersey-facecloth-7a5d@gregkh>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <2023062046-jersey-facecloth-7a5d@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Hvg1nnR0gyMueJiif3E6u1lqHozMUmRuFvcyxVqpIgO5/1Nb8pt
 OCkvLOL6vuotxFRGWzrjdjpQfdZKf6rqPjaQHy7wBn6Aq35wObVlER9YchE3/UCwtAYID2h
 z7RivhmDWvhwV4MdpBnLLgDOh7y2foHhtLVd3saNe1vYUbqpwuH8brvS6PvDJkDoZNYj4LW
 Nr/yM20REJIhwK0ziYyMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0GnIusRd9Pk=;OPzcghOhIT8qyY4MRPPDcyAXP+1
 ftv6dqweybgaevjzmJlb0nosgVvDJ2e32bxcQkcOA3ds+m17LR8I5vFz6eSi5DUh3ibHZHP3U
 C8BqfUnuhGSgD0ssfq9oJU7SeeWJ1m8cl4JfiFBVZesWWqUMNE1H0RPheQLgbR6n3GbWL5yqs
 PbaZ9M98X3RWR8vQE//RVjQnPxk+n3tPL0xz3PrAKbl1gQ9fCqSz4+SlhlIEW884IJDKKjS8V
 KR7bucRiE3/kKppm0NxY8Oi7xrrPqWLX/dW9PmTUQQVub1w6ackHIEXytGeVpfluLvbiS4GiT
 4093G7M8ztKg2K0HuPrl07uZKJyu0A51izW4+IYwjj1oYVjvtYpPgLjykj3MFmWf6xdg+OtGW
 eARrYQxggpr4Zl4NMhtbKLs5kKJVvOMVfNAsQs5+lMamszGbo+6PLBNzvWLqH9W1ZXBLmcZtG
 kx8nOmYLv22CVRpVqcHw7KGOIqwqXSPbQ05OkNpX/4HCZtqUhKUngPbjUlgIGQZtG+jy1ceS9
 T1U9oymOl7seSakuCLr7CCc3Pi5C/h+u+/zMNu7V5bMOsecH9v/z7YY095ZSQhfoX5N++YFfp
 fApE/hpj8qaVZ5oLR/gixcCfyi1tok9ZVfjdypy6R4R8sTX/n/UcN7OUXQtPBBHaRCxyL7F+z
 GN0p83XUAQw2ngfJ74DbDo7INGrQ2mrJ6pzMkLgsAQ==

Hi Greg,

Am 20.06.23 um 16:59 schrieb Greg Kroah-Hartman:
> On Tue, Jun 20, 2023 at 04:47:10PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 24.05.23 15:07, Stefan Wahren wrote:
>>>
>>> Am 23.05.23 um 21:44 schrieb Sergey Organov:
>>>> "Linux regression tracking (Thorsten Leemhuis)"
>>>> <regressions@leemhuis.info> writes:
>>>>
>>>> Solving this would need to identify the cause of interrupts being
>>>> disabled for prolonged times, and nobody volunteered to investigate this
>>>> further. One suspect, the Linux serial console, has been likely excluded
>>>> already though, as not actually being in use for printk() output.
>>>>
>>>
>>> I don't think that we can exclude the serial console as a whole, i never
>>> made such a observation. But at least we can exclude kernel logging on
>>> the debug UART.
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

i can only repeat the statements from 23.5.:

Unfortunately my time budget to investigate this issue further is 
exhausted, so i stopped working at this.

In case someone can give clear instructions to investigate this further, 
i will try to look at it in my spare time. But i cannot make any promises.

I'm not aware that some else is working on this.

Best regards

> 
> thanks,
> 
> greg k-h
