Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18582F36
	for <regressions@lists.linux.dev>; Wed,  8 Jun 2022 11:29:08 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nytrw-00084G-Jd; Wed, 08 Jun 2022 13:29:00 +0200
Message-ID: <ff1e3d4b-c69e-1dcf-fc37-bbd8cd35b605@leemhuis.info>
Date: Wed, 8 Jun 2022 13:28:59 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [REGRESSION] gpio: omap: ensure irq is enabled before wakeup
 #forregzbot
Content-Language: en-US
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CY1PR07MB2700E81609B0967127D0773381DF9@CY1PR07MB2700.namprd07.prod.outlook.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CY1PR07MB2700E81609B0967127D0773381DF9@CY1PR07MB2700.namprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1654687749;6b2e8eae;
X-HE-SMSGID: 1nytrw-00084G-Jd

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

Hi, this is your Linux kernel regression tracker.

On 01.06.22 17:56, Eric Schikschneit wrote:
> Summary: OMAP patch causes SPI bus transaction failure on TI CPU
> Commit: c859e0d479b3b4f6132fc12637c51e01492f31f6
> Kernel version: 5.10.87
> 
> 
> The detailed description:
> 
> 
> I know this is a old commit at this point, but we have observed a regression caused by this commit. It causes improper toggle during a SPI transaction with a microcontroller. The CPU in use is Texas Instruments AM3352BZCZA80. The microcontroller in use is a PIC based micro. I have logic capture images available to show the signal difference that is causing confusion on the SPI bus.
> 

To be sure below issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced c859e0d479b3b4f6132fc12637c51e01492f31f6
#regzbot title gpio: improper toggle during a SPI transaction with a
microcontroller
#regzbot ignore-activity
#regzbot back-burner: author of the commit can't help anymore

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
