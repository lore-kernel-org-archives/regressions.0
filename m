Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A268E7B
	for <regressions@lists.linux.dev>; Thu, 31 Mar 2022 06:51:57 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nZoeu-00019N-LQ; Thu, 31 Mar 2022 08:51:53 +0200
Message-ID: <9e3c47e0-6807-081d-feb7-ed7c5fe1d1f1@leemhuis.info>
Date: Thu, 31 Mar 2022 08:51:51 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: regressions@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
References: <1648659326.eabkokyuym.none.ref@localhost>
 <1648659326.eabkokyuym.none@localhost>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: "dma-mapping: remove CONFIG_DMA_REMAP" causes AMD SME boot fail
In-Reply-To: <1648659326.eabkokyuym.none@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1648709517;23acf2d0;
X-HE-SMSGID: 1nZoeu-00019N-LQ

[TLDR: I'm adding the regression report below to regzbot, the Linux
kernel regression tracking bot; all text you find below is compiled from
a few templates paragraphs you might have encountered already already
from similar mails.]

Hi, this is your Linux kernel regression tracker. Sending this just to
the lists, as it's already handled.

On 30.03.22 19:51, Alex Xu (Hello71) wrote:
> 
> After a recent kernel update, booting one of my machines causes it to 
> hang on a black screen. Pressing Lock keys on the USB keyboard does not 
> turn on the indicators, and the machine does not appear on the Ethernet 
> network. I don't have a serial port on this machine. I didn't try 
> netconsole, but I suspect it won't work.
> 
> Setting mem_encrypt=0 seems to resolve the issue. Reverting f5ff79fddf0e 
> ("dma-mapping: remove CONFIG_DMA_REMAP") also appears to resolve the 
> issue.
> 
> The machine in question has an AMD Ryzen 5 1600 and ASRock B450 Pro4.

To be sure below issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced f5ff79fddf0e
#regzbot title dma: "dma-mapping: remove CONFIG_DMA_REMAP" causes AMD
SME boot fail
#regzbot ignore-activity

If it turns out this isn't a regression, free free to remove it from the
tracking by sending a reply to this thread containing a paragraph like
"#regzbot invalid: reason why this is invalid" (without the quotes).

Ciao, Thorsten
