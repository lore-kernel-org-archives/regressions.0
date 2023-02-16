Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C34F6FD3
	for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 14:29:26 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pSfGF-00063v-VU; Thu, 16 Feb 2023 15:29:24 +0100
Message-ID: <a99262c4-6348-0bf5-ac50-1ba4a23f96d7@leemhuis.info>
Date: Thu, 16 Feb 2023 15:29:23 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: commit 3497b9a5 (usb: dwc3: add power down scale setting) breaks
 imx8mp
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Li Jun <jun.li@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Reply-To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <5ae757aa-5b0e-be81-e87c-134e2ba5205d@prevas.dk>
 <a6a1c4db-39dd-4ca2-2e48-816bd7876a27@leemhuis.info>
In-Reply-To: <a6a1c4db-39dd-4ca2-2e48-816bd7876a27@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676557766;5027d473;
X-HE-SMSGID: 1pSfGF-00063v-VU

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 06.01.23 13:05, Linux kernel regression tracking (#adding) wrote:

> On 06.01.23 12:54, Rasmus Villemoes wrote:
>> We have an imx8mp board with a lan7801 usb ethernet chip hardwired on
>> the PCB, which is used as the host port for a Microchip KSZ9567 switch.
>>
>> While trying to update the kernel to 6.1.y, I found something quite
>> weird: When the switch was being probed for the second time (the first
>> ends with a standard -EPROBE_DEFER), the board would spontaneously reset.
> #regzbot ^introduced 3497b9a5c8c
> #regzbot title usb: dwc3: imx8mp broken
> #regzbot ignore-activity

#regzbot fix: 8a1ed98fe0f2e76
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


