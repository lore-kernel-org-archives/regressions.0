Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAE92C80
	for <regressions@lists.linux.dev>; Thu, 11 Nov 2021 06:11:52 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ml3JO-0008LG-9E; Thu, 11 Nov 2021 07:11:50 +0100
Message-ID: <7ac4d8aa-72a5-8155-60e8-4e6f53a90738@leemhuis.info>
Date: Thu, 11 Nov 2021 07:11:49 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-BW
To: Ilya Trukhanov <lahvuun@gmail.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20211110200253.rfudkt3edbd3nsyj@lahvuun>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [REGRESSION]: drivers/firmware: move x86 Generic System
 Framebuffers support
In-Reply-To: <20211110200253.rfudkt3edbd3nsyj@lahvuun>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1636611112;6abad2e8;
X-HE-SMSGID: 1ml3JO-0008LG-9E



On 10.11.21 21:02, Ilya Trukhanov wrote:
> Suspend-to-RAM with elogind under Wayland stopped working in 5.15.
> 
> This occurs with 5.15, 5.15.1 and latest master at
> 89d714ab6043bca7356b5c823f5335f5dce1f930. 5.14 and earlier releases work
> fine.
> 
> git bisect gives d391c58271072d0b0fad93c82018d495b2633448.

Ilya, thx for CCing the regression list. To be sure this issue doesn't
fall through the cracks unnoticed, I'm adding it to regzbot, the Linux
kernel regression tracking bot:

#regzbot ^introduced d391c58271072d0b0fad93c82018d495b2633448
#regzbot title Suspend-to-RAM with elogind under Wayland stopped working
in 5.15.
#regzbot ignore-activity

FYI: I removed everyone else and the other lists from the To or CC to
avoid noise, as this mail is meaningless for them.

Ciao, Thorsten, your Linux kernel regression tracker.

P.S.: If you want to know more about regzbot, check out its
web-interface, the getting start guide, and/or the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

But note, regzbot is doing its first field-testing now and thus still
has some bugs. Adding this regression will help be to find them, hence
feel free to ignore this mail or any errors you spot in the web-ui.
