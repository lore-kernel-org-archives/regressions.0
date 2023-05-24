Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6386084C
	for <regressions@lists.linux.dev>; Wed, 24 May 2023 13:07:52 +0000 (UTC)
Received: from [192.168.1.141] ([37.4.248.58]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M6lUk-1q2Mhy1jMU-008Ntb; Wed, 24 May 2023 15:07:28 +0200
Message-ID: <d1b6209d-a174-406a-cc81-86b391940c0c@i2se.com>
Date: Wed, 24 May 2023 15:07:26 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Regression: serial: imx: overrun errors on debug UART
To: Sergey Organov <sorganov@gmail.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Stefan Wahren <stefan.wahren@chargebyte.com>, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 =?UTF-8?Q?Tomasz_Mo=c5=84?= <tomasz.mon@camlingroup.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
References: <2c29454b-9369-4360-8eb4-c151f59460cb@i2se.com>
 <d660e3cf-5686-d989-3b59-efe83ec9d590@linux.intel.com>
 <CAOMZO5A+GujiQY-UT3Q-8o0AKujJb_4kY+5L4x1e07ovGfo31w@mail.gmail.com>
 <9e22f237-f3ee-0415-9e6b-89a137769b8f@i2se.com>
 <5d59dec6-9f6f-7b20-1221-f57c94b29cca@i2se.com>
 <20230325151100.mskydt3hwbnspqp4@pengutronix.de>
 <cb16ddb7-f22f-d637-8670-bccc77add0af@i2se.com> <87mt3ynsa7.fsf@osv.gnss.ru>
 <d5009984-d2eb-0343-5bb4-df8a7f526121@i2se.com> <87sfcy8ncu.fsf@osv.gnss.ru>
 <534ac8db-ae8f-1ea3-9aa9-2105db7f7a52@i2se.com>
 <203ce87f-2898-eb10-2f8c-f237859d75e6@leemhuis.info>
 <87ttw2vnn0.fsf@osv.gnss.ru>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <87ttw2vnn0.fsf@osv.gnss.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:N0dJId55/pLvRxTdMF8vMQANbrm4jDPmy3Y+2f82DdyNSgA9WEA
 V19vafEw+q8H8lMFLXyTIg/o7GtqHbwIjw+I1RMQ6Hg0JWuS2fdvQwMYMBr++omOVvK2ju6
 KX12X0MxEbQMcoqDamVg8pULwWryDN6XQkBqFW05uRWqIctYbZPqvxFtJP92ygwATZVFb41
 LQg5TpR+TXF7viTRObnGw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hEss6wdf+bU=;tJjsYPCAgWWUl8pjmlavUmdIKRh
 scquokCrq+w43r8CJ4KsIDGdoLx476mjMT8LIg31cwi23cWXAJg/Xo6qu/EOFXGnX453IMpZv
 KBboaOPnSaeTFx1cR955IEXTkxfuUv2PYXXZCoqSSw41WYjuFcm6yCFrjbLDGPEppgYVxX83p
 5cLgRgiMNKhih6xHAku4Wp1xALwHJ4fKWglmhlltnci1x36CNrt4tELgXvh6cbHvcJo3PdPw1
 VZ+oMng95TB/7WymisiCAjjVYeEck/cnRisgerB2u8bDZESxfKZvTHuXduqXjBNuXYUBczhTF
 jwIsI533IXWas3gyEJjHglLzhrPjuXOSr5kKjIDrG/9pOfGTafrvE5rswOM7pfDNq2vlyUq7m
 em/ITH3oQMGe6iPy2L7LA8td2yu0cSMpijqUp/ePpRldD0nQIufSQ4cTDBGgYCLX3xU9ggkYn
 82q2RIF14yBgQsXjccMdz+0buU6WxzQXM+KLIA714MAuukMJHhngYgrjGSDs6Ec7K7wlQ+18A
 iTTifSBmpXC2e+kO24MZAhtcrzWBmKJLTpk96u2xMGe6BSEDbc8bH9/DlY1P1PfdmKd7SsKi0
 nysUr/dTa6HHM6yT0Eo00zV9JtigZkraLwY26y4gfzxsd05uNTGxCPV3EDvqHEy4TRwXf4WRw
 rqCl1nv2cjoWmnZRAzcrQqqR31Tpwvt9D2kNrnvZTg==

Hi Sergey,

Am 23.05.23 um 21:44 schrieb Sergey Organov:
> "Linux regression tracking (Thorsten Leemhuis)"
> <regressions@leemhuis.info> writes:
> 
...
> 
> Solving this would need to identify the cause of interrupts being
> disabled for prolonged times, and nobody volunteered to investigate this
> further. One suspect, the Linux serial console, has been likely excluded
> already though, as not actually being in use for printk() output.
> 

I don't think that we can exclude the serial console as a whole, i never 
made such a observation. But at least we can exclude kernel logging on 
the debug UART.

Best regards
