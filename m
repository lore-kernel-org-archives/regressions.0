Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A194868
	for <regressions@lists.linux.dev>; Mon, 29 Nov 2021 12:54:41 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mrgB5-0004q6-Tw; Mon, 29 Nov 2021 13:54:39 +0100
Message-ID: <f3626c14-f8fc-7cf2-4114-145b2d93e2a2@leemhuis.info>
Date: Mon, 29 Nov 2021 13:54:39 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [BISECTED REGRESSION] Wireless networking kernel crashes
 #justforregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20211118132556.GD334428@darkstar.musicnaut.iki.fi>
 <3006235f-7682-9109-b6bc-29def21406e3@leemhuis.info>
In-Reply-To: <3006235f-7682-9109-b6bc-29def21406e3@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1638190481;f4813214;
X-HE-SMSGID: 1mrgB5-0004q6-Tw

On 21.11.21 11:14, Thorsten Leemhuis wrote:

> TWIMC: To be sure this issue doesn't fall through the cracks unnoticed,
> I'm adding it to regzbot, my Linux kernel regression tracking bot:
> 
> #regzbot ^introduced 03c3911d2d67a43ad4ffd15b534a5905d6ce5c59
> #regzbot title wireless AP (Raspberry Pi with rt2x00usb) crashes every
> hour or so
> #regzbot ignore-activity

#regzbot fixed-by: 18688c80ad8a8dd50523dc9276e929932cac86d4

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. Many of these mails
contain '#justforregzbot' in the subject, which makes it easy to spot
and filter them.

Ciao, Thorsten, your Linux kernel regression tracker.
