Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3CC1846
	for <regressions@lists.linux.dev>; Fri,  6 Jan 2023 12:05:38 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pDlTc-0001Yv-13; Fri, 06 Jan 2023 13:05:36 +0100
Message-ID: <a6a1c4db-39dd-4ca2-2e48-816bd7876a27@leemhuis.info>
Date: Fri, 6 Jan 2023 13:05:35 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: commit 3497b9a5 (usb: dwc3: add power down scale setting) breaks
 imx8mp
Content-Language: en-US, de-DE
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Li Jun <jun.li@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <5ae757aa-5b0e-be81-e87c-134e2ba5205d@prevas.dk>
From: "Linux kernel regression tracking (#adding)" <regressions@leemhuis.info>
Reply-To: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <5ae757aa-5b0e-be81-e87c-134e2ba5205d@prevas.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1673006738;ce4c7929;
X-HE-SMSGID: 1pDlTc-0001Yv-13

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; all text you find below is based on a few templates
paragraphs you might have encountered already already in similar form.
See link in footer if these mails annoy you.]

On 06.01.23 12:54, Rasmus Villemoes wrote:
> We have an imx8mp board with a lan7801 usb ethernet chip hardwired on
> the PCB, which is used as the host port for a Microchip KSZ9567 switch.
> 
> While trying to update the kernel to 6.1.y, I found something quite
> weird: When the switch was being probed for the second time (the first
> ends with a standard -EPROBE_DEFER), the board would spontaneously reset.
> 
> Now when I disable the switch driver in .config just to see how far I
> could otherwise get, the lan7801 device didn't appear until about 47
> seconds after boot. Bisecting unambiguously points at 3497b9a5, and
> digging in, it's pretty obvious why that is bogus at least for imx8mp.
> 
> The .dtsi file lists IMX8MP_CLK_USB_ROOT as the "suspend" clk, and
> clk_get_rate() of that returns 500000000 ; divided by 16000 that's
> 31250, which certainly doesn't fit in the 13-bit field GCTL_PWRDNSCALE.
> But I assume the .dtsi file is wrong, because imx8mq.dtsi has
> 74bd5951dd3 (arm64: dts: imx8mq: correct usb controller clocks), and it
> seems likely from the commit log of 3497b9a5 that it was at least tested
> on imx8mq.
> 
> Now I have no idea if the right clock for imx8mp is also some 32kHz clk,
> but it would certainly make sense; unlike what the reference manual
> claims, it seems that the reset value of the GCTL register is
> 0x00112004, amounting to a pwrdwnscale value of 0x00100000>>19 == 2 ==
> 32kHz/16kHz, and that could explain why things worked just fine without
> 3497b9a5.
> 
> Li Jun, please either revert 3497b9a5 or figure out if imx8mp.dtsi is
> broken and needs a fix similar to 74bd5951dd3.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 3497b9a5c8c
#regzbot title usb: dwc3: imx8mp broken
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (see page linked in footer for details).

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
