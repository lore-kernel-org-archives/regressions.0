Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8131A29CA
	for <regressions@lists.linux.dev>; Wed, 26 Jan 2022 12:54:18 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nChoP-00078s-Gs; Wed, 26 Jan 2022 13:54:09 +0100
Message-ID: <1aed666b-e812-91be-f412-af073b1a320b@leemhuis.info>
Date: Wed, 26 Jan 2022 13:54:08 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] usb: gadget: atmel: Revert regression in USB Gadget
 (atmel_usba_udc)
Content-Language: en-BS
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>,
 regressions@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel@lists.infradead.org,
 Cristian Birsan <cristian.birsan@microchip.com>, linux-usb@vger.kernel.org,
 Felipe Balbi <balbi@kernel.org>, Jonas Bonn <jonas@norrbonn.se>
References: <20211211183650.12183-1-marcelo.jimenez@gmail.com>
 <3bb113cd-fbf6-6898-6ae3-2f8cb8c64992@leemhuis.info>
 <YfE8nyH1lW/I8NTV@kroah.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <YfE8nyH1lW/I8NTV@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1643201658;cc0ed34a;
X-HE-SMSGID: 1nChoP-00078s-Gs

On 26.01.22 13:20, Greg Kroah-Hartman wrote:
> On Sun, Dec 12, 2021 at 10:48:14AM +0100, Thorsten Leemhuis wrote:
>> [TLDR: adding this regression to regzbot; most of this mail is compiled
>> from a few templates paragraphs some of you might have seen already.]
>>
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> Top-posting for once, to make this easy accessible to everyone.
>>
>> Thanks for the report. BTW, if anyone like me wonders what the included
>> patch is about: it afaics is the revert of the patch causing the
>> problem. Anyway:
>>
>> To be sure this issue doesn't fall through the cracks unnoticed, I'm
>> adding it to regzbot, my Linux kernel regression tracking bot:
>>
>> #regzbot ^introduced 70a7f8be8598
>> #regzbot title usb: gadget: atmel: ethernet over USB Gadget not
>> recognized anymore after disconnect and reconnect
>> #regzbot ignore-activity
> 
> How do I say "this isn't a regression, it's a broken board
> configuration" and get regzbot to stop tracking this?

Like this:

#regzbot invalid: not a regression, it's a broken board configuration

And it's hereby done. :-D

TWIMC, this documents explains all regzbot commands:
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

Ciao, Thorsten

