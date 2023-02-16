Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D0033DC
	for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 11:07:05 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pSc6Q-0001JP-TT; Thu, 16 Feb 2023 12:07:02 +0100
Message-ID: <0cd0cf1a-6862-a858-28ed-60112755be42@leemhuis.info>
Date: Thu, 16 Feb 2023 12:07:02 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/2] usb: gadget: u_ether: Do not make UDC parent of the
 net device
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Paul Cercueil <paul@crapouillou.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20221104131031.850850-1-s.hauer@pengutronix.de>
 <20221104131031.850850-2-s.hauer@pengutronix.de>
 <f2a4f9847617a0929d62025748384092e5f35cce.camel@crapouillou.net>
 <1d2c42f7-5cc9-17a6-dbe6-1c599428831b@leemhuis.info>
In-Reply-To: <1d2c42f7-5cc9-17a6-dbe6-1c599428831b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676545625;42b590d6;
X-HE-SMSGID: 1pSc6Q-0001JP-TT

[TLDR: This mail in primarily relevant for Linux regression tracking. A
change or fix related to the regression discussed in this thread was
posted or applied, but it did not use a Link: tag to point to the
report, as Linus and the documentation call for. Things happen, no
worries -- but now the regression tracking bot needs to be told manually
about the fix. See link in footer if these mails annoy you.]

On 03.02.23 13:46, Linux kernel regression tracking (#adding) wrote:
> On 01.02.23 14:32, Paul Cercueil wrote:
>> Hi Sascha, Greg,
>>
>> I have a breakage in 6.2-rc* that I eventually bisected to this commit,
>> on a Ingenic SoC (using the jz4740 musb driver) with ECM or RNDIS
>> configured through gadgetfs.
>>
>> When plugging the board to my PC, the USB network interface is
>> recognized, but 'ip link' sees it as 'NO-CARRIER'. With this commit
>> reverted on v6.2-rc5, everything works fine.
> 
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
> 
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced 321b59870f850
> #regzbot title usb: gadget: USB network interface is recognized, but 'ip
> link' sees it as 'NO-CARRIER'
> #regzbot ignore-activity

#regzbot fix: bb07bd68fa0983e3915
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

#regzbot ignore-activity

