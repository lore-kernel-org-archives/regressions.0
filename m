Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F9B2C81
	for <regressions@lists.linux.dev>; Sun, 21 Nov 2021 10:14:12 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mojrM-0000nz-FK; Sun, 21 Nov 2021 11:14:08 +0100
Message-ID: <3006235f-7682-9109-b6bc-29def21406e3@leemhuis.info>
Date: Sun, 21 Nov 2021 11:14:08 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [BISECTED REGRESSION] Wireless networking kernel crashes
Content-Language: en-BS
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Johannes Berg <johannes.berg@intel.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20211118132556.GD334428@darkstar.musicnaut.iki.fi>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20211118132556.GD334428@darkstar.musicnaut.iki.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1637489653;87d790cd;
X-HE-SMSGID: 1mojrM-0000nz-FK

Hi, this is your Linux kernel regression tracker speaking.

CCing regression mailing list, which should be in the loop for all
regressions, as explained here:
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html

On 18.11.21 14:25, Aaro Koskinen wrote:
>
> I have tried to upgrade my wireless AP (Raspberry Pi with rt2x00usb)
> from v5.9 to the current mainline, but now it keeps crashing every hour
> or so, basically making my wireless network unusable.
> 
> I have bisected this to:
> 
> commit 03c3911d2d67a43ad4ffd15b534a5905d6ce5c59
> Author: Ryder Lee <ryder.lee@mediatek.com>
> Date:   Thu Jun 17 18:31:12 2021 +0200

TWIMC: To be sure this issue doesn't fall through the cracks unnoticed,
I'm adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced 03c3911d2d67a43ad4ffd15b534a5905d6ce5c59
#regzbot title wireless AP (Raspberry Pi with rt2x00usb) crashes every
hour or so
#regzbot ignore-activity

Ciao, Thorsten, your Linux kernel regression tracker.


P.S.: If you want to know more about regzbot, check out its
web-interface, the getting start guide, and/or the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

The last two documents will explain how you can interact with regzbot
yourself if your want to.

Hint for the reporter: when reporting a regression it's in your interest
to tell #regzbot about it in the report, as that will ensure the
regression gets on the radar of regzbot and the regression tracker.
That's in your interest, as they will make sure the report won't fall
through the cracks unnoticed.

Hint for developers: you normally don't need to care about regzbot, just
fix the issue as you normally would. Just remember to include a 'Link:'
tag to the report in the commit message, as explained in
Documentation/process/submitting-patches.rst
That aspect was recently was made more explicit in commit 1f57bd42b77c:
https://git.kernel.org/linus/1f57bd42b77c
